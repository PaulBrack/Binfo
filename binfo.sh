!/bin/bash

#For startup job, retry every 1s for 10 minutes if network is down - it may not be up yet
counter=0
until [ $counter -ge 600 ] || ip addr show wlan0 | grep -qE 'inet ([[:digit:]]+\.?)+'; do
   sleep 1
   ((counter++))
   if [ $((counter%2)) -eq 0 ];
   then
      sudo blinkt blue
   else
      sudo blinkt black
   fi
done

sudo blinkt green

#Get the web page
binfo=$(curl 'https://www.manchester.gov.uk/Checkyourbincollectiondays' --data-raw 'mcc_bin_dates_uprn=000077086062&mcc_bin_dates_submit=Go')

# Function to check if a date is valid
is_valid_date() {
   date -d "$1" > /dev/null 2>&1
}

# Extracting Bin Collection Dates
bluebin=$(echo $binfo | pup 'div.collection h3:contains("Blue") + p text{}' | awk '{print $4, $5, $6}')
brownbin=$(echo $binfo | pup 'div.collection h3:contains("Brown") + p text{}' | awk '{print $4, $5, $6}')
greenbin=$(echo $binfo | pup 'div.collection h3:contains("Green") + p text{}' | awk '{print $4, $5, $6}')
blackbin=$(echo $binfo | pup 'div.collection h3:contains("Black") + p text{}' | awk '{print $4, $5, $6}')

# Check if all dates are valid
if [ -n "$bluebin" ] && [ -n "$brownbin" ] && [ -n "$greenbin" ] && [ -n "$blackbin" ]; then
    # Comparing Dates and Blinking LEDs
    sudo blinkt black
    [[ $(( $(date -d "$bluebin" +"%s") - $(date +"%s") )) -lt $((24 * 60 * 60)) ]] && sudo blinkt 11000000 blue
    [[ $(( $(date -d "$brownbin" +"%s") - $(date +"%s") )) -lt $((24 * 60 * 60)) ]] && sudo blinkt 00110000 orange
    [[ $(( $(date -d "$greenbin" +"%s") - $(date +"%s") )) -lt $((24 * 60 * 60)) ]] && sudo blinkt 00001100 green
    [[ $(( $(date -d "$blackbin" +"%s") - $(date +"%s") )) -lt $((24 * 60 * 60)) ]] && sudo blinkt 00000011 white
else
    # Set Blinkt! to red if any date is invalid
    sudo blinkt red
fi
