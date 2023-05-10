# Arch Linux

## Installation

先做好启动盘，开机从USB启动

```sh
timedatectl set-ntp true
```

partition disk

```fdisk -l```

/dev/sda 232.89G, Samsung SSD

/dev/sdb 1.8T

/dev/sdc 128G, USB flash drive


```cfdisk /dev/sda```

RAM: 32G

/dev/sda1 /boot 200MB (efi_sys_partition /mnt/boot)

/dev/sda2 swap 32G (swap_partition)

/dev/sda3 / 200G (root_partition /mnt)

```
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
```

```
vim /etc/pacman.d/mirrorlist
添加Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
pacstrap /mnt base base-devel linux linux-firmware
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -S dhclient dhcpcd
```
Settings
```
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock —systohc

vim /etc/locale.gen
uncomment en_US.UTF-8 and zh_CN.UTF-8
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo arch > /etc/hostname
```
Grub
```
mkinitcpio -p linux
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

passwd # enter password two times
exit
umount /mnt/boot
umount /mnt
reboot
```

## AUR

32-bit support & archlinuxcn
```
vim /etc/pacman.conf
uncomment two lines of the [multilib] section
add the lines below:
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch
Server = https://repo.huaweicloud.com/archlinuxcn/$arch

sudo pacman -S archlinuxcn-keyring
sudo pacman -Sy yay yaourt
```
## Software

rxvt-unicode tmux zsh zsh-completions oh-my-zsh powerlevel10k neofetch xcompmgr

xorg xorg-xinit i3-wm lxdm dmenu pcmanfm network-manager-applet pa-applet

vim emacs git python python-pip miniconda texlive-{most, langchinese} mariadb matlab

evince poppler-data wps-office thunderbird mutt

feh imagemagick vlc netease-cloud-music

chromium google-chrome

conky albert dunst redshift compton nitrogen ntft-3g proxychains-ng

input methods:
```
sudo pacman -S fcitx fcitx-configtool fcitx-googlepinyin
vim ~/.xinitrc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &
```

fonts:
```
wqy-microhei wqy-zenhei
adobe-source-han-serif-cn-fonts
adobe-source-code-pro-fonts
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
font-awesome
ttf-meslo-nerd-font-powerlevel10k
```

Other:
```
yay -S deepin.com.wechat2
```

## VPN

- [linkhub](https://linkhub.mobi/)
- [ssrdog](https://ssrdog111.com/#/)
- [一元机场](https://一元机场.com/)
- [maoxiong](https://linxing.maoxiong.cloud/)


```
yay -S clash-for-windows-bin
sudo vim /etc/environment
add contents below:
http_proxy=http://127.0.0.1:7890/
https_proxy=http://127.0.0.1:7890/
ftp_proxy=http://127.0.0.1:7890/
HTTP_PROXY=http://127.0.0.1:7890/
HTTPS_PROXY=https://127.0.0.1:7890/
FTP_PROXY=http://127.0.0.1:7890/
```

## Nvidia Graphics Drivers, Cuda, Cudnn

yay -S nvidia nvidia-settings lib32-nvidia-utils

## Settings

systemctl enable bluetooth.service

systemctl enable/start sshd.service

systemctl enable/start lxdm.service

## system time

```timedatectl set-ntp true``` should be okay

```sh
sudo ntpd -qg
# method 1
# method 2
sudo ntpdate ntp.ubuntu.com
# sync system time with network time
timedatectl set-ntp true
# check status
timedatectl status
```
