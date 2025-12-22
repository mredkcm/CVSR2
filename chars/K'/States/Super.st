; _____________________________________
;| K' by Chazzanova & Dampir           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<HEAT DRIVE>=
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-19 * const(size.xScale)), ceil(-80 * const(size.yScale))
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
value = 3000, 0
channel = 0

[State 3000, Flames 1]
type = Explod
trigger1 = AnimElem = 5
ID = 3002
anim = 3002
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 3000, Flames 2]
type = Explod
trigger1 = AnimElem = 7
ID = 3003
anim = 3003
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
removetime = -1
ownpal = 1
removeongethit = 1

[State 3000, ChangeState]
type = ChangeState
triggerAll = !AILevel && AnimElemTime(9) >= -1
trigger1 = Command != "holdx" 
trigger1 = Command != "holdy"
trigger1 = Command != "holdz"
trigger2 = Time = 150
value = 3001
ctrl = 0

[State 3000, Guard Detector]
type = VarSet
trigger1 = Time >= 149
var(11) = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = AILevel && AnimElemTime(9) >= -1
value = 3001
ctrl = 0



;====<HEAT DRIVE RELEASE>=
[Statedef 3001]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3001
poweradd = 0
sprpriority = 2
facep2 = 0

[State 3001, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 3002

[State 3001, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 3003

[State 3001, Guard Detector]
type = VarSet
trigger1 = !AnimTime
var(11) = 0

[State 3001, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3001, PlayerPush]
type = PlayerPush
trigger1 = Vel X
value = 0

[State 3001, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,1
channel = 1

[State 3001, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
x = 12

[State 3001, VelSet]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(8) < 3
x = 6

[State 3001, VelMul]
type = VelMul
trigger1 = AnimElemTime(8)>=0
x = 0.8

[State 3001, VelSet]
type = VelSet
trigger1 = !AnimTime
x = 0

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 1
ID = 3012
anim = 3012
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 1
ID = 3004
anim = 3004
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 3
ID = 3005
anim = 3005
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 3
ID = 3006
anim = 3006
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 4
ID = 3007
anim = 3007
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElemTime(4) = 5
ID = 3008
anim = 3008
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElemTime(4) = 10
ID = 3009
anim = 3009
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 6
ID = 3010
anim = 3010
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 7
ID = 3011
anim = 3011
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, AssertSpecial]
type = AssertSpecial
triggerAll = var(11)
trigger1 = 1
flag = UnGuardable

[State 3001, Hit 1]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3001
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 167 < 7, 7, fvar(11) * 167)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 79), var(36) := -40
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3001, Hit 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 && !MoveContact && !MoveReversed
ID = 3001
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 167 < 7, 7, fvar(11) * 167)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -40
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3001, Juggles]
type = VarSet
trigger1 = NumTarget(1050) && !NumTarget(3001)
var(15) = 0
ignoreHitPause = 1

[State 3001, TargetState]
type = TargetState
trigger1 = NumTarget(3001)
trigger1 = MoveHit && Target, Alive
value = 3015
ID = 3001
ignoreHitPause = 1
persistent = 0

[State 3001, Flame Particles]
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

