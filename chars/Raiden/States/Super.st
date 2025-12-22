; _______________________________________
;| Raiden by Knuckles8864                |
; ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ
;==
;====<SUPER STATES>====
;==

;====<CRAZY TRAIN>=
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
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
var(17) = 54

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
trigger1 = AnimElemTime(2) < 0
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
pos = 17,-127
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, UOOOOOH!]
type = PlaySnd
trigger1 = AnimElem = 2
value = 730,1
channel = 0

[State 3000, HMP!]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,0
channel = 0

[State 3000, HMMM!]
type = PlaySnd
trigger1 = AnimElem = 11
value = 4,1
channel = 0

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,1
channel = 1

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1,2
channel = 1

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 12
trigger3 = AnimElem = 16
x = 6.5

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 13
x = 20

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 97), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.86,0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 101), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3005
ctrl = 0


;End
[StateDef 3005]
type = S
physics = S
moveType = A
anim = 3005
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3005, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 1
value = SCA
time = 11

[State 3005, VelAdd]
type = VelSet
trigger1 = AnimElem = 6
x = 22

[State 3005, VelMul]
type = VelMul
trigger1 = AnimElem = 1
x = .85

[State 3005, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 3005, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3005, HitDef]
type = HitDef
trigger1 = AnimElem = 7
trigger1 = !var(16) && var(15) < 1
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
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
ground.velocity = -4.32, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -8.5
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
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3005, GO!]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,1
channel = 0

[State 3005, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5

[State 3005, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41,0

[State 3005, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 3005, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX CRAZY TRAIN>=
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
var(17) = 54

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
trigger1 = AnimElemTime(2) < 0
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
pos = 17,-127
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, UOOOOOH!]
type = PlaySnd
trigger1 = AnimElem = 2
value = 730,1
channel = 0

[State 3050, HMP!]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 25
value = 4,0
channel = 0

[State 3050, HMMM!]
type = PlaySnd
trigger1 = AnimElem = 9 || AnimElem = 31
value = 4,1
channel = 0

[State 3050, HEY!]
type = PlaySnd
trigger1 = AnimElem = 15
value = 4,2
channel = 0

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,1
channel = 1

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,3
channel = 1

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,0
channel = 1

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 24
value = 1,5

[State 3050, Woosh]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1,2
channel = 1

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem =10 || AnimElem =18 || AnimElem = 22 || AnimElem = 23 || AnimElem = 25
trigger2 = AnimElem =32 || AnimElem =33 || AnimElem = 37
x = 6.5

[State 3050, PosAdd]
type = PosAdd
trigger1 = AnimElem =11 || AnimElem =17 || AnimElem = 20 || AnimElem = 26 || AnimElem = 34
x = 20

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
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
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 97), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 11
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
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
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.12,0
ground.cornerPush.velOff = 0
guard.velocity = -3.12
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 144), var(36) := -73
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 17
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
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
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.41,0
ground.cornerPush.velOff = 0
guard.velocity = -2.41
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 75), var(36):= -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 24
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.86,0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
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
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 97), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 26
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
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
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.86,0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
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
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 33
forceNoFall = !var(20)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.86,0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 101), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 3005
ctrl = 0



;====<FLAME BREATH>=
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 1

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
trigger1 = 1
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 54

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
pos = -6,-110
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, VarSet]
type = VarSet
trigger1 = 1
var(10) = 0

[State 3100, Spit Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0
channel = 0

[State 3100, Flame Breath Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3105
name = "Flame Breath Projectile"
posType = P1
pos = ceil(123 * const(size.xScale)), ceil(-100 * const(size.yScale))
size.xScale = 0.5 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 3100, End]
type = ChangeState
trigger1 = NumHelper(3105)
trigger1 = Helper(3105), StateNo = 3107
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 1 && Time = 146
trigger3 = Time >= 146
value = 3101


;Finish
[StateDef 3101]
type = S
anim = 3101
physics = N
moveType = I
velSet = 0,0

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX FLAME BREATH>=
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 1

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
var(17) = 54

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
pos = -6,-110
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, VarSet]
type = VarSet
trigger1 = 1
var(10) = 0

[State 3150, Spit Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,0
channel = 0

[State 3150, Flame Breath Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3155
ID = 3155
name = "Flame Breath Projectile"
posType = P1
pos = ceil(123 * const(size.xScale)), ceil(-100 * const(size.yScale))
size.xScale = 0.5 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3150, End]
type = ChangeState
trigger1 = NumHelper(3155)
trigger1 = Helper(3155), StateNo = 3107
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 1 && Time = 146
trigger3 = Time >= 146
value = 3101



;====<DESTRUCTION DROP>=
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
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
var(17) = 54

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
pos = 16,-79
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

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
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 3
attr = S,HT
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
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3210, TargetBind]
type = TargetState
trigger1 = !Time
value = 1515

