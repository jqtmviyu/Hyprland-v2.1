# 帮助文档和常见问题

* [hyprland 官方wiki](https://wiki.hyprland.org/)
* [该安装脚本原作者仓库](https://github.com/JaKooLit/Hyprland-v2.1)
* [gtk主题下载](https://www.xfce-look.org/browse/)
* [可以在wayland原生渲染的软件](https://arewewaylandyet.com/)

## 预设快捷键

* Super + shift + / : 弹窗, 你可以选择后快速查看快捷键等设置文件
* Super + enter : foot 终端
* Super + d : wofi 应用选择
* Super + t : Thunar 文件管理器
* Prtsc : 区域截图, 需要点下载图标才会保存在`~/Pictures/Screenshots/`
* Super + Prtsc : 窗口截图
* Super + alt + Prtsc : 全屏截图
* Super + v : 剪切板管理器
* Super + shift + q : 杀死当前进程
* Super + b : 关闭状态栏
* Super + space : 平铺/浮动模式切换
* Super + shift + space : 窗口对调
* Super + tab : 上一个工作区间 
* Super + F : 全屏
* Super + L : 锁屏
* Super + N : 上一个窗口
* Super + shift + N : 下一个窗口
* Super + v : 窗口浮动并居中
* Super + space : 窗口取消浮动
------
* Super + h/j/k/l : 在窗口中移动焦点
* Super + shift + h/j/k/l : 移动窗口位置
* Super + ctrl + h/j/k/l : 调整窗口大小
------
* Super + 1/2/3 : 切换工作区
* Super + shift + 1/2/3 : 发送到工作区
* Super + ctrl + 1/2/3 : 发送到工作区并聚焦
------
* Super + shift + u : 发送到特殊工作区
* Super + u : 打开特殊工作区

## 常见问题

* `hyprland` 设置目录在`~/.config/hypr/
* 查看是否使用`wayland`渲染: `hyprctl clients`

### 没有声音

```sh
# 查看声卡信息
aplay -l
# 设置默认声卡
# 用户级别
vim ~/.asoundrc
===
defaults.pcm.card 1
defaults.pcm.device 0
defaults.ctl.card 1
===
# `pcm`选项决定用来播放音频的设备，而`ctl`选项决定哪个声卡能够由控制工具

# 系统级别
vim /etc/asound.conf

# 默认情况下，ALSA 将所有通道静音，所有这些都需要手动取消静音
alsamixer
# 显示mm是被静音的, 选中后使用按键m取消
# 还可以使用 amixer 来完成
amixer set Master unmute

# 可能还需要重启
```

### chrome不支持中文输入

`chrome://flags`

`Preferred Ozone platform` 设置为 `Wayland` 后重启

*提示框错位暂时未解决*

### firefox

添加环境变量

```sh
sudo vim /etc/environment
===
MOZ_ENABLE_WAYLAND=1
===
```

## 常见软件

### 中文输入法

* 安装fcitx5-rime

```sh
yay -S fcitx5 fcitx5-gtk fcitx5-qt fcitx5-rime  fcitx5-configtool 
```

部署文件目录 `~/.local/share/fcitx5/rime`

* (可选)[主题安装](https://github.com/hosxy/Fcitx5-Material-Color)

`yay -S fcitx5-material-color`

### 按键映射

`yay -S keyd-git`

以`capslock+h/j/k/l` 映射为方向键为例

```sh
# 添加自启动
sudo systemctl enable keyd

# 添加配置, 把 capslock + hjkl 映射到 vim 移动模式
# ctrl 和 alt 对调
sudo vim /etc/keyd/default.conf

===
[ids]

*

[main]
capslock = overload(capslock_layer, esc)
alt = layer(control)
control = layer(alt)

[capslock_layer]
esc = capslock

h = left
j = down
k = up
l = right

u = pageup
p = pagedown
i = home
o = end

m = backspace
===

# 启动
sudo systemctl start keyd
```

### 替换grub为system-boot

参考: https://wiki.archlinux.org/title/systemd-boot

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