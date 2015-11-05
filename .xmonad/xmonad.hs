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

myLayout = tiled ||| Mirror tiled ||| Full  
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
-- nobordersLayout = noBorders $ Full

-- myLayout = defaultLayouts  -- onWorkspace "2:browser" nobordersLayout $

-- Define amount and names of workspaces  
myWorkspaces = ["1:main","2:browser","3:pdf","whatever","5:media","6","7","8:web","9:chat"]  

-- Start application in a predefined window
myManageHook = composeAll  
     [ className =? "Chromium" --> doShift "8:web"  
     , className =? "qutebrowser" --> doShift "2:browser"  
     , className =? "Vlc" --> doShift "5:media"  
     , className =? "Skype" --> doShift "9:chat"  
     , className =? "Okular" --> doShift "3:pdf"  
     ]   		

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"   
xmonad $ defaultConfig
	{ manageHook = manageDocks <+> myManageHook 
														 <+> manageHook defaultConfig
 	, layoutHook = avoidStruts $ layoutHook defaultConfig  	
	, logHook = dynamicLogWithPP xmobarPP  
	   { ppOutput = hPutStrLn xmproc  
	   , ppTitle = xmobarColor "blue" "" . shorten 50   
	   , ppLayout = const "" -- to disable the layout info on xmobar  
	   }     
	, modMask            = mod4Mask  -- Rebind Mod to the Windows key
	, borderWidth        = 2
	, terminal           = "terminology"
	, normalBorderColor  = "#cccccc"
	, focusedBorderColor = "#cd8b00" 
 	, workspaces = myWorkspaces 
 	}`additionalKeys`  
  [(( mod4Mask, xK_b), spawn "qutebrowser") -- to open qutebrowser  
  ,(( mod4Mask, xK_p), spawn "terminology") -- to open terminology  
  ,(( mod4Mask, xK_c), spawn "chromium") -- to open terminology  
  ,(( mod4Mask, xK_s), spawn "skype") -- to open terminology  
  ,(( mod4Mask .|. shiftMask, xK_F5), spawn "reboot") -- window key + Shift + F4 to shutdown system  
  ,(( mod4Mask .|. shiftMask, xK_F4), spawn "shutdown -h now") -- window key + Shift + F4 to shutdown system  
  ,(( mod4Mask, xK_F4), kill) -- to kill applications  
  ]	
