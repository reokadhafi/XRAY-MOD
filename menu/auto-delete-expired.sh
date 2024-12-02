#!/bin/bash
# ==========================================
# Script untuk menghapus akun Xray yang expired

CONFIG_FILE="/etc/xray/config.json"
BACKUP_FILE="/etc/xray/config.json.bak"
DATE_NOW=$(date +%Y-%m-%d)

# Cek apakah file konfigurasi ada
if [ ! -f "$CONFIG_FILE" ] || [ ! -s "$CONFIG_FILE" ]; then
    echo "File konfigurasi $CONFIG_FILE tidak ditemukan atau kosong!"
    exit 1
fi

# Backup file konfigurasi sebelum modifikasi
cp "$CONFIG_FILE" "$BACKUP_FILE"

# Loop melalui semua akun yang ada
grep -E "^### " "$CONFIG_FILE" | while read -r line; do
    user=$(echo "$line" | cut -d ' ' -f 2)
    exp=$(echo "$line" | cut -d ' ' -f 3)

    # Bandingkan tanggal expired dengan tanggal sekarang
    if [[ "$DATE_NOW" > "$exp" ]]; then
        echo "Menghapus akun expired: $user (Expired: $exp)"
        # Hapus entri pengguna dari file konfigurasi
        sed -i "/^### $user $exp/,/^},{/d" "$CONFIG_FILE"
    fi
done

# Restart layanan Xray untuk menerapkan perubahan
systemctl restart xray > /dev/null 2>&1
if systemctl status xray | grep -q "running"; then
    echo "Layanan Xray berhasil direstart."
else
    echo "Gagal merestart layanan Xray! Periksa konfigurasi Anda."
    exit 1
fi
echo "Proses penghapusan akun expired selesai."
