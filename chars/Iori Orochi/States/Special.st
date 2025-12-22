; _________________________________________
;| Iori Yagami by Knuckles8864             |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==


;====<108 SHIKI: YAMI BARAI>=
[StateDef 1000]
type = S
physics = S
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
triggerAll = !var(40)
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0 + 10 * (var(40) = 1)
channel = 1

[State 1000, Yami Barai Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,1
channel = 2

[State 1000, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1004
sprPriority = 3
posType = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yami Barai Projectile"
posType = P1
pos = 30,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX 108 SHIKI: YAMI BARAI>=
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
var(25) = 23

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 3, -72
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

[State 1030, Yami Barai Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,1
channel = 3

[State 1030, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1004
sprPriority = 3
posType = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yami Barai Projectile"
posType = P1
pos = 30,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<100 SHIKI: ONIYAKI>=
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
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
triggerAll = !var(40)
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0 && var(10) != 2
trigger2 = AnimElemTime(3) < 0 && var(10) = 2
value = SCA
time = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 1100,0
channel = 0

[State 1100, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4,13
channel = 0

[State 1100, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,2
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 3

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 1
y = ifElse(!var(10), -7.5, ifElse(var(10) = 1, -9, -10.5))

[State 1100, VelAdd]
type = Veladd
trigger1 = AnimElemTime(4) >= 2
y = 0.55

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 32

[State 1100, Fire Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1100, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(2)  >= 0 && AnimElemTime(3) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 45), (var(36) := -71)
hitSound = S3,0
numHits = 0

[State 1100, LP HitDef (Ground)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(10)
attr = S, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, MP HitDef (Ground)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && var(10) = 1
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
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
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HP Ground Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
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
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HP Ground Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
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
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, LP/MP HitDef (Air)]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + var(10)) || var(20))
trigger1 = AnimElem = 4
trigger1 = var(10) != 2
trigger1 = ifElse(!var(10), !MoveContact, 1)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), 77, 77) < 7, 7, fvar(11) * ifElse(var(10), 77, 77))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HP HitDef (Air)]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 4
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101


;Landing
[StateDef 1101]
type = S
anim = ifElse(!var(10) || PrevStateNo = 1130 || PrevStateNo = 1140 || PrevStateNo = 2900, 1101, ifElse(var(10) = 1, 1111, 1121))
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX 100 SHIKI: ONIYAKI>=
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
var(25) = 29

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 3, -62
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,0 + 10 * var(40)
channel = 0

[State 1130, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,2
channel = 3

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 1130, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
x = 16

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 4
y = -11.5

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.55

[State 1130, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = 0.95

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1130, Fire Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1130, Auto Guard]
type = ReversalDef
trigger1 = AnimElem = 2
reversal.attr = SCA, NA, SA
pauseTime = 12, 12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 45), (var(36) := -71)
hitSound = s3, 0
numHits = 0

[State 1130, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
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
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Air Hits]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 3 || AnimElem = 4 || AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;====<EX 100 SHIKI: ONIYAKI (KOF XIII EDITION)>=
[StateDef 1140]
type = S
physics = N
moveType = A
anim = 1140
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1140, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1140, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1140, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 64

