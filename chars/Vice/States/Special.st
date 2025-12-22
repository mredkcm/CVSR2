; _________________________________________
;| Vice by Jmorphman                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<GOREFEST>=
;Attempt
[StateDef 1000]
type = S
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1000, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 1000, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 1010

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[StateDef 1010]
type = S
physics = N
moveType = A
anim = ifElse(PrevStateNo = 1030, 1040, 1010)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1010, EX Flash]
type = VarSet
trigger1 = !Time && PrevStateNo = 1030
var(25) = 86

[State 1010, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1010, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = ifElse(PrevStateNo = 1030, 1045, 1015)

[State 1010, Width]
type = Width
trigger1 = AnimElemTime(9) < 0
edge = 32,0
ignoreHitPause = 1

[State 1010, Width]
type = Width
trigger1 = AnimElemTime(9) >= 0
edge = 64,0
ignoreHitPause = 1

[State 1010, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,0
channel = 0

[State 1010, Skid Sound]
type = PlaySnd
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = AnimElemTime(7) % 11 = 0
value = 1000,1
channel = 4

[State 1010, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 5

[State 1010, Arm Overlay]
type = Explod
trigger1 = AnimElem = 7
anim = 11010 + 30 * (PrevStateNo = 1030)
sprPriority = 3
bindTime = -1
posType = P1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1010, Dust Helper]
type = Helper
triggerAll = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = !(AnimElemTime(7) % 3)
trigger1 = FrontEdgeBodyDist > 30
trigger2 = FrontEdgeBodyDist <= 30
trigger2 = !(AnimElemTime(12) % 11)
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 2, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1010, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 8

[State 1010, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 7.03125

[State 1010, VelMul]
type = VelMul
Trigger1 = AnimElemTime(8) > 0
x = 0.9375

[State 1010, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 40,0

[State 1010, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 17,-89

[State 1010, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -15,-121

[State 1010, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-118

[State 1010, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -32, -110

[State 1010, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = -30, -59

[State 1010, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = Time % 4 = [0,3]
pos = 0, -10

[State 1010, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = Time % 8 = [3,7]
pos = 0, -12

[State 1010, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = 48, -24

[State 1010, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) = 0
pos = 41, 0

[State 1010, Blood (Additive)]
type = Explod
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = AnimElemTime(7) % 5 = 0
anim = 8052
sprPriority = 3
posType = P1
pos = 0, -13
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, Blood (Subtractive)]
type = Explod
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = AnimElemTime(7) % 5 = 0
anim = 8062
sprPriority = 3
posType = P1
pos = 0, -13
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, Blood 2 (Additive)]
type = Explod
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = AnimElemTime(7) % 5 = 2
anim = 8053
sprPriority = 3
posType = P1
pos = 0, -13
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, Blood 2 (Subtractive)]
type = Explod
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = AnimElemTime(7) % 5 = 2
anim = 8063
sprPriority = 3
posType = P1
pos = 0, -13
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, Sliding Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
trigger1 = Time % 8 = 3
value = floor(ifElse(7 * fvar(11) < 7, -7, -7 * fvar(11)))
kill = 0

[State 1010, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9 && PrevStateNo != 1030
value = floor(ifElse(91 * fvar(11) < 7, -7, -91 * fvar(11)))

[State 1010, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9 && PrevStateNo = 1030
value = floor(ifElse(84 * fvar(11) < 7, -7, -84 * fvar(11)))

[State 1010, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 9
value = 36

[State 1010, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && !var(20) && PrevStateNo != 1030
value = ifElse(!var(13), 72, 36)

[State 1010, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 9
value = 1

[State 1010, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(13) = 1

[State 1010, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(15) = 1
ignoreHitPause = 1

[State 1010, TargetState]
type = TargetState
trigger1 = AnimElem = 9 && NumTarget
value = 1016

[State 1010, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1010, Tranquility]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(9) >= 0 && AnimElemTime(15) < 0
triggerAll = PrevStateNo = 1030
trigger1 = !AILevel
trigger1 = command = "Tranquility"
trigger2 = AILevel && !var(14)
var(14) = 1050

[State 1040, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(15) < 0
value = var(14)

[State 1010, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Gorefest (Target)
[StateDef 1015]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1015, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1015

[State 1015, SprPriority]
type = SprPriority
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
value = 2

[State 1015, SprPriority]
type = SprPriority
trigger1 = AnimElem = 5
value = 0

[State 1015, Jesuszilla made me do this]
type = PlaySnd
trigger1 = AnimElem = 7 && Name = "Trouble Maker!"
value = 191,1
channel = 0

[State 1015, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1016]
type = A
physics = N
moveType = H
ctrl = 0
velSet = -1.5,-11.5
sprPriority = 0

[State 1016, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5061)
value = 5061

[State 1016, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5061)
value = 5050

[State 1016, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1016, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 1016, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1016, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1016, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<EX GOREFEST>=
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1030
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 14

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -75
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1030, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 3

[State 1030, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 1010

[State 1030, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1030, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX Gorefest (Target)
[StateDef 1045]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1045, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1045

[State 1045, SprPriority]
type = SprPriority
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
value = 2

[State 1045, SprPriority]
type = SprPriority
trigger1 = AnimElem = 5
value = 0

[State 1045, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1



;====<TRANQUILITY>=
;Attempt
[StateDef 1050]
type = S
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1050, EX Flash]
type = VarSet
trigger1 = !Time && PrevStateNo = 1010
var(25) = 24

[State 1050, EX Flash Off]
type = VarSet
trigger1 = PrevStateNo = 1430
var(25) = 0

[State 1050, Voice]
type = PlaySnd
trigger1 = !Time && PrevStateNo = 1010
value = 4,0
channel = 0

[State 1050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 1

[State 1050, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1050, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -9

[State 1050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.47

[State 1050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1050, HitDef]
type = HitDef
trigger1 = (!var(16) || PrevStateNo = 1430) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
attr = A, ST
hitFlag = MAF
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
hitSound = -1 + 0 * (var(31) := -1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = ifElse(PrevStateNo = 1010, 1060, 1320)

[State 1050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1051


;Landing (Failure)
[StateDef 1051]
type = S
anim = 57
physics = N
moveType = I
velSet = 0,0

[State 1051, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1051, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1051, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1051, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[StateDef 1060]
type = A
physics = N
moveType = A
anim = 1060
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1060, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 100

[State 1060, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 41

[State 1060, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1065

[State 1060, Width]
type = Width
trigger1 = 1
edge = 32,0
ignoreHitPause = 1

[State 1060, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1060,0
channel = 0

[State 1060, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 1060, Grab Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 4

[State 1060, VelSet]
type = VelSet
trigger1 = !Time
y = -8

[State 1060, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.47

[State 1060, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 38,-58

[State 1060, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 35,-60

[State 1060, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 36,-62

[State 1060, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 55,-45

[State 1060, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 58, -68

[State 1060, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 26, -110

[State 1060, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = -7, -122

[State 1060, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = -23, -103

[State 1060, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = -33, -30

[State 1060, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0
pos = 0, -10

[State 1060, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1060, Super Cancel to (MAX) Overkill]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) < 0 && power >= 1000
trigger1 = !AILevel
trigger1 = command = "Overkill" || command = "MAXOverkill"
trigger2 = AILevel && Random < (25 * (AILevel ** 2 / 64.0)) && !var(14)
var(14) = ifElse((command = "MAXOverkill" && power >= 2000) || (AILevel && power >= 2000), 3251, 3201)

[State 1060, Followup]
type = ChangeState
trigger1 = var(14) = [3000,3999]
trigger1 = AnimElemTime(4) < 0
value = var(14)

[State 1060, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1061


;Landing
[StateDef 1061]
type = S
anim = 1061
physics = N
moveType = I
velSet = 0,0

[State 1061, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1061, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 9

[State 1061, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1061, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1066

[State 1061, Width]
type = Width
trigger1 = 1
edge = 32,64
ignoreHitPause = 1

[State 1061, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 1061, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
ownPal = 1

[State 1061, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1061, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 0, -10

[State 1061, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(35 * fvar(11) < 7, -7, -35 * fvar(11)))

[State 1061, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1061, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1061, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 1061, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 1061, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 1061, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = -4.5
y = -3.5

[State 1061, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.4

[State 1061, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1061, TargetState]
type = TargetState
trigger1 = AnimElem = 7 && NumTarget
value = 1067

[State 1061, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1062


;Landing (Success)
[StateDef 1062]
type = S
anim = 1062
physics = N
moveType = A
velSet = 0,0

[State 1062, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1062, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = 11,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1062, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1062, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = -9

[State 1062, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = -24

[State 1062, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Tranquility (Target)
[StateDef 1065]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1065, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1065

[State 1065, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Being Slammed on the Ground
[StateDef 1066]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1066, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1066

[State 1066, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1067]
type = A
physics = N
movetype = H
ctrl = 0
velSet = ifElse(PrevStateNo = 3169, 4, -4),-4

[State 1067, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 1067, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1


[State 1067, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 1067, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1067, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1067, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<DEICIDE>=
[StateDef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 200, 2, 0)

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1102, ifElse(var(10) = 1, 1101, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Snake Arms Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,1
channel = 1

[State 1100, VelSet]
type = VelSet
trigger1 = var(10)
trigger1 = AnimElem = 6
x = ifElse(var(10) = 2, 5.9582672119140625, 2.979133605957031)

[State 1100, VelMul]
type = Velmul
trigger1 = AnimElemTime(6) > 0 && var(10)
x = 0.9166566363024066

[State 1100, VelSet]
type = VelSet
trigger1 = var(10)
trigger1 = AnimElem = 8
x = 0

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
getPower = 0,0
givePower = 0,0
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.cornerPush.velOff = 0
guard.hitTime = 18
guard.slideTime = 18
guard.velocity = -12.64
guard.cornerPush.velOff = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 175), var(36) := -41
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
numHits = 0
p1StateNo = 1110
p2Facing = 1

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1110]
type = S
physics = N
moveType = A
anim = 1110
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1110, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1110, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1115

[State 1110, Width]
type = Width
trigger1 = AnimElemTime(3) < 0
edge = 32,0
ignoreHitPause = 1

[State 1100, VarSet]
type = VarSet
trigger1 = !Time
var(12) = ceil(P2Dist x)

[State 1110, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = var(12),0

[State 1110, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(var(12) / 1.5),-20

[State 1110, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = var(12) / 4,-87

[State 1110, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -3,-121

[State 1110, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) = 0
pos = -20,-141

[State 1110, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5
value = floor(ifElse(ifElse(var(10) = 2, 84, ifElse(var(10), 77, 70)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -84, ifElse(var(10), -77, -70)) * fvar(11)))

[State 1110, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 1110, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5
value = ifElse(!var(13), 72, 36)

[State 1110, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 1110, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 1110, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 1110, TargetState]
type = TargetState
trigger1 = AnimElem = 5
value = 1116

[State 1110, Turn]
type = Turn
trigger1 = !AnimTime

[State 1110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Deicide Target)
[StateDef 1115]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 2

[State 1115, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1115

[State 1115, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1116]
type = A
physics = N
movetype = H
ctrl = 0
velSet = 8.5,-3.5

[State 1116, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1116, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.45

[State 1116, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1116, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1116, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<EX DEICIDE>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1130
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 21

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 5, -75
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1130,0
channel = 0

[State 1130, Snake Arms Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,1
channel = 3

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
ID = 1130
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
getPower = 0,0
givePower = 0,0
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
guard.hitTime = 18
guard.slideTime = 18
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 175), var(36) := -41
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
numHits = 0
p1StateNo = 1139
p2Facing = 1

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success (Startup)
[StateDef 1139]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1139, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,1
ignoreHitPause = 1

[State 1139, ChangeAnim]
type = ChangeAnim
trigger1 = AnimElemTime(7) < 0
value = 1130
elem = 7

[State 1139, EX Flash]
type = VarSet
trigger1 = 1
var(25) = 2

[State 1139, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1144

[State 1139, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = P2Dist x,0

[State 1139, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1139, TargetVelSet]
type = TargetVelSet
trigger1 = Time = 1 && NumTarget
trigger1 = Target, FrontEdgeBodyDist > abs((186 - P2Dist x) / (23 + AnimTime))
trigger1 = Target, BackEdgeBodyDist > abs((186 - P2Dist x) / (23 + AnimTime))
x = (186 - P2Dist x) / (23 + AnimTime)
ID = 1130

[State 1139, VelSet]
type = VelSet
triggerAll = Time = 1 && NumTarget
trigger1 = Target, FrontEdgeBodyDist <= abs((186 - P2Dist x) / (23 + AnimTime))
trigger2 = Target, BackEdgeBodyDist <= abs((186 - P2Dist x) / (23 + AnimTime))
x = (186 - P2Dist x) / (23 + AnimTime)

;[State 1139, VelSet]
;type = VelSet
;trigger1 = Time > 1 && NumTarget
;trigger1 = Target, BackEdgeBodyDist <= 0
;x = (186 - P2Dist x) / (23 + AnimTime)

[State 1139, VelSet]
type = VelSet
trigger1 = Time = 1 && NumTarget
trigger1 = Target, BackEdgeBodyDist < (186 - P2Dist x)
x = ((186 - P2Dist x) - Target, BackEdgeBodyDist)/ (23 + AnimTime)

[State 1139, ChangeState]
type = ChangeState
trigger1 = AnimElem = 10
value = 1140


;Success
[StateDef 1140]
type = S
physics = N
moveType = A
anim = 1140
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1140, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1140, EX Flash]
type = VarSet
trigger1 = AnimElemTime(3) < 0
var(25) = 3

[State 1140, Width]
type = Width
trigger1 = AnimElemTime(11) < 0
edge = 186,0
ignoreHitPause = 1

[State 1140, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1140, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1145

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 186,0

[State 1140, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 101,0
channel = 4

[State 1140, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1140, TargetVelSet]
type = TargetVelSet
trigger1 = AnimElem = 2 && NumTarget
x = 11
ID = 1130

[State 1140, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1140, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1140, VarAdd]
type = VarAdd
trigger1 = NumTarget && !Time
var(42) = 1

[State 1140, TargetState]
type = TargetState
triggerAll = NumTarget
triggerAll = Target(1130), StateNo = 1145
triggerAll = Target(1130), Time > 5
trigger1 = AnimElem = 11
trigger2 = P2Dist x <= 30 && AnimElemTime(4) >= 0
value = 1146
persistent = 1

[State 1140, ChangeAnimElem]
type = ChangeAnim
triggerAll = NumTarget
trigger1 = AnimElemTime(11) < 0
trigger1 = Target(1130), StateNo = 1146
value = 1140
elem = 11

[State 1140, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target (Startup)
[StateDef 1144]
type = S
moveType = H
physics = N

[State 1144, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1144, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 1144, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1144, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5017


;Target
[StateDef 1145]
type = S
moveType = H
physics = N

[State 1145, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1145, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 1145


;Target (After Throw)
[StateDef 1146]
type = S
physics = N
moveType = H
ctrl = 0
velset = 0,0
sprPriority = 0

[State 1146, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1146, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5017

[State 1146, SelfState]
type = SelfState
trigger1 = Time >= 20
value = 0
ctrl = 1



;=<DEICIDE SLAYER>==
;Attempt
[StateDef 1200]
type = S
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 0

[State 1200, Button Detect]
type = VarSet
triggerAll = !Time
trigger1 = PrevStateNo = [1400,1430]
trigger2 = var(11)
var(10) = 3

[State 1200, EX Flash Off]
type = VarSet
trigger1 = PrevStateNo = 1430
var(25) = 0

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1202, ifElse(var(10) = 1, 1201, 1200))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo = [1400,1430]
value = 1250

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4,1
channel = 0

[State 1200, Snake Arms Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 1

[State 1200, HitDef]
type = HitDef
trigger1 = (!var(16) || PrevStateNo = 1430) && (var(15) < 1 + (var(10) = 3) || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = AF
guardFlag = M
priority = 4, Hit
getPower = 0,0
givePower = 0,0
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 125), var(36) := -168
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
numHits = 0
p1StateNo = 1210
p2Facing = 1

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1210]
type = S
physics = N
moveType = A
anim = 1210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1210, EX Flash]
type = VarSet
trigger1 = !Time && PrevStateNo = 1230
var(25) = 14

[State 1210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1215

[State 1210, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1210, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1061,0
channel = 3

[State 1210, Width]
type = Width
trigger1 = AnimElemTime(3) < 0
edge = 32,0
ignoreHitPause = 1

[State 1210, Impact Dust]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = -12,0
ownPal = 1

[State 1210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 104,-145

[State 1210, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) = 0
pos = -12,0

[State 1210, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3 && PrevStateNo != 1230 && var(10) < 3
value = floor(ifElse(ifElse(var(10) = 2, 98, ifElse(var(10), 91, 84)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -98, ifElse(var(10), -91, -84)) * fvar(11)))

[State 1210, Damage (EX)]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3 && PrevStateNo = 1230 && var(10) != 3
value = floor(ifElse(112 * fvar(11) < 7, -7, -112 * fvar(11)))

[State 1210, Damage (From Mayhem)]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3 && var(10) = 3
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))

[State 1210, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 1210, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 3 && !var(20) && PrevStateNo != 1230
value = ifElse(!var(13), 72, 36)

[State 1210, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 1210, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 1210, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 1210, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 14
ampl = -4
freq = 120

[State 1210, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 3
value = 1216

[State 1210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 16

[State 1210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = -10

[State 1210, Turn]
type = Turn
trigger1 = !AnimTime

[State 1210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Deicide Slayer (Target)
[StateDef 1215]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1215, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1215

[State 1215, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1216]
type = A
physics = N
movetype = H
ctrl = 0
velSet = 4.5,-6.5

[State 1216, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 1216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1216, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 1216, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1216, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1216, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<EX DEICIDE SLAYER>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 21

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(var(11), 3, 0)

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -22, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4,1
channel = 0

[State 1230, Snake Arms Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 4

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = AF
priority = 4, Hit
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 125), var(36) := -168
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
numHits = 0
p1StateNo = 1210
p2Facing = 1

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<BLACKEND>=
;Attempt
[StateDef 1300]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1300, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 1300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 1300, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 1310

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[StateDef 1310]
type = S
physics = N
moveType = A
anim = 1310
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1310, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1315

[State 1310, Width]
type = Width
trigger1 = AnimElemTime(7) < 0
edge = 32,0
ignoreHitPause = 1

[State 1310, Width]
type = Width
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(26) < 0
edge = 84,0
ignoreHitPause = 1

[State 1310, Voice]
type = PlaySnd
trigger1 = !Time
value = 1310,0
channel = 0

[State 1310, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1061,0
channel = 3

[State 1310, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 1310, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 26
value = 1,5
channel = 4

[State 1310, Arm Overlay]
type = Explod
trigger1 = AnimElem = 24
anim = 11310
sprPriority = 3
bindTime = -1
posType = P1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1310, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 40,0

[State 1310, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 25,-125

[State 1310, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -13,-128

[State 1310, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -16,-120

[State 1310, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -18, -118

[State 1310, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 20, -108

[State 1310, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(15) < 0
pos = 80, -5

[State 1310, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
pos = 64, 7

[State 1310, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
pos = 49, -17

[State 1310, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
pos = 39, -49

[State 1310, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
pos = 40, 0

[State 1310, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
pos = 17,-89

[State 1310, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
pos = -15,-121

[State 1310, TargetBind 14]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
pos = -25,-118

[State 1310, TargetBind 15]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
pos = -32, -110

[State 1310, TargetBind 16]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
pos = -30, -59

[State 1310, TargetBind 17]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(24) >= 0 && AnimElemTime(25) < 0
pos = 0, -12

[State 1310, TargetBind 18]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(25) >= 0 && AnimElemTime(26) < 0
pos = 48, -24

[State 1310, TargetBind 19]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(26) = 0
pos = 41, 0

[State 1310, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 0

[State 1310, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 26
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))

[State 1310, TargetPowerAdd]
type = TargetPowerAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 26
value = 36 / 2

[State 1310, Power]
type = PowerAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 26
value = ifElse(!var(13), 72, 36) / 2

[State 1310, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 26
value = 1

[State 1310, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 26
var(13) = 1

[State 1310, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 26
var(15) = 1
ignoreHitPause = 1

[State 1310, TargetState]
type = TargetState
trigger1 = AnimElem = 26 && NumTarget
value = 1016

[State 1310, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7 && NumTarget
time = 14
ampl = -4
freq = 120

[State 1310, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1310, Misanthrope]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(26) >= 0 && AnimElemTime(32) < 0
trigger1 = !AILevel
trigger1 = command = "Misanthrope"
trigger2 = AILevel && !var(14)
var(14) = 1050

[State 1310, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(26) >= 0 && AnimElemTime(32) < 0
value = var(14)

[State 1310, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Blackend (Target)
[StateDef 1315]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1315, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1315

[State 1315, SprPriority]
type = SprPriority
trigger1 = AnimElem = 14
trigger2 = AnimElem = 19
value = 2

[State 1315, SprPriority]
type = SprPriority
trigger1 = AnimElem = 17
value = 0

[State 1315, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1



;====<MISANTHROPE>=
[StateDef 1320]
type = S
physics = N
moveType = A
anim = 1320
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1050, EX Flash Off]
type = VarSet
trigger1 = PrevStateNo = 1430
var(25) = 0

[State 1320, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 41

[State 1320, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1325

[State 1320, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1320,0
channel = 0

[State 1320, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 1

[State 1320, Grab Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 4

[State 1320, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5
y = -4.5

[State 1320, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = 0.47

[State 1320, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1320, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) < 0
pos = 40,-118

[State 1320, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 15,-135

[State 1320, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = -22,-138

[State 1320, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = -25,-133

[State 1320, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = -26,-130

[State 1320, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0
pos = 12,-120

[State 1320, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1320, Super Cancel to (MAX) Overkill]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(9) < 0 && power >= 1000
trigger1 = !AILevel
trigger1 = command = "Overkill" || command = "MAXOverkill"
trigger2 = AILevel && Random < (25 * (AILevel ** 2 / 64.0)) && !var(14)
var(14) = ifElse((command = "MAXOverkill" && power >= 2000) || (AILevel && power >= 2000), 3251, 3201)

[State 1320, Followup]
type = ChangeState
trigger1 = var(14) = [3000,3999]
trigger1 = AnimElemTime(9) < 0
value = var(14)

[State 1320, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1321


;Landing
[StateDef 1321]
type = S
anim = 1321
physics = N
moveType = I
velSet = 0,0

[State 1321, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1321, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1321, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1326

[State 1321, Width]
type = Width
trigger1 = AnimElemTime(8) < 0
edge = 84,0
ignoreHitPause = 1

[State 1321, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 1321, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 1321, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1321, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) < 0
pos = 80, -5

[State 1321, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(35 * fvar(11) < 7, -7, -35 * fvar(11)))

[State 1321, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1310, Power]
type = PowerAdd
trigger1 = NumTarget && !Time
value = ifElse(!var(13), 72, 36)

[State 1321, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1321, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 1321, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 1321, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 1321, TargetState]
type = TargetState
trigger1 = AnimElem = 8 && NumTarget
value = 1067

[State 1321, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Misanthrope (Target)
[StateDef 1325]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 2

[State 1325, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1325

[State 1325, SprPriority]
type = SprPriority
trigger1 = AnimElem = 2
value = 0

[State 1325, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1


;Being Slammed on the Ground
[StateDef 1326]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1326, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1326

[State 1326, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



;====<NAILBOMB>=
;Attempt
[StateDef 1330]
type = S
physics = S
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 19

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 2, -77
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1330, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1330, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA


[State 1330, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 1340

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1330, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[StateDef 1340]
type = S
physics = N
moveType = A
anim = 1340
ctrl = 0
svelSet = 0,0
sprPriority = 1

[State 1340, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 39

[State 1340, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1340, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1345

[State 1340, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,0
channel = 0

[State 1340, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1061,0
channel = 3

[State 1340, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 1340, Orochi Pillar Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3125,0
channel = 1

[State 1340, Orochi sparkle]
type = Explod
trigger1 = AnimElem = 9
anim = 1355
sprPriority = 5
pos = 40,18
posType = P1
vel = 0,-4
scale = 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 1340, Orochi sparkle]
type = Explod
trigger1 = AnimElem = 9
anim = 1355
sprPriority = 5
pos = 112,-18
posType = P1
vel = 0,-4
scale = 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 1340, Orochi Pillar]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3125
ID = 3125
name = "Orochi Skull"
posType = P1
pos = 80,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 1340, Width]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 32,0
ignoreHitPause = 1

[State 1340, Width]
type = Width
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(14) < 0
edge = 94,0
ignoreHitPause = 1

[State 1340, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 40,0

[State 1340, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 25,-125

[State 1340, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -13,-128

[State 1340, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -16,-120

[State 1340, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -18, -118

[State 1340, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 20, -108

[State 1340, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) = 0
pos = 68, 0

[State 1340, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7
value = floor(ifElse(147 * fvar(11) < 7, -7, -147 * fvar(11)))

[State 1340, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 7
value = 36

[State 1340, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 7
value = 1

[State 1340, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(13) = 1

[State 1340, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(15) = 1
ignoreHitPause = 1

[State 1340, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 7
time = 14
ampl = -4
freq = 120

[State 1340, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 7
value = 1346

[State 1340, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Nailbomb (Target)
[StateDef 1345]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1345, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1345

[State 1345, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1346]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -4, -7.5

[State 1346, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1346, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 1346, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 1346, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1346, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1346, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<MAYHEM>=
[StateDef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 100, 2, ifElse(P2Dist x > 88, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,2
channel = 0

[State 1400, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 1400, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Mayhem Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 5.89373779296875

[State 1400, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) >= 1
x = 0.8583230636993465

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -11.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -11.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1400, Deicide Slayer]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "DeicideSlayer"
trigger2 = AILevel && !var(14) && FrontEdgeDist >= 40
var(14) = 1200

[State 1400, Misanthrope]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "Misanthrope"
trigger2 = AILevel && !var(14)
var(14) = 1050

[State 1400, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = MoveHit
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(11) < 0
value = var(14)

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MAYHEM>=
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 32

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 12, -55
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,2
channel = 0

[State 1430, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 1430, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 4

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Mayhem Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 14.8665771484375

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 1
x = 9.5

[State 1430, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) >= 1
x = 0.8583230636993465

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1430, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 1430
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -12.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(11)
var(15) = 0

[State 1430, VarAdd]
type = VarAdd
trigger1 = MoveHit
var(11) = 1
persistent = 0

[State 1430, Juggle Flag]
type = VarSet
trigger1 = var(11) = 2
var(16) = 1

[State 1430, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1430, Deicide Slayer]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "DeicideSlayer"
trigger2 = AILevel && !var(14) && FrontEdgeDist >= 40
trigger2 = var(11) < 2
var(14) = 1200

[State 1430, Misanthrope]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "Misanthrope"
trigger2 = AILevel && !var(14)
trigger2 = var(11) < 2
var(14) = 1050

[State 1430, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = MoveHit
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(11) < 0
value = var(14)

[State 1430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<OUTRAGE>==
;Startup
[StateDef 1500]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 0

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,0
channel = 0

[State 1500, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0

[State 1500, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 4.5
y = -3

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.45

[State 1500, ChangeState]
type = ChangeState
trigger1 = !AnimTime && var(10) != 2
value = 1501

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1501

;Attack
[StateDef 1501]
type = S
anim = ifElse(!var(10), 1501, ifElse(var(10) = 1, 1511, 1521))
physics = N
moveType = A
velSet = 0,0

[State 1501, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1501, Landing Dust Explod]
type = Explod
trigger1 = !Time && var(10) = 2
anim = 8102
sprPriority = -3
posType = P1
pos = -25,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1501, Landing Sound]
type = PlaySnd
trigger1 = !Time && var(10) = 2
value = 52,0

[State 1501, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1500,0
channel = 0

[State 1501, Kick Slash Sound 1]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = var(10)
trigger2 = AnimElem = 16
trigger3 = var(10) = 2
trigger3 = AnimElem = 22
value = 1500,1
channel = 1

[State 1501, Kick Slash Sound 2]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 12
trigger2 = var(10)
trigger2 = AnimElem = 18
trigger3 = var(10) = 2
trigger3 = AnimElem = 24
value = 1500,1
channel = 3

[State 1501, Kick Slash Sound 3]
type = PlaySnd
trigger1 = AnimElem = 8 || AnimElem = 14
trigger2 = var(10)
trigger2 = AnimElem = 20
trigger3 = var(10) = 2
trigger3 = AnimElem = 26
value = 1500,1
channel = 4

[State 1501, Slash FX]
type = Explod
trigger1 = AnimElem = 4
ID = 1505
anim = 1505 + 10 * var(10)
bindtime = -1
sprPriority = 3
posType = P1
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1501, Leg FX]
type = Explod
trigger1 = AnimElem = 5
ID = 1504
anim = 1504 + 10 * var(10)
bindtime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1501, Hit 1/4/7/10]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = AnimElem = 16 && var(10)
trigger3 = AnimElem = 22 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1501, Hit 2/5/8/11]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6 || AnimElem = 12
trigger2 = AnimElem = 18 && var(10)
trigger3 = AnimElem = 24 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -27
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1501, Hit 3/6/9/12]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14
trigger2 = AnimElem = 20 && var(10)
trigger3 = AnimElem = 26 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1501, Blood (Additive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 1, 3)
trigger1 = MoveHit = 1 && NumTarget
anim = 8050
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1501, Blood (Subtractive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 1, 3)
trigger1 = MoveHit = 1 && NumTarget
anim = 8060
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1501, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX OUTRAGE>=
;Startup
[StateDef 1530]
type = S
physics = N
movetype = A
anim = 1530
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1530, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1530, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 37

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -38, -80
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 5

[State 1530, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1531


;Attack
[StateDef 1531]
type = S
anim = 1531
physics = N
moveType = A
velSet = 0,0

[State 1531, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1500,0
channel = 0

[State 1531, Kick Slash Sound 1]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = AnimElem = 16
trigger3 = AnimElem = 22 || AnimElem = 28
value = 1500,1
channel = 1

[State 1531, Kick Slash Sound 2]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 12
trigger2 = AnimElem = 18
trigger3 = AnimElem = 24 || AnimElem = 30
value = 1500,1
channel = 3

[State 1531, Kick Slash Sound 3]
type = PlaySnd
trigger1 = AnimElem = 8 || AnimElem = 14
trigger2 = AnimElem = 20
trigger3 = AnimElem = 26 || AnimElem = 32
value = 1500,1
channel = 4

[State 1531, Slash FX]
type = Explod
trigger1 = AnimElem = 4
ID = 1505
anim = 1535
bindtime = -1
sprPriority = 3
posType = P1
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1531, Leg FX]
type = Explod
trigger1 = AnimElem = 5
ID = 1504
anim = 1534
bindtime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1531, Hit 1/4/7/10]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = AnimElem = 16
trigger3 = AnimElem = 22
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1531, Hit 2/5/8/11]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6 || AnimElem = 12
trigger2 = AnimElem = 18
trigger3 = AnimElem = 24
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -27
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1531, Hit 3/6/9/12]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14
trigger2 = AnimElem = 20
trigger3 = AnimElem = 26
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1531, Blood (Additive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 1, 3)
trigger1 = MoveHit = 1 && NumTarget
anim = 8050
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1531, Blood (Subtractive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 1, 3)
trigger1 = MoveHit = 1 && NumTarget
anim = 8060
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1531, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<RAVENOUS>==
[StateDef 1600]
type = A
physics = N
moveType = A
anim = 1600
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 0

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1600, ifElse(var(10) = 1, 1610, 1620))

[State 1600, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(3) < 0
value = 1

[State 1600, Gravity]
type = Gravity
trigger1 = AnimElemTime(3) > 0

[State 1600, Voice]
type = PlaySnd
trigger1 = !Time
value = 1600,0
channel = 0

[State 1600, Kick Slash Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 9 || AnimElem = 15 || AnimElem = 21
trigger2 = AnimElem = 27 && var(10)
trigger3 = AnimElem = 33 && var(10) = 2
value = 1500,1
channel = 1

[State 1600, Kick Slash Sound 2]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 11 || AnimElem = 17 || AnimElem = 23
trigger2 = AnimElem = 29 && var(10)
trigger3 = AnimElem = 35 && var(10) = 2
value = 1500,1
channel = 3

[State 1600, Kick Slash Sound 3]
type = PlaySnd
trigger1 = AnimElem = 7 || AnimElem = 13 || AnimElem = 19
trigger2 = AnimElem = 25 && var(10)
trigger3 = AnimElem = 31 && var(10) = 2
value = 1500,1
channel = 4

[State 1600, Slash FX]
type = Explod
trigger1 = AnimElem = 3
ID = 1505
anim = 1605 + 10 * var(10)
bindtime = -1
sprPriority = 3
posType = P1
pos = 22, -8
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1600, Leg FX]
type = Explod
trigger1 = AnimElem = 4
ID = 1504
anim = 1604 + 10 * var(10)
bindtime = -1
sprPriority = 2
posType = P1
pos = 22, -8
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1600, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(44) = 1

[State 1600, HitDef (Mid)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 3 || AnimElem = 9 || AnimElem = 15 || AnimElem = 21
trigger2 = AnimElem = 27 && var(10)
trigger3 = AnimElem = 33 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, HitDef (Low)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 5 || AnimElem = 11 || AnimElem = 17 || AnimElem = 23
trigger2 = AnimElem = 29 && var(10)
trigger3 = AnimElem = 35 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, HitDef (High)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 13 || AnimElem = 19
trigger2 = AnimElem = 25 && var(10)
trigger3 = AnimElem = 31 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, Blood (Additive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 0, 1)
trigger1 = MoveHit = 1 && NumTarget
anim = 8050
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1600, Blood (Subtractive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 0, 1)
trigger1 = MoveHit = 1 && NumTarget
anim = 8060
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1601

;Landing
[StateDef 1601]
type = S
anim = 1601
physics = N
moveType = I
velSet = 0,0

[State 1601, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1601, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1601, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1601, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1601, Remove Ravenous Leg FX]
type = RemoveExplod
trigger1 = !Time
ID = 1504

[State 1601, Remove Ravenous Slash FX]
type = RemoveExplod
trigger1 = !Time
ID = 1505

[State 1600, Slash FX]
type = Explod
trigger1 = !Time && PrevStateNo = 1630
anim = 1636
bindtime = -1
sprPriority = 3
posType = P1
pos = 22, -8
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1601, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX RAVENOUS>=
[StateDef 1630]
type = A
physics = N
moveType = A
anim = 1630
ctrl = 0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1630, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1630, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1630, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 100

[State 1630, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -4, -87
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(3) < 0
value = 1

[State 1630, Gravity]
type = Gravity
trigger1 = AnimElemTime(3) > 0

[State 1630, Voice]
type = PlaySnd
trigger1 = !Time
value = 1600,0
channel = 0

[State 1630, Kick Slash Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 9
value = 1500,1
channel = 3

[State 1630, Kick Slash Sound 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1500,1
channel = 4

[State 1630, Kick Slash Sound 3]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1500,1
channel = 5

[State 1630, Slash FX]
type = Explod
trigger1 = AnimElem = 3
ID = 1505
anim = 1635
bindtime = -1
sprPriority = 3
posType = P1
pos = 22, -8
removeTime = -1
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1630, Leg FX]
type = Explod
trigger1 = AnimElem = 4
ID = 1504
anim = 1634
bindtime = -1
sprPriority = 2
posType = P1
pos = 22, -8
removeTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1630, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(44) = 1

[State 1630, HitDef (Mid)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 3 || AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, HitDef (Low)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, HitDef (High)]
type = HitDef
triggerAll = !var(16) && (var(15) < ifElse(var(15) < 1, 1, (7 - var(44))) || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 2, 1)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1630, Blood (Additive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 0, 1)
trigger1 = MoveHit = 1 && NumTarget
anim = 8050
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1630, Blood (Subtractive)]
type = Explod
trigger1 = HitPauseTime = ifElse(var(20), 0, 1)
trigger1 = MoveHit = 1 && NumTarget
anim = 8060
sprPriority = 5
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
scale = 0.5,0.5
facing = ifElse((Target, Facing = Facing), -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
ignoreHitPause = 1

[State 1630, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1601



;====<PUNCH ZERO COUNTER>=
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,2
channel = 0

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 2900, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 2900, Skid Dust]
type = Explod
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
trigger1 = !(AnimElemTime(3) % 3)
anim = 8104
sprPriority = 3
posType = P1
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 2.89373779296875

[State 2900, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) >= 1
x = 0.8583230636993465

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




;====<KICK ZERO COUNTER>=
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 1, 2)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(4) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
