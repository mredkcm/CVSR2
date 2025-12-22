; _________________________________________
;| Kyo Kusanagi by Jmorphman               |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;SPECIAL MOVES=
;==

;114 SHIKI: ARAGAMI>=
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
;ifElse((command = "y" || command = "rlsy"), 1, 0)
var(10) = ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0)

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 171 || Random < 333), 1, 0)

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, 1001)

[State 1000, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1000, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 192,1
channel = 1

[State 1000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 1000,1
channel = 0

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.4375

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 12

[State 1000, Aragami effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1005
anim = 1005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(3)  >= 0 && AnimElemTime(4) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,14
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), (var(36) := -73)
hitSound = S3,0
numHits = 0

[State 1000, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 42, 35) < 7, 7, fvar(11) * ifElse(var(10) = 1, 42, 35))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
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
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 30
ignoreHitPause = 1
persistent = 0

[State 1000, Flame Particles]
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

[State 1000, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10), 1001, 1000)
elem = 6
ignoreHitPause = 1

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1000, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1000, Yanosabi]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(12) < 0
trigger1 = !AILevel
;command = "HCB"
triggerAll = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010504)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010406))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 121 || EnemyNear, StateNo = 131 || EnemyNear, StateNo = 141 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel
trigger3 = Random < 30
trigger3 = P2Dist x >= 0
var(14) = 1040

[State 1000, Konokizu]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(12) < 0
trigger1 = !AILevel
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && !var(14)
trigger2 = Random < 200 && MoveHit
trigger2 = P2Dist x >= 0
var(14) = 1010

