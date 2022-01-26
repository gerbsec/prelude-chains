# test=$(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ')
test=($(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ' | xargs printf "\"%s\" "))
echo "$test";
