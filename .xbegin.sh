 #!/bin/bash

 ~/.fehbg 
 xscreensaver -no-splash &
 xmodmap -e "remove Lock = Caps_Lock" 
 xmodmap -e "keysim Escape = Caps_Lock" 
 xmodmap -e "keysim Caps_Lock = Escape " 
 xmodmap -e "add Lock = Caps_Lock"
#  xmodmap -e "clear mod3" 
#  xmodmap -e "add Mod3 = Caps_Lock" 
 xmodmap ~/.xmodmap

