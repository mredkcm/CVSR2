; _________________________________________
;| King by Jmorphman                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<ILLUSION DANCE>=
[StateDef 3000]
type = S
physics = N
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(PrevStateNo = 1201 || PrevStateNo = 1231, 0, 2)

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3000, ifElse(var(10) = 1, 3001, 3002))

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(17) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16, -76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, Handstand sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,1
channel = 1

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = -16

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = -17

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = -7

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = -8

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -5

[State 3000, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 3000, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 4

[State 3000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 11
stateType = A
physics = N

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 8100
ID = 8100
name = "Illusion Dance Dust"
posType = P1
ownPal = 1

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 9
y = ifElse(var(10) = 2, -6.5, ifElse(var(10), -5.75, -5))

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) > 0
y = 0.46875

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 11
ID = 3000
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3000) > 1
ID = 3000
keepOne = 1
excludeID = 3000
ignoreHitPause = 1

[State 3000, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3000)
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3000, ChangeState]
type = ChangeState
trigger1 = NumTarget(3000)
trigger1 = MoveHit && Target, Alive
value = 3010

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3005


;Landing (Missed)
[StateDef 3005]
type = S
anim = 3005
physics = N
moveType = I
velSet = 0,0

[State 3005, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3005, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3005, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3005, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3010]
type = S
anim = 3010
physics = N
moveType = A
velSet = 0,0

