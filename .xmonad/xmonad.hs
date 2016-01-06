import XMonad
-- No border imports
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
-- Import things to put in the xmobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks  
import XMonad.Util.Run  
import System.IO  
-- Import keybind utility
import XMonad.Util.EZConfig  
import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Actions.Volume
import XMonad.Actions.SpawnOn
import XMonad.Actions.WithAll

defaultLayouts = tiled ||| Mirror tiled ||| Full  
 where  
      -- default tiling algorithm partitions the screen into two panes  
      tiled = Tall nmaster delta ratio  
   
      -- The default number of windows in the master pane  
       
      nmaster = 2  
      -- Default proportion of screen occupied by master pane  
      ratio = 2/3  
   
      -- Percent of screen to increment by when resizing panes  
      delta = 5/100 
-- Define layout for specific workspaces
nobordersLayout = noBorders $ Full

myLayout = onWorkspace "5:media" nobordersLayout $ defaultLayouts   
-- Define amount and names of workspaces  
myWorkspaces = ["1:main","2:browser","3:pdf","4:software","5:media","6:notes","7","8:web","9:chat"]  

-- Start application in a predefined window
myManageHook = composeAll  
     [ className =? "chromium" --> doShift "8:web"  
     , className =? "qutebrowser" --> doShift "2:browser"  
     , className =? "Vlc" --> doShift "5:media"  
     , className =? "Mpv" --> doShift "5:media"  
     , className =? "Skype" --> doShift "9:chat"  
     , className =? "MuPDF" --> doShift "3:pdf"  
     , className =? "llpp" --> doShift "3:pdf"  
     , className =? "Mendeleydesktop.x86_64" --> doShift "3:pdf"  
     , className =? "RStudio" --> doShift "4:software"  
     , title =? "notes" --> doShift "6:notes"  
     , title =? "weechat" --> doShift "9:chat"
     ]   		

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"   
xmonad $ defaultConfig
	{ manageHook = manageDocks <+> myManageHook 
														 <+> manageHook defaultConfig
 	, layoutHook = avoidStruts $ myLayout 
	, handleEventHook = mconcat
	                    [ docksEventHook
	                    , handleEventHook defaultConfig ]
	, logHook = dynamicLogWithPP xmobarPP  
	   { ppOutput = hPutStrLn xmproc  
	   , ppTitle = xmobarColor "cyan" "" . shorten 50   
	   , ppLayout = const "" -- to disable the layout info on xmobar  
	   }     
	, modMask            =  mod4Mask  -- Rebind Mod to the Windows key
	, borderWidth        = 2
	, terminal           = "urxvt"
	, normalBorderColor  = "#cccccc"
	, focusedBorderColor = "#cd8b00" 
 	, workspaces = myWorkspaces 
 	}`additionalKeys` -- Already bound: q(wer)t nmhjkl,.(p) 
  [(( mod4Mask, xK_b), spawn "qutebrowser")
  ,(( mod4Mask .|. shiftMask, xK_s), spawn "scrot ~/Pictures/screenshots/%b%d::%H%M%S.png") 
  ,(( mod4Mask, xK_p), spawn "terminology") 
  ,(( mod4Mask, xK_i), spawn "urxvt --title=weechat -e weechat") 
  ,(( mod4Mask, xK_v), spawn "notes") 
  ,(( mod3Mask, xK_v), spawn "notes") 
  ,(( mod4Mask, xK_c), spawn "chromium") 
  ,(( mod4Mask, xK_s), spawn "skype")
  ,(( mod4Mask, xK_y), spawn "rstudio-bin")
  ,(( mod4Mask .|. shiftMask, xK_y), spawn "mendeleydestkop")
  ,((0, xF86XK_MonBrightnessUp ), spawn "sudo brightness +5")
  ,((0, xF86XK_MonBrightnessDown ), spawn "sudo brightness -5")
  ,((0, xF86XK_AudioLowerVolume ), spawn "amixer set Master 10%-")
  ,((0, xF86XK_AudioRaiseVolume ), spawn "amixer set Master 10%+")
  ,((0, xF86XK_AudioMute ), spawn "amixer set Master toggle")
  ,(( mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock") -- window key + Shift + l to lock system  
  ,(( mod4Mask .|. shiftMask, xK_F5), spawn "reboot") -- window key + Shift + F4 to shutdown system  
  ,(( mod4Mask .|. shiftMask, xK_F4), spawn "shutdown -h now") -- window key + Shift + F4 to shutdown system  
  ,(( mod4Mask, xK_F4), killAll) -- to kill applications  
  ]	
