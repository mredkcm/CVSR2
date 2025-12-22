; _________________________________________
;| Rolento by Jmorphman                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<PATRIOT CIRCLE>=
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
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,1
channel = 0

[State 1000, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 13
trigger2 = AnimElem = 24
trigger3 = AnimElem = 35
value = 1,410

[State 1000, Step Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 52,0

[State 1000, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 7.5, ifElse(var(10), 6.25, 5))

[State 1000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) < 0
x = ifElse(var(10) = 2, -0.0732421875, ifElse(var(10), -0.06103515625, -0.048828125))

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1000, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Circle Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -8.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 1000, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1000, Second Twirl]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(43) < 0
trigger1 = !AILevel
trigger1 = command = "PatriotCircle"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1001

[State 1000, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(43) < 0
value = var(14)

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Second Twirl
[StateDef 1001]
type = S
anim = 1001
physics = N
moveType = A
velSet = 0,0

[State 1001, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4,2
channel = 0

[State 1001, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 27
trigger3 = AnimElem = 39
value = 1,410

[State 1001, Step sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 52,0

[State 1001, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Circle Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1001, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 7.5, ifElse(var(10), 6.25, 5))

[State 1001, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) < 0
x = ifElse(var(10) = 2, -0.0732421875, ifElse(var(10), -0.06103515625, -0.048828125))

[State 1001, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 1001, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 14
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 16
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 18
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -8.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1001, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
moveType = I

[State 1001, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1001, Finish]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(49) < 0
trigger1 = !AILevel
trigger1 = command = "PatriotCircle"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 1002

[State 1001, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(19) >= 0 && AnimElemTime(49) < 0
value = var(14)

[State 1001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 1002]
type = S
anim = 1002
physics = N
moveType = A
velSet = 0,0

[State 1002, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1002,0
channel = 0

[State 1002, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 27
value = 1,410

[State 1002, Step sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 52,0

[State 1002, Width]
type = Width
trigger1 = !Time
trigger2 = AnimElemTime(9) = 1
value = 30,0

[State 1002, Width]
type = Width
trigger1 = AnimElem = 33
trigger2 = AnimElemTime(34) = 9
value = 15,0

[State 1002, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Circle Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1002, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 10
trigger3 = AnimElem = 34
x = 48

[State 1002, PosAdd]
type = PosAdd
trigger1 = AnimElem = 35
x = 32

[State 1002, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1002, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1002, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 16
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1002, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
moveType = I

[State 1002, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX PATRIOT CIRCLE>=
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
var(25) = 30

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(-22 * const(size.xScale)), ceil(-97 * const(size.yScale))
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
trigger1 = AnimElem = 10
value = 1002,0
channel = 0

[State 1030, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 27
value = 1,410

[State 1030, Step sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 52,0

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(9) = 1
value = 30,0

[State 1030, Width]
type = Width
trigger1 = AnimElem = 31
trigger2 = AnimElemTime(32) = 9
value = 15,0

[State 1030, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
value = SCA
time = 1

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Circle Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 32
x = 48

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 33
x = 32

[State 1030, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 16
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 19
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 22
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 6]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 25
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef 7]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 28
ID = 1030
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
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
air.velocity = -2.16, -10.81
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, Juggle Reset]
type = VarSet
trigger1 = NumTarget(1030)
trigger1 = MoveHit && !var(27)
var(15) = 0
persistent = 0

[State 1030, VarAdd]
type = VarAdd
trigger1 = NumTarget(1030)
trigger1 = MoveHit
var(27) = 1
persistent = 0

[State 1030, Juggle Flag]
type = VarSet
trigger1 = var(27) = 2
var(16) = 1

[State 1030, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(29) >= 0
moveType = I

[State 1002, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<STINGER>=
[StateDef 1100]
type = S
physics = S
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
var(10) = ifElse((command = "c" || command = "rlsc"), 1120, ifElse((command = "b" || command = "rlsb"), 1110, 1100))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 500, 1120, ifElse(Random < 500, 1110, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4,0
channel = 0

[State 1100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 41,0
channel = 1

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Stinger Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 8
y = ifElse(var(10) = 1120, -13.125, ifElse(var(10) = 1110, -11.875, -10.625))

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) >= 0
y = ifElse(var(10) = 1120, 0.830078125, ifElse(var(10) = 1110, 0.732421875, 0.634765625))

[State 1100, Knives]
type = Explod
trigger1 = AnimElem = 3
ID = 1103
anim = 1103
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1100, Button Detect (Knife Direction)]
type = VarAdd
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
trigger1 = !AILevel
var(10) = ifElse((command = "c" || command = "z"), 2, ifElse((command = "b" || command = "y"), 1, 0))

[State 1100, Button Detect (Knife Direction, AI)]
type = VarAdd
triggerAll = (!var(14) || AILevel) && AnimElemTime(11) >= 0
trigger1 = AILevel
var(10) = ifElse(P2BodyDist x >= 135, 2, ifElse(P2BodyDist x >= 75, 1, 0))

[State 1100, Attack]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
trigger1 = !AILevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = AILevel
trigger2 = AnimElemTime(11) >= 0
var(14) = 1101

[State 1100, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(9) >= 0
value = var(14)

[State 1100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102


;Attack
[StateDef 1101]
type = A
physics = N
moveType = A
velSet = 0,0
anim = 1101
ctrl = 0
sprPriority = 1

[State 1101, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1103)
ID = 1103

[State 1101, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1101,0
channel = 0

[State 1101, Knife Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1101,1
channel = 3

[State 1101, Knives]
type = Explod
trigger1 = !Time
ID = 1104
anim = 1104
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1101, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(8) < 2
value = 1

[State 1101, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 2
y = 0.78125

[State 1101, Knife]
type = Helper
trigger1 = AnimElemTime(6) = 1
helperType = Normal
stateNo = 1105
ID = 1105
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-46 * const(size.yScale))
name = "Knife (Stinger)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

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

[State 1102, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1103)
ID = 1103
ignoreHitPause = 1

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX STINGER>=
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
trigger1 = !Time
var(25) = 29

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(10 * const(size.xScale)), ceil(-35 * const(size.yScale))
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
trigger1 = AnimElem = 7
value = 4,0
channel = 0

[State 1130, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 41,0
channel = 3

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Stinger Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = -14.375

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) >= 0
y = 0.927734375

[State 1130, Knives]
type = Explod
trigger1 = AnimElem = 3
ID = 1103
anim = 1133
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1130, EX Stinger Juggle Count Reset]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 1130, Attack]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
triggerAll = !AILevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
var(14) = 1131

[State 1130, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0
value = var(14)

[State 1130, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102


;Attack
[StateDef 1131]
type = A
physics = N
moveType = A
velSet = 0,0
anim = 1101
ctrl = 0
sprPriority = 1

[State 1131, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 17

[State 1131, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1103)
ID = 1103

[State 1131, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1101,0
channel = 0

[State 1131, Knife Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1101,1
channel = 3

[State 1131, Knives]
type = Explod
trigger1 = !Time
ID = 1104
anim = 1104
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1131, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(8) < 2
value = 1

[State 1131, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 2
y = 0.78125

[State 1131, Knife 1]
type = Helper
trigger1 = AnimElemTime(6) = 1
helperType = Normal
stateNo = 1135
ID = 1135
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-46 * const(size.yScale))
name = "Knife 1 (EX Stinger)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 1131, Knife 2]
type = Helper
trigger1 = AnimElemTime(6) = 1
helperType = Normal
stateNo = 1145
ID = 1145
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-46 * const(size.yScale))
name = "Knife 2 (EX Stinger)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 1131, Knife 3]
type = Helper
trigger1 = AnimElemTime(6) = 1
helperType = Normal
stateNo = 1155
ID = 1155
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-46 * const(size.yScale))
name = "Knife 3 (EX Stinger)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 1131, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102



;=<MEKONG DELTA ATTACK>==
;Jump
[StateDef 1200]
type = S
physics = N
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifElse(PrevStateNo = 1201, 72 * !var(20), 0)
faceP2 = 1

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,1
channel = 0

[State 1200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
stateType = A
physics = N

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Mekong Delta Attack Jump Dust"
posType = P1
ownPal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -6.25
y = -5.625

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
x = 0.146484375
y = 0.48828125

[State 1200, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1200, Mekong Delta Attack (Startup)]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
trigger1 = !AILevel
trigger1 = command = "MekongDeltaAttack"
var(14) = 1200

[State 1200, EX Mekong Delta Attack]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
triggerAll = power >= 500 && var(20) <= 60
trigger1 = !AILevel
trigger1 = command = "pp"
trigger2 = AILevel
trigger2 = P2BodyDist x >= 200
var(14) = 1232

[State 1200, Button Detect]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
trigger1 = AILevel
var(10) = ifElse(P2BodyDist x >= 135, 2, ifElse(P2BodyDist x >= 110, 1, 0))

[State 1200, Mekong Delta Attack]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AILevel
var(14) = 1202

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
channel = 3

[State 1201, Mekong Delta Attack (Startup)]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel
trigger1 = command = "MekongDeltaAttack"
var(14) = 1200

[State 1201, EX Mekong Delta Attack (Attack)]
type = VarSet
triggerAll = (!var(14) || AILevel)
triggerAll = power >= 500 && var(20) <= 60
trigger1 = !AILevel
trigger1 = command = "pp"
var(14) = 1232

[State 1200, Button Detect]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) >= 0
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1201, Mekong Delta Attack (Attack)]
type = VarSet
triggerAll = (!var(14) || AILevel)
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(14) = 1202

[State 1201, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = !AnimTime
value = var(14)

[State 1201, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Rolling
[StateDef 1202]
type = S
anim = ifElse(var(10) = 2, 1222, ifElse(var(10), 1212, 1202))
physics = N
moveType = A
powerAdd = 72 * !var(20)

[State 1202, Width]
type = Width
trigger1 = 1
player = -5,0

[State 1202, Voice]
type = PlaySnd
trigger1 = !Time
value = 1202,0
channel = 0

[State 1202, Skid sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 4

[State 1202, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6 && var(10)
helperType = Normal
stateNo = 8103
ID = 8100
name = "Mekong Delta Attack Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1202, VelSet]
type = VelSet
trigger1 = !Time
x = 4.375

[State 1202, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) < 0 && !var(10)
trigger2 = AnimElemTime(8) < 0 && var(10) = 1
trigger3 = AnimElemTime(10) < 0 && var(10) = 2
x = 0.78125

[State 1202, VelSet]
type = VelSet
trigger1 = AnimElem = 7 && !var(10)
trigger2 = AnimElem = 8 && var(10) = 1
trigger3 = AnimElem = 10 && var(10) = 2
x = 0

[State 1202, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10) = 1, 77, 70)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10) = 1, 77, 70)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = ifElse(var(10) = 2, 18, ifElse(var(10), 16, 12))
ground.slideTime = ifElse(var(10) = 2, 18, ifElse(var(10), 16, 12))
guard.hitTime = ifElse(var(10) = 2, 18, ifElse(var(10), 16, 12))
air.hitTime = 120
ground.velocity = -8.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36) := -14
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1202, ChangeState]
type = ChangeState
trigger1 = NumTarget && MoveContact
value = 1203

[State 1202, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0 && !var(10)
trigger2 = AnimElemTime(8) >= 0 && var(10) = 1
trigger3 = AnimElemTime(10) >= 0 && var(10) = 2
moveType = I

[State 1202, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Rebound Off Opponent
[StateDef 1203]
type = S
physics = N
moveType = I

[State 1203, VelSet]
type = VelSet
trigger1 = Time = 1
x = 0

[State 1203, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != 1203
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
trigger1 = AnimElem = 5 || (AnimElem = 9 && (var(10) = 2 || PrevStateNo = 1232))
value = 1203

[State 1203, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != 1203
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
trigger1 = AnimElem = 2 || AnimElem = 6 || (AnimElem = 10 && (var(10) = 2 || PrevStateNo = 1232))
value = 1203
elem = 2

[State 1203, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != 1203
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
trigger1 = AnimElem = 3 || (AnimElem = 7 && var(10))
trigger2 = AnimElem = 7 && !var(10)
trigger3 = AnimElem = 11 && PrevStateNo = 1232
value = 1203
elem = 3

[State 1203, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != 1203
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8 && var(10)
value = 1203
elem = 4

[State 1203, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = Anim = 1203
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1203, Dust Helper]
type = Helper
trigger1 = Anim = 1203
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Mekong Delta Attack Dust"
posType = P1
ownPal = 1

[State 1203, VelSet]
type = VelSet
trigger1 = Anim = 1203 && PrevStateNo != 1232
trigger1 = AnimElem = 5
x = ifElse(var(10) = 2, -4.5, -2.5 - var(10))
y = -10

[State 1203, VelSet]
type = VelSet
trigger1 = Anim = 1203 && PrevStateNo = 1232
trigger1 = AnimElem = 5
x = -4.5
y = -8

[State 1203, VelAdd]
type = VelAdd
trigger1 = Anim = 1203
trigger1 = AnimElemTime(5) > 0
x = -0.09765625
y = 0.78125

[State 1203, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1204


;Landing from rebound
[StateDef 1204]
type = S
anim = 1204
physics = N
moveType = I
velSet = 0,0

[State 1204, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1204, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1204, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1204, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MEKONG DELTA ATTACK>=
[StateDef 1232]
type = S
anim = 1232
physics = N
moveType = A
powerAdd = -500

[State 1232, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1232, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1232, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1232, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(5 * const(size.xScale)), ceil(-23 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1232, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1232, Voice]
type = PlaySnd
trigger1 = !Time
value = 1202,0
channel = 0

[State 1232, Skid sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 4

[State 1232, Width]
type = Width
trigger1 = 1
player = -5,0

[State 1232, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
trigger4 = AnimElem = 5
trigger5 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Mekong Delta Attack Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1232, VelSet]
type = VelSet
trigger1 = !Time
x = 6.5625

[State 1232, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) < 0
x = 1.171875

[State 1232, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 1232, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 1232, EX Mekong Delta Attack Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
var(28) = 1
ignoreHitPause = 1

[State 1232, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(10) < 0 && !MoveContact
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8020)
sparkXY = -10 + 0 * (var(35) := 29), var(36) := -14
hitSound = -1 + 0 * (var(31) := 750)
numHits = 0

[State 1232, HitDef]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20)) && var(28) < 7
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
trigger9 = AnimElem = 9
ID = 1231
attr = S, SA
hitFlag = MAF
guardFlag = M
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
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36) := -14
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1232, Final Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
trigger2 = AnimElem = 8 && var(28) >= 7
trigger3 = AnimElem = 9 && var(28) >= 7
ID = 1232
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 29), var(36) := -14
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1232, ChangeState]
type = ChangeState
trigger1 = NumTarget(1232) && MoveContact
value = 1203

[State 1232, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 1232, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<MEKONG DELTA AIR RAID>==
;Rolling
[StateDef 1300]
type = S
physics = N
moveType = I
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 1300, Button Detect (Normal, roll length)]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = AILevel
var(10) = 2

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 195,0
channel = 0

[State 1300, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 105,0
channel = 1

[State 1300, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8 && Anim = 1300
trigger2 = AnimElem = 14 && Anim = 1310
trigger3 = AnimElem = 20 && Anim = 1320
value = 52,0
channel = 3

[State 1300, VelSet]
type = VelSet
trigger1 = !Time
x = -6.25

[State 1300, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1300, Button Detect (Attack strength)]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
trigger1 = !AILevel
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1300, Button Detect (Attack strength, AI)]
type = VarSet
trigger1 = AILevel
var(10) = ifElse(P2BodyDist x >= 150, 2, ifElse(P2BodyDist x >= 110, 1, 0))

[State 1300, Mekong Delta Air Raid (Attack)]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AILevel
trigger2 = Random < 150
var(14) = 1301

[State 1300, Followup]
type = ChangeState
triggerAll = var(14) = [1000,2999]
triggerAll = AnimElemTime(2) >= 0
trigger1 = AnimElemTime(8) < 0 && Anim = 1300
trigger2 = AnimElemTime(14) < 0 && Anim = 1310
trigger3 = AnimElemTime(20) < 0 && Anim = 1320
value = var(14)

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Attack
[StateDef 1301]
type = S
anim = 1301
physics = N
moveType = A
velSet = 0,0
powerAdd = 72 * !var(20)

[State 1301, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1301,0
channel = 0

[State 1301, Staff sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,249
channel = 3

[State 1301, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 4

[State 1301, Staff woosh]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,225
channel = 5

[State 1301, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1301, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Stinger Dust"
posType = P1
ownPal = 1

[State 1301, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ifElse(var(10) = 2, 7.5, ifElse(var(10), 5.625, 3.75))
y = -11.875

[State 1301, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
x = 0.09765625
y = 0.9765625

[State 1301, Light HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13 && !var(10)
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 14
guard.slideTime = 14
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 69), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, Medium HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13 && var(10) = 1
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 19
guard.slideTime = 19
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 69), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, Heavy HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 19
ground.slideTime = 19
guard.hitTime = 23
guard.slideTime = 23
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 69), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1301, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1302


;Landing
[StateDef 1302]
type = S
anim = 1302
physics = N
moveType = I
velSet = 0,0

[State 1302, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1302, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1302, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1302, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MEKONG DELTA AIR RAID>=
;Rolling
[StateDef 1330]
type = S
physics = N
moveType = I
anim = 1320
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
var(25) = 30

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(5 * const(size.xScale)), ceil(-23 * const(size.yScale))
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
value = 195,0
channel = 0

[State 1330, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 105,0
channel = 3

[State 1330, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 52,0
channel = 4

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1330, VelSet]
type = VelSet
trigger1 = !Time
x = -9.375

[State 1330, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1330, Mekong Delta Air Raid (Attack)]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(14) = 1331

[State 1330, Followup]
type = ChangeState
triggerAll = var(14) = [1000,2999]
triggerAll = AnimElemTime(2) >= 0
trigger1 = AnimElemTime(20) < 0
value = var(14)

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Attack
[StateDef 1331]
type = S
anim = 1331
physics = N
moveType = A
velSet = 0,0

[State 1331, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 32

[State 1331, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1301,0
channel = 0

[State 1331, Staff sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,249
channel = 5

[State 1331, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 6

[State 1331, Staff woosh]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,225
channel = 7

[State 1331, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1331, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Stinger Dust"
posType = P1
ownPal = 1

[State 1331, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = P2Dist x / 24
y = -12.875

[State 1331, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.9765625

[State 1331, Heavy HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
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
guard.hitTime = 20
guard.slideTime = 20
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 69), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1331, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1331, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1302



;====<MEKONG DELTA ESCAPE>=
[StateDef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 36 * !var(20)
faceP2 = 1

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,2
channel = 0

[State 1400, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 1400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1400, Dust]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Mekong Delta Escape Dust"
posType = P1
ownPal = 1

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse((P2Dist x - 320) * 0.045 > -3, -3, (P2Dist x - 320) * 0.045)
y = -8.125

[State 1400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.439453125

[State 1400, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(5) > 0
trigger1 = BackEdgeDist < 25
value = 1401

[State 1400, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1402


;Jumping off wall
[StateDef 1401]
type = A
anim = 1401
physics = N
moveType = A
velSet = 0,0

[State 1401, VarSet]
type = VarSet
trigger1 = !Time
var(12) = 1

[State 1401, PosSet]
type = PosSet
trigger1 = !Time
x = -140 * Facing

[State 1401, Jump sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 1401, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -11.25

[State 1401, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) >= 0
x = 7.5 + (1.5 * command = "holdfwd") - (4.5 * command = "holdback")

[State 1401, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.78125

[State 1401, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(3) > 0
value = 1

[State 1401, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1402


;Landing
[StateDef 1402]
type = S
anim = 1402
physics = N
moveType = I
velSet = 0,0

[State 1402, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1402, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1402, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1402, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MEKONG DELTA ESCAPE>=
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1400
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
pos = ceil(20 * const(size.xScale)), ceil(-66 * const(size.yScale))
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
trigger1 = AnimElem = 3
value = 4,2
channel = 0

[State 1430, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 3

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1430, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1430, Dust]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Mekong Delta Escape Dust"
posType = P1
ownPal = 1

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse((P2Dist x - 320) * 0.065 > -3, -3, (P2Dist x - 320) * 0.065)
y = -8.125

[State 1430, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.439453125

[State 1430, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(5) > 0
trigger1 = BackEdgeDist < 25
value = 1401

[State 1430, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1402



;=<SCOUTER JUMP>==
[StateDef 1500]
type = S
physics = N
moveType = I
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 1500, Direction Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "back" || command = "rlsback" || command = "holdback"), 1, 0)

[State 1500, Direction Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 0

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 1, 1510, 1500)

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4,2
channel = 0

[State 1500, Staff Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,249
channel = 1

[State 1500, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 41,0
channel = 3

[State 1500, VarSet]
type = VarSet
trigger1 = AnimElem = 5
var(12) = 2

[State 1500, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
stateType = A
physics = N

[State 1500, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Scouter Jump Dust"
posType = P1
ownPal = 1

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = ifElse(var(10), -9.375, 9.375)
y = ifElse(var(10), -9.0625, -8.75)

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
x = ifElse(var(10), 0.030517578125, -0.030517578125)
y = 0.54931640625

[State 1500, CtrlSet]
type = CtrlSet
trigger1 = AnimElem = 5
value = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



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
trigger1 = AnimElemTime(10) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1002,0
channel = 0

[State 2900, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 16
value = 1,410

[State 2900, Step sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 52,0

[State 2900, Width]
type = Width
trigger1 = AnimElemTime(9) = 1
value = 30,0

[State 2900, Width]
type = Width
trigger1 = AnimElem = 33
trigger2 = AnimElemTime(34) = 9
value = 15,0

[State 2900, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Circle Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 34
x = 48

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 35
x = 32

[State 2900, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(28))
trigger1 = AnimElem = 10
ID = 2900
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, VarAdd]
type = VarAdd
trigger1 = NumTarget(2900)
var(28) = 1
ignoreHitPause = 1
persistent = 0

[State 2900, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(28))
trigger1 = AnimElem = 13
ID = 2901
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, VarAdd]
type = VarAdd
trigger1 = NumTarget(2901)
var(28) = 1
ignoreHitPause = 1
persistent = 0

[State 2900, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(28))
trigger1 = AnimElem = 16
ID = 2902
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, VarAdd]
type = VarAdd
trigger1 = NumTarget(2902)
var(28) = 1
ignoreHitPause = 1
persistent = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
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
value = 4,1
channel = 0

[State 2910, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41,0
channel = 1

[State 2910, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0
value = -1
ignoreHitPause = 1

[State 2910, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(2) >= 0
value = 0
ignoreHitPause = 1

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
name = "Kick Zero Counter Dust"
posType = P1
ownPal = 1

[State 2910, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 15
y = -5

[State 2910, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) >= 0
x = -0.1953125
y = 0.78125

[State 2910, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 2911


;Landing
[StateDef 2911]
type = S
anim = 2911
physics = N
moveType = I
velSet = 0,0

[State 2911, PosSet]
type = Turn
trigger1 = !Time

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

[State 2911, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
