eval "suidGTFO=($(cat payload.txt | tr '\n' ' '))"
for ((suid = 0; suid < ${#suidGTFO[@]}; suid++));do
    if [[ "${suidGTFO[$suid]}" == *"#{json.T1548.suid}"* ]]; then
        eval ${suidGTFO[$suid]}
        fi
    done;