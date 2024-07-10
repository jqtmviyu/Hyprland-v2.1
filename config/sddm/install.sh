#/bin/sh
yay -S --noconfirm sddm-git
sudo mkdir -p /ssdm-macos /usr/share/sddm/themes
sudo cp -a ./ssdm-macos /usr/share/sddm/themes/
sudo mkir -p /etc/sddm.conf.d
sudo cp ./10-theme.conf /etc/sddm.conf.d/
sudo systemctl restart sddm
