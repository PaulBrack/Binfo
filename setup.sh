sudo apt install pup
sudo apt install git
sudo apt install pigpio
git clone https://github.com/7402/blinkt.git
cd blinkt
make
sudo make install
sudo systemctl enable pigpiod
mv ~/Binfo/binfo.sh /usr/lib/binfo.sh
sudo chmod +x /usr/lib/binfo.sh
echo -e "0 0 * * * /usr/lib/binfo.sh\n@reboot /usr/lib/binfo.sh" | crontab -
read -p "Please enter your UPRN " uprn
echo $uprn > /usr/lib/uprn
sudo /usr/lib/binfo.sh
