; _________________________________________
;| Chun-Li by Jmorphman                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<KIKOSHO>=
[StateDef 3000]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = !var(10)
value = ifElse(var(40) && !var(1), 3001, 3000)

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !var(10)
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !var(10)
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !var(10)
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = var(10) = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = var(10) = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(var(40) && !var(1), 68, 43)

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(10) % 2) && var(10) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !var(10)
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = var(10) = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(1) = 28 && var(40) && !var(1)
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -28,-108
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = var(10) = 3
time = ifElse(var(40) && !var(1), 68, 43)
moveTime = ifElse(var(40) && !var(1), 68, 43)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3000, Super Pause Sound]
type = PlaySnd
trigger1 = var(10) = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(1) = 28 && var(40) && !var(1)
value = 8500,0

[State 3000, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) = 1
value = 3000,10
channel = 1

[State 3000, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5 && var(40) = 1
anim = 6005
posType = P1
pos = 3, -95
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Voice 1]
type = PlaySnd
trigger1 = var(10) = 3
value = 730,1
channel = 0

[State 3000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3000,0
channel = 0

[State 3000, Kikosho sound effect]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 3

[State 3050, Kikosho effect]
type = Explod
trigger1 = AnimElem = 11
ID = 3005
anim = 3005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
ignoreHitPause = 0

[State 3000, Projectile Shield]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 3004
ID = 3004
name = "Kikosho Projectile Shield"
posType = P1
pos = 72, -58
ownPal = 1

[State 3000, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3000, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3000

[State 3000, Miss]
type = HitDef
trigger1 = 1
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(12) = 0
value = 30,0

[State 3000, Hits 1-3]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 12 || AnimElem = 14 || AnimElem = 16
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25,0
ground.cornerPush.velOff = 0
guard.velocity = -1.25
guard.cornerPush.velOff = 0
air.velocity = -1.25, -0.703125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Hits 4-5]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 =  AnimElem = 18 || AnimElem = 20
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25, -2.8125
ground.cornerPush.velOff = 0
guard.velocity = -1.25
guard.cornerPush.velOff = 0
air.velocity = -1.25, -1.40625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 22
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.75, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -8.75
guard.cornerPush.velOff = 0
air.velocity = -8.75, -7.1875
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(24) >= 0
moveType = I

[State 3000, Timer]
type = VarAdd
trigger1 = 1
var(10) = 1
ignoreHitPause = 1

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX KIKOSHO>=
[StateDef 3050]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, ChangeAnim]
type = ChangeAnim
trigger1 = !var(10)
value = ifElse(var(40) && !var(1), 3051, 3050)

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !var(10)
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !var(10)
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !var(10)
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = var(10) = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = var(10) = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(var(40) && !var(1), 70, 45)

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(10) % 2) && var(10) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !var(10)
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
trigger1 = var(10) = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(1) = 28 && var(40) && !var(1)
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -28,-108
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = var(10) = 3
time = ifElse(var(40) && !var(1), 70, 45)
moveTime = ifElse(var(40) && !var(1), 70, 45)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3050, Super Pause Sound]
type = PlaySnd
trigger1 = var(10) = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(1) = 28 && var(40) && !var(1)
value = 8500,0

[State 3050, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) = 1
value = 3000,10
channel = 1

[State 3050, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5 && var(40) = 1
anim = 6005
posType = P1
pos = 3, -95
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Voice 1]
type = PlaySnd
trigger1 = var(10) = 3
value = 730,1
channel = 0

[State 3050, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3000,0
channel = 0

[State 3050, Kikosho sound effect]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 3

[State 3050, Kikosho effect]
type = Explod
trigger1 = AnimElem = 11
ID = 3005
anim = 3055
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
superMoveTime = 1
ignoreHitPause = 0

[State 3050, Projectile Shield]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 3004
ID = 3004
name = "Kikosho Projectile Shield"
posType = P1
pos = 72, -58
superMoveTime = 1
ownPal = 1

[State 3050, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3050, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3050

[State 3050, Miss]
type = HitDef
trigger1 = 1
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(12) = 0
value = 30,0

[State 3050, Hits 1-6]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 12 || AnimElem = 14 || AnimElem = 16 || AnimElem = 18 || AnimElem = 20 || AnimElem = 22
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(AnimElemTime(14) < 0, 28, 21) < 7, 7, fvar(11) * ifElse(AnimElemTime(14) < 0, 28, 21))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25,0
ground.cornerPush.velOff = 0
guard.velocity = -1.25
guard.cornerPush.velOff = 0
air.velocity = -1.25, -0.703125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hits 7-11]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 24 || AnimElem = 26 || AnimElem = 28 || AnimElem = 30 || AnimElem = 32
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.25, -2.8125
ground.cornerPush.velOff = 0
guard.velocity = -1.25
guard.cornerPush.velOff = 0
air.velocity = -1.25, -1.40625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 34
attr = S, HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.75, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -8.75
guard.cornerPush.velOff = 0
air.velocity = -8.75, -7.1875
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -63
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(36) >= 0
moveType = I

[State 3050, Timer]
type = VarAdd
trigger1 = 1
var(10) = 1
ignoreHitPause = 1

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<HOYOKUSEN>=
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
pos = 31,-15
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, Width]
type = Width
trigger1 = !Time
player = 32,0

