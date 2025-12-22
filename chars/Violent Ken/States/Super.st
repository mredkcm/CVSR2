; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<SHORYUREPPA>=
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
trigger1 = AnimElemTime(3) < 0
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
pos = 11,-28
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

[State 3000, "Ikuse!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3000,0
channel = 0

[State 3000, "SHORYUREPPA!!!"]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 3000,1
channel = 0

[State 3000, "Muda da!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) = 1
value = 3100,10
channel = 0

[State 3000, "SHORYUREPPA!!!" (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3000,10
channel = 0

[State 3000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 13
value = 1,2
channel = 1

[State 3000, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(15) = 2
value = 40,0
channel = 3

[State 3000, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElemTime(15) = 2
stateType = A
physics = N

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElemTime(15) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryureppa Dust"
posType = P1
ownPal = 1

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(12) >= 0 && AnimElemTime(15) < 0
x = 6

[State 3000, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
x = 0.93

[State 3000, VelMul]
type = VelMul
trigger1 = AnimElemTime(15) >= 0
x = 0.88

[State 3000, Velocity]
type = VelSet
trigger1 = AnimElemTime(15) = 2
y = -10.5

[State 3000, Gravity]
type = VelAdd
trigger1 = AnimElemTime(15) >= 2
y = 0.47

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1100,1
channel = 4

[State 3000, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 1124

[State 3000, Shoryuken Fist Overlay]
type = Explod
trigger1 = AnimElem = 14
ID = 1124
anim = 3004
sprPriority = 2
bindTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames Explod (Ground portion)]
type = Explod
trigger1 = AnimElem = 12
anim = 3005
sprPriority = 3
bindTime = 9
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames Explod (Aerial portion)]
type = Explod
trigger1 = AnimElem = 15
anim = 1126
sprPriority = 3
bindTime = -1
removeTime = 18
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames Explod (Aerial portion, fade away)]
type = Explod
trigger1 = AnimElemTime(16) = -2
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 37
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Flame Particles]
type = Helper
trigger1 = AnimElemTime(13) > 0
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

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 16
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3001


;Landing
[StateDef 3001]
type = S
anim = ifElse(PrevStateNo = 3400, 1111, 1121)
physics = N
moveType = I
velSet = 0,0

[State 3001, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3001, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3001, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SHORYUREPPA>=
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
trigger1 = AnimElemTime(9) < 0
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
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Remove Explods]
type = RemoveExplod
trigger1 = !Time && NumExplod(3005)
ID = 3005

[State 3050, "Ikuse!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3000,0
channel = 0

[State 3050, "SHORYUREPPA!!!"]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 3000,1
channel = 0

[State 3050, "Muda da!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) = 1
value = 3100,10
channel = 0

[State 3050, "SHORYUREPPA!!!" (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3000,10
channel = 0

[State 3050, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 13 || AnimElem = 23
value = 1,2
channel = 1

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(26) = 2
value = 40,0
channel = 3

[State 3050, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElemTime(26) = 2
stateType = A
physics = N

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElemTime(26) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryureppa Dust"
posType = P1
ownPal = 1

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
x = 6

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(15) < 0
x = 10

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElemTime(23) >= 0 && AnimElemTime(26) < 0
x = 12

[State 3050, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(11) < 0
trigger2 = AnimElemTime(15) >= 0 && AnimElemTime(22) < 0
trigger3 = AnimElemTime(26) >= 0
x = 0.93

[State 3050, Velocity]
type = VelSet
trigger1 = AnimElemTime(26) = 2
y = -11.5

[State 3050, Gravity]
type = VelAdd
trigger1 = AnimElemTime(26) >= 2
y = 0.47

[State 3050, HitDef 1/4]
type = HitDef
trigger1 = !var(16) && var(15) < 1 + 3 * (AnimElem = 13)
trigger1 =  AnimElem = 2 || AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 2/5]
type = HitDef
trigger1 = !var(16) && var(15) < 2 + 3 * (AnimElem = 14)
trigger1 =  AnimElem = 3 || AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 3/6]
type = HitDef
trigger1 = !var(16) && var(15) < 3 + 3 * (AnimElem = 15)
trigger1 =  AnimElem = 4 || AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1100,1
channel = 4

[State 3050, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 1124

[State 3050, Shoryuken Fist Overlay]
type = Explod
trigger1 = AnimElem = 25
ID = 1124
anim = 3004
sprPriority = 2
bindTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames Explod (Ground portion)]
type = Explod
trigger1 = AnimElem = 23
anim = 3005
sprPriority = 3
bindTime = 9
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames Explod (Aerial portion)]
type = Explod
trigger1 = AnimElem = 26
anim = 1126
sprPriority = 3
bindTime = -1
removeTime = 18
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames Explod (Aerial portion, fade away)]
type = Explod
trigger1 = AnimElemTime(30) = -2
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 24
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 25
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 9]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 26
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 10]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 =  AnimElem = 27
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 11]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 =  AnimElem = 28
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 12]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 =  AnimElem = 29
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 43
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Flame Particles]
type = Helper
trigger1 = AnimElemTime(24) > 0
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

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 30
moveType = I

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3001



;====<SHINRYUKEN>=
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
trigger1 = AnimElemTime(5) < 0
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
pos = 11,-28
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
value = 3100,0 + 10 * (var(40) = 1)
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1 + 10 * (var(40) = 1)
channel = 0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 3101


;In air
[StateDef 3101]
type = A
physics = N
anim = 3101
moveType = A
ctrl = 0
velSet = 0,-8.5
sprPriority = 1
faceP2 = 1

[State 3101, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3101, Gravity]
type = VelAdd
trigger1 = AnimElemTime(1) >= 0
y = 0.33

[State 3101, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 3101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 3101, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3101, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3101, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = !AILevel && command = "a" || command = "b" || command = "c"
trigger2 = AILevel && Random < 800
var(42) = 2

[State 3101, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 3101, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3101, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(18) < 0
value = 0
ignoreHitPause = 1

[State 3101, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 9 + (var(12) / 2) && (var(15) < 13)
trigger1 = AnimElem = 1 || AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
trigger1 = var(40) != [1,2]
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(12) && AnimElemTime(6) > 0, 7, 14) < 7, 7, fvar(11) * ifElse(var(12) && AnimElemTime(6) > 0, 7, 14))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, Fire Sound]
type = PlaySnd
trigger1 = !Time && var(40) = [1,2]
value = 3100,2
channel = 4

[State 3101, Violent/Master Shinryuken Flames Explod]
type = Explod
trigger1 = !Time && var(40) = [1,2]
anim = 3305
ID = 3105
sprPriority = 3
bindTime = -1
removeTime = 28
posType = P1
pos = 10,-144
scale = ifElse(var(40) = 2, 0.45, 0.35), ifElse(var(40) =  2, 0.3, 0.35)
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, HitDef (Violent/Master)]
type = HitDef
trigger1 = !var(16) && var(15) < 9 + (var(12) / 2) && (var(15) < 13)
trigger1 = AnimElem = 1 || AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
trigger1 = var(40) = [1,2]
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(12) && AnimElemTime(5) > 0, 7, 14) < 7, 7, fvar(11) * ifElse(var(12) && AnimElemTime(5) > 0, 7, 14))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = ifElse(var(15) < 10, 43, 45 + 2 * (var(15) - 9))
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) >= 0 && var(40) = [1,2]
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