[State 3001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<HIT BY HEAT DRIVE>=
[Statedef 3015]
type = A
movetype = H
physics = N
velset = 0, 0
facep2 = 1

[State 3015, PalFX]
type = PalFX
trigger1 = 1
time = 45
mul = 128, 128, 128
sinadd = 96, 96, 96, 4

[State 3015, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1

[State 3015, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 3015

[State 3015, VelSet]
type = VelSet
trigger1 = !Time
x = -2
y = -18

[State 3015, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .6

[State 3015, SelfState]
type = ChangeState
trigger1 = Pos Y >= -15 && Vel Y > 0
value = 3016

[Statedef 3016]
type = A
movetype = H
physics = N
velset = 0, 0

[State 3016, PalFX]
type = PalFX
trigger1 = !Time
time = 1
add = 0,0,0
mul = 256,256,256

[State 3016, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
freq = 120
ampl = 4

[State 3016, Hitting the Floor Sound]
type = PlaySnd
trigger1 = !Time
value = F7,0

[State 3016, Hitting the Floor Explod]
type = Explod
trigger1 = !Time
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 3016, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3016, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3016, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5100 + ifElse(SelfAnimExist(5101), 1, 0)

[State 3016, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3017

[Statedef 3017]
type = A
movetype = H
physics = N
velset = 0, 0

[State 3017, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3017, VelSet]
type = VelSet
trigger1 = !Time
x = -1.5
y = -3

[State 3017, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160 + ifElse(SelfAnimExist(5161), 1, 0)

[State 3017, VelAdd]
type = VelAdd
trigger1 = 1
y = .525

[State 3017, SelfState]
type = SelfState
trigger1 = Pos Y >= -2 && Vel Y > 0
value = 5110



;====<MAX HEAT DRIVE>=
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
var(17) = 40

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

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-19 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
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
value = 3000, 0
channel = 0

[State 3050, Flames 1]
type = Explod
trigger1 = AnimElem = 5
ID = 3002
anim = 3002
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 3050, Flames 2]
type = Explod
trigger1 = AnimElem = 7
ID = 3003
anim = 3003
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
removetime = -1
ownpal = 1
removeongethit = 1

[State 3050, ChangeState]
type = ChangeState
triggerAll = !AILevel && AnimElemTime(9) >= -1
trigger1 = Command != "holdx" 
trigger1 = Command != "holdy"
trigger1 = Command != "holdz"
trigger2 = Time = 150
value = 3051
ctrl = 0

[State 3050, Guard Detector]
type = VarSet
trigger1 = Time >= 149
var(11) = 1

[State 3050, ChangeState]
type = ChangeState
trigger1 = AILevel && AnimElemTime(9) >= -1
value = 3051
ctrl = 0



;====<HEAT DRIVE RELEASE>=
[Statedef 3051]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3001
poweradd = 0
sprpriority = 2
facep2 = 0

[State 3051, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 3002

[State 3051, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
ID = 3003

[State 3051, Guard Detector]
type = VarSet
trigger1 = !AnimTime
var(11) = 0

[State 3051, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3051, PlayerPush]
type = PlayerPush
trigger1 = Vel X
value = 0

[State 3051, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000, 1
channel = 1

[State 3051, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) >= 1 && AnimElemTime(6) < 0
x = 25

[State 3051, VelSet]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(8) < 3
x = 8

[State 3051, VelMul]
type = VelMul
trigger1 = AnimElemTime(8)>=0
x = 0.8

[State 3051, VelSet]
type = VelSet
trigger1 = !AnimTime
x = 0

[State 3051, FX Vanish]
type = Explod
trigger1 = AnimElem = 1
ID = 3012
anim = 3012
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3050, Flames 3]
type = Explod
trigger1 = !Time
ID = 3053
anim = 3053
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 3051, FX Vanish]
type = Explod
trigger1 = AnimElem = 2
ID = 3054
anim = 3054
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 2
ID = 3005
anim = 3005
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 2
ID = 3006
anim = 3006
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElem = 4
ID = 3007
anim = 3007
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElemTime(4) = 5
ID = 3008
anim = 3008
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3001, FX Vanish]
type = Explod
trigger1 = AnimElemTime(4) = 10
ID = 3009
anim = 3009
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3051, FX Vanish]
type = Explod
trigger1 = AnimElem = 6
ID = 3010
anim = 3010
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3051, FX Vanish]
type = Explod
trigger1 = AnimElem = 7
ID = 3011
anim = 3011
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3051, AssertSpecial]
type = AssertSpecial
triggerAll = var(11)
trigger1 = 1
flag = UnGuardable

[State 3051, Hit 1]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3001
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 239 < 7, 7, fvar(11) * 239)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 79), var(36) := -40
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3051, Hit 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 && !MoveContact && !MoveReversed
ID = 3001
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 239 < 7, 7, fvar(11) * 239)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -40
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3051, Juggles]
type = VarSet
trigger1 = NumTarget(1050) && !NumTarget(3001)
var(15) = 0
ignoreHitPause = 1

[State 3051, TargetState]
type = TargetState
trigger1 = NumTarget(3001)
trigger1 = MoveHit && Target, Alive
value = 3015
ID = 3001
ignoreHitPause = 1
persistent = 0

[State 3051, Flame Particles]
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

