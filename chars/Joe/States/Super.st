; _______________________________________
;| Joe Higashi by Jmorphman              |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<SCREW UPPER>=
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
var(17) = 52

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
pos = -3,-55
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 52
moveTime = 52
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Screw Upper Hit Count Reset]
type = VarSet
trigger1 = !Time
var(41) = 0
ignoreHitPause = 1

[State 3000, SCREW]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, UPPER]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 0

[State 3000, Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 10
value = 1,2
channel = 1

[State 3000, Hurricane Upper Startup FX (Left Hand)]
type = Explod
trigger1 = AnimElem = 3
anim = 1003
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Hurricane Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,1
channel = 3

[State 3000, Screw Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3000,2
channel = 4

[State 3000, Screw Upper Startup FX (Right Hand)]
type = Explod
trigger1 = AnimElem = 11
anim = 1003
sprPriority = 3
posType = P1
pos = -8,4
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Small Screw Upper Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 3002
ID = 3002
name = "Small Screw Upper Projectile"
posType = P1
pos = 75,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, Large Screw Upper Projectile]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 3005
ID = 3005
name = "Large Screw Upper Projectile"
posType = P1
pos = 90,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(4) = -1
trigger2 = AnimElemTime(12) = -1
value = 30,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(8) = -1
edge = 30,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(9) = -1
edge = 45,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(10) = -1
edge = 60,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(11) = -1
edge = 75,0

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(12) = -1
edge = 90,0

[State 3000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SCREW UPPER>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3000
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
var(17) = 52

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

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -3,-55
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 54
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Screw Upper Hit Count Reset]
type = VarSet
trigger1 = !Time
var(41) = 0
ignoreHitPause = 1

[State 3050, SCREW]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, UPPER]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,1
channel = 0

