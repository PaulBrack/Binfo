#Set up the blinkt. Do this first as it's required for the binfo script.
curl -sS https://get.pimoroni.com/blinkt | bash

#Set up the binfo script
cd ~
sudo apt install git
sudo apt install pup
mv ~/Binfo/binfo.sh /usr/lib/binfo.sh
sudo chmod +x /usr/lib/binfo.sh
echo -e "0 0 * * * /usr/lib/binfo.sh\n@reboot /usr/lib/binfo.sh" | crontab -
read -p "Please enter your UPRN " uprn
echo $uprn > /usr/lib/uprn

#Set up the Wifi AP. Do this last as it requires a reset.
cd ~
sudo apt install python3
git clone https://github.com/jasbur/RaspiWiFi.git
sudo python3 ./RaspiWiFi/initial_setup.py
sudo init 6
