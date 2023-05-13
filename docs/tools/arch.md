# Arch Linux

## Installation

First, create an Arch Linux installer USB drive, refer to [USB flash installation medium](https://wiki.archlinux.org/title/USB_flash_installation_medium).

> Partition Disk

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

> Mirrorlist
```sh
vim /etc/pacman.d/mirrorlist
# add Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
pacstrap /mnt base base-devel linux linux-firmware
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -S dhclient dhcpcd
```
> Locale Settings
```sh
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock —systohc

vim /etc/locale.gen
# uncomment two lines: en_US.UTF-8 and zh_CN.UTF-8
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo arch > /etc/hostname
```

> Install Grub
```sh
mkinitcpio -p linux
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

passwd # enter password two times
exit
umount /mnt/boot
umount /mnt
reboot
```

> System Time
```sh
# sync system time with network time
timedatectl set-ntp true
```

## AUR

> 32-bit support & archlinuxcn
```sh
vim /etc/pacman.conf
# uncomment two lines of the [multilib] section
# add the lines below:
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch
Server = https://repo.huaweicloud.com/archlinuxcn/$arch

sudo pacman -S archlinuxcn-keyring
sudo pacman -Sy yay
```
## Software

| Usage          | Software                                                                       |
|----------------|--------------------------------------------------------------------------------|
| terminal       | kitty, alacritty, tmux                                                         |
| zsh            | zsh, zsh-completions, oh-my-zsh, powerlevel10k, neofetch, xcompmgr             |
| X.org          | xorg, xorg-xinit                                                               |
| window manager | i3-wm, lxdm, dmenu                                                             |
| file manager   | ranger, pcmanfm                                                                |
| applet         | network-manager-applet, pa-applet                                              |
| editor         | neovim, emacs, code                                                            |
| coding         | git, python, pip, miniconda, matlab                                            |
| LaTeX          | texlive-{most, langchinese}                                                    |
| database       | mariadb                                                                        |
| pdf            | poppler-data, okular, mupdf, evince                                            |
| office         | wps-office                                                                     |
| email          | mutt, thunderbird                                                              |
| image          | feh, imagemagick                                                               |
| video          | vlc, mpv                                                                       |
| music          | netease-cloud-music                                                            |
| browser        | chromium, google-chrome                                                        |
| utils          | conky, albert, dunst, redshift, compton, nitrogen, ntft-3g, proxychains-ng     |
| input          | fcitx5, fcitx5-{chinese-addons, pinyin-zhwiki, configtool, lua, nord, gtk, qt} |
| fonts          | jetbrains mono, noto, source-code-pro, font-awesome, meslo-nerd-font           |
| chinese fonts  | wqy-{microhei,zenhei}, adobe-source-han-serif-cn-fonts                         |
| VPN            | v2ray, v2raya, clash                                                                  |


> fcitx5 config
```
nvim ~/.xprofile
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus kitty
```

> Fonts
```
wqy-{microhei,zenhei}
adobe-source-han-serif-cn-fonts
adobe-source-code-pro-fonts
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
font-awesome
ttf-meslo-nerd-font-powerlevel10k
jetbrains
```

## VPN

- [linkhub](https://linkhub.mobi/)
- [ssrdog](https://ssrdog111.com/#/)
- [一元机场](https://一元机场.com/)
- [maoxiong](https://linxing.maoxiong.cloud/)

## Nvidia Graphics Drivers, Cuda, Cudnn

```yay -S nvidia nvidia-settings lib32-nvidia-utils```

## Auto start services
```sh
systemctl enable bluetooth.service
systemctl enable/start sshd.service
systemctl enable/start lxdm.service
```
