#!/bin/sh
# Can do with xdotool, but I like this better?

for i in $(lsw -a); do
    [[ $(xtitle $i) = 'bar' ]] && mapw -t $i && \
        bar=$i
done

[[ ! -z $(wattr m $bar && echo ismapped) ]] && \
    bspc config top_padding 80 || \
    bspc config top_padding 60

# for i in $(lsw -a); do
#     [[ $(xtitle $i) = 'bar' ]] && mapw -t $i && \
#        window_gap
# done
