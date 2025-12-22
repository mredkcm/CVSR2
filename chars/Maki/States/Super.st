; _______________________________________
;| Maki Genryusai by Knuckles8864        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<BUSHIN GOURAIHA>=
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
trigger1 = AnimElemTime(4) < 0
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
pos = -23,-62
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,1
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4,2
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4,3
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 19
value = 4,5
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 26
value = 3000,1
channel = 0

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 14
value = 1,1
channel = 1

[State 3000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 19
value = 1,2
channel = 1

[State 3000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 26
value = 1,5
channel = 1

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 15 || AnimElem = 16
trigger2 = AnimElem = 17 || AnimElem = 21 || AnimElem = 22 || AnimElem = 23 || AnimElem = 24
x = 13

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 29
y = -4

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 29
statetype = A
physics = N

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElem = 29,>0
y = .48

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -74
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 15
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 21
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 29
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -88
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 30
movetype = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = AnimElem = 35,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3005


;Landing
[StateDef 3005]
type = S
physics = N
movetype = I
anim = 3005
velSet = 0,0
sprPriority = 1

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
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;====<MAX BUSHIN GOURAIHA>=
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
var(17) = 43

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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -23,-62
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,1
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4,2
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4,3
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 19
value = 4,5
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 26
value = 3000,2
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 39
value = 3000,1
channel = 0

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 14
value = 1,1
channel = 1

[State 3050, Staff Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 19
trigger2 = AnimElem = 30
value = 1,8
channel = 1

[State 3050, Staff Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 26
value = 1,7
channel = 1

[State 3050, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 39
value = 1,5
channel = 1

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 15 || AnimElem = 16 || AnimElem = 17
trigger2 = AnimElem = 20 || AnimElem = 21 || AnimElem = 22 || AnimElem = 27 || AnimElem = 28
trigger3 = AnimElem = 31 || AnimElem = 32 || AnimElem = 37 || AnimElem = 38
x = 13

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 41
y = -10

[State 3050, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 41
statetype = A
physics = N

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElem = 41,>0
y = .61

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -74
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 15
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 20
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 22
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -89
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 28
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 7]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 32
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 40
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 86), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 42
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -88
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 43
movetype = I

[State 3050, ChangeState]
type = ChangeState
trigger1 = AnimElem = 47,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3005



;====<TESSHINHOU>=
[StateDef 3100]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3100, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -12,-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Steps]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 9
value = 100, 0

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 4,>0
x = Const(velocity.run.fwd.x)

[State 3100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 3100, Kick]
type = VarSet
triggerAll = (!var(14) || AILevel)
triggerAll = Time > 44
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 3110

[State 1101, Followup]
type = ChangeState
trigger1 = var(14) = [3100,3199]
value = var(14)

[State 3100, End]
type = ChangeState
trigger1 = Time >= 88
value = 3101


;Stop
[StateDef 3101]
type = S
physics = N
moveType = I
anim = 3101
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3101, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 6

[State 3101, VelMul]
type = VelMul
trigger1 = 1
x = .95

[State 3101,VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 0

[State 3101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 1

[State 3101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 50,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Kick
[StateDef 3110]
type = S
physics = N
moveType = A
anim = 3110
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3110, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 3110, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 9

[State 3110, Tesshinhou FX]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
name = "Tesshinhou"
ID = 3115
stateNo = 3115
pos = 0,0
posType = P1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -10.52,0
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
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 9
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -4.32, -7.49
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3110, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3110, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 10
movetype = I

[State 3110,End]
type = ChangeState
trigger1 = !AnimTime
value = 3111


;Stop
[StateDef 3111]
type = S
physics = N
moveType = I
anim = 3111
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3111, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 6

[State 3111, VelMul]
type = VelMul
trigger1 = 1
x = .8

[State 3111,VelSet]
type = VelSet
trigger1 = !AnimElemTime(4)
x = 0

[State 3111, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0
channel = 1

[State 3111, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 50,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 3111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX TESSHINHOU>=
[StateDef 3150]
type = S
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
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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
trigger1 = AnimElemTime(4) < 0
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
pos = -12,-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Steps]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 9
value = 100, 0

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 4,>0
x = Const(velocity.run.fwd.x)

[State 3150, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 3150, Kick]
type = VarSet
triggerAll = (!var(14) || AILevel)
triggerAll = Time > 44
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AIlevel
trigger2 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
var(14) = 3160

[State 3150, Followup]
type = ChangeState
trigger1 = var(14) = [3100,3199]
value = var(14)

[State 3150, End]
type = ChangeState
trigger1 = Time >= 88
value = 3101


;Kick
[StateDef 3160]
type = S
physics = N
moveType = A
anim = 3110
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 3110, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 9

[State 3160, Tesshinhou FX]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
name = "Tesshinhou"
ID = 3115
stateNo = 3115
pos = 0,0
posType = P1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 3160, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 3 || AnimElem = 5 || AnimElem = 7 || AnimElem = 9
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 || AnimElem = 6 || AnimElem = 8
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -10.52,0
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
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3160,End]
type = ChangeState
trigger1 = !AnimTime
value = 3170


;Final Punch
[StateDef 3170]
type = S
physics = N
moveType = A
anim = 3120
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3170, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3150,0
channel = 0

[State 3170, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 12

[State 3170, VelMul]
type = VelMul
trigger1 = 1
x = .82

[State 3170, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 3170, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Genko Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3170, Genko FX]
type = Helper
trigger1 = !AnimElemTime(1)
helperType = Normal
name = "Genko"
ID = 1005
stateNo = 1005
pos = 0,0
posType = P1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 3170, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -4.32, -7.49
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3170, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 7
moveType = I

[State 3170, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3170, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<AJARATENGU>=
;Startup
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
trigger1 = AnimElemTime(3) < 0
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
pos = -26,-49
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3200, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
trigger1 = !var(43)
attr = S, HT
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
p1StateNo = 3210

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3210]
type = A
physics = N
moveType = A
anim = 3210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3210, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,1
channel = 0

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3210, TargetBind]
type = TargetState
trigger1 = !Time && NumTarget
value = 3240

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-30 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(0 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3210, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3210, TargetBind]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3210, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 3210, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,> 0
y = .5

[State 3210, End]
type = ChangeState
trigger1 = AnimElem = 4,> 0
trigger1 = Frontedgebodydist < 1
value = 3211


;Success (Wall Slam 1)
[StateDef 3211]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3211, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3211, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3211, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3211, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3211,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3211, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3211, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3211, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3211, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3211, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3211, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3211, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3211, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3211, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3211, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3261, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3211,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3212


;Going into Wall Slam 2
[StateDef 3212]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3212, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3212, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3212, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3212, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3212, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3212, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[state 1500,kaas]
type=targetfacing
trigger1=!time
value=-1

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3212,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1201,VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3212, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3213


;Success (Wall Slam 2)
[StateDef 3213]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3213, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3213, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3213, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3213, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3213,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3213, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3213, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3213, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3213, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3213, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3213, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3213, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3213, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3213, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3213, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3213, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3213, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3213, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3213,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3214


;Success (Going Down to Floor Slam)
[StateDef 3214]
type = A
physics = N
movetype = A
anim = 3215
ctrl = 0
velset = 0,0

[State 3214, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3214, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3242

[State 3214, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3214, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3150,0
channel = 0

[State 3214, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3214,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3214, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 5.2
y = -16

[State 3214, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0
y = 8

[State 3214, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .1

[State 1000, 0]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3214, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3215


;Success (End)
[StateDef 3215]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 3215, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 3215, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 3215, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 3215, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 3215, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 3215, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3215, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3215, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(119 * fvar(11) < 7, -7, -119 * fvar(11)))

[State 3215, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3215, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3215, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3215, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3215, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514



;====<AJARATENGU (TARGET)>=
;(Target)
[Statedef 3240]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3240, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3240

[State 3240, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0


;(Target)
[Statedef 3241]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3241, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 3241,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3241


;(Target)
[Statedef 3242]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3242,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3242

[State 3242, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3242, ScreenBound]
type = ScreenBound
Trigger1 = 1
value = 1
movecamera = 0,0


;(Target)
[Statedef 3243]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3243,ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3243

[State 3243, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3243, ScreenBound]
type = ScreenBound
Trigger1 = 1
value = 1
movecamera = 0,0



;====<MAX AJARATENGU>=
;Startup
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
var(17) = 43

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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3250, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = -26,-49
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3200, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
trigger1 = !var(43)
attr = S, HT
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
p1StateNo = 3260

[State 3250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3260]
type = A
physics = N
moveType = A
anim = 3210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3260, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3260, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,1
channel = 0

[State 3260, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3260, TargetBind]
type = TargetState
trigger1 = !Time && NumTarget
value = 3240

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-30 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(0 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3260, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3260, TargetBind]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 3260, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,> 0
y = .5

[State 3260, End]
type = ChangeState
trigger1 = AnimElem = 4,> 0
trigger1 = Frontedgebodydist < 1
value = 3261


;Success (Wall Slam 1)
[StateDef 3261]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3261, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3261, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3261, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3261, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3261, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3261, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3261, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3261, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3261, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3261, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3261, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3261, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3261, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3261, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3261, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3261, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3261, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3261, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3261, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3261,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3262


;Going into Wall Slam 2
[StateDef 3262]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3262, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3262, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3262, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3262, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3262, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3262, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3262, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3262, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3262, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3262, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3262, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3263


;Success (Wall Slam 2)
[StateDef 3263]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3263, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3263, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3263, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3263, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3263,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3263, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3263, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3263, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3263, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3263, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3263, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3263, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3263, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3263, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3263, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3263, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3263, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3263, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3263,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3264


;Going into Wall Slam 3
[StateDef 3264]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3264, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3264, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,3
channel = 0

[State 3264, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3264, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3264, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3264, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3264, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3264, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3264, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3264, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3264, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3265


;Success (Wall Slam 3)
[StateDef 3265]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3265, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3265, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3265, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3265, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3265,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3265, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3265, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3265, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3265, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3265, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3265, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3265, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3265, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3265, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3265, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3265, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3265, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3265, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3265, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3265, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3265,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3266


;Going into Wall Slam 4
[StateDef 3266]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3266, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3266, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,4
channel = 0

[State 3266, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3266, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3266, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3266, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3266, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3266, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3266, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3266, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3266, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3267


;Success (Wall Slam 4)
[StateDef 3267]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3267, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3267, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3267, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3267, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3267,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3267, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3267, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3267, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3267, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3267, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3267, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3267, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3267, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3267, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3267, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3267, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3267, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3267, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3267,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3268


;Success (Going Down to Floor Slam)
[StateDef 3268]
type = A
physics = N
movetype = A
anim = 3216
ctrl = 0
velset = 0,0

[State 3268, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3268, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3243

[State 3268, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3268, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,5
channel = 0

[State 3268, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 4
value = 1,5
channel = 1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 3
value = -1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 4
value = 1

[State 3268, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3268,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(20 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3268,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3268,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-25 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3268,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3268, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 4.4
y = -16

[State 3268, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x=0
y=8

[State 3268, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .1

[State 3268, Explod]
type = Explod
trigger1 = AnimElemTime(2) > 0
trigger1 = pos y > -160
anim = 3245
ID = 3245
pos = 0,85
postype = P1
scale = 0.5, 0.5
velocity = 0,0
bindtime = 1
sprpriority = 5
ownpal = 1
supermovetime = -1
pausemovetime = -1
persistent = 0

[State 1000, 0]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3268, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3269


;Success (End)
[StateDef 3269]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 3269, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 3269, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 3269, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 3269, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 3269, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 3269, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3269, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3269, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(112 * fvar(11) < 7, -7, -112 * fvar(11)))

[State 3269, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3269, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3269, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3269, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3269, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514



;====<AJARATENGU (AIR)>=
;Startup
[StateDef 3300]
type = A
physics = S
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = Time = 3
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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3300, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -26,-59
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3300, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3300, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = A, HT
hitFlag = AF
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
p1StateNo = 3310

[State 3300, Gravity]
type = Gravity
trigger1 = AnimElemTime(9) > 0

[State 3300, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Success
[StateDef 3310]
type = A
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0,0

[State 3310, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3310, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,1
channel = 0

[State 3310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50
ctrl = 1

[State 3310, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1520

[State 3310,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(40 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3310,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3310,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-75 * const(size.yScale))

[State 3310,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,> 0
y = .5

[State 3310, End]
type = ChangeState
trigger1 = AnimElem = 3,> 0
trigger1 = Frontedgebodydist < 1
value = 3311


;Success (Wall Slam 1)
[StateDef 3311]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3311, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3311, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3311, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3311, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3311,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3311, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 1511, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3311, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3311, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3311, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3311, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3311, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3311, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3311, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3311, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3311, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3311, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3311, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3311,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3312


;Going into Wall Slam 2
[StateDef 3312]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3312, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3312, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3312, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3312, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3312, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3312, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[state 1500,kaas]
type=targetfacing
trigger1=!time
value=-1

[State 3312, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3312,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 1201,VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3312, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3313


;Success (Wall Slam 2)
[StateDef 3313]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3313, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3313, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3313, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3313, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3313,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3313, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3313, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3313, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3313, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3313, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3313, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3313, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3313, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3313, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3313, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3313, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3313, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3313, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3313,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3314


;Success (Going Down to Floor Slam)
[StateDef 3314]
type = A
physics = N
movetype = A
anim = 3215
ctrl = 0
velset = 0,0

[State 3314, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3314, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3242

[State 3314, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3314, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3150,0
channel = 0

[State 3314, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3314,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3314, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 5.2
y = -16

[State 3314, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0
y = 8

[State 3314, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .1

[State 3314, TargetFacing]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3314, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3315


;Success (End)
[StateDef 3315]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 3315, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 3315, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 3315, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 3315, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 3315, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 3315, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3315, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3315, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(140 * fvar(11) < 7, -7, -140 * fvar(11)))

[State 3315, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3315, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3315, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3315, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3315, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514



;====<MAX AJARATENGU (AIR)>=
;Startup
[StateDef 3350]
type = A
physics = S
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3350, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3350, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3350, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3350, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3350, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3350, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3350, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = -26,-59
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3350, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3350, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3350, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3350, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3350, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
attr = A, HT
hitFlag = AF
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
p1StateNo = 3360

[State 3350, Gravity]
type = Gravity
trigger1 = AnimElemTime(9) > 0

[State 3350, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Success
[StateDef 3360]
type = A
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0,0

[State 3360, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3360, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,1
channel = 0

[State 3360, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50
ctrl = 1

[State 3360, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1520

[State 3360,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(40 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3360,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3360,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-75 * const(size.yScale))

[State 3360,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3360, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 3360, VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,> 0
y = .5

[State 3310, End]
type = ChangeState
trigger1 = AnimElem = 3,> 0
trigger1 = Frontedgebodydist < 1
value = 3361


;Success (Wall Slam 1)
[StateDef 3361]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3361, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3361, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3361, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3361, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3361,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3361, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3361, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3361, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3361, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3361, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3361, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3361, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3361, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3361, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3361, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3361, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3361, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3361, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3361, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3361, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3361,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3362


;Going into Wall Slam 2
[StateDef 3362]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3362, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3362, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3362, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3362, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3362, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3362, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3362, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3362, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3362, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3362, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3362, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3363


;Success (Wall Slam 2)
[StateDef 3363]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3363, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3363, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3363, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3363, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3363,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3363, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3363, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3363, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3363, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3363, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3363, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3363, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3363, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3363, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3363, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3363, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3363, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3363, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3363,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3364


;Going into Wall Slam 3
[StateDef 3364]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3364, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3364, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,3
channel = 0

[State 3364, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3364, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3364, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3364, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3364, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3364, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3364, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3364, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3364, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3365


;Success (Wall Slam 3)
[StateDef 3365]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3365, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3365, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3365, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3365, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3365,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3365, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3365, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3365, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3365, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3365, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3365, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3365, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3365, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3365, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3365, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3365, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3365, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3365, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3365, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3365, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3365,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3366


;Going into Wall Slam 4
[StateDef 3366]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3366, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3366, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,4
channel = 0

[State 3366, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3366, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3366, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3366, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3366, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3366, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3366, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3366, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3366, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3367


;Success (Wall Slam 4)
[StateDef 3367]
type = A
physics = N
movetype = A
anim = 3211
ctrl = 0
velset = 0,0

[State 3367, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3367, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3367, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3367, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3367,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3367, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3367, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3367, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3367, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3367, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3367, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3367, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3367, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3367, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3367, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3367, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3367, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3367, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3367,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3368


;Success (Going Down to Floor Slam)
[StateDef 3368]
type = A
physics = N
movetype = A
anim = 3216
ctrl = 0
velset = 0,0

[State 3368, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3368, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3243

[State 3368, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3368, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3150,0
channel = 0

[State 3368, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 4
value = 1,5
channel = 1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 3
value = -1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 4
value = 1

[State 3368, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3368,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(20 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3368,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3368,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-25 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3368,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3368, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 4.4
y = -16

[State 3368, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x=0
y=8

[State 3368, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .1

[State 3368, Explod]
type = Explod
trigger1 = AnimElemTime(2) > 0
trigger1 = pos y > -160
anim = 3245
ID = 3245
pos = 0,85
postype = P1
scale = 0.5, 0.5
velocity = 0,0
bindtime = 1
sprpriority = 5
ownpal = 1
supermovetime = -1
pausemovetime = -1
persistent = 0

[State 1000, 0]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3368, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3369


;Success (End)
[StateDef 3369]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 3369, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 3369, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 3369, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 3369, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 3369, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 3369, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3369, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3369, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(133 * fvar(11) < 7, -7, -133 * fvar(11)))

[State 3369, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3369, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3369, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3369, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3369, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514



;====<SUPER REPPUKYAKU>=
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3400, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3400, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3400, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3400, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = p1
pos = -3, -10
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, LifeAdd]
type = LifeAdd
trigger1 = !Time
value = -126
kill = 0

[State 3400, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 1300, Time]
type = VarSet
trigger1 = !Time
var(42) = 3

[State 3400, VarAdd]
type = VarAdd
trigger1 = !AnimElemTime(10)
var(42) = -1

[State 3400, VarAdd]
type = ChangeAnim
trigger1 = var(42)
trigger1 = !AnimElemTime(10)
value = Anim
elem = 4

[State 3400, ChangeAnim]
type = ChangeAnim
trigger1 = !var(42)
trigger1 = !AnimElemTime(7)
value = Anim
elem = 10

[State 3400, Reppukyaku FX]
type = Helper
trigger1 = !NumHelper(3405)
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Super_Reppukyaku"
ID = 3405
stateNo = 3405
pos = -12,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 3400, Reppukyaku FX]
type = Helper
trigger1 = !AnimElemTime(4)
helpertype = Normal
name = "Smoke"
ID = 1306
stateNo = 1306
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5
ignoreHitPause = 1

[State 3400,maar]
type = VarSet
trigger1 = !numtarget(3400)
trigger1 = animelemno(0)=[4,9]
var(43) = 1 - (2 * (p2dist x < 0))

[State 3400,maar]
type = VarSet
trigger1 = NumTarget(3400)
trigger1 = AnimElemNo(0) = [4,9]
var(43) = 1 - (2 * (((target(3400), pos x - pos x) * facing) < 0))

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
;persistent =

[State 3400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 19 || var(20))
trigger1 = AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger1 = var(43)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,1
guard.pauseTime = 3,1
animType = DiagUp
air.animType = DiagUp
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 10 * var(43), -5.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 10 * var(43), -5.00
air.cornerpush.veloff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1
sparkXY = -1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
P2Facing = var(43)

[State 3400, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 100
superMoveTime = 100
ignoreHitPause = 1

[State 3400, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P2
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3400, VelSet]
type = VelSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
x = -4.5
y = -3

[State 3400, StateTypeSet]
type = StateTypeSet
trigger1 = !var(42)
trigger1 = !AnimElemTime(10)
statetype = A
physics = N
movetype = I

[State 3400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0
y = .38

[State 3400, Voice 2]
type = PlaySnd
trigger1 = Time = 43
value = 1300,0
channel = 0

[State 3400, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,1
channel = 1

[State 3400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = !AnimElemTime(10)
moveType = I

[State 3400, End]
type = ChangeState
trigger1 = !var(42)
trigger1 = pos y > -vel y
value = 1301
ctrl = 0


;====<BUSHIN FUNGEKI>=
;Startup
[StateDef 3500]
type = S
physics = S
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) < 0
time = 1
value = SCA

[State 3500, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16,-79
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3500, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3500, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 10

[State 3500, HitDef]
type = HitDef
trigger1 = AnimElem = 2 && !var(38)
attr = S, HT
hitFlag = M
priority = 7, Miss
getPower = 0, 0
givePower = 0, 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
numHits = 0
p1stateno = 3510

[State 3500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 3500, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;(Success)
[StateDef 3510]
type = S
physics = S
moveType = A
anim = 3510
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3510, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3510, Width]
type = Width
trigger1 = AnimElemNo(0)=[4,8]
edge = 35,0

[State 3510, TargetState]
type = TargetState
trigger1 = !Time
value = 3530

[State 3510, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(4)
statetype = A
physics = N

[State 3510, VelSet]
type = VelSet
trigger1 = !AnimElemTime(4)
x = 3.75
y = -8.0

[State 3510, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yAccel) + .13

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-30 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(0 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3510, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,4
channel = 0

[State 3510, Grabbing Sound]
type = PlaySnd
trigger1 = !Time
value = 2,800
channel = 1

[State 3510, End]
type = ChangeState
trigger1 = AnimElemTime(4) > 0
trigger1= pos y >= 0 && vel y > 0
value = 3511
ctrl = 0


;Kage Sukui (Slam)
[StateDef 3511]
type = S
physics = S
moveType = A
anim = 3511
velSet = 0,0
sprPriority = 1

[State 3511, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3511, TargetState]
type = TargetState
trigger1 = !Time
value = 3531

[State 3511, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 3511, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3511,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3511, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(28 * fvar(11) < 7, -7, -28 * fvar(11)))
kill = 0

[State 3511, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3511, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3511, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3511, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3511, End]
type = ChangeState
trigger1 = !AnimTime
value = 3512


;Kubikari (Success)
[StateDef 3512]
type = S
physics = S
moveType = A
anim = 1109
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3512, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3512, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 3512, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 3512, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 3512, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 3512, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 860,TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,0,Mid

[State 3512, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 3512, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 3512, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,2
channel = 0

[State 3512, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 3513
ctrl = 0


;Kubikari (Slam)
[StateDef 3513]
type = S
physics = S
moveType = A
anim = 3513
velSet = 0,0
sprPriority = 1

[State 3513, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3513, TargetState]
type = TargetState
trigger1 = !Time
value = 3531

[State 3513, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 3513, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 3513, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 3513, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3513,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3513, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(35 * fvar(11) < 7, -7, -35 * fvar(11)))
kill = 0

[State 3513, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3513, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3513, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3513, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 3513, End]
type = ChangeState
trigger1 = !AnimTime
value = 3514


;Kage Sukui (Success)
[StateDef 3514]
type = S
physics = S
moveType = A
anim = 3514
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3514, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3514, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3514, Width]
type = Width
trigger1 = AnimElemNo(0)=[3,7]
edge = 35,0

[State 3514, TargetState]
type = TargetState
trigger1 = !Time
value = 1115

[State 3514, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(3)
statetype = A
physics = N

[State 3514, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = 4.965
y = -9.0

[State 3514, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yAccel) + .23

[State 3514, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3514, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3514, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-60 * const(size.yScale))

[State 3514, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3514, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3514, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 3514, End]
type = ChangeState
trigger1 = AnimElem = 3,> 0
trigger1 = Frontedgebodydist < 1
value = 3515


;Success (Wall Slam)
[StateDef 3515]
type = A
physics = N
movetype = A
anim = 3515
ctrl = 0
velset = 0,0

[State 3515, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3515, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1521

[State 3515, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3515, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3515,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3515, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3515, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3515, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3515, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3515, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3515, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3515, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3515, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(28 * fvar(11) < 7, -7, -28 * fvar(11)))
Kill = 0

[State 3515, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3515, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3515, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3515, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3515,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3516


;Success (Going Down)
[StateDef 3516]
type = A
physics = N
movetype = A
anim = 3516
ctrl = 0

[State 3516, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3516, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1522

[State 3516, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3516, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,1
channel = 0

[State 3516, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3516, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3516, Width]
type = Width
trigger1 = AnimElemNo(0) = 3
edge = 35,0

[State 3516, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
edge = 30,0

[State 3516, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3516,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3516, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-45 * const(size.yScale))

[State 3516, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0
pos = ceil(20 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3516, VelAdd]
type = VelAdd
trigger1 = 1
y = .75

[State 3516, TargetFacing]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3516, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3517


;Success (End)
[StateDef 3517]
type = S
physics = S
moveType = A
anim = 3511
velSet = 0,0
sprPriority = 1

[State 3517, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3517, TargetState]
type = TargetState
trigger1 = !Time
value = 3531

[State 3517, baandhnaa]
type = TargetBind
trigger1 = !Time
pos = 20,-20

[State 3517, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3517,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3517, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(35 * fvar(11) < 7, -7, -35 * fvar(11)))
kill = 0

[State 3517, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3517, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3517, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3517, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3517, End]
type = ChangeState
trigger1 = !AnimTime
value = 3518


;Kubikari (Success)
[StateDef 3518]
type = S
physics = S
moveType = A
anim = 3512
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3518, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3518, Width]
type = Width
trigger1 = AnimElemNo(0)=[7,8]
edge = 30,0

[State 3518, TargetState]
type = TargetState
trigger1 = !Time
value = 1117

[State 3518, StateType]
type = StateTypeSet
trigger1 = !AnimElemTime(2)
statetype = A
physics = N

[State 3518, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -5

[State 3518, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yAccel) + .15

[State 860,TargetBind]
type = BindToTarget
trigger1 = AnimElemNo(0) <= 1
pos = 0,0,Mid

[State 3518, TargetBind]
type = Null;TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 5,-35

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -10,-35

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -18,-35

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-40

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -30,-75

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 0,-100

[State 3518, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0
pos = 5,-95

[State 3518, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,3
channel = 0

[State 3518, End]
type = ChangeState
trigger1= pos y >= 0 && vel y > 0
value = 3519
ctrl = 0


;Kubikari (Slam)
[StateDef 3519]
type = S
physics = S
moveType = A
anim = 3513
velSet = 0,0
sprPriority = 1

[State 3519, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3519, TargetState]
type = TargetState
trigger1 = !Time
value = 3531

[State 3519, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -3.677
y = -4.233

[State 3519, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = const(movement.yaccel)

[State 3519, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,< 0
pos = 20,-20

[State 3519, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3519,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3519, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 0

[State 3519, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3519, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3519, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3519, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 3519, End]
type = ChangeState
trigger1 = !AnimTime
value = 3520


;Success
[StateDef 3520]
type = A
physics = N
moveType = A
anim = 3517
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3520, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3520, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,1
channel = 0

[State 3520, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3520, TargetBind]
type = TargetState
trigger1 = !Time && NumTarget
value = 3240

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -Target,const(Size.ground.Back), 0

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-30 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(0 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3520, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3520, TargetBind]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3520, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ((320-(ifelse(Facing=1,0,320)+ScreenPos X))/15)*Facing
y = -5

[State 3520, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,> 0
y = .5

[State 3520, End]
type = ChangeState
trigger1 = AnimElem = 4,> 0
trigger1 = Frontedgebodydist < 1
value = 3521


;Success (Wall Slam 1)
[StateDef 3521]
type = A
physics = N
movetype = A
anim = 3518
ctrl = 0
velset = 0,0

[State 3521, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3521, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3521, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3521, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3521,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3521, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3521, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3521, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3521, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3521, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3521, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3521, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3521, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3521, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3521, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3521, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3521, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3521, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3521, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3521, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3521,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3522


;Going into Wall Slam 2
[StateDef 3522]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3522, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3522, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3522, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3522, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3522, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3522, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3522, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3522, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3522, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3522, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3522, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3523


;Success (Wall Slam 2)
[StateDef 3523]
type = A
physics = N
movetype = A
anim = 3518
ctrl = 0
velset = 0,0

[State 3523, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3523, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3523, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3523, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3523,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3523, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3523, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3523, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3523, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3523, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3523, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3523, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3523, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3523, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3523, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3523, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3523, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3523, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3523,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3524


;Going into Wall Slam 3
[StateDef 3524]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3524, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3524, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,3
channel = 0

[State 3524, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3524, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3524, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3524, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3524, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3524, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3524, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3524, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3524, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3525


;Success (Wall Slam 3)
[StateDef 3525]
type = A
physics = N
movetype = A
anim = 3518
ctrl = 0
velset = 0,0

[State 3525, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3525, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3525, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3525, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 1
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3525,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 2
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3525, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 3
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3525, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 4
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3525, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3525, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 6
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3525, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3525, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 1
value = -1

[State 3525, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 2
value = 0

[State 3525, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3525, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3525, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3525, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3525, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3525, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3525, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3525, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3525,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3526


;Going into Wall Slam 4
[StateDef 3526]
type = A
physics = N
movetype = A
anim = 1515
ctrl = 0
velset = 14.5,-7

[State 3526, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3526, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,4
channel = 0

[State 3526, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3526, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1525

[State 3526, Width]
type = Width
trigger1 = AnimElemNo(0) = 1
edge = 20,0

[State 3526, Width]
type = Width
trigger1 = AnimElemNo(0) = 2
edge = 25,0

[State 3526, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3526, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3526, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3526, VelAdd]
type = VelAdd
trigger1 = 1
y = .5 - (Pos Y * 0.0005)

[State 3526, End]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Frontedgebodydist < 1
value = 3527


;Success (Wall Slam 4)
[StateDef 3527]
type = A
physics = N
movetype = A
anim = 3518
ctrl = 0
velset = 0,0

[State 3527, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3527, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3241

[State 3527, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8120
ID = 8120
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),-62
ownPal = 1

[State 3527, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
pos = ceil(15 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3527,TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
pos = ceil(25 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3527, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3527, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
pos = ceil(-15 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3527, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
pos = ceil(-10 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3527, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0
pos = ceil(5 * const(size.xScale)), ceil(-55 * const(size.yScale))

[State 3527, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3527, TargetFacing]
type = TargetFacing
trigger1 = AnimElem = 4
value = 1

[State 3527, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3527, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
Kill = 0

[State 3527, 2]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 3527, VelSet]
type = PosSet
trigger1 = Time = 0
x = (320-(Pos x-ScreenPos x))*Facing

[State 3527, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 3
y = -4

[State 3527, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3527, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3527,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3528


;Success (Going Down to Floor Slam)
[StateDef 3528]
type = A
physics = N
movetype = A
anim = 3519
ctrl = 0
velset = 0,0

[State 3528, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 3528, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3243

[State 3528, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 3528, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,5
channel = 0

[State 3528, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 4
value = 1,5
channel = 1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 3
value = -1

[State 210, 4]
type = SprPriority
trigger1 = AnimElemNo(0) = 4
value = 1

[State 3528, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(10 * const(size.xScale)), ceil(-65 * const(size.yScale))

[State 3528,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(20 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3528,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(10 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3528,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-25 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3528,TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0
pos = ceil(0 * const(size.xScale)), ceil(-35 * const(size.yScale))

[State 3528, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 4.4
y = -16

[State 3528, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x=0
y=8

[State 3528, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel) + .1

[State 3528, Explod]
type = Explod
trigger1 = AnimElemTime(2) > 0
trigger1 = pos y > -160
anim = 3245
ID = 3245
pos = 0,85
postype = P1
scale = 0.5, 0.5
velocity = 0,0
bindtime = 1
sprpriority = 5
ownpal = 1
supermovetime = -1
pausemovetime = -1
persistent = 0

[State 1000, 0]
type = TargetFacing
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -1

[State 3528, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3529


;Success (End)
[StateDef 3529]
type = S
physics = S
movetype = A
anim = 1513
ctrl = 0
velset = 0,0

[State 3529, NotHitBy]
type = NotHitBy
trigger1 = 1
value2 = SCA

[State 3529, TargetState]
type = TargetState
trigger1 = !Time
value = 1116

[State 3529, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,< 10
pos = 20,-20

[State 3529, VelSet]
type = VelSet
trigger1 = !AnimElemTime(3)
x = -3.677
y = -5.233

[State 3529, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .45

[State 3529, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(27 * const(size.xScale)),-5
ownPal = 1

[State 3529, EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3529, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(91 * fvar(11) < 7, -7, -91 * fvar(11)))

[State 3529, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3529, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3529, Slam Sound]
type = PlaySnd
trigger1 = !Time
value = 1100,5

[State 3529, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3529, End]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1= pos y >= 0 && vel y > 0
value = 1514


;====<BUSHIN FUNGEKI (TARGET)>=
;(Target)
[Statedef 3530]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3520, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3530

[State 3520, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0


[Statedef 3531]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3531, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3531

[State 3521, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0
