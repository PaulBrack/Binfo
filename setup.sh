#Set up the blinkt. Do this first as it's required for the binfo script.
curl -sS https://get.pimoroni.com/blinkt | bash

#Set up command line blinkt tool
sudo apt install git
sudo apt install pigpio
git clone https://github.com/7402/blinkt.git
cd blinkt
make
sudo make install
cd ..

#Set up the binfo script
sudo apt install git
sudo apt install pup
sudo chmod +x binfo.sh
echo -e "0 0 * * * /home/pi/binfo.sh\n@reboot /home/pi/binfo.sh" | crontab -
