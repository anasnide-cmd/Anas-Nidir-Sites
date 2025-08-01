#!/data/data/com.termux/files/usr/bin/bash

# Senarai projek
PROJECTS=(
  "Anas-Nidir-Sites"
  "MR ANAS NIDIR OS"
  "MR ANAS NIDIR OS (phone)"
  "NEXENGINE"
  "GAMETest"
)

echo "=== Pilih projek untuk push ==="

# Papar senarai projek
for i in "${!PROJECTS[@]}"; do
  printf "%d) %s\n" $((i+1)) "${PROJECTS[$i]}"
done

echo "Masukkan nombor projek yang nak push (pisahkan dengan space):"
read -r -a SELECTED

echo ""
echo "📤 Mula push projek terpilih..."

# Ulang untuk setiap pilihan
for index in "${SELECTED[@]}"; do
  i=$((index-1))
  project="${PROJECTS[$i]}"
  FOLDER="/storage/emulated/0/ACODE/$project"

  echo "🔁 Pushing $project..."
  cd "$FOLDER" || { echo "❌ Folder $FOLDER tak dijumpai."; continue; }
  git config --global --add safe.directory "$FOLDER"
  git add .
  git commit -m "Auto push dari push-select.sh [$project]"
  git push origin main
  echo "✅ $project selesai."
  echo "--------------------------"
done

echo "🎉 Semua projek terpilih dah siap dipush!"
