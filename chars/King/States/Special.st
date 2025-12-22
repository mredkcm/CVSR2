; _________________________________________
;| King by Jmorphman                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<VENOM STRIKE>=
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1000, Venom Strike sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElemTime(4) = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Venom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(4) = 1
value = 30,0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<DOUBLE STRIKE>=
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
trigger1 = !Time && !AILevel
;ifElse((command = "b+c"), 12, ifElse((command = "a+c"), 11, 10))
var(10) = ifElse(((NumExplod(90000240) + NumExplod(90000250)) >= 2 || (NumExplod(90000245) + NumExplod(90000255)) >= 2), 12, ifElse(((NumExplod(90000230) + NumExplod(90000250)) >= 2 || (NumExplod(90000235) + NumExplod(90000255)) >= 2), 11, 10))

[State 1030, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 12, ifElse(Random < 500, 11, 10))

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
var(25) = 28

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 14, -83
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
value = 1030,0
channel = 0

[State 1030, Venom Strike sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 9
value = 1000,1
channel = 3

[State 1030, Projectile]
type = Helper
trigger1 = AnimElemTime(4) = 1
trigger2 = AnimElemTime(11) = 1
helperType = Normal
stateNo = 1005
ID = 1035
name = "Double Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(4) = 1
trigger2 = AnimElemTime(11) = 1
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SURPRISE ROSE>=
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0
channel = 0

[State 1100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElemTime(2) = 1
value = 41,0
channel = 1

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,5
channel = 3

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 1
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElemTime(2) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Surprise Rose Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 1
x = 3.75
y = ifElse(var(10) = 2, -15, ifElse(var(10) = 1, -14.375, -13.75))

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 1 && AnimElemTime(8) < 0
y = 0.78125

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -1.75, -13.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.75, -13.125
air.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10) = 1, 21, 14)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10) = 1, 21, 14)))), 7
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
ground.velocity = -5 + ifElse(!var(10), 2, ifElse(var(10) = 1, 1, 0)), -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5 + ifElse(!var(10), 2, ifElse(var(10) = 1, 1, 0)), -6.15234375
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
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = ifElse(var(10) = 2, 7.5, ifElse(var(10) = 1, 5.625, 3.75))
y = 6.25

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.433349609375

[State 1100, HitDef 3 (LK)]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 9 && !var(10)
ID = 1100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 6, 12)
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1100, HitDef 3 (MK/HK)]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 10 && var(10)
ID = 1100
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 6, 12)
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1100, ChangeAnimElem]
type = ChangeAnim
triggerAll = MoveContact = 1 && HitPauseTime
triggerAll = HitPauseTime <= ifElse(var(20), 2, 4)
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) <= 0
trigger2 = AnimElemTime(10) >= 0 && AnimElemTime(11) <= 0
value = 1100
elem = 11
ignoreHitPause = 1

[State 1100, TargetState]
type = TargetState
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(9) >= 0
triggerAll = MoveHit = 1 && NumTarget(1100)
triggerAll = Target, StateType != A
trigger1 = abs(pos x - Target, pos x) >= 60
trigger2 = P2Dist x < 0
value = 3015
ID = 1100
ignoreHitPause = 1
persistent = 0

[State 1100, TargetBind]
type = TargetBind
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(9) >= 0
triggerAll = MoveHit = 1 && NumTarget(1100)
triggerAll = Target, StateType != A
trigger1 = abs(pos x - Target, pos x) >= 60
trigger2 = P2Dist x < 0
pos = 48,0
ID = 1100
ignoreHitPause = 1
persistent = 0

[State 1100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1100, Finish]
type = VarSet
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(9) >= 0
trigger1 = MoveHit = 1 && NumEnemy
trigger2 = MoveGuarded = 1 && NumEnemy
var(14) = 1101
ignoreHitPause = 1

[State 1100, Rebound]
type = VarSet
triggerAll = AnimElemTime(9) >= 0
trigger1 = MoveReversed = 1
var(14) = 1103
ignoreHitPause = 1

