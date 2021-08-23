!#/bin/bash
pacman -S dialog --noconfirm
tempfile="$(mktemp)"
while true; do
    dialog --menu 'Please take a selection' 18 70 15 $(n1 selection.list) 2>"$tempfile" && break
done
n="$(cat "$tempfile")"
value="$(sed -n "${n}p" selection.list)"
rm "$tempfile"
echo "The user selected option number $n: '$value'"

