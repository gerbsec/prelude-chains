command eval  "suidGTFO=($(cat test.txt | tr '\n' ' '))"
echo "${#suidGTFO[@]}"