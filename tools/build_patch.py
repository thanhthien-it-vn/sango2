#!/usr/bin/env python3
"""Ghi ban dich ASCII (abbrev) nguoc vao SAN2.EXE."""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

DEFAULT_EXE = Path(r"D:\Game\Sango2\Installed\SANGO2\SAN2.EXE")
DEFAULT_JSON_DIR = Path("translations/extracted")
ASCII_RE = re.compile(r"^[a-zA-Z0-9. ]+$")


def load_entries(json_dir: Path) -> list[dict]:
    entries: list[dict] = []
    for path in sorted(json_dir.glob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        if isinstance(data, list):
            entries.extend(data)
    return entries


def validate_entry(entry: dict) -> str | None:
    if entry.get("status") != "done":
        return "not done"
    abbrev = entry.get("abbrev", "")
    if not abbrev:
        return "empty abbrev"
    if abbrev == "UNK":
        return "UNK skip"
    if not ASCII_RE.match(abbrev):
        return f"non-ascii: {abbrev!r}"
    if len(abbrev) > entry["ascii_max"]:
        return f"too long: {len(abbrev)} > {entry['ascii_max']}"
    return None


def patch_exe(
    data: bytearray | None, entries: list[dict], *, dry_run: bool
) -> dict[str, int]:
    stats = {"patched": 0, "skipped": 0, "errors": 0}
    errors: list[str] = []

    for entry in entries:
        reason = validate_entry(entry)
        if reason:
            stats["skipped"] += 1
            continue

        if dry_run or data is None:
            stats["patched"] += 1
            continue

        offset = entry["offset"]
        abbrev = entry["abbrev"]
        budget = entry["ascii_max"]
        raw = abbrev.encode("ascii")

        if offset + budget > len(data):
            errors.append(f"{entry['id']}: offset out of range")
            stats["errors"] += 1
            continue

        patch = raw + b"\x00" * (budget - len(raw))
        data[offset : offset + budget] = patch
        stats["patched"] += 1

    if errors:
        for e in errors[:20]:
            print(f"ERROR: {e}")
        if len(errors) > 20:
            print(f"... and {len(errors) - 20} more errors")

    return stats


def main() -> None:
    parser = argparse.ArgumentParser(description="Patch SAN2.EXE with Vietnamese abbrev strings")
    parser.add_argument("exe", nargs="?", default=str(DEFAULT_EXE), help="Duong dan SAN2.EXE goc")
    parser.add_argument(
        "-j",
        "--json-dir",
        default=str(DEFAULT_JSON_DIR),
        help="Thu muc JSON da dich",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="SAN2-VN.EXE",
        help="File EXE output (khong commit)",
    )
    parser.add_argument("--dry-run", action="store_true", help="Chi thong ke, khong ghi file")
    args = parser.parse_args()

    exe_path = Path(args.exe)
    json_dir = Path(args.json_dir)

    if not json_dir.exists():
        raise SystemExit(f"Khong tim thay: {json_dir}")

    entries = load_entries(json_dir)
    done = [e for e in entries if e.get("status") == "done"]
    print(f"Loaded {len(entries)} entries ({len(done)} done)")

    if args.dry_run:
        stats = patch_exe(None, entries, dry_run=True)
    else:
        if not exe_path.exists():
            raise SystemExit(f"Khong tim thay EXE: {exe_path}")
        data = bytearray(exe_path.read_bytes())
        stats = patch_exe(data, entries, dry_run=False)
        out = Path(args.output)
        out.write_bytes(data)
        print(f"Wrote: {out}")

    print(
        f"Patched: {stats['patched']} | "
        f"Skipped: {stats['skipped']} | "
        f"Errors: {stats['errors']}"
    )


if __name__ == "__main__":
    main()
