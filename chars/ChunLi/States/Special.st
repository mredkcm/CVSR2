; _________________________________________
;| Chun-Li by Jmorphman                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES==
;==

;KIKOKEN
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
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020)) + var(40)

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 1000, Kikoken sound effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,1
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1005
ID = 1005
name = "Kikoken Projectile"
posType = P1
pos = 88,-56
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX KIKOKEN
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
var(25) = 27

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 24, -52
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
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 1030, Venom Strike sound effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,1
channel = 3

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1005
ID = 1035
name = "EX Kikoken Projectile"
posType = P1
pos = 88,-56
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;HYAKURETSUKYAKU Startup
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1100, Tap Kick Buffer Set]
type = VarSet
trigger1 = !Time && !AILevel
var(46) = ifElse(NumExplod(90000250) || NumExplod(90000255), 8, ifElse(NumExplod(90000240) || NumExplod(90000245), 10, 12))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = !NumEnemy
var(10) = 2

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumEnemy
var(10) = 2

[State 1100, Tap Kick Buffer Set (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(46) = ifElse(var(10) = 2, 8, ifElse(var(10), 10, 12))

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 1101


;Looping
[StateDef 1101]
type = S
physics = N
moveType = A
anim = 1101
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1101, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1101, Button Detect]
type = VarSet
trigger1 = !AILevel
;;command = "a" || command = "b" || command = "c"
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
;;ifElse(command = "c", 2, ifElse(command = "b", 1, 0))
var(11) = ifElse(NumExplod(90000250), 2, ifElse(NumExplod(90000240), 1, 0))

[State 1101, Tap Kick Buffer (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = NumEnemy
trigger1 = P2StateType != A && (P2BodyDist x = [0,24])
var(46) = 10

[State 1101, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1121, ifElse(var(10) = 1, 1111, 1101))

[State 1101, Loop]
type = ChangeAnim
triggerAll = var(46) > 0
trigger1 = !AnimTime
value = ifElse(var(11) = 2, 1121, ifElse(var(11) = 1, 1111, 1101))
elem = 1

[State 1101, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 59 || var(36) := -44
trigger2 = AnimElem = 4
trigger2 = var(35) := 56 || var(36) := -100
trigger3 = AnimElem = 7
trigger3 = var(35) := 66 || var(36) := -65
trigger4 = AnimElem = 10
trigger4 = var(35) := 64 || var(36) := -84

[State 1101, Hit Low]
type = HitDef
trigger1 = !var(16) && (var(15) < ifElse(1 + HitCount < 4, 1 + HitCount, 1) || var(20))
trigger1 = AnimElem = 1 || AnimElem = 7
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = ifElse(var(10) = 2, 20, ifElse(var(10), 17, 15))
ground.slideTime = ifElse(var(10) = 2, 20, ifElse(var(10), 17, 15))
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 10, 15))
air.hitTime = 120
ground.velocity = ifElse(var(10) = 2, -2.56, ifElse(var(10), -2.76, -3.06)), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(10) = 2, -2.56, ifElse(var(10), -2.76, -3.06))
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, Hit High]
type = HitDef
trigger1 = !var(16) && (var(15) < ifElse(1 + HitCount < 4, 1 + HitCount, 1) || var(20))
trigger1 = AnimElem = 4 || AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = ifElse(var(10) = 2, 20, ifElse(var(10), 17, 15))
ground.slideTime = ifElse(var(10) = 2, 20, ifElse(var(10), 17, 15))
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 10, 15))
air.hitTime = 120
ground.velocity = ifElse(var(10) = 2, -2.56, ifElse(var(10), -2.76, -3.06)), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(10) = 2, -2.56, ifElse(var(10), -2.76, -3.06))
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, End]
type = ChangeState
trigger1 = var(46) <= 0
trigger1 = (AnimElemTime(2) >= 0 && AnimElemTime(3) < 0) || (AnimElemTime(5) >= 0 && AnimElemTime(6) < 0) || (AnimElemTime(8) >= 0 && AnimElemTime(9) < 0) || (AnimElemTime(11) >= 0 && AnimElemTime(12) < 0)
value = 1102

