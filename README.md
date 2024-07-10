<br>
<h3 align = "center"> Arch Hyprland 配置文件和安装脚本</h3>
<br>

[English Readme](README_EN.md) | [指南](docs/cheatsheet.md) | [Github Repo](https://github.com/jqtmviyu/Hyprland-v2.1/tree/personal)

**感谢原作者JaKooLit !!**
感兴趣可以加[DC](https://discord.gg/V2SJ92vbEN), 原作者一直在更新中

> 适用arch最小安装后执行

## ✨ 相对原版的区别:

**几乎没有**, 只是改得更适合自己

1. 中文 README
1. 添加剪切板管理器
1. 更改区域截图脚本
1. 使用macos主题 (进行中...)
1. 删掉安装脚本中华硕驱动安装部分
1. 删掉不喜欢的布局,调整dark/light样式
1. 修改快捷键

## 重要组件:

- Wayland合成器: [`Hyprland`](https://github.com/hyprwm/Hyprland)
 
- 终端: [`Foot`](https://github.com/r-c-f/foot)
 
- 状态栏: [`Waybar`](https://github.com/Alexays/Waybar)
 
- 启动器 : [`Wofi`](https://hg.sr.ht/~scoopta/wofi)

- 文件管理器(可选): [`Thunar`](https://docs.xfce.org/xfce/thunar/start)

## 展示:

![systeminfo](/static/screenshots/systeminfo.png)

![light-mode](/static/screenshots/light-mode.png)

![dark-mode](/static/screenshots/dark-mode.png)

## 主题:
-  窗口: `mojave-gtk-theme-git`
-  鼠标: `mcmojave-cursors-git`
-  图标: `mcmojave-circle-icon-theme-git`

## 默认安装:
- `foot` `wofi`
- `swaybg`: 壁纸
- `swwww`: 动态壁纸(支持webp gif,不支持mp4)
- `nwg-look-bin`:  GTK3 设置编辑器(eg:主题设置)
- `swaylock-effects`: 屏幕锁定
- `wlroots`: Wayland合成器库
- `wlogout`: 注销菜单
- `cava`: 音频可视化
- `polkit-kde-agent`: 身份验证
- `mako`: 通知
- `grim` `slurp`: 截图
- `swappy`: 截图处理
- `wl-clipboard` `cliphist`: 剪切板管理
- `brightnessctl`: 笔记本亮度控制(台式不需要)
- `mpv`: 视频播放
- `ristretto`: 图片查看
- `pamixer`: 命令行音量控制
- `playerctl`: 命令行播放控制
- `xorg-xwayland`: 兼容x11应用
- `JetBrainsMono Nerd Font`: 状态栏图标字体
- `nerd-fonts-sarasa-term`: 中英文字体带图标, 等距更纱黑体
- `pipewire` `pipewire-pulse` `pipewire-alsa` `wireplumber` `pavucontrol`: 音频相关
- `xdg-user-dirs`: 创建常见用户文件夹
- `btop`: 进程查看
- `network-manager-applet`: 网络管理
- `qt5ct`: Qt5 配置工具
- `gvfs`: 虚拟文件系统
- `gvfs-mtp`: 手机mtp连接
- `ffmpegthumbs`: 解码
- `curl`: 天气脚本使用
- `jq`: JSON 处理
- `gtk4`: 兼容chrome/chromium中文输入

## 可选安装:

- `yay` / `paru`: 必须有其一
- `hyprland`: 
    - 没有检测到N卡: `hyprland`
    - 检测到N卡(不稳定, 建议查看wiki): `hyprland-nvidia-git` `nvidia-dkms` `nvidia-settings` `nvidia-utils` `libva` `libva-nvidia-driver-git`
- `waybar`: 已安装`waybar`可选择不安装,不再需要`waybar-hyprland-git`
- `mojave-gtk-theme-git` `mcmojave-circle-icon-theme-git` `mcmojave-cursors-git`: gtk主题
- `thunar` `thunar-volman` `tumbler` `thunar-archive-plugin` `xarchiver`: 文件管理器
- `bluez` `bluez-utils` `blueman`: 蓝牙
- `sddm-git`: 登录器, 主题使用`nautik1/sddm-theme-catppuccin-macchiato`修改版
- `xdg-desktop-portal-hyprland`: 截图和屏幕共享需要

## 自行安装:

- `swayidle`: 空闲管理器(eg: 进入空闲状态时锁定屏幕/演示模式)
- `checkupdates-with-aur`: 状态栏检查更新模块
- `cronie`: 定时任务支持

## ✨ Arch Linux 安装教程:
- 中文教程: https://arch.icekylin.online/
- 如果想用`system-boot`替换`grub`: https://wiki.archlinux.org/title/systemd-boot

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

yay -S systemd-boot-pacman-hook # 自动更新

sudo vim /boot/loader/loader.conf
===
default  arch.conf
timeout 0
editor   no
===
```

- 挂载`btrfs`时可选择强制压缩`compress-force=zstd`



## ✨ NVIDIA-Hyprland 相关:
- 为了使`OBS`正常录制, 在`~/.config/hypr/configs/exec.conf`添加了许多变量但并未启用, 请多尝试.
- 也可以阅读 [Hyprland-Wiki](https://wiki.hyprland.org/) 获取更多帮助.

## ✨ 其他: 
- 键盘布局(`kb_layout`)在`~/.config/hypr/hyprland.conf`中使用, 在安装脚本运行时可设置, 例如美式布局:`us`
- 如果是法语键盘, 查看这个[issue](https://github.com/swaywm/sway/issues/1460?fbclid=IwAR1C8VcY_wWbGhXvT-5ApjJCQuJoJzhOVor6o5fdn0Nj1c6bD9JXoQAPQIg)

### ✨ 已知问题:
- [x] SDDM 主题未更改成mac样式
- [ ] fractional scaling breaks swww
- [ ] cava 模块无法在状态栏工作
