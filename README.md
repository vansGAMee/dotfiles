<img width="1920" height="1080" alt="2026-05-16_11-43-43" src="https://github.com/user-attachments/assets/2d9dc403-acae-497c-8642-5ece40138f40" />



# Полный гайд по переносу системы
> Arch Linux / CachyOS + Hyprland + Silent SDDM

---

## Что сохранено в репо github.com/voxelpy/dotfiles

| Что | Где в репо |
|-----|-----------|
| Hyprland конфиг | `dot_config/hypr/` |
| Waybar | `dot_config/waybar/` |
| Wofi | `dot_config/wofi/` |
| Kitty | `dot_config/kitty/` |
| Nvim | `dot_config/nvim/` |
| Swaync | `dot_config/swaync/` |
| Waypaper | `dot_config/waypaper/` |
| Личные скрипты | `dot_local/bin/` |
| Silent SDDM тема | `sddm-theme-silent/` |
| SDDM конфиг | `sddm.conf` |
| SDDM Hyprland конфиг | `hyprland-sddm.conf` |
| Аватарка | `ivan.face.icon` |
| Все pacman пакеты | `pkglist.txt` |
| Все AUR пакеты | `aurlist.txt` |

---

## Одна команда для установки

### На своём ПК (Arch) или CachyOS:
```bash
bash <(curl -s https://raw.githubusercontent.com/voxelpy/dotfiles/main/install.sh)
```

### На ноуте (CachyOS) — то же самое, но потом поменяй монитор:
```bash
bash <(curl -s https://raw.githubusercontent.com/voxelpy/dotfiles/main/install.sh)
# После установки:
sed -i 's/HDMI-A-1/eDP-1/' ~/.config/hypr/hyprland.conf
```

---

## Что делает скрипт по шагам

1. Устанавливает `git`, `chezmoi`, `yay`
2. Скачивает все конфиги через chezmoi
3. Устанавливает все pacman пакеты из `pkglist.txt`
4. Устанавливает все AUR пакеты из `aurlist.txt`
5. Копирует Silent тему в `/usr/share/sddm/themes/`
6. Копирует `sddm.conf` в `/etc/`
7. Копирует `hyprland-sddm.conf` в `/etc/hypr/`
8. Копирует аватарку в `/usr/share/sddm/faces/`
9. Включает SDDM как дисплей менеджер
10. Создаёт папку для скриншотов

---

## После установки — что поменять на ноуте

```bash
# Монитор
nvim ~/.config/hypr/hyprland.conf
# Найди: HDMI-A-1,1920x1080@144
# Замени на: eDP-1,1920x1080@60

# Убери ненужное из автостарта (опционально)
# Закомментируй строки с AmneziaVPN, antimicrox, steam
```

---

## Если что-то пошло не так

**Не запускается SDDM:**
```bash
sudo systemctl status sddm
journalctl -u sddm -n 50
```

**Waybar не отображается:**
```bash
waybar &
```

**Нет звука:**
```bash
pgrep swayosd-server || swayosd-server &
```

**Обои не восстановились:**
```bash
waypaper --restore
```

**Шрифт RedHatDisplay не установился (SDDM выглядит не так):**
```bash
yay -S ttf-red-hat-fonts
```