[State 3051, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CHAIN DRIVE (START)>=
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
var(22) = (PrevStateNo = [3000,4999]) && var(8) || var(12) > 6

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
trigger2 = NumTarget(1050)
var(15) = 0
ignoreHitPause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(18 * const(size.xScale)), ceil(-96 * const(size.yScale))
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
trigger1 = AnimElem = 7
value = 3100, 0
channel = 0

[State 3100, Throw Glasses]
type = PlaySnd
trigger1 = AnimElemTime(7) = 1
value = 3100, 1
channel = 1

[State 3100, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 3100, Glasses Helper]
type = Helper
trigger1 = AnimElemTime(7) = 1
helperType = Normal
stateNo = 3102
ID = 3102
name = "Glasses Helper"
posType = P1
pos = 45,-90
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, Explod]
type = Explod
trigger1 = AnimElemTime(3) = 2
anim = 3104
ID = 3104
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3100, Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 3105
ID = 3105
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = var(28)
value = 3101

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CHAIN DRIVE (ATTEMPT)>=
[StateDef 3101]
type = S
physics = N
moveType = A
anim = 3101
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3101, Glasses Again]
type = Helper
trigger1 = !NumHelper(3105) && MoveGuarded = 1
helperType = Normal
stateNo = 3105
ID = 3105
name = "Glasses Helper"
posType = P1
pos = 45, -70
size.xScale = 1
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 3101, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3101, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 3101, VelSet]
type = VelSet
trigger1 = !Time
x = 18

[State 3101, VelSet]
type = VelAdd
triggerAll = vel x > 0
trigger1 = AnimElemTime(2)>0
trigger2 = MoveGuarded
x = -1

[State 3101, VelSet]
type = VelSet
trigger1 = MoveGuarded = 1
x = 3
ignorehitpause = 1

[State 3101, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 3101, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 1
ID = 3101
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 0
getPower = 0, 0
givePower = 36, 36
pauseTime = 24, 24
guard.pauseTime = 24, 24
animType = Hard
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 47), var(36) := -70
palFX.time = 12 * var(9)
palFX.Add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
p2Facing = 1

[State 3101, Glasses]
type = Helper
trigger1 = !NumHelper(3105) && MoveHit = 1
helperType = Normal
stateNo = 3105
ID = 3105
name = "Glasses Helper"
posType = P1
pos = 45, -70
size.xScale = 1
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 3101, TargetState]
type = TargetState
trigger1 = NumTarget(3101)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3101
ignoreHitPause = 1
persistent = 0

[State 3101, ChangeState]
type = ChangeState
trigger1 = NumTarget(3101)
trigger1 = MoveHit && Target, Alive
value = 3110

[State 3110, Glasses Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,3
channel = 2

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CHAIN DRIVE (SUCCESS)>=
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3100,2
channel = 0

[State 3110, Glasses Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,3
channel = 2

[State 3110, LP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,0

[State 3110, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 35 || AnimElem = 45 || AnimElem = 56 || AnimElem = 64
value = 1,2

[State 3110, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 22
value = 1,3

[State 3110, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 50
value = 1,4

[State 3110, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 29 || AnimElem = 41
value = 1,5

[State 3110, Hit Sound]
type = Null
trigger1 = AnimElem = 17
trigger1 = var(31) := 0
trigger2 = AnimElem = 36 || AnimElem = 46 || AnimElem = 56 || AnimElem = 65
trigger2 = var(31) := 2
trigger3 = AnimElem = 23
trigger3 = var(31) := 3
trigger4 = AnimElem = 51
trigger4 = var(31) := 4
trigger5 = AnimElem = 30 || AnimElem = 42
trigger5 = var(31) := 5

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 9 < 7, 4, fvar(11) * 9)), 7
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
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -92
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 9 < 7, 4, fvar(11) * 9)), 7
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
sparkXY = -10 + 0 * (var(35) := 63), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 30
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 9 < 7, 4, fvar(11) * 9)), 7
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
sparkXY = -10 + 0 * (var(35) := 63), var(36) := -97
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 36
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
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 42
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
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -8
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 46
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
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 51
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
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -105
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 56
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
hitSound = -1
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
kill = 0

[State 3110, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 65
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 61 < 7, 4, fvar(11) * 61)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5, -6
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -45
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3110, EnvShake]
type = EnvShake
trigger1 = AnimElem = 65
time = 14
ampl = -4
freq = 120

