<br>
<h3 align = "center"> Arch Hyprland Dotfiles and Script Installer </h3>
<br>

[Chinese Readme](README.md)|[cheatsheet](docs/cheatsheet_en.md) | [Github Repo](https://github.com/jqtmviyu/Hyprland-v2.1/tree/personal)


**Thanks to the original author JaKooLit !!**
If you are interested, join [DC](https://discord.gg/V2SJ92vbEN)

> Applicable to arch minimum implementation after installation

## ✨ Differences:

**Almost nothing**, just more suitable for myself.

1. Chinese README
1. Add a clipboard manager
1. Change the area screenshot script
1. Using macos themes (work in progress ...)
1. Delete the Asus driver installation part
1. Delete the layout I don't like and adjust the dark/light style.
1. Modify shortcut keys

## Important components:

- Wayland compositor: [`Hyprland`](https://github.com/hyprwm/Hyprland)
 
- Terminal: [`Foot`](https://github.com/r-c-f/foot)
 
- Status bar: [`Waybar`](https://github.com/Alexays/Waybar)
 
- Application launcher : [`Wofi`](https://hg.sr.ht/~scoopta/wofi)

- FIle Manager(Optional): [`Thunar`](https://docs.xfce.org/xfce/thunar/start)

## Screenshots:

![systeminfo](/static/screenshots/systeminfo.png)

![light-mode](/static/screenshots/light-mode.png)

![dark-mode](/static/screenshots/dark-mode.png)

## Themes:
-  gtk theme: `mojave-gtk-theme-git`
-  cursor: `mcmojave-cursors-git`
-  icons: `mcmojave-circle-icon-theme-git`

## Default installation:
- `foot` `wofi`
- `swaybg`: Wallpaper
- `swwww`: Dynamic wallpaper
- `nwg-look-bin`:  GTK3 Settings Editor(eg:Theme Settings)
- `swaylock-effects`: Screen Lock
- `wlroots`: Wayland compositor library
- `wlogout`: Logout menu
- `cava`: Audio Visualization
- `polkit-kde-agent`: Polkit authentication UI for Plasma
- `mako`: notifications
- `grim` `slurp`: Screenshot
- `swappy`: Screenshot Editor
- `wl-clipboard` `cliphist`: Clipboard Management
- `brightnessctl`: brightness control for laptop(Desktop computers do not require)
- `mpv`: Video Player
- `ristretto`: Image View
- `pamixer`: Command line volume control
- `playerctl`: Command line playback control
- `xorg-xwayland`: Compatible with x11 applications
- `JetBrainsMono Nerd Font`: Status bar icon font
- `nerd-fonts-sarasa-term`: Chinese fonts support(you can delete it from install.sh)
- `pipewire` `pipewire-pulse` `pipewire-alsa` `wireplumber` `pavucontrol`: Audio related
- `xdg-user-dirs`: Create common user folders
- `btop`: Resources monitor
- `network-manager-applet`: Network manager
- `qt5ct`: Qt5 Configuration tools
- `gvfs`: Virtual filesystem
- `gvfs-mtp`: Mobile phone mtp connection
- `ffmpegthumbs`: FFmpeg-based thumbnail creator for video files
- `curl`: Support for `weather.sh`
- `jq`: Command-line JSON processor
- `gtk4`: Support for Chinese input method on chrome/chromium 

## Optional installation:

- `yay` / `paru`: Must have one
- `hyprland`: 
    - Nvidia Graphics card detected: `hyprland`
    - if not(Unstable, it is recommended to check the wiki): `hyprland-nvidia-git` `nvidia-dkms` `nvidia-settings` `nvidia-utils` `libva` `libva-nvidia-driver-git`
- `waybar`: if `waybar` has been installed, You can choose not
- `mojave-gtk-theme-git` `mcmojave-circle-icon-theme-git` `mcmojave-cursors-git`: Gtk theme
- `thunar` `thunar-volman` `tumbler` `thunar-archive-plugin` `xarchiver`: File manager
- `bluez` `bluez-utils` `blueman`: Blue tooth
- `sddm-git` `sddm-catppuccin-git`: Login manager and theme
- `xdg-desktop-portal-hyprland`: Screenshot and screen sharing needs(eg:obs)

## Self-installation:

- `swayidle`: Idle manager(eg: Lock screen/demonstration mode when entering the idle state)
- `checkupdates-with-aur`: Status bar check update module
- `cronie`: Timed task support

## ✨ Arch linux installation tutorial:
- Chinese: https://arch.icekylin.online/
- if use `system-boot` replace `grub`: https://wiki.archlinux.org/title/systemd-boot

```sh
sudo bootctl --path=/boot install
sudo mkdir -p /boot/loader/entries
sudo vim /boot/loader/entries/arch.conf
===
title          Arch Linux
linux          /vmlinuz-linux
initrd         /intel-ucode.img
initrd         /initramfs-linux.img
options        root=LABEL=myArch rw rootflags=subvol=/@
===

yay -S systemd-boot-pacman-hook # Automatic update

sudo vim /boot/loader/loader.conf
===
default  arch.conf
timeout 0
editor   no
===
```

- When mounting `btrfs`, you can choose to force compression `compress-force=zstd`


## ✨ NVIDIA-Hyprland :
- To ensure proper recording with OBS, several variables have been added to `~/.config/hypr/configs/exec.conf`, but they have not been enabled. Please try enabling them and testing again.
- You can also read the link for more assistance and information.[Hyprland-Wiki](https://wiki.hyprland.org/)

## ✨ Others: 
- Keyboard layout setting on `~/.config/hypr/hyprland.conf`, It can be set when the installation script is running, like American layout:`us`
- If it's a French keyboard, check this.[issue](https://github.com/swaywm/sway/issues/1460?fbclid=IwAR1C8VcY_wWbGhXvT-5ApjJCQuJoJzhOVor6o5fdn0Nj1c6bD9JXoQAPQIg)

### ✨ known-issues:
- [ ] SDDM theme has not been changed to mac style
- [ ] fractional scaling breaks swww
- [ ] cava module cannot work in the status bar
