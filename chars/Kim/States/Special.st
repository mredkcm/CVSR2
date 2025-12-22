; _________________________________________
;| Kim Kaphwan by Jmorphman                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<HANGETSUZAN>=
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
var(10) = ifElse((P2MoveType = H || P2Dist x > 150 || var(20)), 2, ifElse(P2Dist x > 115, 1, 0))

[State 1000, Voice]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1000, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 1

[State 1000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 3

[State 1000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hangetsuzan Dust"
posType = P1
ownPal = 1

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4 + (var(10) * 2)
y = -3.6 - (var(10) * 0.5)

[State 1000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.6

[State 1101, Spark XY]
type = Null
trigger1 = AnimElem = 6
trigger1 = var(35) := 17 || var(36) := -124
trigger2 = AnimElem = 7
trigger2 = var(35) := 51 || var(36) := -50
trigger3 = AnimElem = 8
trigger3 = var(35) := 0 || var(36) := -132

[State 1000, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1001


;Landing
[StateDef 1001]
type = S
anim = ifElse(var(10) = 2, 1021, ifElse(var(10) = 1, 1011, 1001))
physics = N
moveType = A
velSet = 0,0

[State 1001, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1001, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 1001,0

[State 1001, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.375,0.375
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1001, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 1
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 1001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX HANGETSUZAN>=
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
var(25) = 19

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 22, -75
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
trigger1 = !Time
value = 1000,0
channel = 0

[State 1030, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 3

[State 1030, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 4

[State 1030, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hangetsuzan Dust"
posType = P1
ownPal = 1

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10
y = -3.25

[State 1030, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 1030, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1030, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1030
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 4, 2)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
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
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 17), var(36) := -124
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, Spark XY]
type = Null
trigger1 = AnimElem = 7
trigger1 = var(35) := 51 || var(36) := -50
trigger2 = AnimElem = 8
trigger2 = var(35) := 0 || var(36) := -132

[State 1030, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 4, 2)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
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
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, VarSet]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 1030, VarSet]
type = VarSet
trigger1 = NumTarget(1030)
var(10) = 1

[State 1030, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 8 && !var(10)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 4, 2)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
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
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1031


;Landing
[StateDef 1031]
type = S
anim = 1031
physics = N
moveType = A
velSet = 0,0

[State 1031, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1031, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 1001,0

[State 1031, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.375,0.375
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1031, HitDef]
type = HitDef
trigger1 = !var(16) && ((var(15) < 3) || var(20))
trigger1 = AnimElem = 1
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -6.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -6.81
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
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1031, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 1031, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<HISHOKYAKU>=
[StateDef 1100]
type = A
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 95, 2, ifElse(P2Dist x > 75, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,2
channel = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3.33 + (var(10) * 1.5)
y = 5.5

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = MoveContact = 1
value = 1101

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y && AnimElemTime(2) > 1
value = 1102


;Success
[StateDef 1101]
type = A
physics = N
moveType = A
anim = 1101
ctrl = 0
sprPriority = 1

[State 1101, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.1

[State 1101, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 2
ID = 1101
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -18
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 4
ID = 1101
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1101, Ingotokyaku]
type = VarSet
triggerAll = (!var(14) || AILevel) && pos y >= -25 && MoveContact
trigger1 = (command = "holddown" && command = "holdfwd") && (command = "a" || command = "rlsa") && !AILevel
trigger2 = (command = "holddown" && command = "holdfwd") && (command = "b" || command = "rlsb") && !AILevel
trigger3 = (command = "holddown" && command = "holdfwd") && (command = "c" || command = "rlsc") && !AILevel
trigger4 = AILevel && P2Dist x > 0
var(14) = 1103

[State 1101, Followup]
type = ChangeState
trigger1 = (var(14) = [1000,2999]) && pos y >= -25 && MoveContact
value = var(14)

[State 1101, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102


;Landing
[StateDef 1102]
type = S
anim = 1102
physics = N
moveType = I
velSet = 0,0

[State 1102, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1102, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1102, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1102, TargetState]
type = TargetState
trigger1 = !AnimTime && NumTarget(1101)
trigger1 = Target(1101), StateNo = 5001
value = 1105

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<INGOTOKYAKU>=
[StateDef 1103]
type = S
anim = 1103
physics = N
moveType = A
velSet = 0,0

[State 1103, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1103, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = -25,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1103, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1103, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ingotokyaku Dust"
posType = P1
pos = -25,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1103, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1103, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5

[State 1103, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 1103, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 3,5
channel = 1

[State 1103, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 101,0
channel = 3

[State 1103, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 1103
attr = C, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -4.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -3
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1103, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 1103, TargetState]
type = TargetState
trigger1 = NumTarget(1103) && MoveHit
trigger1 = Target(1103), StateNo != 1106
value = 1106
ignoreHitPause = 1
persistent = 0

[State 1103, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target State (Return to Standing)
[StateDef 1105]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1105, ChangeState]
type = SelfState
trigger1 = Time = 1
value = 0
ctrl = 1


;Target State (Hit by Ingotokyaku)
[StateDef 1106]
type = A
moveType = H
physics = N
velSet = 0,0

[State 1106, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 1106, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 1107


;Target State (Hit by Ingotokyaku, knocked away)
[StateDef 1107]
type = A
moveType = H
physics = N

[State 1107, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = GetHitVar(xVel)
y = GetHitVar(yVel)

[State 1107, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 1107, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= Const(movement.air.gethit.trip.groundlevel)
value = 5110



;====<EX HISHOKYAKU>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1130
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500

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
trigger1 = 1
var(25) = 2

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -85
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
trigger1 = !Time
value = 1100,0
channel = 0

[State 1130, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,2
channel = 3

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 7.33
y = 6.5

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.1

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, ChangeState]
type = ChangeState
trigger1 = MoveContact = 1
value = 1131

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y && AnimElemTime(2) > 1
value = 1132


;Success
[StateDef 1131]
type = A
physics = N
moveType = A
anim = 1131
ctrl = 0
sprPriority = 1

[State 1131, EX Flash]
type = VarSet
trigger1 = 1
var(25) = 2

[State 1131, VelSet]
type = VelSet
trigger1 = !Time
y = 5.5

[State 1131, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.1

[State 1131, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 2
ID = 1101
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -18
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1131, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 4
ID = 1101
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1131, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1131, Ingotokyaku]
type = VarSet
triggerAll = (!var(14) || AILevel) && pos y >= -25 && MoveContact
trigger1 = (command = "holddown" && command = "holdfwd") && (command = "a" || command = "rlsa") && !AILevel
trigger2 = (command = "holddown" && command = "holdfwd") && (command = "b" || command = "rlsb") && !AILevel
trigger3 = (command = "holddown" && command = "holdfwd") && (command = "c" || command = "rlsc") && !AILevel
trigger4 = AILevel && P2Dist x > 0
var(14) = 1133

[State 1131, Followup]
type = ChangeState
trigger1 = (var(14) = [1000,2999]) && pos y >= -25 && MoveContact
value = var(14)

[State 1131, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1132


;Landing
[StateDef 1132]
type = S
anim = 1132
physics = N
moveType = I
velSet = 0,0

[State 1132, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1132, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1132, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1132, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1132, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX INGOTOKYAKU>=
[StateDef 1133]
type = S
anim = 1103
physics = N
moveType = A
velSet = 0,0

[State 1133, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 26

[State 1133, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1133, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = -25,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1133, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1133, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ingotokyaku Dust"
posType = P1
pos = -25,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1133, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1133, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5

[State 1133, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 1133, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 3,5
channel = 1

[State 1133, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 101,0
channel = 3

[State 1133, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 1133
attr = C, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -4.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -3
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1133, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 1133, TargetState]
type = TargetState
trigger1 = NumTarget(1133) && MoveHit
trigger1 = Target(1133), StateNo != 1106
value = 1106
ignoreHitPause = 1
persistent = 0

[State 1133, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<HIENZAN>==
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

[State 1200, Button Detect (Normal)]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1

[State 1200, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 1

[State 1200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hienzan Dust"
posType = P1
ownPal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 1.5
y = -6.667 - (var(10) * 1.667)

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 1200, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 17 || var(36) := -28
trigger2 = AnimElem = 3
trigger2 = var(35) := 52 || var(36) := -84
trigger3 = AnimElem = 4
trigger3 = var(35) := 33 || var(36) := -121

[State 1200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 105, 98) < 7, 7, fvar(11) * ifElse(var(10) = 1, 105, 98))), 7
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 63, 56) < 7, 7, fvar(11) * ifElse(var(10) = 1, 63, 56))), 7
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 56, 49) < 7, 7, fvar(11) * ifElse(var(10) = 1, 56, 49))), 7
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
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

[State 1200, Tenshozan]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(6) < 0 && MoveContact && var(10) = 2
trigger1 = !AILevel
trigger1 = command = "holddown" && (command = "a" || command = "rlsa")
trigger2 = !AILevel
trigger2 = command = "holddown" && (command = "b" || command = "rlsb")
trigger3 = !AILevel
trigger3 = command = "holddown" && (command = "c" || command = "rlsc")
trigger4 = AILevel
var(14) = 1221

[State 1200, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElem = 6
value = var(14)

[State 1200, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201


;Landing
[StateDef 1201]
type = S
anim = 1201
physics = N
moveType = I
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

[State 1201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<TENSHOZAN>=
[StateDef 1221]
type = A
anim = 1221
physics = N
moveType = A

[State 1221, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,2
channel = 1

[State 1221, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 1221, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -2.16, 9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1221, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1221, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;====<EX HIENZAN>=
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
var(25) = 28

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1230, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1230, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 4

[State 1230, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1200,1
channel = 5

[State 1230, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1000,2
channel = 6

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1230, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hienzan Dust"
posType = P1
ownPal = 1

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3.5
y = -11.00100

[State 1230, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 1230, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 17 || var(36) := -28
trigger2 = AnimElem = 3 || AnimElem = 12
trigger2 = var(35) := 52 || var(36) := -84
trigger3 = AnimElem = 4 || AnimElem = 13
trigger3 = var(35) := 33 || var(36) := -121

[State 1230, First Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
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
ground.velocity = -2.16, -10.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, First Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
ground.velocity = -2.16, -10.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, First Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.velocity = -2.16, -10.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 12
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -6.81
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
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
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
ground.velocity = -2.16, 9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
moveType = I

[State 1230, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;=<KUSAJIN>==
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

[State 1300, Button Detect (Normal)]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0 && !var(10)
trigger2 = AnimElemTime(3) < 0 && var(10)
value = SCA
time = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 1300, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 1300, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 3

[State 1300, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 10 && var(10)
value = 1,5
channel = 4

[State 1300, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 5

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Kusajin Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3.333 + (var(10) * 0.333)
y = -5.667 - (var(10) * 0.467)

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 1
y = 0.267

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) >= 0 && !var(10)
trigger2 = AnimElemTime(15) >= 0 && var(10)
y = 0.5

[State 1300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 56, 91)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 56, 91)))), 7
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
ground.velocity = -2.16, -10.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 2]
type = HitDef
trigger1 = !var(16) && ((var(15) < 1 + var(10)) || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 35, ifElse(var(10) = 1, 42, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 35, ifElse(var(10) = 1, 42, 49)))), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.81
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 3]
type = HitDef
trigger1 = !var(16) && ((var(15) < 2 + (var(10) = 2)) || var(20))
trigger1 = AnimElem = 11 && var(10)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 28, 35) < 7, 7, fvar(11) * ifElse(var(10) = 2, 28, 35))), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.81
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
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0 && !var(10)
trigger2 = AnimElemTime(12) >= 0 && var(10)
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Landing
[StateDef 1301]
type = S
anim = 1301
physics = N
moveType = I
velSet = 0,0

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
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX KUSAJIN>=
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
var(25) = 37

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -1, -45
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 1330, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 3

[State 1330, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 4

[State 1330, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,5
channel = 5

[State 1330, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 14
value = 1,5
channel = 6

[State 1330, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 7

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Kusajin Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4.99900
y = -5.801

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 1
y = 0.167

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(19) >= 0
y = 0.5

[State 1330, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
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
ground.velocity = -2.16, -10.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -4.81
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 11
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -3.81
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
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 15
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -2.81
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 1330, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1330, Tenshozan]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(15) >= 0 && AnimElemTime(16) < 0 && MoveContact
trigger1 = !AILevel
trigger1 = command = "holddown" && (command = "a" || command = "rlsa")
trigger2 = !AILevel
trigger2 = command = "holddown" && (command = "b" || command = "rlsb")
trigger3 = !AILevel
trigger3 = command = "holddown" && (command = "c" || command = "rlsc")
trigger4 = AILevel
var(14) = 1331

[State 1330, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElem = 16
value = var(14)

[State 1330, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;====<TENSHOZAN (FROM EX KUSAJIN)>=
[StateDef 1331]
type = A
anim = 1331
physics = N
moveType = A

[State 1331, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 10

[State 1331, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,2
channel = 1

[State 1331, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 1331, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -2.16, 9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1331, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;====<RYUSEIRAKU>=
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
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 174, 2, ifElse(P2Dist x > 140, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))

[State 1400, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0
channel = 0

[State 1400, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 15 && !var(10)
trigger2 = AnimElem = 16 && var(10) = 1
trigger3 = AnimElem = 17 && var(10) = 2
value = 1400,1
channel = 0

[State 1400, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 1400, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 14 && !var(10)
trigger2 = AnimElem = 15 && var(10) = 1
trigger3 = AnimElem = 16 && var(10) = 2
value = 1000,1
channel = 3

[State 1400, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 4

[State 1400, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 13 && var(10) = 2
value = 41,0
channel = 5

[State 1400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 13 && var(10) = 2
stateType = A
physics = N

[State 1400, Dust Helper (Sliding)]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ryuseiraku Slide Dust"
posType = P1
pos = -25,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, Dust Helper (Jumping)]
type = Helper
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 13 && var(10) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryuseiraku Jump Dust"
posType = P1
ownPal = 1

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
x = 16

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 3.33 + (var(10) * 1.67)

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 8 && !var(10)
trigger2 = AnimElem = 9 && var(10) = 1
trigger3 = AnimElem = 10 && var(10) = 2
x = 0

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 13 && var(10) = 2
x = 2.5 + (var(10) * 0.5)
y = -7.5 - (var(10) * 0.8)

[State 1400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) > 0 && !var(10)
trigger2 = AnimElemTime(12) > 0 && var(10) = 1
trigger3 = AnimElemTime(13) > 0 && var(10) = 2
y = 1

[State 1400, ChangeAnimElem]
type = ChangeAnim
triggerAll = MoveContact = 1 && AnimElemTime(5) >= 0
trigger1 = AnimElemTime(8) <= 0 && !var(10)
trigger2 = AnimElemTime(9) <= 0 && var(10) = 1
trigger3 = AnimElemTime(10) <= 0 && var(10) = 2
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))
elem = ifElse(var(10) = 2, 10, ifElse(var(10) = 1, 9, 8))

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 1400
attr = C, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -7 - (var(10) * 0.5)
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -7 - (var(10) * 0.5)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -3
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 15
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 91, ifElse(var(10) = 1, 84, 77)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, 9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, TargetState]
type = TargetState
trigger1 = NumTarget(1400) && MoveHit
trigger1 = Target(1400), StateNo != 1106
value = 1106
ignoreHitPause = 1
persistent = 0

[State 1400, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401


;Landing
[StateDef 1401]
type = S
anim = 1401
physics = N
moveType = I
velSet = 0,0

[State 1401, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1401, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1401, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1401, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1401, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 5

[State 1401, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1401, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX RYUSEIRAKU>=
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
trigger1 = 1
var(25) = 2

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -1, -45
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0
channel = 0

[State 1430, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1400,1
channel = 0

[State 1430, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 3

[State 1430, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1000,1
channel = 4

[State 1430, Sliding Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 5

[State 1430, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 41,0
channel = 6

[State 1430, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 13
stateType = A
physics = N

[State 1430, Dust Helper (Sliding)]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ryuseiraku Slide Dust"
posType = P1
pos = -25,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, Dust Helper (Jumping)]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryuseiraku Jump Dust"
posType = P1
ownPal = 1

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
x = 16

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 7.67

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 4.5
y = -7.5

[State 1430, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(13) > 0
y = 1

[State 1430, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && AnimElemTime(5) >= 0
trigger1 = AnimElemTime(10) <= 0
value = 1430
elem = 10

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 1430
attr = C, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -7
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -3
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1430, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 15
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, 9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, TargetState]
type = TargetState
trigger1 = NumTarget(1430) && MoveHit
trigger1 = Target(1430), StateNo != 1106
value = 1106
ignoreHitPause = 1
persistent = 0

[State 1400, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401



;=<HAKIKYAKU>==
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
var(10) = 2

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim != 1521
value = 1500,0
channel = 0

[State 1500, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1001,0
channel = 1

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 3

[State 1500, Impact Dust]
type = Explod
trigger1 = AnimElem = 5
anim = 8105
sprPriority = -3
posType = P1
pos = 26,0
scale = 0.375,0.375
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1500, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 14
ampl = -4
freq = 120

[State 1500, PosAdd]
type = PosAdd
triggerAll = Anim != 1521
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 1500, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 3 && Anim = 1521
x = 16

[State 1500, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 9
x = -16

[State 1500, Projectile Shield]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1505
ID = 1505
name = "Hakikyaku Projectile Shield"
posType = P1
ownPal = 1

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10), 77, 70)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10), 77, 70)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -16.32, -10.32), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -18.52, -12.52)
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -8
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = command = "holdc" && !AILevel
trigger1 = AnimElemTime(6) = 5
trigger1 = var(10) = 2
value = 1521

[State 250, End]
type = ChangeState
trigger1 = !AnimTime && Anim = 1521
value = 2

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime && Anim != 1521
value = 0
ctrl = 1



;====<EX HAKIKYAKU>=
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
var(25) = 11

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 38, -68
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim != 1521
value = 1500,0
channel = 0

[State 1530, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1001,0
channel = 3

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 4

[State 1530, Impact Dust]
type = Explod
trigger1 = AnimElem = 5
anim = 8105
sprPriority = -3
posType = P1
pos = 26,0
scale = 0.375,0.375
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 14
ampl = -4
freq = 120

[State 1530, PosAdd]
type = PosAdd
triggerAll = Anim != 1521
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 1530, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 3 && Anim = 1521
x = 16

[State 1530, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 9
x = -16

[State 1530, Projectile Shield]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1505
ID = 1505
name = "Hakikyaku Projectile Shield"
posType = P1
ownPal = 1

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1530
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5,10
ground.cornerPush.velOff = 0
guard.velocity = -14.64
guard.cornerPush.velOff = 0
air.velocity = -1.5,10
air.cornerPush.velOff = 0
down.velocity = 0,0
down.cornerpush.veloff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -8
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1530, TargetState (Slammed against ground)]
type = TargetState
trigger1 = MoveHit && NumTarget(1530)
trigger1 = !(Target(1530), Time)
trigger1 = (Target(1530), StateNo = 5000) || (Target(1530), StateNo = 5010)
value = 5980
ID = 1530
ignoreHitPause = 1

[State 1530, ChangeAnim]
type = ChangeAnim
trigger1 = command = "holdc"
trigger1 = AnimElemTime(6) = 5
value = 1521

[State 1530, End]
type = ChangeState
trigger1 = !AnimTime && Anim = 1521
value = 2

[State 1530, End]
type = ChangeState
trigger1 = !AnimTime && Anim != 1521
value = 0
ctrl = 1



;====<SLAMMED AGAINST GROUND BY EX HAKIKYAKU>=
;Being Slammed
[StateDef 5980]
type = A
moveType = H
physics = N
velset = 0,0

[State 5980, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = ifElse(SelfAnimExist(5980), 5980, 5012)

[State 5980, End]
type = SelfState
trigger1 = HitShakeOver && pos y < 0
value = 5030

[State 5980, End]
type = ChangeState
trigger1 = HitShakeOver && pos y >= 0
value = 5981


;Hitting the Ground
[StateDef 5981]
type = L
moveType = H
physics = N
velSet = 0,0

[State 5981, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5101), 5101, 5100)

[State 5981, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5981, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 5981, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 5981, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,1

[State 5981, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0,0
sprPriority = -3

[State 5981, End]
type = ChangeState
trigger1 = !AnimTime
value = 5982


;Bouncing Off Ground
[StateDef 5982]
type = L
moveType = H
physics = N

[State 5982, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5161), 5161, 5160)

[State 5982, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 5982, VelSet]
type = VelSet
trigger1 = !Time
y = -2.4

[State 5982, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5982, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 12
value = 5110



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

[State 2900, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 2900, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 1

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hienzan Dust"
posType = P1
ownPal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 1.5
y = -6.667

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 2900, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 17 || var(36) := -28
trigger2 = AnimElem = 3
trigger2 = var(35) := 52 || var(36) := -84
trigger3 = AnimElem = 4
trigger3 = var(35) := 33 || var(36) := -121

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10,-58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



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
trigger1 = AnimElem = 3 && Random < 500
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -8
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2910
elem = 5
ignoreHitPause = 1

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
