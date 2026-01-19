# Installation
> This config requires Arch using a Lenovo Thinkpad T480S laptop.
> Other devices are  untested.

 1. Start with a minimal archinstall
 2. Clone this repo and run `set-hypr` script
 3. Follow instructions and launch

# Post Installation Notes

SD Card reader is disabled to save power. 
-
Enable: `echo "2-3" | sudo tee /sys/bus/usb/drivers/usb/bind`

Disable: `echo 2-3" | sudo tee /sys/bus/usb/drivers/usb/bind`

A view of the desktop
-
![desktop](media/desktop.png)

# Applications
Common
-
```
Rofi(app launcher) [SUPER+R]
Kitty(terminal) [SUPER+Enter]
Waybar(topbar) [autoruns]

Firefox (Web Browser) [Rofi]
Pureref(Image References) [Rofi]
Nemo(File Manager) [Rofi]
Okular(Document Reader) [Rofi]

Btop(Task Manager) [Kitty]

Network Manager [Waybar wifi icon]
Bluetooth Manager [Waybar bluetooth icon)
```
Daemons
-
```
Greetd (login)
Hyprlock (lockscreen) 
Hyperidle (idle manager)

SwayNc (desktop notifications)
Reflector (Pacman mirrorlist)

TLP (battery manager)
Bluetooth (bluetooth)
Throttled (dethrottler)
Pipewire-Pulse (audio)

```

# Keybindings

Hyprland
-
```
SUPER + R (Rofi App Launcher)
SUPER + Enter (Kitty Terminal)

SUPER + F (fullscreen)
SUPER + C (close)
Super + V (float)
SUPER + J (split)
SUPER + P (pseudotile)

SUPER + 1-0 (workspace 1-10)
SUPER + Shift + 1-0 (app into workspace)

SUPER + S -> (special workspace)
SUPER + Shift + S (app into special workspace)

SUPER + W (pick wallpaper)
```


Scripted
-
```
Volume/Mute Controls (F1-F4)
Brightness Controls (F5,F6)
NWG-Displays (F7)
Network Killswitch (F8)
Open Neovim inside ~/.config (F9)
Bluetooth Killswitch (F10)
Keyboard Backlight (F11)
Notifications (F12)

Next Song (Ctrl+Right)
Prev Song (Ctrl+Left)
Play (Ctrl+Up)
Pause (Ctrl+Down)
```


