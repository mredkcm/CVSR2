; _________________________________________
;| Gen by mwryly & varo_hades              |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<HYAKURENKU>==
;Startup
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
trigger1 = !Time
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1000, PosAdd]
type = PosAdd
trigger1 = !Time
x = 5 + (Var(10)*2)

[State 1000, End]
type = ChangeState
trigger1 = PrevStateNo!= 750
trigger1 = !AnimTime
value = 1001

[State 1000, End]
type = ChangeState
trigger1 = PrevStateNo = 750
trigger1 = !AnimTime
value = 1031

;Looping
[StateDef 1001]
type = S
physics = N
moveType = A
anim = 1001
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1101, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1101, Button Detect]
type = VarSet
trigger1 = Time
trigger1 = command = "x" || command = "y" || command = "z"
var(11) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1101, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1003, ifElse(var(10) = 1, 1002, 1001))

[State 1101, Loop]
type = ChangeAnim
trigger1 = !AnimTime
trigger2 = Anim = 1001
trigger2 = var(11) != 0 && AnimElemTime(7) >= 0
trigger3 = Anim = 1002
trigger3 = var(11) != 1 && AnimElemTime(8) >= 0
value = ifElse(var(11) = 2, 1003, ifElse(var(11) = 1, 1002, 1001))
elem = 1

