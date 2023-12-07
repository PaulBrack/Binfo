sudo apt install pup
sudo apt install git
sudo apt install pigpio
git clone https://github.com/7402/blinkt.git
cd blinkt
make
sudo make install
sudo systemctl enable pigpiod
cd ..
sudo chmod +x binfo.sh
echo -e "0 0 * * * ~/binfo.sh\n@reboot ~/binfo.sh" | crontab -
read -p "Please enter your UPRN " uprn
echo $uprn > uprn
