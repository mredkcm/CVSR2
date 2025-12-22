; _________________________________________
;| Feilong by varo_hades                  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<REKKA SHINKEN>=
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
trigger1 = Time = 0
time = 42
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000, 0]
type = Width
trigger1 = 1
value = 20,0

[State 1100, Voice]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = AnimElem = 6
value = 1, 2

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = AnimElem = 6
value = 4, 0
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3001
trigger1 = AnimElem = 1,1
value = 1, 2

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3001
trigger1 = AnimElem = 1,1
value = 4, 2
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = Anim = 3000
trigger2 = AnimElem = 6
trigger3 = Anim = 3001
trigger3 = AnimElem = 1,1
x = 8

[State 3000, VelSet]
type = VelSet
trigger1 = Anim = 3001
trigger1 = AnimElem = 5,1
x = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 8,12
guard.pauseTime = 8,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -6.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 8,12
guard.pauseTime = 8,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -6.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3001
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 8,12
guard.pauseTime = 15,10
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3010, 5]
type = ChangeAnim
trigger1 = Time = 86
value = 3001

[State 3010, 5]
type = ChangeState
trigger1 = Time = 135
value = 0
ctrl = 1

;====<MAX REKKA SHINKEN>=
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
var(17) = 33

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
trigger1 = Time = 0
time = 50
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-70 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000, 0]
type = Width
trigger1 = 1
value = 20,0

[State 1100, Voice]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = AnimElem = 6
value = 1, 2

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = AnimElem = 6
value = 4, 0
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3001
trigger1 = AnimElem = 1,1
value = 1, 2

[State 3000, PlaySnd]
type = PlaySnd
triggerall = Anim = 3001
trigger1 = AnimElem = 1,1
value = 4, 2
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = Anim = 3000
trigger1 = AnimElem = 2,1
trigger2 = Anim = 3000
trigger2 = AnimElem = 6
trigger3 = Anim = 3001
trigger3 = AnimElem = 1,1
x = 8

[State 3000, VelSet]
type = VelSet
trigger1 = Anim = 3001
trigger1 = AnimElem = 5,1
x = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 8,12
guard.pauseTime = 8,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -6.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 8,12
guard.pauseTime = 8,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -6.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3001
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 8,10
guard.pauseTime = 15,10
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3010, 5]
type = ChangeAnim
trigger1 = Time = 106
value = 3001

[State 3010, 5]
type = ChangeState
trigger1 = Time = 145
value = 0
ctrl = 1

;====<SHIEN RENKYAKU>=
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
trigger1 = Time = 0
time = 48
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-20 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3110, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3100, 0
channel = 0

[State 3200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 20

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100, 1

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1100, 0
channel = 0

[State 3100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  Time = 0
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3200, Flame (Rise)]
type = Explod
triggerall = Anim = 3100
trigger1 = AnimElem = 8
id = 3100
anim = 3105
pos = 37,-53
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, 5]
type = VelSet
trigger1 = AnimTime = 0
x = 5
y = -10.5

[State 3200, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3111

;====<SHIEN RENKYAKU ATTACK>=
[Statedef 3111]
type = A
movetype = A
physics = N
juggle = 4
anim = 3101
ctrl = 0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.52, -10
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.52, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -80
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3200, Flame]
type = RemoveExplod
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
id = 3100

[State 3200, Flame (Rise)]
type = Explod
trigger1 = AnimElem = 1
id = 3100
anim = 3106
pos = 12,-73
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Back))]
type = Explod
trigger1 = AnimElem = 2
id = 3100
anim = 3107
pos = -15,-84
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Left)]
type = Explod
trigger1 = AnimElem = 3
id = 3100
anim = 3108
pos = -12,-73
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Front)]
type = Explod
trigger1 = AnimElem = 4
id = 3100
anim = 3109
pos = 8,-77
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 0,Explod]
type = Explod
trigger1 = Time = 0
anim = 3121
sprpriority = -2
postype = p1
pos = 10,-95
bindtime = 8
facing = 1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
trigger1 = Time = 6
anim = 3120
sprpriority = 2
postype = p1
pos = 0,-95
bindtime = 8
facing = 1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 3121
sprpriority = 2
postype = p1
pos = 0,-125
bindtime = 1
facing = -1
pausemovetime = 0
removetime = -2
scale = 0.6,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3200, 5]
type = VelAdd
trigger1 = 1
y = .5

