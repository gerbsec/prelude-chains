suidGTFO=($(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ' | xargs printf "\"%s\" "))
x=()
find / -perm -4000 -type f 2>/dev/null | sed 's:.*/::' | (while read s; do
    for suid in ${suidGTFO[@]}; do
        if [[ "$suid" == *"$s"* ]]; then
            x+=("$s")
            fi
        done;
    done;
    uniq=($(printf "%s\n" "${x[@]}" | sort -u | tr '\n' ' '))
    echo ${uniq[@]})
