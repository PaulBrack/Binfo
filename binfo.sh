!/bin/bash

#Get the web page
binfo=$(curl 'https://www.manchester.gov.uk/Checkyourbincollectiondays' --data-raw 'mcc_bin_dates_uprn=000077086062&mcc_bin_dates_submit=Go')

#Get binfo
bluebin=$(echo $binfo | pup 'div.collection h3:contains("Blue") + p text{}' | awk '{print $4, $5, $6}')
brownbin=$(echo $binfo | pup 'div.collection h3:contains("Brown") + p text{}' | awk '{print $4, $5, $6}')
greenbin=$(echo $binfo | pup 'div.collection h3:contains("Green") + p text{}' | awk '{print $4, $5, $6}')
blackbin=$(echo $binfo | pup 'div.collection h3:contains("Black") + p text{}' | awk '{print $4, $5, $6}')

#Compare dates
sudo blinkt black
[[ $(( $(date -d "$bluebin" +"%s") - $(date +"%s") )) -lt $((7 * 24 * 60 * 60)) ]] && sudo blinkt 11000000 blue
[[ $(( $(date -d "$brownbin" +"%s") - $(date +"%s") )) -lt $((7 * 24 * 60 * 60)) ]] && sudo blinkt 00110000 orange
[[ $(( $(date -d "$greenbin" +"%s") - $(date +"%s") )) -lt $((7 * 24 * 60 * 60)) ]] && sudo blinkt 00001100 green
[[ $(( $(date -d "$blackbin" +"%s") - $(date +"%s") )) -lt $((7 * 24 * 60 * 60)) ]] && sudo blinkt 00000011 white
