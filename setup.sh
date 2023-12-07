sudo apt install pup
sudo apt install git

#set up the blinkt
curl -sS https://get.pimoroni.com/blinkt | bash

#set up the binfo script
mv ~/Binfo/binfo.sh /usr/lib/binfo.sh
sudo chmod +x /usr/lib/binfo.sh
echo -e "0 0 * * * /usr/lib/binfo.sh\n@reboot /usr/lib/binfo.sh" | crontab -
read -p "Please enter your UPRN " uprn
echo $uprn > /usr/lib/uprn
sudo /usr/lib/binfo.sh

#set up the wifi AP
cd ~
sudo apt install python3
git clone https://github.com/jasbur/RaspiWiFi.git
sudo python3 ./RaspiWiFi/initial_setup.py
