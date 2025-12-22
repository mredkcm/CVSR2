; _______________________________________
;| Adon by Trololo                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<JAGUAR KICK>=
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
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 180, 0, ifElse((p2Dist x > 130 && P2Dist x <= 180), 1, 2))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1000, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 1

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Kick Dust"
posType = P1
ownPal = 1

[State 1000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000,1
channel = 4

[State 1000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1000, Jaguar Kick FX (LK)]
type = Explod
triggerall = var(10)=0
trigger1 = AnimElem = 8
anim = 1005
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Jaguar Kick FX (MK)]
type = Explod
triggerall = var(10)=1
trigger1 = AnimElem = 9
anim = 1015
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Jaguar Kick FX (HK)]
type = Explod
triggerall = var(10)=2
trigger1 = AnimElem = 10
anim = 1025
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, VelSet Light]
type = VelSet
trigger1 = AnimElem = 4 && var(10) = 0
x = 9
y = -5
[State 105,VelAdd Light]
type = VelAdd
trigger1 = var(10) = 0
trigger1 = AnimElem = 6,>= 0
y = 1.2

[State 1000, VelSet Medium]
type = VelSet
trigger1 = AnimElem = 4 && var(10) = 1
x = 5
y = -7
[State 105,VelAdd Medium]
type = VelAdd
trigger1 = var(10) = 1
trigger1 = AnimElem = 6,>= 0
y = 1.2

[State 1000, VelSet Hard]
type = VelSet
trigger1 = AnimElem = 4 && var(10) = 2
x = 2.5
y = -10
[State 105,VelAdd Hard]
type = VelAdd
trigger1 = var(10) = 2
trigger1 = AnimElem = 6,>= 0
y = 1.25

[State 1000, Air Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 9
ID = 1000
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 81 < 7, 7, fvar(11) * 81)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
guard.pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
guard.velocity = -10
air.velocity = -3.5,-6
yaccel = .5
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(15) < 2 && NumTarget(1000)) || var(20))
trigger1 = AnimElem = 10 && !movecontact
ID = 1001
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 81 < 7, 7, fvar(11) * 81)), 7
givePower = 36, 36
pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
guard.pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
guard.velocity = -10
air.velocity = -3.5,-6
yaccel = .5
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 1000, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1001

;Landing
[StateDef 1001]
type = S
physics = S
moveType = I
Anim = 1001
velSet = 0,0

[State 1001, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1001, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1001, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1001, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX JAGUAR KICK>=
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
var(25) = 35

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 8, -75
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(40) = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,2
channel = 0

[State 1030, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1030, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000,1
channel = 5

[State 1030, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Kick Dust"
posType = P1
ownPal = 1

[State 1030, Jaguar Kick FX]
type = Explod
trigger1 = AnimElem = 8
anim = 1005
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 8
y = -8
[State 105,VelAdd]
type = VelAdd
trigger1 = AnimElem = 6,>= 0
y = 1.75

[State 1030, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = !movehit
trigger1 = (AnimElem = 10 || AnimElem = 11)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 12
moveType = I

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1001

;====<AIRBORNE JAGUAR KICK>=
[StateDef 1040]
type = A
physics = N
moveType = A
anim = 1040
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1040, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1040, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 190, 2, ifElse((p2Dist x > 170 && P2Dist x <= 190), 1, 0))

[State 1040, Jaguar Kick FX]
type = Explod
trigger1 = AnimElem = 5
anim = 1045
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1040, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = ifelse(var(10)=2,6,ifelse(var(10)=1,5,4))
y = -5
[State 105,VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,>= 0
y = 0.8

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1040, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1040, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,1
channel = 4

[State 1040, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1040, Air Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1040
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 81 < 7, 7, fvar(11) * 81)), 7
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
down.hitTime = 20
ground.velocity = -4.5
guard.velocity = -10
air.velocity = -2.5,-8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1040, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || (var(15) < 2 && NumTarget(1040)) || var(20))
trigger1 = AnimElem = 7 && !movehit
ID = 1041
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 81 < 7, 7, fvar(11) * 81)), 7
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
down.hitTime = 20
ground.velocity = -4.5
guard.velocity = -10
air.velocity = -2.5,-8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1040, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1040, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1001

;====<EX AIRBORNE JAGUAR KICK>=
[StateDef 1050]
type = A
physics = N
moveType = A
anim = 1050
ctrl = 0
sprPriority = 1
powerAdd = -500