[State 3210,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3210,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500,0
channel = 1

[State 3210, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 0

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3210,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 3210, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 3210,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 3210, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(77 * fvar(11) < 7, -7, -77 * fvar(11)))
kill = 0

[State 3210, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 3210, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 3210, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3211
ctrl = 0


;Success (Throw)
[StateDef 3211]
type = S
physics = N
moveType = A
anim = 1506
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3211, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3211, TargetBind]
type = TargetState
trigger1 = !Time
value = 1525

[State 3211,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3211,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 3211, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 4

[State 3211, Voice]
type = PlaySnd
trigger1 = AnimElem = 7,=1
value = 1500,1
channel = 1

[State 3211, Woosh]
type = PlaySnd
trigger1 = AnimElem = 7,=1
value = 1,2
channel = 2

[State 3211, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
value = A
physics = N

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 2
y = -8-Var(11)

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 4,=2
x = 0
y = 0

[State 3211, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,< 2
trigger2 = AnimElem = 7,> 1
y = .4

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 7,=1
x = -3
y = -6

[State 3211, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3,>=0 && AnimElem = 5,<0
trigger2 = AnimElem = 6,>=0 && AnimElem = 7,<0
pos = ceil(-5 * const(size.xScale)), ceil(-150 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = AnimElem = 5,>=0 && AnimElem = 6,<0
pos = ceil(-8 * const(size.xScale)), ceil(-153 * const(size.yScale))

[State 3211, TargetBind]
type = TargetBind
trigger1 = AnimElem = 6,>=0 && AnimElem = 7,<0
pos = ceil(10 * const(size.xScale)), ceil(-130 * const(size.yScale))

[State 3211, SprPriority]
type = SprPriority
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
value = 2

[State 3211, SprPriority]
type = SprPriority
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
value = -1

[State 3211,TargetBind]
type = TargetState
trigger1 = AnimElem = 8
value = 1526

[State 3211, HitAdd]
type = HitAdd
trigger1 = Target,StateNo = 5100
value = 1
persistent = 0

[State 3211, ChangeState]
type = ChangeState
trigger1 = AnimElem = 7,>=0
value = 3212
ctrl = 0


[Statedef 3212]
type = A
movetype = A
physics = N
poweradd= 0
anim = 3210
ctrl = 0
velset = 0,0
SprPriority = 2

[State 3212, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3212, VelAdd]
type = VelAdd
triggerall = AnimElem = 1 > 1
trigger1 = AnimElem = 1,!=4
trigger2 = AnimElem = 2,!=0
trigger3 = AnimElem = 2,!=1
trigger4 = AnimElem = 2,!=3
trigger5 = AnimElem = 2,!=5
trigger6 = AnimElem = 2,!=7
y = .5

[State 3212, PosFreeze]
type = PosFreeze
trigger1 = AnimElem = 1,=4
trigger2 = AnimElem = 2,=0
trigger3 = AnimElem = 2,=1
trigger4 = AnimElem = 2,=3
trigger5 = AnimElem = 2,=5
trigger6 = AnimElem = 2,=7

[State 3212, VelSet]
type = VelSet
trigger1 = AnimElem = 1,=1
x = 5
y = -2.5

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=0 && AnimElem = 1,<1
pos = ceil(35 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=1 && AnimElem = 1,<2
pos = ceil(28 * const(size.xScale)), ceil(-106 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=2 && AnimElem = 1,<3
pos = ceil(21 * const(size.xScale)), ceil(-102 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=3 && AnimElem = 1,<4
pos = ceil(14 * const(size.xScale)), ceil(-98 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=4 && AnimElem = 1,<5
pos = ceil(7 * const(size.xScale)), ceil(-94 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=5 && AnimElem = 2,<1
pos = ceil(0 * const(size.xScale)), ceil(-90 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=1 && AnimElem = 2,<2
pos = ceil(-7 * const(size.xScale)), ceil(-86 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=2 && AnimElem = 2,<3
pos = ceil(-14 * const(size.xScale)), ceil(-82 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=3 && AnimElem = 2,<4
pos = ceil(-21 * const(size.xScale)), ceil(-78 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=4 && AnimElem = 2,<5
pos = ceil(-28 * const(size.xScale)), ceil(-74 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=5 && AnimElem = 4,<0
pos = ceil(-30 * const(size.xScale)), ceil(-70 * const(size.yScale))

[State 3212, TargetBind]
type = TargetBind
trigger1 = AnimElem = 4,>=0
pos = ceil(-35 * const(size.xScale)), ceil(-30 * const(size.yScale))

[State 3212, TargetBind]
type = TargetState
trigger1 = AnimElem = 1,=2
value = 3230

[State 3212, TargetState]
type = TargetState
trigger1 = AnimElem = 2,=5
value = 3231

[State 3212, TDHE END!]
type = PlaySnd
trigger1 = AnimElem = 1,=1
value = 3200,0

[State 3212, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3213


;Success Landing
[Statedef 3213]
type = S
physics = S
moveType = I
anim = 3211
ctrl = 0
velSet = 0,0

[State 3213, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3213, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3231

[State 3213, Slam Sound]
type = PlaySnd
trigger1 = Time = 0
value = 810,0

[State 3211, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3213, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(10 * const(size.xScale)),ceil(20 * const(size.yScale))
ownPal = 1

[State 3213, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3213,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 3213, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(147 * fvar(11) < 7, -7, -147 * fvar(11)))

[State 3213, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3210, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3012,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>=0 && AnimElem = 2,<0
pos = ceil(-35 * const(size.xScale)), ceil(-5 * const(size.yScale))

[State 3012,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2,>=0 && AnimElem = 4,<0
pos = ceil(-35 * const(size.xScale)), ceil(-5 * const(size.yScale))

[State 3213,TargetBind]
type = TargetState
trigger1 = AnimElem = 4,=0
value = 3232

[State 3213, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Target
[Statedef 3230]
type = A
movetype = H
physics = N
ctrl = 0

[State 3230, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1320

[State 3230, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .4

[State 3230, Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3230, SelfState]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100


;Target
[Statedef 3231]
type = A
movetype = H
physics = N
ctrl = 0

[State 3231, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3231, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1321



;Target Release
[Statedef 3232]
type = A
movetype = H
physics = N
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1321, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 1321

[State 1321, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 1321, VelSet]
type = VelSet
trigger1 = !Time
x = 4.0
y = -9.9

[State 1321,Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1321,SelfState]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100




;====<MAX DESTRUCTION DROP>=
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
var(17) = 54

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
ID = 8500
name = "Superpause FX"
posType = P1
pos = 16,-79
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 3250, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3250, HitDef]
type = HitDef
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 3
attr = S,HT
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
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3260, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3260, TargetBind]
type = TargetState
trigger1 = !Time
value = 1515

[State 3260,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3260,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 3260, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500,0
channel = 1

[State 3260, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 2

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3260,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 3260, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 3260,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 3260, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 3260, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 3260, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 3260, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3261
ctrl = 0


;Success
[StateDef 3261]
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3261, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3261, TargetBind]
type = TargetState
trigger1 = !Time
value = 1516

[State 3261,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3261,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 3261, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 2

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65 * const(size.xScale)), ceil(-50 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3261,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 3261, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 3261,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 3261, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 3261, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 3261, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 3261, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3262
ctrl = 0


;Success
[StateDef 3262]
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3262, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3262, TargetBind]
type = TargetState
trigger1 = !Time
value = 1516

[State 3262,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3262,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 3262, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 2

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65 * const(size.xScale)), ceil(-50 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3262,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 3262, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 3262,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 3262, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 3262, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 3262, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 3262, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3211
ctrl = 0



;====<RAIDEN BOMBER>=
[StateDef 3300]
type = S
physics = S
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
trigger1= AnimElemTime(17) < 0
time = 1
value = SCA

[State 3300, PlayerPush]
type = PlayerPush
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType = A || EnemyNear, StateType = L
value = 0
ignoreHitPause = 1

[State 3300, Super Pause FX]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 5, -88
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 56
moveTime = 56
p2DefMul = 1
unHittable = 1
anim = -1
;sound = s8500,0
darken = 0

[State 3300, Super Pause Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 8500,0
channel = 2

[State 3300, Electric Part 1]
type = Explod
trigger1 = AnimElem = 6
anim = 3304
sprPriority = 5
posType = P1
pos = -35, -93
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Electric Part 2]
type = Explod
trigger1 = AnimElem = 7
anim = 3305
ID = 3305
sprPriority = 5
posType = P1
pos = -27, -53
pauseMoveTime = -1
superMoveTime = -1
removeTime = 40
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 3305
pos = -36, 8
posType = P1

[State 3300, Electric Part 3]
type = Explod
trigger1 = AnimElem = 11
anim = 3306
ID = 3306
sprPriority = 5
posType = P1
pos = -8, 3
pauseMoveTime = -1
superMoveTime = -1
removeTime = 25
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 12
ID = 3306
pos = -16, -9
posType = P1

[State 3300, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 13
ID = 3306
pos = -20, 12
posType = P1

[State 3300, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 14
ID = 3306

[State 3300, Electric Part 4]
type = Explod
trigger1 = AnimElem = 14
anim = 3306
ID = 3307
sprPriority = 5
posType = P1
pos = -32, 10
pauseMoveTime = -1
superMoveTime = -1
removeTime = 25
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 15
ID = 3307
pos = -22, -15
posType = P1

[State 3300, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 16
ID = 3307

[State 3300, Electric Part 4]
type = Explod
trigger1 = AnimElem = 16
anim = 3307
ID = 3308
sprPriority = 5
posType = P1
pos = 52, -23
pauseMoveTime = -1
superMoveTime = -1
removeTime = 8
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Electric Part 4]
type = Explod
trigger1 = AnimElem = 17
anim = 3308
ID = 3309
sprPriority = 5
posType = P1
pos = 60, -28
pauseMoveTime = -1
superMoveTime = -1
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, RemoveExplod]
type = RemoveExplod
trigger1 = MoveHit
ID = 3308

[State 3300, Arm]
type = Explod
trigger1 = AnimElem = 16
anim = 3301
ID = 3301
sprPriority = 4
posType = P1
pos = 0,0
pauseMoveTime = -1
superMoveTime = -1
removeTime = 8
bindtime = 999
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, *Random Heroic Sounding Quote*!]
type = PlaySnd
trigger1 = Time = 3
value = 3300, ifElse(Random < 500, 0, 1)
channel = 0

[State 3300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,5
channel = 1

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(17) < 0
x = 4

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
x = 0

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 16
ID = 3300
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 385 < 7, 7, fvar(11) * 385)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 30
envShake.ampl = 6
envShake.freq = 120

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = MoveHit
value = 3310

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3310]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
anim = 3310

[State 3310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3310, TargetBind]
type = TargetState
trigger1 = !Time
value = 3315

[State 3310, TargetBind]
type = TargetState
trigger1 = AnimElem = 2
value = 3316

[State 3310,TargetBind]
type = TargetBind
trigger1 = !Time
pos = ceil(60 * const(size.xScale)), ceil(-94 * const(size.yScale))

[State 3300, NotHitBy]
type = NotHitBy
trigger1= AnimElemTime(2) < 0
time = 1
value = SCA

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 2

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 0

[State 3310,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 3300, Arm]
type = Explod
trigger1 = AnimElem = 1
anim = 3301
ID = 3301
sprPriority = 4
posType = P1
pos = 0,0
pauseMoveTime = -1
superMoveTime = -1
removeTime = 32
bindtime = 999
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Electricity]
type = Explod
trigger1 = !Time
anim = 3307
ID = 3307
sprPriority = 5
posType = P1
pos = 52, -23
pauseMoveTime = -1
superMoveTime = -1
removeTime = 32
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Electricity (End)]
type = Explod
trigger1 = AnimElem = 2
anim = 3308
ID = 3308
sprPriority = 5
posType = P1
pos = 60, -28
pauseMoveTime = -1
superMoveTime = -1
bindtime = 999
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

;[State 3300, Electricity]
;type = Explod
;trigger1 = AnimElem = 1
;anim = 3309
;ID = 3309
;sprPriority = 3
;posType = P1
;pos = 60, -84
;pauseMoveTime = -1
;superMoveTime = -1
;removeTime = 15
;bindtime = 999
;scale = 0.5,0.5
;ownPal = 1
;removeOnGetHit = 1
;ignoreHitPause = 0

[State 3310, *Random Heroic Sounding Quote*!]
type = PlaySnd
trigger1 = !Time
value = 3300, ifElse(Random < 500, 2, 3)
channel = 0

[State 3310, *Crowd Cheering*!]
type = PlaySnd
trigger1 = !Time
value = 3310, (Random % 3)
channel = 1

[State 3310, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<RAIDEN BOMBER (TARGET)>=
;Target
[StateDef 3315]
type = A
moveType = H
physics = N
SprPriority = 3

[State 3315, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3315, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3315

[State 3315, ChangeState]
type = SelfState
trigger1 = Time = 32
value = 3316


;Target
[StateDef 3316]
type = A
movetype = H
physics = N
SprPriority = 1

[State 3316, VelSet]
type = VelSet
trigger1 = Time = 0
x = 4.5
y = -6

[State 3316, VelAdd]
type = VelAdd
trigger1 = 1
y = .58

[State 3316, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3316

[State 3316, AngleDraw]
type = AngleDraw
trigger1 = animelem = 2,>= 0

[State 3316, AngleDraw]
type = AngleAdd
trigger1 = animelem = 2,>= 0
value = 30

[State 3316, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel Y > 0) && (Pos Y >= 0)
value = 5100