[State 3050, Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 10
value = 1,2
channel = 1

[State 3050, Hurricane Upper Startup FX (Left Hand)]
type = Explod
trigger1 = AnimElem = 3
anim = 1003
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Hurricane Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,1
channel = 3

[State 3050, Screw Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3000,2
channel = 4

[State 3050, Screw Upper Startup FX (Right Hand)]
type = Explod
trigger1 = AnimElem = 11
anim = 1003
sprPriority = 3
posType = P1
pos = -8,4
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Small Screw Upper Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 3002
ID = 3002
name = "Small Screw Upper Projectile"
posType = P1
pos = 75,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3050, Large Screw Upper Projectile]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 3005
ID = 3005
name = "Large Screw Upper Projectile"
posType = P1
pos = 90,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(4) = -1
trigger2 = AnimElemTime(12) = -1
value = 30,0

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(8) = -1
edge = 30,0

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(9) = -1
edge = 45,0

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(10) = -1
edge = 60,0

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(11) = -1
edge = 75,0

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(12) = -1
edge = 90,0

[State 3050, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EXPLODING HURRICANE TIGER HEEL>=
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
var(17) = 52

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
pos = 2,-80
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 52
moveTime = 52
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Hurricane Upper Hit Count Reset]
type = VarSet
trigger1 = !Time
var(41) = 0
ignoreHitPause = 1

[State 3100, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3100, TNT Punch Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
trigger6 = AnimElem = 12
value = 1,1

[State 3100, TNT Punch VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3.125

[State 3100, TNT Punch Stop]
type = VelSet
trigger1 = AnimElem = 14
x = 0

[State 3100, Spark XY]
type = Null
trigger1 = AnimElem = 3 || AnimElem = 11
trigger1 = var(35) := 75 || var(36) := -55
trigger2 = AnimElem = 5 || AnimElem = 13
trigger2 = var(35) := 80 || var(36) := -81
trigger3 = AnimElem = 7
trigger3 = var(35) := 85 || var(36) := -68
trigger4 = AnimElem = 9
trigger4 = var(35) := 68 || var(36) := -92

[State 3100, TNT Punch Low]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 3 || AnimElem = 7 || AnimElem = 11
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
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -7
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 3100, TNT Punch High]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 9 || AnimElem = 13
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
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -7
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(14) < 0
value = 35,0

[State 3100, Hurricane Upper Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 19
trigger2 = AnimElem = 27
value = 1,2
channel = 1

[State 3100, Hurricane Upper Startup FX (Left Hand)]
type = Explod
trigger1 = AnimElem = 19
anim = 1003
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Hurricane Upper Startup FX (Right Hand)]
type = Explod
trigger1 = AnimElem = 27
anim = 1003
sprPriority = 3
posType = P1
pos = -8,4
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Hurricane Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 20
trigger2 = AnimElem = 28
value = 1000,1
channel = 3

[State 3100, Projectile]
type = Helper
trigger1 = AnimElem = 20
trigger2 = AnimElem = 28
helperType = Normal
stateNo = 3105
ID = 3105
name = "Exploding Hurricane Tiger Heel Projectile"
posType = P1
pos = 55,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(20) = -1
trigger2 = AnimElemTime(28) = -1
value = 30,0

[State 3100, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 33
value = 3100,2
channel = 0

[State 3100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 35
value = 1,5
channel = 1

[State 3100, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 36
value = 1200,1
channel = 3

[State 3100, Tiger Kick Flames]
type = Explod
trigger1 = AnimElem = 37
anim = 1205
ID = 1205
sprPriority = 3
posType = P1
scale = 0.5,0.5
bindTime = -1
removeTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 37
value = 40,0
channel = 4

[State 3100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 37
stateType = A
physics = N

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 37
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tiger Kick Dust"
posType = P1
ownPal = 1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 37
x = 3.5
y = -9.5

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(37) > 0
y = 0.5

[State 3100, Hit Count Add]
type = VarAdd
trigger1 = AnimElem = 35
var(41) = HitCount
ignoreHitPause = 1

[State 3100, MoveHitReset]
type = MoveHitReset
trigger1 = AnimElem = 35
ignorehitpause = 1

[State 3100, Tiger Kick Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 36
attr = S, HA
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Tiger Kick Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 37 && !MoveContact && !MoveReversed
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 39
ID = 1205

[State 3100, Tiger Kick Flames Fade Away]
type = Explod
trigger1 = AnimElem = 39
anim = 1206
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
persistent = 0

[State 3100, Golden Heel Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 40
value = 1,5
channel = 1

[State 3100, Golden Heel sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 1300,1
channel = 4

[State 3100, Golden Heel FX]
type = Explod
trigger1 = AnimElem = 41
anim = 1305
ID = 1305
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3100, Golden Heel Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 43
ID = 3100
attr = A, HA
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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
trigger1 = !(Target(3100), Time)
value = ifElse(Target(3100), StateType = A, 5425, 5420)
ID = 3100
ignoreHitPause = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(44) >= 0
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Landing
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
channel = 1

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX EXPLODING HURRICANE TIGER HEEL>=
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
var(17) = 52

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
trigger1 = AnimElemTime(2) < 0
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
pos = 2,-80
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 54
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Hurricane Upper Hit Count Reset]
type = VarSet
trigger1 = !Time
var(41) = 0
ignoreHitPause = 1

[State 3150, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3150, TNT Punch Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
trigger6 = AnimElem = 12
trigger7 = AnimElem = 14
trigger8 = AnimElem = 16
trigger9 = AnimElem = 18
trigger10 = AnimElem = 20
trigger11 = AnimElem = 22
trigger12 = AnimElem = 24
value = 1,1

[State 3150, TNT Punch VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3.125

[State 3150, TNT Punch Stop]
type = VelSet
trigger1 = AnimElem = 27
x = 0

[State 3150, Spark XY]
type = Null
trigger1 = AnimElem = 3 || AnimElem = 11 || AnimElem = 19
trigger1 = var(35) := 75 || var(36) := -55
trigger2 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21
trigger2 = var(35) := 80 || var(36) := -81
trigger3 = AnimElem = 7 || AnimElem = 15 || AnimElem = 23
trigger3 = var(35) := 85 || var(36) := -68
trigger4 = AnimElem = 9 || AnimElem = 17 || AnimElem = 25
trigger4 = var(35) := 68 || var(36) := -92

[State 3150, TNT Punch Low]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 3 || AnimElem = 7 || AnimElem = 11 || AnimElem = 15 || AnimElem = 19 || AnimElem = 23
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
air.animType = Low
fall.animType = Low
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -7
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 3150, TNT Punch High]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 9 || AnimElem = 13 || AnimElem = 17 || AnimElem = 21 || AnimElem = 25
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
air.animType = High
fall.animType = High
ground.type = High
air.type = High
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -7
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
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

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(27) < 0
value = 35,0

[State 3150, Hurricane Upper Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 32
trigger2 = AnimElem = 40
trigger3 = AnimElem = 48
trigger4 = AnimElem = 56
value = 1,2

[State 3150, Hurricane Upper Startup FX (Left Hand)]
type = Explod
trigger1 = AnimElem = 32
trigger2 = AnimElem = 48
anim = 1003
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Hurricane Upper Startup FX (Right Hand)]
type = Explod
trigger1 = AnimElem = 40
trigger2 = AnimElem = 56
anim = 1003
sprPriority = 3
posType = P1
pos = -8,4
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Hurricane Upper sound effect]
type = PlaySnd
trigger1 = AnimElem = 33
trigger2 = AnimElem = 41
trigger3 = AnimElem = 49
trigger4 = AnimElem = 57
value = 1000,1
channel = 3

[State 3150, Projectile]
type = Helper
trigger1 = AnimElem = 33
trigger2 = AnimElem = 41
trigger3 = AnimElem = 49
trigger4 = AnimElem = 57
helperType = Normal
stateNo = 3105
ID = 3105
name = "Exploding Hurricane Tiger Heel Projectile"
posType = P1
pos = 55,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3150, Width]
type = Width
trigger1 = AnimElemTime(33) = -1
trigger2 = AnimElemTime(41) = -1
trigger3 = AnimElemTime(49) = -1
trigger4 = AnimElemTime(57) = -1
value = 30,0

[State 3150, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 62
value = 3100,2
channel = 0

[State 3150, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 64
value = 1,5
channel = 1

[State 3150, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 65
value = 1200,1
channel = 3

[State 3150, Tiger Kick Flames]
type = Explod
trigger1 = AnimElem = 66
anim = 1205
ID = 1205
sprPriority = 3
posType = P1
scale = 0.5,0.5
bindTime = -1
removeTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 66
value = 40,0
channel = 4

[State 3150, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 66
stateType = A
physics = N

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 66
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tiger Kick Dust"
posType = P1
ownPal = 1

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 66
x = 3.5
y = -11.5

[State 3150, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(66) > 0
y = 0.5

[State 3150, Hit Count Add]
type = VarAdd
trigger1 = AnimElem = 64
var(41) = HitCount
ignoreHitPause = 1

[State 3150, Tiger Kick Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 65
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
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Tiger Kick Air Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 66
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
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Tiger Kick Air Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 67
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
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 68
ID = 1205

[State 3150, Tiger Kick Flames Fade Away]
type = Explod
trigger1 = AnimElem = 68
anim = 1206
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
persistent = 0

[State 3150, Golden Heel Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 69
value = 1,5
channel = 1

[State 3150, Golden Heel sound]
type = PlaySnd
trigger1 = AnimElem = 70
value = 1300,1
channel = 4

[State 3150, Golden Heel FX]
type = Explod
trigger1 = AnimElem = 70
anim = 1305
ID = 1305
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3150, Golden Heel Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + var(41) + HitCount)
trigger1 = AnimElem = 72
ID = 3150
attr = A, HA
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
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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
trigger1 = !(Target(3150), Time)
value = ifElse(Target(3150), StateType = A, 5425, 5420)
ID = 3150
ignoreHitPause = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(73) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101



;====<GOLDEN TIGER KICK>=
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

[State 3200, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

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

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(47) % 2) && var(47) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, ChangeState]
type = ChangeState
triggerAll = !AILevel
trigger1 = command != "holda" && !var(10)
trigger2 = command != "holdb" && var(10) = 1
trigger3 = command != "holdc" && var(10) = 2
trigger4 = Time >= 56
value = 3210

[State 3200, ChangeState]
type = ChangeState
trigger1 = AILevel && !Time
value = 3210

[State 3200, VarAdd]
type = VarAdd
trigger1 = var(47) <= 12
var(47) = 1


;Release
[StateDef 3210]
type = S
anim = 3210
physics = N
moveType = A
velSet = 0,0

[State 3210, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3210, ifElse(var(10) = 1, 3211, 3212))

[State 3210, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(47) % 2) && var(47) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3210, VarAdd]
type = VarAdd
trigger1 = var(47) <= 12
var(47) = 1

[State 3210, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3210, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 52

[State 3210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3210, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 31,-30
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3210, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 52
moveTime = 52
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3210, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 900,1
channel = 0

[State 3210, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3210, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 3210, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 3

[State 3210, Golden Tiger Kick FX (Top]
type = Explod
trigger1 = AnimElem = 5
anim = 3215
sprPriority = 3
posType = P1
pos = 55,-103
scale = 0.5,0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3210, Golden Tiger Kick FX (Top]
type = Explod
trigger1 = AnimElem = 5
anim = 3216
sprPriority = 1
posType = P1
pos = 55,-103
scale = 0.5,0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3210, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 5

[State 3210, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3210, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Golden Tiger Kick Dust"
posType = P1
ownPal = 1

[State 3210, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = ifElse(var(10) = 2, 10.29986572, ifElse(var(10) = 1, 8.583221434, 6.866577148))
y = ifElse(var(10) = 2, -10.5, ifElse(var(10) = 1, -9.5, -8.5))

[State 3210, VelAdd]
type = VelMul
trigger1 = AnimElemTime(5) > 0
x = 0.858322518770017

[State 3210, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = 0.5

[State 3210, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Air Hit 1-4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
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
ground.velocity = -5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 53
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Final Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 9
attr = A, HA
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 57
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Flame Particles]
type = Helper
trigger1 = AnimElemTime(5) > 0
trigger1 = !NumHelper(8151)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8151
ID = 8151
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3210, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3220


;Landing
[StateDef 3220]
type = S
anim = 3220
physics = N
moveType = I
velSet = 0,0

[State 3220, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3220, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3220, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3220, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX GOLDEN TIGER KICK>=
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

[State 3250, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 3250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc") && (command = "b" || command = "rlsb"), 2, ifElse((command = "c" || command = "rlsc") && (command = "a" || command = "rlsa"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)) && (NumExplod(90000240) || NumExplod(90000245)), 2, ifElse((NumExplod(90000250) || NumExplod(90000255)) && (NumExplod(90000230) || NumExplod(90000235)), 1, 0))

[State 3250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

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

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(47) % 2) && var(47) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, ChangeState]
type = ChangeState
triggerAll = !AILevel
trigger1 = (command != "holda" && command != "holdb") && !var(10)
trigger2 = (command != "holda" && command != "holdc") && var(10) = 1
trigger3 = (command != "holdb" && command != "holdc") && var(10) = 2
trigger4 = Time >= 56
value = 3260

[State 3250, ChangeState]
type = ChangeState
trigger1 = AILevel && !Time
value = 3260

[State 3250, VarAdd]
type = VarAdd
trigger1 = var(47) <= 12
var(47) = 1


;Release
[StateDef 3260]
type = S
anim = 3260
physics = N
moveType = A
velSet = 0,0

[State 3260, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(var(47) % 2) && var(47) <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3260, VarAdd]
type = VarAdd
trigger1 = var(47) <= 12
var(47) = 1

[State 3260, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3260, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 52

[State 3260, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3260, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 31,-30
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3260, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 54
moveTime = 54
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3260, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 900,1
channel = 0

[State 3260, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3260, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 3260, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 3

[State 3260, Golden Tiger Kick FX (Top]
type = Explod
trigger1 = AnimElem = 5
anim = 3215
sprPriority = 3
posType = P1
pos = 55,-103
scale = 0.5,0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3260, Golden Tiger Kick FX (Top]
type = Explod
trigger1 = AnimElem = 5
anim = 3216
sprPriority = 1
posType = P1
pos = 55,-103
scale = 0.5,0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3260, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 5

[State 3260, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3260, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Golden Tiger Kick Dust"
posType = P1
ownPal = 1

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 24.033020008
y = -10.5

[State 3200, VelAdd]
type = VelMul
trigger1 = AnimElemTime(5) > 0
x = 0.858322518770017

[State 3260, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = 0.5

[State 3260, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Air Hit 1-10]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6
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
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 53
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Final Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 15
attr = A, HA
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -95
palFX.time = 62
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Flame Particles]
type = Helper
trigger1 = AnimElemTime(5) > 0
trigger1 = !NumHelper(8151)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8151
ID = 8151
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3260, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 3260, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3220



;====<DOUBLE CYCLONE>=
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
pos = 8, -39
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
value = 3300,0
channel = 0

[State 3300, Woosh sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 3300, Double Cyclone Startup FX (Left Hand)]
type = Explod
trigger1 = AnimElem = 4
anim = 1003
sprPriority = -1
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Double Cyclone Startup FX (Right Hand)]
type = Explod
trigger1 = AnimElem = 4
anim = 1003
sprPriority = 4
posType = P1
pos = 0, 4
facing = -1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3300,1
channel = 0

[State 3300, Double Cyclone sound effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,2
channel = 3

[State 3300, Double Cyclone Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3305
ID = 3305
name = "Double Cyclone Projectile"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3300, PlayerPush]
type = PlayerPush
trigger1 = NumHelper(3305)
trigger1 = Helper(3305), StateNo = 3305 || Helper(3305), StateNo = 3006
value = 0
ignoreHitPause = 1

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
