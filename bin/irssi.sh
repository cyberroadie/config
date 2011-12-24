#!/bin/sh
unamestr=`uname`
#ssh cyberroadie.org ": > .irssi/fnotify ; echo \"irc notification enabled\" > .irssi/fnotify ; tail -f .irssi/fnotify " | sed 's/[&]//g' | while read heading message;
ssh cyberroadie.org ": > .irssi/fnotify ; echo \"irc notification enabled\" > .irssi/fnotify ; tail -f .irssi/fnotify " | while read heading message;
do
  if [[ "$unamestr" == 'Linux' ]]
  then
    /usr/bin/notify-send -i notification-message-im -- "IRC" "Message from ${heading}";
  elif [[ "$unamestr" == 'Darwin' ]]
  then
    /usr/local/bin/growlnotify -m "${message}" -t "${heading}" --image ~/bin/irssitop.png;
  fi
done