[State 3200, 1]
type = VelMul
trigger1 = 1
x = .9

[State 3200, 2]
type = VelSet
trigger1 = Vel Y > 0
x = 0

[State 3200, 5]
type = ChangeState
triggerall = Anim = 3101
trigger1 = Vel Y > 0
value = 3130

;Shien Renkyaku - Coming Down
[Statedef 3130]
type = A
movetype= A
physics = N
juggle = 4
anim = 3102
ctrl = 0

[State 3230, VelAdd]
type = VelAdd
trigger1 = 1
y = .4

[State 3230, End]
type = ChangeState
trigger1 = Pos Y >= 0
value = 3131

;Landing
[StateDef 3131]
type = S
anim = 3111
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX SHIEN RENKYAKU>=
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
trigger1 = Time = 0
time = 51
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-20 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3110, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3100, 0
channel = 0

[State 3200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
x = 20

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100, 1

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1100, 0
channel = 0

[State 3100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  Time = 0
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3200, Flame (Rise)]
type = Explod
triggerall = Anim = 3100
trigger1 = AnimElem = 8
id = 3100
anim = 3105
pos = 37,-53
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, 5]
type = VelSet
trigger1 = AnimTime = 0
x = 5.5
y = -12

[State 3200, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3161

;====<MAX SHIEN RENKYAKU ATTACK>=
[Statedef 3161]
type = A
movetype = A
physics = N
juggle = 4
anim = 3101
ctrl = 0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
trigger9 = AnimElem = 9
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.52, -11
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.52, -11
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -80
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3200, Flame]
type = RemoveExplod
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
trigger5 = AnimElem = 5
trigger6 = AnimElem = 6
trigger7 = AnimElem = 7
trigger8 = AnimElem = 8
id = 3100

[State 3200, Flame (Rise)]
type = Explod
trigger1 = AnimElem = 1
id = 3100
anim = 3106
pos = 12,-73
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Back))]
type = Explod
trigger1 = AnimElem = 2
id = 3100
anim = 3107
pos = -15,-84
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Left)]
type = Explod
trigger1 = AnimElem = 3
id = 3100
anim = 3108
pos = -12,-73
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 3200, Flame (Front)]
type = Explod
trigger1 = AnimElem = 4
id = 3100
anim = 3109
pos = 8,-77
postype = p1
bindtime = -1
supermove = 1
persistent = 0
sprpriority = 2
scale = 0.5,0.5
removetime = 2
shadow = 100,100,100

[State 0,Explod]
type = Explod
trigger1 = Time = 0
anim = 3121
sprpriority = -2
postype = p1
pos = 10,-95
bindtime = 8
facing = 1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
trigger1 = Time = 6
anim = 3120
sprpriority = 2
postype = p1
pos = 0,-95
bindtime = 8
facing = 1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 3121
sprpriority = 2
postype = p1
pos = 0,-125
bindtime = 1
facing = -1
pausemovetime = 0
removetime = -2
scale = 0.6,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3200, 5]
type = VelAdd
trigger1 = 1
y = .5

[State 3200, 1]
type = VelMul
trigger1 = 1
x = .9

[State 3200, 2]
type = VelSet
trigger1 = Vel Y > 0
x = 0

[State 3200, 5]
type = ChangeState
triggerall = Anim = 3101
trigger1 = Vel Y > 0
value = 3130

;====<GEKIRINKEN>=
[StateDef 3200]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
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
trigger1 = 1
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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(0 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3, ???]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,0
channel = 0