[State 3101, PalFX]
type = PalFX
trigger1 = AnimElemTime(14) = 1 && var(40) = 2
time = -1
add = 0,0,0
mul = 100,100,100
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3101, Master Shinryuken Mask]
type = Explod
trigger1 = AnimElem = 15 && var(40) = 2
anim = 3110
ID = 3110
sprPriority = 2
bindTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, Violent/Master Shinryuken Flames Explod Fade Away]
type = Explod
trigger1 = AnimElem = 15 && var(40) = [1,2]
anim = 3306
ID = 3106
sprPriority = 3
posType = P1
pos = 10,-144
scale = ifElse(var(40) = 2, 0.45, 0.35), ifElse(var(40) =  2, 0.3, 0.35)
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 15
moveType = I

[State 3101, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = ifElse(var(40) = 2, 3111, 3001)


;Landing
[StateDef 3111]
type = S
anim = 3111
physics = N
moveType = I
velSet = 0,0

[State 3111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3111, Master Shinryuken Mask]
type = Explod
trigger1 = !Time
anim = 3112
ID = 3112
sprPriority = 2
bindTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3111, PalFX (Fade Away)]
type = PalFX
trigger1 = AnimElemTime(1) < 17 && AnimElemTime(1) >= 10
time = 1
add = 0,0,0
mul = 104 + ((Time - 10) * 20),104 + ((Time - 10) * 20),104 + ((Time - 10) * 20)
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3111, PalFX (Off)]
type = PalFX
trigger1 = AnimElemTime(1) = 17
time = -1
add = 0,0,0
mul = 256,256,256
sinAdd = 0,0,0,1
invertAll = 0
color = 256

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

[State 3111, ChangeState]
type = ChangeState
trigger1 = WinKo
value = 3113

[State 3111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<WIN BY SHINRYUKEN (MASTER)>=
[Statedef 3113]
type = S

[State 3111, Master Shinryuken Mask]
type = Explod
trigger1 = !Time && !NumExplod(3114)
anim = 3114
ID = 3114
facing = ifElse(P2Dist x < 0, -1, 1)
sprPriority = 2
removeTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3113, PalFX]
type = PalFX
trigger1 = 1
time = -1
add = 0,0,0
mul = 100,100,100
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3113, ChangeAnim]
type = ChangeAnim
trigger1 = !Time; && PrevStateNo = 3111
value = 3113

[State 3113, ChangeState]
type = ChangeState
trigger1 = PrevStateNo = 3111
value = 180
ctrl = 1



;====<MAX SHINRYUKEN>=
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
trigger1 = AnimElemTime(7) < 0
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
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
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
value = 3100,0 + 10 * (var(40) = 1)
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1 + 10 * (var(40) = 1)
channel = 0

[State 3150, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 3151


;In air
[StateDef 3151]
type = A
physics = N
anim = 3151
moveType = A
ctrl = 0
velSet = 0,-10.5
sprPriority = 1
faceP2 = 1

[State 3151, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3151, Gravity]
type = VelAdd
trigger1 = AnimElemTime(1) >= 0
y = 0.33

[State 3151, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 3151, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 3151, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3151, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3151, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = !AILevel && command = "a" || command = "b" || command = "c"
trigger2 = AILevel && Random < 800
var(42) = 2

[State 3151, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 3151, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3151, Fire Sound]
type = PlaySnd
trigger1 = !Time && var(40) = [1,2]
value = 3100,2
channel = 4

[State 3151, Violent/Master Shinryuken Flames Explod]
type = Explod
trigger1 = !Time && var(40) = [1,2]
anim = 3305
ID = 3155
sprPriority = 3
bindTime = -1
removeTime = 28
posType = P1
pos = 10,-144
scale = ifElse(var(40) = 2, 0.45, 0.35), ifElse(var(40) =  2, 0.3, 0.35)
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3151, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(18) < 0
value = 0
ignoreHitPause = 1

[State 3151, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 12 + (var(12) / 2) && (var(15) < 17) && var(40) != [1,2]
trigger1 = AnimElem = 1 || AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse((var(12) && AnimElemTime(7) > 0) || (!var(12) && AnimElemTime(5) > 0), 7, 14) < 7, 7, fvar(11) * ifElse((var(12) && AnimElemTime(7) > 0) || (!var(12) && AnimElemTime(5) > 0), 7, 14))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, HitDef (Violent/Master)]
type = HitDef
trigger1 = !var(16) && var(15) < 12 + (var(12) / 2) && (var(15) < 17) && var(40) = [1,2]
trigger1 = AnimElem = 1 || AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse((var(12) && AnimElemTime(7) > 0) || (!var(12) && AnimElemTime(5) > 0), 7, 14) < 7, 7, fvar(11) * ifElse((var(12) && AnimElemTime(7) > 0) || (!var(12) && AnimElemTime(5) > 0), 7, 14))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = ifElse(var(15) < 12, 47, 46 + 2 * (var(15) - 12))
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, Flame Particles]
type = Helper
trigger1 = var(40) = [1,2]
trigger1 = AnimElemTime(1) >= 0
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

