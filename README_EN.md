<br>
<h3 align = "center"> Arch Hyprland Configuration Files and Installation Scripts</h3>
<br>

[中文说明](README.md)

**[Thanks to the original author JaKooLit !!](https://github.com/jqtmviyu/Hyprland-v2.1/tree/personal)**

> For use after minimal Arch installation  
> Recommend using `system-boot` instead of `grub`  
> Errors are normal as Hyprland updates frequently. Please check the wiki often.

## ✨ Differences from the original:

**Minor adjustments to better suit personal preferences**

1. Added Chinese README
1. Added clipboard manager
1. Modified area screenshot script
1. Kept only black and white macOS themes
1. Removed ASUS driver parts from installation script
1. Removed unwanted layouts
1. Modified shortcuts

## Core Components:

- Wayland Compositor: [`Hyprland`](https://github.com/hyprwm/Hyprland)
 
- Terminal: [`Foot`](https://github.com/r-c-f/foot)
 
- Status Bar: [`Waybar`](https://github.com/Alexays/Waybar)
 
- Launcher: [`Wofi`](https://hg.sr.ht/~scoopta/wofi)

- File Manager: [`Thunar`](https://docs.xfce.org/xfce/thunar/start)

## Screenshots:

![light-mode](/static/screenshots/light-mode.png)

![dark-mode](/static/screenshots/dark-mode.png)

![sddm](/static/screenshots/sddm.jpg)

## Themes:
-  Window: `mojave-gtk-theme-git`
-  Cursor: `mcmojave-cursors-git`
-  Icons: `mcmojave-circle-icon-theme-git`
-  Login Screen: macOS-like

## Default Installation:
- `foot`: Lightweight terminal
- `wofi`: Application launcher
- `swaybg`: Wallpaper
- `swwww`: Dynamic wallpaper (supports webp/gif, not mp4)
- `nwg-look-bin`: GTK3 settings editor
- `hyprlock`: Screen locker
- `wlroots`: Wayland compositor library
- `wlogout`: Logout menu
- `hyprpolkitagent`: Authentication agent
- `mako`: Notifications
- `grim` `slurp`: Screenshots
- `swappy`: Screenshot editor
- `wl-clipboard` `clipse`: Clipboard management
- `brightnessctl`: Laptop brightness control (not needed for desktop)
- `mpv`: Video player
- `ristretto`: Image viewer
- `pamixer`: CLI volume control
- `playerctl`: Music control keybindings
- `xorg-xwayland`: X11 app compatibility
- `JetBrainsMono Nerd Font`: Status bar icon font
- `nerd-fonts-sarasa-term`: CJK monospace font with icons
- `mcmojave-cursors` `mojave-gtk-theme-git`: GTK themes
- `pipewire` `pipewire-pulse` `pipewire-alsa` `wireplumber` `pavucontrol`: Audio related
- `xdg-user-dirs`: Create common user directories
- `btop`: Process viewer
- `network-manager-applet`: Network management
- `qt5ct`: Qt5 configuration tool
- `gvfs`: Virtual filesystem
- `gvfs-mtp`: Phone MTP connection
- `ffmpegthumbs`: Decoder
- `curl`: Used by weather script
- `jq`: JSON processor
- `gtk4`: Chrome/Chromium CJK input compatibility
- `hypridle`: Idle manager (e.g., screen lock/presentation mode on idle)
- `checkupdates-with-aur`: Status bar update checker

## Optional Installation:

- `yay` / `paru`: One is required
- `hyprland`: 
    - Without NVIDIA: `hyprland`
    - With NVIDIA (unstable, check wiki): `hyprland-nvidia-git` `nvidia-dkms` `nvidia-settings` `nvidia-utils` `libva` `libva-nvidia-driver-git`
- `thunar` `thunar-volman` `tumbler` `thunar-archive-plugin` `xarchiver`: File manager
- `bluez` `bluez-utils` `blueman`: Bluetooth
- `sddm`: Display manager, using modified version of `nautik1/sddm-theme-catppuccin-macchiato`
- `xdg-desktop-portal-hyprland`: Required for OBS screen recording and screen sharing

## Manual Installation Required:

- `cronie`: Cron job support
- `mcmojave-circle-icon-theme-git`: Manual installation recommended due to slow installation

## ✨ NVIDIA-Hyprland Notes:
- Many variables are added but disabled in `~/.config/hypr/configs/exec.conf` for `OBS` recording compatibility. Please experiment.
- Read [Hyprland-Wiki](https://wiki.hyprland.org/) for more help.

## ✨ Additional Notes: 
- Keyboard layout (`kb_layout`) is set in `~/.config/hypr/hyprland.conf`, configurable during installation script (e.g., `us` for US layout)
- For French keyboards, check this [issue](https://github.com/swaywm/sway/issues/1460?fbclid=IwAR1C8VcY_wWbGhXvT-5ApjJCQuJoJzhOVor6o5fdn0Nj1c6bD9JXoQAPQIg)
