; _________________________________________
;| Benimaru by Jmorphman                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<RAIKOKEN>=
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(EnemyNear, StateType = A, 2, 0)

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3010, 3000)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

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

[State 3000, SuperPause FX (Normal)]
type = Helper
trigger1 = Time = 3 && var(10) != 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -38, -89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause FX (Taiku)]
type = Helper
trigger1 = Time = 3 && var(10) = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -44, -80
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

[State 3000, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 3000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,0
channel = 0

[State 3000, Electricity sounds]
type = PlaySnd
trigger1 = AnimElem = 7 || AnimElem = 9 || AnimElem = 11 || AnimElem = 13 || AnimElem = 15 || AnimElem = 17 || AnimElem = 19 || AnimElem = 21
value = 1000,1

[State 3000, Raikoken Startup Spark]
type = Explod
trigger1 = AnimElem = 2 && var(10) != 2
anim = 3004
ID = 3004
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -38, -89
superMoveTime = 43
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 5 && var(10) != 2
ID = 3004
posType = P1
pos = -5, -87

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 6 && var(10) != 2
ID = 3004
posType = P1
pos = 88, -80

[State 3000, Raikoken Startup Spark (Taiku)]
type = Explod
trigger1 = AnimElem = 2 && var(10) = 2
anim = 3004
ID = 3004
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -44, -80
superMoveTime = 43
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, ModifyExplod (Taiku)]
type = ModifyExplod
trigger1 = AnimElem = 5 && var(10) = 2
ID = 3004
posType = P1
pos = -8, -85

[State 3000, ModifyExplod (Taiku)]
type = ModifyExplod
trigger1 = AnimElem = 6 && var(10) = 2
ID = 3004
posType = P1
pos = 56, -115

[State 3000, Projectile]
type = Helper
trigger1 = AnimElem = 6 && var(10) != 2
helperType = Normal
stateNo = 3005
ID = 3005
name = "Raikoken Projectile"
posType = P1
pos = 88, -80
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, Projectile]
type = Helper
trigger1 = AnimElem = 6 && var(10) = 2
helperType = Normal
stateNo = 3005
ID = 3015
name = "Taiku Raikoken Projectile"
posType = P1
pos = 56, -115
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3004) && AnimElemTime(21) >= 3
ID = 3004

