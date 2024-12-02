#!/bin/bash
# ==========================================
cd
rm -rf updatedll

# Download skrip
cd /usr/bin
wget -O xmenu "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/xmenu.sh"
wget -O add-akun "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/add-akun.sh"
wget -O updatedll "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/updatedll.sh"
wget -O delete-akun "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/delete-akun.sh"
wget -O restart-xray "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/restart-xray.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/cek-port.sh"
wget -O auto-delete-expired "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/menu/auto-delete-expired.sh"

# wget -O certv2ray "https://raw.githubusercontent.com/reokadhafi/XRAY-MOD/main/xray/certv2ray.sh"
# chmod +x /usr/bin/certv2ray

# Berikan izin eksekusi
chmod +x /usr/bin/updatedll /usr/bin/xmenu /usr/bin/add-akun /usr/bin/delete-akun /usr/bin/restart-xray /usr/bin/auto-pointing /usr/bin/cek-port /usr/bin/auto-delete-expired

cd