[state 3600,counter]
type=reversaldef
trigger1 = Animelem = 6
attr = S,HT
reversal.attr = SCA,NA,SA
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -50
p1stateno=3210
p2stateno=3220
id=3200

[State 800,***]
type = TargetBind
trigger1 = NumTarget(3200)
pos = ceil(60*const(size.xscale)),0
ID = 3200
IgnoreHitPause = 1
Persistent = 0

[state 3600,bekaar]
type=statetypeset
trigger1=!animelemtime(7)
movetype=I

[state 3600,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;Connect
[Statedef 3210]
type = S
movetype = A
physics = N
anim = 3210
VelSet = 0,0

[State 1000,***]
type = Pause
trigger1 = 1
time = 2
movetime = 2

[State 1000, 3]
type = VelSet
trigger1 = time = 1
y = -5

[State 5]
type = veladd
trigger1 = 1
y = 0.5

[State 3, ???]
type = PlaySnd
trigger1 = animelem = 4
value = 3200,2
channel = 0

[State 810,***]
type = TargetState
trigger1 = time = 0
value = 3220

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0&&Pos Y > 0
value = 3211

;Attack
[Statedef 3211]
type = S
movetype = A
physics = U
anim = 3211
velset = 0,0

[State 1000, 3]
type = Posset
trigger1 = animelem = 1
y = 0

[State 810,***]
type = TargetState
trigger1 = time = 0
value = 3215

[State 810, ????????]
type = TargetBind
trigger1 =  AnimElem = 1
pos = ceil(60*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = -1

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-20 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, ??????????????]
type = TargetLifeAdd
trigger1 = AnimElem = 1
value = ceil(ifElse(110 * fvar(11) < 7, -7, -110 * fvar(11)))
kill = 0

[State 810, 4]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,5

[State 200, ?????]
type = PlaySnd
trigger1 = animelem = 1
value = 820, 2

[State 3000, 3]
type = EnvShake
trigger1 = animelem = 1
time = 20
freq = 60
ampl = -4
phase = 90

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -40, 0
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = animelem = 2
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 810, ??????]
type = ChangeState
trigger1 = var(1) = 0
trigger1 = AnimTime = 0
value = 3212

[State 810, ??????]
type = ChangeState
trigger1 = var(1) = 0
trigger1 = AnimTime = 0
value = 3213

;Punches
[Statedef 3212]
type = S
movetype = A
physics = U
anim = 3212

[State 810,***]
type = TargetState
trigger1 = time = 0
value = 3216

[State 810, ????????]
type = TargetBind
trigger1 =  AnimElem = 1
pos = ceil(60*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = -1

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 1 || AnimElem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(50 * const(size.xScale)), ceil(-70 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, ??????????????]
type = TargetLifeAdd
trigger1 = AnimElem = 1||AnimElem = 3
value = Ceil(ifelse(var(1) = 2,-14,ifelse(var(1) = 1,-14,-14))*fvar(11)*(const(data.attack)*0.01))
kill = 0

[State 3, ???]
type = PlaySnd
Trigger1 = PrevStateno != 3212
trigger1 = time = 0
value = 3200,1
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = AnimElem = 1||AnimElem = 3
value = 2,2
channel = 1 + Random % 8

[State 200, ?????]
type = PlaySnd
trigger1 = AnimElem = 1||AnimElem = 3
value = 820, 2
channel = 1 + Random % 8

[State 5120, 4]
type = HitAdd
trigger1 = AnimElem = 1||AnimElem = 3
value = 1

[State 3000, 3]
type = EnvShake
trigger1 = AnimElem = 1||AnimElem = 3
time = 20
freq = 60
ampl = -4
phase = 90

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 1||AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -40,0
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 1||AnimElem = 3
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State -2, ????]
type = Varset
Trigger1 = PrevStateno != 3212
trigger1 = time = 0
var(2) = 0