[State 3000, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(3005) || NumHelper(3015)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(22) < 0
value = ifElse(var(10) = 12, 3010, 3000)
elem = 22
persistent = 0

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX RAIKOKEN>=
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

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
trigger1 = AnimElemTime(4) < 0
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
pos = -38, -89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

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

[State 3050, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 3050, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,0
channel = 0

[State 3050, Electricity sounds]
type = PlaySnd
trigger1 = AnimElem = 7 || AnimElem = 9 || AnimElem = 11 || AnimElem = 13 || AnimElem = 15 || AnimElem = 17 || AnimElem = 19 || AnimElem = 21
value = 1000,1

[State 3050, Raikoken Startup Spark]
type = Explod
trigger1 = AnimElem = 2
anim = 3004
ID = 3004
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -38, -89
superMoveTime = 45
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 5
ID = 3004
posType = P1
pos = -5, -87

[State 3050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 3004
posType = P1
pos = 88, -80

[State 3050, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 3005
ID = 3005
name = "Raikoken Projectile"
posType = P1
pos = 88, -80
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3050, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3004) && AnimElemTime(21) >= 3
ID = 3004

[State 3050, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(3005)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(22) < 0
value = 3000
elem = 22
persistent = 0

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<DENEI SPARK>=
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
trigger1 = AnimElemTime(4) < 0
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
pos = -8, -27
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
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 41,0
channel = 1

[State 3100, Electricity sounds]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9
value = 1000,1

[State 3100, Denei Spark FX]
type = Explod
trigger1 = AnimElem = 4
ID = 3105
anim = 3105
bindTime = -1
sprPriority = 3
posType = P1
pos = 1,-56
superMoveTime = 43
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 10

[State 3100, Spark trails]
type = Explod
trigger1 = Random < 500
trigger1 = AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10
anim = ifElse(Random < 333, 3106, ifElse(Random < 500, 3107, 3108))
sprPriority = 3
posType = P1
pos = -49,-64
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,32
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 18
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 5.32
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
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 46
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
value = 3115
ID = 3100
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3100)
trigger1 = MoveContact
value = ifElse(MoveGuarded, 3101, 3110)
ignoreHitPause = 1

[State 3100, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 11
ID = 3105
ignoreHitPause = 1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3100, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 8102
sprPriority = -3
posType = P1
pos = -12,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3100, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 52,0
channel = 3

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Blocked
[StateDef 3101]
type = S
anim = 3101
physics = N
moveType = I

[State 3101, Transparency]
type = Trans
trigger1 = AnimElemTime(6) < 0
trans = AddAlpha
alpha = 256 - 16 * (Time), 16 * (Time)
ignoreHitPause = 1

[State 3101, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(6) < 0
ID = 3105
trans = AddAlpha
alpha = 256 - 16 * (Time), 256
ignoreHitPause = 1

[State 3101, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 6
ID = 3105
ignoreHitPause = 1

[State 3101, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A

[State 3110, Transparency]
type = Trans
trigger1 = AnimElemTime(6) < 0
trans = AddAlpha
alpha = 256 - 16 * (Time), 16 * (Time)
ignoreHitPause = 1

[State 3110, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(6) < 0
ID = 3105
trans = AddAlpha
alpha = 256 - 16 * (Time), 256
ignoreHitPause = 1

[State 3110, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 6
ID = 3105
ignoreHitPause = 0

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 3110, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3110,0
channel = 0

[State 3110, Electricity Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3110,1
channel = 3

[State 3110, Denei Spark Finish FX]
type = Explod
trigger1 = AnimElem = 6
anim = 3115
sprPriority = 3
posType = P1
pos = 0,-22
scale = 0.685,0.4
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3110, Denei Spark Finish FX (Circle)]
type = Explod
trigger1 = AnimElem = 6
anim = 3116
sprPriority = 3
posType = P1
pos = 0,-22
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3110, Damage 1]
type = TargetLifeAdd
trigger1 = NumTarget && Time = 2
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 0
ignoreHitPause = 1

[State 3110, Damage 2]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 11
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
ignoreHitPause = 1

[State 3110, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && AnimElem = 11
value = 36
ignoreHitPause = 1

[State 3110, HitAdd]
type = HitAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && AnimElem = 11
value = 1
ignoreHitPause = 1

[State 3110, HitAdd]
type = VarAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && AnimElem = 11
var(13) = 1
ignoreHitPause = 1

[State 3110, Juggle]
type = VarAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && AnimElem = 11
var(15) = 1
ignoreHitPause = 1

[State 3110, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && Time = 2
value = 2,2
channel = 2
ignoreHitPause = 1

[State 3110, Hit Spark]
type = Helper
trigger1 = NumTarget && Time = 2
helperType = Normal
stateNo = 8014
ID = 8001
name = "Spark"
posType = P1
pos = 28,-32
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3110, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 11
value = 3116
ignoreHitPause = 1

[State 3110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3115]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3115, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn
ignoreHitPause = 1

[State 3115, Width]
type = Width
trigger1 = Time = [8,17]
edge = 0,10 + 10 * (Time - 8)
ignoreHitPause = 1

[State 3115, Width]
type = Width
trigger1 = Time >= 18
edge = 0,100
ignoreHitPause = 1

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
value = 5002

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3115, SelfState]
type = SelfState
trigger1 = HitShakeOver
value = 5001


;Collapsing to the floor
[StateDef 3116]
type = S
movetype = H
physics = S

[State 3116, HitBy]
type = HitBy
trigger1 = 1
value =
time = 1
ignoreHitPause = 1

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5950) || SelfAnimExist(5955)
value = ifElse(SelfAnimExist(5955), 5955, 5950)

[State 3116, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
trigger1 = !SelfAnimExist(5950) && !SelfAnimExist(5955)
value = 1546

[State 3116, VarSet]
type = VarSet
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
sysvar(0) = ifElse(Anim = 1546, 0, 1)

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
value = ifElse((Anim = 5950 || Anim = 5955) && SelfAnimExist(5112), 5112, 5110)
persistent = 0

[State 3116, SelfState]
type = SelfState
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
value = 5110



;====<MAX DENEI SPARK>=
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
pos = -8, -27
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

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

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 41,0
channel = 1

[State 3150, Electricity sounds]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 7 || AnimElem = 9 || AnimElem = 11
value = 1000,1

[State 3150, Denei Spark FX]
type = Explod
trigger1 = AnimElem = 4
ID = 3105
anim = 3105
bindTime = -1
sprPriority = 3
posType = P1
pos = 1,-56
superMoveTime = 43
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 10

[State 3150, Spark trails]
type = Explod
trigger1 = Random < 500
trigger1 = AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12
anim = ifElse(Random < 333, 3106, ifElse(Random < 500, 3107, 3108))
sprPriority = 3
posType = P1
pos = -49,-64
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
ID = 3150
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0, 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,32
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 18
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 5.32
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
sparkXY = -10 + 0 * (var(35) := 28), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 46
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
value = 3115
ID = 3150
ignoreHitPause = 1
persistent = 0

[State 3150, ChangeState]
type = ChangeState
trigger1 = NumTarget(3150)
trigger1 = MoveContact
value = ifElse(MoveGuarded, 3101, 3160)
ignoreHitPause = 1

[State 3150, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 13
ID = 3105
ignoreHitPause = 1

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3150, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 8102
sprPriority = -3
posType = P1
pos = -12,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3150, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 52,0
channel = 3

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3160]
type = S
anim = 3110
physics = N
moveType = A

[State 3160, Transparency]
type = Trans
trigger1 = AnimElemTime(6) < 0
trans = AddAlpha
alpha = 256 - 16 * (Time), 16 * (Time)
ignoreHitPause = 1

[State 3160, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(6) < 0
ID = 3105
trans = AddAlpha
alpha = 256 - 16 * (Time), 256
ignoreHitPause = 1

[State 3160, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 6
ID = 3105
ignoreHitPause = 0

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3110,0
channel = 0

[State 3160, Electricity Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3110,1
channel = 3

[State 3160, Denei Spark Finish FX]
type = Explod
trigger1 = AnimElem = 6
anim = 3115
sprPriority = 3
posType = P1
pos = 0,-22
scale = 0.685,0.4
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3160, Denei Spark Finish FX (Circle)]
type = Explod
trigger1 = AnimElem = 6
anim = 3116
sprPriority = 3
posType = P1
pos = 0,-22
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3160, Damage 1]
type = TargetLifeAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 0
ignoreHitPause = 1

[State 3160, Damage 2]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 11
value = floor(ifElse(91 * fvar(11) < 7, -7, -91 * fvar(11)))
ignoreHitPause = 1

[State 3160, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
trigger4 = NumTarget && AnimElem = 11
value = 36
ignoreHitPause = 1

[State 3160, HitAdd]
type = HitAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
trigger4 = NumTarget && AnimElem = 11
value = 1
ignoreHitPause = 1

[State 3160, HitAdd]
type = VarAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
trigger4 = NumTarget && AnimElem = 11
var(13) = 1
ignoreHitPause = 1

[State 3160, Juggle]
type = VarAdd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
trigger4 = NumTarget && AnimElem = 11
var(15) = 1
ignoreHitPause = 1

[State 3160, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
value = 2,2
channel = 2
ignoreHitPause = 1

[State 3160, Hit Spark]
type = Helper
trigger1 = NumTarget && Time = 2
trigger2 = NumTarget && Time = 4
trigger3 = NumTarget && Time = 6
helperType = Normal
stateNo = 8014
ID = 8001
name = "Spark"
posType = P1
pos = 28,-32
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3160, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 11
value = 3116
ignoreHitPause = 1

[State 3160, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ELEC-TRIGGER>=
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
pos = -20, -88
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

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3 && !var(37)
attr = S, ST
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

[State 3200, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 3210]
type = S
physics = N
moveType = A
anim = 3210
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3210, SuperPause]
type = SuperPause
trigger1 = !Time
time = 0
p2DefMul = 1
anim = -1
darken = 0

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3215

[State 3210, Width]
type = Width
trigger1 = AnimElemTime(25) < 0
edge = 64,0

[State 3210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 34,0

[State 3210, TargetBind 2 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-122

[State 3210, TargetBind 2 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 30, ifElse(-107 - (Target, const(size.head.pos.y)) < -40, -107 - (Target, const(size.head.pos.y)), -15)

[State 3210, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 22,-118

[State 3210, TargetBind 3 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-111 - (Target, const(size.head.pos.y)) < -40, -111 - (Target, const(size.head.pos.y)), -19)

[State 3210, TargetBind 4 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 22,-112

[State 3210, TargetBind 4 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-105 - (Target, const(size.head.pos.y)) < -40, -105 - (Target, const(size.head.pos.y)), -13)

[State 3210, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
trigger2 = AnimElemTime(5) >= 0 && AnimElemTime(22) < 0
trigger2 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22,0

[State 3210, TargetBind 6 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 12,0

[State 3210, TargetBind 7 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(22) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 2,0

[State 3210, TargetBind 8 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-116

[State 3210, TargetBind 8 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-100 - (Target, const(size.head.pos.y)) < -40, -100 - (Target, const(size.head.pos.y)), -17)

[State 3210, TargetBind 9 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-131

[State 3210, TargetBind 9 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-115 - (Target, const(size.head.pos.y)) < -40, -115 - (Target, const(size.head.pos.y)), -32)

[State 3210, TargetBind 10 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(24) >= 0 && AnimElemTime(25) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 18,-131

[State 3210, TargetBind 10 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(24) >= 0 && AnimElemTime(25) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 10, ifElse(-115 - (Target, const(size.head.pos.y)) < -40, -115 - (Target, const(size.head.pos.y)), -32)

[State 3210, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(25) = 0
pos = 38,-46

[State 3210, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && Time % 5 = 0 && AnimElemTime(25) < 0
value = floor(ifElse(7 * fvar(11) < 7, -7, -7 * fvar(11)))
kill = 0

[State 3210, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 25
value = floor(ifElse(28 * fvar(11) < 7, -7, -28 * fvar(11)))

[State 3210, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 25
value = 36

[State 3210, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 25
value = 1

[State 3210, HitAdd]
type = VarAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 25
var(13) = 1

[State 3210, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 25
var(15) = 1
ignoreHitPause = 1

[State 3210, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 25
value = 3216

[State 3210, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = NumTarget && AnimElem = 25
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3210,0
channel = 0

[State 3210, Electricity sounds]
type = PlaySnd
trigger1 = !Time
trigger2 = Time = 12
trigger3 = Time = 24
trigger4 = Time = 36
trigger5 = Time = 48
trigger6 = Time = 60
value = 3110,1

[State 3210, Electricity sound]
type = PlaySnd
trigger1 = AnimElem = 25
value = 3210,1
channel = 1

[State 3210, Benimaru Collider FX]
type = Explod
trigger1 = !Time
ID = 3215
anim = 1505
removeTime = 101
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3210, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 3215
posType = P1
pos = 22,0

[State 3210, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 3215
posType = P1
pos = 2,0

[State 3210, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 22
ID = 3215
posType = P1
pos = 22,0

[State 3210, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 24
ID = 3215
posType = P1
pos = 0,0

[State 3210, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3210, EnvShake]
type = EnvShake
trigger1 = !Time
time = 101
ampl = 6
freq = 120

[State 3210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<ELEC-TRIGGER (TARGET)>==
;Being Thrown
[StateDef 3215]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3215, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3215

[State 3265, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 3215, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3215, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3215, PalFX]
type = PalFX
trigger1 = !Time
trigger1 = !(SelfAnimExist(7696)) && !(SelfAnimExist(9010))
time = 126
mul = 192,192,192
sinAdd = 128,128,128,4


;After Throw
[StateDef 3216]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -6.25, -5.78125

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030
trigger1 = !AnimTime
value = 5050

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3216, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5126953125

[State 3216, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3216, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<MAX ELEC-TRIGGER>=
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
pos = 2, -73
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

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 && !var(37)
attr = S, ST
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

[State 3250, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 5
value = 800,0
channel = 0

[State 3250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 1

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 3260]
type = S
physics = N
moveType = A
anim = 3260
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3260, SuperPause]
type = SuperPause
trigger1 = !Time
time = 0
p2DefMul = 1
anim = -1
darken = 0

[State 3260, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3260, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3265

[State 3260, Width]
type = Width
trigger1 = AnimElemTime(36) < 0
edge = 64,0

[State 3260, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 34,0

[State 3260, TargetBind 2 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-122

[State 3260, TargetBind 2 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 30, ifElse(-107 - (Target, const(size.head.pos.y)) < -40, -107 - (Target, const(size.head.pos.y)), -15)

[State 3260, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 22,-118

[State 3260, TargetBind 3 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-111 - (Target, const(size.head.pos.y)) < -40, -111 - (Target, const(size.head.pos.y)), -19)

[State 3260, TargetBind 4 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 22,-112

[State 3260, TargetBind 4 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-105 - (Target, const(size.head.pos.y)) < -40, -105 - (Target, const(size.head.pos.y)), -13)

[State 3260, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
trigger2 = AnimElemTime(5) >= 0 && AnimElemTime(33) < 0
trigger2 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22,0

[State 3260, TargetBind 6 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 12,0

[State 3260, TargetBind 7 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(33) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 2,0

[State 3260, TargetBind 8 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(33) >= 0 && AnimElemTime(34) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-116

[State 3260, TargetBind 8 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(33) >= 0 && AnimElemTime(34) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-100 - (Target, const(size.head.pos.y)) < -40, -100 - (Target, const(size.head.pos.y)), -17)

[State 3260, TargetBind 9 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(34) >= 0 && AnimElemTime(35) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 30,-131

[State 3260, TargetBind 9 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(34) >= 0 && AnimElemTime(35) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 22, ifElse(-115 - (Target, const(size.head.pos.y)) < -40, -115 - (Target, const(size.head.pos.y)), -32)

[State 3260, TargetBind 10 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(35) >= 0 && AnimElemTime(36) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 18,-131

[State 3260, TargetBind 10 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(35) >= 0 && AnimElemTime(36) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 10, ifElse(-115 - (Target, const(size.head.pos.y)) < -40, -115 - (Target, const(size.head.pos.y)), -32)

[State 3260, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(36) = 0
pos = 38,-46

[State 3260, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && Time % 5 = 0 && AnimElemTime(36) < 0
value = floor(ifElse(7 * fvar(11) < 7, -7, -7 * fvar(11)))
kill = 0

[State 3260, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 36
value = floor(ifElse(70 * fvar(11) < 7, -7, -70 * fvar(11)))

[State 3260, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 36
value = 36

[State 3260, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 36
value = 1

[State 3260, HitAdd]
type = VarAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 36
var(13) = 1

[State 3260, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
trigger2 = NumTarget && AnimElem = 36
var(15) = 1
ignoreHitPause = 1

[State 3260, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 36
value = 3216

[State 3260, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = NumTarget && AnimElem = 36
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3260, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3210,0
channel = 0

[State 3260, Electricity sounds]
type = PlaySnd
trigger1 = !Time
trigger2 = Time = 12
trigger3 = Time = 24
trigger4 = Time = 36
trigger5 = Time = 48
trigger6 = Time = 60
trigger7 = Time = 72
trigger8 = Time = 84
trigger9 = Time = 96
value = 3110,1

[State 3260, Electricity sound]
type = PlaySnd
trigger1 = AnimElem = 36
value = 3210,1
channel = 1

[State 3260, Benimaru Collider FX]
type = Explod
trigger1 = !Time
ID = 3265
anim = 1505
removeTime = 136
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3260, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 3265
posType = P1
pos = 22,0

[State 3260, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 3265
posType = P1
pos = 2,0

[State 3260, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 33
ID = 3265
posType = P1
pos = 22,0

[State 3260, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 35
ID = 3265
posType = P1
pos = 0,0

[State 3260, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3260, EnvShake]
type = EnvShake
trigger1 = !Time
time = 101
ampl = 6
freq = 120

[State 3260, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<MAX ELEC-TRIGGER (TARGET)>==
;Being Thrown
[StateDef 3265]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3265, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3265

[State 3265, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 3265, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3265, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3265, PalFX]
type = PalFX
trigger1 = !Time
trigger1 = !(SelfAnimExist(7696)) && !(SelfAnimExist(9010))
time = 161
mul = 192,192,192
sinAdd = 128,128,128,4



;====<RAIHA JINOKEN>=
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
pos = -18, -139
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

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3300,1
channel = 0

[State 3300, Electricity sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3300,2
channel = 1

[State 3300, Raiha Jinoken Startup Spark]
type = Explod
trigger1 = AnimElem = 6
anim = 3304
sprPriority = 3
posType = P1
pos = -10,0
superMoveTime = 7
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Button Detect]
type = VarSet
trigger1 = AnimElemTime(6) = 5 && !AILevel
var(10) = ifElse((NumExplod(90000008)), 2, ifElse((NumExplod(90000002)), 1, 0))

[State 3300, Button Detect (AI)]
type = VarSet
trigger1 = AnimElemTime(6) = 5 && AILevel
var(10) = ifElse(EnemyNear, StateType = A, 2, ifElse(EnemyNear, StateType = C, 1, 0))

[State 3300, Raiha Jinoken Projectile]
type = Helper
trigger1 = AnimElemTime(6) = 5
helperType = Normal
stateNo = 3305
ID = 3305
name = "Raiha Jinoken Projectile"
posType = P1
pos = -10,0
superMoveTime = 3
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
