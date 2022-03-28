eval "suidGTFO=($(cat payload.txt | tr '\n' ' '))"
eval "suidOM=($(find / -perm -4000 -type f 2>/dev/null | sed 's:.*/\(.*\):"\1":' | tr '\n' ' '))"
exploitables=()
for eSuid in ${suidGTFO[@]};do
    for suid in ${suidOM[@]};do
        if [[ "$eSuid" == *"$suid"* ]];then
            exploitables+=("$suid")
            fi
        done;
    done;
uniq=($(printf "%s\n" "${exploitables[@]}" | sort -u ))
echo "[" ; printf -v x "{ \"suid\": \"%s\" }, " "${uniq[@]}";x=${x%, } ;echo "$x"; echo "]"; 