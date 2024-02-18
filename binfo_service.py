
import RPi.GPIO as GPIO
import subprocess
import time
from displayhatmini import DisplayHATMini
from PIL import Image, ImageDraw, ImageFont
import ST7789

buffer = Image.new("RGB", (320,240))
font = ImageFont.load_default()
GPIO.setmode(GPIO.BCM)


GPIO.setup(5, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(6, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(16, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(24, GPIO.IN, pull_up_down=GPIO.PUD_UP)

disp = ST7789.ST7789(
     height=240,
     width=320,
     rotation=180,
     port=0,
     cs=1,
     dc=9,
     backlight=13,
     spi_speed_hz=60 * 1000 * 1000,
     offset_left=0,
     offset_top=0
)
lastimagepath = ''

while(True):
    if !GPIO.input(5):
        imagepath = 'wotd.jpg'
    elif !GPIO.input(6):
        imagepath = 'wotd.jpg'
    elif !GPIO.input(16):
        imagepath = 'wotd.jpg'
    elif !GPIO.input(24):
        imagepath = 'wotd.jpg'
    else:
        imagepath = 'wotd.jpg'

    if(imagepath != lastimagepath):
        image = Image.open(imagepath)
        disp.begin()    
        image = image.resize((320, 240))
        disp.display(image)
        lastimagepath = imagepath;
    time.sleep(1)
