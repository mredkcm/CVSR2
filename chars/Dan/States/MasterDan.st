; ___________________________________________________________
;| Ryu by Phantom.of.the.Server and Mwryly AND Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;====< MODE STATES >===
;====

;==< PALETTE MODE SELECTION >==
[Statedef 5900]
type = S
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
value = 0
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Character Palette 1 (LP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 1
fvar(0) = 1	;CHANGE THIS LINE
[State 5900, Character Palette 2 (MP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 2
fvar(0) = 2	;CHANGE THIS LINE
[State 5900, Character Palette 3 (HP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 3
fvar(0) = 3	;CHANGE THIS LINE
[State 5900, Character Palette 4 (LK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 4
fvar(0) = 4	;CHANGE THIS LINE
[State 5900, Character Palette 5 (MK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 5
fvar(0) = 5	;CHANGE THIS LINE
[State 5900, Character Palette 6 (HK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 6
fvar(0) = 6	;CHANGE THIS LINE
[State 5900, Character Palette 7 (start + LP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 7
fvar(0) = 13	;CHANGE THIS LINE
[State 5900, Character Palette 8 (start + MP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 8
fvar(0) = 14	;CHANGE THIS LINE
[State 5900, Character Palette 9 (start + HP)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 9
fvar(0) = 9	;CHANGE THIS LINE
[State 5900, Character Palette 10 (start + LK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 10
fvar(0) = 16	;CHANGE THIS LINE
[State 5900, Character Palette 11 (start + MK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 11
fvar(0) = 17	;CHANGE THIS LINE
[State 5900, Character Palette 12 (start + HK)]
type = VarSet
triggerall = !roundsexisted
trigger1 = PalNo = 12
fvar(0) = 18	;CHANGE THIS LINE

[State 5900, modevar]
type = varset
trigger1 = !roundsexisted
var(1) = 3
[State 5900, End]
type = changestate
trigger1 = !time
value = 5901