[State 1050, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1050, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 35

[State 1050, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 8, -75
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1050, EX Flash]
type = VarSet
trigger1 = !Time
var(40) = 1

[State 1050, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1040, Jaguar Kick FX]
type = Explod
trigger1 = AnimElem = 5
anim = 1045
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1050, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 7
y = -5
[State 105,VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,>= 0
y = 0.8

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,2
channel = 0

[State 1050, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,1
channel = 4

[State 1050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1050, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1050, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = !movehit
trigger1 = (AnimElem = 7 || AnimElem = 8)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1050, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1001

;====<RISING JAGUAR>=
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

[State 1100, Button Detect (Normal)]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(((P2BodyDist x >= 130 && P2BodyDist x < 140) && (P2BodyDist y >= -120 && P2BodyDist y < -82)), 2, ifElse(((P2BodyDist x >= 120 && P2BodyDist x < 130) && (P2BodyDist y >= -82 && P2BodyDist y < -31)), 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
value = 1,5
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1100, Roar Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,1
channel = 4

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tiger Kick Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifElse(var(10) = 2, 9, ifElse(var(10) = 1, 8.5, 8))
y = ifElse(var(10) = 2, -9.5, ifElse(var(10) = 1, -8.5, -7))

[State 1100,VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1100,VelAdd]
type = VelAdd
trigger1 = AnimElem = 2,> 0
y = .55

[State 1100, 6]
type = VelMul
trigger1 = 1
x = 0.95

[State 1100, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 52 < 7, 7, fvar(11) * 52)), 7
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
ground.velocity = -2.5, -8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Airbourne Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), 42, 52) < 7, 7, fvar(11) * ifElse(var(10), 42, 52))), 7
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
ground.velocity = -2.5, -8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101


;Landing
[StateDef 1101]
type = S
physics = N
moveType = I
velSet = 0,0
anim = 1101

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

;====<EX RISING JAGUAR>=
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
var(25) = 35

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 18, -45
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,2
channel = 0

[State 1130, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 3

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 4

[State 1130, Roar Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 5

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Rising Jaguar Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10.5
y = -9.5

[State 1130,VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1130,VelAdd]
type = VelAdd
trigger1 = AnimElem = 2,> 0
y = .55

[State 1130, 6]
type = VelMul
trigger1 = 1
x = 0.95

[State 1130, Ground Hit 1]
type = HitDef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 0, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.32, -7.32
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 47), var(36) := -60

[State 1130, Ground Hit 2]
type = HitDef
triggerall = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 0, 36
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
ground.velocity = -7.32, -7.32
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68

[State 1130, Air Hit]
type = HitDef
triggerall = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 51 < 7, 7, fvar(11) * 51)), 7
getPower = 0,0
givePower = 0, 36
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
ground.velocity = -7.16, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.16, -9.81
air.cornerpush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -80

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101

;====<JAGUAR TOOTH>=
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
trigger1 = Backedgebodydist <= 10 && AILevel
var(10) = ifElse(P2Dist x > 190, 2, ifElse((p2Dist x > 128 && P2Dist x <= 190), 1, 0))

[State 1200,ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1200,StateTypeSet]
type = StateTypeSet
triggerall = anim = 1200
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1200, NotHitBy]
type = NotHitBy
triggerall = anim = 1200
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1200, Jump Sound]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1200,VelSet]
type = VelSet
triggerall = anim = 1200
trigger1 = AnimElem = 3
x = -(Backedgebodydist*0.046)
y = -9.5

[State 1200,VelAdd]
type = VelAdd
triggerall = anim = 1200
trigger1 = AnimElem = 3,>0
y = .45

[State 1200, Dust Helper]
type = Helper
triggerall = anim = 1200
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Tooth Dust"
posType = P1
ownPal = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 3
value = 1200, 0

[State 1200, End]
type = ChangeAnim
triggerall = anim = 1200
trigger1 = AnimElem = 6,>=0
trigger1 = Backedgebodydist <= 10
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1220, 1210))

[State 1200, Voice]
type = PlaySnd
triggerall = anim != 1200
trigger1 = AnimElem = 2
value = 1200, 1
channel = 0

[State 1200, Woosh Sound]
type = PlaySnd
triggerall = anim != 1200
trigger1 = AnimElem = 3
value = 1200, 2
channel = 1

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
triggerall = anim != 1200
trigger1 = AnimElem = 1
stateType = A
physics = N

[State 1200, PosFreeze]
type = PosFreeze
triggerall = anim != 1200
trigger1 = animelemtime(1)>=0 && animelemtime(2)<0
value = 1

[State 1200, VelSet]
type = VelSet
triggerall = anim != 1200
trigger1 = AnimElem = 4
x = ifElse(var(10) = 2, 17.0, ifElse(var(10) = 1, 13.0, 8.0))
y = 9-var(10)*2

[State 1200, VelAdd]
type = VelAdd
trigger1 = anim != 1200
y = .6

