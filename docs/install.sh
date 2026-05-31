set -e

# Check for required commands
for cmd in curl dirname command cp chmod rm; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: Required command '$cmd' not found. Please install it and try again."
    exit 1
  fi
done

echo "Downloading noexec..."
if ! curl -s "https://raw.githubusercontent.com/ByteJoseph/noexec/refs/heads/main/src/noexec" -o noexec; then
  echo "Error: Failed to download noexec."
  exit 1
fi

file="noexec"
bash_path=$(command -v bash)
if [ -z "$bash_path" ]; then
  echo "Error: Could not find bash in PATH."
  rm -f "$file"
  exit 1
fi

dir_name=$(dirname "$bash_path")

if [ ! -w "$dir_name" ]; then
  echo "Error: No write permission to $dir_name. Please run with appropriate permissions."
  rm -f "$file"
  exit 1
fi

if [ -f "$file" ]; then
  cp "$file" "$dir_name/$file"
  chmod +x "$dir_name/$file"
  echo "noexec Installed Successfully to $dir_name/$file"
  rm "$file"
  echo ""
  echo "Start using now by typing: noexec"
else
  echo "Error: Downloaded file not found."
  exit 1
fi
