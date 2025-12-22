; _________________________________________
;| Rolento by Jmorphman                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<TAKE NO PRISONERS>=
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
pos = ceil(29 * const(size.xScale)), ceil(-4 * const(size.yScale))
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

[State 3000, Width]
type = Width
trigger1 = 1
edge = 64,0
ignoreHitPause = 1

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0
channel = 0

[State 3000, Tripwire Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,1
channel = 1

[State 3000, Tripwire]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3003
ID = 3003
posType = P1
name = "Tripwire"
superMoveTime = 43
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3000, Tripwire Dust 1]
type = Explod
trigger1 = AnimElem = 10
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(24 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3000, Tripwire Dust 2]
type = Explod
trigger1 = AnimElem = 18
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(56 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3000, Tripwire Dust 3]
type = Explod
trigger1 = AnimElem = 26
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(88 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3000, Tripwire Dust 4]
type = Explod
trigger1 = AnimElem = 34
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(120 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3000, Strength Detection]
type = VarSet
trigger1 = !Time
var(10) = 0
ignoreHitPause = 1

[State 3000, Hit Spark Position]
type = VarSet
trigger1 = const(size.xScale) = 1
var(35) = ceil(0.5 * P2BodyDist x + 0.5 * P2Dist x)
ignoreHitPause = 1

[State 3000, Hit Spark Position (Scaled)]
type = VarSet
trigger1 = const(size.xScale) < 1
var(35) = ceil(1.1333333* P2Dist x - 0.1333333 * P2BodyDist x)
ignoreHitPause = 1

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3000
attr = S, HA
hitFlag = M
guardFlag = L
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 26,26
guard.pauseTime = 8,8
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(36) := 0)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Advance Frame: Close Up Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = AnimElemTime(11) < 0
value = 3001
elem = 10
ignoreHitPause = 1
persistent = 0