[State 1101, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,2
channel = 0

[State 1101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
value = 1,3


;End
[Statedef 1102]
type = S
physics = N
moveType = I
anim = 1102
ctrl = 0
sprPriority = 1
moveHitPersist = 1

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX HYAKURETSUKYAKU
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
var(25) = 16

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 19, -71
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
value = 1130,0
channel = 0

[State 1130, PosAdd]
type = PosAdd
trigger1 = !Time
x = 32

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 12
value = 4,2
channel = 0

[State 1130, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
trigger3 = AnimElem = 8
trigger4 = AnimElem = 11
value = 1,1

[State 1130, Spark XY]
type = Null
trigger1 = AnimElem = 3
trigger1 = var(35) := 59 || var(36) := -44
trigger2 = AnimElem = 6
trigger2 = var(35) := 56 || var(36) := -100
trigger3 = AnimElem = 9
trigger3 = var(35) := 66 || var(36) := -65
trigger4 = AnimElem = 12
trigger4 = var(35) := 64 || var(36) := -84

[State 1130, Hit Low]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -0.75, -5.5
ground.cornerPush.velOff = 0
guard.velocity = -3.06
guard.cornerPush.velOff = 0
air.velocity = -0.75, -5.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
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

[State 1130, Hit High]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -0.75, -5.5
ground.cornerPush.velOff = 0
guard.velocity = -3.06
guard.cornerPush.velOff = 0
air.velocity = -0.75, -5.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
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

[State 1130, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(27) && AnimElem = 13
var(15) = 0

[State 1130, VarAdd]
type = VarAdd
trigger1 = MoveHit && AnimElem = 13
var(27) = 1
persistent = 0

[State 1130, Juggle Flag]
type = VarSet
trigger1 = var(27) = 2
var(16) = 1

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
movetype = I

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;SPINNING BIRD KICK
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 126 || Random < 333), 2, ifElse(P2Dist x > 102, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, PosAdd]
type = PosAdd
trigger1 = !Time
x = 15

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 7

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 9

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 6

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 19

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -11

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1200, Step sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 100,0
channel = 1

[State 1200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 12
trigger3 = AnimElem = 16 && var(10)
trigger4 = AnimElem = 20 && var(10)
trigger5 = AnimElem = 24 && var(10) = 2
trigger6 = AnimElem = 28 && var(10) = 2
value = 1,5

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 1
x = 4.375

[State 1200, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
triggerAll = P2Dist x >= 0
trigger1 = AnimElem = 9 || AnimElem = 13
trigger2 = (AnimElem = 17 || AnimElem = 21) && var(10)
trigger3 = (AnimElem = 25 || AnimElem = 29) && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), ifElse(HitCount > 2 && var(10) = 2, 14, 21), 35) < 7, 7, fvar(11) * ifElse(var(10), ifElse(HitCount > 2 && var(10) = 2, 14, 21), 35))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
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
ground.velocity = -5.25,0
ground.cornerPush.velOff = 0
guard.velocity = -5.25
guard.cornerPush.velOff = 0
air.velocity = -1.875, -7.1875
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
triggerAll = P2Dist x < 0
trigger1 = AnimElem = 9 || AnimElem = 13
trigger2 = (AnimElem = 17 || AnimElem = 21) && var(10)
trigger3 = (AnimElem = 25 || AnimElem = 29) && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), 21, 35) < 7, 7, fvar(11) * ifElse(var(10), 21, 35))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
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
ground.velocity = 5.25,0
ground.cornerPush.velOff = 0
guard.velocity = 5.25
guard.cornerPush.velOff = 0
air.velocity = 1.875, -7.1875
air.cornerPush.velOff = 0
airGuard.velocity = 8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0 && !var(10)
trigger2 = AnimElemTime(22) >= 0 && var(10) = 1
trigger3 = AnimElemTime(30) >= 0 && var(10) = 2
moveType = I

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElemTime(17) = 1 && !var(10)
trigger2 = AnimElemTime(25) = 1 && var(10) = 1
trigger3 = AnimElemTime(33) = 1 && var(10) = 2
x = 2.5

