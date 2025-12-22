; ________________________
;| Haohmaru by Chazzanova |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==


;====<HIOUGI TENHA: FUJIN ZAN>=
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
pos = -20,-60
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
trigger1 = Time = 3
value = 3000, 0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000, 1
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 8
trigger3 = AnimElem = 14
trigger4 = AnimElem = 19
value = 1100, 1
channel = 1

[State 3000, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 21
value = 41,0

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 21
StateType = A
physics = N

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 21
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 21
x = 8
y = -12

[State 3000, VelMul]
type = VelMul
trigger1 = AnimElemTime(21) > 0
x = .85

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(21) > 0
y = .667

[State 3000, Slash FX]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 8
trigger3 = AnimElem = 14
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Slash FX]
type = Explod
trigger1 = AnimElem = 7
trigger2 = AnimElem = 13
trigger3 = AnimElem = 21
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = AnimElem = 3
trigger2 = AnimElem = 9
trigger3 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (18 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (18 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = AnimElem = 4
trigger2 = AnimElem = 10
trigger3 = AnimElem = 16
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (18 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (18 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -100
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = AnimElem = 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (18 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (18 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 4]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = AnimElem = 21
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (18 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (18 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -1.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -95
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
triggerAll = !var(16) && var(15) < 8
trigger1 = AnimElem = 22
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (18 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (18 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -1.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -115
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(25) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
triggerAll = AnimElemTime(21) > 0
trigger1 = pos y > -vel y
value = 3001


;Landing
[StateDef 3001]
type = S
anim = 3001
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



;====<MAX HIOUGI TENHA: FUJIN ZAN>=
[StateDef 3050]
type = S
physics = N
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
trigger1 = AnimElemTime(3) < 0
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
pos = -20,-60
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

[State 3050, Voice]
type = PlaySnd
trigger1 = Time = 3
value = 3000, 0
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000, 1
channel = 0

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 8
trigger3 = AnimElem = 14
trigger4 = AnimElem = 19
trigger5 = AnimElem = 20
trigger6 = AnimElem = 26
trigger7 = AnimElem = 32
value = 1100, 1
channel = 1

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 41,0

[State 3050, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 33
StateType = A
physics = N

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 33
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3050, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 33
x = 8
y = -17.334

[State 3050, VelMul]
type = VelMul
trigger1 = AnimElemTime(33) > 0
x = .85

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(33) > 0
y = .667

[State 3050, Slash FX]
type = Explod
trigger1 = AnimElem = 2
trigger2 = AnimElem = 8
trigger3 = AnimElem = 14
trigger4 = AnimElem = 20
trigger5 = AnimElem = 26
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Slash FX]
type = Explod
trigger1 = AnimElem = 7
trigger2 = AnimElem = 13
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 15
trigger1 = AnimElem = 3
trigger2 = AnimElem = 9
trigger3 = AnimElem = 15
trigger4 = AnimElem = 21
trigger5 = AnimElem = 27
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (20 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (20 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 15
trigger1 = AnimElem = 4
trigger2 = AnimElem = 10
trigger3 = AnimElem = 16
trigger4 = AnimElem = 22
trigger5 = AnimElem = 28
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (20 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (20 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -100
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 3]
type = HitDef
triggerAll = !var(16) && var(15) < 15
trigger1 = AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (21 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (21 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 4]
type = HitDef
triggerAll = !var(16) && var(15) < 15
trigger1 = AnimElem = 33
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (21 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (21 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -1.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -95
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, HitDef 5]
type = HitDef
triggerAll = !var(16) && var(15) < 15
trigger1 = AnimElem = 34
trigger2 = AnimElem = 35
trigger3 = AnimElem = 36
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (21 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (21 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -1.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -1.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -115
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(37) >= 0
moveType = I

[State 3050, ChangeState]
type = ChangeState
triggerAll = AnimElemTime(33) > 0
trigger1 = pos y > -vel y
value = 3001



;====<ISSEN>=
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
pos = -9, -60
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

[State 3100, Width]
type = Width
trigger1 = !Time
edge = 1,0
player = 10,15

[State 3100, Voice]
type = PlaySnd
triggerAll = !var(40)
trigger1 = Time = 4
value = 181, 0
channel = 0

[State 3100, Voice]
type = PlaySnd
triggerAll = var(40)
trigger1 = Time = 4
value = 1600, 10
channel = 0

[State 3100, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 110,0
channel = 1

[State 3100, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
StateType = A
physics = N

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 8
y = -1.5

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0
y = 0.15625

[State 3100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3100,2
channel = 2

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
ID = 3100
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2, 17
guard.pauseTime = 12, 12
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -45

[State 3100, TargetState]
type = TargetState
trigger1 = Time > 1 && MoveHit
value = 3115
ignorehitpause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
value = 3110

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105



;Landing (Missed)
[StateDef 3105]
type = S
anim = 3105
physics = N
moveType = I
ctrl = 0

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 3105, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) < 0
x = 0.88

[State 3105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3105, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ISSEN (SUCCESS 1)>=
[StateDef 3110]
type = A
anim = 3110
physics = N
moveType = A
velSet = 0,0
ctrl = 0

[State 3110, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3110, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifelse(((-80 * facing) - pos x) * 0.05 * facing > -2, -2, ((-80 * facing) - pos x) * 0.05 * facing)
y = -5

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 3110, ChangeState]
type = ChangeState
triggerall = AnimElemTime(2) > 0
trigger1 = pos y > -vel y
value = 3111


;====<ISSEN (SUCCESS)>=
[StateDef 3111]
type = S
anim = 3111
physics = N
moveType = A
velSet = 0,0
ctrl = 0

[State 3111, TargetState]
type = TargetState
trigger1 = AnimElem = 3
value = 3116

[State 3111, PosSet]
type = PosSet
trigger1 = !Time
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
channel = 0

[State 3111, FX Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3300, 2
channel = 1

[State 3111, HitSound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 2, 9
channel = 2

[State 3111, Voice]
type = PlaySnd
triggerAll = !var(40)
trigger1 = AnimElem = 3
value = 181, 1
channel = 3

[State 3111, Voice]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElem = 3
value = 186, 0
channel = 3

[State 3111, Slash Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 10220
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8017
ID = 8000
name = "Spark"
posType = P1
pos = 60, -50
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3111, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 3111, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 3111, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse((144 * (ifElse(var(45), 1.1, 1))) * fvar(11) < 7, -7, (-144 * (ifElse(var(45), 1.1, 1))) * fvar(11)))

[State 3111, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 18
ampl = 6
freq = 120

[State 3111, Issen FX]
type = Explod
trigger1 = AnimElem = 3
anim = 3112
sprPriority = -1
bindtime = -1
posType = Left
pos = 0, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 3111, VelMul]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = .95

[State 3111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ISSEN (TARGET 1)>=
[StateDef 3115]
type = S
moveType = H
physics = S
ctrl = 0
velSet = 0,0

[State 3115, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3115, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = !HitShakeOver
value = 5002

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5002 && !AnimTime
value = 5007

[State 3115, Issen Failsafe]
type = SelfState
trigger1= StateNo=3115 && Time >= 150 
value = 5050 ; <---- Air fall hit standard state

[State 3115, VelSet]
type = VelSet
trigger1 = HitShakeOver
x = -pos x * 0.125 * facing
persistent = 0

[State 3115, PosSet]
type = PosSet
triggerAll = HitShakeOver
trigger1 = vel x < 0 && pos x < 0 && facing = 1
trigger2 = vel x >= 0 && pos x >= 0 && facing = 1
trigger3 = vel x < 0 && pos x >= 0 && facing = -1
trigger4 = vel x >= 0 && pos x < 0 && facing = -1
x = 0

[State 3115, VelSet]
type = VelSet
triggerAll = HitShakeOver
trigger1 = vel x < 0 && pos x < 0 && facing = 1
trigger2 = vel x >= 0 && pos x >= 0 && facing = 1
trigger3 = vel x < 0 && pos x >= 0 && facing = -1
trigger4 = vel x >= 0 && pos x < 0 && facing = -1
x = 0


;====<ISSEN (TARGET 2)>=
[StateDef 3116]
type = S
moveType = H
physics = S
velSet = 0,0
ctrl=0

[State 3116, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3116, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = Time < 60
triggerAll = SelfAnimExist(5955) || SelfAnimExist(5950)
value = ifelse(SelfAnimExist(5955), 5955, 5950)
 
[State 3116, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time < 60
triggerAll = !SelfAnimExist(5955) && !SelfAnimExist(5950)
value = 3116

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 3116 && !AnimTime
value = 5080

[State 3116, ChangeState]
type = ChangeState
trigger1 = Anim = 5955 && AnimElemTime(AnimElemNo(0) + 1) = 0
trigger2 = Anim = 5950 && AnimElemTime(AnimElemNo(0) + 1) = 0
trigger3 = Anim = 5080 && AnimElemTime(AnimElemNo(0) + 1) = 0
value = 3117


;====<ISSEN (TARGET 3)>=
[StateDef 3117]
type = L
moveType = H
physics = N
velSet = 0,0
ctrl = 0

[State 3117, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3117, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != 5950
trigger1 = !Time
value = 5110 + (SelfAnimExist(5112) * 2)

[State 3117, Turn]
type = Turn
triggerAll = Time = 40
trigger1 = Name = "cvszangief" && AuthorName = "warusaki3"
trigger2 = Name = "cvszangief_normal" && AuthorName = "warusaki3"
trigger3 = Name = "cvszangief_ex" && AuthorName = "warusaki3"
trigger4 = Name = "raiden" && AuthorName = "Hh"

[State 3117, ChangeAnim]
type = ChangeAnim
triggerAll = Time = 40
triggerAll = SelfAnimExist(5112)
triggerAll = Anim = 5950
trigger1 = AuthorName = "Tin" || AuthorName = "Mouser" || AuthorName = "Hh" || AuthorName = "adamskie" 
trigger2 = AuthorName = "M.M.R." || AuthorName = "ryokucha" || AuthorName = "Bad Darkness" || AuthorName = "Third"
trigger3 = AuthorName = "CAMRAT Type KOF" || AuthorName = "keyu" || AuthorName = "Warusaki3"
trigger4 = AuthorName = "NHK" || AuthorName = "Nyankoro" || AuthorName = "Nyan™Kiryu"
trigger5 = AuthorName = "aoao" || AuthorName = "SUMI" || AuthorName = "Mr.X-file"
trigger6 = AuthorName = "laiso_7" || AuthorName = "yu-go" || AuthorName = "MEKA"
trigger7 = AuthorName = "CROSSõCAT" || AuthorName = "CrossCat"
value = 5112

[State 3117, SelfState]
type = SelfState
trigger1 = Time = 40
value = ifElse(Alive, 5120, 5150)



;====<HIOUGI TENHA: DENKU RETSU ZAN>=
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

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -15, -60
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
value = 1600, 10
channel = 0

[State 3200, Slash FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100, 1
channel = 1

[State 3200, Slash FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3200, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (52 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (52 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,5
guard.pauseTime = 2,5
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -12.5
ground.cornerPush.velOff = 0.00000001
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, -12.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 59), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
snap = 50,0

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3200, Tornado FX]
type = Explod
trigger1 = NumTarget && MoveHit = 1
anim = 1007
sprPriority = 3
bindtime = 1
posType = P1
pos = 50, 0
scale = 0.75, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3200, Slash FX]
type = PlaySnd
trigger1 = NumTarget && MoveHit = 1
value = 1000, 1
channel = 8

[State 3200, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(8) = 8 && NumTarget && MoveHit
value = 3201

[State 3200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<HIOUGI TENHA: DENKU RETSU ZAN (CONECTS)>=
[StateDef 3201]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 3201

[State 3201, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 2

[State 3201, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 3201, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3201, Slash Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,8
channel = 3

[State 3201, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,10
channel = 0

[State 3201, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3200,11
channel = 0

[State 3201, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -11

[State 3201, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = 0

[State 3201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
trigger1 = AnimElemTime(4) < 0
y = .49

[State 3201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = .66

[State 3201, Slash Explod]
type = Explod
trigger1 = AnimElemTime(2) = 18
anim = 3205
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, HitDef 5]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (75 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (75 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,12
guard.pauseTime = 2,12
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = high;High
air.type = high;High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = 0, 9.75;10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -25
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3201, End]
type = ChangeState
trigger1 = AnimElemTime(12) > 0
trigger1 = pos y > -vel y
value = 3202


;====<HIOUGI TENHA: DENKU RETSU ZAN (END)>=
[StateDef 3202]
type = S
anim = 3202
physics = S
moveType = A
velSet = 0,0

[State 3202, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3202, Slam Snd]
type = PlaySnd
trigger1 = !Time
value = 1200, 1
channel = 3

[State 3202, Slash FX]
type = PlaySnd
trigger1 = !Time
value = 3300, 3

[State 3202, Slash FX]
type = Explod
trigger1 = !Time
anim = 1205
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3202, Slash FX]
type = Explod
trigger1 = !Time
anim = 1206
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3202, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = Time = 1
attr = S, HA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (68 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (68 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -5.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -5.5, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -5
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3202, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX HIOUGI TENHA: DENKU RETSU ZAN>=
[StateDef 3250]
type = S
physics = N
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
trigger1 = AnimElemTime(4) < 0
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
pos = -15, -60
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
value = 1600, 10
channel = 0

[State 3250, Slash FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100, 1
channel = 1

[State 3250, Slash FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3250, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (67 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (67 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,5
guard.pauseTime = 2,5
animType = Heavy
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -14.5
ground.cornerPush.velOff = 0.00000001
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, -14.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 59), var(36) := -55
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
snap = 50,0

[State 3250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3250, Tornado FX]
type = Explod
trigger1 = NumTarget && MoveHit = 1
anim = 1007
sprPriority = 3
bindtime = 1
posType = P1
pos = 50, 0
scale = 0.75, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3250, Slash FX]
type = PlaySnd
trigger1 = NumTarget && MoveHit = 1
value = 1000, 1
channel = 8

[State 3250, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(8) = 10 && NumTarget && MoveHit
value = 3251

[State 3250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<HIOUGI TENHA: DENKU RETSU ZAN (CONECTS)>=
[StateDef 3251]
type = S
anim = 3201
physics = N
moveType = A
velSet = 0,0

[State 3251, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 2

[State 3251, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 3251, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3251, Slash Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,8
channel = 3

[State 3251, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,10
channel = 0

[State 3251, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3200,11
channel = 0

[State 3251, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -13

[State 3251, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = 0

[State 3251, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
trigger1 = AnimElemTime(4) < 0
y = .49

[State 3251, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = .66

[State 3251, Slash Explod]
type = Explod
trigger1 = AnimElemTime(2) = 18
anim = 3205
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, HitDef 5]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (92 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (92 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,12
guard.pauseTime = 2,12
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = high;High
air.type = high;High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = 0, 9.75;10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -25
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0


[State 3251, End]
type = ChangeState
trigger1 = AnimElemTime(12) > 0
trigger1 = pos y > -vel y
value = 3252


;====<HIOUGI TENHA: DENKU RETSU ZAN (END)>=
[StateDef 3252]
type = S
anim = 3202
physics = S
moveType = A
velSet = 0,0

[State 3252, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3252, Slam Snd]
type = PlaySnd
trigger1 = !Time
value = 1200, 1
channel = 3

[State 3252, Slash FX]
type = PlaySnd
trigger1 = !Time
value = 3300, 3

[State 3252, Slash FX]
type = Explod
trigger1 = !Time
anim = 1205
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3252, Slash FX]
type = Explod
trigger1 = !Time
anim = 1206
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3252, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = Time = 1
attr = S, HA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (84 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (84 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Heavy
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
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -5
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3252, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (84 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (84 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Heavy
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
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -5
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3252, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 5
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAFD
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (84 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (84 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -5.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -5.5, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -5
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3252, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<TENHA: SEIOU ZAN>=
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
trigger1 = !Time
time = 78
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 25,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3300,0
channel = 0

[State 3300, Fire Sound 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3300,1
channel = 1

[State 3300, FX]
type = PlaySnd
trigger1 = AnimElemTime(11) = 4
value = 3300, 2
channel = 2

[State 3300, FX]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3300, 3
channel = 3

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
x = 24

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 12
x = 12

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
x = -18

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 19
x = -24

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
x = -12

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
x = -30

[State 3300, Width]
type = Width
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
player = 9,0

[State 3300, Width]
type = Width
trigger1 = AnimElem = 18
player = 0,3

[State 3300, Width]
type = Width
trigger1 = AnimElem = 19
player = 0,9

[State 3300, Width]
type = Width
trigger1 = AnimElem = 21
player = 0,15

[State 3300, Energy FX 1]
type = Explod
trigger1 = AnimElemTime(11) = 4
anim = 3305
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3300, Energy FX 2]
type = Explod
trigger1 = AnimElemTime(11) = 4
anim = 3307
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3300, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (465 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (465 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24, 24
guard.pauseTime = 24, 24
animType = Heavy
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -15,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -15,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -45
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Pause]
type = Pause
trigger1 = MoveHit && Time % 2 = 0
time = 1

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 14
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ZOUBU EGURI>=
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 34, -67
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 1600, 10
channel = 0

[State 3400, Safety]
type = SuperPause
trigger1 = Animelem = 2 && NumEnemy
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020, 5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3400, HitDef]
type = HitDef
trigger1 = AnimElem = 2 && !var(43)
attr = S, HT
hitFlag = M
priority = 7, Miss
getPower = 0, 0
givePower = 0, 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -67
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
numHits = 0
p1stateno = 3401

[State 3400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 3400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Connected
[StateDef 3401]
type = S
physics = S
anim = 3401
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3401, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 50,0

[State 3401, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3401, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3415

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 16
value = 3400, 12
channel = 1

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 19
value = 3400, 13
channel = 2

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3400, 10
channel = 3

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = AnimElemTime(18) = 10
value = 3400, 11
channel = 34

[State 3401, Heart Explod]
type = Explod
trigger1 = AnimElem = 16
anim = 3405
ID = 3405
sprPriority = 3
posType = p1
pos = 0, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
persistent = 1
ownPal = 1

[State 3401, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 29
ID = 3405

[State 3401, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 16
value = floor(ifElse((999999 * (ifElse(var(45), 1.1, 1))) * fvar(11) < 7, -7, (-999999 * (ifElse(var(45), 1.1, 1))) * fvar(11)))

[State 3401, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 16
value = 36

[State 3401, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 2
trigger2 = NumTarget && AnimElem = 16
trigger3 = NumTarget && AnimElem = 19
time = 18
ampl = 6
freq = 120

[State 3401, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 2
trigger2 = NumTarget && AnimElem = 16
value = 1

[State 3401, Blood 1 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 3416
sprPriority = 5
posType = P1
pos = 54, -103
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 1 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 103416
sprPriority = 5
posType = P1
pos = 54, -103
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 2 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 3417
sprPriority = 5
posType = P1
pos = 54, -103
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 2 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 103417
sprPriority = 5
posType = P1
pos = 54, -103
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 3 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 3418
sprPriority = 5
posType = P1
pos = 54, -120
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 3 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 2
anim = 103418
sprPriority = 5
posType = P1
pos = 54, -120
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 1 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 16
anim = 3416
sprPriority = 5
posType = P2
pos = 2, -93
vel = .5,-1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 1 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 16
anim = 103416
sprPriority = 5
posType = P2
pos = 2, -93
vel = .5,-1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 3 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 19
anim = 3418
sprPriority = 5
posType = P2
pos = 2, -110
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 3 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 19
anim = 103418
sprPriority = 5
posType = P2
pos = 2, -110
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 2 (Additive)]
type = Explod
trigger1 = NumTarget && AnimElem = 19
anim = 3417
sprPriority = 5
posType = P2
pos = 0,-93
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, Blood 2 (Subtractive)]
type = Explod
trigger1 = NumTarget && AnimElem = 19
anim = 103417
sprPriority = 5
posType = P2
pos = 0,-93
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, ChangeState]
type = ChangeState
trigger1 = RoundState > 2 && AnimElem = 28
value = 188

[State 3401, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Zoubu Eguri (Target)
[Statedef 3415]
type = S
moveType = H
physics = N
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 3415, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3415, VelSet]
type = VelSet
trigger1 = Anim = 3415 && AnimElem = 4
x = -2

[State 3415, VelSet]
type = VelSet
trigger1 = Vel X > -0.5
x = 0

[State 3415, VelMul]
type = VelMul
trigger1 = 1
x = 0.98

[State 3415, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3415

[State 3415, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
triggerAll = SelfAnimExist(5950)
value = 5950

[State 3415, ChangeAnim2]
type = ChangeAnim2
trigger1 = Anim = 3415 && !AnimTime && Anim != 5950
value = 3116

[State 3415, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 3116 && !AnimTime
value = 5080

[State 3415, ChangeState]
type = ChangeState
trigger1 = Anim = 5950 && AnimElemTime(AnimElemNo(0) + 1) = 0
trigger2 = Anim = 5080 && AnimElemTime(AnimElemNo(0) + 1) = 0
value = 3117



;====<TOTSUZENSHI>=
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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 4, -64
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

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3500, Voice]
type = PlaySnd
trigger1 = Time = 3
value = 1600, 10
channel = 0

[State 3500, Slash FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3300, 3
channel = 1

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -120

[State 3500, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 3500, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime 
value = 3510
ctrl = 0


;====<TOTSUZENSHI (AIR)>=
[Statedef 3510]
type = A
physics = N
moveType = A
anim = 3510
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 3510, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3510, VelAdd]
type = VelAdd
trigger1 = !Time
y = 40

[State 3510, PosSet]
type = PosSet
trigger1 = Time = 20;30
x = Enemy, Pos x

[State 3510, Hit]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3511
ctrl = 0


;====<TOTSUZENSHI (HIT)>=
[Statedef 3511]
type = S
physics = N
moveType = A
anim = 3511
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 3511, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3511, Slash FX]
type = PlaySnd
trigger1 = !Time
value = 1200, 1
channel = 2

[State 3511, Slash FX]
type = PlaySnd
trigger1 = !Time
value = 3300, 3
channel = 3

[State 3511, Voice]
type = PlaySnd
trigger1 = !Time
value = 3400, 11
channel = 4

[State 3511, Slash FX]
type = Explod
trigger1 = !Time
anim = 1205
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3511, Slash FX]
type = Explod
trigger1 = !Time
anim = 1206
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 1.1, 1.1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3511, Dust FX]
type = Explod
trigger1 = !Time
anim = 3512
sprPriority = 3
bindtime = -1
posType = P1
pos = 25, 0
scale = 1.1, 1.1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3252, HitDef]
type = HitDef
trigger1 = EnemyNear,GetHitVar(chainID)!= 1300
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
ID = 3252
attr = S, HA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (472 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (472 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = -20
air.velocity = -8, -3
air.cornerPush.velOff = 0
airguard.ctrlTime = 16
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -5
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3511, TargetState]
type = TargetState
trigger1 = Movehit && NumTarget(3252)
trigger1 = (Target(3252), StateNo = 5000) || (Target(3252), StateNo = 5010)
value = 3515
ID = 3252
ignorehitpause = 1

[State 3511, TargetState]
type = TargetState
trigger1 = Movehit && Numtarget(3252)
trigger1 = (Target(3252), StateNo = 5020)
value = 3515
ID = 3252
ignorehitpause = 1

[State 3511, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 3511, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1


;====<TOTSUZENSHI (TARGET)>=
[Statedef 3515]
type = A
physics = N
movetype = H
ctrl = 0
velset = GetHitVar(xVel), GetHitVar(yVel)
sprpriority = 1

[State 3515, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3515, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3515

[State 3515, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) < 0

[State 3515, PosSet]
type = PosSet
trigger1 = pos y >= 0
y = 0

[State 3515, VelSet]
type = VelSet
trigger1 = pos y >= 0
y = 0

[State 3515, StateTypeSet]
type = StateTypeSet
trigger1 = pos y >= 0
type = L
physics = C

[State 3515, ChangeAnim2]
type = ChangeAnim2
trigger1 = pos y >= 0
value = 3515
elem = 5
persistent = 0

[State 3515, GameMakeAnim]
type = GameMakeAnim
trigger1 = AnimElem = 5
value = 62
pos = 0, 0
under = SysVar(1) <= 14

[State 3515, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = f7, 2

[State 3515, End]
type = SelfState
trigger1 = AnimElemTime(7) >= 110
value = ifElse(Alive, 5120, 5150)



;====<MAX ISSEN>=
[StateDef 3600]
type = S
physics = S
moveType = A
anim = 3100
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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = -9, -60
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

[State 3600, Width]
type = Width
trigger1 = !Time
edge = 1,0
player = 10,15

[State 3600, Voice]
type = PlaySnd
trigger1 = Time = 4
value = 1600, 10
channel = 0

[State 3600, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 110,0
channel = 1

[State 3600, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
StateType = A
physics = N

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 10
y = -1.6

[State 3600, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0
y = 0.15625

[State 3600, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3100,2
channel = 2

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3600, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
ID = 3600
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2, 17
guard.pauseTime = 12, 12
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -45

[State 3600, TargetState]
type = TargetState
trigger1 = Time > 1 && MoveHit
value = 3115
ignorehitpause = 1
persistent = 0

[State 3600, ChangeState]
type = ChangeState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3610

[State 3600, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105



;====<ISSEN (SUCCESS 1)>=
[StateDef 3610]
type = A
anim = 3110
physics = N
moveType = A
velSet = 0,0
ctrl = 0

[State 3610, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3610, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3610, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3610, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifelse(((-80 * facing) - pos x) * 0.05 * facing > -2, -2, ((-80 * facing) - pos x) * 0.05 * facing)
y = -5

[State 3610, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 3610, ChangeState]
type = ChangeState
triggerall = AnimElemTime(2) > 0
trigger1 = pos y > -vel y
value = 3611


;====<ISSEN (SUCCESS)>=
[StateDef 3611]
type = S
anim = 3111
physics = N
moveType = A
velSet = 0,0
ctrl = 0

[State 3611, TargetState]
type = TargetState
trigger1 = AnimElem = 3
value = 3116

[State 3611, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3611, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3611, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 0

[State 3611, Snd FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3300, 2
channel = 1

[State 3611, HitSound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 2, 9
channel = 2

[State 3611, Voice: Normal]
type = PlaySnd
triggerAll = !var(40)
trigger1 = AnimElem = 3
value = 181, 1
channel = 0

[State 3611, Voice: Rasetsu]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElem = 3
value = 186, 0
channel = 0

[State 3611, Voice 2: Rasetsu]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElemTime(5) = 70
value = 186, 1
channel = 0
persistent = 0

[State 3611, Slash Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 10220
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8017
ID = 8000
name = "Spark"
posType = P1
pos = 60, -50
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3111, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 3611, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 3611, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse((432 * (ifElse(var(45), 1.1, 1))) * fvar(11) < 7, -7, (-432 * (ifElse(var(45), 1.1, 1))) * fvar(11)))

[State 3611, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 24
ampl = 9
freq = 150

[State 3611, Helper]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helpertype = Normal
stateno = 3620
ID = 3620
name = "Red BG"
postype = P1
pos = 0, 0
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3611, Helper]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helpertype = Normal
stateno = 3625
ID = 3625
name = "Issen FX"
postype = Left
pos = 160, -120
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3611, Pause]
type = Pause
trigger1 = NumTarget && AnimElem = 3
time = 1

[State 3611, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 3611, VelMul]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = .95

[State 3611, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1