[State 3000, Advance Frame: Medium Distance Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 54
trigger1 = AnimElemTime(20) < 0 && Anim != 3050 && Anim != 3051
value = 3001
elem = 20
ignoreHitPause = 1
persistent = 0

[State 3000, Advance Frame: Far Away Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 128
value = 3051
elem = 13
ignoreHitPause = 1
persistent = 0

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive && Anim = 3000
value = 3001
elem = AnimElemNo(0)
ignoreHitPause = 1
persistent = 0

[State 3000, Holly Wood (Hook)]
type = Helper
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
helperType = Normal
stateNo = 13010
posType = P1
pos = 64,0
name = "Holly Wood (Hook)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1
ignoreHitPause = 1
persistent = 0

[State 3000, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3000) > 1
ID = 3000
keepOne = 1
excludeID = 3000
ignoreHitPause = 1

[State 3000, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
time = 1
value = SCA
ignoreHitPause = 1

[State 3000, Success]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3010

[State 3000, Advance Frame: Move Guarded]
type = ChangeAnim
trigger1 = MoveGuarded
trigger2 = MoveHit && !NumTarget
value = 3000
elem = 38
ignoreHitPause = 1
persistent = 0

[State 3000, Tripwire (Guarded)]
type = Explod
trigger1 = MoveGuarded
trigger2 = MoveHit && !NumTarget
anim = 3004
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = var(35),0
ownPal = 1
ignoreHitPause = 1
persistent = 0

[State 3000, Tripwire (Miss)]
type = Explod
trigger1 = AnimElemTime(38) = 1
trigger1 = !MoveGuarded
anim = 3004
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(136 * const(size.xScale)),0
bindtime = -1
ownPal = 1
ignoreHitPause = 0

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(38) >= 0
moveType = I

[State 3000, End]
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

[State 3010, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0
ignoreHitPause = 1

[State 3010, Tripwire (Success)]
type = Explod
trigger1 = !Time
anim = 3013
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3010, TargetState]
type = TargetState
trigger1 = AnimElem = 6
value = 3016
ignoreHitPause = 1

[State 3010, VarSet]
type = VarSet
trigger1 = !Time
fvar(0) = ceil(P2dist x)

[State 3010, TargetVelSet]
type = TargetVelSet
trigger1 = NumTarget && AnimElem = 6
x = (fvar(0) - 64) / 12
y = (27 - ceil(Target, ScreenPos y) - Target, const(size.head.pos.y)) / 12

[State 3010, Tripwire Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3010,0
channel = 3

[State 3010, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 4

[State 3010, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 3010, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Take No Prisoners Dust"
posType = P1
ownPal = 1

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 1
x = 11.25
y = (173 - ceil(ScreenPos y)) / 7

[State 3010, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 1 && AnimElemTime(4) < 0
x = -1.171875

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 2
y = 0

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 3010, VarSet]
type = VarSet
trigger1 = AnimElem = 6
fvar(1) = ifElse((abs(pos y / 0.5859375) ** 0.5) < 8, 1.171875, abs(pos y / 32))

[State 3010, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) >= 0
y = fvar(1)

[State 3010, End]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(6) >= 0
value = 3011


;Finish
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

[State 3011, TargetState]
type = TargetState
trigger1 = AnimElemTime(6) = 3
value = 3017
ignoreHitPause = 1

[State 3011, Voice]
type = PlaySnd
trigger1 = !Time
value = 1202,0
channel = 0

[State 3011, Tripwire Release Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3011,0
channel = 5

[State 3011, Tripwire]
type = Explod
trigger1 = !Time
trigger1 = !MoveGuarded
anim = 3014
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
bindtime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3011, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Target, StateNo = 3016 && Target, Time = 12
value = floor(ifElse(ifElse(var(10), 266, 182) * fvar(11) < 7, -7, ifElse(var(10), -266, -182) * fvar(11)))

[State 3011, Juggle]
type = VarAdd
trigger1 = NumTarget
trigger1 = Target, StateNo = 3016 && Target, Time = 12
var(15) = 1
ignoreHitPause = 1

[State 3011, EnvShake]
type = EnvShake
trigger1 = NumTarget
trigger1 = Target, StateNo = 3016 && Target, Time = 12
time = 18
ampl = -6
freq = 120

[State 3011, Impact Sound]
type = PlaySnd
trigger1 = NumTarget
trigger1 = Target, StateNo = 3018
value = 2,3000
channel = 2
persistent = 0

[State 3011, Impact Dust]
type = Helper
trigger1 = NumTarget
trigger1 = Target, StateNo = 3018
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
ownPal = 1
persistent = 0

[State 3011, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target, Hit Shake
[StateDef 3015]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3015, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3015, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

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
trigger1 = Time = 29
value = 5012

[State 3015, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0 && Time < 35
value = Anim

[State 3015, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 35
value = 3015

[State 3015, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5011

[State 3015, ChangeState]
type = SelfState
trigger1 = HitOver
trigger1 = Time > 45
value = 0
ctrl = 1


;Being Pulled Up
[StateDef 3016]
type = A
moveType = H
physics = N

[State 3016, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3016, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignoreHitPause = 1

[State 3016, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 7
value = 3016

[State 3016, VelSet]
type = VelSet
trigger1 = Time = 12
x = 0
y = 0


;Falling
[StateDef 3017]
type = A
moveType = H
physics = N

[State 3017, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3017, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignoreHitPause = 1

[State 3017, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5070

[State 3017, VelAdd]
type = VelAdd
trigger1 = 1
y = -pos y / 24.5

[State 3017, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3018


;Bounce Off Ground
[Statedef 3018]
type = A
moveType = H
physics = N

[State 3018, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignoreHitPause = 1

[State 3018, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 3018, EnvShake]
type = EnvShake
trigger1 = !Time
time = 12
ampl = -4
freq = 120

[State 3018, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3018

[State 3018, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3018, PosAdd]
type = PosAdd
trigger1 = !Time
x = P2Dist x

[State 3018, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3018, VelSet]
type = VelSet
trigger1 = Time = 1
x = 4.5
y = -6.5

[State 3018, VelAdd]
type = VelAdd
trigger1 = Time > 1
y = 0.5

[State 3018, SelfState]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<MAX TAKE NO PRISONERS>=
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
trigger1 = AnimElemTime(5) < 0
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
pos = ceil(29 * const(size.xScale)), ceil(-4 * const(size.yScale))
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

[State 3050, Width]
type = Width
trigger1 = 1
edge = 64,0
ignoreHitPause = 1

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,0
channel = 0

[State 3050, Tripwire Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,1
channel = 1

[State 3050, Tripwire]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3003
ID = 3003
posType = P1
name = "Tripwire"
superMoveTime = 45
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3050, Tripwire Dust 1]
type = Explod
trigger1 = AnimElem = 10
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(80 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3050, Tripwire Dust 2]
type = Explod
trigger1 = AnimElem = 18
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(208 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3050, Tripwire Dust 3]
type = Explod
trigger1 = AnimElem = 26
trigger1 = !MoveContact
anim = 10220
sprPriority = 0
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(336 * const(size.xScale)),0
ownPal = 1
ignoreHitPause = 1

[State 3050, Strength Detection]
type = VarSet
trigger1 = !Time
var(10) = 1
ignoreHitPause = 1

[State 3050, Hit Spark Position]
type = VarSet
trigger1 = const(size.xScale) = 1
var(35) = ceil(0.5 * P2BodyDist x + 0.5 * P2Dist x)
ignoreHitPause = 1

[State 3050, Hit Spark Position (Scaled)]
type = VarSet
trigger1 = const(size.xScale) < 1
var(35) = ceil(1.1333333* P2Dist x - 0.1333333 * P2BodyDist x)
ignoreHitPause = 1

[State 3050, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3000
attr = S, HA
hitFlag = M
guardFlag = L
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 26,26
guard.pauseTime = 8,8
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(36) := 0)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Advance Frame: Close Up Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = AnimElemTime(6) <= 0
value = 3051
elem = 6
ignoreHitPause = 1
persistent = 0

[State 3050, Advance Frame: Close-Medium Distance Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 54
trigger1 = AnimElemTime(8) < 0
value = 3051
elem = 8
ignoreHitPause = 1
persistent = 0

[State 3050, Advance Frame: Medium Distance Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 128
trigger1 = AnimElemTime(13) < 0
value = 3051
elem = 13
ignoreHitPause = 1
persistent = 0

[State 3050, Advance Frame: Medium-Far Distance Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 198
trigger1 = AnimElemTime(17) < 0
value = 3051
elem = 17
ignoreHitPause = 1
persistent = 0

[State 3050, Advance Frame: Far Away Hit]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive
trigger1 = var(35) >= 272
trigger1 = AnimElemTime(22) < 0
value = 3051
elem = 22
ignoreHitPause = 1
persistent = 0

[State 3050, ChangeAnim]
type = ChangeAnim
trigger1 = NumTarget && var(35) >= 0
trigger1 = MoveHit && Target, Alive && Anim = 3050
value = 3051
elem = AnimElemNo(0)
ignoreHitPause = 1
persistent = 0

[State 3050, Holly Wood (Hook)]
type = Helper
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
helperType = Normal
stateNo = 13010
posType = P1
pos = ceil(64 * const(size.xScale)), 0
name = "Holly Wood (Hook)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1
ignoreHitPause = 1
persistent = 0

[State 3050, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3000) > 1
ID = 3000
keepOne = 1
excludeID = 3000
ignoreHitPause = 1

[State 3050, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3015
ID = 3000
ignoreHitPause = 1
persistent = 0

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
time = 1
value = SCA
ignoreHitPause = 1

[State 3050, Success]
type = ChangeState
trigger1 = NumTarget
trigger1 = MoveHit && Target, Alive
value = 3010

[State 3050, Advance Frame: Move Guarded]
type = ChangeAnim
trigger1 = MoveGuarded
trigger2 = MoveHit && !NumTarget
value = 3050
elem = 27
ignoreHitPause = 1
persistent = 0

[State 3050, Tripwire (Guarded)]
type = Explod
trigger1 = MoveGuarded
trigger2 = MoveHit && !NumTarget
anim = 3004
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = var(35),0
bindtime = -1
ownPal = 1
ignoreHitPause = 1
persistent = 0

[State 3050, Tripwire (Miss)]
type = Explod
trigger1 = AnimElemTime(27) = 1
trigger1 = !MoveGuarded
anim = 3004
sprPriority = 3
scale = const(size.xScale),const(size.yScale)
posType = P1
pos = ceil(368 * const(size.xScale)),0
bindtime = -1
ownPal = 1
ignoreHitPause = 0

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(27) >= 0
moveType = I

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MINE SWEEPER>=
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
pos = ceil(37 * const(size.xScale)), ceil(-57 * const(size.yScale))
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

[State 3100, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 730,1
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 22
value = 3100,0
channel = 0

[State 3100, Roll Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 105,0
channel = 1

[State 3100, Staff Sound]
type = PlaySnd
trigger1 = AnimElem = 25
value = 1,249
channel = 3

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = -6.25

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 22
x = 0

[State 3100, Strength Detection]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3100, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3100, Grenade 1]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 3103
ID = 3105
name = "Grenade 1 (Mine Sweeper)"
posType = P1
pos = ceil(3 * const(size.xScale)),ceil(-16 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3100, Grenade 2]
type = Helper
trigger1 = AnimElemTime(13) = 1
helperType = Normal
stateNo = 3103
ID = 3115
name = "Grenade 2 (Mine Sweeper)"
posType = P1
pos = ceil(-2 * const(size.xScale)),ceil(-17 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3100, PlayerPush]
type = PlayerPush
trigger1 = NumHelper(3105)
trigger1 = Helper(3105), NumTarget
trigger2 = NumHelper(3115)
trigger2 = Helper(3115), NumTarget
value = 0
ignoreHitPause = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX MINE SWEEPER>=
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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(37 * const(size.xScale)), ceil(-57 * const(size.yScale))
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

[State 3150, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 730,1
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 38
value = 3100,0
channel = 0

[State 3150, Roll Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 105,0
channel = 1

[State 3150, Staff Sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 1,249
channel = 3

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = -6.25

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 38
x = 0

[State 3150, Strength Detection]
type = VarSet
trigger1 = !Time
var(10) = 1

[State 3150, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3150, Grenade 1]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 3103
ID = 3105
name = "Grenade 1 (Mine Sweeper)"
posType = P1
pos = ceil(3 * const(size.xScale)),ceil(-16 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3150, Grenade 2]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 3103
ID = 3115
name = "Grenade 2 (Mine Sweeper)"
posType = P1
pos = ceil(-2 * const(size.xScale)),ceil(-17 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3150, Grenade 3]
type = Helper
trigger1 = AnimElemTime(21) = 1
helperType = Normal
stateNo = 3103
ID = 3125
name = "Grenade 3 (Mine Sweeper)"
posType = P1
pos = ceil(-2 * const(size.xScale)),ceil(-17 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3150, Grenade 4]
type = Helper
trigger1 = AnimElemTime(29) = 1
helperType = Normal
stateNo = 3103
ID = 3135
name = "Grenade 4 (Mine Sweeper)"
posType = P1
pos = ceil(-2 * const(size.xScale)),ceil(-17 * const(size.xScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3150, PlayerPush]
type = PlayerPush
trigger1 = NumHelper(3105)
trigger1 = Helper(3105), NumTarget
trigger2 = NumHelper(3115)
trigger2 = Helper(3115), NumTarget
trigger3 = NumHelper(3125)
trigger3 = Helper(3125), NumTarget
trigger4 = NumHelper(3135)
trigger4 = Helper(3135), NumTarget
value = 0
ignoreHitPause = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(30) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<STEEL RAIN>=
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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(92 * const(size.xScale)), ceil(-48 * const(size.yScale))
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
trigger1 = !Time
value = 190,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3200,0
channel = 0

[State 3200, Knife Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1101,1
channel = 1

[State 3200, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3200, Knives (Startup)]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3204
posType = P1
superMoveTime = 255
name = "Knives (Steel Rain, Startup)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3200, Knife 1]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3205
posType = P1
name = "Knife 1 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3200, Knife 2]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3215
posType = P1
pos = ceil(16 * const(size.xScale)), ceil(-13 * const(size.yScale))
name = "Knife 2 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3200, Knife 3]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3225
posType = P1
pos = ceil(-8 * const(size.xScale)), ceil(-26 * const(size.yScale))
name = "Knife 3 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX STEEL RAIN>=
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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(92 * const(size.xScale)), ceil(-48 * const(size.yScale))
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

[State 3250, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 190,0
channel = 0

[State 3250, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3200,0
channel = 0

[State 3250, Knife Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1101,1
channel = 1

[State 3250, VarSet]
type = VarSet
trigger1 = !Time
var(28) = 0

[State 3250, Knives (Startup)]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3204
posType = P1
superMoveTime = 255
name = "Knives (Steel Rain, Startup)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 1]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3205
posType = P1
name = "Knife 1 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 2]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3215
posType = P1
pos = ceil(16 * const(size.xScale)), ceil(-13 * const(size.yScale))
name = "Knife 2 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 3]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3225
posType = P1
pos = ceil(-8 * const(size.xScale)), ceil(-26 * const(size.yScale))
name = "Knife 3 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 4]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3235
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-48 * const(size.yScale))
name = "Knife 4 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 5]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3245
posType = P1
pos = ceil(-32 * const(size.xScale)), ceil(-61 * const(size.yScale))
name = "Knife 5 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 6]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3255
posType = P1
pos = ceil(-12 * const(size.xScale)), ceil(-74 * const(size.yScale))
name = "Knife 6 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, Knife 7]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3205
ID = 3265
posType = P1
pos = ceil(-48 * const(size.xScale)), ceil(-96 * const(size.yScale))
name = "Knife 7 (Steel Rain, Falling)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<PATRIOT SWEEPER>=
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
trigger1 = AnimElemTime(4) < 0
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
pos = ceil(58 * const(size.xScale)), ceil(-81 * const(size.yScale))
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
value = 190,0
channel = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1301,0
channel = 0

[State 3300, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 17
trigger3 = AnimElem = 28
trigger4 = AnimElem = 39
trigger5 = AnimElem = 50
value = 1,410

[State 3300, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2, 2
guard.pauseTime = 2, 2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 88), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 88), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 18
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 70
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
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
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
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
ignoreHitPause = 1
persistent = 0

[State 3300, Success]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = MoveHit && Target(3300), Alive
trigger1 = AnimElem = 25
value = 3310

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3305]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3305, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3305, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5002

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3305, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3306


;Target, Sliding
[StateDef 3306]
type = S
movetype = H
physics = S

[State 3306, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5007

[State 3306, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3306, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1


;Success
[StateDef 3310]
type = S
anim = 3310
physics = N
moveType = A
velSet = 0,0

[State 3310, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3310, Width]
type = Width
trigger1 = AnimElemTime(126) < 0
edge = 64,0
ignoreHitPause = 1

[State 3310, Staff twirl sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 15
trigger3 = AnimElem = 26
trigger4 = AnimElem = 37
trigger5 = AnimElem = 48
trigger6 = AnimElem = 59
trigger7 = AnimElem = 70
trigger8 = AnimElem = 81
trigger9 = AnimElem = 92
trigger10 = AnimElem = 103
trigger11 = AnimElem = 114
trigger12 = AnimElem = 125
value = 1,410

[State 3310, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 47
value = 4,1
channel = 0

[State 3310, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 72
value = 4,2
channel = 0

[State 3310, Hits 1-2, 5-6, 9-10]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 22
trigger2 = AnimElem = 26
trigger3 = AnimElem = 50
trigger4 = AnimElem = 54
trigger5 = AnimElem = 78
trigger6 = AnimElem = 82
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 40
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 88), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3310, Hits 3-4, 7-8, 11-12]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 30
trigger2 = AnimElem = 34
trigger3 = AnimElem = 58
trigger4 = AnimElem = 62
trigger5 = AnimElem = 86
trigger6 = AnimElem = 90
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0, 0
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 105), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3310, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 103
value = 1002,0
channel = 0

[State 3310, Step sound]
type = PlaySnd
trigger1 = AnimElem = 103
value = 52,0
channel = 1

[State 3310, Width]
type = Width
trigger1 = AnimElem = 94
trigger2 = AnimElemTime(102) = 1
value = 30,0

[State 3310, Width]
type = Width
trigger1 = AnimElem = 126
trigger2 = AnimElemTime(127) = 9
value = 15,0

[State 3310, Dust Helper]
type = Helper
trigger1 = AnimElem = 94
helperType = Normal
stateNo = 8103
ID = 8100
name = "Patriot Sweeper Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElem = 94
trigger2 = AnimElem = 103
trigger3 = AnimElem = 127
x = 48

[State 3310, Hits 13-14]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 103
trigger2 = AnimElem = 106
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -4.49
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3310, Hit 15]
type = HitDef
triggerAll = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 109
ID = 3310
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1,1
guard.pauseTime = 1,1
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.32, -10.49
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3310, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3310)
value = 3315
ID = 3310
ignoreHitPause = 1
persistent = 0

[State 3310, End early]
type = ChangeState
trigger1 = AnimElemTime(128) = 3 && !NumTarget(3310)
value = 0
ctrl = 1

[State 3310, Staff Sound]
type = PlaySnd
trigger1 = AnimElem = 129
value = 1,249
channel = 1

[State 3310, Jump Sound 4]
type = PlaySnd
trigger1 = AnimElem = 133
value = 41,0
channel = 3

[State 3310, VarSet]
type = VarSet
trigger1 = AnimElem = 133
var(12) = 1

[State 3310, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(133) >= 0
stateType = A
physics = N

[State 3310, Dust Helper]
type = Helper
trigger1 = AnimElem = 133
helperType = Normal
stateNo = 8100
ID = 8100
name = "Mekong Delta Escape Dust"
posType = P1
ownPal = 1

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 133
x = ifElse((P2Dist x - 320) * 0.045 > -3, -3, (P2Dist x - 320) * 0.045)
y = -8.125

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(133) > 0
y = 0.439453125

[State 3310, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(133) > 0
trigger1 = BackEdgeDist < 25
value = 3311

[State 3310, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3312


;Finish
[StateDef 3311]
type = A
anim = 3311
physics = N
moveType = A
velSet = 0,0

[State 3311, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3311, VarSet]
type = VarSet
trigger1 = !Time
var(12) = 1

[State 3311, PosSet]
type = PosSet
trigger1 = !Time
x = -140 * Facing

[State 3311, Jump sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 3311, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3311, VarSet]
type = VarSet
trigger1 = !Time
var(10) = Facing

[State 3311, El Gado (Grenade Throw, Far Left)]
type = Helper
trigger1 = Time = 40 && Facing = 1
trigger2 = Time = 8 && Facing = -1
helperType = Normal
stateNo = 23311
posType = Left
pos = 60, -ceil(ScreenPos y - pos y + 21)
name = "El Gado (Grenade Throw)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3311, Holly Wood (Grenade Throw, Middle Left)]
type = Helper
trigger1 = Time = 32 && Facing = 1
trigger2 = Time = 16 && Facing = -1
helperType = Normal
stateNo = 13311
posType = Left
pos = 120, -ceil(ScreenPos y - pos y + 21)
name = "Holly Wood (Grenade Throw)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3311, El Gado (Grenade Throw, Middle)]
type = Helper
trigger1 = Time = 24
helperType = Normal
stateNo = 23311
posType = Left
pos = 180, -ceil(ScreenPos y - pos y + 21)
name = "El Gado (Grenade Throw)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3311, Holly Wood (Grenade Throw, Middle Right)]
type = Helper
trigger1 = Time = 16 && Facing = 1
trigger2 = Time = 32 && Facing = -1
helperType = Normal
stateNo = 13311
posType = Left
pos = 240, -ceil(ScreenPos y - pos y + 21)
name = "Holly Wood (Grenade Throw)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3311, El Gado (Grenade Throw, Far Right)]
type = Helper
trigger1 = Time = 8 && Facing = 1
trigger2 = Time = 40 && Facing = -1
helperType = Normal
stateNo = 23311
posType = Left
pos = 300, -ceil(ScreenPos y - pos y + 21)
name = "El Gado (Grenade Throw)"
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 3311, VelSet]
type = VelSet
trigger1 = AnimElem = 3
y = -4.5

[State 3311, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) >= 0
x = 9

[State 3311, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.48125

[State 3311, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(3) > 0
value = 1

[State 3311, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 3311, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3312


;Landing
[StateDef 3312]
type = S
anim = 2911
physics = N
moveType = I
velSet = 0,0

[State 3312, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3312, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3312, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3312, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target, Hit Shake
[Statedef 3315]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3315, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3315, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 3315, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3315, StateTypeSet: Air]
type = StateTypeSet
trigger1 = !Time
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
stateType = A

[State 3315, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3316


;Target, Knocked into the air
[Statedef 3316]
type = A
moveType = H
physics = N
ctrl = 0

[State 3316, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3316, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5000,5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 3316, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3316, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 3316, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.gethit.groundlevel)
value = 3318

[State 3316, 6]
type = ChangeState
trigger1 = !AnimTime
value = 3317


;Target, Knocked into air (transition)
[StateDef 3317]
type = A
moveType = H
physics = N

[State 3317, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3317, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 3317, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3317, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0
trigger3 = pos y >= const(movement.air.gethit.groundlevel)
trigger4 = Time = 0
trigger4 = Anim != 5035
value = 3318


;Target, Falling
[Statedef 3318]
type = A
moveType = H
physics = N

[State 3318, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3318, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
trigger2 = !Time
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090
value = 5050

[State 3318, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 3318, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3318, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= ifElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, const(movement.air.gethit.groundlevel))
value = 3319


;Target, Hit ground from fall
[Statedef 3319]
type = L
moveType = H
physics = N

[State 3319, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3319, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 3319, VarSet]
type = VarSet
trigger1 = !Time
sysvar(1) = floor(vel y)

[State 3319, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (Anim % 10))
value = 5100

[State 3319, 3]
type = ChangeAnim
trigger1 = !Time
trigger1 = (Anim = [5051,5059]) || (Anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (Anim % 10))
value = 5100 + (Anim % 10)

[State 3319, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3319, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3319, VelMul]
type = VelMul
trigger1 = !Time
x = 0.75

[State 3319, Explod]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 3319, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 3319, PosFreeze]
type = PosFreeze
trigger1 = 1

[State 3319, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3320


;Target, Bounce off ground
[StateDef 3320]
type = L
moveType = H
physics = N

[State 3320, NotHitBy]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 3320, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (Anim % 10))
value = 5160

[State 3320, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (Anim % 10))
value = 5160 + (anim % 10)

[State 3320, HitFallVel]
type = HitFallVel
trigger1 = !Time

[State 3320, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 3320, PosSet]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 3320, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = const(movement.down.bounce.yaccel)

[State 3320, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 3321


;Target, Lying down
[Statedef 3321]
type = C
moveType = H
physics = N

[State 3321, FallEnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 3321, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5110 + (Anim % 10))
trigger1 = Anim = [5081,5089]
value = 5110 + (Anim % 10)
persistent = 0

[State 3321, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 3321, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 3321, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 3321, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3321, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yVel) != 0
sysvar(1) = floor(vel y)

[State 3321, PlaySnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 3321, Explod]
type = Explod
trigger1 = !Time
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 3321, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3321, ChangeAnim]
type = ChangeAnim
triggerAll = Anim = [5171,5179]
triggerAll = SelfAnimExist(5110 + (Anim % 10))
trigger1 = !AnimTime
trigger2 = SysVar(0)
value = 5110 + (Anim % 10)
persistent = 0

[State 3321, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != [5111,5119]
trigger1 = !AnimTime
trigger2 = SysVar(0)
value = 5110
persistent = 0

[State 3321, VarSet]
type = VarSet
trigger1 = SysVar(0)
trigger1 = !Time
sysvar(0) = 0

[State 3321, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 3321, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
x = 0
persistent = 0

[State 3321, Safety]
type = SelfState
trigger1 = Time = 40
value = 5120
