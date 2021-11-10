cd /root
sudo chmod +x createramdisk openramdisk closeramdisk deleteramdisk
sudo ./createramdisk
sudo systemctl enable ramdisk.service
sudo systemctl start ramdisk.service
