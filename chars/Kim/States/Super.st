; _________________________________________
;| Kim Kaphwan by Jmorphman                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<HOUOUKYAKU>=
[StateDef 3000]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

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
var(17) = 49

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
trigger1 = AnimElemTime(8) < 0
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
pos = -19,-70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdc", 2, ifElse(command = "holdb", 1, 0))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3002, ifElse(var(10) = 1, 3001, 3000))

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,0
channel = 0

[State 3000, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1000,1
channel = 1

[State 3000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
stateType = A
physics = N

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 8
y = -1 - (var(10) * 0.5)

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.15625

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hououkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
ID = 3000
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3005
ignoreHitPause = 1

[State 3000, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3000, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3010

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0 && !var(10)
trigger2 = AnimElemTime(14) >= 0 && var(10) = 1
trigger3 = AnimElemTime(16) >= 0 && var(10) = 2
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003


;Landing (Missed)
[StateDef 3003]
type = S
anim = ifElse(PrevStateNo = 3010 || PrevStateNo = 3060, 3011, 3003)
physics = N
moveType = I
velSet = 0,0

[State 3003, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3003, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3003, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3003, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Blocked
[StateDef 3005]
type = A
anim = 3005
physics = N
moveType = I
velSet = 7.5,-1.5

[State 3005, Gravity]
type = VelAdd
trigger1 = 1
y = 0.15625

[State 3005, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003


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

[State 3010, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3010, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(47) < 0
pos = 50,0

[State 3010, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(47) < 0
edge = 80,0

[State 3010, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3010, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3010,0
channel = 0

[State 3010, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1400,1
channel = 0

[State 3010, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,0

[State 3010, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 14
value = 1,3

[State 3010, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1,4

[State 3010, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 27 || AnimElem = 31 || AnimElem = 39
value = 1,5

[State 3010, Hienzan Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 48
value = 1200,1
channel = 1

[State 3010, Hienzan Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 57
value = 1200,1
channel = 3

[State 3010, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 47
value = 40,0
channel = 4

[State 3010, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(48) >= 0
stateType = A
physics = N

[State 3010, Dust Helper]
type = Helper
trigger1 = AnimElem = 48
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hienzan Dust"
posType = P1
ownPal = 1

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 48
y = -8.33400

[State 3010, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(48) > 0
y = 0.5

[State 3010, Hit Sound]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(31) := 0
trigger2 = AnimElem = 7 || AnimElem = 15
trigger2 = var(31) := 3
trigger3 = AnimElem = 21
trigger3 = var(31) := 4
trigger4 = AnimElem = 28 || AnimElem = 32 || AnimElem = 40
trigger4 = var(31) := 5

[State 3010, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 69 || var(36) := -82
trigger2 = AnimElem = 7
trigger2 = var(35) := 28 || var(36) := -95
trigger3 = AnimElem = 15
trigger3 = var(35) := 80 || var(36) := -62
trigger4 = AnimElem = 21
trigger4 = var(35) := 72 || var(36) := -98
trigger5 = AnimElem = 28
trigger5 = var(35) := 76 || var(36) := -67
trigger6 = AnimElem = 32
trigger6 = var(35) := 74 || var(36) := -106
trigger7 = AnimElem = 40
trigger7 = var(35) := 100 || var(36) := -75

[State 3010, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7 || AnimElem = 21 || AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
hitSound = -1
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

[State 3010, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 15 || AnimElem = 28 || AnimElem = 40
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
hitSound = -1
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

[State 3010, Hienzan Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 47
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -14.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -14.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 17), var(36) := -28
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3010, Hienzan Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 48
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -12.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3010, Hienzan Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 49
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -121
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3010, Hienzan Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 58
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -121
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(59) >= 0
moveType = I

[State 3010, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003



;====<HOUOUKYAKU (AERIAL ATTEMPT)>=
[StateDef 3020]
type = A
physics = N
moveType = A
anim = 3020
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3020, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3020, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3020, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3020, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3020, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 49

[State 3020, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3020, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3020, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3020, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 7,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3020, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3020, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 3000,0
channel = 0

[State 3020, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 3020, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8
y = -3

[State 3020, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.15

[State 3020, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
ID = 3000
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
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
guard.hitTime = 10
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
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3020, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3005
ignoreHitPause = 1

[State 3020, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3020, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3010

[State 3020, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003


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
value = 5012

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
value = 5017

[State 3016, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3016, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;====<MAX HOUOUKYAKU>=
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
var(17) = 49

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
trigger1 = AnimElemTime(8) < 0
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
pos = -19,-70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,0
channel = 0

[State 3050, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1000,1
channel = 1

[State 3050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
stateType = A
physics = N

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 11
y = -2

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.15625

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hououkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
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
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3005
ignoreHitPause = 1

[State 3050, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3015
ID = 3050
ignoreHitPause = 1
persistent = 0

[State 3050, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3060

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003


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

[State 3060, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3060, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(79) < 0
pos = 50,0

[State 3060, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(77) < 0
edge = 80,0

[State 3060, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3060, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3060,0
channel = 0

[State 3060, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 80
value = 1400,1
channel = 0

[State 3060, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,0

[State 3060, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,1

[State 3060, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 12 || AnimElem = 20
value = 1,3

[State 3060, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 26
value = 1,4

[State 3060, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33 || AnimElem = 37 || AnimElem = 45 || AnimElem = 53 || AnimElem = 62 || AnimElem = 72
trigger2 = AnimElem = 79 || AnimElem = 83 || AnimElem = 87
value = 1,5

[State 3060, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 80
value = 40,0
channel = 1

[State 3060, Hienzan Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 94
value = 1200,1
channel = 3

[State 3060, Tenshozan Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 103
value = 1000,2
channel = 4

[State 3060, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(80) >= 0
stateType = A
physics = N

[State 3060, Dust Helper]
type = Helper
trigger1 = AnimElem = 80
helperType = Normal
stateNo = 8100
ID = 8100
name = "Kusajin Dust"
posType = P1
ownPal = 1

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 80
x = 3.99900
y = -6.60100

[State 3060, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(80) > 1 && AnimElemTime(104) < 0
y = 0.167

[State 3060, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(104) >= 0
y = 0.5

[State 3060, VelMul]
type = VelMul
trigger1 = AnimElemTime(91) >= 0 && AnimElemTime(105) < 0
x = 0.95

[State 3060, Hit Sound]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(31) := 0
trigger2 = AnimElem = 8
trigger2 = var(31) := 1
trigger3 = AnimElem = 13 || AnimElem = 21 || AnimElem = 71
trigger3 = var(31) := 3
trigger4 = AnimElem = 27
trigger4 = var(31) := 4
trigger5 = AnimElem = 34 || AnimElem = 38 || AnimElem = 46 || AnimElem = 54 || AnimElem = 63 || AnimElem = 74
trigger5 = var(31) := 5

[State 3060, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 69 || var(36) := -82
trigger2 = AnimElem = 8
trigger2 = var(35) := 66 || var(36) := -80
trigger3 = AnimElem = 13
trigger3 = var(35) := 28 || var(36) := -95
trigger4 = AnimElem = 21
trigger4 = var(35) := 80 || var(36) := -62
trigger5 = AnimElem = 27
trigger5 = var(35) := 72 || var(36) := -98
trigger6 = AnimElem = 34
trigger6 = var(35) := 76 || var(36) := -67
trigger7 = AnimElem = 38
trigger7 = var(35) := 74 || var(36) := -106
trigger8 = AnimElem = 46
trigger8 = var(35) := 100 || var(36) := -75
trigger9 = AnimElem = 54
trigger9 = var(35) := 74 || var(36) := -89
trigger10 = AnimElem = 55
trigger10 = var(35) := 70 || var(36) := -31
trigger11 = AnimElem = 63
trigger11 = var(35) := 112 || var(36) := -71
trigger12 = AnimElem = 74
trigger12 = var(35) := 52 || var(36) := -102

[State 3060, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8 || AnimElem = 13 || AnimElem = 27 || AnimElem = 38 || AnimElem = 54 || AnimElem = 74
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
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
hitSound = -1
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

[State 3060, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 21 || AnimElem = 34 || AnimElem = 46 || AnimElem = 55 || AnimElem = 63
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
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
hitSound = -1
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

[State 3060, Kusajin Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 80
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Kusajin Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 81
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -105
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Kusajin Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 84
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Kusajin Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 85
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -4.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 63), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Kusajin Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 88
attr = A, HA
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
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -2.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Hienzan Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = AnimElem = 94
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
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
ground.velocity = -2.16, -10.81
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Hienzan Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 95
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -2.16, -10.81
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -121
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, Tenshozan Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 103
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3060, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(104) >= 0
moveType = I

[State 3060, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003



;====<MAX HOUOUKYAKU (AERIAL ATTEMPT)>=
[StateDef 3070]
type = A
physics = N
moveType = A
anim = 3020
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3070, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3070, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3070, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3070, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3070, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 49

[State 3070, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3070, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3070, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3070, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 7,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3070, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3070, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 3000,0
channel = 0

[State 3070, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 3070, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8
y = -3

[State 3070, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.15

[State 3070, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
ID = 3000
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
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
guard.hitTime = 10
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
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3070, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3005
ignoreHitPause = 1

[State 3070, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3070, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3060

[State 3070, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003



;====<HOUOUTENBUKYAKU>=
;Startup
[StateDef 3100]
type = A
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
var(17) = 49

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
trigger1 = AnimElemTime(3) < 0
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
pos = 7,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdc", 2, ifElse(command = "holdb", 1, 0))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 160, 2, ifElse(P2Dist x > 130, 1, 0))

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 2
x = 5.5 + (var(10) * 1.5)
y = 5.5

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 2
y = 0.2

[State 3100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
air.velocity = 0, -7.49
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
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3105

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3110

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Landing (Missed)
[StateDef 3101]
type = S
anim = 3101
physics = N
moveType = I
velSet = 0,0

[State 3101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Blocked
[StateDef 3105]
type = A
anim = 3105
physics = N
moveType = I
velSet = -3.5,-8

[State 3105, Gravity]
type = VelAdd
trigger1 = 1
y = 0.55

[State 3105, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Success
[StateDef 3110]
type = A
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, Turn]
type = Turn
trigger1 = !Time && Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3110, BindToTarget]
type = BindToTarget
trigger1 = NumTarget && !Time
pos = 50,0,Foot

[State 3110, Voice 1]
type = PlaySnd
trigger1 = !Time
trigger2 = AnimElem = 48
value = 1400,1
channel = 0

[State 3110, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 20
value = 3110,0
channel = 0

[State 3110, Hienzan Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11
trigger3 = AnimElem = 21
trigger4 = AnimElem = 30
trigger5 = AnimElem = 39
value = 1200,1

[State 3110, Kusajin Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1,5
channel = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -1.5

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = 3
y = -1.5

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 52
x = 0

[State 3110, VelMul]
type = VelMul
trigger1 = AnimElemTime(19) > 0
trigger1 = AnimElemTime(20) < 0
y = 0.8

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(49) > 0
y = 0.3

[State 3110, Hienzan Hit 1/2]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 2 || AnimElem = 11
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -6.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3110, Hienzan Hit 3/4/5]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 21 || AnimElem = 30 || AnimElem = 39
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -3, -5.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -5.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3110, Kusajin Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 12
trigger1 = AnimElem = 49
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -8.81
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -105
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(50) >= 0
moveType = I

[State 3110, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003



;====<MAX HOUOUTENBUKYAKU>=
[StateDef 3150]
type = A
physics = N
moveType = A
anim = 3100
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
var(17) = 49

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
trigger1 = AnimElemTime(3) < 0
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
pos = 7,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
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

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 2
x = 5.5
y = 5.5

[State 3150, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 2
y = 0.2

[State 3150, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
air.velocity = 0, -7.49
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
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, ChangeState]
type = ChangeState
trigger1 = MoveGuarded
value = 3105

[State 3150, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3160

[State 3150, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Success
[StateDef 3160]
type = A
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, Turn]
type = Turn
trigger1 = !Time && Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3160, BindToTarget]
type = BindToTarget
trigger1 = NumTarget && !Time
pos = 50,0,Foot

[State 3160, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 1400,1
channel = 0

[State 3160, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 20
value = 3110,0
channel = 0

[State 3160, Hienzan Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11
trigger3 = AnimElem = 21
trigger4 = AnimElem = 30
trigger5 = AnimElem = 39
value = 1200,1

[State 3160, Kusajin Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 47
trigger2 = AnimElem = 51
trigger3 = AnimElem = 55
trigger4 = AnimElem = 59
trigger5 = AnimElem = 63
value = 1,5

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -1.5

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = 3
y = -1.5

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 68
x = 0

[State 3160, VelMul]
type = VelMul
trigger1 = AnimElemTime(19) > 0
trigger1 = AnimElemTime(20) < 0
y = 0.8

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(64) > 0
y = 0.3

[State 3160, Hienzan Hit 1/2]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 2 || AnimElem = 11
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -6.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Hienzan Hit 3/4/5]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 21 || AnimElem = 30 || AnimElem = 39
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -3, -5.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3, -5.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Kusajin Hit 1/3]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 48 || AnimElem = 56 || AnimElem = 64
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.16, -2.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3.16, -2.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Kusajin Hit 2/4]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 52 || AnimElem = 60
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.16, -2.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -3.16, -2.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Kusajin Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 64
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 16,16
guard.pauseTime = 16,16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(65) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3003



;====<HOUOUHITENKYAKU>=
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
trigger1 = AnimElemTime(10) < 0
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
pos = -19,-70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 810,0
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 1

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10 && !var(11)
ID = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
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
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3200)
trigger1 = MoveHit = 1
value = 2,3200
channel = 3
ignoreHitPause = 1
persistent = 0

[State 3200, Juggle Reset]
type = VarSet
trigger1 = NumTarget(3200)
trigger1 = MoveHit = 1
var(15) = 0
persistent = 0

[State 3200, VarSet]
type = VarSet
trigger1 = NumTarget(3200)
trigger1 = MoveHit = 1
var(11) = 1
persistent = 0

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX HOUOUHITENKYAKU>=
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
var(17) = 49

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
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -19,-70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3250, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 810,0
channel = 0

[State 3250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,5
channel = 1

[State 3250, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10 && !var(11)
ID = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 147 < 7, 7, fvar(11) * 147)), 7
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
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, TargetBind]
type = TargetBind
trigger1 = NumTarget(3200)
trigger1 = MoveHit = 1
trigger1 = abs(pos x - Target, pos x) < 52
pos = abs(pos x - Target, pos x) + 26, (Target, pos y - pos y)
ignoreHitPause = 1
persistent = 0

[State 3250, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3200)
trigger1 = MoveHit = 1
value = 2,3200
channel = 3
ignoreHitPause = 1
persistent = 0

[State 3250, ChangeState]
type = ChangeState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3251

[State 3250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3251]
type = S
anim = 3251
physics = N
moveType = A
velSet = 0,0

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 257,0
channel = 0

[State 3251, Woosh]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 1

[State 257, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 16

[State 257, PosAdd]
type = PosAdd
trigger1 = AnimElem = 12
trigger2 = AnimElem = 13
x = -8

[State 3251, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(13))
trigger1 = AnimElem = 10
ID = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 42,42
guard.pauseTime = 42,42
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.16, 32.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.16, 32.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3251, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3251)
trigger1 = MoveHit = 1
value = 2,3200
channel = 3
ignoreHitPause = 1
persistent = 0

[State 3251, Juggle Reset]
type = VarSet
trigger1 = NumTarget(3251)
trigger1 = MoveHit = 1
var(15) = 0
persistent = 0

[State 3251, VarSet]
type = VarSet
trigger1 = NumTarget(3251)
trigger1 = MoveHit = 1
var(11) = 1
persistent = 0

[State 3251 TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3251)
value = 3255
ID = 3251
ignoreHitPause = 1
persistent = 0

[State 3251, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 3251, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3255]
type = A
moveType = H
physics = N
velSet = 0,0

[State 3255, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 3255, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3255, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3256


;Knocked Away
[StateDef 3256]
type = A
moveType = H
physics = N
ctrl = 0

[State 3256, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 3256, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3256, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 3256, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= ifElse((Anim = [5051, 5059]) || (Anim = [5061, 5069]), 0, const(movement.air.gethit.groundlevel))
value = 3257


;Hit ground from fall
[StateDef 3257]
type = L
moveType = H
physics = N

[State 3257, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 3257, VarSet]
type = VarSet
trigger1 = !Time
sysvar(1) = floor(vel y)

[State 3257, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = !SelfAnimExist(5100 + (Anim % 10))
value = 5100

[State 3257, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (Anim = [5051, 5059]) || (Anim = [5061, 5069])
trigger1 = SelfAnimExist(5100 + (Anim % 10))
value = 5100 + (Anim % 10)

[State 3257, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3257, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3257, VelMul]
type = VelMul
trigger1 = !Time
x = 0.75

[State 3257, Explod]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0,0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 3257, HitFallDamage]
type = HitFallDamage
trigger1 = Time = 3

[State 3257, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 3257, PosFreeze]
type = PosFreeze
trigger1 = 1

[State 3257, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3258


;Bounce off ground)
[StateDef 3258]
type = A
moveType = H
physics = N

[State 3258, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (Anim % 10))
value = 5160

[State 3258, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (Anim % 10))
value = 5160 + (Anim % 10)

[State 3258, VelSet]
type = VelSet
trigger1 = !Time
y = -8.875

[State 3258, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 3258, PosAdd]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 3258, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = const(movement.down.bounce.yaccel)

[State 3258, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5100



;====<ZERO KYORI HOUOUKYAKU>=
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
var(17) = 43

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
trigger1 = AnimElemTime(9) < 0
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
pos = -19,-70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = !Time
value = 3300,0
channel = 0

[State 3300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1000,1
channel = 1

[State 3300, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 52,0
channel = 3

[State 3300, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 16
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3300, Dust Helper]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hououkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 6

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 3300, VelMul]
type = VelMul
trigger1 = AnimElemTime(15) > 0
x = 0.92

[State 3300, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3300, Safety]
type = SuperPause
trigger1 = Animelem = 8 && NumEnemy
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020, 5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3300, HitDef]
type = HitDef
trigger1 = AnimElem = 8 && !var(43)
trigger1 = P2BodyDist x < 50
ID = 3300
attr = S, HT
hitFlag = M
priority = 7, Miss
getPower = 0, 0
givePower = 0, 0
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
numHits = 0

[State 3300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3015
ID = 3300
ignoreHitPause = 1
persistent = 0

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
trigger1 = AnimElemTime(11) = 3
value = 3310

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3310]
type = S
anim = 3310
physics = N
moveType = A
velSet = 0,0

[State 3310, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3310, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3310, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3310, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(58) < 0
pos = 50,0

[State 3310, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(58) < 0
edge = 80,0

[State 3310, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3310,0
channel = 0

[State 3310, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 58
value = 1400,1
channel = 0

[State 3310, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,0

[State 3310, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,3

[State 3310, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 40
value = 1,4

[State 3310, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 13 || AnimElem = 23 || AnimElem = 31 || AnimElem = 49
trigger2 = AnimElem = 58 || AnimElem = 62
value = 1,5

[State 3310, Hienzan Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 69
value = 1200,1
channel = 1

[State 3310, Phoenix Sound]
type = PlaySnd
trigger1 = AnimElem = 70
value = 3310,1
channel = 3

[State 3310, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 59
value = 40,0
channel = 4

[State 3310, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(59) >= 0
stateType = A
physics = N

[State 3310, Dust Helper]
type = Helper
trigger1 = AnimElem = 59
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hienzan Dust"
posType = P1
ownPal = 1

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 59
x = 3.99900
y = -6.60100

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 68
x = 0

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 71
y = 0

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(60) >= 0 && AnimElemTime(71) < 0
y = 0.167

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(72) >= 0
y = 0.375

[State 3060, VelMul]
type = VelMul
trigger1 = AnimElemTime(66) >= 0 && AnimElemTime(68) < 0
x = 0.95

[State 3010, Hit Sound]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(31) := 0
trigger2 = AnimElem = 6
trigger2 = var(31) := 3
trigger3 = AnimElem = 41
trigger3 = var(31) := 4
trigger4 = AnimElem = 14 || AnimElem = 22 || AnimElem = 32 || AnimElem = 50
trigger4 = var(31) := 5

[State 3010, Spark XY]
type = Null
trigger1 = AnimElem = 2
trigger1 = var(35) := 69 || var(36) := -82
trigger2 = AnimElem = 6
trigger2 = var(35) := 80 || var(36) := -62
trigger3 = AnimElem = 14
trigger3 = var(35) := 100 || var(36) := -75
trigger4 = AnimElem = 23
trigger4 = var(35) := 31 || var(36) := -104
trigger5 = AnimElem = 25
trigger5 = var(35) := 54 || var(36) := -31
trigger6 = AnimElem = 32
trigger6 = var(35) := 96 || var(36) := -8
trigger7 = AnimElem = 41
trigger7 = var(35) := 72 || var(36) := -98
trigger8 = AnimElem = 50
trigger8 = var(35) := 80 || var(36) := -71

[State 3310, Energy Pillar]
type = Helper
trigger1 = AnimElem = 70
helperType = Normal
stateNo = 3315
ID = 3315
name = "Energy Pillar"
posType = P1
pos = 0,ceil(-pos y)
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3310, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 || AnimElem = 23 || AnimElem = 41
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
hitSound = -1
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

[State 3310, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 14 || AnimElem = 25 || AnimElem = 32 || AnimElem = 50
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
hitSound = -1
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

[State 3310, Kusajin Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 59
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3310, Kusajin Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 63
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -108
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3310, Hienzan Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 70
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -18.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -18.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 33), var(36) := -121
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3310, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(71) >= 0
moveType = I

[State 3010, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3311


;Landing (Missed)
[StateDef 3311]
type = S
anim = ifElse(EnemyNear, Alive, 3311, 3312)
physics = N
moveType = I
velSet = 0,0

[State 3311, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3311, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3311, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3311, Width]
type = Width
trigger1 = !Time
edge = 32,0

[State 3311, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
