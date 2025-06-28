curl  "https://raw.githubusercontent.com/ByteJoseph/noexec/refs/heads/main/src/noexec" -o noexec
file="noexec"
dir_name=$(dirname "$(which bash)")
if [ -f "$file" ]; then
  
  cp "$file" "$dir_name/$file"
  chmod +x "$dir_name/$file"
  echo "noexec Installed Successfully"
  rm "noexec"
  echo ""
  echo "Start using now"
  noexec
fi
