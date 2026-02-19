#
#
#    by theo
#
#


local YABAI_LAST_DIRECTION=/Users/$USER/.config/yabai/dir


make_new_space_left() {
    yabai -m space --create
    local new_space_index=$(yabai -m query --spaces --space | jq '.index')
    local last_space_index=$(yabai -m query --displays --display | jq -c '.spaces[-1]')
    yabai -m space --focus "$last_space_index"
    for ((i=last_space_index; i>1; i--)); do
        yabai -m query --spaces --space > /dev/null
        if [[ $new_space_index -eq $last_space_index ]]; then
            break
        fi
        if [[ $i -eq $(( new_space_index + 1 )) ]]; then
            yabai -m space --swap $(( i - 1 ))
            break
        else
            yabai -m space --move prev
        fi
    done
}

make_new_space_right() {
    yabai -m space --create
    local new_space_index=$(yabai -m query --spaces --space | jq '.index')
    local new_space_index=$(( new_space_index + 1 ))
    local last_space_index=$(yabai -m query --displays --display | jq -c '.spaces[-1]')
    yabai -m space --focus "$last_space_index"
    for ((i=last_space_index; i>1; i--)); do
        yabai -m query --spaces --space > /dev/null
        if [[ $new_space_index -eq $last_space_index ]]; then
            break
        fi
        
        if [[ $i -eq $(( new_space_index + 1 )) ]]; then
            yabai -m space --swap $(( i - 1 ))
            break
        else
            yabai -m space --move prev
        fi
    done
}

next_display_or_space_looping() {
    #$1 := "-f" | "-b"      (f)orward, (b)ack
    #$2 := "-s | -d"        (d)isplay, (s)pace
    #$3 := int              (optional display or space mission control index)
    local direction=$1
    local op=$2

    if [[ $op == "-d" ]]; then
        local arr_json=$(yabai -m query --displays | jq -c '[.[].index]')
        local mcidx=$(yabai -m query --displays --display | jq -c '.index')
    else
        local arr_json=$(yabai -m query --displays --display | jq -c '.spaces')
        local mcidx=$(yabai -m query --spaces --space | jq -c '.index')
    fi

    local arr=(${(s:,:)${arr_json[2,-2]}})
    local len=${#arr}
    local last=${arr[-1]}
    local first=${arr[1]}

    if [[ -v 3 ]]; then
        mcidx=$3
    fi

    for ((i=1; i<=len; i++)); do
        if [[ "${arr[$i]}" == "$mcidx" ]]; then
            local pos=$i
            break
        fi
    done

    if [[ "$len" == "1" ]]; then
        next="$first"
    elif [[ "$len" == "$pos" && "$direction" == "-f" ]]; then
        next="$first"
    elif [[ "$pos" == "1" && "$direction" == "-b" ]]; then
        next="$last"
    else
        if [[ "$direction" == "-f" ]]; then
            next="$(( mcidx + 1 ))"
        else
            next="$(( mcidx - 1 ))"
        fi
    fi
    print "$next"
}

destroy_space_and_refocus() {
    #$1 := "-x"    "(optional close windows on space)"
    local mcidx=$(yabai -m query --spaces --space | jq '.index')
    local direction=-$(<"$YABAI_LAST_DIRECTION")
    local arr_json=$(yabai -m query --displays --display | jq -c '.spaces')
    local arr_pre=(${(s:,:)${arr_json[2,-2]}})
    local len=${#arr_pre}

    for ((i=1; i<=len; i++)); do
        if [[ "${arr_pre[$i]}" == "$mcidx" ]]; then
            local pos=$i
            break
        fi
    done

    for i in {1..$#arr_pre}; do
        if (( i == mcidx )); then
            continue
        elif (( i > mcidx )); then
            arr_pre[i]=$(( arr_pre[i] - 1 ))
        fi
    done

    local arr=(${arr_pre[1,pos-1]} ${arr_pre[pos+1,-1]})

    if [[ "$direction" == "-f" ]]; then
        if [[ "$pos" == "1" ]]; then
            next="${arr[-1]}"
#          forward direction
#          from last position
#           [x]   [4]   [5]
#          this        next
        else
            new=$(( pos - 1 ))
            next="${arr[new]}"
#           [4]   [x]   [5]
#          next  this
        fi
    else
        if [[ "$pos" == "$len" ]]; then
            next="${arr[1]}"
#          backwards direction
#          from first position
#           [4]   [5]   [x]
#          next        this
        else
            new=$(( pos ))
            next="${arr[new]}"
#           notice x was 5
#           [4]   [x]   [5]
#                this  next
        fi
    fi
    
    if [[ "$1" == "-x" ]]; then
        local win_arr_json=$(yabai -m query --spaces --space | jq -c '.windows')
        local win_arr=(${(s:,:)${win_arr_json[2,-2]}})
        for i in ${win_arr[@]}; do
            yabai -m window "$i" --close
        done
    fi

    yabai -m space --destroy && yabai -m space --focus "$next"
}

rotate_displays() {
    # $1 := "f" | "b"
    local fronts="$(yabai -m query --spaces | jq -rc '[.[] | select(."is-visible" == true) | .index]')"
    local front_display="$(yabai -m query --displays --display | jq '.index')"
    local direction

    if [[ "$1" == "-f" ]]; then
        direction="forward"
    else
        direction="back"
    fi
    
    local arr="$(yabai -m query --displays | jq -rc '[.[] | .spaces]')"
    
    while read -r; do
        zsh -c "$REPLY"
    done < <(python3 /Users/$USER/.config/skhd/rotate.py \
            --fronts "$fronts" \
            --front_display $front_display \
            --direction $direction \
            --array "$arr"
            )
}