[State -2, ????]
type = Varadd
trigger1 = AnimElem = 2
var(2) = 1

[State 810, ??????]
type = ChangeState
triggerall = ifelse(var(1) = 2,var(2) < 12,ifelse(var(1) = 0,var(2) < 8,var(2) < 2))
trigger1 = Animelem = 25
value = 3213

[State 810, ??????]
type = ChangeState
triggerall = ifelse(var(1) = 2,var(2) >= 12,ifelse(var(1) >= 0,var(2) = 8,var(2) = 2))
trigger1 = animtime = 0
value = 3213

;End
[Statedef 3213]
type = S
movetype = A
physics = U
anim = 3213

[State 810,***]
type = TargetState
trigger1 = time = 0
value = 3217

[State 810,***]
type = Targetvelset
trigger1 =  AnimElem = 7
x = -5

[State 810,***]
type = TargetState
trigger1 =  AnimElem = 7
value = 3230

[State 810, ????????]
type = TargetBind
trigger1 =  AnimElem = 1
pos = ceil(80*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = 1

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-55 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, ??????????????]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value = ceil(ifElse(105 * fvar(11) < 7, -7, -105 * fvar(11)))

[State 5120, 4]
type = HitAdd
trigger1 = AnimElem = 7
value = 1

[State 3, ???]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,3
channel = 0

[State 3, ???]
type = PlaySnd
trigger1 = animelem = 7
value = 3200,4
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = animelem = 7
value = 2,2

[State 200, ?????]
type = PlaySnd
trigger1 = animelem = 7
value = 820, 2

[State 3000, 3]
type = EnvShake
trigger1 = animelem = 7
time = 20
freq = 60
ampl = -4
phase = 90

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -40, 0
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 810, ??????]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3215]
type = S
movetype = H
velset = 0,0

[State 811, ????????????]
type = ChangeAnim2
Trigger1 = time = 0
value = 3215

[State 10000, ??]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;Player 2
[Statedef 3216]
type = S
movetype = H
velset = 0,0

[State 811, ????????????]
type = ChangeAnim2
Trigger1 = time = 0
value = 3216

[State 10000, ??]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;Player 2
[Statedef 3217]
type = S
movetype = H
velset = 0,0

[State 811, ????????????]
type = ChangeAnim2
Trigger1 = time = 0
value = 3217

[State 10000, ??]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;Player 2
[Statedef 3220]
type = S
movetype = H
velset = 0,0

[State 10000, ??]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;Special State
[Statedef 3230]
type = A
movetype = H
physics = N

[State 5600, ???]
type = Turn
triggerall = roundstate = 2
trigger1 = P2BodyDist X !=[0,360]

[State 1];????????
type = NotHitBy
trigger1 = 1
value = SCA

[State 1994, ??????]
type = ChangeState
triggerall = PrevStateno =[3231,3232]
trigger1 = Time = 0
value = 3232

[State 210, 3]
type = PlayerPush
trigger1 = 1
value = 0

[State 820, ????????????]
type = ChangeAnim
Trigger1 = Time = 0
value = ifelse(SelfAnimExist(5052) = 1,5052,5030)

[State 821, ????]
type = VelAdd
trigger1 = BackEdgeBodyDist >= 10
trigger2 = FrontEdgeBodyDist >= 10
x = -2

[State 821, ????]
type = Velset
trigger1 = time = 0
y = 0

[State 1993, ??????] ;??????????????
type = ChangeState
trigger1 = BackEdgeBodyDist <= 10
trigger2 = FrontEdgeBodyDist <= 10
value = 3231

[State 821, ????????????????]
type = SelfState
trigger1 = time = 100
value = 5100

;Special State 2
[Statedef 3231]
type = A
movetype = H
physics = N

[State 1];????????
type = NotHitBy
trigger1 = 1
value = SCA

[State 1995, ????]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 1995, ????]
type = Veladd
trigger1 = Time = 0
x = 0
y = 0