[State 1101, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 5
value = 4,1

[State 1101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
trigger4 = AnimElem = 10
value = 1,4

[State 1101, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 111 || var(36) := -39
trigger2 = AnimElem = 3
trigger2 = var(35) := 111 || var(36) := -76
trigger3 = AnimElem = 5
trigger3 = var(35) := 111 || var(36) := -45
trigger4 = AnimElem = 7
trigger4 = var(35) := 111 || var(36) := -62

[State 1101, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 || AnimElem = 5
trigger1 = p2BodyDist x <= 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = ifElse(!var(13), 36, 18) * !var(20), 6 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(Var(46)>6 && Var(12) < 2+Var(10), -1.91, -11.30),0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(Var(46)>6 && Var(12) < 2+Var(10), -2.11, -15.30)
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 ||  AnimElem = 7
trigger1 = p2BodyDist x <= 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = ifElse(!var(13), 36, 18) * !var(20), 6 * !var(20)
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
ground.velocity = ifElse(Var(46)>6 && Var(12) < 2+Var(10), -1.91, -11.30),0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(Var(46)>6 && Var(12) < 2+Var(10), -4.42, -15.30)
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 || AnimElem = 5
trigger1 = p2BodyDist x > 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = ifElse(!var(13), 36, 18) * !var(20), 6 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -11.30,0
ground.cornerPush.velOff = 0
guard.velocity = -15.30
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 ||  AnimElem = 7
trigger1 = p2BodyDist x > 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = ifElse(!var(13), 36, 18) * !var(20), 6 * !var(20)
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
ground.velocity = -11.30,0
ground.cornerPush.velOff = 0
guard.velocity = -15.30
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, End]
type = ChangeState
trigger1 = var(46) <= 0
value = 1010

;Recover
[Statedef 1010]
type = S
physics = N
moveType = I
anim = 1011
ctrl = 0
sprPriority = 1
moveHitPersist = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1102, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo!= 1031
value = ifElse(var(10) = 2, 1013, ifelse(var(10) = 1, 1012, 1011))

[State 1102, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 1031
value = 1012

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;====<EX HYAKURENKU>=
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
poweradd = -500
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = -1

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 22, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, PosAdd]
type = PosAdd
trigger1 = !Time
x = 15

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 1031

;Looping
[StateDef 1031]
type = S
physics = N
moveType = A
anim = 1003
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1101, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1101, Cancel Restriction]
type = VarSet
trigger1 = PrevStateNo = 1000
trigger1 = Time
var(7) = 0

[State 1101, Loop]
type = ChangeAnim
trigger1 = !AnimTime
value = 1003
elem = 1

[State 1101, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 5
value = 4,1

[State 1101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
trigger4 = AnimElem = 10
value = 1,4

[State 1101, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 111 || var(36) := -39
trigger2 = AnimElem = 3
trigger2 = var(35) := 111 || var(36) := -76
trigger3 = AnimElem = 5
trigger3 = var(35) := 111 || var(36) := -45
trigger4 = AnimElem = 7
trigger4 = var(35) := 111 || var(36) := -62

[State 1101, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 1 || AnimElem = 5
trigger1 = p2BodyDist x <= 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(Var(46)>9 && Var(12) < 6, -1.91, -11.30), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(Var(46)>6 && Var(12) < 6, -2.11, -15.30)
guard.cornerPush.velOff = 0
air.velocity = -6.32, -3.745
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3 ||  AnimElem = 7
trigger1 = p2BodyDist x <= 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = 0, 12 * !var(20)
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
ground.velocity = ifElse(Var(46)>9 && Var(12) < 6, -1.91, -11.30), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(Var(46)>6 && Var(12) < 6, -2.11, -15.30)
guard.cornerPush.velOff = 0
air.velocity = -6.32, -3.745
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 1 || AnimElem = 5
trigger1 = p2BodyDist x > 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -11.30, 0
ground.cornerPush.velOff = 0
guard.velocity = -15.30
guard.cornerPush.velOff = 0
air.velocity = -6.32, -3.745
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3 ||  AnimElem = 7
trigger1 = p2BodyDist x > 50
ID = 1000
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 4
getPower = 0, 12 * !var(20)
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
ground.velocity = -11.30, 0
ground.cornerPush.velOff = 0
guard.velocity = -15.30
guard.cornerPush.velOff = 0
air.velocity = -6.32, -3.745
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1101, End]
type = ChangeState
trigger1 = var(46) <= 0
value = 1010

;====<GEKIRO>=
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
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 2 && !var(10)
trigger2 = AnimElemTime(4) < 6 && var(10) = 1
trigger3 = AnimElemTime(4) < 0 && var(10) = 2
value = SCA
time = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,4
channel = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1
channel = 1

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1100, MoveType: Idle]
type = StateTypeSet
trigger1 = AnimElem = 5
moveType = I

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

;[State 0, PosAdd]
;type = PosAdd
;trigger1 = (PrevStateNo = [200, 499]) && !Time
;trigger2 = (PrevStateNo = [10200, 10499]) && !Time
;x = 20

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) > 2 && AnimElemTime(4) < 2
x = 5.285 ;+ (var(10) * 1.111)
y = -7.285 - (var(10) * 1.111)

[State 1100, VelSet]
type = VelMul
trigger1 = AnimElemTime(4) >= 2
x = 0.88
y = 0.88

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = 0.29

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, ifElse(var(10), -10.81, -9.76)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, ifElse(var(10), -8.41, -7.89)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -89
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(4) > 5 && MoveContact;&& Var(14) > 0
trigger1 = Command = "a" || Command = "b" || Command = "c"
trigger1 = Var(24):= 20
value = 1150

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(4) > 0 && vel y > 1.95 && !MoveContact
value = 1101

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;===
;Set 1 kicks
[StateDef 1150]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
faceP2 = 1

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(Random > 500, 1150, 1152)

;[State 1100, Voice]
;type = PlaySnd
;trigger1 = AnimElem = 3
;value = 1100,0
;channel = 0

;[State 1100, Vars]
;type = VarSet
;trigger1 = !Time
;var(24) = 0

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) > 2 && AnimElemTime(4) < 2
x = 5
y = -7.285 ;- (var(10) * 1.111)

[State 1100, VelSet]
type = VelSet
trigger1 = 1
x = 1.38
y = -1.37

[State 1100, VelSet]
type = VelMul
trigger1 = 1
x = 0.88
y = 0.88

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) >= 0
y = 0.45

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = AnimElem = 2
ID = 1100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 4, 10, fvar(11) * 10)), 1
getPower = ifElse(var(25)>0, 0, ifElse(!var(13), 36, 18)) * (!var(20)||!var(25)), 12 * !var(20)
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
ground.velocity = -2.16, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.08, -5.05
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
sparkXY = -10 + 0 * (var(35) := 125), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

