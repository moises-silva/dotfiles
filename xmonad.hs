import XMonad

import qualified Data.Map as M

-- Define a new key map without the keys I do not need (keysToRemove)
--newKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)

--keysToRemove :: XConfig Layout -> [(KeyMask, KeySym)]
--keysToRemove x = 
       --[ (modMask, xK_comma)
       --, (modMask, xK_period)
       --]

newKeys x = keys defaultConfig x `M.difference` keysToRemove x

keysToRemove :: XConfig Layout ->    M.Map (KeyMask, KeySym) (X ())
keysToRemove x = M.fromList
             [ ((modMask x, xK_comma ), return ())
             , ((modMask x, xK_period ), return ())
             ]

main = xmonad defaultConfig
       { terminal = "urxvt"
       , borderWidth = 1
       , keys = newKeys
       }