[State 1200, HitDef (LK)]
type = HitDef
trigger1 = anim = 1210
trigger1 = AnimElem = 4
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)))), ifElse(var(10) = 2, 11, ifElse(var(10) = 1, 10, 9))
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 0, 36
pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
guard.pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7
guard.velocity = -4
air.velocity = -5.5,-6
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
SparkXY = -10 + 0 * (var(35) := 54), var(36) := -31
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef (MK/HK)]
type = HitDef
trigger1 = anim = 1220
trigger1 = AnimElem = 4
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)))), ifElse(var(10) = 2, 11, ifElse(var(10) = 1, 10, 9))
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 0, 36
pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
guard.pauseTime = ifElse(var(20), (13*.5), 13), ifElse(var(20), (13*.5), 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7
guard.velocity = -4
air.velocity = -5.5,-6
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
SparkXY = -10 + 0 * (var(35) := 64), var(36) := -45
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, ChangeState]
type = ChangeState
triggerall = pos y > -vel y
trigger1 = anim = 1200 && animelemtime(9)>=0
trigger2 = anim != 1200
value = 1201

;Landing
[StateDef 1201]
type = S
physics = S
moveType = I
Anim = 1201
velSet = 0,0

[State 1201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1201, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX JAGUAR TOOTH>=
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
var(25) = 45

[State 1230, NotHitBy]
type = NotHitBy
triggerall = anim = 1200
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1230, EX FX]
type = Explod
triggerall = anim = 1200
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 18, -60
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
triggerall = anim = 1200
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230,ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1230,StateTypeSet]
type = StateTypeSet
triggerall = anim = 1200
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1230,VelSet]
type = VelSet
triggerall = anim = 1200
trigger1 = AnimElem = 3
x = -(Backedgebodydist*0.056)
y = -9.5

[State 1230,VelAdd]
type = VelAdd
triggerall = anim = 1200
trigger1 = AnimElem = 3,>0
y = .45

[State 1230, Jump Sound]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1230,PlaySnd]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 3
value = 1200, 0

[State 1230, Dust Helper]
type = Helper
triggerall = anim = 1200
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Tooth Dust"
posType = P1
ownPal = 1

[State 1230,End]
type = ChangeAnim
triggerall = anim = 1200
trigger1 = AnimElem = 6,>=0
trigger1 = Backedgebodydist <= 10
value = 1230

[State 1230, Voice]
type = PlaySnd
triggerall = anim = 1230
trigger1 = AnimElem = 2
value = 1200, 3
channel = 0

[State 1230, Woosh Sound]
type = PlaySnd
triggerall = anim = 1230
trigger1 = AnimElem = 3
value = 1200, 2
channel = 1

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
triggerall = anim = 1230
trigger1 = AnimElem = 1
stateType = A
physics = N

[State 1200, PosFreeze]
type = PosFreeze
triggerall = anim = 1230
trigger1 = animelemtime(1)>=0 && animelemtime(2)<0
value = 1

[State 1230, VelSet]
type = VelSet
triggerall = anim = 1230
trigger1 = AnimElem = 4
x = 17.0
y = 3

[State 1230,VelAdd]
type = VelAdd
trigger1 = anim = 1230
y = .6

[State 1230, HitDef]
type = HitDef
trigger1 = anim = 1230
trigger1 = AnimElem = 4
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 125 < 7, 7, fvar(11) * 125)), 9
getPower = 0,0
givePower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.32, -7.79
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.32, -7.79
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
SparkXY = -10 + 0 * (var(35) := 64), var(36) := -45
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1141, End]
type = ChangeState
triggerall = pos y > -vel y
trigger1 = anim = 1200 && animelemtime(9)>=0
trigger2 = anim = 1230
value = 1201

;====<THOUSAND JAGUAR>=
;Startup
[StateDef 1300]
type = S
physics = N
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
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = !NumEnemy
var(10) = 2

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumEnemy
var(10) = ifElse((EnemyNear, GetHitVar(HitTime) <= 4), 0, ifElse((EnemyNear, GetHitVar(HitTime) <= 6), 1, 2))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300, 0
channel = 0

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 1301