[State 1000, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(12) < 0
value = var(14)

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;128 SHIKI: KONOKIZU
[StateDef 1010]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1010
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1010, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1005

[State 1010, Voice]
type = PlaySnd
trigger1 = !Time
value = 1010,0
channel = 0

[State 1010, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 3

[State 1010, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 10
x = 6

[State 1010, PosAdd]
type = PosAdd
trigger1 = Time = 1
x = 10

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 24

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 21

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 8

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 15

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 9

[State 1010, Konokizu effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1015
anim = 1015
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1010, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -4.5,-6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -98
palFX.time = 41
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1010, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 41
ignoreHitPause = 1
persistent = 0

[State 1010, Flame Particles]
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

[State 1010, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1010
elem = 5
ignoreHitPause = 1

[State 1010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1010, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1010, Nanase]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(8) < 0
trigger1 = !AILevel
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
trigger2 = AILevel && !var(14)
trigger2 = Random < 333
trigger2 = P2Dist x >= 0
var(14) = ifElse(var(40) = 2, 1180, 1030)

[State 1010, Yanosabi]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(8) < 0
trigger1 = !AILevel
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220)
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x >= 0 && MoveHit
var(14) = 1020

[State 1010, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
value = var(14)

[State 1010, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;127 SHIKI: YANOSABI
[StateDef 1020]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1020
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1020, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1015

[State 1020, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 192,1
channel = 4

[State 1020, PosAdd]
type = PosAdd
trigger1 = !Time
x = 29

[State 1020, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 22

[State 1020, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 4

[State 1020, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 6

[State 1020, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 5

[State 1020, Yanosabi effect]
type = Explod
trigger1 = AnimElem = 4
ID = 1025
anim = 1025
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1020, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
ID = 1020
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -6,10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6,10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -57
palFX.time = 18
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1020, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 18
ignoreHitPause = 1
persistent = 0

[State 1020, Flame Particles]
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

[State 1020, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1020) > 1
ID = 1020
keepOne = 1
excludeID = 1020
ignoreHitPause = 1

[State 1020, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1020)
trigger1 = !(Target(1020), Time)
value = ifElse(Target(1020), StateType = A, 5425, 5420)
ID = 1020
ignoreHitPause = 1

[State 1020, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1020
elem = 6
ignoreHitPause = 1

[State 1020, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1020, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;125 SHIKI: NANASE
[StateDef 1030]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1030
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1030, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1015

[State 1030, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 4

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 20

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 8.4375

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
pos = -25,0
ownPal = 1

[State 1030, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -5,-7.1875
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5,-7.1875
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -74
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1030, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0
channel = 5

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;127 SHIKI: YANOSABI (FROM ARAGAMI)
[StateDef 1040]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1040
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1040, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1015

[State 1040, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 1040,0
channel = 0

[State 1040, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 192,1
channel = 3

[State 1040, PosAdd]
type = PosAdd
trigger1 = !Time
x = 6

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 24

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 22

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 22

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 4

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 6

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 5

[State 1040, Yanosabi effect]
type = Explod
trigger1 = AnimElem = 7
ID = 1025
anim = 1025
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1040, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8
ID = 1040
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -6,10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6,10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -57
palFX.time = 16
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1040, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 16
ignoreHitPause = 1
persistent = 0

[State 1040, Flame Particles]
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

[State 1040, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1040) > 1
ID = 1040
keepOne = 1
excludeID = 1040
ignoreHitPause = 1

[State 1040, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1040)
trigger1 = !(Target(1040), Time)
value = ifElse(Target(1040), StateType = A, 5425, 5420)
ID = 1040
ignoreHitPause = 1

[State 1040, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1040
elem = 9
ignoreHitPause = 1

[State 1040, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1040, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1040, Kototsuki You]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(12) < 0 && var(40) = 2
trigger1 = !AILevel
;command = "HCB"
triggerAll = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010504)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010406))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel && !var(14)
trigger2 = Random < 200
trigger2 = P2Dist x >= 0
var(14) = 1060

[State 1040, Nanase]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) >= 0 && AnimElemTime(12) < 0
trigger1 = !AILevel
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
trigger2 = AILevel && !var(14)
trigger2 = Random < 400
var(14) = ifElse(var(40) = 2, 1180, 1030)

[State 1040, Migiri Ugachi]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) >= 0 && AnimElemTime(12) < 0
trigger1 = !AILevel
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 130 || EnemyNear, StateNo = 150 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel && !var(14)
trigger3 = Random < 200
trigger3 = P2Dist x >= 0
var(14) = 1050

[State 1040, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
value = var(14)

[State 1040, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;GESHIKI: MIGIRI UGACHI
[StateDef 1050]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1050
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1050, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1025

[State 1050, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 4

[State 1050, Migiri Ugachi effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1055
anim = 1055
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1050, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
ID = 1050
attr = S, SA
hitFlag = MAFD
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 34
down.hitTime = 34
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6,10
air.cornerPush.velOff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -6
palFX.time = 24
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 24
ignoreHitPause = 1
persistent = 0

[State 1050, Flame Particles]
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

[State 1050, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1050) > 1
ID = 1050
keepOne = 1
excludeID = 1050
ignoreHitPause = 1

[State 1050, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1050)
trigger1 = !(Target(1050), Time)
value = ifElse(Target(1050), StateType = L, 1055, ifElse(Target(1050), StateType = A, 5425, 5420))
ID = 1050
ignoreHitPause = 1

[State 1050, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1050
elem = 6
ignoreHitPause = 1

[State 1050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1050, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Hit by Migiri Ugachi
[StateDef 1055]
type = L
moveType = H
physics = N
velSet = 0,0

[State 1055, PosSet]
type = PosSet
trigger1 = 1
y = 0
ignoreHitPause = 1

[State 1055, VarSet]
type = VarSet
trigger1 = !Time
sysvar(2) = 5080

[State 1055, VarAdd]
type = VarAdd
trigger1 = !Time
trigger1 = (Anim = [5081,5089]) || (Anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (Anim % 10))
sysvar(2) = Anim % 10

[State 1055, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 1055, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 1055, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 1056


;Knocked back
[Statedef 1056]
type = L
moveType = H
physics = C

[State 1056, PosSet]
type = PosSet
trigger1 = 1
y = 0
ignoreHitPause = 1

[State 1056, VelSet]
type = VelSet
trigger1 = HitOver
x = 0

[State 1056, VarSet]
type = VarSet
trigger1 = !Time
sysvar(0) = 1

[State 1056, ChangeState]
type = ChangeState
trigger1 = HitOver && Alive
value = 1057

[State 1056, SelfState]
type = SelfState
trigger1 = HitOver && !Alive
value = 5150


;Recover
[StateDef 1057]
type = L
moveType = H
physics = N

[State 1057, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 1057, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5110 + (Anim % 10))
trigger1 = Anim = [5081,5089]
value = 5110 + (Anim % 10)
persistent = 0

[State 1057, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 1057, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 1057, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 1057, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1057, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yVel) != 0
sysvar(1) = floor(vel y)

[State 1057, PlaySnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !sysvar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1057, Explod]
type = Explod
trigger1 = !Time
trigger1 = !sysvar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 1057, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 1057, ChangeAnim]
type = ChangeAnim
triggerAll = Anim = [5171,5179]
triggerAll = SelfAnimExist(5110 + (Anim % 10))
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110 + (Anim % 10)
persistent = 0

[State 1057, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != [5111,5119]
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110
persistent = 0

[State 1057, SelfState]
type = SelfState
triggerAll = !Alive
trigger1 = !AnimTime
trigger2 = sysvar(0)
trigger3 = Anim = [5110,5119]
value = 5150

[State 1057, VarSet]
type = VarSet
trigger1 = sysvar(0)
trigger1 = !Time
sysvar(0) = 0

[State 1057, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 1057, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 1057, SelfState]
type = SelfState
trigger1 = !Time
trigger1 = GetHitVar(chainID) != 429 && GetHitVar(chainID) != 1040 && GetHitVar(chainID) != 1050
trigger2 = Time >= 14
trigger2 = GetHitVar(chainID) = 1040
trigger3 = HitOver
trigger3 = GetHitVar(chainID) = 429 || GetHitVar(chainID) = 1050
value = 5120



;212 SHIKI: KOTOTSUKI YOU (FROM YANOSABI)
;Grab attempt
[StateDef 1060]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1060
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1060, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1025

[State 1060, Voice]
type = PlaySnd
trigger1 = !Time
value = 1060,0
channel = 0

[State 1060, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 192,1
channel = 4

[State 1060, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 18

[State 1060, Kototsuki You Success effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1065
anim = 1065
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1060, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 1060
attr = S, SA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = 0, 7
getPower = 0, 18 * !var(20)
givePower = 0, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
numHits = 0
p2Facing = 1

[State 1060, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1060) > 1
ID = 1060
keepOne = 1
excludeID = 1060
ignoreHitPause = 1

[State 1060, Success]
type = ChangeState
trigger1 = MoveHit && NumTarget(1060)
value = 1070

[State 1060, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1060, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1070]
type = S
physics = N
moveType = A
anim = 1070
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1070, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1065

[State 1070, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget(1060)
value = 0
ctrl = 1

[State 1070, Width]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 64,0

[State 1070, TargetState]
type = TargetState
trigger1 = !Time && NumTarget(1060)
value = 1080

[State 1070, TargetBind 1]
type = TargetBind
trigger1 = NumTarget(1060)
trigger1 = AnimElemTime(2) < 0
pos = 43,0

[State 1070, TargetBind 2]
type = TargetBind
trigger1 = NumTarget(1060)
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 39,-108

[State 1070, TargetBind 3]
type = TargetBind
trigger1 = NumTarget(1060)
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 32,-128

[State 1070, TargetBind 4]
type = TargetBind
trigger1 = NumTarget(1060)
trigger1 = AnimElemTime(4) = 0
pos = 43,-24

[State 1070, Damage]
type = TargetLifeAdd
trigger1 = NumTarget(1060) && AnimElem = 4
value = floor(ifElse(105 * fvar(11) < 7, -7, -105 * fvar(11)))

[State 1070, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget(1060) && AnimElem = 4
value = 36

[State 1070, Power]
type = PowerAdd
trigger1 = NumTarget(1060) && AnimElem = 4
value = 72

[State 1070, HitAdd]
type = HitAdd
trigger1 = NumTarget(1060) && AnimElem = 4
value = 1

[State 1070, HitAdd]
type = VarAdd
trigger1 = NumTarget(1060) && AnimElem = 4
var(13) = 1

[State 1070, Juggle]
type = VarAdd
trigger1 = NumTarget(1060) && AnimElem = 4
var(15) = 1
ignoreHitPause = 1

[State 1070, Throw]
type = TargetState
trigger1 = NumTarget(1060) && AnimElem = 4
value = 1081

[State 1070, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1070,0
channel = 0

[State 1070, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElemTime(4) = 3
trigger3 = AnimElemTime(4) = 6
value = 1520,1
channel = 2

[State 1070, Kototsuki You success effect]
type = Explod
trigger1 = !Time
ID = 1075
anim = 1075
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1070, Kototsuki You explosion effect 1]
type = Explod
trigger1 = AnimElem = 4
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 27, -126
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1070, Kototsuki You explosion effect 2]
type = Explod
trigger1 = AnimElemTime(4) = 3
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = 42, -110
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1070, Kototsuki You explosion effect 3]
type = Explod
trigger1 = AnimElemTime(4) = 6
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 15, -119
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1070, Flame Particle Timer Set]
type = VarSet
trigger1 = NumTarget(1060) && AnimElem = 4
var(44) = 23
ignoreHitPause = 1
persistent = 0

[State 1070, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = NumTarget(1060) && AnimElem = 4
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1070, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<212 SHIKI: KOTOTSUKI YOU (TARGET, FROM YANOSABI)
;Being Thrown
[StateDef 1080]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1080, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1080

[State 1080, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 1080, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1081]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -6.25, -5.78125
sprPriority = 0

[State 1081, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1081, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030
trigger1 = !AnimTime
value = 5050

[State 1081, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 1081, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,1
ignoreHitPause = 1

[State 1081, PalFX]
type = PalFX
trigger1 = !Time
time = 23
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 1081, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5126953125

[State 1081, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1081, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1081, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;115 SHIKI: DOKUGAMI
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

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0
channel = 0

[State 1100, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 192,1
channel = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.4375

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 10

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 9
x = 11

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 10
x = 15

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 1

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
x = 3

[State 1100, Dokugami effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1105
anim = 1105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), (var(36) := -68)
hitSound = S3,0
numHits = 0

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.slideTime = 18
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 30
ignoreHitPause = 1
persistent = 0

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
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1100, Tsumi Yomi]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
;command = "HCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010504)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010406))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x <= 140
trigger2 = P2Dist x >= 0
var(14) = 1110

[State 1100, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;401 SHIKI: TSUMI YOMI
[StateDef 1110]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1110
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1110, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1105

[State 1110, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 3

[State 1110, PosAdd]
type = PosAdd
trigger1 = !Time
x = 10

[State 1110, PosAdd]
type = PosAdd
trigger1 = Time = 1
x = 22

[State 1110, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 19

[State 1110, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 12

[State 1110, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 8

[State 1110, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 4

[State 1110, Tsumi Yomi effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1115
anim = 1115
bindTime = 14
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1110, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -78
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1110, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 34
ignoreHitPause = 1
persistent = 0

[State 1110, Flame Particles]
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

[State 1110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1110, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1110, Batsu Yomi]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(6) < 0
trigger1 = !AILevel
;command = "holdfwd"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && (NumExplod(90000006) || NumExplod(90000026))) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && (NumExplod(90000004) || NumExplod(90000024)))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x <= 90
trigger2 = P2Dist x >= 0
var(14) = 1120

[State 1110, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
value = var(14)

[State 1110, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;402 SHIKI: BATSU YOMI
[StateDef 1120]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1120
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1120, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1115

[State 1120, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 192,1
channel = 4

[State 1120, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 5

[State 1120, PosAdd]
type = PosAdd
trigger1 = !Time
x = 16

[State 1120, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 10

[State 1120, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 4

[State 1120, Batsu Yomi effect]
type = Explod
trigger1 = AnimElem = 4
ID = 1125
anim = 1125
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1120, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1120, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Batsu Yomi Dust"
posType = P1
ownPal = 1

[State 1120, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) >= 0
x = ifElse(vel y > 0, 0, (5 * exp((-0.08248837369388663590004065418731) * (Time - 10))))

[State 1120, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = -6

[State 1120, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.42578125

[State 1120, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -2,-10.8
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2,-10.8
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 58
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1120, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 58
ignoreHitPause = 1
persistent = 0

[State 1120, Flame Particles]
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

[State 1120, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1120, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1120, Oniyaki]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) >= 0 && AnimElemTime(7) < 0
trigger1 = !AILevel
;command = "F, D, DF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && (NumExplod(90010203) || NumExplod(90010253))) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && (NumExplod(90010301) || NumExplod(90010351)))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = MoveHit
trigger2 = P2Dist x >= 0
var(14) = 1130

[State 1120, Followup]
type = ChangeState
trigger1 = (var(14) = [1000,2999]) && MoveContact
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = var(14)

[State 1120, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1121


;Landing
[StateDef 1121]
type = S
anim = ifElse(PrevStateNo = 1831, 1832, 1121)
physics = N
moveType = I
velSet = 0,0

[State 1121, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1121, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1121, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 6

[State 1121, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;100 SHIKI: ONIYAKI
[StateDef 1130]
type = A
physics = N
moveType = A
anim = 1130
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1130, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 2
id = 1125

[State 1130, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1130, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,1
channel = 6

[State 1130, VarSet]
type = VarSet
trigger1 = AnimElem = 2
var(10) = -ceil(pos y)

[State 1130, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
y = -15

[State 1130, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
pos = 0, var(10)
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElemTime(5) < 0
x = (2.8067474365234375 * exp((-0.082489343609893257228599306753264) * (Time - 1)))

[State 1130, VelSet]
type = VelSet
trigger1 = !Time
trigger2 = AnimElem = 5
x = 0

[State 1130, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.42578125

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 55
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 55
ignoreHitPause = 1
persistent = 0

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
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1130, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;115 SHIKI: DOKUGAMI KAI>=
[StateDef 1150]
type = S
physics = N
moveType = A
anim = 1150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1150, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1150, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 29

[State 1150, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 2, -76
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1150, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1150, Voice]
type = PlaySnd
trigger1 = !Time; = 4
value = 4,3
channel = 0

[State 1150, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 192,1
channel = 3

[State 1150, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 16.875

[State 1150, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 10

[State 1150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 9
x = 11

[State 1150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 10
x = 15

[State 1150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 1

[State 1150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
x = 3

[State 1150, Dokugami effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1155
anim = 1105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1150, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(5) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), (var(36) := -68)
hitSound = S3,0
numHits = 0

[State 1150, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
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
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 30
ignoreHitPause = 1
persistent = 0

[State 1150, Flame Particles]
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

[State 1150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1150, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1150, Aragami]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(9) < 0
trigger1 = !AILevel
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x <= 170
trigger2 = P2Dist x >= 0
var(14) = 1160

[State 1150, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
value = var(14)

[State 1150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;114 SHIKI: ARAGAMI (FROM DOKUGAMI KAI)>=
[StateDef 1160]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1160
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1160, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1155

[State 1160, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 26

[State 1160, Voice]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1160, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 192,1
channel = 4

[State 1160, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 1000,1
channel = 0

[State 1160, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.4375

[State 1160, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 12

[State 1160, Aragami effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1165
anim = 1005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1160, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(2)  >= 0 && AnimElemTime(5) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), (var(36) := -73)
hitSound = S3,0
numHits = 0

[State 1160, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
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
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 32
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 30
ignoreHitPause = 1
persistent = 0

[State 1160, Flame Particles]
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

[State 1160, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1160
elem = 6
ignoreHitPause = 1

[State 1160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1160, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1160, Konokizu]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(12) < 0
trigger1 = !AILevel
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && MoveHit
trigger2 = P2Dist x >= 0
var(14) = 1170

[State 1160, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(12) < 0
value = var(14)

[State 1160, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;128 SHIKI: KONOKIZU (EX DOKUGAMI CHAIN)
[StateDef 1170]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1010
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1170, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1165

[State 1170, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1166

[State 1170, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 20

[State 1170, Voice]
type = PlaySnd
trigger1 = !Time
value = 1010,0
channel = 0

[State 1170, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 5

[State 1170, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 10
x = 6

[State 1170, PosAdd]
type = PosAdd
trigger1 = Time = 1
x = 10

[State 1170, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 24

[State 1170, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 21

[State 1170, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 8

[State 1170, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 15

[State 1170, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 9

[State 1170, Konokizu effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1175
anim = 1015
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1170, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
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
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -1.15,-5.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.15,-5.5
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
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -98
palFX.time = 41
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1170, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 41
ignoreHitPause = 1
persistent = 0

[State 1170, Flame Particles]
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

[State 1170, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1010
elem = 5
ignoreHitPause = 1

[State 1170, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1170, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1170, Nanase Kai]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(8) < 0
trigger1 = !AILevel
;command = "QCF"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel && MoveHit
trigger2 = P2Dist x >= 0
var(14) = 1180

[State 1170, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
value = var(14)

[State 1170, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;125 SHIKI: NANASE KAI
[StateDef 1180]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1180
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1180, RemoveExplod]
type = RemoveExplod
trigger1 = !Time && PrevStateNo = 1170
id = 1175

[State 1180, RemoveExplod]
type = RemoveExplod
trigger1 = !Time && PrevStateNo != 1170
id = 1015

[State 1180, EX Flash]
type = VarSet
trigger1 = !Time && PrevStateNo = 1170
var(25) = 20

[State 1180, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 6

[State 1180, PosAdd]
type = PosAdd
trigger1 = AnimElem = 13
trigger2 = !AnimTime
x = 5

[State 1180, Non-EX HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6 && PrevStateNo != 1170
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -5.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 93), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1180, EX HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6 && PrevStateNo = 1170
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -1.15, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.15, -6.5
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 93), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1180, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1180, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1180, Hikigane]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(11) < 0 && PrevStateNo = 1170
trigger1 = !AILevel
;command = "HCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010504)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010406))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel && MoveHit
trigger2 = P2Dist x >= 0
var(14) = 1190

[State 1180, PosAdd]
type = PosAdd
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
x = 10

[State 1180, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
value = var(14)

[State 1180, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;412 SHIKI: HIKIGANE
[StateDef 1190]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1190
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1190, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 36

[State 1190, Voice]
type = PlaySnd
trigger1 = !Time
value = 1190,0
channel = 0

[State 1190, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 7

[State 1190, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 192,1
channel = 8

[State 1190, Hikigane effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1175
anim = 1015
bindTime = -1
sprPriority = 3
posType = P1
pos = 18,-6
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1190, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.5
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
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -71
palFX.time = 51
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1190, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 && !MoveContact && !MoveReversed
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
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -6.5
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
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -119
palFX.time = 41
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1190, Explosion sound]
type = PlaySnd
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 1520,1
channel = 9
ignoreHitPause = 1
persistent = 0

[State 1190, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = ifElse(AnimElemTime(7) < 0, 51, 41)
ignoreHitPause = 1
persistent = 0

[State 1190, Flame Particles]
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

[State 1190, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1190, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1190, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;100 SHIKI: ONIYAKI
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
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500 || NumTarget(1305) || NumTarget(1330) || NumTarget(1831)), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, 1200)

[State 1200, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0 + 10 * (var(40) = 1)
channel = 0

[State 1200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1200, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 3

[State 1200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 4

[State 1200, PosAdd]
type = PosAdd
trigger1 = !Time
x = 16

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 14

[State 1200, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(2) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 22), (var(36) := -61)
hitSound = S3,0
numHits = 0

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ifElse(var(10) = 2, 2.5, ifElse(var(10) = 1, 1.875, 1.25))
y = ifElse(var(10) = 2, -11.25, ifElse(var(10) = 1, -8.75, -6.25))

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && vel x >= 0
x = -0.1953125

[State 1200, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.5859375

[State 1200, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 1200, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 77, ifElse(var(10) = 1, 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 77, ifElse(var(10) = 1, 119, 105)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -74
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 52
ignoreHitPause = 1
persistent = 0

[State 1200, Flame Particles]
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

[State 1200, Air Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && var(10) != 2 && !MoveContact && !MoveReversed
trigger2 = AnimElem = 3 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
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
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 54
ignoreHitPause = 1
persistent = 0

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1200, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201


;Landing
[StateDef 1201]
type = S
anim = ifElse(var(10) = 2 && PrevStateNo = 1200, 1221, 1201)
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
channel = 1

[State 1201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;100 SHIKI: ONIYAKI (EX)>=
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
var(25) = 31

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 4, -69
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
trigger1 = !Time
value = 1200,0 + 10 * (var(40) = 1)
channel = 0

[State 1230, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 3

[State 1230, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 4

[State 1230, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 5

[State 1230, PosAdd]
type = PosAdd
trigger1 = !Time
x = 16

[State 1230, PosAdd]
type = PosAdd
trigger1 = Time = 2
x = 16

[State 1230, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 14

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1230, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 2.5
y = -12.5

[State 1230, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && vel x >= 0
x = -0.1953125

[State 1230, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1230, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.5859375

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 1230, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1205
ID = 1235
name = "Oniyaki fire"
posType = P1
size.xScale = 0.55
size.yScale = 0.55
ownPal = 1
ignoreHitPause = 0

[State 1230, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -74
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 52
ignoreHitPause = 1
persistent = 0

[State 1230, Flame Particles]
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

[State 1230, Air Hit 1]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 || AnimElem = 5 || AnimElem = 9 || AnimElem = 11
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.25, -8
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = ifElse(AnimElemTime(11) >= 0, 47, ifElse(AnimElemTime(9) >= 0 && AnimElemTime(11) < 0, 44, ifElse(AnimElemTime(5) >= 0 && AnimElemTime(9) < 0, 40, 37)))
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 37
ignoreHitPause = 1
persistent = 0

[State 1230, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 40
ignoreHitPause = 1
persistent = 0

[State 1230, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(9) >= 0 && AnimElemTime(11) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 44
ignoreHitPause = 1
persistent = 0

[State 1230, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(11) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 47
ignoreHitPause = 1
persistent = 0

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 1230, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;75 SHIKI: KAI
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
var(10) = ifElse((P2MoveType = H || P2Dist x > 120), 2, ifElse(P2Dist x > 110, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 4,1
channel = 0

[State 1300, Voice (Kusanagi)]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) = 1
value = 1300,10
channel = 0

[State 1300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 4

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 7

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 16

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shiki: Kai Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = !Time && var(10)
x = ifElse(var(10) = 2, 1.25, 0.9375)

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.75
y = -3.5

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = 0.328125

[State 1300, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5 && (!var(11) || var(11) > var(10))
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
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4.5,-6.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -98
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, ChangeAnimElem 2]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))
elem = 7
ignoreHitPause = 1

[State 1300, ChangeAnimElem 1]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))
elem = 6
ignoreHitPause = 1

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1300, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1300, Second Kick]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
trigger1 = !AILevel
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
trigger2 = AILevel
var(14) = 1305

[State 1300, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElem = 8
value = var(14)

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
value = 0
ctrl = 1



;75 SHIKI: KAI (SECOND KICK)
[StateDef 1305]
type = A
physics = N
moveType = A
anim = 1305
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1305, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4,2
channel = 0

[State 1305, Voice (Kusanagi)]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) = 1
value = 1305,10
channel = 0

[State 1305, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 4

[State 1305, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.328125

[State 1305, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && (!var(11) || var(11) > var(10))
ID = 1305
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 49, ifElse(var(10) = 1, 42, 35)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 49, ifElse(var(10) = 1, 42, 35)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -1.25, -10.8
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -10.8
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1305, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1305
elem = 4
ignoreHitPause = 1

[State 1305, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1305, Juggle Reset]
type = VarSet
trigger1 = MoveHit && NumTarget(1305)
trigger1 = !var(11) && var(10)
var(15) = 0

[State 1305, Juggle Flag Off]
type = VarSet
trigger1 = MoveHit && NumTarget(1305)
var(16) = ifElse(var(11), 1, var(16))
persistent = 0

[State 1305, Shiki: Kai juggle limiter]
type = VarSet
trigger1 = MoveHit && NumTarget(1305)
var(11) = var(10)
persistent = 0

[State 1305, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;75 SHIKI: KAI (EX)>=
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
var(25) = 30

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 9,-49
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4,1
channel = 0

[State 1330, Voice 1 (Kusanagi)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 1300,10
channel = 0

[State 1330, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 11 && var(40) != 1
value = 4,2
channel = 0

[State 1330, Voice 2 (Kusanagi)]
type = PlaySnd
trigger1 = AnimElem = 11 && var(40) = 1
value = 1305,10
channel = 0

[State 1330, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 3

[State 1330, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,5
channel = 4

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 5

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 4

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 7

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 16

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shiki: Kai Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = !Time
x = 3.75

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.75
y = -3.5

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = 0.328125

[State 1330, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5 && !var(11)
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
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -4.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -6.5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -98
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, ChangeAnimElem 2]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1330
elem = 7
ignoreHitPause = 1

[State 1330, ChangeAnimElem 1]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1330
elem = 6
ignoreHitPause = 1

[State 1330, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11 && !var(11)
ID = 1330
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = -1.25, -11.8
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.25, -11.8
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, ChangeAnimElem 2]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1330
elem = 12
ignoreHitPause = 1

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
moveType = I

[State 1330, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(11) && NumTarget(1330)
var(15) = 0

[State 1330, Shiki: Kai juggle limiter]
type = VarAdd
trigger1 = MoveHit && NumTarget(1330)
var(11) = 3
persistent = 0

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;R.E.D. KICK>=
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
var(10) = ifElse(P2Dist x > 195, 2, ifElse(P2Dist x > 165, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0
channel = 0

[State 1400, Jumping Sound 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 1

[State 1400, Jumping Sound 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 3

[State 1400, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5
channel = 4

[State 1400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "R.E.D. Kick Dust"
posType = P1
ownPal = 1

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger3 = AnimElem = 4
trigger3 = AnimElem = 5
x = 8

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 2

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 4.3125, ifElse(var(10) = 1, 3.90625, 3.5))
y = ifElse(var(10) = 2, -9.125, ifElse(var(10) = 1, -7.625, -6.125))

[State 1400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.625

[State 1400, Spark XY]
type = Null
trigger1 = AnimElem = 7
trigger1 = var(35) := 59 || var(36) := -102
trigger2 = AnimElem = 8
trigger2 = var(35) := 60 || var(36) := -51
trigger3 = AnimElem = 9
trigger3 = var(35) := 29 || var(36) := -21

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
ID = 1400
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -6, 10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, 10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
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

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8 && !MoveContact && !MoveReversed
ID = 1400
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10) = 1, 77, 70)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10) = 1, 77, 70)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -6, 10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, 10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
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

[State 1400, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1400) > 1
ID = 1400
keepOne = 1
excludeID = 1400
ignoreHitPause = 1

[State 1400, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1400)
trigger1 = !(Target(1400), Time)
value = ifElse(Target(1400), StateType = A, 5425, 5420)
ID = 1400
ignoreHitPause = 1

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0 && var(10) != 2
trigger2 = AnimElemTime(10) >= 0 && var(10) = 2
moveType = I

[State 1400, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401


;Landing
[StateDef 1401]
type = S
anim = ifElse(var(10) = 2 || PrevStateNo = 1430, 1421, 1401)
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
channel = 6

[State 1401, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;R.E.D. KICK (EX)>=
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
var(25) = 24

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -7,-64
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
trigger1 = AnimElem = 2
value = 1430,0
channel = 0

[State 1430, Jumping Sound 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1430, Jumping Sound 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 4

[State 1430, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5
channel = 5

[State 1430, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "R.E.D. Kick Dust"
posType = P1
ownPal = 1

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger3 = AnimElem = 4
trigger3 = AnimElem = 5
x = 8

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 2

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = P2Dist x / 27
y = -11

[State 1430, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1

[State 1430, Spark XY]
type = Null
trigger1 = AnimElem = 7
trigger1 = var(35) := 59 || var(36) := -102
trigger2 = AnimElem = 8
trigger2 = var(35) := 60 || var(36) := -51
trigger3 = AnimElem = 9
trigger3 = var(35) := 29 || var(36) := -21

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
ID = 1430
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 133 < 7, 7, fvar(11) * 133)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6, 10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, 10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
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

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8 && !MoveContact && !MoveReversed
ID = 1400
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6, 10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6, 10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
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

[State 1400, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1400) > 1
ID = 1400
keepOne = 1
excludeID = 1400
ignoreHitPause = 1

[State 1400, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1400)
trigger1 = !(Target(1400), Time)
value = ifElse(Target(1400), StateType = A, 5425, 5420)
ID = 1400
ignoreHitPause = 1

[State 1430, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401



;212 SHIKI: KOTOTSUKI YOU
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1500, Voice]
type = PlaySnd
trigger1 = !Time
value = 1500,0 + 10 * (var(40) = 1)
channel = 0

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 7.5

[State 1500, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 4 || AnimElem = 7)
value = 100, ifElse((AnimElem = 4), 0, 1)

[State 1500, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 110,0
channel = 1

[State 1500, Dust Helper]
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

[State 1500, ChangeState]
type = ChangeState
trigger1 = P2Dist x <= 64 && AnimElemTime(2) >= 0
value = 1510

[State 1500, End]
type = ChangeState
trigger1 = !var(10) && Time > 29
trigger2 = var(10) = 1 && Time > 42
trigger3 = var(10) = 2 && Time > 55
value = 1501


;End
[StateDef 1501]
type = S
physics = N
moveType = I
velSet = 0,0
anim = 1501
ctrl = 0
sprPriority = 1

[State 1501, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 1501, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1501, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Grab attempt
[StateDef 1510]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1510
ctrl = 0
sprPriority = 1

[State 1510, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 192,1
channel = 3

[State 1510, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 22

[State 1510, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 11

[State 1510, Kototsuki You Attempt effect]
type = Explod
trigger1 = AnimElem = 2
ID = 1515
anim = 1515
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1510, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
ID = 1510
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
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
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -61
palFX.time = 12
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1510, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 12
ignoreHitPause = 1
persistent = 0

[State 1510, Flame Particles]
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

[State 1510, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1510) > 1
ID = 1510
keepOne = 1
excludeID = 1510
ignoreHitPause = 1

[State 1510, Success]
type = ChangeState
trigger1 = MoveHit && NumTarget(1510)
value = 1520

[State 1510, Blocked]
type = ChangeState
trigger1 = MoveGuarded
value = 1511

[State 1510, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1510, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Blocked
[StateDef 1511]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1511
ctrl = 0
sprPriority = 1

[State 1511, EX Flash]
type = VarSet
trigger1 = !Time && PrevStateNo = 1550
var(25) = 18

[State 1511, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 18

[State 1511, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 21

[State 1511, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 3

[State 1511, Kototsuki You Success effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1516
anim = 1516
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1511, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && PrevStateNo = 1510
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -100
palFX.time = 18
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1551, EX HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && PrevStateNo = 1550
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -100
palFX.time = 18
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1511, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 18
ignoreHitPause = 1
persistent = 0

[State 1511, Flame Particles]
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

[State 1511, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1511
elem = 5
ignoreHitPause = 1

[State 1511, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1511, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1520]
type = S
physics = N
moveType = A
anim = 1520
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 20

[State 1520, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 31

[State 1520, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget(1510)
value = 0
ctrl = 1

[State 1520, Width]
type = Width
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(6) < 0
edge = 64,0

[State 1520, TargetState]
type = TargetState
trigger1 = !Time && NumTarget(1510)
value = 1530

[State 1520, TargetBind 1]
type = TargetBind
trigger1 = NumTarget(1510)
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = 43,0

[State 1520, TargetBind 2]
type = TargetBind
trigger1 = NumTarget(1510)
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 39,-108

[State 1520, TargetBind 3]
type = TargetBind
trigger1 = NumTarget(1510)
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 32,-128

[State 1520, TargetBind 4]
type = TargetBind
trigger1 = NumTarget(1510)
trigger1 = AnimElemTime(6) = 0
pos = 43,-24

[State 1520, Damage]
type = TargetLifeAdd
trigger1 = NumTarget(1510) && AnimElem = 6
value = floor(ifElse(ifElse(var(10) = 2, 119, ifElse(var(10) = 1, 112, 105)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -119, ifElse(var(10) = 1, -112, -105)) * fvar(11)))

[State 1520, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget(1510) && AnimElem = 6
value = 36

[State 1520, Power]
type = PowerAdd
trigger1 = NumTarget(1510) && AnimElem = 6
value = 72

[State 1520, HitAdd]
type = HitAdd
trigger1 = NumTarget(1510) && AnimElem = 6
value = 1

[State 1520, HitAdd]
type = VarAdd
trigger1 = NumTarget(1510) && AnimElem = 6
var(13) = 1

[State 1520, Juggle]
type = VarAdd
trigger1 = NumTarget(1510) && AnimElem = 6
var(15) = 1
ignoreHitPause = 1

[State 1520, Throw]
type = TargetState
trigger1 = NumTarget(1510) && AnimElem = 6
value = 1531

[State 1520, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 4

[State 1520, Grab sound]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = 2,800
channel = 2

[State 1520, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1520,0 + 10 * (var(40) = 1)
channel = 0

[State 1520, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElemTime(6) = 3
trigger3 = AnimElemTime(6) = 6
value = 1520,1
channel = 2

[State 1520, Kototsuki You success effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1525
anim = 1525
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1520, Kototsuki You explosion effect 1]
type = Explod
trigger1 = AnimElem = 6
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 27, -126
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1520, Kototsuki You explosion effect 2]
type = Explod
trigger1 = AnimElemTime(6) = 3
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = 42, -110
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1520, Kototsuki You explosion effect 3]
type = Explod
trigger1 = AnimElemTime(6) = 6
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 15, -119
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1520, Flame Particle Timer Set]
type = VarSet
trigger1 = NumTarget(1510) && AnimElem = 6
var(44) = 23
ignoreHitPause = 1
persistent = 0

[State 1520, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = NumTarget(1510) && AnimElem = 6
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1520, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<212 SHIKI: KOTOTSUKI YOU (TARGET)
;Being Thrown
[StateDef 1530]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1530, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 1530, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1530

[State 1530, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 1530, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 1531]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -6.25, -5.78125
sprPriority = 0

[State 1531, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1531, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030
trigger1 = !AnimTime
value = 5050

[State 1531, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 1531, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,1
ignoreHitPause = 1

[State 1531, PalFX]
type = PalFX
trigger1 = !Time
time = 23
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 1531, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5126953125

[State 1531, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1531, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1531, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;212 SHIKI: KOTOTSUKI YOU (EX)
;Startup
[StateDef 1550]
type = S
physics = N
moveType = A
anim = 1550
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1550, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1550, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 18

[State 1550, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = -2,-70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1550, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1550, Voice]
type = PlaySnd
trigger1 = !Time
value = 1500,0 + 10 * (var(40) = 1)
channel = 0

[State 1550, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 110,0
channel = 3

[State 1550, Dust Helper]
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

[State 1550, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 4

[State 1550, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 22

[State 1550, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 11

[State 1550, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
x = 7.96875 * exp((-0.06453852113757117167292391568399) * (Time - 2))

[State 1550, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1550, Kototsuki You Attempt effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1555
anim = 1515
bindTime = 12
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1550, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(4) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 18), (var(36) := -68)
hitSound = S3,0
numHits = 0

[State 1550, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1550
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = 0.58
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -61
palFX.time = 12
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p2Facing = 1

[State 1550, Unfreeze explod]
type = ModifyExplod
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
ID = 1555
ignoreHitPause = 1
persistent = 0

[State 1550, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 12
ignoreHitPause = 1
persistent = 0

[State 1550, Flame Particles]
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

[State 1550, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1550) > 1
ID = 1550
keepOne = 1
excludeID = 1550
ignoreHitPause = 1

[State 1550, Success]
type = ChangeState
trigger1 = MoveHit && NumTarget(1550)
value = 1560

[State 1550, Blocked]
type = ChangeState
trigger1 = MoveGuarded
value = 1511

[State 1550, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1550, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1560]
type = S
physics = N
moveType = A
anim = 1520
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1560, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 54

[State 1560, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 20

[State 1560, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 31

[State 1560, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget(1550)
value = 0
ctrl = 1

[State 1560, Width]
type = Width
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(6) < 0
edge = 64,0

[State 1560, TargetState]
type = TargetState
trigger1 = !Time && NumTarget(1550)
value = 1530

[State 1560, TargetBind 1]
type = TargetBind
trigger1 = NumTarget(1550)
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = 43,0

[State 1560, TargetBind 2]
type = TargetBind
trigger1 = NumTarget(1550)
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 39,-108

[State 1560, TargetBind 3]
type = TargetBind
trigger1 = NumTarget(1550)
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 32,-128

[State 1560, TargetBind 4]
type = TargetBind
trigger1 = NumTarget(1550)
trigger1 = AnimElemTime(6) = 0
pos = 43,-24

[State 1560, Damage]
type = TargetLifeAdd
trigger1 = NumTarget(1550) && AnimElem = 6
value = floor(ifElse(133 * fvar(11) < 7, -7, -133 * fvar(11)))

[State 1560, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget(1550) && AnimElem = 6
value = 36

[State 1560, HitAdd]
type = HitAdd
trigger1 = NumTarget(1550) && AnimElem = 6
value = 1

[State 1560, HitAdd]
type = VarAdd
trigger1 = NumTarget(1550) && AnimElem = 6
var(13) = 1

[State 1560, Juggle]
type = VarAdd
trigger1 = NumTarget(1550) && AnimElem = 6
var(15) = 1
ignoreHitPause = 1

[State 1560, Throw]
type = TargetState
trigger1 = NumTarget(1550) && AnimElem = 6
value = 1531

[State 1560, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 4

[State 1560, Grab sound]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = 2,800
channel = 2

[State 1560, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1520,0 + 10 * (var(40) = 1)
channel = 0

[State 1560, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElemTime(6) = 3
trigger3 = AnimElemTime(6) = 6
trigger4 = AnimElemTime(6) = 9
trigger5 = AnimElemTime(6) = 12
trigger6 = AnimElemTime(6) = 15
value = 1520,1
channel = 2

[State 1560, Kototsuki You success effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1525
anim = 1525
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 1]
type = Explod
trigger1 = AnimElem = 6
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 27, -126
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 2]
type = Explod
trigger1 = AnimElemTime(6) = 3
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = 52, -100
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 3]
type = Explod
trigger1 = AnimElemTime(6) = 6
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 5, -109
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 4]
type = Explod
trigger1 = AnimElemTime(6) = 9
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 45, -149
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 5]
type = Explod
trigger1 = AnimElemTime(6) = 12
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = -12, -140
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Kototsuki You explosion effect 6]
type = Explod
trigger1 = AnimElemTime(6) = 15
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 65, -109
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1560, Flame Particle Timer Set]
type = VarSet
trigger1 = NumTarget(1550) && AnimElem = 6
var(44) = 23
ignoreHitPause = 1
persistent = 0

[State 1560, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = NumTarget(1550) && AnimElem = 6
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1560, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;212 SHIKI: KOTOTSUKI YOU (EX, KUSANAGI)
;Startup
[StateDef 1570]
type = S
physics = N
moveType = A
anim = 1570
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1570, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1570, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1570, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 32

[State 1570, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 17,-74
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1570, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1570, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1520,10
channel = 0

[State 1570, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 192,1
channel = 3

[State 1570, PosAdd]
type = PosAdd
trigger1 = !Time
x = 18

[State 1570, Kototsuki You Success effect]
type = Explod
trigger1 = AnimElem = 2
ID = 1575
anim = 1065
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1570, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && !var(37)
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
p1StateNo = 1580

[State 1570, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1570, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1580]
type = S
physics = N
moveType = A
anim = 1580
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1580, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 58

[State 1580, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1575

[State 1580, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1580, Width]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 64,0

[State 1580, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1080

[State 1580, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 43,0

[State 1580, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 39,-108

[State 1580, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 32,-128

[State 1580, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) = 0
pos = 43,-24

[State 1580, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 4
value = floor(ifElse(161 * fvar(11) < 7, -7, -161 * fvar(11)))

[State 1580, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 4
value = 36

[State 1580, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 4
value = 1

[State 1580, HitAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(13) = 1

[State 1580, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(15) = 1
ignoreHitPause = 1

[State 1580, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 4
value = 1081

[State 1580, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1520,10
channel = 0

[State 1580, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElemTime(4) = 3
trigger3 = AnimElemTime(4) = 4
trigger4 = AnimElemTime(4) = 9
trigger5 = AnimElemTime(4) = 12
trigger6 = AnimElemTime(4) = 15
value = 1520,1
channel = 2

[State 1580, Kototsuki You success effect]
type = Explod
trigger1 = !Time
ID = 1585
anim = 1075
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 1]
type = Explod
trigger1 = AnimElem = 4
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 27, -126
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 2]
type = Explod
trigger1 = AnimElemTime(4) = 3
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = 52, -100
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 3]
type = Explod
trigger1 = AnimElemTime(4) = 6
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 5, -109
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 4]
type = Explod
trigger1 = AnimElemTime(4) = 9
anim = 1535
bindTime = -1
sprPriority = 3
posType = P1
pos = 45, -149
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 5]
type = Explod
trigger1 = AnimElemTime(4) = 12
anim = 1535
bindTime = -1
sprPriority = 4
posType = P1
pos = -12, -140
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Kototsuki You explosion effect 6]
type = Explod
trigger1 = AnimElemTime(4) = 15
anim = 1535
bindTime = -1
sprPriority = 5
posType = P1
pos = 65, -109
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1580, Flame Particle Timer Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 4
var(44) = 23
ignoreHitPause = 1
persistent = 0

[State 1580, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 4
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1580, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;108 SHIKI: YAMI BARAI>=
[StateDef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1600, ifElse(var(10) = 1, 1610, 1620))

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,0 + 10 * (var(40) = 1)
channel = 0

[State 1600, Yami Barai sound effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,1
channel = 1

[State 1600, Yami Barai Startup effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1603
anim = 1603
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1600, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1605
ID = 1605
name = "Yami Barai Projectile"
posType = P1
pos = 52,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1600, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1600, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;108 SHIKI: YAMI BARAI (EX)>=
[StateDef 1630]
type = S
physics = N
moveType = A
anim = 1630
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 25

[State 1630, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 4, -69
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,0 + 10 * (var(40) = 1)
channel = 0

[State 1630, Yami Barai sound effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,1
channel = 3

[State 1630, Yami Barai Startup effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1633
anim = 1633
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1630, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 1605
ID = 1605
name = "Yami Barai Projectile"
posType = P1
pos = 52,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1630, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1630, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;101 SHIKI: OBORO GURUMA
[StateDef 1700]
type = S
physics = N
moveType = A
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1700, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1700, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500 || NumTarget(1305) || NumTarget(1330) || NumTarget(1831)), 2, ifElse(Random < 500, 1, 0))

[State 1700, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1700, ifElse(var(10) = 1, 1710, 1720))

[State 1700, Voice 1]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 5 && var(10)
value = 1700,0
channel = 0

[State 1700, Voice 2]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 12 && var(10) = 2
value = 1700,1
channel = 0

[State 1700, Final Voice]
type = PlaySnd
trigger1 = AnimElem = 5 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 20 && var(10) = 2
value = 1700,2 + 8 * (var(40) = 1)
channel = 0

[State 1700, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 1

[State 1700, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 3

[State 1700, Woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 11 && var(10)
value = 1,5
channel = 4

[State 1700, Woosh sound 3]
type = PlaySnd
trigger1 = AnimElem = 19 && var(10) = 2
value = 1,5
channel = 5

[State 1700, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1700, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oboro Guruma Dust"
posType = P1
ownPal = 1

[State 1700, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
x = 4

[State 1700, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 5
y = -5

[State 1700, VelAdd (Medium/Heavy, Middle)]
type = VelAdd
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(14) < 0 && var(10) = 1
trigger2 = AnimElemTime(9) >= 0 && AnimElemTime(14) < 0 && var(10) = 2
y = 0.09765625

[State 1700, VelAdd (Heavy, Initial/Late-Mid)]
type = VelAdd
trigger1 = AnimElemTime(5) > 0 && AnimElemTime(9) < 0 && var(10) = 2
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(23) < 0 && var(10) = 2
y = 0.1953125

[State 1700, VelAdd (Medium, Initial)]
type = VelAdd
trigger1 = AnimElemTime(5) > 0 && AnimElemTime(9) < 0 && var(10) = 1
y = 0.390625

[State 1700, VelAdd (Final)]
type = VelAdd
trigger1 = AnimElemTime(5) > 0 && !var(10)
trigger2 = AnimElemTime(14) >= 0 && var(10) = 1
trigger3 = AnimElemTime(23) >= 0 && var(10) = 2
y = 0.5859375

[State 1700, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 21, ifElse(var(10) = 1, 35, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 21, ifElse(var(10) = 1, 35, 98)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = ifElse(var(10), -2.5, -7.5), ifElse(var(10), -8.75, -5)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(10), -2.5, -7.5), ifElse(var(10), -8.75, -5)
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = ifElse(var(10), 0.537109375, 0.5126953125)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1700, ChangeAnimElem 1]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10) = 0, 1700, ifElse(var(10) = 1, 1710, 1720))
elem = 6
ignoreHitPause = 1

[State 1700, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 12
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 35, 77) < 7, 7, fvar(11) * ifElse(var(10) = 2, 35, 77))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5, ifElse(var(10) = 1, -6.5625, -5)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, ifElse(var(10) = 1, -6.5625, -5)
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
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1700, ChangeAnimElem 2]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime && var(10)
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = ifElse(var(10) = 1, 1710, 1720)
elem = 13
ignoreHitPause = 1

[State 1700, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 20
ID = 1700
attr = A, SA
hitFlag = MAF
guardFlag = MA
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
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -6.25, 3.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.25, 3.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1700, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1700) > 1
ID = 1700
keepOne = 1
excludeID = 1700
ignoreHitPause = 1

[State 1700, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1700)
trigger1 = !(Target(1700), Time)
value = ifElse(Target(1700), StateType = A, 5425, 5420)
ID = 1700
ignoreHitPause = 1

[State 1700, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0 && !var(10)
trigger2 = AnimElemTime(14) >= 0 && var(10) = 1
trigger3 = AnimElemTime(21) >= 0 && var(10) = 2
moveType = I

[State 1700, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1701


;Landing
[StateDef 1701]
type = S
anim = 1701
physics = N
moveType = I
velSet = 0,0

[State 1701, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1701, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1701, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1701, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;101 SHIKI: OBORO GURUMA (EX)
[StateDef 1730]
type = S
physics = N
moveType = A
anim = 1730
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1730, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1730, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1730, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 43

[State 1730, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = -7,-64
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1730, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1730, Voice 1]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 5
value = 1700,0
channel = 0

[State 1730, Voice 2]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 12
value = 1700,1
channel = 0

[State 1730, Final Voice]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1700,2 + 8 * (var(40) = 1)
channel = 0

[State 1730, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1730, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 4

[State 1730, Woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,5
channel = 5

[State 1730, Woosh sound 3]
type = PlaySnd
trigger1 = AnimElem = 19
value = 1,5
channel = 6

[State 1730, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1730, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oboro Guruma Dust"
posType = P1
ownPal = 1

[State 1730, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
x = 4

[State 1730, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 8
y = -5

[State 1730, VelAdd (Middle)]
type = VelAdd
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(14) < 0
y = 0.09765625

[State 1730, VelAdd (Initial/Late-Mid)]
type = VelAdd
trigger1 = AnimElemTime(5) > 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(23) < 0
y = 0.1953125

[State 1730, VelAdd (Final)]
type = VelAdd
trigger1 = AnimElemTime(23) >= 0
y = 0.5859375

[State 1730, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA
time = 1

[State 1730, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4, -8.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4, -8.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1730, ChangeAnimElem 1]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1730
elem = 6
ignoreHitPause = 1

[State 1730, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 12
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -8, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -8, -5
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
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1730, ChangeAnimElem 2]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime && var(10)
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 1730
elem = 13
ignoreHitPause = 1

[State 1730, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 20
ID = 1730
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -9.25, 3.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -9.25, 3.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1730, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1730) > 1
ID = 1730
keepOne = 1
excludeID = 1730
ignoreHitPause = 1

[State 1730, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1730)
trigger1 = !(Target(1730), Time)
value = ifElse(Target(1730), StateType = A, 5425, 5420)
ID = 1730
ignoreHitPause = 1

[State 1730, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(21) >= 0
moveType = I

[State 1730, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1701



;AOKI
[StateDef 1800]
type = S
physics = N
moveType = A
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
var(10) = ifElse(P2Dist x > 140, 2, ifElse(P2Dist x > 130, 1, 0))

[State 1800, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1800, ifElse(var(10) = 1, 1810, 1820))

[State 1800, Voice]
type = PlaySnd
trigger1 = !Time
value = 1700,10
channel = 0

[State 1800, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 1

[State 1800, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 22

[State 1800, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 11

[State 1800, Kototsuki You Attempt effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1805
anim = ifElse(var(10) = 0, 1805, ifElse(var(10) = 1, 1815, 1825))
bindTime = ifElse(var(10) = 2, 30, ifElse(var(10), 28, 26))
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1800, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 2
x = (7.3665771484375 * exp((-0.08248799393256736371165861989449) * (AnimElemTime(3))))
;gives accurate distance travelled by offsetting posadds, but looks janky
;x = (7.3665771484375 * exp((-0.08248799393256736371165861989449) * (AnimElemTime(3) + 6)))

[State 1800, VelSet]
type = VelSet
trigger1 = AnimElemTime(5) = 2
x = 0

[State 1800, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1800
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10) = 1, 35, 28)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yaccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -61
palFX.time = 28
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1800, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 28
ignoreHitPause = 1
persistent = 0

[State 1800, Flame Particles]
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

[State 1800, Success]
type = ChangeState
trigger1 = MoveContact && NumTarget(1800)
value = 1801

[State 1800, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 1801]
type = S
physics = N
moveType = A
velSet = 0,0
anim = ifElse(var(10) = 0, 1801, ifElse(var(10) = 1, 1811, 1821))
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1801, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1805

[State 1801, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 192,1
channel = 3

[State 1801, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 40,0
channel = 4

[State 1801, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 19

[State 1801, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 16

[State 1801, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1801, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 4

[State 1801, Batsu Yomi effect]
type = Explod
trigger1 = AnimElem = 6
ID = 1125
anim = 1125
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1801, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 1801, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Aoki Dust"
posType = P1
ownPal = 1

[State 1801, VelSet]
type = VelSet
trigger1 = AnimElemTime(6) >= 0
x = ifElse(vel y > 0, 0, (4.6041107177734375 * exp((-0.08248934360989325722859930675326) * (Time - 8))))

[State 1801, VelSet]
type = VelSet
trigger1 = AnimElem = 6
y = ifElse(var(10) = 0, -4, ifElse(var(10) = 1, -5, -6))

[State 1801, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 0.42578125

[State 1801, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yaccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -52
palFX.time = 28
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1801, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(6) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 28
ignoreHitPause = 1
persistent = 0

[State 1801, Flame Particles]
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

[State 1801, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 18 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -1.25, -10.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -10.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1801, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(6) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 52
ignoreHitPause = 1
persistent = 0

[State 1801, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1801, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1121



;AOKI (EX)
[StateDef 1830]
type = S
physics = N
moveType = A
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1830, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1830, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1830, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1830, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = -2,-70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1830, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1830, Voice]
type = PlaySnd
trigger1 = !Time
value = 1700,10
channel = 0

[State 1830, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,1
channel = 3

[State 1830, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 22

[State 1830, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 11

[State 1830, Kototsuki You Attempt effect]
type = Explod
trigger1 = AnimElem = 3
ID = 1835
anim = 1805
bindTime = 26
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1830, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 2
x = (7.3665771484375 * exp((-0.08248799393256736371165861989449) * (AnimElemTime(3) - 5)))

[State 1830, VelSet]
type = VelSet
trigger1 = AnimElemTime(5) = 2
x = 0

[State 1830, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
ID = 1830
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
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -61
palFX.time = 28
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1830, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = 28
ignoreHitPause = 1
persistent = 0

[State 1830, Flame Particles]
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

[State 1830, Success]
type = ChangeState
trigger1 = MoveContact && NumTarget(1830)
value = 1831

[State 1830, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1830, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 1831]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1831
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1831, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1835

[State 1831, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 23

[State 1831, Flame sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 192,1
channel = 4

[State 1831, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 5

[State 1831, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 19

[State 1831, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 16

[State 1831, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 10

[State 1831, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 4

[State 1831, Batsu Yomi effect]
type = Explod
trigger1 = AnimElem = 6
ID = 1125
anim = 1125
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1831, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 1831, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Aoki Dust"
posType = P1
ownPal = 1

[State 1831, VelSet]
type = VelSet
trigger1 = AnimElemTime(6) >= 0
x = ifElse(vel y > 0, 0, (4.6041107177734375 * exp((-0.08248934360989325722859930675326) * (Time - 8))))

[State 1831, VelSet]
type = VelSet
trigger1 = AnimElem = 6
y = -7

[State 1831, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 0.42578125

[State 1831, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -52
palFX.time = 28
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1831, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(6) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 28
ignoreHitPause = 1
persistent = 0

[State 1831, Flame Particles]
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

[State 1831, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -0.625, -11.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.625, -11.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 56
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1831, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 56
ignoreHitPause = 1
persistent = 0

[State 1831, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7
ID = 1831
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -0.625, -11.125
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.625, -11.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 60
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1831, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(12) && NumTarget(1831)
var(15) = 0

[State 1831, VarAdd]
type = VarAdd
trigger1 = MoveHit && NumTarget(1831)
var(12) = 1
persistent = 0

[State 1831, Juggle Flag]
type = VarSet
trigger1 = var(12) = 2
var(16) = 1

[State 1831, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(7) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 60
ignoreHitPause = 1
persistent = 0

[State 1831, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1831, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1121



;PUNCH ZERO COUNTER>=
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
value = 1200,0 + 10 * (var(40) = 1)
channel = 0

[State 2900, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 2900, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,1
channel = 3

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 4

[State 2900, PosAdd]
type = PosAdd
trigger1 = !Time
x = 16

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 14

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
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
trigger1 = AnimElem = 4
x = 1.875
y = -8.75

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && vel x >= 0
x = -0.1953125

[State 2900, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.5859375

[State 2900, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 2900, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 12, 16
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
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -74
palFX.time = 37
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 37
ignoreHitPause = 1
persistent = 0

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

[State 2900, Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 16
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 37
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 37
ignoreHitPause = 1
persistent = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 2901


;Landing
[StateDef 2901]
type = S
anim = 47
physics = N
moveType = I
velSet = 0,0

[State 2901, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 2901, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 2901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;KICK ZERO COUNTER>=
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
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 2, 3) + 10 * (var(40) = 1)
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
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2910
elem = 5
ignoreHitPause = 1

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;KICK ZERO COUNTER (KUSANAGI)>=
[StateDef 2911]
type = S
physics = N
moveType = A
anim = 2911
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2911, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2911, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
value = 4, ifElse(Random < 500, 2, 3) + 10 * (var(40) = 1)
channel = 0

[State 2911, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2911, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5
channel = 3

[State 2911, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 36

[State 2911, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 28

[State 2911, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
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
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2911, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2911
elem = 4
ignoreHitPause = 1

[State 2911, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
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
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2911, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(10) >= 0
moveType = I

[State 2911, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
