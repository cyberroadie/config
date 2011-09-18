#!/usr/bin/env bash
ssh bbc@www.cyberroadie.org ": > .irssi/fnotify ; echo \"bbc irc notification enabled\" > .irssi/fnotify ; tail -f .irssi/fnotify " | sed -u 's/[&]//g' | while read heading message;
#do /usr/bin/notify-send -i notification-message-im -- "${heading}" "${message}";
do /usr/bin/notify-send -i notification-message-im -- "BBC IRC" "Message from ${heading}";
if [[ -n `ssh bbc@www.cyberroadie.org screen -list | grep '(Attached)'` ]]; then
echo "${message}" | sed -ur 's/^.*>//' | /usr/bin/festival --tts;
fi
done
/usr/bin/festival --tss "bbc irc notification disabled"