[State 1100, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(11) >= 0
trigger2 = var(14) = 1103
trigger2 = MoveReversed > 1
value = var(14)

[State 1100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102


;Finish
[StateDef 1101]
type = A
physics = N
moveType = A
velSet = 0,0
anim = 1101
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
value = 1,5

[State 1101, VelSet]
type = VelSet
trigger1 = !Time
x = 0
y = 0

[State 1101, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 6, 12)
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -21
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 3, 6)
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = -3.90625
y = -7.03125

[State 1101, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0
y = 0.5859375

[State 1101, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

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

[State 1102, EX Flash off]
type = VarSet
trigger1 = !Time
var(25) = 0

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
channel = 1

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Rebound off opponent (Attack failed)
[StateDef 1103]
type = A
physics = N
moveType = A
velSet = 0,0
anim = 1101
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1103, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1101
elem = 7

[State 1103, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = -3.90625
y = -7.03125

[State 1103, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0
y = 0.5859375

[State 1103, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1103, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102



;====<EX SURPRISE ROSE>=
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
posType = p1
pos = 28,-57
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

[State 1130, Jumping Sound]
type = PlaySnd
trigger1 = AnimElemTime(2) = 1
value = 41,0
channel = 3

[State 1130, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,5
channel = 4

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 1
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElemTime(2) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Surprise Rose Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 1
x = 3.75
y = -14.375

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 1 && AnimElemTime(8) < 0
y = 0.78125

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) >= 0
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
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
ground.velocity = -1.75, -13.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.75, -13.125
air.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
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
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
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
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 7.5
y = 6.25

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.433349609375

[State 1130, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 10
ID = 1130
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 12,12
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, ChangeAnimElem]
type = ChangeAnim
triggerAll = MoveContact = 1 && HitPauseTime
triggerAll = HitPauseTime <= ifElse(var(20), 2, 4)
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) <= 0
trigger2 = AnimElemTime(10) >= 0 && AnimElemTime(11) <= 0
value = 1100
elem = 11
ignoreHitPause = 1

[State 1130, TargetState]
type = TargetState
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(10) >= 0
triggerAll = MoveHit = 1 && NumTarget(1130)
triggerAll = Target, StateType != A
trigger1 = abs(pos x - Target, pos x) >= 60
trigger2 = P2Dist x < 0
value = 3015
ID = 1130
ignoreHitPause = 1
persistent = 0

[State 1130, TargetBind]
type = TargetBind
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(10) >= 0
triggerAll = MoveHit = 1 && NumTarget(1130)
triggerAll = Target, StateType != A
trigger1 = abs(pos x - Target, pos x) >= 60
trigger2 = P2Dist x < 0
pos = 48,0
ID = 1130
ignoreHitPause = 1
persistent = 0

[State 1130, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1130, Finish]
type = VarSet
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = AnimElemTime(10) >= 0
trigger1 = MoveHit = 1 && NumEnemy
var(14) = 1131
ignoreHitPause = 1

[State 1130, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(11) >= 0
value = var(14)

[State 1130, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102


;Finish
[StateDef 1131]
type = A
physics = N
moveType = A
velSet = 0,0
anim = 1131
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1131, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 87

[State 1131, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 4
trigger3 = AnimElem = 15
trigger4 = AnimElem = 18
trigger5 = AnimElem = 21
trigger6 = AnimElem = 26
value = 1,5

[State 1131, Voice]
type = PlaySnd
trigger1 = AnimElem = 28
value = 4, 4
channel = 0

[State 1131, VelSet]
type = VelSet
trigger1 = !Time
trigger2 = AnimElem = 16
x = 0
y = 0

[State 1130, Hits 1/4]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 19
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,12
guard.pauseTime = 2,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -7.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -21
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1131, Hits 2/3/5]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 5
trigger2 = AnimElem = 16
trigger3 = AnimElem = 22
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,6 + 6 * (AnimElem = 16)
guard.pauseTime = 2,6 + 6 * (AnimElem = 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -7.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1131, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = -9.6

[State 1131, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0 && AnimElemTime(16) < 0
y = 0.768

[State 1131, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (2 + HitCount) || var(20))
trigger1 = AnimElem = 28
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.15234375
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1131, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(29) >= 0
moveType = I

[State 1131, VelSet]
type = VelSet
trigger1 = AnimElem = 29
x = -4.90625
y = -8.03125

[State 1131, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(29) > 0
y = 0.5859375

[State 1131, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
x = 14
y = 16

[State 1131, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1102



;=<TRAP SHOT>==
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
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 1200, Trap Shot effect]
type = Explod
trigger1 = AnimElem = 4
anim = 1205
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3 && var(10)
x = ifElse(var(10) = 1, 2.8125, 5.625)

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 4 && var(10)
x = 0

[State 1200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1200
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0, 12
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 4
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -12.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1200, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1200) > 1
ID = 1200
keepOne = 1
excludeID = 1200
ignoreHitPause = 1

[State 1200, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1200)
value = 1205
ID = 1200
ignoreHitPause = 1
persistent = 0

[State 1200, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(1200)
pos = 64,0
ID = 1200
ignoreHitPause = 1
persistent = 0

[State 1200, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1200) && !AnimTime
value = 1201

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1200, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1200, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 1200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1201]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1201
ctrl = 0
sprPriority = 1

[State 1201, Width]
type = Width
trigger1 = !Time
edge = 64,0

[State 1201, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 730,1
channel = 0

[State 1201, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 37
value = 4,4
channel = 0

[State 1201, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9
trigger2 = AnimElem = 12 || AnimElem = 15 || AnimElem = 18
trigger3 = AnimElem = 21 || AnimElem = 24 || AnimElem = 27
trigger4 = AnimElem = 30 || AnimElem = 37
value = 1,5

[State 1201, Spark XY]
type = Null
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 28 || AnimElem = 31
trigger1 = var(35) := 52 || var(36) := -94
trigger2 = AnimElem = 10 || AnimElem = 13 || AnimElem = 22 || AnimElem = 25
trigger2 = var(35) := 58 || var(36) := -74
trigger3 = AnimElem = 16 || AnimElem = 19
trigger3 = var(35) := 54 || var(36) := -43

[State 1201, Hit Low]
type = HitDef
trigger1 = AnimElem = 4 || AnimElem = 28
trigger2 = AnimElem = 10 || AnimElem = 16
trigger3 = AnimElem = 22
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
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
kill = 0
p2Facing = 1

[State 1201, Hit High]
type = HitDef
trigger1 = AnimElem = 7 || AnimElem = 31
trigger2 = AnimElem = 13 || AnimElem = 19
trigger3 = AnimElem = 25
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
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
kill = 0
p2Facing = 1

[State 1201, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 39
ID = 1201
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -3.5125, -10.5546875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3.5125, -10.5546875
air.cornerPush.velOff = 0
yAccel = 0.634765625
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1201
elem = 40
ignoreHitPause = 1

[State 1201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Trap Shot (Target)
[StateDef 1205]
type = S
moveType = H
physics = N
velSet = 0,0

[State 1205, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1205, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 1205, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 1205, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 1205, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 1206


;Sliding
[StateDef 1206]
type = S
movetype = H
physics = S

[State 1206, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5017

[State 1206, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 1206, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;====<EX TRAP SHOT>=
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
var(25) = 9

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 11, -81
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1230, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 3

[State 1230, Trap Shot effect]
type = Explod
trigger1 = AnimElem = 4
anim = 1205
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 11.25

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1230
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 12
guard.pauseTime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 14
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -16.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1230, continue EX Flash]
type = VarSet
trigger1 = MoveHit && NumTarget(1230)
var(25) = 2
ignoreHitPause = 1

[State 1230, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1230) > 1
ID = 1230
keepOne = 1
excludeID = 1230
ignoreHitPause = 1

[State 1230, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1230)
value = 1205
ID = 1230
ignoreHitPause = 1
persistent = 0

[State 1230, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(1230)
pos = 64,0
ID = 1230
ignoreHitPause = 1
persistent = 0

[State 1230, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1230) && !AnimTime
value = 1231

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1230, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 4

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1231]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1231
ctrl = 0
sprPriority = 1

[State 1231, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 129

[State 1231, Width]
type = Width
trigger1 = !Time
edge = 64,0

[State 1231, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 730,1
channel = 0

[State 1231, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 61
value = 4,4
channel = 0

[State 1231, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9
trigger2 = AnimElem = 12 || AnimElem = 15 || AnimElem = 18
trigger3 = AnimElem = 21 || AnimElem = 24
trigger4 = AnimElem = 32 || AnimElem = 35 || AnimElem = 38
trigger5 = AnimElem = 41 || AnimElem = 44 || AnimElem = 47
trigger6 = AnimElem = 50 || AnimElem = 53 || AnimElem = 61
value = 1,5

[State 1231, Spark XY]
type = Null
trigger1 = AnimElem = 4 || AnimElem = 25
trigger1 = var(35) := 52 || var(36) := -94
trigger2 = AnimElem = 7 || AnimElem = 10 || AnimElem = 19 || AnimElem = 22
trigger2 = var(35) := 58 || var(36) := -74
trigger3 = AnimElem = 13 || AnimElem = 16
trigger3 = var(35) := 54 || var(36) := -43
trigger4 = AnimElem = 33 || AnimElem = 54
trigger4 = var(35) := 72 || var(36) := -93
trigger5 = AnimElem = 36 || AnimElem = 39 || AnimElem = 48 || AnimElem = 51
trigger5 = var(35) := 80 || var(36) := -72
trigger6 = AnimElem = 42 || AnimElem = 45
trigger6 = var(35) := 78 || var(36) := -47

[State 1231, Hit Low]
type = HitDef
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = AnimElem = 16 || AnimElem = 22
trigger3 = AnimElem = 33 || AnimElem = 39
trigger4 = AnimElem = 45 || AnimElem = 51
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
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
kill = 0
p2Facing = 1

[State 1231, Hit High]
type = HitDef
trigger1 = AnimElem = 7 || AnimElem = 13
trigger2 = AnimElem = 19 || AnimElem = 25
trigger3 = AnimElem = 36 || AnimElem = 42
trigger4 = AnimElem = 48 || AnimElem = 54
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
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
kill = 0
p2Facing = 1

[State 1231, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 63
ID = 1231
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 140 < 7, 7, fvar(11) * 140)), 7
getPower = 0,0
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
ground.velocity = -3.5125, -10.5546875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3.5125, -10.5546875
air.cornerPush.velOff = 0
yAccel = 0.634765625
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<TORNADO KICK>==
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
var(10) = ifElse((P2MoveType = H || P2Dist x > 210 || Random < 333), 2, ifElse(P2Dist x > 175, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 1

[State 1300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
value = 1200,1
channel = 3

[State 1300, Tornado Kick effect 1]
type = Explod
trigger1 = AnimElem = 6
anim = 1305
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1300, Tornado Kick effect 2]
type = Explod
trigger1 = AnimElem = 13
anim = 1306
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tornado Kick Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 5.3125, ifElse(var(10) = 1, 4.21875, 3.125))
y = -5.9375

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
x = ifElse(var(10) = 2, 0.01373291015625, ifElse(var(10) = 1, 0.012969970703125, 0.01220703125))
y = 0.390625

[State 1300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)))), 7
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
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -4.15234375
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
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10) = 1, 49, 42)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10) = 1, 49, 42)))), 7
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
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -4.15234375
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
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 1300, End]
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
channel = 1

[State 1301, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;====<EX TORNADO KICK>=
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
pos = 28,-51
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
value = 1300,0
channel = 0

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1330, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 13
value = 1200,1
channel = 4

[State 1330, Tornado Kick effect 1]
type = Explod
trigger1 = AnimElem = 6
anim = 1305
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1330, Tornado Kick effect 2]
type = Explod
trigger1 = AnimElem = 13
anim = 1306
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tornado Kick Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 7.3125
y = -5.9375

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
x = 0.01373291015625
y = 0.390625

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA
time = 1

[State 1330, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -4.15234375
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
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -5, -6.15234375
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -4.15234375
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
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;====<MIRAGE KICK>=
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
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 155 || Random < 333), 2, ifElse(P2Dist x > 135, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 8 && var(10)
trigger3 = AnimElem = 14 && var(10) = 2
value = 4,2
channel = 0

[State 1400, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 23 && var(10) = 2
value = 4,4
channel = 0

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 5
trigger2 = (AnimElem = 8 || AnimElem = 11) && var(10)
trigger3 = (AnimElem = 14 || AnimElem = 17) && var(10) = 2
value = 1,3

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 23 && var(10) = 2
value = 1,5
channel = 1

[State 1400, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 7.5, ifElse(var(10) = 1, 6.25, 5))

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1400, Hit Low]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 9 && var(10)
trigger3 = AnimElem = 15 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 32
ground.slideTime = 32
guard.hitTime = 32
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -4.58984375
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Hit High]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 12 && var(10)
trigger3 = AnimElem = 18 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 1, 2)
guard.pauseTime = 0, ifElse(var(20), 1, 2)
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 32
ground.slideTime = 32
guard.hitTime = 32
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -4.58984375
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -92
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13 && !var(10)
trigger2 = AnimElem = 19 && var(10) = 1
trigger3 = AnimElem = 25 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
guard.hitTime = 6
air.hitTime = 120
ground.velocity = -5.3125, -10.5546875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.3125, -10.5546875
air.cornerPush.velOff = 0
yAccel = 0.634765625
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))
elem = ifElse(var(10) = 2, 26, ifElse(var(10), 20, 14))
ignoreHitPause = 1

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MIRAGE KICK>=
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
trigger1 = AnimElemTime(38) < -2
var(25) = 2

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 26,-66
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
trigger1 = !Time
value = 4,2
channel = 0

[State 1430, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0

[State 1430, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 35
value = 4,4
channel = 0

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 35
value = 1,5
channel = 3

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 13 || AnimElem = 16
trigger2 = (AnimElem = 19 || AnimElem = 22)
trigger3 = (AnimElem = 25 || AnimElem = 28)
value = 1,3

[State 1430, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 4

[State 1430, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "EX Mirage Kick Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, Step Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 100,0
channel = 5

[State 1430, VelSet]
type = VelSet
trigger1 = !Time
x = 7.5

[State 1430, ChangeAnimElem]
type = ChangeAnim
trigger1 = AnimElemTime(4) < 0 && P2Dist x <= 45
value = 1430
elem = 4
ignoreHitPause = 1

[State 1430, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0 && vel x > 0
x = 0.8583222525934769

[State 1430, VelSet]
type = VelSet
trigger1 = vel x <= 0.1
x = 0

[State 1430, Width]
type = Width
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(14) < 0
value = 32,0

[State 1430, First Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 32
guard.hitTime = 32
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -4.58984375
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Hit Low]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 14
trigger2 = AnimElem = 20
trigger3 = AnimElem = 26
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,2
guard.pauseTime = 0,2
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 32
ground.slideTime = 32
guard.hitTime = 32
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -4.58984375
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Hit High]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 17
trigger2 = AnimElem = 23
trigger3 = AnimElem = 29
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,2
guard.pauseTime = 0,2
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 32
guard.hitTime = 32
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -4.58984375
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -92
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 36
ID = 1430
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.16, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.16, -9.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(11) && NumTarget(1430)
var(15) = 0

[State 1430, VarAdd]
type = VarAdd
trigger1 = MoveHit && NumTarget(1430)
var(11) = 1
persistent = 0

[State 1430, Juggle Flag]
type = VarSet
trigger1 = var(11) = 2
var(16) = 1

[State 1430, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(36) >= 0 && AnimElemTime(37) <= 0
trigger1 = HitPauseTime <= 22
value = 1430
elem = 37
ignoreHitPause = 1

[State 1430, End]
type = ChangeState
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
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,1
channel = 0

[State 2900, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2900, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 3

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "2-Step Flying Kick Dust"
posType = P1
ownPal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4.8125;2.8125
y = -9.375

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.537109375

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 2900
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -8.25
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 23), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2900
elem = 6
ignoreHitPause = 1

[State 2900, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(2900)
trigger1 = AnimElemTime(6) = 0
value = 2901

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 2902


;Finish
[StateDef 2901]
type = A
physics = N
moveType = A
anim = 2901
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 2901, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,1
channel = 0

[State 2901, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2901, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 2.5

[State 2901, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0.3125

[State 2901, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.537109375

[State 2901, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
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
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2901, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2901
elem = 5
ignoreHitPause = 1

[State 2901, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 2901, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 2902


;Landing
[StateDef 2902]
type = S
anim = 47
physics = N
moveType = I
velSet = 0,0

[State 2902, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 2902, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2902, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 3

[State 2902, End]
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
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 1
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 2910, Slide Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,458
channel = 3

[State 2910, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Slide Dust"
posType = p1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 2910, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 15

[State 2910, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && vel x > 0
x = -1.5625

[State 2910, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
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
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -9
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(10) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
