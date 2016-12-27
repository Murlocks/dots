#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# setxkbmap -layout jp, us

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx

# xrandr --output HDMI1 --auto --mode 1920x1080 --right-of eDP1 --output eDP1 --mode 1600x900 --auto
# xrandr --output HDMI1 --auto --primary --mode 2560x1440 --auto --right-of eDP1 --output eDP1 --mode 1600x900 --auto
# syndaemon -i 2 -d
xinput set-prop 11 286 0 0 0 0 0 0 0
unclutter &
# xcape -e 'Control_L=Escape'

wmname LG3D #so intellij works
java_nonparenting.sh

~/.fehbg &
compton --mark-ovredir-focused &
# compton &

#[ ! -s ~/.config/mpd/pid ] && mpd
# emacs --daemon &
mopidy &
# urxvtd -q -f -o &
xsetroot -cursor_name left_ptr &
# dropbox &
clipbored &
sxhkd &
exec bspwm
# wew | yawee &
# exec dswm
