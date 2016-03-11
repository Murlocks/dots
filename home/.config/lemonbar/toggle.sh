#!/bin/sh
# Can do with xdotool, but I like this better?

for i in $(lsw -a); do
    [[ $(xtitle $i) = 'panel' ]] && mapw -t $i && \
        bar=$i
done

padding=$(bspc config -m focused top_padding)

[[ ! -z $(wattr m $bar && echo ismapped) ]] && \
    bspc config top_padding $(($padding + 20)) || \
    bspc config top_padding $(($padding - 20))

# for i in $(lsw -a); do
#     [[ $(xtitle $i) = 'bar' ]] && mapw -t $i && \
#        window_gap
# done