[State 1200, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 22 && !var(10)
trigger2 = AnimElem = 30 && var(10) = 1
trigger3 = AnimElem = 38 && var(10) = 2
stateType = S
physics = N

[State 1200, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 22 && !var(10)
trigger2 = AnimElem = 30 && var(10) = 1
trigger3 = AnimElem = 38 && var(10) = 2
value = 52,0
channel = 3

[State 1200, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 22 && !var(10)
trigger2 = AnimElem = 30 && var(10) = 1
trigger3 = AnimElem = 38 && var(10) = 2
anim = 8102
sprPriority = -3
posType = P1
pos = 10,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX SPINNING BIRD KICK
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
var(25) = 42

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -6, -61
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, PosAdd]
type = PosAdd
trigger1 = !Time
x = 15

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 7

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 9

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 6

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 19

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -11

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800,1
channel = 0

[State 1230, Step sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 100,0
channel = 3

[State 1230, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 12
trigger3 = AnimElem = 16
trigger4 = AnimElem = 20
trigger5 = AnimElem = 24
value = 1,5

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
value = SCA
time = 1

[State 1230, PlayerPush]
type = PlayerPush
trigger1 = MoveHit
value = 0
ignoreHitPause = 1

[State 1230, Hit (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount))
triggerAll = P2Dist x >= 0
trigger1 = AnimElem = 9 || AnimElem = 13
trigger2 = AnimElem = 17 || AnimElem = 21
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = (P2Dist x + 55) / 5,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x + 35) / 5, -2.32
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
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1230, Hit (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount))
triggerAll = P2Dist x < 0
trigger1 = AnimElem = 9 || AnimElem = 13
trigger2 = AnimElem = 17 || AnimElem = 21
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = (P2Dist x - 55) / 5,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x - 35) / 5, -2.32
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
sparkXY = -10 + 0 * (var(35) := -66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = -1

[State 1230, Final Hit (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount))
triggerAll = P2Dist x >= 0
trigger1 = AnimElem = 25
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -11, -6.173065186
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -11, -6.173065186
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
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1230, Final Hit (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount))
triggerAll = P2Dist x < 0
trigger1 = AnimElem = 25
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 11, -6.173065186
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 11, -6.173065186
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
sparkXY = -10 + 0 * (var(35) := -66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = -1

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(26) >= 0
moveType = I

[State 1230, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 31
stateType = S
physics = N

[State 1230, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 31
value = 52,0
channel = 3

[State 1230, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 31
anim = 8102
sprPriority = -3
posType = P1
pos = 10,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;HAZANSHU
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 172 || Random < 333), 2, ifElse(P2Dist x > 118, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 1

[State 1300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,5
channel = 3

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hazanshu Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifElse(var(10) = 2, 6.5, ifElse(var(10) = 1, 5.5625, 3.3125))
y = ifElse(var(10) = 2, -11.875, ifElse(var(10) = 1, -10.9375, -9.9375))

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = -0.015625
y = 1

[State 1300, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Landing
[StateDef 1301]
type = S
anim = 1301
physics = N
moveType = A
velSet = 0,0

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 1301, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1301, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 4

[State 1301, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = 4
freq = 120
ignoreHitPause = 1

[State 1301, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 && PrevStateNo != 1330
ID = 1301
attr = C, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10) = 1, 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10) = 1, 105, 98)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4.86, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.71875
air.cornerPush.velOff = 0
yAccel = 0.5625
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 74), var(36) := -36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, EX HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 1 && PrevStateNo = 1330
ID = 1301
attr = C, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 133 < 7, 7, fvar(11) * 133)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -5.40, 3.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 74), var(36) := -36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(3) <= 0
value = 1301
elem = 3
ignoreHitPause = 1

[State 1301, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1301) > 1
ID = 1301
keepOne = 1
excludeID = 1301
ignoreHitPause = 1

[State 1301, TargetState]
type = TargetState
triggerAll = MoveHit && NumTarget(1301)
triggerAll = !(Target(1301), Time)
trigger1 = PrevStateNo = 1300 && Target(1301), StateType = A
trigger2 = PrevStateNo = 1330
value = ifElse(Target(1301), StateType = A, 5425, 5420)
ID = 1301
ignoreHitPause = 1

[State 1301, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 1301, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;SLAMMED AGAINST THE GROUND
;Being Slammed (Standing)
[StateDef 5420]
type = U
moveType = H
physics = N
velset = 0,0

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = ifElse(SelfAnimExist(5111) || SelfAnimExist(5112), 5012, 5070)

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5420 + (StateType = C))
value = 5420 + (StateType = C)

[State 5420, End]
type = SelfState
trigger1 = HitShakeOver && pos y < 0
trigger2 = StateType = L
value = 5030

[State 5420, End]
type = ChangeState
trigger1 = HitShakeOver && pos y >= 0
value = 5421


;Hitting the Ground
[StateDef 5421]
type = L
moveType = H
physics = N
velSet = 0,0

[State 5421, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5102) && PrevStateNo != 5426, 5102, ifElse(SelfAnimExist(5101) && PrevStateNo != 5426, 5101, 5100))

[State 5421, ChangeAnim]
type = ChangeAnim
triggerall = !Time && PrevStateNo != 5426
trigger1 = SelfAnimExist(5422)
value = 5422

[State 5421, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5421, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 5421, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 5421, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,1

[State 5421, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 5421, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Anim = 5100 + (Anim % 10)
trigger2 = Time = 4
trigger2 = Anim != 5422
trigger3 = Anim = 5422
trigger3 = AnimTime = 0 || Time = 12
value = 5422


;Bouncing Off Ground
[StateDef 5422]
type = L
moveType = H
physics = N

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5160 + Anim % 10), 5160 + Anim % 10, 5160)

[State 5422, ChangeAnim]
type = ChangeAnim
triggerall = !Time && Anim = 5422
trigger1 = SelfAnimExist(5424)
value = 5424

[State 5422, VelSet]
type = VelSet
trigger1 = !Time
y = -3.75

[State 5422, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 5422, PosAdd]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 5422, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.625

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5424
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = ifElse(SelfAnimExist(5162), 5162, ifElse(SelfAnimExist(5161), 5161, 5160))

[State 5422, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;Aerial Being Slammed (Hitshake)
[StateDef 5425]
type = A
moveType = H
physics = N
velSet = 0,0

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5070

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 5425, ChangeAnim]
type = ChangeState
trigger1 = HitShakeOver
value = 5426


;Aerial Being Slammed (Knocked Away)
[StateDef 5426]
type = A
moveType = H
physics = N
ctrl = 0

[State 5426, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yaccel)

[State 5426, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 5426, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.trip.groundlevel)
value = 5421



;EX HAZANSHU
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
var(25) = 31

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 7, -63
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1330, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,5
channel = 4

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hazanshu Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifElse(P2Dist x / 24 > 8.45, 8.45, P2Dist x / 24)
y = -17.2125

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 1.9125

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
value = SCA
time = 1

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;TENSHOKYAKU
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, Voice]
type = PlaySnd
trigger1 = !Time
value = 1400,0
channel = 0

[State 1400, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 41,0
channel = 1

[State 1400, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 7
trigger2 = var(10) = 1 && AnimElem = 12
trigger3 = var(10) = 2 && (AnimElem = 11 || AnimElem = 15)
value = 1,5

[State 1400, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tenshokyaku Dust"
posType = P1
ownPal = 1

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 7.5
y = ifElse(var(10) = 2, -6.25, ifElse(var(10) = 1, -5.625, -5))

[State 1400, VelAdd]
type = VelAdd
trigger1 = vel x > 0 && AnimElemTime(4) > 0
x = -0.390625

[State 1400, VelSet]
type = VelSet
trigger1 = vel x < 0 && AnimElemTime(4) > 0
x = 0

[State 1400, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && AnimElemTime(4) > 0
y = ifElse(var(10) = 2, 0.2563476563, 0.1953125)

[State 1400, VelAdd]
type = VelAdd
trigger1 = vel y >= 0 && AnimElemTime(4) > 0
y = 0.5859375

[State 1400, Move Contact Count Reset]
type = VarSet
trigger1 = !Time
var(11) = 0

[State 1400, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20)) && var(11) < ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10) = 1, 77, 112)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10) = 1, 77, 112)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Air Hit 1]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20)) && var(11) < ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
trigger1 = AnimElem = 5 && !var(10) && !MoveContact && !MoveReversed
trigger2 = AnimElem = 5 && var(10)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), 42, 63) < 7, 7, fvar(11) * ifElse(var(10), 42, 63))), 7
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
ground.velocity = -2.5, -8.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Air Hit 2]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20)) && var(11) < ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
trigger1 = AnimElem = 9 && !var(10) && !MoveContact && !MoveReversed
trigger2 = AnimElem = 9 && var(10)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
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
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Air Hit 3]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20)) && var(11) < ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
trigger1 = AnimElem = 13 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
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
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Air Hit 4]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20)) && var(11) < ifElse(var(10) = 2, 3, ifElse(var(10) = 1, 2, 1))
trigger1 = AnimElem = 14 && var(10) = 1
trigger2 = AnimElem = 17 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Move Contact Count]
type = VarAdd
triggerAll = MoveContact = 1
trigger1 = MoveHit = 1 && NumEnemy
trigger2 = MoveGuarded = 1 && NumEnemy
var(11) = 1

