#!/bin/bash

#exec dwm
#exec ck-launch-session startxfce4
#exec awesome
#exec startkde 
#exec ck-launch-session xmonad

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval `dbus-launch --sh-syntax --exit-with-session`
fi

xbindkeys &
#/home/lh/.dropbox-dist/dropboxd &
#xsetroot -cursor_name left_ptr &

case $1 in
	dwm)
		#xscreensaver &
		source ~/.fehbg
		exec dwm
		;;
	awesome)
		exec awesome
		;;
	xmonad)
		exec ck-launch-session xmonad
		;;
	openbox)
		exec openbox-session
		;;
	*)
		exec ck-launch-session startxfce4
		;;
esac