[State 3100, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
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

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 730,1
channel = 0

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 30

[State 3100, Dash sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3100,1
channel = 1

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hoyokusen Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 19

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 15

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 5

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 2

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 10
trigger3 = AnimElem = 13
trigger4 = AnimElem = 16
trigger5 = AnimElem = 22
trigger6 = AnimElem = 25
trigger7 = AnimElem = 28
trigger8 = AnimElem = 31
value = 1,5

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
x = 32

[State 3100, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 36
value = 4,3
channel = 0

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(36) = -1
player = 12,12

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 36
x = 13

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 37
value = 1,5
channel = 1

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(37) = -1
player = 24,24

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 37
x = 18

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(38) = -1
player = 32,32

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 38
x = 33

[State 3100, Spark XY]
type = Null
trigger1 = AnimElem = 8 || AnimElem = 23
trigger1 = var(35) := 56 || var(36) := -100
trigger2 = AnimElem = 11 || AnimElem = 26
trigger2 = var(35) := 66 || var(36) := -65
trigger3 = AnimElem = 14 || AnimElem = 29
trigger3 = var(35) := 64 || var(36) := -84
trigger4 = AnimElem = 17 || AnimElem = 32
trigger4 = var(35) := 59 || var(36) := -44

[State 3100, Hit Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 11 || AnimElem = 17 || AnimElem = 26 || AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
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

[State 3100, Hit High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 23 || AnimElem = 29
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, MoveHitReset]
type = MoveHitReset
trigger1 = AnimElem = 38
ignoreHitPause = 1

[State 3100, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 38
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
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
ground.velocity = -2.5, -10.25;-2.5, -7.96875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.25;-2.5, -7.96875
air.cornerPush.velOff = 0
yAccel = 0.5859375;0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = -1

[State 3100, Followup Detection On]
type = VarSet
trigger1 = MoveHit = 1 && AnimElemTime(38) >= 0
var(14) = 0

[State 3100, High Jump Cancel]
type = VarSet
triggerAll = !var(14)
trigger1 = !AILevel && MoveHit
;command = "highjump"
trigger1 = NumExplod(90000408)
trigger2 = AILevel && (MoveHit && Random < 500)
var(14) = 3101

[State 3100, Followup]
type = ChangeState
trigger1 = var(14) > 0
trigger1 = AnimElemTime(38) >= 1 && AnimElemTime(42) < 0
value = var(14)

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(42) >= 0
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;High Jump cancel
[StateDef 3101]
type = S
physics = S
moveType = I
anim = 40
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3101, Juggle Reset]
type = VarSet
trigger1 = !Time
var(15) = 0

[State 3101, High Jump Cancel Flag On]
type = VarSet
trigger1 = !Time
var(43) = 1

[State 3101, Direction]
type = VarSet
trigger1 = !AILevel
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 3101, Direction (Reversed Commands)]
type = VarSet
trigger1 = !AILevel
trigger1 = NumExplod(94646464) || NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdback", 1, ifElse(command = "holdfwd", -1, sysvar(1))))

[State 3101, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 3101, High Jump]
type = VarSet
trigger1 = !Time
var(3) = 3

[State 3101, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 41,0

[State 3101, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3101, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), ifElse(sysvar(1) = 1, -13.046875, -13.4375))

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1



;====<MAX HOYOKUSEN>=
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
trigger1 = Time = 3
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
pos = 31,-15
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, Width]
type = Width
trigger1 = !Time
player = 32,0

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

[State 3150, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 730,1
channel = 0

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 30

[State 3150, Dash sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3100,1
channel = 1

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hoyokusen Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 19

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 15

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 5

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 2

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 10
trigger3 = AnimElem = 13
trigger4 = AnimElem = 16
trigger5 = AnimElem = 19
trigger6 = AnimElem = 22
trigger7 = AnimElem = 25
trigger8 = AnimElem = 28
trigger9 = AnimElem = 34
trigger10 = AnimElem = 37
trigger11 = AnimElem = 40
trigger12 = AnimElem = 43
trigger13 = AnimElem = 46
trigger14 = AnimElem = 49
trigger15 = AnimElem = 52
trigger16 = AnimElem = 55
value = 1,5

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 32
x = 32

[State 3150, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 60
value = 4,3
channel = 0

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(60) = -1
player = 12,12

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 60
x = 13

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 61
value = 1,5
channel = 1

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(61) = -1
player = 24,24

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 61
x = 18

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(62) = -1
player = 32,32

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 62
x = 33

[State 3150, Spark XY]
type = Null
trigger1 = AnimElem = 8 || AnimElem = 20 || AnimElem = 35 || AnimElem = 47
trigger1 = var(35) := 56 || var(36) := -100
trigger2 = AnimElem = 11 || AnimElem = 23 || AnimElem = 38 || AnimElem = 50
trigger2 = var(35) := 66 || var(36) := -65
trigger3 = AnimElem = 14 || AnimElem = 26 || AnimElem = 41 || AnimElem = 53
trigger3 = var(35) := 64 || var(36) := -84
trigger4 = AnimElem = 17 || AnimElem = 29 || AnimElem = 44 || AnimElem = 56
trigger4 = var(35) := 59 || var(36) := -44

[State 3150, Hit Low]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 11 || AnimElem = 17 || AnimElem = 23 || AnimElem = 29
trigger2 = AnimElem = 38 || AnimElem = 44 || AnimElem = 50 || AnimElem = 56
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Hit High]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 20 || AnimElem = 26
trigger2 = AnimElem = 35 || AnimElem = 41 || AnimElem = 47 || AnimElem = 53
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, PosAdd]
type = MoveHitReset
trigger1 = AnimElem = 62
ignoreHitPause = 1

[State 3150, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 62
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
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
ground.velocity = -2.5, -14.25;-2.5, -11.25
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -14.25;-2.5, -11.25
air.cornerPush.velOff = 0
yAccel = 0.7859375;0.5859375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = -1

[State 3150, Followup Detection On]
type = VarSet
trigger1 = MoveHit = 1 && AnimElemTime(62) >= 0
var(14) = 0

[State 3150, High Jump Cancel]
type = VarSet
triggerAll = !var(14)
trigger1 = !AILevel && MoveHit
;command = "highjump"
trigger1 = NumExplod(90000408)
trigger2 = AILevel && (MoveHit && EnemyNear, StateType = A)
var(14) = 3101

[State 3150, Followup]
type = ChangeState
trigger1 = var(14) > 0
trigger1 = AnimElemTime(62) >= 1 && AnimElemTime(66) < 0
value = var(14)

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(66) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<TENSEIRANKA>=
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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 11,-67
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Super Pause]
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
value = 730,1
channel = 0

[State 3200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 1

[State 3200, Spinning Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,0
channel = 3

[State 3200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tenseiranka Dust"
posType = P1
ownPal = 1

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0.5
y = -9.1875

[State 3200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 1.0625

[State 3200, Tenseiranka FX (Bottom Layer)]
type = Explod
trigger1 = AnimElem = 4
ID = 3204
anim = 3204
bindTime = -1
sprPriority = 0
posType = P1
scale = 0.5,0.5
superMoveTime = 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3200, Tenseiranka FX (Top Layer)]
type = Explod
trigger1 = AnimElem = 4
ID = 3205
anim = 3205
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
superMoveTime = 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3200, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 15
ID = 3204
postype = P1
pos = 5,5

[State 3200, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 15
ID = 3205
postype = P1
pos = 5,5

[State 3200, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 16
ID = 3204
postype = P1
pos = 0,5

[State 3200, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 16
ID = 3205
postype = P1
pos = 0,5

[State 3200, Tenseiranka Overlay FX]
type = Explod
trigger1 = AnimElem = 14
anim = 3203
bindTime = -1
sprPriority = 4
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3200, Hits Going Up]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 4 || AnimElem = 8 || AnimElem = 12
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -5.59375
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 0, -5.59375
air.cornerPush.velOff = 0
yAccel = 0.5625
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Spark XY]
type = Null
trigger1 = AnimElem = 14
trigger1 = var(35) := 32 || var(36) := -94
trigger2 = AnimElem = 15
trigger2 = var(35) := 44 || var(36) := -66
trigger3 = AnimElem = 16
trigger3 = var(35) := 32 || var(36) := -38

[State 3200, Hits Going Down]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 0,10
air.cornerPush.velOff = 0
yAccel = 0.40625
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3201


;Landing
[StateDef 3201]
type = S
anim = 3201
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3201, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 3201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3201, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 3200,1
channel = 4

[State 3201, EnvShake]
type = EnvShake
trigger1 = !Time
time = 18
ampl = 6
freq = 120
ignoreHitPause = 1

[State 3201, Energy Pillar Sound]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 5

[State 3201, Energy Pillar effect]
type = Explod
trigger1 = !Time
anim = 3206
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.3,0.36
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3201, EnvShake]
type = EnvShake
trigger1 = !Time
time = 22
ampl = 8
freq = 120
ignoreHitPause = 1

[State 3201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 1
ID = 3201
attr = C, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 147 < 7, 7, fvar(11) * 147)), 7
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = 0, 14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 74), var(36) := ceil(P2Dist y);-36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) <= 0
value = 3201
elem = 2
ignoreHitPause = 1

[State 3201, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3201) > 1
ID = 3201
keepOne = 1
excludeID = 3201
ignoreHitPause = 1

[State 3201, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3201)
trigger1 = !(Target(3201), Time)
value = ifElse(Target(3201), StateType = A, 5425, 5420)
ID = 3201
ignoreHitPause = 1

[State 3201, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX TENSEIRANKA>=
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
trigger1 = AnimElemTime(14) < 0
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
pos = 11,-67
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, Super Pause]
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
value = 730,1
channel = 0

[State 3250, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 1

[State 3250, Spinning Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,0
channel = 3

[State 3250, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3250, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tenseiranka Dust"
posType = P1
ownPal = 1

[State 3250, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0.5
y = -13.4375

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 1.0625

[State 3250, Tenseiranka FX (Bottom Layer)]
type = Explod
trigger1 = AnimElem = 4
ID = 3254
anim = 3204
bindTime = -1
sprPriority = 0
posType = P1
scale = 0.5,0.5
superMoveTime = 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3250, Tenseiranka FX (Top Layer)]
type = Explod
trigger1 = AnimElem = 4
ID = 3255
anim = 3255
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
superMoveTime = 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3250, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 15
ID = 3254
postype = P1
pos = 5,5

[State 3250, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 15
ID = 3255
postype = P1
pos = 5,5

[State 3250, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 16
ID = 3254
postype = P1
pos = 0,5

[State 3250, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 16
ID = 3255
postype = P1
pos = 0,5

[State 3250, Tenseiranka Overlay FX]
type = Explod
trigger1 = AnimElem = 14
anim = 3203
bindTime = -1
sprPriority = 4
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3250, Hits Going Up]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 4 || AnimElem = 6 || AnimElem = 8 || AnimElem = 10 || AnimElem = 12
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.84375
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 0, -9.84375
air.cornerPush.velOff = 0
yAccel = 0.5625
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Spark XY]
type = Null
trigger1 = AnimElem = 14
trigger1 = var(35) := 32 || var(36) := -94
trigger2 = AnimElem = 15
trigger2 = var(35) := 44 || var(36) := -66
trigger3 = AnimElem = 16
trigger3 = var(35) := 32 || var(36) := -38

[State 3250, Hits Going Down]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14 || AnimElem = 15 || AnimElem = 16
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,5
guard.pauseTime = 5,5
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 0,6
air.cornerPush.velOff = 0
yAccel = 0.40625
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3201



;====<HOSENKA>=
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
trigger1 = AnimElemTime(13) < 0
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
pos = -16,-25
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Width]
type = Width
trigger1 = !Time
player = 32,0

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
value = 3100,0
channel = 0

[State 3300, Dash sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3100,1
channel = 1

[State 3300, Dust Helper]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hosenka Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 32

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 12.5

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3300,0
channel = 0

[State 3300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 12
trigger2 = AnimElem = 20
trigger3 = AnimElem = 23
trigger4 = AnimElem = 26
trigger5 = AnimElem = 29
trigger6 = AnimElem = 32
trigger7 = AnimElem = 35
trigger8 = AnimElem = 38
value = 1,5

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 17
x = 13

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
x = 18

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 19
x = 5

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
x = 2

[State 3300, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 21
trigger2 = AnimElem = 27
trigger3 = AnimElem = 33
trigger4 = AnimElem = 39
value = 4,2
channel = 0

[State 3300, Voice 4]
type = PlaySnd
trigger1 = AnimElem = 44
value = 4,3
channel = 0

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 44
x = 13

[State 3300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 45
value = 1,5
channel = 1

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 45
x = 18

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 46
x = 33

[State 3300, First Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Spark XY]
type = Null
trigger1 = AnimElem = 21 || AnimElem = 33
trigger1 = var(35) := 56 || var(36) := -100
trigger2 = AnimElem = 24 || AnimElem = 36
trigger2 = var(35) := 66 || var(36) := -65
trigger3 = AnimElem = 27 || AnimElem = 39
trigger3 = var(35) := 64 || var(36) := -84
trigger4 = AnimElem = 30
trigger4 = var(35) := 59 || var(36) := -44

[State 3300, Hit Low]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 24 || AnimElem = 30 || AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Hit High]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 21 || AnimElem = 27 || AnimElem = 33 || AnimElem = 39
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 24
ground.slideTime = 24
guard.hitTime = 24
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
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
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 46
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 0, -11
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -11
air.cornerPush.velOff = 0
yAccel = 0.5859375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = MoveHit && Target, Alive
value = 3310

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(50) >= 0
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3310]
type = S
anim = 3310
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3310, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 3310, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hosenka Finish Dust"
posType = P1
ownPal = 1

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = -7

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0 && AnimElemTime(60) < 0 && vel y < 0
y = 0.2

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElemTime(7) > 0 && AnimElemTime(60) < 0 && vel y > 0
y = 0

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(60) > 0
y = 0.08

[State 3310, Step sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,0
channel = 1

[State 3310, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 730,1
channel = 0

[State 3310, Tornado sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3300,1
channel = 3

[State 3310, Tornado]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3315
ID = 1005
name = "Hosenka Tornado Helper"
posType = P1
pos = 0,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3310, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 13
trigger3 = AnimElem = 17
trigger4 = AnimElem = 21
trigger5 = AnimElem = 25
trigger6 = AnimElem = 29
trigger7 = AnimElem = 33
trigger8 = AnimElem = 37
trigger9 = AnimElem = 41
trigger10 = AnimElem = 45
trigger11 = AnimElem = 49
value = 1,5

[State 3310, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 55
value = 4,3
channel = 0

[State 3310, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 55
value = 1,5
channel = 1

[State 3310, Spinning Bird Kick Hits (Opponent in Front)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = P2Dist x >= 0
trigger1 = AnimElem = 10 || AnimElem = 14 || AnimElem = 18 || AnimElem = 22 || AnimElem = 26 || AnimElem = 30 || AnimElem = 34 || AnimElem = 38 || AnimElem = 42 || AnimElem = 46; || AnimElem = 50
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = (P2Dist x + 45) / 5, ifElse(AnimElemTime(30) >= 0, -1, vel y + 0.75)
ground.cornerPush.velOff = 0
guard.velocity = -5.25
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x + 25) / 5, ifElse(AnimElemTime(30) >= 0, -1, vel y + 0.75)
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.2
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1
kill = 0

[State 3310, Spinning Bird Kick Hits (Opponent in Back)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = P2Dist x < 0
trigger1 = AnimElem = 10 || AnimElem = 14 || AnimElem = 18 || AnimElem = 22 || AnimElem = 26 || AnimElem = 30 || AnimElem = 34 || AnimElem = 38 || AnimElem = 42 || AnimElem = 46
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = (P2Dist x - 45) / 5, ifElse(AnimElemTime(30) >= 0, -1, vel y + 0.75)
ground.cornerPush.velOff = 0
guard.velocity = -5.25
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x - 25) / 5, ifElse(AnimElemTime(30) >= 0, -1, vel y + 0.75)
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.2
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = -1
kill = 0

[State 3310, Final Spinning Bird Kick Hit (Opponent in Front)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = P2Dist x >= 0
trigger1 = AnimElem = 50
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = 1, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -5.25
guard.cornerPush.velOff = 0
air.velocity = 1, -8.25
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1
kill = 0

[State 3310, Final Spinning Bird Kick Hit (Opponent in Back)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = P2Dist x < 0
trigger1 = AnimElem = 50
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = -1, -8.25
ground.cornerPush.velOff = 0
guard.velocity = -5.25
guard.cornerPush.velOff = 0
air.velocity = -1, -8.25
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -66), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = -1
kill = 0

[State 3310, Final Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount))
trigger1 = AnimElem = 55
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -1.25, -6.25
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -6.25
air.cornerPush.velOff = 0
yAccel = 0.25
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -7), var(36) := -143
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3310, Hit Sound]
type = PlaySnd
trigger1 = MoveHit = 1 && HitPauseTime = 12
value = 2, 3300
channel = 3
ignoreHitPause = 1

[State 3310, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(56) >= 0
moveType = I

[State 3310, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3311


;Landing
[StateDef 3311]
type = S
anim = 3311
physics = N
moveType = I
velSet = 0,0

[State 3311, EX Flash off]
type = VarSet
trigger1 = !Time
var(25) = 0

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
channel = 1

[State 3311, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SENRETSUKYAKU>=
[StateDef 3400]
type = S
physics = N
moveType = A
anim = ifElse(!var(1), 3401, 3400)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(!var(1), 54, 43)

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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(2) = 11 && !var(1)
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 31,-15
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3400, Width]
type = Width
trigger1 = !Time
player = 32,0

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = ifElse(!var(1), 54, 43)
moveTime = ifElse(!var(1), 54, 43)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3400, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(2) = 11 && var(40) && !var(1)
value = 8500,0

[State 3400, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,10
channel = 1

[State 3400, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 6005
posType = p1
pos = 11, -77
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3400, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3400, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3400,0
channel = 0

[State 3400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 13
trigger3 = AnimElem = 16
trigger4 = AnimElem = 19
trigger5 = AnimElem = 22
value = 1,5

[State 3400, Dash sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,1
channel = 3

[State 3400, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Senretsukyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 5.90144

[State 3400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0 && AnimElemTime(10) < 0
x = -0.48828125

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 12.5

[State 3400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0 && vel x > 0
x = -0.5859375

[State 3400, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3400, First Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.52,0
ground.cornerPush.velOff = 0
guard.velocity = -5.52
guard.cornerPush.velOff = 0
air.velocity = -0.75, -2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Spark XY]
type = Null
trigger1 = AnimElem = 14
trigger1 = var(35) := 56 || var(36) := -100
trigger2 = AnimElem = 17
trigger2 = var(35) := 66 || var(36) := -65
trigger3 = AnimElem = 20
trigger3 = var(35) := 64 || var(36) := -84
trigger4 = AnimElem = 23
trigger4 = var(35) := 59 || var(36) := -44

[State 3400, Hit Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -vel x, 0
ground.cornerPush.velOff = 0
guard.velocity = -vel x
guard.cornerPush.velOff = 0
air.velocity = -0.75, -2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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

[State 3400, Hit High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14 || AnimElem = 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -vel x, 0
ground.cornerPush.velOff = 0
guard.velocity = -vel x
guard.cornerPush.velOff = 0
air.velocity = -0.75, -2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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

[State 3400, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -5, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -7.1875
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(24) >= 0
moveType = I

[State 3400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SENRETSUKYAKU>=
[StateDef 3450]
type = S
physics = N
moveType = A
anim = ifElse(!var(1), 3451, 3450)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3450, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3450, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3450, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(!var(1), 56, 45)

[State 3450, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3450, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3450, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(2) = 11 && !var(1)
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 31,-15
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3450, Width]
type = Width
trigger1 = !Time
player = 32,0

[State 3450, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = ifElse(!var(1), 56, 45)
moveTime = ifElse(!var(1), 56, 45)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3450, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(2) = 11 && var(40) && !var(1)
value = 8500,0

[State 3450, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,10
channel = 1

[State 3450, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 6005
posType = p1
pos = 11, -77
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3450, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3450, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3400,0
channel = 0

[State 3450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 13
trigger3 = AnimElem = 16
trigger4 = AnimElem = 19
trigger5 = AnimElem = 22
trigger6 = AnimElem = 25
trigger7 = AnimElem = 28
trigger8 = AnimElem = 31
value = 1,5

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 32

[State 3450, Dash sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,1
channel = 3

[State 3450, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Senretsukyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 6.25

[State 3450, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0 && AnimElemTime(10) < 0
x = -0.48828125

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 12.5

[State 3450, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0 && AnimElemTime(35) < 0 && vel x > 0
x = -0.5859375

[State 3450, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 12
x = 5

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 13
x = 2

[State 3450, First Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.52,0
ground.cornerPush.velOff = 0
guard.velocity = -5.52
guard.cornerPush.velOff = 0
air.velocity = -0.75, -2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Spark XY]
type = Null
trigger1 = AnimElem = 14 || AnimElem = 26
trigger1 = var(35) := 56 || var(36) := -100
trigger2 = AnimElem = 17 || AnimElem = 29
trigger2 = var(35) := 66 || var(36) := -65
trigger3 = AnimElem = 20 || AnimElem = 32
trigger3 = var(35) := 64 || var(36) := -84
trigger4 = AnimElem = 23
trigger4 = var(35) := 59 || var(36) := -44

[State 3450, Hit Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 17 || AnimElem = 23 || AnimElem = 29
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -vel x / 2, 0
ground.cornerPush.velOff = 0
guard.velocity = -vel x / 2
guard.cornerPush.velOff = 0
air.velocity = -0.75, -2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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

[State 3450, Hit High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14 || AnimElem = 20 || AnimElem = 26 || AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -vel x / 2, 0
ground.cornerPush.velOff = 0
guard.velocity = -vel x / 2
guard.cornerPush.velOff = 0
air.velocity = ifElse(AnimElemTime(32) >= 0, -7.5, -0.75), ifElse(AnimElemTime(32) >= 0, -1.125, -2.5)
air.cornerPush.velOff = 0
yAccel = 0.5126953125
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

[State 3450, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 38
value = 4,3
channel = 0

[State 3450, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 38
value = 1,5
channel = 1

[State 3450, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 37
value = 40,0
channel = 3

[State 3450, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 37
stateType = A
physics = N

[State 3450, Dust Helper]
type = Helper
trigger1 = AnimElem = 37
helperType = Normal
stateNo = 8100
ID = 8100
name = "MAX Senretsukyaku dust"
posType = P1
ownPal = 1

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 35
x = 4.6875

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 36
x = 19

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 37
x = 8

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 38
x = 5

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 37
y = -5.25

[State 3450, Gravity]
type = VelAdd
trigger1 = AnimElemTime(37) >= 0 && AnimElemTime(45) < 0
y = 0.75

[State 3450, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 39
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 16,16
guard.pauseTime = 16,16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14
ground.slideTime = 14
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -5, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -7.1875
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 79), var(36) := -87
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = pos y > -vel y
stateType = S
physics = N

[State 3450, Landing Sound]
type = PlaySnd
trigger1 = pos y > -vel y
value = 52,0
channel = 4

[State 3450, Landing Dust Explod]
type = Explod
trigger1 = pos y > -vel y
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3450, PosSet]
type = PosSet
trigger1 = pos y > -vel y
y = 0

[State 3450, VelSet]
type = VelSet
trigger1 = pos y > -vel y
x = 0
y = 0

[State 3450, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(41) >= 0
moveType = I

[State 3450, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<HAZAN TENSHOKYAKU>=
[StateDef 3500]
type = S
physics = S
moveType = A
anim = ifElse(!var(1), 3501, 3500)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
var(17) = ifElse(!var(1), 63, 43)

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
trigger1 = AnimElemTime(11) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(5) = 10 && !var(1)
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -16,-25
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = ifElse(!var(1), 63, 43)
moveTime = ifElse(!var(1), 63, 43)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3500, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(5) = 10 && var(40) && !var(1)
value = 8500,0

[State 3500, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,10
channel = 1

[State 3500, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6005
posType = p1
pos = -12, -42
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3500,0
channel = 0

[State 3500, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1400,0
channel = 0

[State 3500, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 41,0
channel = 1

[State 3500, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 10 || AnimElem = 15
trigger2 = AnimElem = 19 || AnimElem = 23
trigger3 = AnimElem = 27 || AnimElem = 31
value = 1,5

[State 3500, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 24

[State 3500, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = A
physics = N

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hazan Tenshokyaku Dust"
posType = P1
ownPal = 1

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 7.5
y = -6.25

[State 3500, VelAdd]
type = VelAdd
trigger1 = vel x > 0 && AnimElemTime(12) > 0
x = -0.390625

[State 3500, VelSet]
type = VelSet
trigger1 = vel x < 0 && AnimElemTime(12) > 0
x = 0

[State 3500, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && AnimElemTime(12) > 0
y = 0.2563476563

[State 3500, VelAdd]
type = VelAdd
trigger1 = vel y >= 0 && AnimElemTime(12) > 0
y = 0.5859375

[State 3500, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Air Hit 1, 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 12 || AnimElem = 20
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Air Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 16
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Air Hit 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 28
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
air.velocity = -1.5625, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Air Hit 4, 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 24 || AnimElem = 32
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
air.velocity = -1.5625, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1401


;Landing
[StateDef 3501]
type = S
anim = 1411
physics = N
moveType = I
velSet = 0,0

[State 3501, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3501, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3501, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3501, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<MAX HAZAN TENSHOKYAKU>=
[StateDef 3550]
type = S
physics = S
moveType = A
anim = ifElse(!var(1), 3551, 3550)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3550, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3550, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3550, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3550, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(!var(1), 65, 45)

[State 3550, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3550, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3550, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(11) < 0
time = 1
value = SCA

[State 3550, Super Pause FX]
type = Helper
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(5) = 10 && !var(1)
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -16,-25
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3550, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = ifElse(!var(1), 65, 45)
moveTime = ifElse(!var(1), 65, 45)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3550, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 3 && (!var(40) || var(1))
trigger2 = AnimElemTime(5) = 10 && var(40) && !var(1)
value = 8500,0

[State 3550, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,10
channel = 1

[State 3550, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6005
posType = p1
pos = -12, -42
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3550, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3500,0
channel = 0

[State 3550, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1400,0
channel = 0

[State 3550, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 41,0
channel = 1

[State 3550, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 10 || AnimElem = 15
trigger2 = AnimElem = 19 || AnimElem = 23
trigger3 = AnimElem = 27 || AnimElem = 31
trigger4 = AnimElem = 35 || AnimElem = 39
value = 1,5

[State 3550, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 24

[State 3550, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = A
physics = N

[State 3550, Dust Helper]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 8100
ID = 8100
name = "Hazan Tenshokyaku Dust"
posType = P1
ownPal = 1

[State 3550, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 7.5
y = -7.5

[State 3550, VelAdd]
type = VelAdd
trigger1 = vel x > 0 && AnimElemTime(12) > 0
x = -0.390625

[State 3550, VelSet]
type = VelSet
trigger1 = vel x < 0 && AnimElemTime(12) > 0
x = 0

[State 3550, VelAdd]
type = VelAdd
trigger1 = vel y < 0 && AnimElemTime(12) > 0
y = 0.1953125

[State 3550, VelAdd]
type = VelAdd
trigger1 = vel y >= 0 && AnimElemTime(12) > 0
y = 0.5859375

[State 3550, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, Air Hit 1, 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 12 || AnimElem = 20
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, Air Hit 2, 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 16 || AnimElem = 24
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, Air Hit 5, 7]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 28 || AnimElem = 36
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
air.velocity = -1.5625, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -114
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, Air Hit 6, 8]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 32 || AnimElem = 40
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
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
air.velocity = -1.5625, -5.625
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3501



;====<FINAL MISSION>=
[StateDef 3600]
type = S
physics = N
moveType = A
anim = ifElse(!var(1), 3601, 3600)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3600, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3600, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3600, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3600, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3600, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = ifElse(!var(1), 63, 47)

[State 3600, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3600, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(13) < 0
time = 1
value = SCA

[State 3600, Super Pause FX]
type = Helper
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(6) = 3 && !var(1)
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 27,-76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = ifElse(!var(1), 63, 47)
moveTime = ifElse(!var(1), 63, 47)
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3600, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 3 && var(1)
trigger2 = AnimElemTime(6) = 3 && !var(1)
value = 8500,0

[State 3600, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,10
channel = 1

[State 3600, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 6005
posType = p1
pos = -14, -92
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3600, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,1
channel = 3

[State 3600, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 4,2
channel = 0

[State 3600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1,5
channel = 4

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Final Mission Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 12.5

[State 3600, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0 && vel x > 0
x = -0.5859375

[State 3600, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3600, Width]
type = Width
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
player = 32,0

[State 3600, PosAdd]
type = PosAdd
trigger1 = AnimElem = 14
x = 33

[State 3600, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 14
ID = 3600
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
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
ground.velocity = -12.64, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -93
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3600, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(14) > 0 && AnimElemTime(15) <= 0
trigger1 = HitPauseTime <= 22
value = 3600
elem = 15
ignoreHitPause = 1

[State 3600, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3600) > 1
ID = 3600
keepOne = 1
excludeID = 3600
ignoreHitPause = 1

[State 3600, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3600)
value = 3615
ID = 3600
ignoreHitPause = 1
persistent = 0

[State 3600, ChangeState]
type = ChangeState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3610

[State 3600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 3600, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3610]
type = S
anim = 3610
physics = N
moveType = A
velSet = 0,0
moveHitPersist = 1

[State 3610, Camera]
type = ScreenBound
trigger1 = 0
value = 1
moveCamera = 1, 0

[State 3610, PalFX]
type = PalFX
trigger1 = !Time
time = 10
sinAdd = -255, -255, -255, 40

[State 3610, PalFX]
type = PalFX
trigger1 = Time >= 10
time = 1
mul = 0, 0, 0

[State 3610, Warp Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3610,0
channel = 1

[State 3610, Explod]
type = Explod
trigger1 = !Time
anim = 13610
posType = P1
sprPriority = 1
ownPal = 1

[State 3610 Transparency]
type = Trans
trigger1 = AnimElemTime(2) >= 0
trans = AddAlpha
alpha = 256 - 32 * (AnimElemTime(2)), 32 * (AnimElemTime(2))
ignoreHitPause = 1

[State 3610, AllPalFX]
type = AllPalFX
trigger1 = AnimElem = 5
time = 10
sinAdd = -255, -255, -255, 40

[State 3610, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3611


;In air
[StateDef 3611]
type = A
anim = 1
physics = N
moveType = A
velSet = 0,0
moveHitPersist = 1

[State 3611, TargetState]
type = TargetState
trigger1 = !Time && NumTarget(3600)
ID = 3600
value = 3616

[State 3611, PosSet]
type = PosSet
trigger1 = 1
x = -const(size.ground.front) * Facing
y = -240

[State 3611, TargetBind]
type = TargetBind
trigger1 = NumTarget(3600)
pos = 40 + (Target(3600), const(size.ground.front) + const(size.ground.back)), 0
ID = 3600

[State 3611, Pause]
type = Pause
trigger1 = Time < 60
time = 2
moveTime = 2

[State 3611, Pause]
type = Pause
trigger1 = Time = 60
time = 0

[State 3611, BGPalFX]
type = BGPalFX
trigger1 = !Time
time = 59
add = -256,-256,-256

[State 3611, AssertSpecial: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 60
flag = NoBarDisplay
flag2 = NoFG

[State 3611, HitAdd]
type = HitAdd
trigger1 = (Time = [0,52]) && !(Time % 4)
value = 1

[State 3611, HitCount]
type = VarAdd
trigger1 = (Time = [0,52]) && !(Time % 4)
var(13) = 1

[State 3611, Damage]
type = TargetLifeAdd
trigger1 = NumTarget(3600)
trigger1 = (Time = [0,52]) && !(Time % 4)
ID = 3600
value = ceil(ifElse(21 * fvar(11) < 7, -7, -21 * fvar(11)))
kill = 0

[State 3611, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget(3600)
trigger1 = (Time = [0,52]) && !(Time % 4)
ID = 3600
value = 36

[State 3611, HitSound]
type = PlaySnd
trigger1 = (Time = [0,52]) && !(Time % 4)
value = 2,2
channel = 2

[State 3611, Hit Sparks]
type = Helper
trigger1 = (Time = [0,52]) && !(Time % 4)
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
sprPriority = 5
posType = Back
pos = Random % ceil(GameWidth), ceil(pos y - ScreenPos y) + Random % ceil(GameHeight)
facing = ifElse(Random % 2, -1, 1)
ownPal = 1
onTop = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3611, EnvShake]
type = EnvShake
trigger1 = (Time = [0,52]) && !(Time % 4)
time = 18
freq = 120
ampl = 6

[State 3611, ChangeState]
type = ChangeState
trigger1 = Time >= 60
value = 3612


;Finish
[StateDef 3612]
type = S
anim = 0
physics = N
moveType = A
velSet = 0,0
moveHitPersist = 1

[State 3612, Turn]
type = Turn
trigger1 = !Time

[State 3612, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3612, TargetState]
type = TargetState
trigger1 = !Time && NumTarget(3600)
ID = 3600
value = 3617

[State 3612, Explosion Sound]
type = PlaySnd
trigger1 = NumTarget(3600)
trigger1 = (Target(3600), StateNo = 3617) && ((Target, pos y) > -(Target, vel y))
value = 3611,0

[State 3612, Explosion]
type = Explod
trigger1 = NumTarget(3600)
trigger1 = (Target(3600), StateNo = 3617) && ((Target, pos y) > -(Target, vel y))
anim = 13615
sprPriority = 1
posType = Left
pos = 160 + ceil(Target(3600), pos x), ceil(Target(3600), ScreenPos y) -40
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3612, ChangeAnim]
type = ChangeAnim
trigger1 = NumTarget(3600)
trigger1 = (Target(3600), StateNo = 3617) && ((Target, pos y) > -(Target, vel y))
value = 3612
ignoreHitPause = 1

[State 3612, Voice]
type = PlaySnd
trigger1 = Anim = 3612 && AnimElem = 5
value = 195,0
channel = 0

[State 3612, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5 && Anim = 3612
value = 3000,10
channel = 3

[State 3612, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5 && Anim = 3612
anim = 6005
posType = p1
pos = 17, -91
sprPriority = 3
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3612, ChangeState]
type = ChangeState
trigger1 = !AnimTime && Anim = 3612
value = 0
ctrl = 1


;Target
[StateDef 3615]
type = A
physics = N
moveType = H
velSet = 0, 0
ctrl = 0
sprPriority = 0

[State 3615, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignoreHitPause = 1

[State 3615, Camera]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1, 0

[State 3615, ChangeAnim]
type = ChangeAnim
trigger1 = !HitShakeOver
value = 5012
ignoreHitPause = 1

[State 3615, ChangeAnim]
type = ChangeAnim
trigger1 = HitShakeOver
value = ifElse(SelfAnimExist(5250), 5250, ifElse(SelfAnimExist(5051), 5051, 5030))
persistent = 0

[State 3615, HitFallSet]
type = HitFallSet
trigger1 = !HitFall
value = 1
ignoreHitPause = 1

[State 3615, VelAdd]
type = VelAdd
trigger1 = HitShakeOver
y = 0.5

[State 3615, VelSet]
type = VelSet
trigger1 = HitShakeOver
y = -16
persistent = 0

[State 3615, SelfState]
type = SelfState
trigger1 = pos y > -vel y
value = 5100


;Being Hit
[StateDef 3616]
type = A
physics = N
moveType = H
velSet = 0, 0
ctrl = 0
sprPriority = 0

[State 3616, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignoreHitPause = 1

[State 3616, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1

[State 3616, Camera]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1, 0


;Falling
[StateDef 3617]
type = A
physics = N
moveType = H
velSet = 0, 0
ctrl = 0
sprPriority = 0

[State 3617, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3617

[State 3617, PosSet]
type = PosSet
trigger1 = !Time
y = -384

[State 3617, Camera]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1, 0

[State 3617, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 3617, VelSet]
type = VelSet
trigger1 = !Time
y = 4

[State 3617, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3618


;Hitting the Floor
[StateDef 3618]
type = L
physics = N
moveType = H
velSet = 0, 0
ctrl = 0
sprPriority = 0

[State 3618, Damage]
type = LifeAdd
trigger1 = !Time
value = -84
kill = 1

[State 3618, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5101), 5101, 5100)

[State 3618, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3618, EnvShake]
type = EnvShake
trigger1 = !Time
time = 18
freq = 120
ampl = 6

[State 3618, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 3618, End]
type = ChangeState
trigger1 = (Anim = [5100,5101]) && !AnimTime
trigger2 = Time >= 12
value = 3619


;Floor Bounce
[StateDef 3619]
type = L
moveType = H
physics = N

[State 3619, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3619, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (Anim % 10))
value = 5160

[State 3619, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (Anim = [5101,5109]) && SelfAnimExist(5160 + (Anim % 10))
value = 5160 + (Anim % 10)

[State 3619, HitFallVel]
type = HitFallVel
trigger1 = !Time

[State 3619, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.4

[State 3619, PosSet]
type = PosSet
trigger1 = !Time
y = 20

[State 3619, End]
type = ChangeState
trigger1 = vel y > 0 && pos y >= 12
value = 3620


;Lie down
[StateDef 3620]
type = L
moveType = H
physics = N

[State 3620, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3620, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5081,5089]
trigger1 = SelfAnimExist(5110 + (Anim % 10))
value = 5110 + (Anim % 10)

[State 3410, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 3620, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 3620, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3620, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yvel)
sysvar(1) = floor(vel y)

[State 3620, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 3620, PlaySnd]
type = PlaySnd
trigger1 = !Time && !sysvar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 3620, Hitting the Floor FX]
type = Explod
trigger1 = !time && !sysvar(0)
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 3620, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3620, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime || sysvar(0)
trigger1 = (Anim = [5171,5179]) && SelfAnimExist(5110 + (Anim % 10))
value = 5110 + (Anim % 10)

[State 3620, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5111,5119]
trigger1 = !AnimTime || sysvar(0)
value = 5110

[State 3620, ChangeAnim]
type = ChangeAnim
trigger1 = !Alive && SelfAnimExist(5150 + (Anim % 10))
trigger1 = !AnimTime || sysvar(0) || (Anim = [5110,5119])
value = 5150 + (Anim % 10)

[State 3620, VarSet]
type = VarSet
trigger1 = !Time
sysvar(0) = 0

[State 3620, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 3620, End]
type = SelfState
trigger1 = !Alive
value = 5150

[State 3620, End]
type = SelfState
trigger1 = Time >= 38
value = 5120
