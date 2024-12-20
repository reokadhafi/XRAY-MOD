#!/bin/bash
clear
echo -e "\e[36m╒════════════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                     INFO SERVER                    \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════════════╛\033[0m"

uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
#clear
if [ "$cekup" = "day" ]; then
echo -e "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e "System Uptime   :  $uphours $upminutes"
fi
echo -e "IP-VPS          :  $IPVPS"
echo -e "ISP-VPS         :  $ISPVPS"
echo "╔════════════════════════════════════════════════════╗"
echo -e " \E[0;41;36m               🔹 Script By Yon-Mod 🔹              \E[0m"
echo "╚════════════════════════════════════════════════════╝"
echo "╔════════════════════════════════════════════════════╗"
echo -e " \E[0;44;33m Link Script➤https://github.com/reokadhafi/XRAY-MOD \E[0m"
echo "╚════════════════════════════════════════════════════╝"
echo "╔════════════════════════════════════════════════════╗"
echo -e " \E[0;41;36m                  🔹 XRAY XMENU 🔹                  \E[0m"
echo "╚════════════════════════════════════════════════════╝"
echo "║1 ║ Buat Semua Akun XRAY   ➤ Create Account         ║"
echo "║2 ║ Hapus Akun XRAY        ➤ Delete Account         ║"
echo "║3 ║ Cek Nama Domain        ➤ Domain Name Checker    ║"
echo "║4 ║ Cek IP Publik          ➤ Check Public IP        ║"
echo "║5 ║ Update DLL             ➤ Update Script          ║"
echo "║6 ║ XRAY UPDATE Core       ➤ Update Core & Geo      ║"
echo "║7 ║ Hidupkan Ulang Xray    ➤ Restart Service XRAY   ║"
echo "║8 ║ Perbarui Sertifikat    ➤ Update Certificate     ║"
echo "║9 ║ Test Kecepatan Server  ➤ Speedtest Server       ║"
echo "║10║ Hidupkan Ulang VPS     ➤ Reboot VPS             ║"
echo "║11║ Info Script            ║                        ║"
echo "║12║ Auto Pointing Subdomain║                        ║"
echo "║13║ Cek Semua Layanan Port ➤ Check All Port Service ║"
echo "║0 ║ Keluar Dari Menu       ➤ Exit Menu              ║"
echo "╚════════════════════════════════════════════════════╝" 
read -p "╰┈➤Select From Options [1-69 or x] :  " xmenu
case $xmenu in 
1)
add-akun
;;
2)
delete-akun
;;
3)
cat /etc/xray/domain
;;
4)
curl -s ipinfo.io/ip
;;
5)
updatedll
;;
6)
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --without-geodata
systemctl stop nginx
rm -rf /etc/systemd/system/xray.service.d
cat <<EOF> /etc/systemd/system/xray.service
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target

EOF

systemctl daemon-reload
sleep 1
systemctl enable xray
systemctl restart xray
systemctl restart nginx
systemctl enable runn
systemctl restart runn
echo "XRAY Core & Geo Update Success"
;;
7)
restart-xray
;;
8)
certv2ray
;;
9)
speedtest
;;
10)
reboot
;;
11)
cat /root/log-install.txt
;;
12)
auto-pointing
;;
13)
cek-port
;;
0)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