[State 820, ????????????]
type = ChangeAnim
Trigger1 = Time = 0
value = 5000

[State 1994, ????]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 20)

[State 1994, ?????]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist
y = -10

[State 1994, ??????]
type = PosFreeze
trigger1 = 1
x = 0
y = 0

[State 1994, ???????????]
type = null;ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1000, 3]
type = EnvShake
Trigger1 = Time = 0
time = 20
freq = 60
ampl = -4
phase = 120

[state 905, avaaz]
type = playsnd
trigger1 = !time
value = f7,0
volumescale = 100

[state 905, prakash]
type = explod
trigger1 = backedgedist<frontedgedist
trigger1 = !time
anim = f72
postype = back
pos = 0,ceil(screenpos y+(const(size.mid.pos.y)))
facing = 1
bindtime = 2
random = 0,0
velocity = 0.0,0.0
accel = 0,0
ownpal = 1
scale = 0.6,0.6
sprpriority = 5
supermovetime = -1
pausemovetime = -1

[State 1994, ??????]
type = ChangeState
trigger1 = Time = 5
value = 3232

;Special State 3
[Statedef 3232]
type = A
movetype = H
physics = N

[State 210, 3]
type = PlayerPush
trigger1 = 1
value = 0

[State 1995, ????]
type = VelSet
trigger1 = Time = 0
x = 0
y = -6.5

[State 1995, ?????]
type = VelAdd
trigger1 = 1
y = .33

[State 1995, ?????]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(SelfAnimExist(5052) = 1,5052,5050)

[State 1995, ?????????]
type = SelfState
trigger1 = (Vel Y > 0) && (Pos Y >= 0)
value = 5100

;====<RYU YASSAI>=
[StateDef 3300]
type = S
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
trigger1 = Time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(42 * const(size.xScale)), ceil(-57 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 2
time = 34
moveTime = 34
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300, 0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 0
channel = 1

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1, 2

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, 3
channel = 0

[State 0,Explod]
type = Explod
trigger1 = time = 44
anim = 3301
ID = 3300
sprpriority = 3
postype = p1
pos = 75,-55
bindtime = 1
facing = 1
pausemovetime = 10
removetime = -2
scale = 0.7,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 25,25
guard.pauseTime = 15,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3100, RyuShinYassai]
type = ChangeState
triggerall = P2StateType != A
trigger1 = AnimElem = 8 && movehit
value = 3301

[State 3100, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Ryu Shin Yassai
[Statedef 3301]
type = S
movetype= A
physics = S
juggle = 4
ctrl = 0
velset = 15,0
anim = 3302

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3200, 0]
type = Width
trigger1 = 1
value = 10,0

[State 3200, Anim]
type = ChangeAnim
trigger1 = Time < 5
value = 3302

[State 3200, VelSet]
type = VelSet
trigger1 = Anim = 3202
trigger1 = AnimElem = 5
x = 6

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 0
channel = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3300, 2
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
value = 1,2

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 3
triggerall = Anim = 3302
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 4]
type = HitDef
triggerAll = !var(16) && var(15) < 4
triggerall = Anim = 3302
trigger1 = AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 25
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.92, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = -1.92, -9.5
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 3303

; Ryu Yassai - Special Motion
[Statedef 3303]
type = S
movetype= A
physics = S
juggle = 4
velset = 0,0
anim = 3303
ctrl = 0

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300, 0
channel = 0

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 12

[State 3100, Anim]
type = ChangeState
trigger1 = AnimTime = 0
value = 3304

; Ryu Yassai - Flying Kick
[Statedef 3304]
type = A
movetype= A
physics = N
juggle = 4
velset = 0,0
anim = 3304
ctrl = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3100, Pause]
Type = Pause
trigger1 = MoveHit
Trigger1 = (Time = [25,35]) && EnemyNear, Life >= 1
time = 6