;[State 1100, Vars]
;type = VarAdd
;trigger1 = MoveHit && NumTarget(1100)
;trigger1 = command = "a" || command = "b" || command = "c"
;var(24) = 1

[State 1100, Tap Kick Decrement]
type = VarAdd
triggerAll = !Var(25)
trigger1 = !var(20)
trigger1 = AnimElemTime(2) >= 0 && (Command = "a" || Command = "b" || Command = "c")
var(24) = (16+var(10)) - 2*var(14)

[State 1100, ChangeState]
type = ChangeState
triggerAll = Var(25)
trigger1 = AnimElemTime(2) > 0 && Var(14) = 6
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1160

[State 1100, ChangeState]
type = ChangeState
triggerAll = !Var(25)
trigger1 = AnimElemTime(2) > 0 && Var(14) = 4 + Var(10)
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1160

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0 && Var(14) > 0
trigger1 = Command = "a" || Command = "b" || Command = "c"
trigger1 = Movehit > 0
value = 1155

[State 1100, ChangeState]
type = ChangeState
trigger1 = Var(25)
trigger1 = AnimElemTime(4) >= 5
value = 1101

[State 1100, ChangeState]
type = ChangeState
triggerAll = !Var(25)
trigger1 = AnimElemTime(4) >= 0 && Var(24) <= 0
trigger2 = Var(24) > 33 - (Var(14)*2)
trigger3 = AnimElemTime(4) >= 30 && !Movehit
value = 1101

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Set 2 kicks
[StateDef 1155]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
faceP2 = 1

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(Random > 500, 1151, 1153)

;[State 1100, Voice]
;type = PlaySnd
;trigger1 = AnimElem = 3
;value = 1100,0
;channel = 0

;[State 1100, Vars]
;type = VarSet
;trigger1 = !Time
;var(24) = 0

[State 1100, VelSet]
type = VelSet
trigger1 = 1
x = 1.38
y = -1.37

[State 1100, VelSet]
type = VelMul
trigger1 = 1
x = 0.88
y = 0.88

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) >= 0
y = 0.45

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = AnimElem = 2
ID = 1100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 4, 10, fvar(11) * 10)), 1
getPower = ifElse(var(25)>0, 0, ifElse(!var(13), 36, 18)) * !var(20), 12 * !var(20)
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
ground.velocity = -2.16, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.08, -5.05
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
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

;[State 1100, Vars]
;type = VarAdd
;trigger1 = MoveHit && NumTarget(1100)
;trigger1 = command = "a" || command = "b" || command = "c"
;var(24) = 1

[State 1100, Tap Kick Decrement]
type = VarAdd
triggerAll = !Var(25)
trigger1 = !var(20)
trigger1 = AnimElemTime(2) >= 0 && (command = "a" || command = "b" || command = "c")
var(24) = (16+var(10)) - 2*var(14)

[State 1100, ChangeState]
type = ChangeState
triggerAll = Var(25)
trigger1 = AnimElemTime(2) > 0 && Var(14) = 6
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1160

[State 1100, ChangeState]
type = ChangeState
triggerAll = !Var(25)
trigger1 = AnimElemTime(2) > 0 && Var(14) = 4 + Var(10)
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1160

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(2) > 0 && Var(14) > 0
trigger1 = Command = "a" || Command = "b" || Command = "c"
trigger1 = Movehit > 0
value = 1150

[State 1100, ChangeState]
type = ChangeState
trigger1 = Var(25)
trigger1 = AnimElemTime(4) >= 5
value = 1101

[State 1100, ChangeState]
type = ChangeState
triggerAll = !Var(25)
trigger1 = AnimElemTime(4) >= 0 && Var(24) <= 0
trigger2 = Var(24) > 33 - (Var(14)*2)
trigger3 = AnimElemTime(4) >= 30 && !Movehit
value = 1101

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Final
[StateDef 1160]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
faceP2 = 1

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1160

