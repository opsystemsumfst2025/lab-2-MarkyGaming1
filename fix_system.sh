#!/bin/bash

# Az első argumentum tárolása
TARGET_DIR="$1"

# Ellenőrzés, hogy megadtak-e könyvtárat
if [ -z "$TARGET_DIR" ]; then
    echo "Error: No directory provided"
    exit 1
fi

# .txt fájlok biztonságossá tétele (644)
find "$TARGET_DIR" -name '*.txt' -exec chmod 644 {} \;

# .sh fájlok biztonságossá tétele (700)
find "$TARGET_DIR" -name '*.sh' -exec chmod 700 {} \;

# Audit napló frissítése az aktuális dátummal
echo "[$(date +%Y-%m-%d)] fix_system.sh run on $TARGET_DIR" >> audit.log
