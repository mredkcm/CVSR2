; _________________________________________
;| Dhalsim by Knuckles8864                 |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<YOGA INFERNO>=
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 1

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
trigger1 = 1
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

[State 3000, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-30 * const(size.xScale)), ceil(-108 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, "Yooogaaaaaa....."]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3000, "INFERNO!!!"]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,1
channel = 0

[State 3000, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,2
channel = 4

[State 3000, Yoga Inferno Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3005
ID = 3005
name = "Yoga Inferno Projectile"
posType = P1
pos = ceil(89 * const(size.xScale)), ceil(-54 * const(size.yScale))
size.xScale = 0.7 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3000, End]
type = ChangeState
trigger1 = NumHelper(3005)
trigger1 = Helper(3005), StateNo = 3007
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 1 && Time = 111
trigger3 = Time >= 111
value = 3001


;Finish
[StateDef 3001]
type = S
anim = 3001
physics = N
moveType = I
velSet = 0,0

[State 3001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX YOGA INFERNO>=
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

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
trigger1 = 1
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

[State 3000, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = p1
pos = ceil(-30 * const(size.xScale)), ceil(-108 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = !Time
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, "Yooogaaaaaa....."]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3050, "INFERNO!!!"]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000,1
channel = 0

[State 3050, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,2
channel = 4

[State 3050, Yoga Inferno Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3055
ID = 3055
name = "Yoga Inferno Projectile"
posType = P1
pos = ceil(89 * const(size.xScale)), ceil(-54 * const(size.yScale))
size.xScale = 0.7 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 3050, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3050, End]
type = ChangeState
trigger1 = NumHelper(3055)
trigger1 = Helper(3055), StateNo = 3007
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 3 && Time = 141
trigger3 = Time >= 141
value = 3001



;====<YOGA STREAM>=
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

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 1

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
trigger1 = 1
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
posType = p1
pos = ceil(-30 * const(size.xScale)), ceil(-108 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3100, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, "Yooogaaaaaa....."]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3100, "STREAM!!!"]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3100,0
channel = 0

[State 3100, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3100,1
channel = 4

[State 3100, Yoga Stream Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 3105
ID = 3105
name = "Yoga Stream Projectile"
posType = P1
pos = ceil(122 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 0.9 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3100, End]
type = ChangeState
trigger1 = NumHelper(3105)
trigger1 = Helper(3105), StateNo = 3107
trigger1 = AnimElemTime(6) >= 0
trigger2 = var(10) = 1 && Time = 81
trigger3 = Time >= 81
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



;====<MAX YOGA STREAM>=
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = 1
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
ID = 8510
name = "Superpause FX"
posType = p1
pos = ceil(-30 * const(size.xScale)), ceil(-108 * const(size.yScale))
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

[State 3150, "Yooogaaaaaa....."]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3150, "STREAM!!!"]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3100,0
channel = 0

[State 3150, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3100,1
channel = 4

[State 3150, Yoga Stream Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 3155
ID = 3155
name = "Yoga Stream Projectile"
posType = P1
pos = ceil(122 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 0.9 * const(size.xScale)
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
trigger1 = AnimElemTime(6) >= 0
trigger2 = var(10) = 1 && Time = 111
trigger3 = Time >= 111
value = 3101



;====<YOGA STRIKE>=
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(22 * const(size.xScale)), ceil(-78 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Set State Type]
type = StateTypeSet
trigger1 = !AnimElemTime(6)
stateType = A
physics = N

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,2
channel = 0

[State 3200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 40,0
channel = 1

[State 3200, VelSet]
type = VelSet
trigger1 = !AnimElemTime(6)
x = 2.75
y = -9.00

[State 3200, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = 0.99

[State 3200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = const(movement.yaccel)

[State 3200, Dust Helper]
type = Helper
trigger1 = !AnimElemTime(6)
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(10) >= 0
trigger1 = AnimElemTime(11) < 0
attr = A, HT
hitflag = AF
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

[state 3200, Idle]
type = StateTypeSet
trigger1 = !animelemtime(11)
movetype = I

[State 3200, End State]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = pos y > -vel y
value = 3201
ctrl = 0


;Finish
[StateDef 3201]
type = S
anim = 3201
physics = N
moveType = I
velSet = 0,0

[State 3201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3201, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3210]
type = A
anim = 3210
physics = N
moveType = A
velSet = vel x, vel y

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50

[State 3210, Grab Sound]
type = PlaySnd
trigger1 = !Time & (PrevStateNo = 3201 || PrevStateNo = 3251)
value = 2,800
channel = 2

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3215

[State 3210, TargetBind]
type = TargetBind
trigger1 = 1
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3210, VelMul]
type = VelMul
trigger1 = 1
x = 0.92

[State 3210, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel)

[State 3210, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 3211
ctrl = 0


;Slam Startup
[Statedef 3211]
type = A
anim = 3211
physics = N
moveType = A
velSet = 0,0

[State 3211, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3211, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3216

[State 3211, Width]
type = width
trigger1 = !animelemtime(7)
edge = 32, 152

[State 3211, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 52, 0

[State 3211, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3211, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3200, 0
channel = 0

[State 3211, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1400, 2
channel = 1

[State 3211, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(-164 * const(size.xScale)), ceil(0 * const(size.yScale))
ownPal = 1

[State 3211, Target Facing]
type = TargetFacing
trigger1 = AnimElem = 4
value = -1

[State 3211, Width]
type = Width
trigger1 = AnimElemTime(5) < 0
edge = 64,0
ignoreHitPause = 1

[State 3211, Width]
type = Width
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
edge = 90,0
ignoreHitPause = 1

[State 3211, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3211, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3211, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3211, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3211, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3211, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(16 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 3211, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(-132 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3211, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = ceil(-124 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3211, Target State]
type = TargetState
trigger1 = NumTarget && AnimElem = 7
value = 3220

[State 3211, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7
value = floor(ifElse(210 * fvar(11) < 7, -7, -210 * fvar(11)))

[State 3211, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 7
value = 1

[State 3211, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(13) = 1

[State 3211, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(15) = 1
ignoreHitPause = 1

[State 3211, Shake]
type = EnvShake
trigger1 = AnimElem = 7
time = 14
ampl = -4
freq = 120

[State 3211, End]
type = Changestate
trigger1 = !AnimTime
value = 3214
ctrl = 0


;Release
[Statedef 3214]
type = A
anim = 3214
physics = N
movetype = I
ctrl = 0
sprpriority = 1

[State 3214, VelSet]
type = velset
trigger1 = !AnimElemTime(2)
x = -1.5
y = -7.0

[State 3214, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = const(movement.yaccel)

[State 3214, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 2

[State 3214, Dust Helper]
type = Helper
trigger1 = !AnimElemTime(2)
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3214, End State]
type = ChangeState
trigger1 = pos y + vel y > 0
value = 3201
ctrl = 0



;Yoga Strike (Target)
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

[State 3215, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Yoga Strike (Target Slammed)
[StateDef 3216]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3216, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3216

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Yoga Strike (Target Slammed)
[Statedef 3217]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 3217, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3217

[State 3217, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Yoga Strike (Target Recaptured)
[Statedef 3218]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 3217, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3218

[State 3218, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Yoga Strike (Target Recaptured)
[Statedef 3219]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 3217, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3219

[State 3218, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Yoga Strike (Target Released)
[StateDef 3220]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3221, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3220

[State 3221, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 14
value = 3221

[State 3221, PosAdd]
type = PosAdd
trigger1 = Time = 14
x = 24

[State 3221, VelAdd]
type = VelAdd
trigger1 = Time > 14
y = 0.5859375

[State 3221, VelSet]
type = VelSet
trigger1 = Time = 14
x = 3.0
y = -9.0

[State 3221, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3221, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 3221, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100


;====<MAX YOGA STRIKE>=
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
trigger1 = 1
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = p1
pos = ceil(22 * const(size.xScale)), ceil(-78 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Set State Type]
type = StateTypeSet
trigger1 = !AnimElemTime(6)
stateType = A
physics = N

[State 3250, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,2
channel = 0

[State 3250, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 40,0
channel = 1

[State 3250, VelSet]
type = VelSet
trigger1 = !AnimElemTime(6)
x = 2.75
y = -9.00

[State 3250, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = 0.99

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = const(movement.yaccel)

[State 3250, Dust Helper]
type = Helper
trigger1 = !AnimElemTime(6)
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(10) >= 0
trigger1 = AnimElemTime(11) < 0
attr = A, HT
hitflag = AF
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

[state 3250, Idle]
type = StateTypeSet
trigger1 = !animelemtime(11)
movetype = I

[State 3200, End State]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = pos y > -vel y
value = 3201
ctrl = 0


;Success
[StateDef 3260]
type = A
anim = 3210
physics = N
moveType = A
velSet = vel x, vel y

[State 3260, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50

[State 3260, Grab Sound]
type = PlaySnd
trigger1 = !Time & (PrevStateNo = 3201 || PrevStateNo = 3251)
value = 2,800
channel = 2

[State 3260, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3215

[State 3260, TargetBind]
type = TargetBind
trigger1 = 1
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3260, VelMul]
type = VelMul
trigger1 = 1
x = 0.92

[State 3260, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel)

[State 3260, Land]
type = ChangeState
trigger1 = pos y + vel y > 0
value = 3261
ctrl = 0


;Slam Startup
[Statedef 3261]
type = A
anim = 3211
physics = N
moveType = A
velSet = 0,0

[State 3261, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3261, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3216

[State 3261, Width]
type = width
trigger1 = !animelemtime(7)
edge = 32, 152

[State 3261, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 52, 0

[State 3261, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3261, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3200, 0
channel = 0

[State 3261, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1400, 2
channel = 1

[State 3261, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(-164 * const(size.xScale)), ceil(0 * const(size.yScale))
ownPal = 1

[State 3261, Target Facing]
type = TargetFacing
trigger1 = AnimElem = 4
value = -1

[State 3261, Width]
type = Width
trigger1 = AnimElemTime(5) < 0
edge = 64,0
ignoreHitPause = 1

[State 3261, Width]
type = Width
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
edge = 90,0
ignoreHitPause = 1

[State 3261, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3261, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3261, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3261, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3261, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3261, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(16 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 3261, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(-132 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3261, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = ceil(-124 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3261, TargetBind 9]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(9) >= 0
pos = ceil(-104 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3261, Target State]
type = TargetState
trigger1 = NumTarget && AnimElem = 7
value = 3217

[State 3261, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
kill = 0

[State 3261, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 7
value = 1

[State 3261, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(13) = 1

[State 3261, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(15) = 1
ignoreHitPause = 1

[State 3261, Shake]
type = EnvShake
trigger1 = AnimElem = 7
time = 14
ampl = -4
freq = 120

[State 3261, End State]
type = ChangeState
trigger1 = !AnimTime
value = 3262
ctrl = 0


;Slam Startup
[Statedef 3262]
type = A
anim = 3212
physics = N
moveType = A
velSet = 0,0

[State 3262, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3262, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3218

[State 3262, VelSet]
type = VelSet
trigger1 = !AnimElemTime(2)
x = -1.171875
y = -5.46875

[State 3262, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.5859375

[State 3262, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40, 0

[State 3262, Floor Dust]
type = Explod
trigger1 = AnimElem = 2
anim = 8100
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 3262, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(-104 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3262, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(-16 * const(size.xScale)), ceil(-16 * const(size.yScale))

[State 3262, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0
pos = ceil(48 * const(size.xScale)), ceil(-32 * const(size.yScale))

[State 3262, End]
type = ChangeState
trigger1 = pos y + vel y > 0
value = 3263
ctrl = 0


;Another Slam
[Statedef 3263]
type = A
anim = 3213
physics = N
moveType = A
velSet = 0,0

[State 3263, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3263, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3216

[State 3263, Width]
type = width
trigger1 = !animelemtime(6)
edge = 32, 152

[State 3263, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52, 0

[State 3263, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3263, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3200, 0
channel = 0

[State 3263, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1400, 2
channel = 1

[State 3263, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(-164 * const(size.xScale)), ceil(0 * const(size.yScale))
ownPal = 1

[State 3263, Width]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 64,0
ignoreHitPause = 1

[State 3263, Width]
type = Width
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
edge = 90,0
ignoreHitPause = 1

[State 3263, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3263, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3263, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3263, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3263, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(16 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 3263, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(-132 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3263, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(-124 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3263, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(8) >= 0
pos = ceil(-104 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3263, Target State]
type = TargetState
trigger1 = NumTarget && AnimElem = 6
value = 3217

[State 3263, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 6
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
kill = 0

[State 3263, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 6
value = 1

[State 3263, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(13) = 1

[State 3263, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(15) = 1
ignoreHitPause = 1

[State 3263, Shake]
type = EnvShake
trigger1 = AnimElem = 6
time = 14
ampl = -4
freq = 120

[State 3263, End]
type = changestate
trigger1 = !animtime
value = 3264
ctrl = 0


;Slam StartUp 2
[Statedef 3264]
type = A
anim = 3212
physics = N
moveType = A
velSet = 0,0

[State 3264, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3264, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3218

[State 3264, VelSet]
type = VelSet
trigger1 = !AnimElemTime(2)
x = -1.171875
y = -5.46875

[State 3264, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.5859375

[State 3264, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40, 0

[State 3264, Floor Dust]
type = Explod
trigger1 = AnimElem = 2
anim = 8100
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 3264, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(-104 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3264, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(-16 * const(size.xScale)), ceil(-16 * const(size.yScale))

[State 3264, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0
pos = ceil(48 * const(size.xScale)), ceil(-32 * const(size.yScale))

[State 3264, End]
type = ChangeState
trigger1 = pos y + vel y > 0
value = 3265
ctrl = 0


;Yet Another Slam
[Statedef 3265]
type = A
anim = 3213
physics = N
moveType = A
velSet = 0,0

[State 3265, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3265, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3219

[State 3265, Width]
type = width
trigger1 = !animelemtime(6)
edge = 32, 152

[State 3265, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52, 0

[State 3265, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3265, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3200, 0
channel = 0

[State 3265, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1400, 2
channel = 1

[State 3265, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(-164 * const(size.xScale)), ceil(0 * const(size.yScale))
ownPal = 1

[State 3265, Width]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 64,0
ignoreHitPause = 1

[State 3265, Width]
type = Width
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
edge = 90,0
ignoreHitPause = 1

[State 3265, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3265, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3265, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(36 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3265, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(32 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 3265, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(16 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 3265, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(-132 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3265, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(-124 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3265, Target State]
type = TargetState
trigger1 = NumTarget && AnimElem = 6
value = 3220

[State 3265, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 6
value = floor(ifElse(112 * fvar(11) < 7, -7, -112 * fvar(11)))

[State 3265, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 6
value = 1

[State 3265, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(13) = 1

[State 3265, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(15) = 1
ignoreHitPause = 1

[State 3265, Shake]
type = EnvShake
trigger1 = AnimElem = 6
time = 14
ampl = -4
freq = 120

[State 3265, End]
type = ChangeState
trigger1 = !animtime
value = 3214
ctrl = 0



;====<YOGA LEGEND>=
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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(24 * const(size.xScale)), ceil(-61 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300,0
channel = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3300,1
channel = 0

[State 3300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 104
ground.velocity = -0.5859375, -12.5
ground.cornerPush.velOff = 0
guard.velocity = -15.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -12.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger1 = !MoveContact && !MoveReversed
ID = 3300
attr = S, HA
hitFlag = AF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 104
ground.velocity = -0.5859375, -12.5
ground.cornerPush.velOff = 0
guard.velocity = -15.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -12.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -138
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Idle]
type = StateTypeSet
trigger1 = !AnimElemTime(5)
movetype = I

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = MoveHit && Target, Alive
trigger1 = animelemtime(5) >= 4
value = 3305

[State 3300, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Yoga Legend: Teleport
[Statedef 3305]
type = A
physics = N
moveType = A
anim = 3305
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3305, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1

[State 3305, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 3305, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 3305, Transparency]
type = Trans
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(8) < 0
trans = AddAlpha
alpha = 256 - 32 * animelemtime(7), 32 * animelemtime(7)

[State 3305, Transparency]
type = Trans
trigger1 = AnimElemTime(9) >= 0
trigger1 = AnimElemTime(11) < 0
trans = AddAlpha
alpha = 21 * AnimElemTime(9), 256 - 21 * AnimElemTime(7)

[State 3305, Turn]
type = Turn
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
trigger1 = p2dist x < 0

[State 3305, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 0
channel = 0

[State 3305, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 1
channel = 1

[State 3305, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1300, 2
channel = 1

[State 3305, PosAdd]
type = PosAdd
trigger1 = NumTarget(3300)
trigger1 = !AnimElemTime(8)
x = (target(3300),pos x * facing - pos x * facing) + (56 - 112 * (target(3300),backedgedist <= 0))

[State 3305, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3300) && NumEnemy
trigger1 = !AnimElemTime(8)
x = p2dist x + (56 - 112 * (target(3300),backedgedist <= 0))

[State 3305, PosAdd]
type = PosAdd
trigger1 = NumTarget(3300)
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = target(3300),pos y - pos y - cond(target(3300),vel y > 0, -56, 8)

[State 3305, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3300) && NumEnemy
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = enemynear,pos y - pos y - cond(enemynear,vel y > 0, -56, 8)

[State 3305, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(14) > 0
y = 0.58

[State 3305, Attack Distance]
type = AttackDist
trigger1 = !Time
value = 0

[State 3305, End State]
type = changestate
trigger1 = NumTarget(3300)
trigger1 = Target(3300),StateType = A
trigger1 = AnimElemTime(9) >= 0
value = 3310
ctrl = 0

[State 3305, End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Pos y + Vel y > 0
value = 52
ctrl = 0


;Yoga Legend: Finish
[Statedef 3310]
type = A
physics = N
moveType = A
anim = 3311
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3310, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = pos y >= -8
y = -8

[State 3310, Transparency]
type = Trans
trigger1 = AnimElemTime(5) < 0
trans = AddAlpha
alpha = 32 * time, 256 - 32 * time

[State 3310, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(3)
trigger2 = !AnimElemTime(8)
trigger3 = !AnimElemTime(13)
value = 3300, 2
channel = 0

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(17) > 0
y = 0.58

[State 3310, Hit 1]
type = HitDef
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
ID = 3300
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 108), var(36) := -50
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3310, Hit 2]
type = HitDef
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
ID = 3300
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
air.animType = Back
fall.animType = Back
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -88
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3310, Hit 3]
type = HitDef
trigger1 = AnimElem = 13
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
ID = 3300
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -7.03125, 12.5
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -7.03125, 12.5
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -59
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1

[State 3310, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
movetype = I

[State 3310, Control]
type = CtrlSet
trigger1 = !AnimElemTime(17)
value = 1

[State 3310, End]
type = ChangeState
trigger1 = AnimElemTime(17) > 0
trigger1 = Pos Y + Vel Y > 0
value = 52
ctrl = 0



;====<MAX YOGA LEGEND>=
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
trigger1 = 1
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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = p1
pos = ceil(24 * const(size.xScale)), ceil(-61 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3350, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3350, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300,0
channel = 0

[State 3350, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3300,1
channel = 0

[State 3350, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
ID = 3350
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 104
ground.velocity = -0.5859375, -12.5
ground.cornerPush.velOff = 0
guard.velocity = -15.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -12.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger1 = !MoveContact && !MoveReversed
ID = 3350
attr = S, HA
hitFlag = AF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 104
ground.velocity = -0.5859375, -12.5
ground.cornerPush.velOff = 0
guard.velocity = -15.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -12.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -128
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Idle]
type = StateTypeSet
trigger1 = !AnimElemTime(5)
movetype = I

[State 3350, ChangeState]
type = ChangeState
trigger1 = NumTarget(3350)
trigger1 = MoveHit && Target, Alive
trigger1 = animelemtime(5) >= 4
value = 3355

[State 3350, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Yoga Legend: Teleport
[Statedef 3355]
type = A
physics = N
moveType = A
anim = 3305
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3355, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1

[State 3355, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 3355, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 3355, Transparency]
type = Trans
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(8) < 0
trans = AddAlpha
alpha = 256 - 32 * animelemtime(7), 32 * animelemtime(7)

[State 3355, Transparency]
type = Trans
trigger1 = AnimElemTime(9) >= 0
trigger1 = AnimElemTime(11) < 0
trans = AddAlpha
alpha = 21 * AnimElemTime(9), 256 - 21 * AnimElemTime(7)

[State 3355, Turn]
type = Turn
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
trigger1 = p2dist x < 0

[State 3355, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 0
channel = 0

[State 3355, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 1
channel = 1

[State 3355, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1300, 2
channel = 1

[State 3355, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = !AnimElemTime(8)
x = (target(3350),pos x * facing - pos x * facing) + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3355, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = !AnimElemTime(8)
x = p2dist x + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3355, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = target(3350),pos y - pos y - cond(target(3350),vel y > 0, -56, 8)

[State 3355, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = enemynear,pos y - pos y - cond(enemynear,vel y > 0, -56, 8)

[State 3355, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(14) > 0
y = 0.58

[State 3355, Attack Distance]
type = AttackDist
trigger1 = !Time
value = 0

[State 3355, End State]
type = changestate
trigger1 = NumTarget(3350)
trigger1 = Target(3350),StateType = A
trigger1 = AnimElemTime(9) >= 0
value = 3360
ctrl = 0

[State 3355, End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Pos y + Vel y > 0
value = 52
ctrl = 0


;Yoga Legend: Teleport
[Statedef 3356]
type = A
physics = N
moveType = A
anim = 3305
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3356, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1

[State 3356, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 3356, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 3356, Transparency]
type = Trans
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(8) < 0
trans = AddAlpha
alpha = 256 - 32 * animelemtime(7), 32 * animelemtime(7)

[State 3356, Transparency]
type = Trans
trigger1 = AnimElemTime(9) >= 0
trigger1 = AnimElemTime(11) < 0
trans = AddAlpha
alpha = 21 * AnimElemTime(9), 256 - 21 * AnimElemTime(7)

[State 3356, Turn]
type = Turn
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
trigger1 = p2dist x < 0

[State 3356, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 0
channel = 0

[State 3356, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 1
channel = 1

[State 3356, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1300, 2
channel = 1

[State 3356, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = !AnimElemTime(8)
x = (target(3350),pos x * facing - pos x * facing) + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3356, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = !AnimElemTime(8)
x = p2dist x + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3356, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = target(3350),pos y - pos y - cond(target(3350),vel y > 0, -56, 8)

[State 3356, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = enemynear,pos y - pos y - cond(enemynear,vel y > 0, -56, 8)

[State 3356, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(14) > 0
y = 0.58

[State 3356, Attack Distance]
type = AttackDist
trigger1 = !Time
value = 0

[State 3356, End State]
type = changestate
trigger1 = NumTarget(3350)
trigger1 = Target(3350),StateType = A
trigger1 = AnimElemTime(9) >= 0
value = 3361
ctrl = 0

[State 3356, End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Pos y + Vel y > 0
value = 52
ctrl = 0


;Yoga Legend: Teleport
[Statedef 3357]
type = A
physics = N
moveType = A
anim = 3305
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3357, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1

[State 3357, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 3356, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 3357, Transparency]
type = Trans
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(8) < 0
trans = AddAlpha
alpha = 256 - 32 * animelemtime(7), 32 * animelemtime(7)

[State 3357, Transparency]
type = Trans
trigger1 = AnimElemTime(9) >= 0
trigger1 = AnimElemTime(11) < 0
trans = AddAlpha
alpha = 21 * AnimElemTime(9), 256 - 21 * AnimElemTime(7)

[State 3357, Turn]
type = Turn
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
trigger1 = p2dist x < 0

[State 3357, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 0
channel = 0

[State 3356, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 1
channel = 1

[State 3357, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1300, 2
channel = 1

[State 3357, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = !AnimElemTime(8)
x = (target(3350),pos x * facing - pos x * facing) + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3357, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = !AnimElemTime(8)
x = p2dist x + (56 - 112 * (target(3350),backedgedist <= 0))

[State 3357, PosAdd]
type = PosAdd
trigger1 = NumTarget(3350)
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = target(3350),pos y - pos y - cond(target(3350),vel y > 0, -56, 8)

[State 3357, PosAdd]
type = PosAdd
trigger1 = !NumTarget(3350) && NumEnemy
trigger1 = AnimElemTime(8) >= 0
trigger1 = AnimElemTime(9) < 0
y = enemynear,pos y - pos y - cond(enemynear,vel y > 0, -56, 8)

[State 3356, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(14) > 0
y = 0.58

[State 3357, Attack Distance]
type = AttackDist
trigger1 = !Time
value = 0

[State 3357, End State]
type = changestate
trigger1 = NumTarget(3350)
trigger1 = Target(3350),StateType = A
trigger1 = AnimElemTime(9) >= 0
value = 3362
ctrl = 0

[State 3357, End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Pos y + Vel y > 0
value = 52
ctrl = 0



;Yoga Legend: Combo
[Statedef 3360]
type = A
physics = N
moveType = A
anim = 3310
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3360, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = pos y >= -8
y = -8

[State 3360, Transparency]
type = Trans
trigger1 = AnimElemTime(5) < 0
trans = AddAlpha
alpha = 32 * time, 256 - 32 * time

[State 3360, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(3)
trigger2 = !AnimElemTime(8)
trigger3 = !AnimElemTime(15)
value = 3300, 2
channel = 0

[State 3360, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(19) > 0
y = 0.58

[State 3360, Hit 1]
type = HitDef
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -59
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3360, Hit 2]
type = HitDef
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
air.animType = Back
fall.animType = Back
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -80
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3360, Hit 3]
type = HitDef
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -4.6875, -11.71875
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -4.6875, -11.71875
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -80
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3360, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
movetype = I

[State 3360, End State]
type = ChangeState
trigger1 = MoveHit && NumTarget(3350)
trigger1 = !AnimElemTime(19)
value = 3356
ctrl = 0


;Yoga Legend: Combo
[Statedef 3361]
type = A
physics = N
moveType = A
anim = 3310
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3361, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = pos y >= -8
y = -8

[State 3361, Transparency]
type = Trans
trigger1 = AnimElemTime(5) < 0
trans = AddAlpha
alpha = 32 * time, 256 - 32 * time

[State 3361, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(3)
trigger2 = !AnimElemTime(8)
trigger3 = !AnimElemTime(15)
value = 3300, 2
channel = 0

[State 3361, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(19) > 0
y = 0.58

[State 3361, Hit 1]
type = HitDef
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -59
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3361, Hit 2]
type = HitDef
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
air.animType = Back
fall.animType = Back
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -80
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3361, Hit 3]
type = HitDef
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -4.6875, -11.71875
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -4.6875, -11.71875
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -80
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3361, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
movetype = I

[State 3361, End State]
type = ChangeState
trigger1 = MoveHit && NumTarget(3350)
trigger1 = !AnimElemTime(19)
value = 3357
ctrl = 0


;Yoga Legend: Finish
[Statedef 3362]
type = A
physics = N
moveType = A
anim = 3311
ctrl = 0
velSet = 0,0
sprPriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3362, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = pos y >= -8
y = -8

[State 3362, Transparency]
type = Trans
trigger1 = AnimElemTime(5) < 0
trans = AddAlpha
alpha = 32 * time, 256 - 32 * time

[State 3362, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(3)
trigger2 = !AnimElemTime(8)
trigger3 = !AnimElemTime(13)
value = 3300, 2
channel = 0

[State 3362, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(17) > 0
y = 0.58

[State 3362, Hit 1]
type = HitDef
trigger1 = AnimElem = 3
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 108), var(36) := -50
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3362, Hit 2]
type = HitDef
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
air.animType = Back
fall.animType = Back
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -0.5859375, -3.125
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -0.5859375, -3.125
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -88
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1
kill = 0

[State 3362, Hit 3]
type = HitDef
trigger1 = AnimElem = 13
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
ID = 3350
getPower = 0,0
givePower = 16, 16
pausetime = 8, 8
guard.pauseTime = 8, 8
animtype = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hittime = 120
ground.velocity = -7.03125, 12.5
ground.cornerPush.velOff = 0
guard.velocity = -8.0
guard.cornerPush.velOff = 0
air.velocity = -7.03125, 12.5
air.cornerPush.velOff = 0
airguard.velocity = -3.90625, -3.125
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -59
envshake.time = 12
envshake.ampl = 6
forcestand = 1
p2facing = 1

[State 3362, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0
movetype = I

[State 3362, Control]
type = CtrlSet
trigger1 = !AnimElemTime(17)
value = 1

[State 3362, End]
type = ChangeState
trigger1 = AnimElemTime(17) > 0
trigger1 = Pos Y + Vel Y > 0
value = 52
ctrl = 0



;====<YOGA CATASTROPHE>=
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = p1
pos = ceil(-30 * const(size.xScale)), ceil(-108 * const(size.yScale))
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

[State 3400, "Yooogaaaaaa....."]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3400,0
channel = 0

[State 3400, "CATASTROPHE!!!"]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3400,1
channel = 0

[State 3400, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,2
channel = 4

[State 3400, Yoga Catastrophe Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3405
ID = 3405
name = "Yoga Catastrophe Projectile"
posType = P1
pos = ceil(120 * const(size.xScale)), ceil(-72 * const(size.yScale))
size.xScale = 0.7 * const(size.xScale)
size.yScale = 0.7 * const(size.yScale)
ownPal = 1

[State 3400, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

