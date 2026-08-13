# Roadmap dich Sango II -> Tieng Viet (khong dau)

## Phase 0 - Co so

- [x] Tool trich xuat text (`tools/extract_san2.py`)
- [x] Scaffold repo + AGENTS.md + HUONG-DAN-VIET-TAT
- [ ] Tool build patch nguoc vao SAN2.EXE (`tools/build_patch.py`)
- [ ] Font Latin: mo rong FONT16.PAT / FONT24.PAT cho a-z
- [ ] Script test nhanh trong DOSBox

## Phase 1 - Ten tuong / vat pham (~900 chuoi)

- [ ] `name.json` - ten quan, tuong, vat pham (160/620 done - batch 1-2)
- [ ] Thong nhat bang ten trong HUONG-DAN-VIET-TAT

## Phase 2 - Menu / UI (~700 chuoi)

- [ ] `menu.json` - lenh noi chinh, quan su, ngoai giao

## Phase 3 - Mo ta / lich su (~170 chuoi)

- [ ] `bio.json` - tieu su quan chu, mo ta tinh huong

## Phase 4 - Hoi thoai tu van (~650 chuoi)

- [ ] `dialogue.json` - loi khuyen cua tu van

## Phase 5 - Misc

- [ ] `misc.json` - chuoi con lai trong EXE

## Quy trinh Cursor Cloud

1. Tao Cloud Agent tu repo GitHub
2. Prompt: "Dich translations/extracted/name.json batch tiep theo"
3. Agent dich 50-100 dong, commit + push
4. Lap lai moi session cho den het file

## Uoc luong

| Phase | Chuoi | Ghi chu |
|-------|-------|---------|
| 0 | - | 1-2 tuan (font + patch tool) |
| 1 | ~900 | 2 tuan |
| 2 | ~700 | 1-2 tuan |
| 3 | ~170 | 1 tuan |
| 4 | ~650 | 1 thang |
| **Tong** | **~1722** | Lam dan qua Cloud Agent |

**Ket luan: Kha thi — text nam trong SAN2.EXE (Big5), cung workflow REKO-VN/GSE-VN.**
