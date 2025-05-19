# Preface

This configuration for hypr + arch was created for a T480S laptop.
I 100% guarantee something will break when using any non-intended devices or your money back!

# Installation

```
1. Start with a minimal Arch install.
(Only requires networking is set up and git is installed)
(Installer will detect if Yay must be installed when ran)
2. make a `~/git` folder and/or clone this repo then use `chown -R ~/git/hyprland` to assign your user permissions.
3. run `~/git/hyprland/set-hypr` and follow install.
(while setting the terminal to ZSH, you must type `exit` afterwards to continue the install)
4. It will ask to launch. Either A:say 'y' to launch or, B: say 'n' and type `Hyprland` into console or, C: restart pc and it will boot into the greeter
5. Enjoy
```

# Post Installation

Beware that I disable the SD Card reader, as recommended to save power.
To re-enable SD Card: `sudo echo 2-3 > sudo sys/bus/usb/drivers/usb/bind`
Modify this to your heart's content!
Be sure to read and modify `~/.config/hyprland` as needed.

# Notable things which get installed

Apps:

```
Tofi(App launcher) [SUPER+R]
Kitty(Terminal) [SUPER+Enter]
Vencord(Discord) [Launched via Tofi]
Nemo(File Manager) [Launched via Tofi]
Btop(Task Manager) [Launched via Kitty]
```

Background Apps:

```
SwayNc(Desktop Notifications)
Waybar(Top Status bar)
Hyprlock/HyperIdle(lockscreen + idlelocker)
Network Manager(click wifi in Waybar)
Bluetooth Manager(click bluetooth in Waybar)
```

Daemons:

```

tlp (Battery Manager)
Bluetooth
Throttled (De-Throttler)
Reflector (Pacman Mirrorlist Auto Update)
Greetd (Greeter)

```

# Notable Keybinds

General:

```

Super + R -> App Launcher
Super + Enter -> Terminal
Super + S -> Opens special workspace
Super + Shift + S -> Moves window into special workspace
Super + 1-0 -> Goes to each workspace
Super + Shift + 1-0 -> Moves window into specified workspace number

```

Pre-Scripted Control Keys:

```

Printscreen copies to clipboard
Media Controls
Volume/Mute Controls
Brightness Controls
Keyboard Backlight
Favorites Key (star icon) opens notifications

```
