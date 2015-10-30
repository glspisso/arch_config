import XMonad
-- No border imports
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
-- Import things to put in the xmobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks  
import XMonad.Util.Run  
import System.IO  

-- import XMonad.Actions.Volume

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

myLayout = onWorkspace "2:chat" nobordersLayout $ defaultLayouts

-- Define amount and names of workspaces  
myWorkspaces = ["1:main","2:chat","3:pdf","whatever","5:media","6","7","8:web"]  

-- Start application in a predefined window
myManageHook = composeAll  
     [ className =? "Chromium" --> doShift "8:web"  
     , className =? "Skype" --> doShift "2:chat"  
     ]   		

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"   
xmonad $ defaultConfig
	{ layoutHook = avoidStruts $ myLayout 
	, logHook = dynamicLogWithPP xmobarPP  
	   { ppOutput = hPutStrLn xmproc  
	   , ppTitle = xmobarColor "blue" "" . shorten 50   
	   , ppLayout = const "" -- to disable the layout info on xmobar  
	   }     
	, modMask            = mod4Mask  -- Rebind Mod to the Windows key
	, borderWidth        = 2
	--, ((modMask x, xK_F7), lowerVolume 3 >> return ())
	--, ((modMask x, xK_F8), raiseVolume 3 >> return ())
	--, ((modMask x, xK_F6), toggleMute    >> return ())
	, terminal           = "terminology"
	, normalBorderColor  = "#cccccc"
	, focusedBorderColor = "#cd8b00" 
 	, workspaces = myWorkspaces 
 	, manageHook = myManageHook <+> manageHook defaultConfig}
