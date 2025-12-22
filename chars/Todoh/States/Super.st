; _________________________________________
;| Todoh by varo_hades                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<CHOU KASANE ATE>=
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
trigger1 = Time = 0
value = SCA
time = 55

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-23 * const(size.xScale)), ceil(-134 * const(size.yScale))
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

[State 3000, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000, 0
channel = 0

[State 3000, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000, 1
channel = 0

[State 3000, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3005
ID = 3005
name = "Chou Kasane Ate Projectile"
posType = P1
pos = 80, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX CHOU KASANE ATE>=
[StateDef 3050]
type = S
physics = N
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
trigger1 = Time = 0
value = SCA
time = 60

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-23 * const(size.xScale)), ceil(-134 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 52
moveTime = 52
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3050, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3000, 0
channel = 0

[State 3050, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000, 1
channel = 0

[State 3050, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3055
ID = 3005
name = "Chou Kasane Ate Projectile"
posType = P1
pos = 80, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<SHINGAN KUZU OTOSHI>=
[StateDef 3100]
type = S
physics = N
moveType = I
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
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
value = SCA
time = 65

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(34 * const(size.xScale)), ceil(-73 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 46
moveTime = 46
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 183, 0
channel = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100, 1
channel = 0

[State 1035, 2]
type = ReversalDef
trigger1 = AnimElemTime(4) < 0
attr = S, HA
reversal.attr = SCA, NA, SA, HA
pausetime = 2,0
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = -1
persistent = 1
p1stateno = 3101
p2stateno = 3109
guard.dist = 0
p2facing = 1
numhits = 0

[State 1501,1]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;Connect
[Statedef 3101]
type = S
movetype = A
physics = N
velset = 0,0

[State 820, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 3101

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8020
ID = 8000
name = "Spark"
posType = P1
pos = ceil(34 * const(size.xScale)), ceil(-73 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1031, TargetState]
type = TargetState
trigger1 = AnimElem = 4
value = 3105

[State 1031, TargetState]
type = TargetState
trigger1 = AnimElem = 28
trigger2 = AnimElem = 38
value = 3106

[State 3001, Width]
type = Width
trigger1 = animelemtime(17) < 0
edge = 45,0

[State 3001, Width]
type = Width
trigger1 = AnimElem = 17
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 760, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 17
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 37
value = 4, 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 28
value = 2, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 27
trigger3 = AnimElem = 37
value = 1, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 38
value = 3100, 2

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 17
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80, 0
facing = -1
ownPal = 1

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 28
trigger2 = AnimElem = 38
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(84 * const(size.xScale)), ceil(-10 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
time = 20
ampl = 5

[State 901,1]
type = TargetBind
trigger1 = animelem = 4
pos = 45, 0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 7
pos = 40, 0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 8
pos = 37, 0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 9
pos = 15, 0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 10
pos = -4, -77
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 11
pos = -2, -78
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 12
pos = 8, -87
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 13
pos = 14, -87
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 14
pos = 46, -72
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 15
pos = 48, -64
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 16
pos = 65, -68
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 17
pos = 78, 0
time = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 17
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
kill = 0

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 28
value = floor(ifElse(108 * fvar(11) < 7, -7, -108 * fvar(11)))
kill = 0

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 38
value = floor(ifElse(108 * fvar(11) < 7, -7, -108 * fvar(11)))

[State 871, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
value = 36

[State 871, Power]
type = PowerAdd
trigger1 = AnimElem = 17 && !var(20)
trigger2 = AnimElem = 28 && !var(20)
trigger3 = AnimElem = 38 && !var(20)
value = 0

[State 871, HitAdd]
type = HitAdd
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
value = 1

[State 871, HitCount]
type = VarAdd
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
var(13) = 1

[State 871, Juggle]
type = VarAdd
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
var(15) = 1
ignoreHitPause = 1

[State 871, Juggle]
type = VarSet
trigger1 = AnimElem = 17
trigger2 = AnimElem = 28
trigger3 = AnimElem = 38
var(16) = 1
ignoreHitPause = 1

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3105]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3105

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 1300,Turn]
type = Turn
trigger1 = anim = 3105 && animtime = 0

[State 902, 1]
type = ChangeAnim
trigger1 = anim = 3105 && animtime = 0
value = 5080

[State 902, 1]
type = ChangeAnim
trigger1 = Time = 80
value = 5110

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3110, ChangeState]
type = SelfState
trigger1 = Time >= 140
value = ifelse(alive, 5120, 5150)

;Player 2
[Statedef 3106]
type = A
movetype = H
physics = N
velset = 0,0
anim = 5080
sprpriority = -1

[State 902, 1]
type = ChangeAnim
trigger1 = Time <= 6
value = anim

[State 902, 1]
type = ChangeAnim
trigger1 = Time = 40
value = 5110

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3110, ChangeState]
type = SelfState
trigger1 = Time >= 90
value = ifelse(alive, 5120, 5150)

;Player 2
[Statedef 3109]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = AnimElemNo(0)

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

trigger1 = Time >= 70
value = ifelse(alive, 5120, 5150)

;Player 2
[Statedef 3109]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = AnimElemNo(0)

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
