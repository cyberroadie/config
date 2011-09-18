#!/bin/sh
ssh cyberroadie@bugs ": > .irssi/fnotify ; tail -f .irssi/fnotify " |
sed -u 's/[<@&]//g' | while read heading message;
do /usr/bin/notify-send -u critical -i /usr/share/icons/Tango-xfce/scalable/apps/terminal.svg -t 30000 -- "${heading}" "${message}";
done