[State 3100, 1]
type = VelAdd
triggerall = Time >= 5
trigger1 = Vel X > 0
x = -.2

[State 3100, 1]
type = VelAdd
trigger1 = Time >= 5
y = .5

[State 3100, 1]
type = PosAdd
trigger1 = AnimElem = 2
x = 25

[State 3100, 2]
type = VelSet
trigger1 = AnimElem = 3
x = 12
y = -11

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200, 4
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000, 0
channel = 1

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5

[State 0,Explod]
type = Explod
trigger1 = animelem = 4
anim = 3325
ID= 3304
sprpriority = 3
postype = p1
pos = 3,-43
bindtime = -1
facing = 1
pausemovetime = 0
removetime = 25
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0;
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 5
trigger1 = Time = 0
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 12,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, 5]
type = ChangeState
triggerall = Time > 10
trigger1 = Pos Y >= 0
value = 3355

;====<MAX RYU YASSAI>=
[StateDef 3350]
type = S
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
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
trigger1 = time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(42 * const(size.xScale)), ceil(-57 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 2
time = 34
moveTime = 34
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300, 0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 0
channel = 1

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1, 2

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, 3
channel = 0

[State 0,Explod]
type = Explod
trigger1 = time = 44
anim = 3301
ID = 3300
sprpriority = 3
postype = p1
pos = 75,-55
bindtime = 1
facing = 1
pausemovetime = 10
removetime = -2
scale = 0.7,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 =  AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 25,25
guard.pauseTime = 15,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

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

[State 3100, RyuShinYassai]
type = ChangeState
triggerall = P2StateType != A
trigger1 = AnimElem = 8 && movehit
value = 3351

[State 3100, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Ryu Shin Yassai
[Statedef 3351]
type = S
movetype= A
physics = S
juggle = 4
ctrl = 0
velset = 15,0
anim = 3352

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3200, 0]
type = Width
trigger1 = 1
value = 10,0

[State 3200, Anim]
type = ChangeAnim
trigger1 = Time < 5
value = 3352

[State 3200, VelSet]
type = VelSet
trigger1 = Anim = 3252
trigger1 = AnimElem = 20
x = 6

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
value = 4, 0
channel = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4, 4
channel = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4, 1
channel = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = 4, 2
channel = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 21
value = 3300, 2
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
trigger5 = AnimElem = 18
trigger6 = AnimElem = 22
value = 1,2

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 3
triggerall = Anim = 3352
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 4
triggerall = Anim = 3352
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 3]
type = HitDef
triggerAll = !var(16) && var(15) < 5
triggerall = Anim = 3352
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 4]
type = HitDef
triggerAll = !var(16) && var(15) < 6
triggerall = Anim = 3352
trigger1 = AnimElem = 18
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -0.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 4]
type = HitDef
triggerAll = !var(16) && var(15) < 7
triggerall = Anim = 3352
trigger1 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 15
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.92, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -1.92, -9.5
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 3353

; Ryu Yassai - Special Motion
[Statedef 3353]
type = S
movetype= A
physics = S
juggle = 4
velset = 0,0
anim = 3303
ctrl = 0

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300, 0
channel = 0

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 12

[State 3100, Anim]
type = ChangeState
trigger1 = AnimTime = 0
value = 3354

; Ryu Yassai - Flying Kick
[Statedef 3354]
type = A
movetype= A
physics = N
juggle = 4
velset = 0,0
anim = 3304
ctrl = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3100, Pause]
Type = Pause
trigger1 = MoveHit
Trigger1 = (Time = [25,35]) && EnemyNear, Life >= 1
time = 6

[State 3100, 1]
type = VelAdd
triggerall = Time >= 5
trigger1 = Vel X > 0
x = -.2

[State 3100, 1]
type = VelAdd
trigger1 = Time >= 5
y = .5

[State 3100, 1]
type = PosAdd
trigger1 = AnimElem = 2
x = 25