[State 1140, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 3, -62
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1140, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1140, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 4

[State 1140, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,1
channel = 0

[State 1140, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 4,1
channel = 0

[State 1140, Voice]
type = PlaySnd
trigger1 = AnimElem = 22
value = 1100,0
channel = 0

[State 1140, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 12 || AnimElem = 22
value = 1,2
channel = 1

[State 1140, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(24) = 2
value = 40,0
channel = 2

[State 1140, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 13 || AnimElem = 23
value = 1000,2
channel = 3

[State 1140, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElemTime(24) = 2
stateType = A
physics = N

[State 1140, Dust Helper]
type = Helper
trigger1 = AnimElemTime(24) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oni Homura Dust"
posType = P1
ownPal = 1

[State 1140, Fire Helper]
type = Helper
trigger1 = AnimElem = 3 || AnimElem = 13 || AnimElem = 23
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1140, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(12) >= 0 && AnimElemTime(14) < 0
trigger3 = AnimElemTime(22) >= 0 && AnimElemTime(24) < 0
x = 6

[State 1140, VelMul]
type = VelMul
trigger1 = AnimElemTime(24) >= 0
x = 0.94

[State 1140, VelSet]
type = VelSet
trigger1 = AnimElemTime(7) = 1
trigger2 = AnimElemTime(17) = 1
trigger3 = AnimElemTime(28) = 1
x = 0

[State 1140, VelAdd]
type = PosAdd
trigger1 = AnimElemTime(23) = 1
x = 16

[State 1140, VelSet]
type = velset
trigger1 = AnimElem = 24
x = 4
y = -9.5

[State 1140, VelMul]
type = VelMul
trigger1 = AnimElemTime(24) > 2
x = 0.95

[State 1140, Gravity]
type = VelAdd
trigger1 = AnimElemTime(24) >= 2
y = 0.55

[State 1140, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 4
trigger1 = !MoveContact
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = AnimElem = 14
trigger1 = !MoveContact
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, HitDef 9]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1140, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1140, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 25
moveType = I

[State 1140, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;====<217 SHIKI: AOI HANA>=
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
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1202, ifElse(var(10) = 1, 1201, 1200))

[State 1200, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4,1
channel = 0

[State 1200, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 1200,0
channel = 0

[State 1200, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 1200, Accel]
type = VelSet
trigger1 = time > 0 && AnimElemTime(2) < 0 && var(10) = 0
x = (5.53125 * exp((-0.0814) * (time-1)))

[State 1200, Accel]
type = VelSet
trigger1 = time > 0 && AnimElemTime(2) < 0 && var(10)=1
x = (6.4531 * exp((-0.0814) * (time-1)))

[State 1200, Accel]
type = VelSet
trigger1 = time > 0 && AnimElemTime(2) < 0 && var(10)=2
x = (7.375 * exp((-0.0814) * (time-1)))

[State 1200, Vel]
type = VelSet
trigger1 = AnimElem = 2 && var(10) = 0
x = 18.33

[State 1200, Vel]
type = VelSet
trigger1 = AnimElem = 2 && var(10) = 1
x = 18.425

[State 1200, Vel]
type = VelSet
trigger1 = AnimElem = 2 && var(10) = 2
x = 18.52

[State 1200, Vel]
type = VelSet
trigger1 = AnimElemTime(2) >= 1 && AnimElemTime(3) < 1 && var(10) = 0
x = (3.9949493408203125 * exp((-0.0814) * (time-7)))

[State 1200, Vel]
type = VelSet
trigger1 = AnimElemTime(2) >= 1 && AnimElemTime(3) < 1 && var(10) = 1
x = (4.084068 * exp((-0.0814) * (time-7)))

[State 1200, Vel]
type = VelSet
trigger1 = AnimElemTime(2) >= 1 && AnimElemTime(3) < 1 && var(10) = 2
x = (4.173187255859375 * exp((-0.0814)*(time-8)))

[State 1200, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -5, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -5, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1200, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1200, Second Hit]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1210

[State 1200, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Aoi Hana 2nd Hit
[StateDef 1210]
type = S
physics = N
moveType = A
anim = 1210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1210, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1212, ifElse(var(10) = 1, 1211, 1210))

[State 1210, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4,2
channel = 0

[State 1210, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 1200,0
channel = 0

[State 1210, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 1210, Accel]
type = VelSet
trigger1 = time > 0 && animelemtime(4) < 0 && var(12)=0
x = (7.53125*exp((-0.0814)*(time-1)))

[State 1210, Accel]
type = VelSet
trigger1 = time > 0 && animelemtime(4) < 0 && var(12)=1
x = (8.4531*exp((-0.0814)*(time-1)))

[State 1210, Accel]
type = VelSet
trigger1 = time > 0 && animelemtime(4) < 0 && var(12)=2
x = (9.375*exp((-0.0814)*(time-1)))

[State 1210, Accel]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 6

[State 1210, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1210, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1210, Second Hit]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1220

[State 1210, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Aoi Hana 3rd Hit
[Statedef 1220]
type = S
physics = S
moveType = A
anim = 1220
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1220, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1222, ifElse(var(10) = 1, 1221, 1220))

[State 1220, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4,4
channel = 0

[State 1220, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 1200,1
channel = 0

[State 1220, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41,0
channel = 1

[State 1220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2
channel = 2

[State 1220, Dust Helper]
type = Helper
trigger1 = AnimElem=2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1220, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1220, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = IfElse(var(10) = 0, -5, IfElse(var(10) = 1, -5, -6))
x = 5.5

[State 1220, pos]
type = Veladd
trigger1 = AnimElemTime(3)>0
y = .625

[State 1220, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 120
ground.velocity = -11.1796875*fvar(6)
ground.cornerPush.velOff = 0
guard.velocity = -7.17
guard.cornerPush.velOff = 0
air.velocity = -6,9
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1220, StateTypeSet]
type = StateTypeSet
trigger1 = time > 19
movetype = I

[State 1220, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1260



;Aoi Hana 3rd Hit-landing
[Statedef 1260]
type = S
physics = S
movetype= I
ctrl = 0
anim = 1260
velset = 0,0

[State 1260, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1260, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1260, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1260, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX 217 SHIKI: AOI HANA>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 30

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 10, -67
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 2

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,1
channel = 0

[State 1230, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 1230, Accel]
type = VelSet
trigger1 = time > 0 && animelemtime(2) < 0 
x = (7.375*exp((-0.0814)*(time-1)))

[State 1230, Vel]
type = VelSet
trigger1 = animelem = 2 
x = 18.52

[State 1230, Vel]
type = VelSet
trigger1 = animelemtime(2) >= 1 && animelemtime(3) < 1 
x = (4.173187255859375*exp((-0.0814)*(time-8)))

[State 1230, Vel]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -5, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -5, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1230, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1230, Second Hit]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1240

[State 1230, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1230, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX Aoi Hana 2nd Hit
[StateDef 1240]
type = S
physics = N
moveType = A
anim = 1210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1240, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 30

[State 1240, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,2
channel = 0

[State 1240, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 1240, Accel]
type = VelSet
trigger1 = time > 0 && animelemtime(4) < 0 
x = (9.375*exp((-0.0814)*(time-1)))

[State 1240, Accel]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1240, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1240, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1240, Second Hit]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1250

[State 1240, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1240, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX Aoi Hana 3rd Hit
[Statedef 1250]
type = S
physics = S
moveType = A
anim = 1220
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1250, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 30

[State 1250, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,4
channel = 0

[State 1250, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41,0
channel = 1

[State 1250, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2
channel = 2

[State 1250, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1250, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -7               
x = 5.5

[State 1250, pos]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = .625

[State 1250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 120
ground.velocity = -11.1796875*fvar(6)
ground.cornerPush.velOff = 0
guard.velocity = -7.17
guard.cornerPush.velOff = 0
air.velocity = -6,9
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, StateTypeSet]
type = StateTypeSet
trigger1 = time > 19
movetype = I

[State 1250, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1260



;====<212 SHIKI: KOTOTSUKI IN>=
;Startup
[Statedef 1300]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1
anim = 1300

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 270, 2, ifElse(P2Dist x > 210, 1, 0))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0 + 10 * var(40)
channel = 0

[State 1300, FootSteps]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
value = 100,0
channel = 1

[State 1300, VelSet]
type = VelSet
trigger1 = !Time
x = 6.5

[State 1300, ChangeState]
type = Changestate
trigger1 = P2BodyDist x <= 30
value = 1310

[State 1300, ChangeState]
type = Changestate
trigger1 = Time >= 24 + (9 * var(10))
value = 1301
ctrl = 0


;Missed
[Statedef 1301]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1301

[State 1301, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1301, Accel]
type = VelSet
trigger1 = !time
x = 15.7603302001953125

[State 1301, Vel]
type = VelSet
trigger1 = time > 0
x = (6.2014617919921875*exp((-0.1576)*(time-1)))

[State 1301, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Grab Attempt 1
[Statedef 1310]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1
anim = 1310

[State 1310, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1310, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,1
channel = 1

[State 1310, Width]
type = Width
trigger1 = AnimElemTime(1) = -1
value = 30,0

[State 1310, Accel]
type = VelSet
trigger1 = time < 2
x = (7.96875*exp((-0.0645)*(time)))

[State 1310, Vel]
type = VelSet
trigger1 = time = 2
x = 19.0037841796875

[State 1310, Vel]
type = VelSet
trigger1 = time > 2
x = (6.5660552978515625*exp((-0.0645)*(time-3)))

[State 1310, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Miss
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -59
yaccel = 0.5
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 10
envShake.ampl = 4
envShake.freq = 120
p1StateNo = 1320
P2Facing = 1

[State 1310, ChangeState]
type = ChangeState
trigger1 = AnimElem = 5 && MoveContact
value = 1311
ctrl = 0

[State 1310, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Grab Attempt 2
[Statedef 1311]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1
anim = 1311

[State 1311, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,1
channel = 0

[State 1311, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1311, Width]
type = Width
trigger1 = AnimElemTime(1) = -1
value = 30,0

[State 1311, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Miss
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Heavy
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 10
envShake.ampl = 4
envShake.freq = 120
p1StateNo = 1321
P2Facing = 1

[State 1311, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;1st Hit Connected
[Statedef 1320]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1320

[State 1320, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1320, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50 || AnimElem = 3 && FrontEdgeDist < 50
edge = 75,0

[State 1320, TargetState]
type = TargetState
trigger1 = !Time
value = 1330

[State 1320, TargetState]
type = TargetState
trigger1 = AnimElem = 4 && NumTarget
value = 1331

[State 1320, TargetState]
type = TargetState
trigger1 = AnimElemTime(7)= 3 && NumTarget
value = 1332

[State 1320, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 75,-97

[State 1320, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 74,-97

[State 1320, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 77,-55

[State 1320, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(7) < 3
pos = 71,-2

[State 1320, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1300,1 + 10 * (var(40) = 1)
channel = 0

[State 1320, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,2
channel = 1

[State 1320, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300,3
channel = 2

[State 1320, Impact Dust]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(65 * const(size.xScale)),0
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5

[State 1320, Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 1335
ID = 1335
pos = 95,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = .5,.5
sprpriority = 6

[State 1320, Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 1335
ID = 1335
pos = 50,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = .5,.5
sprpriority = 6

[State 1320, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 7
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1320, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7
time = 15
freq = 60
ampl = -6
phase = 90

[State 1320, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(7) = 3
value = 1

[State 1320, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(7) = 3
value = floor(ifElse(ifElse(var(10) = 2, 126, ifElse(var(10), 119, 112)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -126, ifElse(var(10), -119, -112)) * fvar(11)))

[State 1320, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;2nd Hit Connected
[Statedef 1321]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1321

[State 1321, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1320, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50 || AnimElem = 3 && FrontEdgeDist < 50
edge = 75,0

[State 1321, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1331

[State 1321, TargetState]
type = TargetState
trigger1 = AnimElemTime(4) = 3 && NumTarget
value = 1332

[State 1321, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 3
pos = 71,-2
time = 1

[State 1321, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,1 + 10 * (var(40) = 1)
channel = 0

[State 1321, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,2
channel = 1

[State 1321, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,3
channel = 2

[State 1321, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(70 * const(size.xScale)),0
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5

[State 1321, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1335
pos = 95,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = .5,.5
sprpriority = 6

[State 1321, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1336
pos = 50,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = .5,.5
sprpriority = 6

[State 1321, Flame Particles]
type = Helper
triggerall = !Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 4
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1321, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
freq = 60
ampl = -6
phase = 90

[State 1321, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(4) = 3
value = 1

[State 1321, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(4) = 3
value = floor(ifElse(ifElse(var(10) = 2, 126, ifElse(var(10), 119, 112)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -126, ifElse(var(10), -119, -112)) * fvar(11)))

[State 1321, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<212 SHIKI: KOTOTSUKI IN (TARGET)>==
;Being Thrown
[Statedef 1330]
type = S
movetype = H
physics = N

[State 1330, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 1330, Turn]
type = Turn
trigger1 = !Time && facing = enemy, facing

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1330, SprPriority]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 1330, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim != 1330
value = 1330

[State 1330, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;=<Kototsuki In - P2 State>==
[Statedef 1331]
type = S
movetype = H
physics = N
velset = 0,0

[State 1331, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1331, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1331, SprPriority]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 1331, ChangeAnim]
type= ChangeAnim2
trigger1 = Time = 0
triggerall = anim != 1331
value = 1331

[State 1331, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;=<Kototsuki In - P2 State>==
[Statedef 1332]
type = A
movetype = H
physics = N

[State 1332, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 1332, PosAdd]
type = PosAdd
trigger1 = !Time
y = -5

[State 1332, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 1332, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim !=5160
value = 5160

[State 1332, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 1332, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = -4.6
y = -5.8

[State 1332, VelAdd]
type = VelAdd
trigger1 = AnimElemTime (1) > 0
y = .5

[State 1332, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 1332, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -3

[State 1332, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y && AnimElemTime (1) > 0
value = 5100



;====<EX 212 SHIKI: KOTOTSUKI IN>=
[Statedef 1350]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
poweradd = -500
sprpriority = 1
facep2 = 1
anim = 1350

[State 1350, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1350, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1350, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 30

[State 1350, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 10, -67
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1350, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1350, Width]
type = Width
trigger1 = AnimElemTime(1) = 0
value = 30,0

[State 1350, VarSet]
type = VarSet
trigger1 = !Time
var(10) = 3
ignorehitpause = 1

[State 1350, VarSet]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 1350, Woosh]
type = PlaySnd
trigger1 = !Time
value = S1,1
channel = 1

[State 1350, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1350, HitDef]
type = HitDef
triggerAll = !Numtarget(1331) && !Numtarget(1332)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, NA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Heavy
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 10
envShake.ampl = 4
envShake.freq = 120
p1StateNo = 1360
P2Facing = 1

[State 1350, HitDef]
type = HitDef
triggerAll = !Numtarget(1331) && !Numtarget(1332)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger1 = !MoveContact
attr = S, NA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Heavy
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 85), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 10
envShake.ampl = 4
envShake.freq = 120
p1StateNo = 1370
P2Facing = 1

[State 1350, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX-Kototsuki In - 1st Hit Connected
[Statedef 1360]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1321

[State 1360, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1360, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50 || AnimElem = 3 && FrontEdgeDist < 50
edge = 75,0

[State 1360, TargetState]
type = TargetState
trigger1 = !Time
value = 1331

[State 1360, TargetState]
type = TargetState
trigger1 = AnimElemTime(4)= 3
value = 1332

[State 1360, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 3
pos = 71,-2
time = 1

[State 1360, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 60

[State 1360, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300, 1
channel = 0

[State 1360, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,2
channel = 1

[State 1360, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,3
channel = 2

[State 1360, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(65 * const(size.xScale)),0
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5

[State 1360, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1335
pos = 95,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownPal = 1
scale = .5,.5
sprpriority = 6

[State 1360, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1335
pos = 50,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownPal = 1
scale = .5,.5
sprpriority = 6

[State 1360, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 4
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1360, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
freq = 60
ampl = -6
phase = 90

[State 1360, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(4) = 3
value = 1

[State 1360, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(4) = 3
value = floor(ifElse(140 * fvar(11) < 7, -7, -140 * fvar(11)))

[State 1360, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX-Kototsuki In - 2nd Hit Connected
[Statedef 1370]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1321

[State 1370, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1370, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist > 50 || AnimElem = 2 && FrontEdgeDist > 50 || AnimElem = 3 && FrontEdgeDist > 50
edge = 75,0

[State 1370, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1331

[State 1370, TargetState]
type = TargetState
trigger1 = AnimElemTime(4) = 3 && NumTarget
value = 1332

[State 1370, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist > 50 || AnimElem = 2 && FrontEdgeDist > 50 || AnimElem = 3 && FrontEdgeDist > 50
edge = 75,0

[State 1370, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 60

[State 1370, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 3
pos = 71,-2
time = 1

[State 1370, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300, 1
channel = 0

[State 1370, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,2
channel = 1

[State 1370, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,3
channel = 2

[State 1370, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(65 * const(size.xScale)),0
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5

[State 1370, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1335
pos = 95,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownPal = 1
scale = .5,.5
sprpriority = 6

[State 1370, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1335
ID = 1335
pos = 50,-21
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownPal = 1
scale = .5,.5
sprpriority = 6

[State 1370, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 4
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1370, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
freq = 60
ampl = -6
phase = 90

[State 1370, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(4) = 3
value = 1

[State 1370, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(4) = 3
value = floor(ifElse(126 * fvar(11) < 7, -7, -126 * fvar(11)))
kill = 1

[State 1370, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<TSUMAGUSHI>=
[StateDef 1400]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1401, 1402))

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5
x = 12

[State 1400, Jump Sound]
type = Playsnd
trigger1 = AnimElem =3
value = 40,0
channel = 4

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 1410


;Tsumagushi Jump In
[Statedef 1410]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1410

[State 1410, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1410
var(12) = 0
ignorehitpause = 1

[State 1410, HitOverride]
type = HitOverride
trigger1 = var(12) = 1
attr = S,NP,SP
slot = 7
stateno = 1410
time = 1
ignorehitpause = 1

[State 1410, VelSet]
type = VelSet
trigger1 = PrevStateNo = 1400 && !Time
x = IfElse(var(10) = 0, 3, IfElse(var(10) = 1, 5, 7))
y = IfElse(var(10) = 0, -4.5, IfElse(var(10) = 1, -4.5, -5))

[State 1410, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1410, End]
type=changestate
trigger1 = !animtime
value = 1411


;Tsumagushi Jump In 2
[Statedef 1411]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1411

[State 1411, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1411
var(12) = 0
ignorehitpause = 1

[State 1411, HitOverride]
type = HitOverride
trigger1 = var(12) = 1
attr = S,NP,SP
slot = 7
stateno = 1411
time = 1
ignorehitpause = 1

[State 1411, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 1411, End]
type = changestate
trigger1 = !animtime
value = 1412


;Tsumagushi Jump In 3
[Statedef 1412]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1412

[State 1412, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1412
var(12) = 0
ignorehitpause = 1

[State 1412, HitOverride]
type = HitOverride
trigger1 = var(12)= 1
attr = S,NP,SP
slot = 7
stateno = 1412
time = 1
ignorehitpause = 1

[State 1412, VelAdd]
type = VelAdd
trigger1 = 1
y = IfElse(var(10) = 0, .9, IfElse(var(10) = 1, .9, .9))

[State 1412, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 1420


;Tsumagushi - Slash
[Statedef 1420]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1

[State 1420, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1422, ifElse(var(10) = 1, 1421, 1420))

[State 1420, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1420, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1420, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3

[State 1420, Woosh]
type = playsnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1420, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1420, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1420, Width]
type = width
trigger1 = !Time
value = 30,0

[State 1420, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 1420, Hit]
type = HitDef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
attr = S, NA        
hitFlag = MAF       
guardFlag = M         
priority = 4, Hit   
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 69, ifElse(var(10), 63, 56)))), 7
ID = 200*!var(20)
getPower = 20 * !var(20), 0
givePower = 30, 30
pauseTime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3*var(9)
ground.slideTime = 15 + 3*var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ceil(Ifelse(var(55),-5,-7.51) * (ifelse(!var(20),1,.5)))
ground.cornerPush.velOff = 0
guard.velocity = ceil(Ifelse(var(55),-5,-7.51) * (ifelse(!var(20),1,.5)))
guard.cornerPush.velOff = 0
air.velocity=-3.24, -7.73
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound=  -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -60
palFX.time = 25
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 1420, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1420, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1420, EX Aoi Hana]
type = VarSet
triggerAll = (!var(14) || AILevel)
triggerAll = power >= 500
trigger1 = !AILevel
trigger1 = command = "EXAoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1230

[State 1420, Aoi Hana]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1200

[State 1420, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = MoveContact
value = var(14)

[State 1420, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;====<EX TSUMAGUSHI>=
[StateDef 1430]
type = S
physics = S
movetype = A
anim = 1400
ctrl = 0
velset = 0,0
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 0
value = SCA
time = 1
ignorehitpause = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 30

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 10, -67
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 2

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5
x = 12

[State 1430, Swing Snd]
type = Playsnd
trigger1 = AnimElem =3
value = 40,0
channel = 4

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1430, End]
type = changestate
trigger1 = !animtime
value = 1431


;EX Tsumagushi Jump In
[Statedef 1431]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1410

[State 1431, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1431
var(12) = 0
ignorehitpause = 1

[State 1431, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 0
value = SCA
time = 1
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = var(12) = 1
attr = S,NP,SP
slot = 7
stateno = 1431
time = 1
ignorehitpause = 1

[State 1431, VelSet]
type = VelSet
trigger1 = PrevStateNo = 1430 && !Time
x = 14.2
y = -6.2

[State 1431, VelAdd]
type = VelAdd
trigger1 = 1
y = .8

[State 1431, End]
type=changestate
trigger1 = !animtime
value = 1432


;EX Tsumagushi Jump In 2
[Statedef 1432]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1411

[State 1432, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1432
var(12) = 0
ignorehitpause = 1

[State 1432, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 0
value = SCA
time = 1
ignorehitpause = 1

[State 1432, HitOverride]
type = HitOverride
trigger1 = var(12) = 1
attr = S,NP,SP
slot = 7
stateno = 1445
time = 1
ignorehitpause = 1

[State 1432, VelAdd]
type = VelAdd
trigger1 = 1
y = .8

[State 1432, End]
type = changestate
trigger1 = !animtime
value = 1433


;EX Tsumagushi Jump In 3
[Statedef 1433]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 1412

[State 1433, VarSet]
type = VarSet
trigger1 = PrevStateNo = 1432
var(12) = 0
ignorehitpause = 1

[State 1433, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 0
value = SCA
time = 1
ignorehitpause = 1

[State 1433, HitOverride]
type = HitOverride
trigger1 = var(12) = 1
attr = S,NP,SP
slot = 7
stateno = 1433
time = 1
ignorehitpause = 1

[State 1433, VelAdd]
type = VelAdd
trigger1 = 1
y = .8

[State 1433, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 1434


;EX Tsumagushi - Slash
[Statedef 1434]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 1422

[State 1434, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1422

[State 1434, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1434, Snd]
type = playsnd
trigger1 = !time
value = 40,0

[State 1434, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3

[State 1434, Swing Snd]
type = playsnd
trigger1 = animelem=2
value = 1,2
channel = 1

[State 1434, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1434, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1434, width]
type = width
trigger1 = !Time
value = 30,0

[State 1434, HitSound]
type = PlaySnd
trigger1 = movehit && numtarget
trigger1 = target, time=0 && target, movetype = H
value = 2,2
persistent = 0
ignorehitpause = 1

[State 1434, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 1420, Hit]
type = HitDef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
attr = S, NA        
hitFlag = MAF       
guardFlag = M         
priority = 4, Hit   
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
ID = 200*!var(20)
getPower = 0,0
givePower = 30, 30
pauseTime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3*var(9)
ground.slideTime = 15 + 3*var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ceil(Ifelse(var(55),-5,-7.51) * (ifelse(!var(20),1,.5)))
ground.cornerPush.velOff = 0
guard.velocity = ceil(Ifelse(var(55),-5,-7.51) * (ifelse(!var(20),1,.5)))
guard.cornerPush.velOff = 0
air.velocity=-3.24, -7.73
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound=  -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -60
palFX.time = 25
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 1434, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1434, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1434, EX Aoi Hana]
type = VarSet
triggerAll = (!var(14) || AILevel)
triggerAll = power >= 500
trigger1 = !AILevel
trigger1 = command = "EXAoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1230

[State 1434, Aoi Hana]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel
trigger1 = command = "AoiHana"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1200

[State 1434, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = MoveContact
value = var(14)

[State 1434, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;====<KUZUKAZE>=
[Statedef 1500]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1
anim = 1500

[State 1500, VarSet]
type = VarSet
trigger1 = 1 
var(33) = 0
ignorehitpause = 1

[State 1500, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 0

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0 + 10 * var(40)
channel = 1

[State 1500, Hitdef]
type = HitDef
triggerall = p2bodydist x <= 52
triggerall = p2stateno != 40 && p2stateno !=52 
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
attr = S, ST
damage = 0,0
animtype = Heavy
guardflag =
hitflag = M
priority = 4,Hit
pausetime = 0,0
sparkno = -1
guard.sparkno = -1
hitsound = S2,800
guardsound = S3,0
numhits = 0
ground.type = low
ground.slidetime = 1
ground.hittime = 1
ground.velocity = 0
air.velocity = 0
p1stateno = 1510
p1facing = 1
kill = 0
ID = 800

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Grab Success
[Statedef 1510]
type = S
movetype = A
physics = S
anim = 1510
ctrl = 0
velset = 0,0
sprpriority = 1

[State 1510, Width]
type = Width
triggerAll = AnimElem = 1
trigger1 = FrontEdgeDist < 60
edge = 60,0

[State 1510, Width]
type = Width
triggerAll = AnimElem = 8
trigger1 = BackEdgeDist < 35
edge = 0,35

[State 1510, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 4,4 + 10 * var(40)
channel = 0

[State 1510, Woosh]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1,2
channel = 1

[State 1510, TargetState]
type = TargetState
trigger1 = !Time
value = 1520

[State 1510, TargetBind]
type = TargetBind
trigger1 = AnimelemTime(1)=1
time = 1
pos = 20,0

[State 1510, Turn]
type = Turn
trigger1 = AnimElemTime(18)>1

[State 1510, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target State
[Statedef 1520]
type = S
movetype = H
physics = S

[State 1520, Turn]
type = Turn
trigger1 = !Time && facing = enemynear, facing
ignorehitpause = 1

[State 1520, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause=1

[State 1520, SprPriority]
type = SprPriority
trigger1 = !Time
value = 0
ignorehitpause=1

[State 1520, SprPriority]
type = SprPriority
trigger1 = Time=30
value = 2
ignorehitpause=1

[State 1520, ChangeAnim]
type= ChangeAnim2
trigger1 = Anim !=1520
value = 1520
ignorehitpause=1

[State 1520, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 1520, Turn]
type = Turn
trigger1 = AnimElem = 7

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -32

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
x = 8

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 8
trigger4 = AnimElem = 11
x = 4

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = -4

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = -8

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = -12

[State 1520, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) = 1
x = -12.921875

[State 1520, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) > 0
x = 0.8515625

[State 1520, SelfState]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1



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
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 1100,0
channel = 0

[State 1100, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4,13
channel = 0

[State 2900, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,2
channel = 1

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 2

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 1
y = ifElse(!var(10), -7.5, ifElse(var(10) = 1, -9, -10.5))

[State 2900, VelAdd]
type = Veladd
trigger1 = AnimElemTime(4) >= 2
y = 0.55

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 32

[State 2900, Fire Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4
attr = A, SA
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
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



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
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 2910, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 20

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
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
sparkXY = -10 + 0 * (var(35) := 78), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
