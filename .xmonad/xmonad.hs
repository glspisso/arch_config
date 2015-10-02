import XMonad
-- import XMonad.Actions.Volume

main = xmonad $ defaultConfig
	{ modMask            = mod4Mask  -- Rebind Mod to the Windows key
	, borderWidth        = 2
	--, ((modMask x, xK_F7), lowerVolume 3 >> return ())
	--, ((modMask x, xK_F8), raiseVolume 3 >> return ())
	--, ((modMask x, xK_F6), toggleMute    >> return ())
	, terminal           = "terminology"
	, normalBorderColor  = "#cccccc"
	, focusedBorderColor = "#cd8b00" }
