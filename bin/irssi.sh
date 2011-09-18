#!/bin/sh
unamestr=`uname`
echo "test1"
#ssh cyberroadie.org ": > .irssi/fnotify ; echo \"irc notification enabled\" > .irssi/fnotify ; tail -f .irssi/fnotify " | sed 's/[&]//g' | while read heading message;
ssh cyberroadie.org ": > .irssi/fnotify ; echo \"irc notification enabled\" > .irssi/fnotify ; tail -f .irssi/fnotify " | while read heading message;
do
  echo "test"
  if [[ "$unamestr" == 'Linux' ]]; then
    /usr/bin/notify-send -u critical -i /usr/share/icons/Tango-xfce/scalable/apps/terminal.svg -t 30000 -- "${heading}" "${message}";
  elif [[ "$unamestr" == 'Darwin' ]]; then
    /usr/local/bin/growlnotify -m "${message}" -t "${heading}" --image ~/bin/irssitop.png;
  fi
done
