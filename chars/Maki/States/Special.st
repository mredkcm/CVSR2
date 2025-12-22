; _______________________________________
;| Maki Genryusai by Knuckles8864        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<GENKO>=
[StateDef 1000]
type = S
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
;var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
var(10) = ifElse((P2MoveType = H || P2Dist x > 182 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 6+ (2.67*(var(10)))

[State 1000, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Genko Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10), 84, 77)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10), 84, 77)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX GENKO>=
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

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 64

[State 1030, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -29, -73
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1030, Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 2

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 16

[State 1030, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Genko Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1030, Genko FX]
type = Helper
trigger1 = !AnimElemTime(3)
helperType = Normal
name = "Genko"
ID = 1005
stateNo = 1005
pos = 0,0
posType = P1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 1030, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.32, -8.52
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<HAYAGAKE>=
[StateDef 1100]
type = S
physics = S
moveType = I
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;command = "a" || command = "b" || command = "c"
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
;ifElse(command = "z", 2, ifElse(command = "y", 1, 0))
var(11) = ifElse(NumExplod(90000220), 2, ifElse(NumExplod(90000210), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = Time && AnimElem = 5
var(11) = ifElse(Random < 500, 2, ifElse(Random < 500, 1, 0))

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, 1
channel = 0

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 1101


;Running
[StateDef 1101]
type = S
physics = S
moveType = I
anim = 1101
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1101, Vel]
type = VelSet
trigger1 = Anim = 1101
x = 8.233

[State 1101, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1101

[State 1101, Steps]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6
value = 100, 0

[State 1101, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1101, Hayagake]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && Time > 2 && p2Dist x >= 0 || p2Dist x <= 0
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) &&  NumExplod(90010006))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1200

[State 1101, Stop]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && Time > 2
;trigger1 = (command = "a")
;a
trigger1 = NumExplod(90000230)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1102

[State 1101, Kage Sukui]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && Time > 2
;trigger1 = (command = "b")
;b
trigger1 = NumExplod(90000240)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1103

[State 1101, Kubikari]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && Time > 2
;trigger1 = (command = "c")
;c
trigger1 = NumExplod(90000250)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1107

[State 1101, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
value = var(14)

[State 1101, End]
type = ChangeState
trigger1 = Time > 44
value = 1102


;Stop
[StateDef 1102]
type = S
physics = N
moveType = I
anim = 1102
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1102, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1102, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 6

[State 1102, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 1102,VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 0

[State 1102, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0
channel = 0

[State 1102, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 1

[State 1102, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 50,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Kage Sukui
[StateDef 1103]
type = S
physics = N
moveType = A
anim = 1103
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1103, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 6

[State 1103, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 1103,VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1103, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,1
channel = 0

[State 1103, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4
channel = 1

[State 1103, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 2

[State 1103, Skid Dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8104
sprPriority = 3
posType = P1
pos = -25,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1103, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = ifElse(!var(13),144,72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
forceStand = 1
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -7
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p1StateNo = 1104
P2Facing = 1
kill = 0

[State 1103, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Kage Sukui (Success)
[StateDef 1104]
type = S
physics = S
moveType = A
anim = 1104
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1104, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1104, Width]
type = Width
trigger1 = AnimElemNo(0)=[3,7]
edge = 35,0

[State 1104, TargetState]
type = TargetState
trigger1 = !Time
value = 1115

[State 1104, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(3)
statetype = A
physics = N

[State 1104, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 4.965
y = -9.0

[State 1104, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yAccel) + .23

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-60 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1104, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 20,-30

[State 1104, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1104, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1105
ctrl = 0


;Kage Sukui (Slam)
[StateDef 1105]
type = S
physics = S
moveType = A
anim = 1105
velSet = 0,0
sprPriority = 1

[State 1105, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1105, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1105, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 1105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yaccel)

[State 1105, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 1105, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1105,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1105, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(70 * fvar(11) < 7, -7, -70 * fvar(11)))

[State 1105, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1105, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1105, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1105, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1105, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1106


;Landing
[StateDef 1106]
type = S
physics = N
movetype = I
anim = 1106
velSet = 0,0
sprPriority = 1

[State 1106, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1106, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1106, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Kubikari
[StateDef 1107]
type = A
physics = N
moveType = A
anim = 1107
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1107, VelSet]
type = VelSet
trigger1 = !Time
x = 3.033
y = -9.033

[State 1107, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .23

[State 1107, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1107, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = ifElse(!var(13),144,72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
forceStand = 1
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -7
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p1StateNo = 1109
P2Facing = 1
kill = 0

[State 1107, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,2
channel = 0

[State 1107, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40, 0
channel = 1

[State 1107, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 2

[State 1107, End]
type = ChangeState
trigger1 = AnimElem = 7,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1108


;Landing
[StateDef 1108]
type = S
physics = N
movetype = I
anim = 1108
velSet = 0,0
sprPriority = 1

[State 1108, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1108, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1108, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1108, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1108, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Kubikari (Success)
[StateDef 1109]
type = S
physics = S
moveType = A
anim = 1109
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1109, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1109, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 1109, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 1109, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 1109, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 1109, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 860,TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,0,Mid

[State 1109, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 1109, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 1109, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100, IfElse((PrevStateNo = 1410 || PrevStateNo = 1411), 4, 3)
channel = 0

[State 1109, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1109, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 1110
ctrl = 0


;Kubikari (Slam)
[StateDef 1110]
type = S
physics = S
moveType = A
anim = 1110
velSet = 0,0
sprPriority = 1

[State 1110, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1110, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1110, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 1110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 1110, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 1110, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1110,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1110, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(91 * fvar(11) < 7, -7, -91 * fvar(11)))

[State 1110, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1110, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1110, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1110, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 1110, End]
type = ChangeState
trigger1 = AnimElemTime(4) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1111


;Kubikari Landing
[StateDef 1111]
type = S
physics = N
movetype = I
anim = 1111
velSet = 0,0
sprPriority = 1

[State 1111, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1111, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1111, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Kage Sukui (Target)
[Statedef 1115]
type = S
movetype = H
physics = N
velset = 0,0

[State 1115, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1115, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1115, SprPriority]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 1115, ChangeAnim]
type= ChangeAnim2
trigger1 = Time = 0
triggerall = anim != 1115
value = 1115

[State 1115, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;Kage Sukui (Target)
[Statedef 1116]
type = A
movetype = H
physics = N
velset = 0,0

[State 1116, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1116, VelSet]
type = VelSet
trigger1 = Time = 10
x = -5
y = -5

[State 1116, VelAdd]
type = VelAdd
trigger1 = Time > 10
y = .5

[State 1116, VelAdd]
type = VelSet
trigger1 = Time > 10
trigger1 = Vel Y > 0 && Pos Y >= -20
x = -2

[State 1116, ChangeAnim]
type= ChangeAnim2
trigger1 = Time = 0
triggerall = anim != 1116
value = 1116

[State 1116, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 1116, Envshake]
type = EnvShake
trigger1 = pos y >= 0 && vel y > 0
time = 15
ampl = 5

[State 1116, SelfState]
type = SelfState
trigger1 = pos y >= 0 && vel y > 0
value = 5100
ctrl = 0


;Kubikari (Target)
[Statedef 1117]
type = A
movetype = H
physics = N
velset = 0,0

[State 1117, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1117, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1117, SprPriority]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 1117, ChangeAnim]
type= ChangeAnim2
trigger1 = Time = 0
triggerall = anim != 1117
value = 1117

[State 1117, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;====<EX HAYAGAKE>=
[StateDef 1130]
type = S
physics = S
moveType = I
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 64

[State 1130, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 7, -64
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 4

[State 1130, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, 1
channel = 0

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 1131


;Running
[StateDef 1131]
type = S
physics = S
moveType = I
anim = 1101
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1131, Vel]
type = VelSet
trigger1 = Anim = 1101
x = 11.233

[State 1131, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1101

[State 1131, Steps]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 5
value = 100, 0

[State 1131, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1131, Hayagake]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1200

[State 1131, Stop]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;trigger1 = (command = "a")
;a
trigger1 = NumExplod(90000230)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1102

[State 1131, EX Kage Sukui]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;trigger1 = (command = "b")
;b
trigger1 = NumExplod(90000240)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1132

[State 1131, EX Kubikari]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;trigger1 = (command = "c")
;c
trigger1 = NumExplod(90000250)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1137

[State 1131, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
value = var(14)

[State 1131, End]
type = ChangeState
trigger1 = Time > 44
value = 1102


;Kage Sukui
[StateDef 1132]
type = S
physics = N
moveType = A
anim = 1103
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1132, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 9

[State 1132, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 1132,VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1132, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,1
channel = 0

[State 1132, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4
channel = 1

[State 1132, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 2

[State 1132, Skid Dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8104
sprPriority = 3
posType = P1
pos = -25,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1132, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
forceStand = 1
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -7
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p1StateNo = 1133
P2Facing = 1
kill = 0

[State 1132, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Kage Sukui (Success)
[StateDef 1133]
type = S
physics = S
moveType = A
anim = 1104
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1133, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1133, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1133, Width]
type = Width
trigger1 = AnimElemNo(0)=[3,7]
edge = 35,0

[State 1133, TargetState]
type = TargetState
trigger1 = !Time
value = 1115

[State 1133, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(3)
statetype = A
physics = N

[State 1133, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 4.965
y = -9.0

[State 1133, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yAccel) + .23

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-60 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 1133, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1133, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1133, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1134


;Kage Sukui (Slam)
[StateDef 1134]
type = S
physics = S
moveType = A
anim = 1105
velSet = 0,0
sprPriority = 1

[State 1134, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1134, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1134, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 1134, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yaccel)

[State 1134, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 1134, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1134,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1134, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 0

[State 1134, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1134, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1134, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1134, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1134, End]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
value = 1135


;Kubikari (Success)
[StateDef 1135]
type = S
physics = S
moveType = A
anim = 1109
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1135, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1135, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1135, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 1135, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 1135, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 1135, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 1135, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 1135, TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,10,Mid

[State 1135, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 1135, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 1135, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,3
channel = 0

[State 1135, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1135, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 1136
ctrl = 0


;Kubikari (Slam)
[StateDef 1136]
type = S
physics = S
moveType = A
anim = 1110
velSet = 0,0
sprPriority = 1

[State 1136, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1136, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1136, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 1136, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 1136, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 1136, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1136, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1136, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 1

[State 1136, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1136, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1136, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1136, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 1136, End]
type = ChangeState
trigger1 = AnimElemTime(4) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1111


;Kubikari
[StateDef 1137]
type = S
physics = N
moveType = A
anim = 1107
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1137, VelSet]
type = VelSet
trigger1 = !Time
x = 3.033
y = -9.033

[State 1137, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .23

[State 1137, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1137, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
forceStand = 1
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -7
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p1StateNo = 1138
P2Facing = 1
kill = 0

[State 1137, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,2
channel = 0

[State 1137, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40, 0
channel = 1

[State 1137, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 2

[State 1137, End]
type = ChangeState
trigger1 = AnimElem = 7,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1108


;Kubikari (Success)
[StateDef 1138]
type = S
physics = S
moveType = A
anim = 1109
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1138, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1138, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1138, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 1138, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 1138, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 1138, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 1138, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 1138, TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,10,Mid

[State 1138, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 1138, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 1138, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 1138, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 1138, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 1136, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 1138, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 1138, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100, IfElse((PrevStateNo = 1431), 4, 3)
channel = 0

[State 1136, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1138, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 1139
ctrl = 0


;Kubikari (Slam)
[StateDef 1139]
type = S
physics = S
moveType = A
anim = 1110
velSet = 0,0
sprPriority = 1

[State 1139, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1139, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1139, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 1139, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 1139, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 1139, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1139,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1139, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 0

[State 1139, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1139, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1139, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1139, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 1139, End]
type = ChangeState
trigger1 = AnimElemTime(2) = 6
value = 1140


;Kage Sukui (Success)
[StateDef 1140]
type = S
physics = S
moveType = A
anim = 1104
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1140, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1140, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1140, Width]
type = Width
trigger1 = AnimElemNo(0)=[3,7]
edge = 35,0

[State 1140, TargetState]
type = TargetState
trigger1 = !Time
value = 1115

[State 1140, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(3)
statetype = A
physics = N

[State 1140, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 4.965
y = -9.0

[State 1140, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yAccel) + .23

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 0,0

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 0,0

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 10,-60

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 10,-75

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 15,-70

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 25,-45

[State 1140, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 20,-30

[State 1140, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1140, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1141


;Kage Sukui (Slam)
[StateDef 1141]
type = S
physics = S
moveType = A
anim = 1105
velSet = 0,0
sprPriority = 1

[State 1141, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1141, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1141, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 1141, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yaccel)

[State 1141, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 1141, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1141,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1141, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 1

[State 1141, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1141, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1141, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1141, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1141, End]
type = ChangeState
trigger1 = AnimElemTime(4) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1111



;=<SAKA HAYAGAKE>==
[StateDef 1200]
type = S
physics = S
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;command = "a" || command = "b" || command = "c"
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
;ifElse(command = "z", 2, ifElse(command = "y", 1, 0))
var(11) = ifElse(NumExplod(90000220), 2, ifElse(NumExplod(90000210), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = Time && AnimElem = 5
var(11) = ifElse(Random < 500, 2, ifElse(Random < 500, 1, 0))

[State 1200, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, 1
channel = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = PrevStateNo = 1101
trigger1 = !Time
value = 52, 0
channel = 1

[State 1200, End]
type = ChangeState
trigger1 = !AnimTime
value = 1201


;Running
[StateDef 1201]
type = S
physics = S
moveType = I
anim = 1201
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1201, Vel]
type = VelSet
trigger1 = Anim = 1201
x = -8.233

[State 1201, Steps]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 5
value = 100, 0

[State 40, 2]
type = VarSet
trigger1=!ailevel&&time>1
;trigger1 = Command = "b" || Command = "c"
trigger1 = NumExplod(90000240) || NumExplod(90000250)
sysvar(1) = NumExplod(90000240) - NumExplod(90000250)

[State 1201, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1201, EX Hayagake]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;a + b / a + c / b + c
trigger1 = (ifElse(NumExplod(90000230), 1, 0) + ifElse(NumExplod(90000240), 1, 0) + ifElse(NumExplod(90000250), 1, 0) >= 2) || (ifElse(NumExplod(90000235), 1, 0) + ifElse(NumExplod(90000245), 1, 0) + ifElse(NumExplod(90000255), 1, 0) >= 2)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1205

[State 1201, Hayagake]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1204

[State 1201, Stop]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;trigger1 = (command = "a")
;a
trigger1 = NumExplod(90000230)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1202

[State 1201, Jump Forward]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel && time >= 2 && p2dist x >= 0
;trigger1 = (command = "b") || (command = "c")
;b
trigger1 = NumExplod(90000240) || NumExplod(90000250)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 1203

[State 1201, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
value = var(14)

[State 1201, End]
type = ChangeState
trigger1 = Time > 44
value = 1202


;Stop
[StateDef 1202]
type = S
physics = N
moveType = I
anim = 1202
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1202, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = -6

[State 1202, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 1202,VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 0

[State 1202, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0
channel = 0

[State 1202, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 1

[State 1202, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = -50,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1202, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Jump Forward/Backward
[StateDef 1203]
type = S
physics = N
moveType = I
anim = 1203
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1203, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1203 + (1 * (sysvar(1) = -1))

[State 1203, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = -6

[State 1203, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 1203,VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 0

[State 1203, Stopping Sound]
type = PlaySnd
trigger1 = !Time && Anim = 1203
value = 101,0
channel = 1

[State 1203, Skid Dust]
type = Explod
trigger1 = !Time && Anim = 1203
anim = 8104
sprPriority = 3
posType = P1
pos = -50,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1203, Normal Jump]
type = VelSet
trigger1 = !AnimTime
x = const(velocity.runjump.fwd.x) * sysvar(1)
y = const(velocity.runjump.y)

[State 1203, High Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 41,0

[State 1203, Movement AfterImage]
type = AfterImage
trigger1 = !AnimTime
time = 20
timeGap = 1
frameGap = 4
length = 9
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.9,0.9,0.9
trans = Add1

[State 1203, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;Into Hayagake
[Statedef 1204]
type = S
physics = S
moveType = I
anim = 1205
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 105,PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 52, 0

[State 100,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1100
ctrl = 0


;Into EX Hayagake
[Statedef 1205]
type = S
physics = S
moveType = I
anim = 1205
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 105,PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 52, 0

[State 100,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1130
ctrl = 0



;=<REPPUKYAKU>==
[StateDef 1300]
type = S
physics = S
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 130 || Random < 333), 2, ifElse(P2Dist x > 110, 1, 0))

[State 1300, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 8

[State 1300, LifeAdd]
type = LifeAdd
trigger1 = !Time
value = -42
kill = 0

[State 1300, Time]
type = VarSet
trigger1 = !Time
var(42) = 3

[State 1300, VarAdd]
type = VarAdd
trigger1 = !AnimElemTime(10)
var(42) = -1

[State 1300, VarAdd]
type = ChangeAnim
trigger1 = var(42)
trigger1 = !AnimElemTime(10)
value = Anim
elem = 4

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !var(42)
trigger1 = !AnimElemTime(7)
value = Anim
elem = 10

[State 1300, Reppukyaku FX]
type = Helper
trigger1 = !NumHelper(1305)
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Reppukyaku"
ID = 1305
stateNo = 1305
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 1300, Reppukyaku FX]
type = Helper
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Smoke"
ID = 1306
stateNo = 1306
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 1300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1300
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
ID = 1300
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -68), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, VelSet]
type = VelSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
x = -4.5
y = -3

[State 1300, StateTypeSet]
type = StateTypeSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
statetype = A
physics = N
movetype = I

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0
y = .38

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 1300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,1
channel = 1

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = !AnimElemTime(10)
moveType = I

[State 1300, End]
type = ChangeState
trigger1 = !var(42)
trigger1 = pos y > -vel y
value = 1301
ctrl = 0


;Landing
[StateDef 1301]
type = S
physics = N
movetype = I
anim = 1301
velSet = 0,0
sprPriority = 1

[State 1301, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1301, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;====<HASSOUKYAKU>=
;Wall Bounce
[StateDef 1400]
type = A
physics = N
moveType = I
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1400, Width]
type = Width
trigger1 = 1
edge = 20,20

[State 1400, VelSet]
type = PosSet
trigger1 = Time = 0
x = (Pos x-ScreenPos x)*Facing

[State 1400, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 6
y = -4

[State 1400, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0
channel = 0

[State 1400, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;Grab (Startup)
[StateDef 1405]
type = A
physics = N
moveType = I
anim = 1405
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1405, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 1, 0)
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 1, 0)

[State 1405, Width]
type = Width
trigger1 = 1
edge = 20,20

[State 1405, VelSet]
type = PosSet
trigger1 = Time = 0
x = (Pos x-ScreenPos x)*Facing

[State 1405, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1405, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(var(10) = 0, 1410, 1411)
ctrl = 0


;Grab (Attack Y)
[StateDef 1410]
type = A
physics = N
moveType = A
anim = 1410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1410, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 4

[State 1410, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1410, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,2
channel = 1

[State 1410, Grab Attempt]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, ST
hitFlag = M-
priority = 7, Miss
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1109
numhits = 1
P2Facing = 1

[State 1410, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1412
ctrl = 0


;Grab (Attack Z)
[StateDef 1411]
type = A
physics = N
moveType = A
anim = 1410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1411, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 8

[State 1411, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1411, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,2
channel = 1

[State 1411, Grab Attempt]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, ST
hitFlag = M-
priority = 7, Miss
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1109
numhits = 1
P2Facing = 1

[State 1411, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1412
ctrl = 0


;Grab (Land)
[StateDef 1412]
type = S
physics = S
moveType = I
anim = 1411
ctrl = 0
velSet = 4,0

[State 1412, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1412, VelSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1412, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1412, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1412, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1412, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Drop Down
[StateDef 1415]
type = A
physics = N
moveType = I
anim = 1415
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1415, VelSet]
type = PosSet
trigger1 = !Time
x = (Pos x - ScreenPos x) * Facing

[State 1415, VelAdd]
type = VelAdd
trigger1 = AnimElem = 6,>0
y = .5

[State 1415, Voice]
type = PlaySnd
trigger1 = AnimElem = 5,=1
value = 1100,0
channel = 0

[State 1415, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1415, End]
type = ChangeState
trigger1 = AnimElem = 6,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52


;Dive Kick (Startup)
[StateDef 1420]
type = A
physics = N
moveType = I
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1420, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 1, 0)
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 1, 0)

[State 1420, Width]
type = Width
trigger1 = 1
edge = 20,20

[State 1420, VelSet]
type = PosSet
trigger1 = Time = 0
x = (Pos x-ScreenPos x)*Facing

[State 1420, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1420, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(var(10) = 0, 1425, 1426)
ctrl = 0


;Dive Kick (Attack B)
[StateDef 1425]
type = A
physics = N
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1425, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 1.5
y = 1

[State 1425, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1425, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 1425, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 1425, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1425, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1427
ctrl = 0


;Dive Kick (Attack Z)
[StateDef 1426]
type = A
physics = N
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1426, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 7.5
y = 1

[State 1426, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1426, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 1426, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 1426, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1426, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1427
ctrl = 0


;Dive Kick (Land)
[StateDef 1427]
type = S
physics = S
moveType = I
anim = 1421
ctrl = 0
velSet = 0,0

[State 1427, VelSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1427, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1427, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1427, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX HASSOUKYAKYU: GRAB>=
;(Startup)
[StateDef 1430]
type = A
physics = N
moveType = I
anim = 1405
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500

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
var(25) = 61

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -6, -68
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 2

[State 1430, Width]
type = Width
trigger1 = 1
edge = 20,20

[State 1430, VelSet]
type = PosSet
trigger1 = Time = 0
x = (Pos x-ScreenPos x)*Facing

[State 1430, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 1431
ctrl = 0


;Grab (Attack EX)
[StateDef 1431]
type = A
physics = N
moveType = A
anim = 1410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1431, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 12

[State 1431, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1431, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,2
channel = 1

[State 1431, Grab Attempt]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, ST
hitFlag = M-
priority = 7, Miss
getPower = 0, 0
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1138
numhits = 1
P2Facing = 1

[State 1431, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1412
ctrl = 0



;====<EX HASSOUKYAKYU: DIVE KICK>=
;Dive Kick (Startup)
[StateDef 1440]
type = A
physics = N
moveType = I
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500

[State 1440, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1440, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1440, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 61

[State 1440, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -6, -68
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1440, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 2

[State 1440, Width]
type = Width
trigger1 = 1
edge = 20,20

[State 1440, VelSet]
type = PosSet
trigger1 = Time = 0
x = (Pos x-ScreenPos x)*Facing

[State 1440, Landing]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1440, End]
type = ChangeState
trigger1 = !AnimTime
value = 1441
ctrl = 0


;Dive Kick (Attack B)
[StateDef 1441]
type = A
physics = N
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1441, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 13.5
y = 1

[State 1441, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1441, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 1441, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 1441, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1441, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1427
ctrl = 0



;====<TENGU DAOSHI>=
;Grab Attempt
[StateDef 1500]
type = A
physics = N
moveType = A
anim = 1500
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = A, NT
hitFlag = AF
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
P1StateNo = 1510
P2Facing = 1

[State 1500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1500, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1500, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Success
[StateDef 1510]
type = A
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0,0

[State 1510, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1510, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1
channel = 0

[State 1510, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50
ctrl = 1

[State 1510, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1520

[State 1510, Width]
type = Width
trigger1 = AnimElemNo(0) = [1,2]
edge = 50,0

[State 1510, Width]
type = Width
trigger1 = AnimElemNo(0) = 3
edge = 20,0

[State 1510, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
edge = 25,0

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(40 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(10 * const(size.xScale)), ceil(-75 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1510, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 1510, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,> 0
y = .5

[State 1510, End]
type = ChangeState
trigger1 = AnimElem = 3,> 0
trigger1 = Frontedgebodydist < 1
value = 1511


;Success (Wall Slam)
[StateDef 1511]
type = A
physics = N
movetype = A
anim = 1511
ctrl = 0
velset = 0,0

[State 1511, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 1511, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1521

[State 1511, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1511,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1511, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 1511, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 1511, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1511, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(37 * fvar(11) < 7, -7, -37 * fvar(11)))
Kill = 0

[State 1511, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1511, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1511, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 1511, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 1511, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 1511, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1511,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 1512


;Success (Going Down)
[StateDef 1512]
type = A
physics = N
movetype = A
anim = 1512
ctrl = 0

[State 1512, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 1512, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1522

[State 1512, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1512, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,4
channel = 0

[State 1512, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 1512, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 1512, Width]
type = Width
trigger1 = AnimElemNo(0) = 3
edge = 35,0

[State 1512, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
edge = 30,0

[State 1512, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1512,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1512, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 1512, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1512, VelAdd]
type = VelAdd
trigger1 = 1
y = .75

[State 1512, TargetFacing]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 1512, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1513


;Success (End)
[StateDef 1513]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 1513, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 1513, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1513, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 1513, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 1513, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 1513, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1513, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1513, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -112, ifElse(var(10), -105, -98)) * fvar(11)))

[State 1513, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1513, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1513, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1513, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1513, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514


;Landing
[StateDef 1514]
type = S
physics = N
movetype = I
anim = 1514
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 1514, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1514, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1514, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1514, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;(Target)
[Statedef 1520]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1520, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1520,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1520


;(Target)
[Statedef 1521]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1521, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1521,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1521


;(Target)
[Statedef 1522]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1522, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1522,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1522


;(Target)
[Statedef 1525]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1525, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1520,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1525



;====<EX TENGU DAOSHI>=
;Grab Attempt
[StateDef 1530]
type = A
physics = N
moveType = A
anim = 1500
ctrl = 0
sprPriority = 1
powerAdd = -500

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
var(25) = 61

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 11, -46
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1530, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = A, NT
hitFlag = AF
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
P1StateNo = 1540
P2Facing = 1

[State 1530, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1530, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1530, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Success
[StateDef 1540]
type = A
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0,0

[State 1540, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 61

[State 1540, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1540, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1
channel = 0

[State 1540, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 1540, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1520

[State 1540, Width]
type = Width
trigger1 = AnimElemNo(0) = [1,2]
edge = 50,0

[State 1540, Width]
type = Width
trigger1 = AnimElemNo(0) = 3
edge = 20,0

[State 1540, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
edge = 25,0

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(40 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(10 * const(size.xScale)), ceil(-75 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1540, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 1540, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,> 0
y = .5

[State 1540, End]
type = ChangeState
trigger1 = AnimElem = 3,> 0
trigger1 = Frontedgebodydist < 1
value = 1541


;Success (Wall Slam 1)
[StateDef 1541]
type = A
physics = N
movetype = A
anim = 1511
ctrl = 0
velset = 0,0

[State 1541, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 1541, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1521

[State 1541, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 1541, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1541, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1541, TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1541, TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 1541, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 1541, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 1541, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1541, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(37 * fvar(11) < 7, -7, -37 * fvar(11)))
Kill = 0

[State 1541, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1541, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1541, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 1541, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 1541, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 1541, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1541,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 1542


;Success (Going Down to Floor Slam)
[StateDef 1542]
type = A
physics = N
movetype = A
anim = 1512
ctrl = 0

[State 1542, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 30

[State 1542, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 1542, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1522

[State 1542, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1542, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,4
channel = 0

[State 1542, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 1542, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 1542, Width]
type = Width
trigger1 = AnimElemNo(0) = 3
edge = 35,0

[State 1542, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
edge = 30,0

[State 1542, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1542,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1542, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 1542, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1542, VelAdd]
type = VelAdd
trigger1 = 1
y = .75

[State 1542, TargetFacing]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 1542, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1543


;Kage Sukui (Slam)
[StateDef 1543]
type = S
physics = S
moveType = A
anim = 1105
velSet = 0,0
sprPriority = 1

[State 1543, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1543, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1543, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 1543, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yaccel)

[State 1543, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 1543, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1543,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1543, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 1543, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1543, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1543, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1543, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1543, End]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
value = 1544


;Kubikari (Success)
[StateDef 1544]
type = S
physics = S
moveType = A
anim = 1109
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1544, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1544, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1544, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 1544, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 1544, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 1544, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 1544, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 1544, TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,10,Mid

[State 1544, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 1544, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 1544, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,3
channel = 0

[State 1544, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 1544, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 1545
ctrl = 0


;Kubikari (Slam)
[StateDef 1545]
type = S
physics = S
moveType = A
anim = 1110
velSet = 0,0
sprPriority = 1

[State 1545, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1545, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 1545, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 1545, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 1545, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 1545, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 1545, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1545, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 1

[State 1545, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1545, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1545, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 1545, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 1545, End]
type = ChangeState
trigger1 = AnimElemTime(4) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1111



;=<PUNCH ZERO COUNTER>==
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
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 2900, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,8
channel = 1

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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 86), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
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
trigger1 = !Time
value = SCA
time = 8
ignoreHitPause = 1

[State 2910, Time]
type = VarSet
trigger1 = !Time
var(42) = 3

[State 2910, VarAdd]
type = VarAdd
trigger1 = !AnimElemTime(10)
var(42) = -1

[State 2910, VarAdd]
type = ChangeAnim
trigger1 = var(42)
trigger1 = !AnimElemTime(10)
value = Anim
elem = 4

[State 2900, ChangeAnim]
type = ChangeAnim
trigger1 = !var(42)
trigger1 = !AnimElemTime(7)
value = Anim
elem = 10

[State 2910, Reppukyaku FX]
type = Helper
trigger1 = !NumHelper(1305)
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Reppukyaku"
ID = 1305
stateNo = 1305
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 2910, VelSet]
type = VelSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
x = -4.5
y = -3

[State 2910, StateTypeSet]
type = StateTypeSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
statetype = A
physics = N
movetype = I

[State 2910, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0
y = .38

[State 2910, Reppukyaku FX]
type = Helper
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Smoke"
ID = 1306
stateNo = 1306
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 2910, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,1
channel = 1

[State 2910, Ground Hit]
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
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -68), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = !AnimElemTime(10)
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !var(42)
trigger1 = pos y > -vel y
value = 2911


;Landing
[StateDef 2911]
type = S
anim = 1301
physics = N
moveType = I
velSet = 0,0

[State 2911, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 2911, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2911, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 3

[State 2911, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
