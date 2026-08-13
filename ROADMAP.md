# Roadmap dich Sango II -> Tieng Viet (khong dau)

## Phase 0 - Co so

- [x] Tool trich xuat text (`tools/extract_san2.py`)
- [x] Scaffold repo + AGENTS.md + HUONG-DAN-VIET-TAT
- [x] Tool ho tro dich (`tools/apply_*_translations.py`)
- [x] Tool build patch nguoc vao SAN2.EXE (`tools/build_patch.py`) — can EXE local de test
- [ ] Font Latin: mo rong FONT16.PAT / FONT24.PAT cho a-z
- [ ] Script test nhanh trong DOSBox

## Phase 1 - Ten tuong / vat pham (~620 chuoi)

- [x] `name.json` - 620/620 done
- [x] Thong nhat bang ten trong HUONG-DAN-VIET-TAT

## Phase 2 - Menu / UI (~202 chuoi)

- [x] `menu.json` - 202/202 done (chu yeu ten tu 字)

## Phase 3 - Mo ta / lich su (~144 chuoi)

- [x] `bio.json` - 144/144 done

## Phase 4 - Hoi thoai tu van (~556 chuoi)

- [x] `dialogue.json` - 556/556 done

## Phase 5 - Misc

- [x] `misc.json` - 200/200 done

## Tien do tong

| File | Chuoi | Trang thai |
|------|-------|------------|
| name.json | 620 | done |
| menu.json | 202 | done |
| bio.json | 144 | done |
| dialogue.json | 556 | done |
| misc.json | 200 | done |
| **Tong** | **1722** | **100% dich** |

Ghi chu: ~200 entry danh dau UNK do loi extract Big5 — can xem lai khi build patch.

## Buoc tiep theo

1. `build_patch.py` — ghi abbrev vao SAN2.EXE
2. Font Latin cho a-z
3. Test trong DOSBox
4. Sua lai entry UNK neu can

## Quy trinh Cursor Cloud

1. Tao Cloud Agent tu repo GitHub
2. Prompt: "Dich translations/extracted/name.json batch tiep theo"
3. Agent dich 50-100 dong, commit + push
4. Lap lai moi session cho den het file

**Ket luan: Phase dich JSON hoan thanh — san sang build patch.**
