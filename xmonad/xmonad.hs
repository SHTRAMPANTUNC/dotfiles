---------------------------------------------------
-- LIBS
----------------------------------------------------
--Base
import XMonad
import XMonad.Core
import qualified XMonad.StackSet as W

--Utils
import XMonad.Util.Cursor
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

--Data
import Data.Monoid

--Layouts
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.LimitWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

--Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.SetWMName

----------------------------------------------------
-- VARIABLES
----------------------------------------------------
--MASKS
myModMask = mod4Mask
myAppMask = mod1Mask
--Colors
colorFocused = "#7558aa"
colorNormal  = "#d4caa4"
--Terminal
myTerminal = "kitty"
--Browser
myBrowser = "firefox"
--Rofi
myLauncher = "rofi -show drun"
--PowerMenu
myPoweMenu = "$HOME/.config/rofi/power.sh"
--ScreenShoot
myScreenShootApp = "flameshot gui"
--Border Width
myBorderWidth = 3
--Workspaces
myWorkspaces =  [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]

----------------------------------------------------
-- CONFIG
----------------------------------------------------
myConfig = 
    bindNewKeys
    $ removeDefaultBinds 
    $ def
    {  modMask           = myModMask 
    , terminal           = myTerminal
    , borderWidth        = myBorderWidth
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , normalBorderColor  = colorNormal
	, focusedBorderColor = colorFocused
    , workspaces         = myWorkspaces
    }

----------------------------------------------------
-- BINDS
----------------------------------------------------
--Custom Maps
binds :: [((KeyMask, KeySym), X ())]
binds =     
    [ ((myModMask,   xK_q), kill)
    , ((myModMask,   xK_space),                 spawn myLauncher)
    , ((myModMask,   xK_p),                     spawn myPoweMenu)
    , ((    0    ,   xK_Print),                 spawn myScreenShootApp)
    , ((myModMask,   xK_Return),                spawn myTerminal)
    , ((myAppMask,   xK_f),                     spawn myBrowser)
    , ((myAppMask,   xK_t),                     spawn "telegram-desktop")
    , ((myAppMask,   xK_d),                     spawn "discord")
    , ((myAppMask,   xK_p),                     spawn "feh -g 1920x1080 -d -S filename $HOME/Picture")
    , ((myModMask,   xK_v),                     spawn "~/.config/xmonad/scripts/dunstvol up")
    , ((myModMask .|. shiftMask,   xK_v),       spawn "~/.config/xmonad/scripts/dunstvol down")
    ]

bindNewKeys :: XConfig bindConf -> XConfig bindConf
bindNewKeys conf = conf 
    `additionalKeys` binds


--  TODO: UNCOMMENT = DISABLE

--Def maps (for remove)
defaultBinds :: [((KeyMask, KeySym))]
defaultBinds = [ -- Action binds
                 (myModMask .|. shiftMask, xK_Return) -- terminal
               , (myModMask .|. shiftMask, xK_slash) -- xmessage with default keybindings (not work)
               , (myModMask, xK_p) -- launch dmenu
               , (myModMask .|. shiftMask, xK_p) -- launch gmrun
               , (myModMask .|. shiftMask, xK_c) -- close focused window
               , (myModMask .|. shiftMask, xK_q) -- quit xmonad
               , (myModMask, xK_q) -- restart xmonad
               , (myModMask, xK_space) -- change layout
               , (myModMask .|. shiftMask, xK_space) -- reset layout
               , (myModMask, xK_n) -- resize viewed windows to the correct size
               , (myModMask, xK_Tab) -- move focus to the next window
               , (myModMask .|. shiftMask, xK_Tab) -- move focus to the prev window
               , (myModMask, xK_m) -- move focus to the master window
               , (myModMask, xK_Return) -- swap the focused window and master
               , (myModMask, xK_t) -- push window back to tiling
               , (myModMask, xK_comma) -- increment the number of windows in the master area
               , (myModMask, xK_period) -- deincrement the number of windows in the master area
               ]
           
--REMOVE BINDS
removeDefaultBinds :: XConfig removeBindConf -> XConfig removeBindConf
removeDefaultBinds conf = conf
    `removeKeys` (filter (\k -> k `notElem` (map fst binds)) defaultBinds) -- remove standart keyboard binds

----------------------------------------------------
-- STARTUPHOOKS
----------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D"
    setDefaultCursor xC_left_ptr
    spawnOnce "$HOME/.config/xmonad/scripts/autostart"

----------------------------------------------------
-- LAYOUT
----------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

tall     = renamed [Replace "tall"]
           $ limitWindows 5
           $ smartBorders
           $ mySpacing 10
           $ ResizableTall 1 (3/100) (1/2) []
floats   = renamed [Replace "floats"]
           $ smartBorders
           $ simplestFloat

myLayoutHook =
    tall
    ||| floats
    ||| noBorders Full

----------------------------------------------------
-- MANAGEHOOKS
----------------------------------------------------
doCenteredFloat = doRectFloat $ W.RationalRect 0.25 0.25 0.5 0.5

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll [
               stringProperty "WM_WINDOW_ROLE" =? "GtkFileChooserDialog"    --> doCenteredFloat
             , isFullscreen                                                 --> doFullFloat
             , isDialog                                                     --> doCenteredFloat
             , resource                        =? "stalonetray"             --> doIgnore
             , className                       =? "Dialog"                  --> doCenteredFloat
             , className                       =? "feh"                     --> doFullFloat
             , className                       =? "firefox"                 --> doShift "2"

        ]

----------------------------------------------------
-- Bar
----------------------------------------------------
myPolybarPP :: PP
myPolybarPP = def
    {
     ppTitleSanitize   = xmobarStrip
    }

----------------------------------------------------
-- MAIN
----------------------------------------------------
main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . withEasySB (statusBarProp "polybar" (pure myPolybarPP)) defToggleStrutsKey
     $ myConfig