[State 3110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(66) >= 0
moveType = I

[State 3110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CHAIN DRIVE(TARGET)>=
[StateDef 3115]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3115, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3115, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3115, SelfState]
type = SelfState
trigger1 = StateNo = 3115 && Time >= 150
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1



;====<MAX CHAIN DRIVE>=
[StateDef 3150]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8) || var(12) > 6

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
var(17) = 40

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
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3150, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(18 * const(size.xScale)), ceil(-96 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
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
trigger1 = AnimElem = 7
value = 3100, 0
channel = 0

[State 3150, Throw Glasses]
type = PlaySnd
trigger1 = AnimElemTime(7) = 1
value = 3100, 1
channel = 1

[State 3150, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 3150, Glasses Helper]
type = Helper
trigger1 = AnimElemTime(7) = 1
helperType = Normal
stateNo = 3102
ID = 3102
name = "Glasses Helper"
posType = P1
pos = 45,-90
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, Explod]
type = Explod
trigger1 = AnimElemTime(3) = 2
anim = 3104
ID = 3104
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3150, Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 3105
ID = 3105
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3150, ChangeState]
type = ChangeState
trigger1 = var(28)
value = 3151

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX CHAIN DRIVE (ATTEMPT)>=
[StateDef 3151]
type = S
physics = N
moveType = A
anim = 3151
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3151, Glasses Again]
type = Helper
trigger1 = !NumHelper(3105) && MoveGuarded = 1
helperType = Normal
stateNo = 3105
ID = 3105
name = "Glasses Helper"
posType = P1
pos = 45, -70
size.xScale = 1
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 3151, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3151, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 3151, VelSet]
type = VelSet
trigger1 = !Time
x = 24

[State 3151, VelSet]
type = VelAdd
triggerAll = vel x > 0
trigger1 = AnimElemTime(2)>0
trigger2 = MoveGuarded
x = -1

[State 3151, VelSet]
type = VelSet
trigger1 = MoveGuarded = 1
x = 3
ignorehitpause = 1

[State 3151, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 3151, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 1
ID = 3151
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 0
getPower = 0, 0
givePower = 36, 36
pauseTime = 24, 24
guard.pauseTime = 12, 12
animType = Hard
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 47), var(36) := -70
palFX.time = 12 * var(9)
palFX.Add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
p2Facing = 1

[State 3151, Glasses]
type = Helper
trigger1 = !NumHelper(3105) && MoveHit = 1
helperType = Normal
stateNo = 3105
ID = 3105
name = "Glasses Helper"
posType = P1
pos = 45, -70
size.xScale = 1
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 3151, TargetState]
type = TargetState
trigger1 = NumTarget(3151)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3151
ignoreHitPause = 1
persistent = 0

[State 3151, ChangeState]
type = ChangeState
trigger1 = NumTarget(3151)
trigger1 = MoveHit && Target, Alive
value = 3160

[State 3151, Glasses Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,3
channel = 2

[State 3151, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX CHAIN DRIVE (SUCCESS)>=
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3100,2
channel = 0

[State 3160, Glasses Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,3
channel = 2

[State 3160, LP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16 || AnimElem = 61 || AnimElem = 65
value = 1,0

[State 3160, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 35 || AnimElem = 45 || AnimElem = 55 || AnimElem = 64 || AnimElem = 75 || AnimElem = 86 || AnimElem = 95 || AnimElem = 102 || AnimElem = 108
value = 1,2

[State 3160, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 22 || AnimElem = 68
value = 1,3

[State 3160, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 50 || AnimElem = 90
value = 1,4

[State 3160, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 29 || AnimElem = 41 || AnimElem = 71 || AnimElem = 82
value = 1,5

[State 3160, Hit Sound]
type = Null
trigger1 = AnimElem = 17 || AnimElem = 62 || AnimElem = 66
trigger1 = var(31) := 0
trigger2 = AnimElem = 36 || AnimElem = 46 || AnimElem = 56 || AnimElem = 76 || AnimElem = 87 || AnimElem = 96 || AnimElem = 103 || AnimElem = 109
trigger2 = var(31) := 2
trigger3 = AnimElem = 23 || AnimElem = 69
trigger3 = var(31) := 3
trigger4 = AnimElem = 51 || AnimElem = 91
trigger4 = var(31) := 4
trigger5 = AnimElem = 30 || AnimElem = 42 || AnimElem = 72 || AnimElem = 83
trigger5 = var(31) := 5
trigger6 = AnimElem = 122
trigger6 = var(31) := 7

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 5
ID = 3004
anim = 3004
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 15
ID = 3005
anim = 3005
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 15
ID = 3006
anim = 3006
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 24
ID = 3007
anim = 3007
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 24
ID = 3008
anim = 3008
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 24
ID = 3009
anim = 3009
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 24
ID = 3010
anim = 3010
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, FX Vanish]
type = Explod
trigger1 = AnimElemTime(121) = 24
ID = 3011
anim = 3011
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeongethit = 1

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 17 || AnimElem = 62 || AnimElem = 66
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 6 < 7, 4, fvar(11) * 6)), 7
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
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -92
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 23 || AnimElem = 69
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 6 < 7, 4, fvar(11) * 6)), 7
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
sparkXY = -10 + 0 * (var(35) := 63), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 30 || AnimElem = 72
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 6 < 7, 4, fvar(11) * 6)), 7
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
sparkXY = -10 + 0 * (var(35) := 63), var(36) := -97
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 36 || AnimElem = 76
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
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
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 42 || AnimElem = 83
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
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
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -8
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 46 || AnimElem = 87
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
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
sparkXY = -10 + 0 * (var(35) := 71), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 51 || AnimElem = 91
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
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
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -105
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 56 || AnimElem = 96
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
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
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 103
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 4, fvar(11) * 10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
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
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -82
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 109
ID = 3160
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 31 < 7, 4, fvar(11) * 31)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
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
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -45
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3160, TargetState]
type = TargetState
trigger1 = NumTarget(3160)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3160
ignoreHitPause = 1
persistent = 0

