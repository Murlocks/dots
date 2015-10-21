#!/usr/bin/env bash
# info.sh
# Output information with formatted background colors in lemonbar format
# This script can take arguments for what bar information to display(meant to be the names of the functions)

. panel_config

# clickable area aliases
AC='%{A:'           # start click area
AB=':}'             # end click area cmd
AE='%{A}'           # end click area

padding=' '

icon() {
    # echo -n -e "%{U$COLOR_FOREGROUND}%{+u}\u$1%{-u}"
    echo -n -e "\u$1"
    # echo -n -e "%{B#ff545350} \u$1 %{B-}"
}

block() {
    echo $@
}

clock() {
    status=$(date '+%l:%M')
    echo -e $(icon f017) $(block $status)
}

dateblock() {
    status=$(date '+%a, %d %b')
    echo -e $(icon f073) $(block $status)
}

wifi() {
    ssid='none '
    new=$(iwconfig wlp3s0 | sed -rn "s/.*ESSID:\"(.*)\"\s/\1/p")
    signal=$(iw wlp3s0 link | grep 'signal' | sed 's/signal: //' | sed 's/ dBm//' | sed 's/\t//')
    if [ "$new" != "" ] ; then
        ssid="$new$signal"
    fi
    echo -e $(icon f1eb) $(block $ssid)
}

# press on the heart to turn it off!
batt() {
    status=$(acpi | sed -rn 's/.* ([0-9]+%).*/\1/p')
    echo -e ${AC}systemctl poweroff${AB}$(icon f21e)${AE} $(block $status)
}

power() {
    echo -e ${AC}systemctl poweroff${AB}$(icon f011)${AE}
}

sleepb() {
    echo -e ${AC}systemctl suspend${AB}$(icon f186)${AE}
}

screenlock() {
    echo -e $(icon f023)
}

# mpc now playing
mpc() {
    cur=$(mpc current)
    if [ -n "$cur" ] ; then
        if [[ -n $(mpc status | grep paused) ]] ; then
            echo -e %{A:mpc prev:}$(icon f04a)%{A} %{A:mpc play:}$(icon f04b)%{A} %{A:mpc next:}$(icon f04e)%{A} ${cur:0:55}
        else
            echo -e %{A:mpc prev:}$(icon f04a)%{A} %{A:mpc pause:}$(icon f04c)%{A} %{A:mpc next:}$(icon f04e)%{A} ${cur:0:55}
        fi
    fi
}

#determine what to display based on arguments, unless there are none, then display all.
blockActive=false;
while :; do
    buf="S"
    blockActive=true

    [ -z "$*" ] && items="wifi batt clock sleepb power" \
                || items="$@"

    for item in $items; do
        buf="${buf}${padding}$($item)";
    done

    echo "${buf}"
    sleep 2 # update interval
done
