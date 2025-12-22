; ________________________________________
;| Gouki by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;====< MODE STATES >===
;====

;==< PALETTE MODE SELECTION >==
[Statedef 5900]
type = S
[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
value = 0

[State 5900, Float VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
fvalue = 0

[State 5900, Mode Detection]
type = VarSet
trigger1 = 1
var(1) = ifElse((PalNo > 6), 1, 0)
ignoreHitPause = 1

[State 5900, Configuration]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 7800
ID = 7800
name = "Configuration Helper"
posType = P1

[State 5900, turnsintro]
type = changestate
trigger1 = !time && teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900
[State 5900, End]
type = changestate
trigger1 = !time
value = ifelse(roundno = 1, 190, 0)