[State 3100, 2]
type = VelSet
trigger1 = AnimElem = 3
x = 12
y = -11

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3200, 4
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000, 0
channel = 1

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5

[State 0,Explod]
type = Explod
trigger1 = animelem = 4
anim = 3325
ID= 3304
sprpriority = 3
postype = p1
pos = 3,-43
bindtime = -1
facing = 1
pausemovetime = 0
removetime = 25
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0;
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = Time = 0
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 12,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, 5]
type = ChangeState
triggerall = Time > 10
trigger1 = Pos Y >= 0
value = 3355

;Ryu Yassai - Flying Kick Land
[StateDef 3355]
type = S
anim = 3305
physics = N
moveType = I
velSet = 0,0

[State 3200, Flame]
type = RemoveExplod
trigger1 = AnimElem = 1
id = 3304

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 3100, 1]
type = PosAdd
trigger1 = Time = 0
x = -10

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<RYU REKKASHINGEKI>=
[StateDef 3400]
type = S
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
trigger1 = Time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 4
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3200,2
channel=3

[State 1001,1]
type = ChangeState
trigger1 =!animtime
value = 3402
ctrl = 0

;Attaack
[Statedef 3402]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3451
juggle = 0
poweradd = 0
facep2=1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=1||animelem=7
x = 10
ignorehitpause =1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=4||animelem=9
x = 0
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = 4,3
channel=4

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1
value = SCA,NA,SA
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=8
value = 4,1
channel=5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
trigger2 = animelem=8
value = 1,2
channel=Ifelse(random<=330,1,Ifelse(random<=330,2,3))

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = animelem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 15
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3350, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 6
trigger1 = animelem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 12,40
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 40
value = 3410
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 40
value = 3403
ctrl = 0

;Continue
[Statedef 3403]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3402
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 0, VelSet]
type = VelSet
trigger1 = time>=6
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>=11
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=14
x = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = animelem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 15
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p1stateno = 3412
p2stateno = 3415
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;Attack
[Statedef 3410]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3410
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,3

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 9
trigger1 = animelem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 2,30
guard.pauseTime = 2,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p1stateno = 3412
p2stateno = 3415
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3411
ctrl = 0

;Continue
[Statedef 3411]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3411
juggle = 0
poweradd = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;Continue
[Statedef 3412]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3412
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 1200,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3430
ctrl = 0

[Statedef 3415]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3415

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, SelfState]
type = SelfState
trigger1 = time = 60
value = 0
ctrl = 1

;Continue
[Statedef 3420]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3420
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 2
pos = 60,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1
value = SCA
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 4
value = 1400,0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 9
trigger1 = animelem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 10
trigger1 = animelem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 40
value = 3430
ctrl = 0

;Attack
[Statedef 3430]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3430
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3300,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3200,3

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>=4
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
x = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 11
trigger1 = animelem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -12
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -12
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3445
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3440
ctrl = 0

;Final Hit
[Statedef 3440]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3440
juggle = 0

[State 0, Pause]
Type = Pause
Trigger1 = (time = [20,32])&&enemynear,life>=1
time = 6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 41,0
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,4
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,1
channel=2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3100,1

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 3325
ID= 3302
sprpriority = 5
postype = p1
pos = -5,-45
bindtime = -1
facing = 1
pausemovetime = 0
removetime = 30
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 0;6
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 16
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 20
y = -2
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 28
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 32
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 36
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 40
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>= 44
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 48
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 52
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 =  pos Y >=0 && vel Y > 0
value = 52
ctrl = 1

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 12
trigger1 = animelem = 1
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 20,35
guard.pauseTime = 20,35
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -2, -4
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

;====<MAX REKKASHINGEKI>=
[StateDef 3450]
type = S
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
trigger1 = time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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