[State 3160, EnvShake]
type = EnvShake
trigger1 = AnimElem = 103 || AnimElem = 109
time = 14
ampl = -4
freq = 120

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElemTime(115) >= 0 && AnimElemTime(121) < 0
x = -4

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElemTime(121) >= 15 && AnimElemTime(122) < 0
x = 18

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElemTime(122) >= 0 && AnimElemTime(126) < 0
x = 6

[State 3160, VelMul]
type = VelMul
trigger1 = AnimElemTime(122) >= 0
x = 0.95

[State 3160, VelSet]
type = VelSet
trigger1 = !AnimTime
x = 0

[State 3160, ScreenBound]
type = ScreenBound
trigger1 = AnimElemTime(115) >= 0 && AnimElemTime(129) < 0
value = 1
movecamera = 1

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 122
value = 3000, 1
channel = 1

[State 3160, Hit 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 122
ID = 3165
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 95), var(36) := -40
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3160, TargetState]
type = TargetState
trigger1 = NumTarget(3165)
trigger1 = MoveHit && Target, Alive
value = 3015
ID = 3165
ignoreHitPause = 1
persistent = 0

[State 3160, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(102) >= 0
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(123) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CRIMSON STAR ROAD (ATTEMPT)>=
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
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
var(17) = 40

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
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-4 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 6.3

[State 3200, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) < 0
x = 1

[State 3200, VelSet]
type = VelMul
trigger1 = AnimElemTime(8) >= 0
x = 0.85

[State 3200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = UnGuardable

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
ID = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 9
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2facing = 1

[State 3200, TargetState]
type = TargetState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3215
ID = 3200
ignoreHitPause = 1
persistent = 0

[State 3200, ChangeState]
type = ChangeState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3201

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CRIMSON STAR ROAD (SUCCESS)>=
[StateDef 3201]
type = S
physics = N
moveType = A
anim = 3201
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 3201, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.8

[State 3201, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 1

[State 3201, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 3201, Turn]
type = Turn
trigger1 = AnimElem = 20

[State 3201, Explotions]
type = Helper
trigger1 = AnimElemTime(17) = 1
helperType = Normal
stateNo = 3205
ID = 3205
name = "Boom Projectile"
posType = P1
pos = 0, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200, 1
channel = 1

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 15
value = 3200, 2
channel = 2

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CRIMSON STAR ROAD(TARGET)>=
[StateDef 3215]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 2

[State 3215, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3215, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3215, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5002

[State 3215, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3215, SelfState]
type = SelfState
trigger1 = StateNo = 3215 && Time >= 250
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1



;====<HYPER CHAIN DRIVE>=
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
var(17) = 40

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
trigger1 = AnimElemTime(8) < 0
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
pos = ceil(-7 * const(size.xScale)), ceil(-112 * const(size.yScale))
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

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 3301
bindTime = -1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3300, Hyper Chain Drive Projectile]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 3305
ID = 3305
name = "Hyper Chain Drive"
posType = P1
pos = 0, 0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300,0
channel = 0

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3300,1
channel = 1

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(8) = 1
value = 3300,2
channel = 2

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(9) = 0
value = 3300,3
channel = 3

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(9) = 20
value = 3300,3
channel = 4

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(9) = 40
value = 3300,4
channel = 5

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(10) = 0
value = 3300,5
channel = 6

[State 3300, Fire FXs]
type = PlaySnd
trigger1 = AnimElemTime(10) = 0
value = 3300,6
channel = 7

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1