[State 1400, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401


;Landing
[StateDef 1401]
type = S
anim = ifElse(PrevStateNo = 248 || var(10) = 2, 1421, ifElse(var(10), 1411, 1401))
physics = N
moveType = I
velSet = 0,0

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
channel = 1

[State 1401, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX TENSHOKYAKU
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
var(25) = 41

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 4, -63
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Voice]
type = PlaySnd
trigger1 = !Time
value = 1400,0
channel = 0

[State 1430, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 41,0
channel = 3

[State 1430, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 7
trigger2 = AnimElem = 11 || AnimElem = 15
value = 1,5

[State 1430, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1430, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tenshokyaku Dust"
posType = P1
ownPal = 1

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 7.5
y = -5.9375

[State 1430, VelAdd]
type = VelAdd
trigger1 = vel x > 0 && AnimElemTime(4) > 0
x = -0.390625

[State 1430, VelSet]
type = VelSet
trigger1 = vel x < 0 && AnimElemTime(4) > 0
x = 0

[State 1430, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && AnimElemTime(4) > 0
y = 0.1953125

[State 1430, VelAdd]
type = VelAdd
trigger1 = vel y >= 0 && AnimElemTime(4) > 0
y = 0.5859375

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 1430, Move Contact Count Reset]
type = VarSet
trigger1 = !Time
var(11) = 0

[State 1430, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1) && var(11) < 4
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Air Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount)) && var(11) < 4
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -8.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -8.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Air Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount)) && var(11) < 4
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Air Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount)) && var(11) < 4
trigger1 = AnimElem = 13
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Air Hit 4]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount)) && var(11) < 4
trigger1 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5625, -5.625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Move Contact Count]
type = VarAdd
triggerAll = MoveContact = 1
trigger1 = MoveHit = 1 && NumEnemy
trigger2 = MoveGuarded = 1 && NumEnemy
var(11) = 1