;Looping
[StateDef 1301]
type = S
physics = N
moveType = A
anim = 1301
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1301, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1301, Button Detect]
type = VarSet
trigger1 = Time && !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(11) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1301, Button Detect (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = Time && AnimElem = 5
var(11) = ifElse(Random < 500, 2, ifElse(Random < 500, 1, 0))

[State 1301, Tap Punch (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = NumEnemy
trigger1 = P2StateType != A && (P2BodyDist x = [0,58])
var(46) = 10

[State 1301, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1321, ifElse(var(10) = 1, 1311, 1301))

[State 1301, Loop]
type = ChangeAnim
trigger1 = !AnimTime
trigger2 = Anim = 1301
trigger2 = var(11) != 0 && AnimElemTime(11) >= 0
trigger3 = Anim = 1311
trigger3 = var(11) != 1 && AnimElemTime(12) >= 0
value = ifElse(var(11) = 2, 1321, ifElse(var(11) = 1, 1311, 1301))
elem = 1

[State 1301, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
trigger4 = AnimElem = 10
value = 1,0

[State 1301, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 84 || var(36) := -103
trigger2 = AnimElem = 4
trigger2 = var(35) := 76 || var(36) := -53
trigger3 = AnimElem = 7
trigger3 = var(35) := 87 || var(36) := -73
trigger4 = AnimElem = 10
trigger4 = var(35) := 81 || var(36) := -81

[State 1301, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 ||  AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -4.3,0
ground.cornerPush.velOff = 0
guard.velocity = -5.3
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 || AnimElem = 7
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -4.3,0
ground.cornerPush.velOff = 0
guard.velocity = -5.3
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, End]
type = ChangeState
trigger1 = var(46) <= 0
value = 1302

;Recover
[Statedef 1302]
type = S
physics = N
moveType = I
anim = 1302
ctrl = 0
sprPriority = 1
moveHitPersist = 1

[State 1302, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX THOSAND JAGUAR>=
[StateDef 1330]
type = S
physics = N
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
var(25) = 34

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 15, -80
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300, 1
channel = 0

[State 1330, End]
type = ChangeState
trigger1 = !AnimTime
value = 1331

;Looping
[StateDef 1331]
type = S
physics = N
moveType = A
anim = 1331
ctrl = 0
velSet = 12.7,0
sprPriority = 1

[State 1331, Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1331, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
trigger4 = AnimElem = 10
value = 1,0

[State 1331, VelAdd]
type = VelAdd
trigger1 = vel x > 0
x = -0.89828

[State 1331, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1331, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 82 || var(36) := -100
trigger2 = AnimElem = 4
trigger2 = var(35) := 76 || var(36) := -54
trigger3 = AnimElem = 7
trigger3 = var(35) := 85 || var(36) := -76
trigger4 = AnimElem = 10
trigger4 = var(35) := 80 || var(36) := -81

[State 1331, HitDef High]
type = HitDef
trigger1= !var(16) && var(15) < 4
trigger1 = AnimElem = 1
ID = 1330
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.40, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.40, -6.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, HitDef Low]
type = HitDef
trigger1= !var(16) && var(15) < 5
trigger1 = AnimElem = 4
ID = 1330
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.40, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.40, -6.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, HitDef Straight]
type = HitDef
trigger1= !var(16) && var(15) < 6
trigger1 = AnimElem = 7
ID = 1330
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.40, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.40, -6.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, HitDef Upper]
type = HitDef
trigger1= !var(16) && var(15) < 7
trigger1 = AnimElem = 10
ID = 1330
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.40, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.40, -6.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, Juggle Points Reset]
type = VarSet
triggerall = !var(16) && var(15) < 5
trigger1 = AnimElemTime(12) = 1
var(15) = 0
ignoreHitPause = 1

[State 1331, End]
type = ChangeState
trigger1 = !AnimTime
value = 1302

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
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
value = 1,2

[State 2900, Spark XY]
type = Null
trigger1 = AnimElem = 3
trigger1 = var(35) := 82 || var(36) := -100
trigger2 = AnimElem = 6
trigger2 = var(35) := 76 || var(36) := -54
trigger3 = AnimElem = 9
trigger3 = var(35) := 85 || var(36) := -76
trigger4 = AnimElem = 12
trigger4 = var(35) := 80 || var(36) := -81

[State 2900, HitDef High]
type = HitDef
trigger1 = AnimElem = 3 ||  AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -1.60, -7
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.60, -7
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, HitDef Low]
type = HitDef
trigger1 = AnimElem = 6 || AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -1.60, -7
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.60, -7
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
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
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,0
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 2910, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 2910, Roar Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,1
channel = 4

[State 2910, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 2910, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tiger Kick Dust"
posType = P1
ownPal = 1

[State 2910, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8
y = -7

[State 2910,VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 2910,VelAdd]
type = VelAdd
trigger1 = AnimElem = 2,> 0
y = .55

[State 2910, 6]
type = VelMul
trigger1 = 1
x = 0.95

[State 2910, Ground Hit]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0
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
ground.velocity = -2.5, -8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, Airbourne Hit]
type = HitDef
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0
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
ground.velocity = -2.5, -8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2910, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201