;[State 1100, Voice]
;type = PlaySnd
;trigger1 = AnimElem = 3
;value = 1100,0
;channel = 0

[State 1100, Vars]
type = VarSet
trigger1 = !Time
var(24) = 0

[State 1100, VelSet]
type = VelSet
trigger1 = Animelem = 1
x = 1.38
y = -1.37

[State 1100, VelSet]
type = VelMul
trigger1 = AnimElemTime(7) < 0
x = 0.88
y = 0.88

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.57

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = AnimElem = 4
ID = 1100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -2.16, -5.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, 5
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
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Recovery
[StateDef 1101]
type = A
anim = 1105
physics = N
moveType = I
velset = 0, 0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1100, VelAdd]
type = VelAdd
trigger1 = animelemtime(2) > 0
y = 0.45

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Landing
[StateDef 1105]
type = S
anim = 1101
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
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX GEKIRO>=
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
var(25) = 9999

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(1 * const(size.xScale)), ceil(-55 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,4
channel = 0

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1
channel = 2

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1100, MoveType: Idle]
type = StateTypeSet
trigger1 = AnimElem = 5
moveType = I

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

;[State 0, PosAdd]
;type = PosAdd
;trigger1 = (PrevStateNo = [200, 499]) && !Time
;trigger2 = (PrevStateNo = [10200, 10499]) && !Time
;x = 20

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) > 2 && AnimElemTime(4) < 2
x = 6.396
y = -7.285

[State 1100, VelSet]
type = VelMul
trigger1 = AnimElemTime(4) >= 2
x = 0.88
y = 0.88

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = 0.29

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 7
getPower = 0 * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, ifElse(var(10), -9.81, -7.76)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, ifElse(var(10), -10.81, -9.76)
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
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -89
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(4) > 5 && MoveContact
trigger1 = Command = "a" || Command = "b" || Command = "c"
value = 1150

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(4) > 0 && vel y > 1.95 && !MoveContact
value = 1101

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;====<JYASEN>=
[StateDef 11000]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 11000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 11000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 11020, ifElse(var(10) = 1, 11010, 11000))

[State 11000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 11000, Width]
type = Width
trigger1 = AnimElemTime(6) < 0 && !var(10)
trigger2 = AnimElemTime(10) < 0 && var(10) = 1
trigger3 = AnimElemTime(14) < 0 && var(10) = 2
value = -20

[State 11000, Vel]
type = Velset
triggerAll = AnimelemTime(2) > 0
trigger1 = AnimElemTime(6) < 0 && !var(10)
trigger2 = AnimElemTime(10) < 0 && var(10) = 1
trigger3 = AnimElemTime(14) < 0 && var(10) = 2
x = 6.5

[State 11000, Vel]
type = Velset
trigger1 = Animelem = 6 && !var(10)
trigger2 = Animelem = 10 && var(10) = 1
trigger3 = Animelem = 14 && var(10) = 2
x = 0

[State 11000, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4,4
channel = 0

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 11000
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef Roll]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = (AnimElem = 5 || AnimElem = 9 || AnimElem = 13)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.43, -5.26), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -19
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef Final]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = (AnimElem = 8 && !var(10) || AnimElem = 12 && var(10) = 1 || AnimElem = 16 && var(10) = 2)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.48, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1100, Skid Dust]
type = Explod
trigger1 = AnimElem = 3 && !var(10)
trigger2 = (AnimElem = 3 || AnimElem = 7) && var(10) = 1
trigger3 = (AnimElem = 3 || AnimElem = 7 || AnimElem = 11) && var(10) = 2
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 11000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0 && !var(10)
trigger2 = AnimElemTime(13) >= 0 && var(10) = 1
trigger3 = AnimElemTime(17) >= 0 && var(10) = 2
moveType = I