[State 1430, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401



;SEN'ENSHU
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 110 || Random < 333), 2, ifElse(P2Dist x > 66, 1, 0))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3300,0
channel = 0

[State 1500, Step sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,0
channel = 1

[State 1500, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 3

[State 1500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1500, VelSet]
type = VelSet
trigger1 = !Time && var(10)
x = 7.5

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) < 0 && var(10)
x = -0.390625

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 4 && var(10)
x = 0

[State 1500, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = ifElse(var(10) = 2, 10, ifElse(var(10) = 1, 5.625, 5))

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0 && AnimElemTime(12) < 0 && var(10) != 2
x = -0.1953125

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 11
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 98, ifElse(var(10) = 1, 91, 84)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 98, ifElse(var(10) = 1, 91, 84)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = ifElse(var(10) = 2, 16, ifElse(var(10) = 1, 14, 12))
ground.slideTime = ifElse(var(10) = 2, 16, ifElse(var(10) = 1, 14, 12))
guard.hitTime = ifElse(var(10) = 2, 16, ifElse(var(10) = 1, 14, 12))
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -7.1875
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 1500, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = S
physics = N

[State 1500, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 52,0
channel = 4

[State 1500, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprPriority = -3
posType = P1
pos = 15,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;EX SEN'ENSHU
[StateDef 1530]
type = S
physics = N
moveType = A
anim = 1530
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 24

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -1, -63
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3300,0
channel = 0

[State 1530, Step sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,0
channel = 3

[State 1530, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 4

[State 1530, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1530, VelSet]
type = VelSet
trigger1 = !Time
x = 7.5

[State 1530, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) < 0
x = -0.390625

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1530, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 12.5

[State 1530, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0 && AnimElemTime(12) < 0
x = -0.1953125

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1)
trigger1 = AnimElem = 11
ID = 1530
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.40, 3.24
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
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1530) > 1
ID = 1530
keepOne = 1
excludeID = 1530
ignoreHitPause = 1

[State 1530, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1530)
trigger1 = !(Target(1530), Time)
value = ifElse(Target(1530), StateType = A, 5425, 5420)
ID = 1530
ignoreHitPause = 1

[State 1530, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 1530, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = S
physics = N

[State 1530, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 52,0
channel = 5

[State 1530, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprPriority = -3
posType = P1
pos = 15,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;PUNCH ZERO COUNTER
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
trigger1 = !Time
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 2900, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,2
channel = 1

[State 2900, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1)
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 59), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= 10
value = 2900
elem = 4
ignoreHitPause = 1

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;KICK ZERO COUNTER
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
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = 0,0
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
sparkXY = -10 + 0 * (var(35) := 89), var(36) := -9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
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
