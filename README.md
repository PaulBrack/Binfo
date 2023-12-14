A script that scrapes the bin info for a property within Manchester City Council, decides which bin should go out, and updates the LEDs accordingly.

Requires a Raspberry Pi with an installed Pimoroni Blinkt!

LED status codes:
* Blinking blue - no current Wifi connection
* Green - downloading
* Red - could not figure out which bin day it is
* Blank - booting, or not bin day today or tomorrow
* Pairs of LEDs lit - it's bin day today or tomorrow. Put out the appropriate bin. Orange is for brown bin, white is for black

Run setup.sh to get all the dependencies installed, the script will run at startup and each day at midnight.