[State 11000, ChangeAnim]
type = ChangeAnim
triggerall = !var(10)
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11000
elem = 9
ignoreHitPause = 1

[State 11000, ChangeAnim]
type = ChangeAnim
triggerall = var(10) = 1
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11010
elem = 13
ignoreHitPause = 1

[State 11000, ChangeAnim]
type = ChangeAnim
triggerall = var(10) = 1
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11020
elem = 17
ignoreHitPause = 1

[State 11000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX JYASEN>=
[StateDef 11030]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 11030, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = 2

[State 11030, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 11030, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 11020

[State 11030, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 3
value = SCA
time = 1

[State 11030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 31+8*var(10)

[State 11030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-25 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 11000, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4,4
channel = 0

[State 11030, Width]
type = Width
trigger1 = AnimElemTime(6) < 0 && !var(10)
trigger2 = AnimElemTime(10) < 0 && var(10) = 1
trigger3 = AnimElemTime(14) < 0 && var(10) = 2
value = -20

[State 11030, Vel]
type = Velset
trigger1 = AnimElemTime(2) > 0 && AnimelemTime(4) < 0
x = 9

[State 11030, Vel]
type = Velset
triggerAll = AnimElemTime(3) > 0
trigger1 = AnimElemTime(6) < 0 && !var(10)
trigger2 = AnimElemTime(10) < 0 && var(10) = 1
trigger3 = AnimElemTime(14) < 0 && var(10) = 2
x = 6.5

[State 11030, Vel]
type = Velset
trigger1 = Animelem = 6 && !var(10)
trigger2 = Animelem = 10 && var(10) = 1
trigger3 = Animelem = 14 && var(10) = 2
x = 0

[State 11030, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
ID = 11000
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11030, HitDef Roll]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = (AnimElem = 5 || AnimElem = 9 || AnimElem = 13)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.43, -5.26), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -19
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11030, HitDef Final]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = (AnimElem = 8 && !var(10) || AnimElem = 12 && var(10) = 1 || AnimElem = 16 && var(10) = 2)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.48, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11030, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 11030, Skid Dust]
type = Explod
trigger1 = AnimElem = 3 && !var(10)
trigger2 = (AnimElem = 3 || AnimElem = 7) && var(10) = 1
trigger3 = (AnimElem = 3 || AnimElem = 7 || AnimElem = 11) && var(10) = 2
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 11030, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0 && !var(10)
trigger2 = AnimElemTime(13) >= 0 && var(10) = 1
trigger3 = AnimElemTime(17) >= 0 && var(10) = 2
moveType = I

[State 11030, ChangeAnim]
type = ChangeAnim
triggerall = !var(10)
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11000
elem = 9
ignoreHitPause = 1

[State 11030, ChangeAnim]
type = ChangeAnim
triggerall = var(10) = 1
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11010
elem = 13
ignoreHitPause = 1

[State 11030, ChangeAnim]
type = ChangeAnim
triggerall = var(10) = 1
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 11020
elem = 17
ignoreHitPause = 1

[State 11030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<OUGA>==
;Startup Auto
[StateDef 11100]
type = S
physics = S
moveType = A
anim = 11100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 11100, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

[State 11100, End]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(BackEdgeBodyDist <= 180, 11110, 11112)

;Startup Manual
[StateDef 11105]
type = S
physics = S
moveType = A
anim = 11100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 11100, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

[State 11100, Button Detect]
type = VarSet
trigger1 = !Time
var(12) = ifElse(command = "OugaFwd", 2, ifElse(command = "OugaBack", 1, 0))

[State 11100, End]
type = ChangeState
trigger1 = !Time
trigger1 = Var(12) = 0
value = 11100

[State 11100, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Var(12) = 1
value = 11110

[State 11100, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Var(12) = 2
value = 11112

;Jump Back
[StateDef 11110]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 11110, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 11110

[State 11110, NotHitBy]
type = NotHitBy
trigger1 = PrevStateNo!= 750
trigger1 = AnimElemTime(1) < 6
value = SCA
time = 1

[State 11110, NotHitBy]
type = NotHitBy
trigger1 = PrevStateNo = 750
trigger1 = AnimElemTime(1) < 9
value = SCA
time = 1

[State 11110, VelAdd]
type = VelAdd
trigger1 = PrevStateNo = 750
trigger1 = Time = 1
x = -2

[State 11110, VelSet]
type = VelSet
trigger1 = !Time
x = -0.169 * BackEdgeBodyDist / 2.5
y = -4.354334 - var(10)

[State 11110, VelSet]
type = VelSet
trigger1 = FrontEdgeDist <= 5
trigger2 = BackEdgeDist <= 5
x = 0

[State 1201, 4]
type = Playerpush
trigger1 = 1
value = 0

[State 11130, VelSet]
type = VelMul
trigger1 = var(25) > 0
x = 1.08

[State 1100, VelSet]
type = VelMul
trigger1 = Vel x > -5
x = 1.28

[State 1100, VelSet]
type = VelMul
trigger1 = Time > 8
y = 0.88

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 1

[State 1100, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ouga Dust"
posType = P1
ownPal = 1

[State 11100,varset]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 11110, End]
type = ChangeState
triggerall = pos Y < -60 - (5*var(10))
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = BackEdgeBodyDist <= 10
value = 11115

;Jump Forward
[StateDef 11112]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 11112, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 11111

[State 11110, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) < 6
value = SCA
time = 1

[State 11112, VelSet]
type = VelSet
trigger1 = !Time
;x = 12 + var(10)
x = 0.169 * FrontEdgeBodyDist / 2.5
y = -4.354334 - var(10)

[State 11130, VelSet]
type = VelMul
trigger1 = var(25) > 0
x = 1.08

[State 11130, VelSet]
type = VelMul
trigger1 = vel x < 3
x = 1.81

[State 11112, VelSet]
type = VelSet
trigger1 = FrontEdgeDist <= 5
x = 0

[State 11112, 4]
type = Playerpush
trigger1 = 1
value = 0

[State 11112, VelSet]
type = VelMul
trigger1 = Time > 8
y = 0.88

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 11112, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ouga Dust"
posType = P1
ownPal = 1

[State 11112,varset]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 11112, End]
type = ChangeState
triggerall = pos Y < -60 - (5*var(10))
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = BackEdgeBodyDist <= 10
value = 11115

;Wall Cling
[StateDef 11115]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
anim = 11115
sprPriority = 1

[State 11115, Turn]
type = Turn
trigger1 = FrontEdgeBodyDist <= 10
;
;[State 11115, PosSet]
;type = PosSet
;trigger1 = BackEdgeBodyDist <= 5
;trigger1 = Animelem = 5
;x = 1.215 * BackEdgeDist / 2.5

[State 11115,varset]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 11115, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(5)>= 0
trigger1 = Command = "holdback" || Command = "back"
value = 11120

[State 11115, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(5)>= 0
trigger1 = Command = "holdfwd" || Command = "fwd"
value = 11155

[State 11115, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(5)>= 0
trigger1 = Command = "holdup" || Command = "up"
value = 11130

[State 11115, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11150

;Cancel Move
[StateDef 11120]
type = A
physics = N
moveType = I
anim = 11120

[State 11120, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 0, VelSet]
type = VelSet
trigger1 = PrevStateNo = 11130
trigger1 = !Time
x = 4
y = -4

[State 11120, VelAdd]
type = VelAdd
trigger1 = PrevStateNo = 11115
trigger1 = animelemtime(2) > 0
trigger2 = PrevStateNo = 11130
trigger2 = animelemtime(1) >= 0
y = 0.545

[State 11120, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Cieling Jump
[StateDef 11130]
type = A
physics = N
moveType = I
anim = 11130
ctrl = 0
sprPriority = 1

[State 11130, VelSet]
type = VelSet
trigger1 = !Time && p2BodyDist x > 3
x =  0.165 * p2bodydist x / 2.5
y = -5

[State 11130, VelSet]
type = VelSet
trigger1 = !Time && p2BodyDist x <= 3
x =  2
y = -5

[State 11130, VelSet]
type = VelMul
trigger1 = Time > 5
y = 0.88

[State 11130, VelSet]
type = VelMul
trigger1 = vel x < 3
x = 1.81

[State 11130, VelSet]
type = VelMul
trigger1 = var(25) > 0
x = 1.02
y = 1.02

[State 11112, 4]
type = Playerpush
trigger1 = 1
value = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 1

[State 11130,varset]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 11130, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ouga Dust"
posType = P1
ownPal = 1

[State 11130, End]
type = ChangeState
triggerAll = Command = "holddown" || Command = "down" || Command = "fwd" || Command = "back"
triggerAll = Time > 10
trigger1 = AnimElemTime(1) >= 0
trigger1 = p2BodyDist x <= -10
trigger2 = Time > 16
value = 11135

[State 11130, End]
type = ChangeState
triggerAll = Command!= "holddown" || Command!= "down" || Command!= "fwd" || Command!= "back"
triggerAll = Time > 10
trigger1 = AnimElemTime(1) >= 0
trigger1 = p2BodyDist x <= -10
trigger1 = Pos y < -90
value = 11120

;Cieling Cling
[StateDef 11135]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
anim = 11135
sprPriority = 1

[State 11135,varset]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 11135, PosAdd]
type = PosAdd
trigger1 = FrontEdgeBodyDist < 180
trigger1 = AnimElem = 3
x = p2dist x + 5

[State 11135, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3)> 2
trigger1 = Command = "holdback" || Command = "back"
value = 11165

[State 11135, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3)> 2
trigger1 = Command = "holdfwd" || Command = "fwd"
value = 11160

[State 11135, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11170

;Oga Kick Close Range
[StateDef 11150]
type = A
physics = N
moveType = A
anim = 11150
ctrl = 0
velset = 2, -3.5
sprPriority = 1
powerAdd = 72 * !var(20) || !var(25)

[State 11150, VelSet]
type = VelSet
trigger1 = Animelem = 5
x = 5.15
y = 5.35

[State 11125, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.545

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 1

[State 11125, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ouga Dust"
posType = P1
ownPal = 1

[State 11160, HitDef 1]
type = HitDef
trigger1 = !var(25)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
getPower = ifElse(var(25) > 0, 0, ifElse(!var(13), 72, 36)) * !var(20), 12 * !var(20)
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
ground.velocity = -1.56, -7.76
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.56, -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, HitDef EX]
type = HitDef
trigger1 = var(25) > 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.56, -8.12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.56, -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

;[State 11170, Free Juggling]
;type = VarSet
;trigger1 = MoveHit = 1 && Numtarget(11100)
;var(15) = 0
;ignoreHitPause = 1

[State 11150, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 11175

;Oga Kick Long Range
[StateDef 11155]
type = A
physics = N
moveType = A
anim = 11155
ctrl = 0
velset = 4.5, -3.5
sprPriority = 1
powerAdd = 72 * !var(20) || !var(25)

[State 11155, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = Animelem = 4
x = 7
y = 1

[State 11155, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = Animelem = 4
x = 10
y = 1

[State 11155, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = Animelem = 4
x = 13
y = 1

[State 11155, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.545

[State 11155, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ouga Dust"
posType = P1
ownPal = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 1

[State 11160, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
getPower = ifElse(var(25) > 0, 0, ifElse(!var(13), 72, 36)) * !var(20), 12 * !var(20)
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
ground.velocity = -1.56, -7.76
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.56, -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, HitDef EX]
type = HitDef
trigger1 = var(25) > 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.56, -8.12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.56, -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11155, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 11175

;Oga Cieling Kick Forward
[StateDef 11160]
type = A
physics = N
moveType = A
anim = 11160
ctrl = 0
velset = 0, 0
sprPriority = 1
powerAdd = 72 * !var(20) || !var(25)

[State 11160, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 5.15
y = 5.35

[State 11160, Playerpush]
type = Playerpush
trigger1 = 1
value = 0

[State 11160, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.545

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 11160, HitDef 1]
type = HitDef
trigger1 = !var(25)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
getPower = ifElse(var(25) > 0, 0, ifElse(!var(13), 72, 36)) * !var(20), 12 * !var(20)
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
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -5.76
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
sparkXY = -10 + 0 * (var(35) := 97), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, HitDef EX]
type = HitDef
trigger1 = var(25) > 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -8.12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 11175

;Oga Cieling Kick Back
[StateDef 11165]
type = A
physics = N
moveType = A
anim = 11160
ctrl = 0
velset = 0, 0
sprPriority = 1
powerAdd = 72 * !var(20) || !var(25)

[State 11115, Turn]
type = Turn
trigger1 = !Time

[State 11165, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 5.15
y = 5.35

[State 11165, PosAdd]
type = PosAdd
trigger1 = BackEdgeBodyDist < 180
trigger1 = !Time
x = p2dist x + 10

[State 111605, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.545

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 1

[State 11160, HitDef 1]
type = HitDef
trigger1 = !var(25)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
getPower = ifElse(var(25) > 0, 0, ifElse(!var(13), 72, 36)) * !var(20), 12 * !var(20)
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
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -5.76
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, HitDef EX]
type = HitDef
trigger1 = var(25) > 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -8.12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11165, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 11175

;Oga Cieling Kick Down
[StateDef 11170]
type = A
physics = N
moveType = A
anim = 11170
ctrl = 0
velset = 0, 0
sprPriority = 1
powerAdd = 72 * !var(20) || !var(25)

[State 11170, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 0
y = 7

[State 11170, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.545

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 180,0
channel = 1

[State 11160, HitDef 1]
type = HitDef
trigger1 = !var(25)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 7
getPower = ifElse(var(25) > 0, 0, ifElse(!var(13), 72, 36)) * !var(20), 12 * !var(20)
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
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -5.76
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11160, HitDef EX]
type = HitDef
trigger1 = var(25) > 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 11100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
getPower = 0, 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -8.12
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(Facing = EnemyNear, Facing, 1.5, -1.5), -7.76
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
sparkXY = -10 + 0 * (var(35) := 87), var(36) := -13
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 11170, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 11180

;Landing
[StateDef 11175]
type = S
anim = 11175
physics = N
moveType = I
velSet = 0,0

[State 11175, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 11175, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 11175, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 11175, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 11175, End]
type = ChangeState
trigger1 = AnimElemTime(4) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 11175, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Landing
[StateDef 11180]
type = S
anim = 11180
physics = N
moveType = I
velSet = 0,0

[State 11180, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 11180, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 11180, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 11180, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 11180, End]
type = ChangeState
trigger1 = AnimElemTime(4) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 11180, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;=<EX OUGA>==
;Startup Auto
[StateDef 11200]
type = S
physics = S
moveType = A
anim = 11100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 11200, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 9999

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = Anim = 11100
value = SCA
time = 1

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 2, -50
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 11200, End]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(BackEdgeBodyDist <= 180, 11110, 11112)

;Startup Manual
[StateDef 11205]
type = S
physics = S
moveType = A
anim = 11100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 11205, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

[State 11205, Button Detect]
type = VarSet
trigger1 = !Time
var(12) = ifElse(command = "EXougaFwd", 2, ifElse(command = "EXougaBack", 1, 0))

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 9999

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 2, -50
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = Anim = 11100
value = SCA
time = 1

[State 11205, End]
type = ChangeState
trigger1 = !Time
trigger1 = Var(12) = 0
value = 11100

[State 11205, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Var(12) = 1
value = 11110

[State 11205, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Var(12) = 2
value = 11112
;====<PUNCH ZERO COUNTER (CRANE)>=
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

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -59
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
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<KICK ZERO COUNTER (MANTIS)>=
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
value = 4, 3
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -24
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9 && !MoveContact
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
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
