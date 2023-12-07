cd ~

#get the uprn
uprn=$(cat uprn)

#Get the web page
binfo=$(curl 'https://www.manchester.gov.uk/Checkyourbincollectiondays' --data-raw 'mcc_bin_dates_uprn=000077086062&mcc_bin_dates_submit=Go')

#Today's date in same format as site
today=$(date +'%e %b %Y' | xargs)

#Get binfo
bluebin=$(echo $binfo | pup 'div.collection h3:contains("Blue") + p text{}' | awk '{print $4, $5, $6}')
brownbin=$(echo $binfo | pup 'div.collection h3:contains("Brown") + p text{}' | awk '{print $4, $5, $6}'
greenbin=$(echo $binfo | pup 'div.collection h3:contains("Green") + p text{}' | awk '{print $4, $5, $6}'
blackbin=$(echo $binfo | pup 'div.collection h3:contains("Black") + p text{}' | awk '{print $4, $5, $6}'

#Compare dates
[[ "$bluebin" == "$today" ]] && blinkt 11000000 blue
[[ "$brownbin" == "$today" ]] && blinkt 00110000 orange
[[ "$greenbin" == "$today" ]] && blinkt 00001100 green
[[ "$blackbin" == "$today" ]] && blinkt 00000011 white