[State 3151, PalFX]
type = PalFX
trigger1 = AnimElemTime(14) = 1 && var(40) = 2
time = -1
add = 0,0,0
mul = 100,100,100
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3151, Master Shinryuken Mask]
type = Explod
trigger1 = AnimElem = 15 && var(40) = 2
anim = 3160
ID = 3160
sprPriority = 2
bindTime = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3151, Violent/Master Shinryuken Flames Explod Fade Away]
type = Explod
trigger1 = AnimElem = 15 && var(40) = [1,2]
anim = 3306
ID = 3156
sprPriority = 3
posType = P1
pos = 10,-144
scale = ifElse(var(40) = 2, 0.45, 0.35), ifElse(var(40) =  2, 0.3, 0.35)
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3151, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 15
moveType = I

[State 3151, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = ifElse(var(40) = 2, 3111, 3001)



;====<SHIPPU JINRAIKYAKU>=
[StateDef 3200]
type = S
physics = N
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

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -5,-69
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

[State 3200, Voice 1]
type = PlaySnd
trigger1 = Time = 3 && var(40) != 1
value = 1300,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 3200,0
channel = 0

[State 3200, Voice 1 (Violent]
type = PlaySnd
trigger1 = Time = 3 && var(40) = 1
value = 3100,10
channel = 0

[State 3200, Voice 2 (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3200,10
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 13 || AnimElem = 25 || AnimElem = 36
value = 1,5

[State 3200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2 || AnimElem = 11 || AnimElem = 21 || AnimElem = 31
x = 16

[State 3200, HitDef 1]
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
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 26
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 38
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 45
ID = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 48 && !NumTarget(3200)
moveType = I

[State 3200, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(3200) && AnimElem = 47
value = 3201

[State 3001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3201]
type = A
physics = N
moveType = A
anim = 3201
velSet = 0,0

[State 3201, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 3201, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust"
posType = P1
ownPal = 1

[State 3201, VelSet]
type = VelSet
trigger1 = !Time
y = -4

[State 3201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(27) > 0
y = 0.47

[State 3201, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14 || AnimElem = 17 || AnimElem = 20 || AnimElem = 23 || AnimElem = 26 || AnimElem = 29
trigger2 = AnimElem = 32 || AnimElem = 35 || AnimElem = 38 || AnimElem = 41 || AnimElem = 44 || AnimElem = 47 || AnimElem = 50 || AnimElem = 53
value = 1,2

[State 3201, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 1
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, Penultimate Hits]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 6 || AnimElem = 12 || AnimElem = 18 || AnimElem = 24 || AnimElem = 30 || AnimElem = 36 || AnimElem = 42 || AnimElem = 48
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -6.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 5 && var(15) >= 4
trigger1 = AnimElem = 6 || AnimElem = 12 || AnimElem = 18 || AnimElem = 24 || AnimElem = 30 || AnimElem = 36 || AnimElem = 42 || AnimElem = 48
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -6.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201


;Finish
[StateDef 3201]
type = A
physics = N
moveType = A
anim = 3201
velSet = 0,0

[State 3201, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 3201, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust"
posType = P1
ownPal = 1

[State 3201, VelSet]
type = VelSet
trigger1 = !Time
y = -4

[State 3201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(27) > 0
y = 0.47

[State 3201, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14 || AnimElem = 17 || AnimElem = 20 || AnimElem = 23 || AnimElem = 26 || AnimElem = 29
trigger2 = AnimElem = 32 || AnimElem = 35 || AnimElem = 38 || AnimElem = 41 || AnimElem = 44 || AnimElem = 47 || AnimElem = 50 || AnimElem = 53
value = 1,5

[State 3201, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 1
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, Penultimate Hits]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 6 || AnimElem = 12 || AnimElem = 18 || AnimElem = 24 || AnimElem = 30 || AnimElem = 36 || AnimElem = 42 || AnimElem = 48
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -6.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 5 && var(15) >= 4
trigger1 = AnimElem = 6 || AnimElem = 12 || AnimElem = 18 || AnimElem = 24 || AnimElem = 30 || AnimElem = 36 || AnimElem = 42 || AnimElem = 48
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -6.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3201, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;====<SHIPPU JINRAIKYAKU (SFIII)>=
[StateDef 3205]
type = S
physics = N
moveType = A
anim = 3205
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3205, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3205, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3205, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3205, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3205, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3205, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3205, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3205, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3205, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 43,-71
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3205, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3205, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 1300,0
channel = 0

[State 3205, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,0
channel = 0

[State 3205, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 11 || AnimElem = 21 || AnimElem = 31 || AnimElem = 39
value = 1,5

[State 3205, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 2

[State 3205, VelSet]
type = VelSet
trigger1 = AnimElem = 39
x = 0

[State 3205, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 10
trigger3 = AnimElem = 21
trigger4 = AnimElem = 29
x = 8

[State 3205, HitDef 1/4]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 33
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3205, HitDef 2/3]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
trigger2 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3205, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 40
ID = 3205
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
guard.velocity = -3.32
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3205, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(3205) && AnimElem = 42
value = 3206

[State 3205, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(42) >= 0
moveType = I

[State 3205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3206]
type = A
physics = N
moveType = A
anim = 3206
velSet = 0,0

[State 3206, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 3206, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust"
posType = P1
ownPal = 1

[State 3206, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -6.25;-5.5

[State 3206, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(12) < 0
y = 0.125

[State 3206, VelSet]
type = VelSet
trigger1 = AnimElem = 12
y = 0

[State 3206, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = 0.25

[State 3206, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9 || AnimElem = 12 || AnimElem = 15 || AnimElem = 18
value = 1,5

[State 3206, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -11.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -11.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3206, ChangeState]
type = ChangeState
trigger1 = pos y - 14 > -vel y
value = 1206



;====<MAX SHIPPU JINRAIKYAKU>=
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
trigger1 = time = 3
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
trigger1 = AnimElemTime(9) < 0
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
pos = -5,-69
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 1300,0
channel = 0

[State 3250, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 13 || AnimElem = 25 || AnimElem = 36 || AnimElem = 49 || AnimElem = 52 || AnimElem = 55 || AnimElem = 58
trigger2 = AnimElem = 61 || AnimElem = 64
value = 1,5

[State 3250, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 45
value = 40,0
channel = 3

[State 3250, Dust Helper]
type = Helper
trigger1 = AnimElem = 45
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust"
posType = P1
ownPal = 1

[State 3250, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElem = 45
stateType = A
physics = N

[State 3250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2 || AnimElem = 11 || AnimElem = 21 || AnimElem = 31
x = 16

[State 3250, VelSet]
type = VelSet
trigger1 = AnimElem = 45
x = 11.5
y = -4

[State 3250, VelMul]
type = VelMul
trigger1 = AnimElemTime(45) > 0
x = 0.9

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(64) > 0
y = 0.47

[State 3250, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 2]
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
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 26
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 38
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 39
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 45
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(50) >= 0
value = 0
ignoreHitPause = 0

[State 3250, Hit 8]
type = HitDef
triggerAll = !var(16) && var(15) < 2 && var(15) >= 1
trigger1 = AnimElem = 50 || AnimElem = 56 || AnimElem = 62
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = (P2Dist x + 25) / 4, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x + 25) / 4, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 9]
type = HitDef
triggerAll = !var(16) && var(15) < 3  && var(15) >= 2
trigger1 = AnimElem = 53 || AnimElem = 59 || AnimElem = 65
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = (P2Dist x - 25) / 2, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x - 25) / 2, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 10]
type = HitDef
triggerAll = !var(16) && var(15) < 4 && var(15) >= 3
trigger1 = AnimElem = 56 || AnimElem = 62
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = (P2Dist x + 25) / 2, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = (P2Dist x + 25) / 2, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 11]
type = HitDef
triggerAll = !var(16) && var(15) < 5 && var(15) >= 4
trigger1 = AnimElem = 59 || AnimElem = 65
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -6.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.16, -6.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 66
moveType = I

[State 3250, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201



;====<MAX SHIPPU JINRAIKYAKU (SFIII)>=
[StateDef 3255]
type = S
physics = N
moveType = A
anim = 3205
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3255, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3255, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3255, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3255, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3255, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3255, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3255, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3255, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3255, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 43,-71
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3255, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3255, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 1300,0
channel = 0

[State 3255, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200,0
channel = 0

[State 3255, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 11 || AnimElem = 21 || AnimElem = 31 || AnimElem = 39
value = 1,5

[State 3255, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 4.5

[State 3255, VelSet]
type = VelSet
trigger1 = AnimElem = 39
x = 0

[State 3255, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 10
trigger3 = AnimElem = 21
trigger4 = AnimElem = 29
x = 8

[State 3255, HitDef 1/4]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 33
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
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3255, HitDef 2/3]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
trigger2 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3255, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 40
ID = 3255
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
guard.velocity = -3.32
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3255, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(3255) && AnimElem = 42
value = 3256

[State 3255, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(42) >= 0
moveType = I

[State 3255, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3256]
type = A
physics = N
moveType = A
anim = 3256
velSet = 0,0

[State 3256, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 3256, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust"
posType = P1
ownPal = 1

[State 3256, VelSet]
type = VelSet
trigger1 = !Time
y = -6.25;-5.5

[State 3256, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(1) > 0 && AnimElemTime(26) < 0
y = 0.125

[State 3256, VelAdd]
type = VelAdd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime && AnimElemTime(22) < 0
y = -0.125

[State 3256, VelSet]
type = VelSet
trigger1 = AnimElem = 26
y = 0

[State 3256, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(26) > 0
y = 0.25

[State 3256, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9 || AnimElem = 12 || AnimElem = 15 || AnimElem = 18 || AnimElem = 21 || AnimElem = 24
trigger2 = AnimElem = 27
trigger3 = AnimElem = 30
value = 1,5

[State 3256, Penultimate Hits]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 4 || AnimElem = 10 || AnimElem = 16
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -7.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3256, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 5
trigger1 = AnimElem = 22
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -11.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3256, ChangeState]
type = ChangeState
trigger1 = pos y - 14 > -vel y
value = 1206



;====<JOUEN SHINRYUKEN>=
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
trigger1 = AnimElemTime(6) < 3
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
pos = -28,-68
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Width]
type = Width
trigger1 = AnimElemTime(5) >= 0
player = 32,0
edge = 64,0
ignoreHitPause = 1

[State 3300, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3300, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 5
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = 0,0
givePower = 36,36
pauseTime = 36,36
guard.pauseTime = 36,36
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -4.41
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.5, -3.41
air.cornerPush.velOff = 0
yAccel = 0.18
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -51
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3305
ID = 3300
ignoreHitPause = 1
persistent = 0

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 12

[State 3300, Success]
type = ChangeState
trigger1 = !AnimTime && MoveHit
value = 3310

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 3301


;In air (Whiff)
[StateDef 3301]
type = A
physics = N
anim = 3301
moveType = A
ctrl = 0
velSet = 0,-12.5
sprPriority = 1
faceP2 = 1

[State 3301, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3301, Gravity]
type = VelAdd
trigger1 = AnimElemTime(1) >= 0
y = 0.41

[State 3301, Voice 2]
type = PlaySnd
trigger1 = !Time
value = 3100,1
channel = 0

[State 3301, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 3301, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 3301, Fire Sound]
type = PlaySnd
trigger1 = !Time
value = 3100,2
channel = 4

[State 3301, Flames Explod]
type = Explod
trigger1 = !Time
anim = 3305
ID = 3305
sprPriority = 3
bindTime = -1
removeTime = 28
posType = P1
pos = 10,-144
scale = 0.35,0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3301, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(12) < 0
value = 0
ignoreHitPause = 1

[State 3301, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 1 || AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 4.0 * ifElse(P2Dist x < 0, -1, 1), -11.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3301, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) >= 0
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

[State 3301, Flames Explod Fade Away]
type = Explod
trigger1 = AnimElem = 9
anim = 3306
ID = 3306
sprPriority = 3
posType = P1
pos = 10,-144
scale = 0.35,0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3301, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 9
moveType = I

[State 3301, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3001


;Target
[Statedef 3305]
type = S
movetype= H
physics = N
velset = 0,0

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5012

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3305, StateTypeSet]
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
stateType = A

[State 3305, ForceFeedBack]
type = ForceFeedBack
trigger1 = Anim = 5012
persistent = 0
time = 15
waveForm = SineSquare
ampl = 140

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = HitShakeOver
trigger1 = SelfAnimExist(5051)
value = 5051

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = HitShakeOver
trigger1 = !SelfAnimExist(5051)
value = 5030

[State 3305, ChangeState]
type = SelfState
trigger1 = HitShakeOver
value = 5030


;Success
[StateDef 3310]
type = A
physics = N
anim = 3310
moveType = A
ctrl = 0
velSet = 1.2,-4.5
sprPriority = 1
faceP2 = 1

[State 3310, Width]
type = Width
trigger1 = 1
edge = 64,0

[State 3310, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 3310, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jouen Shinryuken Dust"
posType = P1
ownPal = 1

[State 3310, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.27

[State 3310, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300,0
channel = 0

[State 3310, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
y = -16

[State 3310, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3311


;Ground Hits
[StateDef 3311]
type = S
physics = N
anim = 3311
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3311, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3311, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = 27,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3311, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3311, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 1
ID = 3310
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, 11.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 172), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3550
ID = 3310
ignoreHitPause = 1
persistent = 0

[State 3511, TargetBind 1]
type = TargetBind
trigger1 = NumTarget(3310) && AnimElemTime(7) < 0
pos = 67,0
ID = 3310
ignoreHitPause = 1

[State 3511, TargetBind 2]
type = TargetBind
trigger1 = NumTarget(3310) && AnimElemTime(7) >= 0 && AnimElemTime(17) < 0
pos = 35,0
ID = 3310
ignoreHitPause = 1

[State 3511, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 32

[State 3511, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 8 || AnimElem = 12
trigger2 = AnimElem = 16 || AnimElem = 23
trigger3 = AnimElem = 30
value = 1,5

[State 3311, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.5
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.5
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 45), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.5
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, 0
air.cornerPush.velOff = 0
yAccel = 0.5
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 29
value = 40,0
channel = 3

[State 3311, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 29
stateType = A
physics = N

[State 3311, Dust Helper]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jouen Shinryuken Dust"
posType = P1
ownPal = 1

[State 3311, VelSet]
type = VelSet
trigger1 = AnimElem = 29
y = -4

[State 3311, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(29) >= 0
y = 0.47

[State 3311, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 31
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, 0
air.cornerPush.velOff = 0
yAccel = 0.5
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3312


;Finish
[StateDef 3312]
type = S
physics = N
anim = 3312
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3312, PosAdd]
type = PosAdd
trigger1 = !Time
x = 46

[State 3312, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3312, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3312, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3312, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2

[State 3312, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3100,1
channel = 0

[State 3312, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,1
channel = 4

[State 3312, Flames Explod]
type = Explod
trigger1 = AnimElem = 6
anim = 3315
ID = 3315
sprPriority = 3
bindTime = -1
removeTime = 3
posType = P1
pos = -6,-10
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, Final Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -12.81
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -11.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -78
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3312, Flame Particles]
type = Helper
trigger1 = AnimElemTime(6) >= 0
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

[State 3312, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 40,0
channel = 3

[State 3312, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 3312, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = -12.5

[State 3312, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) >= 0
y = 0.38

[State 3312, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3312, Flames Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 3316
ID = 3316
sprPriority = 3
bindTime = -1
removeTime = 35
posType = P1
pos = -6,-144
scale = 0.35,0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(23) < 0
value = 0
ignoreHitPause = 1

[State 3312, Air Hits]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
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
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -11.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3312, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4, -11.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 66
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3312, Flames Explod Fade Away]
type = Explod
trigger1 = AnimElem = 23
anim = 3306
ID = 3306
sprPriority = 3
posType = P1
pos = -6,-144
scale = 0.35,0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 16
moveType = I

[State 3312, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3313


;Landing
[StateDef 3313]
type = S
anim = 3313
physics = N
moveType = I
velSet = 0,0

[State 3313, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3313, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3313, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3313, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




;====<KUZURYUREPPA>=
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
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -5,-69
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, Voice 1 (Violent]
type = PlaySnd
trigger1 = Time = 3 && var(40) = 1
value = 1600,0
channel = 0

[State 3200, Voice 2 (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3400,0
channel = 0

[State 3400, Voice 1]
type = PlaySnd
trigger1 = Time = 3 && var(40) != 1
value = 1300,0
channel = 0

[State 3400, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 3400,1
channel = 0

[State 3400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 14 || AnimElem = 26 || AnimElem = 38 || AnimElem = 47 || AnimElem = 58 || AnimElem = 69
value = 1,2

[State 3400, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 71
value = 40,0
channel = 1

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2 || AnimElem = 11 || AnimElem = 22 || AnimElem = 32
x = 16

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 46
x = 6

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 57
x = 10

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 68
x = 6

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 71
x = 0

[State 3400, VelMul]
type = VelMul
trigger1 = AnimElemTime(50) >= 0 && AnimElemTime(57) < 0
trigger2 = AnimElemTime(61) >= 0 && AnimElemTime(68) < 0
x = 0.85

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 71
y = -13.5

[State 3400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(71) > 0
y = 0.55

[State 3400, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElem = 71
stateType = A
physics = N

[State 3400, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 27
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 39
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 40
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 7/10]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 47 || AnimElem = 58
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 8/11]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 48 || AnimElem = 59
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 9/12]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 49 || AnimElem = 60
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 13]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 69
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 11,12
guard.pauseTime = 11,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, HitDef 14]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 70
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 11,12
guard.pauseTime = 11,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Air Hits]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 71 || AnimElem = 72 || AnimElem = 73 || AnimElem = 74 || AnimElem = 75 || AnimElem = 76 || AnimElem = 77
ID = 3400
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -12.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Juggle Reset]
type = VarSet
trigger1 = NumTarget(3400) && MoveHit && AnimElemTime(78) >= 0
var(15) = 0
ignoreHitPause = 1

[State 3400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 78
moveType = I

[State 3400, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3001



;====<SHINBU MESSATSU>=
[StateDef 3500]
type = S
physics = N
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
trigger1 = 1
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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 2,-82
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41,0
channel = 1

[State 3500, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0
channel = 3

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 12

[State 3500, VelMul]
type = VelMul
trigger1 = AnimElemTime(7) > 0
x = 0.85

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shinbu Messatsu Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3500, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
ID = 3500
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 11,12
guard.pauseTime = 11,12
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
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3550
ID = 3500
ignoreHitPause = 1
persistent = 0

[State 3500, ChangeState]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3510

[State 3500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 7
moveType = I

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Success
[StateDef 3510]
type = S
moveType = A
physics = N
anim = 3510
ctrl = 0
velSet = 0,0

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(74) < 0
pos = 40,0

[State 3510, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(74) < 0
edge = 40,0

[State 3510, Voice (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3500,0
channel = 0

[State 3510, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 730,1
channel = 0

[State 3510, LP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1 || AnimElem = 3 || AnimElem = 6
value = 1,0

[State 3510, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33 || AnimElem = 63
value = 1,2

[State 3510, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,3

[State 3510, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,4

[State 3510, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 23 || AnimElem = 43 || AnimElem = 54
value = 1,5

[State 3510, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7
trigger1 = var(31) := 0
trigger2 = AnimElem = 34 || AnimElem = 64
trigger2 = var(31) := 2
trigger3 = AnimElem = 16
trigger3 = var(31) := 3
trigger4 = AnimElem = 11
trigger4 = var(31) := 4
trigger5 = AnimElem = 24 || AnimElem = 44 || AnimElem = 55
trigger5 = var(31) := 5

[State 3510, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7
trigger1 = var(35) := 78 || var(36) := -84
trigger2 = AnimElem = 11
trigger2 = var(35) := 70 || var(36) := -82
trigger3 = AnimElem = 16
trigger3 = var(35) := 85 || var(36) := -47
trigger4 = AnimElem = 24
trigger4 = var(35) := 172 || var(36) := -66
trigger5 = AnimElem = 34
trigger5 = var(35) := 103 || var(36) := -88
trigger6 = AnimElem = 44
trigger6 = var(35) := 44 || var(36) := -60
trigger7 = AnimElem = 55
trigger7 = var(35) := 60 || var(36) := -75
trigger8 = AnimElem = 64
trigger8 = var(35) := 103 || var(36) := -66

[State 3510, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7 || AnimElem = 11 || AnimElem = 34 || AnimElem = 55 || AnimElem = 64
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3510, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =AnimElem = 16 || AnimElem = 24 || AnimElem = 44
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3510, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 74
ID = 3510
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 231 < 7, 7, fvar(11) * 231)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -26.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.5, -26.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 98
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3510, Orochi Skull Sound]
type = PlaySnd
trigger1 = NumTarget(3510) && MoveHit && AnimElemTime(74) >= 0
value = 3500,1
channel = 1
persistent = 0

[State 3510, Orochi Skull]
type = Helper
trigger1 = NumTarget(3510) && MoveHit && AnimElemTime(74) >= 0
helperType = Normal
stateNo = 3525
ID = 3525
name = "Orochi Skull"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3510, Flame Particles]
type = Helper
trigger1 = AnimElemTime(74) > 0
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

[State 3510, End]
type = ChangeState
trigger1 = !AnimTime
value = 3520


;Finish
[StateDef 3520]
type = A
moveType = A
physics = N
anim = 3520
ctrl = 0
velSet = 0,-10.5

[State 3520, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 3520, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3530


;Landing
[StateDef 3530]
type = S
anim = ifElse(var(40) = 2, 3531, 3530)
physics = N
moveType = I
velSet = 0,0

[State 3530, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3530, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3530, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3530, Voice (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3500,2
channel = 0

[State 3530, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 3500,3
channel = 0

[State 3530, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3550]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3550, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3550, HitFallSet]
type = HitFallSet
trigger1 = Time = 0
value = 0

[State 3550, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5002

[State 3550, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3550, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3551


;Sliding
[StateDef 3551]
type = S
movetype = H
physics = S

[State 3551, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5007

[State 3551, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3551, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;====<GUREN SENPUKYAKU>=
[StateDef 3600]
type = S
physics = N
moveType = A
anim = 3600
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
var(17) = 43

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
trigger1 = AnimElemTime(12) < 0
time = 1
value = SCA

[State 3600, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 41,-90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3600, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3600,0
channel = 0

[State 3600, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 40,0
channel = 1

[State 3600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 12 || AnimElem = 15 || AnimElem = 22 || AnimElem = 29 || AnimElem = 36
trigger2 = AnimElem = 43 || AnimElem = 50 || AnimElem = 57 || AnimElem = 64 || AnimElem = 71
trigger3 = AnimElem = 78
value = 1,5

[State 3600, Pushbox Helper]
type = Helper
trigger1 = AnimElem = 11
trigger2 = AnimElem = 84
helperType = Normal
stateNo = 10247
ID = 10247
name = "Guren Senpukyaku Pushbox"
posType = P1
ownPal = 1

[State 3600, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 84
x = 30

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 14
x = 4
y = -3.125

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 17
y = 0

[State 3600, Gravity]
type = VelAdd
trigger1 = AnimElemTime(80) > 0
y = 0.25

[State 3600, Velocity]
type = VelMul
trigger1 = AnimElemTime(82) >= 0
x = 0.88
persistent = 1

[State 3600, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 14
stateType = A
physics = N

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 14
helperType = Normal
stateNo = 8100
ID = 8100
name = "Guren Senpukyaku Dust"
posType = P1
ownPal = 1

[State 3600, Width]
type = Width
trigger1 = AnimElemTime(14) > 0 && AnimElemTime(80) < 0
edge = 84,0
player = 30,0

[State 3600, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1100,1
channel = 3

[State 3600, Flames Explod (Initial)]
type = Explod
trigger1 = AnimElem = 13
anim = 3604
sprPriority = 1
posType = P1
pos = 20,10
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 23
trigger3 = AnimElem = 30
trigger4 = AnimElem = 37
trigger5 = AnimElem = 44
trigger6 = AnimElem = 51
trigger7 = AnimElem = 58
trigger8 = AnimElem = 65
trigger9 = AnimElem = 72
trigger10 = AnimElem = 79
value = 1100,1

[State 3600, Flames Explod (Front)]
type = Explod
trigger1 = AnimElem = 16
trigger2 = AnimElem = 23
trigger3 = AnimElem = 30
trigger4 = AnimElem = 37
trigger5 = AnimElem = 44
trigger6 = AnimElem = 51
trigger7 = AnimElem = 58
trigger8 = AnimElem = 65
trigger9 = AnimElem = 72
trigger10 = AnimElem = 79
anim = 3605
sprPriority = 3
posType = P1
pos = 32, -48
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, Flames Explod (Back)]
type = Explod
trigger1 = AnimElem = 20
trigger2 = AnimElem = 27
trigger3 = AnimElem = 34
trigger4 = AnimElem = 41
trigger5 = AnimElem = 55
trigger6 = AnimElem = 62
trigger7 = AnimElem = 69
trigger8 = AnimElem = 76
anim = 3606
sprPriority = 1
posType = P1
pos = 29, -9
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, Hit 1]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
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
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -101
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Flame Particles]
type = Helper
trigger1 = AnimElemTime(13) > 0
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

[State 3600, Hits 2-9]
type = HitDef
triggerAll = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 16
trigger2 = AnimElem = 23
trigger3 = AnimElem = 30
trigger4 = AnimElem = 37
trigger5 = AnimElem = 44
trigger6 = AnimElem = 51
trigger7 = AnimElem = 58
trigger8 = AnimElem = 65
trigger9 = AnimElem = 72
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = -3.32,0
ground.cornerPush.velOff = 0
guard.velocity = -3.32
guard.cornerPush.velOff = 0
air.velocity = -3.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -90
palFX.time = 32
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Final Hit]
type = HitDef
triggerAll = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 79
ID = 3600
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 1.56, -7.51
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 1.56, -7.51
air.cornerPush.velOff = 0
yAccel = 0.25
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -90
palFX.time = 56
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Voice 3]
type = PlaySnd
trigger1 = MoveHit = 1 && NumTarget(3600)
value = 3600,1
channel = 0
ignoreHitPause = 1
persistent = 0

[State 3600, PlayerPush]
type = PlayerPush
trigger1 = NumTarget(3600)
value = 0
ignoreHitPause = 1

[State 3600, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(3600)
trigger1 = pos y > -vel y
value = 3610

[State 3600, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1206


;Finish
[StateDef 3610]
type = S
anim = 3610
physics = N
moveType = A
velSet = 0,0

[State 3610, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3610, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3610, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3610, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3610, Voice]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3610,0
channel = 0

[State 3610, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 40,0
channel = 1

[State 3610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,5

[State 3610, PosAdd]
type = PosAdd
trigger1 = AnimElem = 15
x = 20
y = 8

[State 3610, VelSet]
type = VelSet
trigger1 = AnimElem = 9
y = -2.6

[State 3610, Gravity]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = 0.225

[State 3610, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 9
stateType = A
physics = N

[State 3610, Dust Helper]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8100
ID = 8100
name = "Guren Senpukyaku Dust"
posType = P1
ownPal = 1

[State 3610, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1100,1
channel = 3

[State 3610, Flames Explod]
type = Explod
trigger1 = AnimElem = 10
anim = 3615
sprPriority = 3
posType = P1
pos = 38, -8
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3610, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < (2 + HitCount)
trigger1 = AnimElem = 11
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
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
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -90
palFX.time = 68
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3610, Flame Particles]
type = Helper
trigger1 = AnimElemTime(11) > 0
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


[State 3610, End]
type = ChangeState
trigger1 = pos y - 8 > -vel y
value = 1206



;====<DOUBLE SHINKU HADOKEN>=
[StateDef 4000]
type = S
physics = N
moveType = I
anim = 0
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 4000, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x > P2Dist x
trigger1 = Anim = 0
value = 105

[State 4000, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x < P2Dist x
trigger1 = Anim = 0
value = 110

[State 4000, Dash Backwards]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 105
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 4000, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 105
value = 105,0

[State 4000, VelSet]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 110
x = 7.76

[State 4000, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0 && Anim = 110
x = 0.98

[State 4000, Dash Sound]
type = PlaySnd
trigger1 = Anim = 110 && AnimElemTime(1) = 0
value = 110,0

[State 4000, Dust Helper]
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

[State 4000, Dust Helper]
type = Helper
trigger1 = AnimElem = 2 && (Anim = 105 || Anim = 110)
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 4000, ChangeState]
type = ChangeState
trigger1 = Partner, StateNo = 3601
value = 4001

[State 4000, End]
type = ChangeState
triggerAll = !AnimTime
trigger1 = Anim = 105
trigger2 = Anim = 110
value = ifElse(Anim = 105, 106, 111)


;Success
[StateDef 4001]
moveType = A
velSet = 0,0

[State 4001, Landing Sound]
type = PlaySnd
trigger1 = !Time && (Anim = 105 || Anim = 110)
value = 100,1

[State 4001, Landing Dust Explod]
type = Explod
trigger1 = !Time && (Anim = 105 || Anim = 110)
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4001, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 4001

[State 4001, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 4001, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 4001, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 4001, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 4001, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 4001, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 4001, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4001, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < -1
time = 1
value = SCA

[State 4001, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4001,0
channel = 0

[State 4001, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 4001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SOURYUKEN>=
[StateDef 4100]
type = S
physics = N
moveType = A
anim = 4100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 4100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 4100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 4100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 4100, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 4100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 4100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 4100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 4100, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = -8,-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4100, Super Pause FX (Partner)]
type = Helper
trigger1 = Time = 2 && NumPartner
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(P2Dist x + Partner, P2Dist x),-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4100, Super Pause]
type = SuperPause
trigger1 = AnimElem = 4
time = 33
moveTime = 33
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 4100, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 2
value = 8500,0

[State 4100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 4100, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300,0
channel = 0

[State 4100, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Souryuken Dust"
posType = P1
ownPal = 1

[State 4100, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = P2Dist x/36
y = -15.5

[State 4100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = 1

[State 4100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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
air.velocity = 0, -7.49
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4100, ChangeState]
type = ChangeState
triggerAll = NumPartner && NumTarget
triggerAll = Partner, facing != facing
trigger1 = pos y > -vel y
trigger1 = MoveHit && Partner, MoveHit && Target, Alive
trigger1 = Target, StateType != A
value = 4101

[State 4100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Connected
[StateDef 4101]
type = S
moveType = A
physics = N
anim = 4101
ctrl = 0
velSet = 0,0
moveHitPersist = 1

[State 4101, PosAdd]
type = PosAdd
trigger1 = !Time
x = ceil(P2Dist X - 50)

[State 4101, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 4101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4101, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1

[State 4101, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,1

[State 4101, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 21 || AnimElem = 30
value = 1,2

[State 4101, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5

[State 4101, Hit Sound]
type = Null
trigger1 = AnimElem = 17
trigger1 = var(31) := 1
trigger2 = AnimElem = 8 || AnimElem = 9
trigger2 = var(31) := 5

[State 4101, Spark XY]
type = Null
trigger1 = AnimElem = 8 || AnimElem = 9
trigger1 = var(35) := 60 || var(36) := -80
trigger2 = AnimElem = 17
trigger2 = var(35) := 92 || var(36) := -72

[State 4101, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8 || AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
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
air.velocity = 0, -7.49
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
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
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
air.velocity = 0, -7.49
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
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -18.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 37), var(36) := -91
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, Souryuken Portraits]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8521
ID = 8521
name = "Souryuken Portraits"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause FX]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause FX (Partner)]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(P2Dist x + Partner, P2Dist x) - 5,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause]
type = SuperPause
trigger1 = AnimElem = 30
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 4101, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 30
value = 3000,0
channel = 0

[State 4101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 30
value = 1,2
channel = 1

[State 4101, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 40,0
channel = 3

[State 4101, Dust Helper]
type = Helper
trigger1 = AnimElem = 33
helperType = Normal
stateNo = 8100
ID = 8100
name = "Souryuken Dust"
posType = P1
ownPal = 1

[State 4101, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 33
stateType = A
physics = N

[State 4101, Velocity]
type = VelSet
trigger1 = AnimElem = 33
y = -9.5

[State 4101, Gravity]
type = VelAdd
trigger1 = AnimElemTime(33) >= 2
y = 0.47

[State 4101, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 33
ID = 4101
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 174 < 7, 7, fvar(11) * 174)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -14.81
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 4101, Voice 2]
type = PlaySnd
trigger1 = AnimElemTime(33) = 6
value = 1100,0
channel = 0

[State 4101, Pause]
type = Pause
trigger1 = AnimElemTime(33) < 6 && NumTarget(4101) && MoveHit
time = 2

[State 4101, Kanji Helper]
type = Helper
trigger1 = AnimElemTime(33) = 6
helperType = Normal
stateNo = 4105
ID = 4105
name = "Superpause FX"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause]
type = SuperPause
trigger1 = AnimElemTime(33) = 6
time = 60
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 4101, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 4110



;Landing
[StateDef 4110]
type = S
anim = 4110
physics = N
moveType = I
velSet = 0,0

[State 4110, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 4110, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4110, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 4110, ChangeState]
type = ChangeState
trigger1 = WinKO
value = 4111

[State 4110, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !NumTarget && AnimElemTime(2) >= 0
value = 0
ctrl = 1



;====<WIN BY SOURYKEN>=
[Statedef 4111]
type = S

[State 4111, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 4110
value = 181, 0 + (random % 2)
channel = 0

[State 4111, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 4110 && AnimElemTime(5) = 0
value = 181
elem = 4

[State 4111, ChangeState]
type = ChangeState
trigger1 = PrevStateNo = 4110
value = 180
ctrl = 1