[State 3450, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 4
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3300,0
channel=3

[State 1001,1]
type = ChangeState
trigger1 =!animtime
value = 3452
ctrl = 0

;Attaack
[Statedef 3452]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3401
juggle = 0
poweradd = 0
facep2=1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=1||animelem=7||animelem=12||animelem=17
x = 10
ignorehitpause =1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=4||animelem=9||animelem=14||animelem=19
x = 0
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
trigger2 = animelem=13
value = 4,3
channel=4

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1
value = SCA,NA,SA
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=8
trigger2 = animelem=18
value = 4,1
channel=5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
trigger2 = animelem=8
trigger3 = animelem=13
trigger4 = animelem=18
value = 1,2
channel=Ifelse(random<=330,1,Ifelse(random<=330,2,3))

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = animelem = 3
trigger2 = animelem = 13
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3350, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 6
trigger1 = animelem = 8
trigger2 = animelem = 18
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,40
guard.pauseTime = 12,40
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 30
value = 3460
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 30
value = 3453
ctrl = 0

;Continue
[Statedef 3453]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3402
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 0, VelSet]
type = VelSet
trigger1 = time>=6
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>=11
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=14
x = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = animelem = 2
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p1stateno = 3462
p2stateno = 3465
Kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;Attack
[Statedef 3460]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3410
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,3

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 9
trigger1 = animelem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,30
guard.pauseTime = 0,30
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p1stateno = 3462
p2stateno = 3465
Kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3461
ctrl = 0

;Continue
[Statedef 3461]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3411
juggle = 0
poweradd = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;Continue
[Statedef 3462]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3412
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 1200,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3470
ctrl = 0

[Statedef 3465]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3415

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, SelfState]
type = SelfState
trigger1 = time = 60
value = 0
ctrl = 1

;Continue
[Statedef 3470]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3420
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 2
pos = 60,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1
value = SCA
ignorehitpause =1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 4
value = 1400,0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 9
trigger1 = animelem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,9
guard.pauseTime = 4,9
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 10
trigger1 = animelem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,9
guard.pauseTime = 4,9
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 40
value = 3480
ctrl = 0

;Attack
[Statedef 3480]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3430
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 3300,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3200,3

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>=4
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
x = 0

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 11
trigger1 = animelem = 3
attr = S, HA
hitFlag = MAF
guardFlag = -1
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
animType = Up
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, -12
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -12
air.cornerPush.velOff = 0
yAccel = 0.3
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno=3445
Kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3490
ctrl = 0

;Final Hit
[Statedef 3490]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3440
juggle = 0

[State 0, Pause]
Type = Pause
Trigger1 = (time = [20,32])&&enemynear,life>=1
time = 6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 41,0
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,4
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,1
channel=2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3100,1

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 3325
ID= 3302
sprpriority = 5
postype = p1
pos = -5,-45
bindtime = -1
facing = 1
pausemovetime = 0
removetime = 30
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 0;6
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 16
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 20
y = -2
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 28
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 32
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 36
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 40
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>= 44
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 48
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 52
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 =  pos Y >=0 && vel Y > 0
value = 52
ctrl = 1

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 12
trigger1 = animelem = 1
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 20,35
guard.pauseTime = 20,35
animType = Hard
air.animType = Hard
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -4
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

; P2 throw 02
[Statedef 3445]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = hitshakeover
value = 3446
ctrl = 0

; P2 throw 02
[Statedef 3446]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3446

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 0 ;-2
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>=6
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time>=12
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time>=18
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time>=30
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=36
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=42
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=48
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=54
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=60
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>=66
y = 8

[State 0, SelfState]
type = SelfState
trigger1 = pos Y >= 0 && vel Y > 0
value = 5110

; P2 throw 02
[Statedef 3455]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = hitshakeover
value = 3456
ctrl = 0

[Statedef 3456]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3499

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
y = -60

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = 45

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = -1
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>=3
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time>=6
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time>=9
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>=12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>=15
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=18
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=21
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>=27
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>=40
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>=44
y = 12

[State 0, SelfState]
type = SelfState
trigger1 = pos Y >= -60 && vel Y > 0
value = 5100
