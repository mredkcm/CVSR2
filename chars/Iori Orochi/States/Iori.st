; _________________________________________
;| Iori Yagami by Knuckles8864             |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===<INITIALIZE>===
;==
[StateDef 5900]
type = S

[state 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

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
var(40) = ifElse((PalNo > 6), 1, 0)
ignoreHitPause = 1

[State 5900, End]
type = ChangeState
trigger1 = 1
value = 5901