[State 3010, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3010, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 69
value = 52,0

[State 3010, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 69
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3010, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(72) < 0
pos = 64,0

[State 3010, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(72) < 0
edge = 80,0

[State 3010, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 46
value = 730,1
channel = 0

[State 3010, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 9 || AnimElem = 16 || AnimElem = 23 || AnimElem = 30
trigger2 = AnimElem = 37 || AnimElem = 46 || AnimElem = 54 || AnimElem = 64
value = 1,5

[State 3010, Spark XY]
type = Null
trigger1 = AnimElem = 7
trigger1 = var(35) := 50 || var(36) := -43
trigger2 = AnimElem = 10
trigger2 = var(35) := 44 || var(36) := -92
trigger3 = AnimElem = 17 || AnimElem = 38
trigger3 = var(35) := 70 || var(36) := -93
trigger4 = AnimElem = 25
trigger4 = var(35) := 72 || var(36) := -58
trigger5 = AnimElem = 31
trigger5 = var(35) := 79 || var(36) := -109
trigger6 = AnimElem = 48
trigger6 = var(35) := 67 || var(36) := -93
trigger7 = AnimElem = 55
trigger7 = var(35) := 66 || var(36) := -104
trigger8 = AnimElem = 65
trigger8 = var(35) := 48 || var(36) := -83

[State 3010, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7 || AnimElem = 25 || AnimElem = 65
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3010, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10 || AnimElem = 17 || AnimElem = 31 || AnimElem = 38 || AnimElem = 48 || AnimElem = 55
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3010, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 72
value = 4,2
channel = 0

[State 3010, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 81
value = 4,4
channel = 0

[State 3010, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 72
value = 40,0
channel = 1

[State 3010, Tornado Kick Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 75
trigger2 = AnimElem = 82
value = 1200,1
channel = 3

[State 3010, Tornado Kick effect 1]
type = Explod
trigger1 = AnimElem = 75
ID = 3015
anim = 1305
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3010, Tornado Kick effect 2]
type = Explod
trigger1 = AnimElem = 82
ID = 3016
anim = 1306
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3010, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 72
stateType = A
physics = N

[State 3010, Dust Helper]
type = Helper
trigger1 = AnimElem = 72
helperType = Normal
stateNo = 8100
ID = 8100
name = "Illusion Dance Finish Dust"
posType = P1
ownPal = 1

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 72
x = 4.375
y = -5.625

[State 3010, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(72) > 0
x = -0.01373291016
y = 0.390625

[State 3010, Final Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 75
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
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
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3010, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= 4
trigger1 = AnimElemTime(75) >= 0 && AnimElemTime(76) <= 0
value = 3010
elem = 76
ignoreHitPause = 1

[State 3010, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3015) && AnimElemTime(76) >= 0
ID = 3015
ignoreHitPause = 1

[State 3010, Final Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 82
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
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
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.439453125
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
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3010, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= 10
trigger1 = AnimElemTime(82) >= 0 && AnimElemTime(83) <= 0
value = 3010
elem = 83
ignoreHitPause = 1

[State 3010, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3016) && AnimElemTime(83) >= 0
ID = 3016
ignoreHitPause = 1

[State 3010, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3011


;Success, landing
[StateDef 3011]
type = S
anim = 3011
physics = N
moveType = I
velSet = 0,0

[State 3011, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3011, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3011, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3011, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3015]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3015, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3015, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3015, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5002

[State 3015, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3015, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3016


;Sliding
[StateDef 3016]
type = S
movetype = H
physics = S

[State 3016, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5007

[State 3016, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3016, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;====<MAX ILLUSION DANCE>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(18) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16, -76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, Handstand sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,1
channel = 1

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = -16

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = -17

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = -7

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = -8

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -5

[State 3050, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 3050, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 4

[State 3050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 11
stateType = A
physics = N

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 8100
ID = 8100
name = "MAX Illusion Dance Dust"
posType = P1
ownPal = 1

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 9
y = -6.5

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) > 0
y = 0.46875

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 11
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3050) > 1
ID = 3050
keepOne = 1
excludeID = 3050
ignoreHitPause = 1

[State 3050, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3050)
value = 3015
ID = 3050
ignoreHitPause = 1
persistent = 0

[State 3050, ChangeState]
type = ChangeState
trigger1 = NumTarget(3050)
trigger1 = MoveHit && Target, Alive
value = 3060

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3005


;Success
[StateDef 3060]
type = S
anim = 3060
physics = N
moveType = A
velSet = 0,0

[State 3060, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3060, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 99
trigger3 = AnimElem = 108
value = 52,0

[State 3060, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 99
trigger3 = AnimElem = 108
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3060, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(89) < 0
pos = 64,0

[State 3060, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(111) < 0
edge = 80,0

[State 3060, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 81
value = 730,1
channel = 0

[State 3060, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 9 || AnimElem = 16 || AnimElem = 23 || AnimElem = 30
trigger2 = AnimElem = 37 || AnimElem = 46 || AnimElem = 54 || AnimElem = 63 || AnimElem = 66
trigger3 = AnimElem = 73 || AnimElem = 81 || AnimElem = 89 || AnimElem = 93 || AnimElem = 103
value = 1,5

[State 3060, Spark XY]
type = Null
trigger1 = AnimElem = 7 || AnimElem = 64
trigger1 = var(35) := 50 || var(36) := -43
trigger2 = AnimElem = 10 || AnimElem = 67
trigger2 = var(35) := 44 || var(36) := -92
trigger3 = AnimElem = 17 || AnimElem = 38
trigger3 = var(35) := 70 || var(36) := -93
trigger4 = AnimElem = 25
trigger4 = var(35) := 72 || var(36) := -58
trigger5 = AnimElem = 31 || AnimElem = 74
trigger5 = var(35) := 79 || var(36) := -109
trigger6 = AnimElem = 48 || AnimElem = 83
trigger6 = var(35) := 67 || var(36) := -93
trigger7 = AnimElem = 55
trigger7 = var(35) := 66 || var(36) := -104
trigger8 = AnimElem = 91
trigger8 = var(35) := 27 || var(36) := -75
trigger9 = AnimElem = 95
trigger9 = var(35) := 54 || var(36) := -77
trigger10 = AnimElem = 104
trigger10 = var(35) := 48 || var(36) := -83

[State 3060, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7 || AnimElem = 25 || AnimElem = 64 || AnimElem = 91 || AnimElem = 104
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 89
y = -5.375

[State 3060, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(89) > 0 && AnimElemTime(99) < 0
y = 0.537109375

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 99
y = 0

[State 3060, PosSet]
type = PosSet
trigger1 = AnimElem = 99
y = 0

[State 3060, HitDef: High]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 10 || AnimElem = 17 || AnimElem = 31 || AnimElem = 38 || AnimElem = 48 || AnimElem = 55
trigger2 = AnimElem = 67 || AnimElem = 74 || AnimElem = 83 || AnimElem = 95
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3060, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 111
value = 4,2
channel = 0

[State 3060, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 120
value = 4,4
channel = 0

[State 3060, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 111
value = 40,0
channel = 1

[State 3060, Tornado Kick Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 114
trigger2 = AnimElem = 121
value = 1200,1
channel = 3

[State 3060, Tornado Kick effect 1]
type = Explod
trigger1 = AnimElem = 114
ID = 3065
anim = 1305
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3060, Tornado Kick effect 2]
type = Explod
trigger1 = AnimElem = 121
ID = 3066
anim = 1306
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3060, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 111
stateType = A
physics = N

[State 3060, Dust Helper]
type = Helper
trigger1 = AnimElem = 111
helperType = Normal
stateNo = 8100
ID = 8100
name = "MAX Illusion Dance Finish Dust"
posType = P1
ownPal = 1

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 111
x = 4.375
y = -5.625

[State 3060, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(111) > 0
x = -0.01373291016
y = 0.390625

[State 3060, Final Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 114
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 4, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
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
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3060, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= 4
trigger1 = AnimElemTime(114) >= 0 && AnimElemTime(115) <= 0
value = 3060
elem = 115
ignoreHitPause = 1

[State 3060, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3065) && AnimElemTime(115) >= 0
ID = 3065
ignoreHitPause = 1

[State 3060, Final Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 121
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 4, fvar(11) * 28)), 7
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
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.439453125
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
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3060, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = HitPauseTime <= 10
trigger1 = AnimElemTime(121) >= 0 && AnimElemTime(122) <= 0
value = 3060
elem = 122
ignoreHitPause = 1

[State 3060, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3066) && AnimElemTime(122) >= 0
ID = 3066
ignoreHitPause = 1

[State 3060, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3011



;====<SILENT FLASH>=
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
trigger2 = Anim = 3101
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16, -76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 3100, Trap Shot effect]
type = Explod
trigger1 = AnimElem = 4
anim = 3105
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 44,44
guard.pauseTime = 44,44
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 35
ground.slideTime = 35
guard.hitTime = 35
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3100, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3100) > 1
ID = 3100
keepOne = 1
excludeID = 3100
ignoreHitPause = 1

[State 3100, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3100)
value = 1205
ID = 3100
ignoreHitPause = 1
persistent = 0

[State 3100, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(3100)
pos = 48,0
ID = 3100
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
trigger1 = Anim = 3100 && AnimElem = 5
value = 3101
elem = 5
ignoreHitPause = 1

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
trigger1 = Anim = 3101 && !AnimTime
value = 3110

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5 && Anim = 3100
x = -7

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6 && Anim = 3100
x = -8

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7 && Anim = 3100
x = -24

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8 && Anim = 3101
x = -10

[State 3100, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3100, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Success
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 3110, Jumping Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,1
channel = 1

[State 3110, Jumping Sound 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3110,0
channel = 3

[State 3110, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Silent Flash Dust"
posType = P1
ownPal = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -11

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 3110, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,-18.16894531
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,-18.16894531
air.cornerPush.velOff = 0
yAccel = 2.46611023
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, Silent Flash effect]
type = Explod
trigger1 = AnimElem = 6
anim = 3115
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3110, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 6
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,-10.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,-10.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 3110, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111


;Landing
[StateDef 3111]
type = S
anim = 47
physics = N
moveType = I
velSet = 0,0

[State 3111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SILENT FLASH>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3150, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
trigger2 = AnimElemTime(9) >= 0 && AnimElemTime(11) < 0
trigger3 = AnimElemTime(17) >= 0 && AnimElemTime(19) < 0
trigger4 = AnimElemTime(25) >= 0 && AnimElemTime(27) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16, -76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 310, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 12
trigger3 = AnimElem = 20
trigger4 = AnimElem = 28
value = 1200,1

[State 3150, Trap Shot effect (long)]
type = Explod
trigger1 = AnimElem = 4
anim = 3105
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Trap Shot effect (short)]
type = Explod
trigger1 = AnimElem = 12
trigger2 = AnimElem = 20
trigger3 = AnimElem = 28
anim = 1205
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
ID = 3150
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 44,44
guard.pauseTime = 44,44
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
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3100, Hits 2-4]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 12
trigger2 = AnimElem = 20
trigger3 = AnimElem = 28
ID = 3150
attr = S, HA
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
ground.hitTime = 35
ground.slideTime = 35
guard.hitTime = 35
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3150, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3150) > 1
ID = 3150
keepOne = 1
excludeID = 3150
ignoreHitPause = 1

[State 3150, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3150)
value = 1205
ID = 3150
ignoreHitPause = 1
persistent = 0

[State 3150, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(3150)
pos = 48,0
ID = 3150
ignoreHitPause = 1
persistent = 0

[State 3150, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
trigger1 = Anim = 3150 && AnimElem = 29
value = 3151
elem = 29
ignoreHitPause = 1

[State 3150, ChangeState]
type = ChangeState
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
trigger1 = Anim = 3151 && !AnimTime
value = 3160

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 29 && Anim = 3150
x = -7

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 30 && Anim = 3150
x = -8

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31 && Anim = 3150
x = -24

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 32 && Anim = 3151
x = -10

[State 3150, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 32
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3150, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 32
value = 52,0
channel = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(29) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 3160, Jumping Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,1
channel = 1

[State 3160, Jumping Sound 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3110,0
channel = 3

[State 3160, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Silent Flash Dust"
posType = P1
ownPal = 1

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -13

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.5

[State 3160, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = A, HA
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
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,-18.16894531
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,-18.16894531
air.cornerPush.velOff = 0
yAccel = 2.46611023
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, Hits 2-6]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,-7.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,-7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, Silent Flash effect]
type = Explod
trigger1 = AnimElem = 16
anim = 3115
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3160, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 16
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,-12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,-12.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
moveType = I

[State 3160, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111



;====<PHANTOM STRIKE>=
[StateDef 3200]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500 || EnemyNear, StateNo = 150 || EnemyNear, StateNo = 151), 2, ifElse(Random < 500, 1, 0))

[State 3200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3200, ifElse(var(10) = 1, 3210, 3220))

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -9, -9
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, Venom Strike sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = (AnimElem = 10 && var(10) != 2) || (AnimElem = 9 && var(10) = 2)
trigger3 = AnimElem = 17
trigger4 = AnimElemTime(25) = 2
value = 1000,1

[State 3200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 9 && var(10) = 2
stateType = A
physics = N

[State 3200, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 9 && var(10) = 2
value = 40,0
channel = 1

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 9 && var(10) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Phantom Strike Dust"
posType = P1
ownPal = 1

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 2 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 9 && var(10) = 2
y = -6.08496094

[State 3200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(8) < 0 && !var(10)
trigger2 = AnimElemTime(17) > 0 && AnimElemTime(23) < 0 && var(10) = 1
trigger3 = AnimElemTime(9) > 0 && AnimElemTime(15) < 0 && var(10) = 2
y = 0.830078125

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 8 && !var(10)
trigger2 = AnimElem = 23 && var(10) = 1
trigger3 = AnimElem = 15 && var(10) = 2
y = 0

[State 3200, PosSet]
type = PosSet
trigger1 = AnimElem = 8 && !var(10)
trigger2 = AnimElem = 23 && var(10) = 1
trigger3 = AnimElem = 15 && var(10) = 2
y = 0

[State 3200, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8 && !var(10)
trigger2 = AnimElem = 23 && var(10) = 1
trigger3 = AnimElem = 15 && var(10) = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3200, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8 && !var(10)
trigger2 = AnimElem = 23 && var(10) = 1
trigger3 = AnimElem = 15 && var(10) = 2
value = 52,0
channel = 3

[State 3200, Venom Strike]
type = Helper
trigger1 = AnimElemTime(20) = 1 && var(10) != 1
trigger2 = AnimElemTime(5) = 1 && var(10) = 1
helperType = Normal
stateNo = 3205
ID = 3205
name = "Mid Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3200, Top Venom]
type = Helper
trigger1 = AnimElemTime(4) = 1 && !var(10)
trigger2 = AnimElemTime(19) = 1 && var(10) = 1
trigger3 = AnimElemTime(11) = 1 && var(10) = 2
helperType = Normal
stateNo = 3205
ID = 3206
name = "High Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3200, Under Venom]
type = Helper
trigger1 = AnimElemTime(12) = 1 && var(10) != 2
trigger2 = AnimElemTime(4) = 1 && var(10) = 2
helperType = Normal
stateNo = 3205
ID = 3207
name = "Low Phantom Strike Projectile"
posType = P1
pos = 62,-28
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3200, Venom Strike]
type = Helper
trigger1 = AnimElemTime(27) = 1
helperType = Normal
stateNo = 3205
ID = 3208
name = "Final Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX PHANTOM STRIKE>=
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "b+c"), 2, ifElse((command = "a+c"), 1, 0))
var(10) = ifElse(((NumExplod(90000240) + NumExplod(90000250)) >= 2 || (NumExplod(90000245) + NumExplod(90000255)) >= 2), 2, ifElse(((NumExplod(90000230) + NumExplod(90000250)) >= 2 || (NumExplod(90000235) + NumExplod(90000255)) >= 2), 1, 0))

[State 3250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((Random < 500 || EnemyNear, StateNo = 150 || EnemyNear, StateNo = 151), 2, ifElse(Random < 500, 1, 0))

[State 3250, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3250, ifElse(var(10) = 1, 3260, 3270))

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3250, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -9, -9
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3250, Venom Strike sound effect]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 32
trigger2 = (AnimElem = 10 && var(10) != 2) || (AnimElem = 9 && var(10) = 2)
trigger3 = AnimElem = 17 || AnimElem = 47
trigger4 = AnimElem = 25 || AnimElemTime(55) = 2
trigger5 = (AnimElem = 40 && var(10) != 2) || (AnimElem = 39 && var(10) = 2)
value = 1000,1

[State 3250, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = (AnimElem = 2 || AnimElem = 32) && !var(10)
trigger2 = (AnimElem = 17 || AnimElem = 47) && var(10) = 1
trigger3 = (AnimElem = 9 || AnimElem = 39) && var(10) = 2
stateType = A
physics = N

[State 3250, Jumping Sound]
type = PlaySnd
trigger1 = (AnimElem = 2 || AnimElem = 32) && !var(10)
trigger2 = (AnimElem = 17 || AnimElem = 47) && var(10) = 1
trigger3 = (AnimElem = 9 || AnimElem = 39) && var(10) = 2
value = 40,0
channel = 1

[State 3250, Dust Helper]
type = Helper
trigger1 = (AnimElem = 2 || AnimElem = 32) && !var(10)
trigger2 = (AnimElem = 17 || AnimElem = 47) && var(10) = 1
trigger3 = (AnimElem = 9 || AnimElem = 39) && var(10) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Phantom Strike Dust"
posType = P1
ownPal = 1

[State 3250, VelSet]
type = VelSet
trigger1 = (AnimElem = 2 || AnimElem = 32) && !var(10)
trigger2 = (AnimElem = 17 || AnimElem = 47) && var(10) = 1
trigger3 = (AnimElem = 9 || AnimElem = 39) && var(10) = 2
y = -6.08496094

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(8) < 0 && !var(10)
trigger2 = AnimElemTime(17) > 0 && AnimElemTime(23) < 0 && var(10) = 1
trigger3 = AnimElemTime(9) > 0 && AnimElemTime(15) < 0 && var(10) = 2
trigger4 = AnimElemTime(32) > 0 && AnimElemTime(38) < 0 && !var(10)
trigger5 = AnimElemTime(47) > 0 && AnimElemTime(53) < 0 && var(10) = 1
trigger6 = AnimElemTime(39) > 0 && AnimElemTime(45) < 0 && var(10) = 2
y = 0.830078125

[State 3250, VelSet]
type = VelSet
trigger1 = (AnimElem = 8 || AnimElem = 38) && !var(10)
trigger2 = (AnimElem = 23 || AnimElem = 53) && var(10) = 1
trigger3 = (AnimElem = 15 || AnimElem = 45) && var(10) = 2
y = 0

[State 3250, PosSet]
type = PosSet
trigger1 = (AnimElem = 8 || AnimElem = 38) && !var(10)
trigger2 = (AnimElem = 23 || AnimElem = 53) && var(10) = 1
trigger3 = (AnimElem = 15 || AnimElem = 45) && var(10) = 2
y = 0

[State 3250, Landing Dust Explod]
type = Explod
trigger1 = (AnimElem = 8 || AnimElem = 38) && !var(10)
trigger2 = (AnimElem = 23 || AnimElem = 53) && var(10) = 1
trigger3 = (AnimElem = 15 || AnimElem = 45) && var(10) = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3250, Landing Sound]
type = PlaySnd
trigger1 = (AnimElem = 8 || AnimElem = 38) && !var(10)
trigger2 = (AnimElem = 23 || AnimElem = 53) && var(10) = 1
trigger3 = (AnimElem = 15 || AnimElem = 45) && var(10) = 2
value = 52,0
channel = 3

[State 3250, Venom Strike]
type = Helper
trigger1 = (AnimElemTime(20) = 1 || AnimElemTime(50) = 1) && var(10) != 1
trigger2 = (AnimElemTime(5) = 1 || AnimElemTime(35) = 1) && var(10) = 1
trigger3 = AnimElemTime(27) = 1
helperType = Normal
stateNo = 3205
ID = 3255
name = "Mid Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Top Venom]
type = Helper
trigger1 = (AnimElemTime(4) = 1 || AnimElemTime(34) = 1) && !var(10)
trigger2 = (AnimElemTime(19) = 1 || AnimElemTime(49) = 1) && var(10) = 1
trigger3 = (AnimElemTime(11) = 1 || AnimElemTime(41) = 1) && var(10) = 2
helperType = Normal
stateNo = 3205
ID = 3256
name = "High Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Under Venom]
type = Helper
trigger1 = (AnimElemTime(12) = 1 || AnimElemTime(42) = 1) && var(10) != 2
trigger2 = (AnimElemTime(4) = 1 || AnimElemTime(34) = 1) && var(10) = 2
helperType = Normal
stateNo = 3205
ID = 3257
name = "Low Phantom Strike Projectile"
posType = P1
pos = 62,-28
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Final Venom Strike]
type = Helper
trigger1 = AnimElemTime(57) = 1
helperType = Normal
stateNo = 3205
ID = 3258
name = "Final Phantom Strike Projectile"
posType = P1
pos = 62,-66
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SECRET MIRAGE>=
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3300, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 16, -76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 7 || AnimElem = 11
trigger2 = AnimElem = 17 || AnimElem = 20 || AnimElem = 23
trigger3 = AnimElem = 31 || AnimElem = 35 || AnimElem = 39
trigger4 = AnimElem = 47 || AnimElem = 51 || AnimElem = 56
trigger5 = AnimElem = 61 || AnimElem = 66 || AnimElem = 70
trigger6 = AnimElem = 77 || AnimElem = 80 || AnimElem = 83 || AnimElem = 86
value = 1,4

[State 3300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 92
value = 1,5

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 92
value = 4,3
channel = 0

[State 3300, Secret Mirage effect (Mid, left leg)]
type = Explod
trigger1 = AnimElem = 4
anim = 3305
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (High, left leg)]
type = Explod
trigger1 = AnimElem = 8
anim = 3306
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Low, left leg)]
type = Explod
trigger1 = AnimElem = 12
anim = 3307
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Mid, right leg)]
type = Explod
trigger1 = AnimElem = 18
anim = 3315
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (High, right leg)]
type = Explod
trigger1 = AnimElem = 21
trigger2 = AnimElem = 57
anim = 3316
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Low, right leg)]
type = Explod
trigger1 = AnimElem = 24
anim = 3317
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Fast, mid, left leg)]
type = Explod
trigger1 = AnimElem = 32
trigger2 = AnimElem = 67
anim = 3325
bindTime = -1
sprPriority = 3
posType = p1
pos = 0 + 15 * (AnimElem = 67), 0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Fast, high, left leg)]
type = Explod
trigger1 = AnimElem = 36
trigger2 = AnimElem = 71
anim = 3326
bindTime = -1
sprPriority = 3
posType = p1
pos = 0 + 15 * (AnimElem = 71), 0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Fast, low, left leg)]
type = Explod
trigger1 = AnimElem = 40
trigger2 = AnimElem = 62
anim = 3327
bindTime = -1
sprPriority = 3
posType = p1
pos = 0 + 15 * (AnimElem = 62), 0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Reverse roundhouse, right leg, upper layer)]
type = Explod
trigger1 = AnimElem = 47
anim = 3335
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Reverse roundhouse, right leg, lower layer)]
type = Explod
trigger1 = AnimElem = 47
anim = 13335
bindTime = -1
sprPriority = 0
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Fast, mid, right leg)]
type = Explod
trigger1 = AnimElem = 52
anim = 3336
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

;[State 3300, Secret Mirage effect (Roundhouse, right leg)]
;type = Explod
;trigger1 = AnimElem = 57
;anim = 3337
;bindTime = -1
;sprPriority = 3
;posType = p1
;scale = 0.5,0.5
;ownPal = 1
;removeOnGetHit = 1
;ignoreHitPause = 0

[State 3300, Secret Mirage effect (Rapid low, right leg)]
type = Explod
trigger1 = AnimElem = 77
anim = 3355
bindTime = -1
sprPriority = 3
posType = p1
pos = 15,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Rapid mid, right leg)]
type = Explod
trigger1 = AnimElem = 80
anim = 3356
bindTime = -1
sprPriority = 3
posType = p1
pos = 15,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Rapid high, right leg)]
type = Explod
trigger1 = AnimElem = 83
anim = 3357
bindTime = -1
sprPriority = 3
posType = p1
pos = 15,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage effect (Rapid low 2, right leg)]
type = Explod
trigger1 = AnimElem = 86
anim = 3358
bindTime = -1
sprPriority = 3
posType = p1
pos = 15,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Secret Mirage FX (Finisher)]
type = Explod
trigger1 = AnimElem = 94
anim = 3365
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 93
x = 15

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 94
x = 19

[State 3300, Spark XY (opponent standing, normal height)]
type = Null
trigger1 = AnimElem = 4 || AnimElem = 18 || AnimElem = 32 || AnimElem = 52 || AnimElem = 67 || AnimElem = 80
trigger1 = var(35) := 190 || var(36) := -65
trigger2 = AnimElem = 8 || AnimElem = 21 || AnimElem = 36 || AnimElem = 47 || AnimElem = 57 || AnimElem = 71 || AnimElem = 83
trigger2 = var(35) := 190 || var(36) := -105
trigger3 = AnimElem = 12 || AnimElem = 24 || AnimElem = 40 || AnimElem = 62 || AnimElem = 77 || AnimElem = 86
trigger3 = var(35) := 190 || var(36) := -25

[State 3300, Spark XY (opponent standing, short)]
type = Null
triggerAll = EnemyNear, const(size.head.pos.y) >= -40
trigger1 = AnimElem = 4 || AnimElem = 18 || AnimElem = 32 || AnimElem = 52 || AnimElem = 67 || AnimElem = 80
trigger1 = var(35) := 190 || var(36) := -45
trigger2 = AnimElem = 8 || AnimElem = 21 || AnimElem = 36 || AnimElem = 47 || AnimElem = 57 || AnimElem = 71 || AnimElem = 83
trigger2 = var(35) := 190 || var(36) := -85
trigger3 = AnimElem = 12 || AnimElem = 24 || AnimElem = 40 || AnimElem = 62 || AnimElem = 77 || AnimElem = 86
trigger3 = var(35) := 190 || var(36) := -5

[State 3300, Spark XY (opponent jumping)]
type = Null
triggerAll = EnemyNear, StateType = A
trigger1 = AnimElem = 4 || AnimElem = 18 || AnimElem = 32 || AnimElem = 52 || AnimElem = 67 || AnimElem = 80
trigger1 = var(35) := 190 || var(36) := ceil(EnemyNear, pos y - 40)
trigger2 = AnimElem = 8 || AnimElem = 21 || AnimElem = 36 || AnimElem = 47 || AnimElem = 57 || AnimElem = 71 || AnimElem = 83
trigger2 = var(35) := 190 || var(36) := ceil(EnemyNear, pos y - 80)
trigger3 = AnimElem = 12 || AnimElem = 24 || AnimElem = 40 || AnimElem = 62 || AnimElem = 77 || AnimElem = 86
trigger3 = var(35) := 190 || var(36) := ceil(EnemyNear, pos y)

[State 3300, HitDef: Low]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 || AnimElem = 18 || AnimElem = 32 || AnimElem = 52 || AnimElem = 67 || AnimElem = 80
trigger2 = AnimElem = 12 || AnimElem = 24 || AnimElem = 40 || AnimElem = 62 || AnimElem = 77 || AnimElem = 86
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8 || AnimElem = 21 || AnimElem = 36 || AnimElem = 57 || AnimElem = 71 || AnimElem = 83 || AnimElem = 47
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 94
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 4, fvar(11) * 112)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5, -5
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
sparkXY = -10 + 0 * (var(35) := 190), var(36) := -96
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
