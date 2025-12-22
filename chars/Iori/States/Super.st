; _________________________________________
;| Iori Yagami by Knuckles8864             |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<SHIKI 108: YA SAKAZUKI>=
[Statedef 3000]
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
trigger1 = !Time
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = !time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

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
trigger1 = !time
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -21,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = !time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 3000, nhb]
type = nothitby
trigger1 = anim = 3000 && time < 51
time = 1
value = SCA
ignorehitpause = 1

[State 3000, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3000, width]
type = width
trigger1 = 1
value = 10,0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0 + 10 * (var(40) = 1)
channel = 0

[State 3000, Fire Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 3005
ID = 3005
bindtime = -1
removeTime = -1
sprPriority = 2
posType = P1
pos = -26,-80
scale = 0.6,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1

[State 3000, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 50 && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = Time >= 120
id = 3005

[State 3000, RemoveExplod]
type = RemoveExplod
trigger1 = Enemy,statetype != A && Time >= 50
triggerall = AILevel
id = 3005

[State 3000, ChangeState]
type = ChangeState
trigger1 = Enemy,statetype != A && Time >= 50
triggerall = AILevel
value = 3001

[State 3000, ChangeState]
type = ChangeState
trigger1 = Time >= 50 && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = Time >= 120
value = 3001


;Ya Sakazuki Release
[StateDef 3001]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3001
velset = 0,0
sprpriority = 1

[State 3001, width]
type = width
trigger1 = AnimElemTime (10) < 0
value = 30,0

[State 3001, Voice]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 3
value = 3000,11
channel = 0

[State 3001, Yami Barai Startup Sound]
type = PlaySnd
trigger1 = Animelem = 4
value = 1000,1
channel = 2

[State 3001, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1004
sprPriority = 3
posType = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3001, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 3006
ID = 3006
name = "Ya Sakazuki Projectile"
posType = P1
pos = 44,0
size.xScale = .5 * const(size.xscale)
size.yScale = .5 * const(size.yscale)
ownPal = 1

[State 3001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Ya Sakazuki (Target)
[Statedef 3010]
movetype = H
physics = N
type = U

[State 3010, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 3010, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3010, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim !=3010
value = 3010

[State 3010, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3010, PalFX]
type = PalFX
trigger1 = AnimElemTime (1) > 0
time = 1
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3010, LifeAdd]
type = LifeAdd
trigger1 = time%5 = 0
value = -2
kill = 1
absolute = 1

[State 3010, SelfState]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !Alive
trigger3 = enemynear,var(39)<0
value = 3011



;Ya Sakazuki (Target Released)
[Statedef 3011]
movetype = H
physics = N
type = A

[State 3011, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3011, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3011, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim != 3011
value = 3011

[State 3011, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3011, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<MAX SHIKI 108: YA SAKAZUKI>=
[StateDef 3050]
type = S
physics = N
movetype = A
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
trigger1 = !Time
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = !time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

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
trigger1 = !time
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -21,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = !time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 3050, nhb]
type = nothitby
trigger1 = anim = 3000 && time < 51
time = 1
value = SCA
ignorehitpause = 1

[State 3050, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3050, width]
type = width
trigger1 = 1
value = 10,0

[State 3050, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0 + 10 * (var(40) = 1)
channel = 0

[State 3000, Fire Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 3005
ID = 3005
bindtime = -1
removeTime = -1
sprPriority = 2
posType = P1
pos = -26,-80
scale = 0.6,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1

[State 3050, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 50 && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = Time >= 120
id = 3005

[State 3050, RemoveExplod]
type = RemoveExplod
trigger1 = Enemy,statetype != A && Time >= 50
triggerall = AILevel
id = 3005

[State 3050, ChangeState]
type = ChangeState
trigger1 = Enemy,statetype != A && Time >= 50
triggerall = AILevel
value = 3051

[State 3050, ChangeState]
type = ChangeState
trigger1 = Time >= 50 && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = Time >= 120
value = 3051


;Ya Sakazuki Release
[StateDef 3051]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3001
velset = 0,0
sprpriority = 1

[State 3051, width]
type = width
trigger1 = AnimElemTime (10) < 0
value = 30,0

[State 1000, Voice]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 3
value = 3000,11
channel = 0

[State 3051, Yami Barai Startup Sound]
type = PlaySnd
trigger1 = Animelem = 4
value = 1000,1
channel = 2

[State 3051, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1004
sprPriority = 3
posType = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3051, Projectile]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 3055
ID = 3055
name = "Ya Sakazuki Projectile"
posType = P1
pos = 44,0
size.xScale = .5 * const(size.xscale)
size.yScale = .5 * const(size.yscale)
ownPal = 1

[State 3051, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Max Ya Sakazuki (Target)
[Statedef 3060]
movetype = H
physics = N
type = U

[State 3060, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 3060, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3060, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim != 3010
value = 3010

[State 3060, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3060, PalFX]
type = PalFX
trigger1 = AnimElemTime (1) > 0
time = 1
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3060, LifeAdd]
type = LifeAdd
trigger1 = time % 5 = 0
value = -2
kill = 1
absolute = 1

[State 3060, SelfState]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !Alive
trigger3 = enemynear,var(39)<0
value = 3011


;Max Ya Sakazuki (Target Released)
[Statedef 3061]
movetype = H
physics = N
type = A

[State 3061, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3061, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3061, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim != 3011
value = 3011

[State 3061, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3061, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<SHIKI 311: SAKU TSUMAGUSHI>=
[StateDef 3100]
type = S
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = -1000
facep2 = 1

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

[State 3100, No Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = !Time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

[State 3100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <=12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Super Cancel Juggle Reset]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3100, SuperPause FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 37,-52
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3100, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6
x = 12

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 3101
ctrl = 1


;Saku Tsumagushi Jump In
[Statedef 3101]
type=A
moveType = A
physics = N
anim = 1410
ctrl = 0
sprPriority = 1

[State 3101, VelSet]
type = VelSet
trigger1 = PrevStateNo= 3100 && !Time
x = 5
y = -5.4

[State 3101, VelAdd]
type = VelAdd
trigger1 = 1
y =.5

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 3102


;Saku Tsumagushi Jump In 2
[Statedef 3102]
type = A
movetype = A
physics = N
anim = 1411
ctrl = 0
sprpriority = 1

[State 3102, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3102, End]
type = ChangeState
trigger1 = !animtime
value = 3103


;Saku Tsumagushi Grab Attempt
[Statedef 3103]
type = A
physics = N
movetype = A
anim = 3101
ctrl = 0
sprpriority = 1

[State 3103, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3103, VarSet]
type = VarSet
trigger1 = 1 
var(33) = 0
ignorehitpause = 1

[State 3103, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 1300 * !var(20)
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4 ,Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.6,-6.5
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) :=100), var(36) :=-78
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P1StateNo = 3105
P2Facing = 1
kill = 0

[State 3103, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3104


;Saku Tsumagushi Land
[Statedef 3104]
type = S
physics = S
movetype = I
ctrl = 0
sprpriority = 1
anim = 3102
velset = 0,0

[State 3104, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3104, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3104, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3104, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3

[State 3104, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 3104, End]
type = ChangeState
trigger1= !AnimTime
value = 0
ctrl = 1


;Saku Tsumagushi Grab Success
[Statedef 3105]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 3101

[State 3105, Width]
type = Width
trigger1 = 1
edge = 63,0

[State 3105, VelAdd]
type = VelAdd
trigger1 = 1
y =.8

[State 3105, TargetState]
type = TargetState
trigger1 = !Time
value = 3107
ignorehitpause = 1

[State 3105, TargetBind]
type = TargetBind
trigger1 = 1
time = 1
pos = 60,-97
ignorehitpause = 1

[State 3105, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 3106


;Saku Tsumagushi Attack
[Statedef 3106]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 3103

[State 3106, Width]
type = Width
trigger1 = 1
edge = 63,0

[State 3106, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3106, TargetState]
type = TargetState
trigger1 = !Time
value = 3108

[State 3106, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 2
value = floor(ifElse(66 * fvar(11) < 7, -7, -66 * fvar(11)))
absolute = 1
kill = 0

[State 3106, EnvShake]
type = EnvShake
trigger1 = AnimElem=2
time = 15
freq = 60
ampl = -6
phase = 90

[State 3106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3106, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,2
channel = 1

[State 3106, Impact Dust]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3106, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 3106, Width]
type = Width
trigger1 = statetype=S
edge = 0,30

[State 3106, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3100,1
channel = 0

[State 3106, Flame]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 76,-62
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 26,-5
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 34,-4
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
pos = 32,-8
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 26,-24
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 31,-89
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
pos = 41,-141
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
trigger2 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
pos = 18,-149
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
trigger2 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
pos = -28,-135
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
trigger2 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
pos = -30,-124
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
pos = -10,-107
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
pos = 13,-107
time = 1

[State 3106, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(21) = 1
pos = 69,-24
time = 1

[State 3106, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(8) = 1
StateType = A
physics = N

[State 3106, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) = 1
y = -5.5

[State 3106, VelAdd]
type = Veladd
trigger1 =  AnimElemTime(20) >= 0
y = .45

[State 3106, Helper]
type = Helper
trigger1 = AnimElem = 8
helpertype = Normal
name = "Oni Yaki Front Flames"
ID = 1105
stateNo = 1105
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5

[State 3106, Flame Particles]
type = Helper
triggerall = !Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 20
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3106, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 21
value = floor(ifElse(55 * fvar(11) < 7, -7, -55 * fvar(11))); like this fvar(10) is the damage dampener var 
absolute = 1
kill = 0

[State 3106, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 23
value = floor(ifElse(46 * fvar(11) < 7, -7, -46 * fvar(11)))
absolute = 1
kill = 1

[State 3106, Explod]
type = Explod
trigger1 = AnimElemTime(20) > 0 && AnimElemTime(21) < 4
anim = 1335
ID = 1335
pos = 30+random%120,-120+random%60
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7
ontop = 1

[State 3106, Fire Sound]
type = PlaySnd
trigger1 = AnimElemTime (20) = 1
trigger2 = AnimElemTime (21) = 1
trigger3 = AnimElemTime (22) = 1
value = 1000,2

[State 3106, HitAdd]
type = HitAdd
trigger1 = AnimElemTime (20) = 1
value = 1

[State 3106, HitAdd]
type = HitAdd
trigger1 = AnimElemTime (20) = 1
trigger2 = AnimElemTime (21) = 1
trigger3 = AnimElemTime (22) = 1
value = 1

[State 3106, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 52


;Saku Tsumagushi (Target)
[Statedef 3107]
type = A
movetype = H
physics = N
velset = 0,0

[State 3107, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3107, Turn]
type = Turn
trigger1 = EnemyNear, Facing != Facing && !Time
ignorehitpause = 1

[State 3107, SprPriority]
type = SprPriority
trigger1 = !Time
value = 2
ignorehitpause = 1

[State 3107, ChangeAnim2]
type= ChangeAnim2
trigger1 = !Time
triggerall = Anim != 3104
value = 3104
ignorehitpause = 1

[State 3107, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0
ignorehitpause = 1


;Saku Tsumagushi (Target)
[Statedef 3108]
type = A
movetype = H
physics = N
velset = 0,0

[State 3108, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3108, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = L

[State 3108, Turn]
type = Turn
trigger1 = AnimElem = 6

[State 3108, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3108, ChangeAnim2]
type= ChangeAnim2
trigger1 = !Time
triggerall = Anim != 3105
value = 3105

[State 3108, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A

[State 3108, SprPriority]
type = SprPriority
trigger1 = Time = 42
trigger2 = Time = 54
value = -1

[State 3108, SprPriority]
type = SprPriority
trigger1 = !Time
trigger2 = Time = 48
trigger3 = Time = 60
value = 2

[State 3108, VelSet]
type = VelSet
trigger1 = AnimElemTime(11) = 2 
x = -8
y = -3

[State 3108, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(11) > 0 
y = .5

[State 3108, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3108, PalFX]
type = PalFX
trigger1 = AnimElem = 11
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3108, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3108, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100


;MAX Saku Tsumagushi (Target)
[Statedef 3109]
type = A
movetype = H
physics = N
velset = 0,0

[State 3109, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3109, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem = 2
statetype = L

[State 3109, Turn]
type = Turn
trigger1 = animelem = 6

[State 3109, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3109, ChangeAnim2]
type= ChangeAnim2
trigger1 = !Time
triggerall = anim != 3151
value = 3151

[State 3109, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A

[State 3109, SprPriority]
type = SprPriority
trigger1 = Time = 68
trigger2 = Time = 80
value = -1

[State 3109, SprPriority]
type = SprPriority
trigger1 = !Time
trigger2 = Time = 74
trigger3 = Time = 86
value = 2

[State 3109, VelSet]
type = VelSet
trigger1 = AnimElemTime(11)=2 
x = -8
y = -3

[State 3109, VelAdd]
type = VelAdd
trigger1 = AnimElemTime (11) > 0 
y = .5

[State 3109, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3109, PalFX]
type = PalFX
trigger1 = AnimElem = 4
time = 20
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3109, PalFX]
type = PalFX
trigger1 = AnimElem=11
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3109, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3109, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<MAX SHIKI 311: SAKU TSUMAGUSHI>=
[StateDef 3150]
type = S
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = -2000
facep2 = 1

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

[State 3150, No Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = !Time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

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

[State 3150, SuperPause FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 37,-52
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3150, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3150, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 1
value = 3100,0
channel = 0

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6
x = 12

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 3151
ctrl = 1


;Saku Tsumagushi Jump In
[Statedef 3151]
type=A
moveType = A
physics = N
anim = 1410
ctrl = 0
sprPriority = 1

[State 3151, VelSet]
type = VelSet
trigger1 = PrevStateNo= 3150 && !Time
x = 10
y = -5.4

[State 3151, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3151, End]
type = ChangeState
trigger1 = !AnimTime
value = 3152


;Saku Tsumagushi Jump In 2
[Statedef 3152]
type = A
movetype = A
physics = N
anim = 1411
ctrl = 0
sprpriority = 1

[State 3152, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3152, End]
type = ChangeState
trigger1 = !animtime
value = 3153


;Saku Tsumagushi Grab Attempt
[Statedef 3153]
type = A
physics = N
movetype = A
anim = 3101
ctrl = 0
sprpriority = 1

[State 3103, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3153, VarSet]
type = VarSet
trigger1 = 1 
var(33) = 0
ignorehitpause = 1

[State 3153, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 1300 * !var(20)
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4 ,Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.6,-6.5
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) :=100), var(36) :=-78
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P1StateNo = 3155
P2Facing = 1
kill = 0

[State 3153, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3154


;Saku Tsumagushi Land
[Statedef 3154]
type = S
physics = S
movetype = I
ctrl = 0
sprpriority = 1
anim = 3102
velset = 0,0

[State 3154, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3154, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3154, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3154, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,3

[State 3154, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 3154, End]
type = ChangeState
trigger1= !AnimTime
value = 0
ctrl = 1


;Saku Tsumagushi Grab Success
[Statedef 3155]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 1
anim = 3101

[State 3155, Width]
type = Width
trigger1 = 1
edge = 63,0

[State 3155, VelAdd]
type = VelAdd
trigger1 = 1
y =.8

[State 3155, TargetState]
type = TargetState
trigger1 = !Time
value = 3107
ignorehitpause = 1

[State 3155, TargetBind]
type = TargetBind
trigger1 = 1
time = 1
pos = 60,-97
ignorehitpause = 1

[State 3155, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 3156


;MAX Saku Tsumagushi Attack
[Statedef 3156]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 1
anim = 3150

[State 3156, Width]
type = Width
trigger1 = 1
edge = 63,0

[State 3156, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3156, TargetState]
type = TargetState
trigger1 = !Time
value = 3109

[State 3156, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 2
value = floor(ifElse(78 * fvar(11) < 7, -7, -78 * fvar(11)))
kill = 0

[State 3156, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = floor(ifElse(45 * fvar(11) < 7, -7, -45 * fvar(11)))
kill = 0

[State 3156, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 15
freq = 60
ampl = -6
phase = 90

[State 3156, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3156, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,2
channel = 1

[State 3156, Impact Dust]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(40 * const(size.xScale)),0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3156, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
name = "Flames"
ID = 1435
stateno = 1435
pos = 45,-20
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5
size.yscale = .5

[State 3156, Explod]
type = Explod
trigger1 = AnimElemTime(5)=0
trigger2 = AnimElemTime(5)=2
anim = 1335
ID = 1335
pos = 40,-17
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7
ontop = 1

[State 3156, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(5)=0
trigger2 = AnimElemTime(5)=2
time = 10
freq = 120
ampl = -4

[State 3156, Width]
type = Width
trigger1 = StateType = S
edge = 0,30

[State 3156, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1300,3
channel = 3

[State 3156, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3100,1
channel = 0

[State 3156, Flame]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 76,-62
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 26,-5
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 34,-4
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
pos = 32,-8
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 26,-24
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 31,-89
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
pos = 41,-141
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
trigger2 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
pos = 18,-149
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
trigger2 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
pos = -28,-135
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
trigger2 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
pos = -30,-124
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
pos = -10,-107
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
pos = 13,-107
time = 1

[State 3156, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(21) = 1
pos = 69,-24
time = 1

[State 3156, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(8) = 1
StateType = A
physics = N

[State 3156, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) = 1
y = -5.5

[State 3156, VelAdd]
type = Veladd
trigger1 =  AnimElemTime(20) >= 0
y = .45

[State 3156, Helper]
type = Helper
trigger1 = AnimElem = 8
helpertype = Normal
name = "Oni Yaki Front Flames"
ID = 1105
stateNo = 1105
pos = 0,0
posType = p1
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = .5
size.yScale = .5

[State 3156, Flame Particles]
type = Helper
triggerall = !Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 14
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3156, Flame Particles]
type = Helper
triggerall = !Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 20
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3156, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 21
value = floor(ifElse(61 * fvar(11) < 7, -7, -61 * fvar(11)))
kill = 0

[State 3156, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 23
value = floor(ifElse(48 * fvar(11) < 7, -7, -48 * fvar(11)))
kill = 0

[State 3156, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 23
value = floor(ifElse(45 * fvar(11) < 7, -7, -45 * fvar(11)))

[State 3156, Explod]
type = Explod
trigger1 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 4
anim = 1335
ID = 1335
pos = 30+random%120,-120+random%60
posType = p1
facing = 1
vFacing = 1
bindTime = 1
removeTime = -2
scale = .5,.5
sprPriority = 7
onTop = 1

[State 3156, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(5) = 1
value = 1

[State 3156, Fire Sound]
type = PlaySnd
trigger1 = AnimElemTime(20) = 1
trigger2 = AnimElemTime(21) = 1
trigger3 = AnimElemTime(22) = 1
value = 1000,2

[State 3156, HitAdd]
type = HitAdd
trigger1 = AnimElemTime(20) = 1
trigger2 = AnimElemTime(21) = 1
trigger3 = AnimElemTime(22) = 1
value = 1

[State 3156, HitAdd]
type = HitAdd
trigger1 = AnimElemTime (20) = 1
value = 3

[State 3156, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 52



;====<SHIKI 1201: YA OTOME>=
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
trigger1 = !Time
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

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
pos = Ifelse(Var(40),-12,0),Ifelse(Var(40),-63,-114)
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3200, VelAdd]
type = VelSet
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
x = 8.5

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 3200
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0  * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) :=55), var(36) :=-65
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P2Facing = 1
kill = 0

[State 3200, TargetState]
type = TargetState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3230
ID = 3200
ignoreHitPause = 1
persistent = 0

[State 3200, ChangeState]
type = ChangeState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3210

[State 3200, End]
type = ChangeState
trigger1 = Time = 70
trigger2 = MoveGuarded
value = 3201
ctrl = 0


;Stopping
[StateDef 3201]
type = S
physics = S
moveType = A
anim = 3201
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 0

[State 3201, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 1
movetype = I

[State 3201, Accel]
type = VelSet
trigger1 = AnimElemTime(1) = 0
x = 16.46875

[State 3201, Vel]
type = VelSet
trigger1 = AnimElemTime(1) > 0
x = (7.470703125*exp((-0.0645)*(AnimElemTime(1)-1)))

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3210]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
anim = 3210

[State 3210, Width]
type = Width
trigger1 = 1
edge = 63,0

;[State 3210, Blood]
;type = Helper
;trigger1 = AnimElem = 15
;trigger2 = AnimElem = 25
;trigger3 = AnimElem = 33
;trigger4 = AnimElem = 37
;trigger5 = AnimElem = 46
;helperType = Normal
;stateNo = 8050
;ID = 8050
;name = "Blood"
;posType = P2
;pos = 0,-52
;facing = -1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1

[State 3210, Hit Sound]
type = Null
trigger1 =  AnimElem = 4 || AnimElem = 8 || AnimElem = 37
trigger1 = var(31) := 2
trigger2 = AnimElem = 25 || AnimElem = 33
trigger2 = var(31) := 10
trigger3 = AnimElem = 15 || AnimElem = 46
trigger3 = var(31) := 11

[State 3210, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 || AnimElem = 37
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p2Facing = 1
kill = 0

[State 3210, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3210, HitDef: Slash High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3010, HitDef: Slash Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 46
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3210, Lost Target]
type = ChangeState
trigger1 = AnimElem = 50 && !NumTarget
value = 0
ctrl = 1

[State 3210, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(50) < 0
pos = 55,0
time = 1

[State 3210, TargetState]
type = TargetState
trigger1 = AnimElem = 50 && NumTarget
value = 3232

[State 3210, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(53) >= 0 && AnimElemTime(59) < 0
pos = 36,0
time = 1

[State 3210, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 59
value = floor(ifElse(59 * fvar(11) < 7, -7, -59 * fvar(11)))
kill = 1

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3200,1
channel = 1

[State 3210, Grab]
type = PlaySnd
trigger1 = AnimElem = 53
value = 2,800
channel = 2

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 54
value = 3200,2
channel = 1

[State 3210, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 59
value = 1300,3
channel = 3

[State 3210, Flame Particles]
type = Helper
triggerall = !Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 59
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3210, Explod]
type = Explod
trigger1 = AnimElemTime(59)=0
trigger2 = AnimElemTime(59)=2
anim = 1335
ID = 1335
pos = 30+random%50,-57-random%50
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7
ontop = 1

[State 3210, EnvShake]
type = EnvShake
trigger1 = animelem = 59
time = 15
freq = 75
ampl = -8

[State 3210, TargetState]
type = TargetState
trigger1 = AnimElem = 59
value = 3233

[State 3210, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 3210, Saika]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(59) > 4 && AnimElemTime(60) < 6
triggerAll = power >= 1000
trigger1 = !AILevel
trigger1 = command = "Saika"
trigger2 = AILevel
trigger2 = MoveContact
var(14) = 3300

[State 3210, Followup]
type = ChangeState
trigger1 = var(14) = 3300
trigger1 = AnimElemTime(59) > 4 && AnimElemTime(60) < 6
value = var(14)

[State 3210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SHIKI 1201: YA OTOME (TARGET)>=
;Target
[StateDef 3230]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3230, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3230, Turn]
type = Turn
trigger1 = EnemyNear, Facing = Facing
ignorehitpause = 1

[State 3230, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3230, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 3230, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3230, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3231


;Sliding
[StateDef 3231]
type = S
movetype = H
physics = S

[State 3231, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5017

[State 3231, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3231, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1


;Ya Otome (Target Grabbed)
[Statedef 3232]
type = U
movetype= H
physics = S
ctrl = 0
velset = 0,0

[State 3232, ChangeAnim]
type = ChangeAnim2
trigger1 = !time
value = 3230

[State 3232, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3232, StateTypeSet]
type = StateTypeSet
trigger1 = Hitshakeover
statetype = S

[State 3232, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3232, NotHitBy]
type = NotHitBy
trigger1 = animtime
value = SCA
time = 1

[State 3232, PosSet]
type = PosSet
trigger1 = hitshakeover
y = 0

[State 3232, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3233
ctrl = 0


;Ya Otome (Target Thrown)
[Statedef 3233]
type = A
movetype = H
physics = N
velset = 0
ctrl = 0

[State 3233, 1]
type = ChangeAnim
Trigger1 = !time
value = 5030

[State 3233, 1]
type = ChangeAnim
Trigger1 = anim = 5030 && !animtime
value = 5050

[State 3233, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3233, VelSet]
type = VelSet
trigger1 = !Time
x = -2.6
y = -7.6

[State 3233, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3233, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3233, SelfState]
type = SelfState
trigger1 = Pos Y + Vel Y >= 0;>= 0 && Vel Y >= 0
value = 5100


;MAX Ya Otome (Target Grabbed)
[Statedef 3234]
type = U
movetype= H
physics = S
ctrl = 0
velset = 0,0

[State 3234, ChangeAnim]
type = ChangeAnim2
trigger1 = !time
value = 3231

[State 3234, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3234, StateTypeSet]
type = StateTypeSet
trigger1 = Hitshakeover
statetype = S

[State 3234, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3234, NotHitBy]
type = NotHitBy
trigger1 = animtime
value = SCA
time = 1

[State 3234, PalFX]
type = PalFX
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
trigger3 = AnimElem = 9
trigger4 = AnimElem = 11
trigger5 = AnimElem = 13
time = 20
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3234, PosSet]
type = PosSet
trigger1 = hitshakeover
y = 0

[State 3234, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3235
ctrl = 0


;Max Ya Otome (Target Thrown)
[Statedef 3235]
type = A
movetype = H
physics = N
velset = 0
ctrl = 0

[State 3235, 1]
type = ChangeAnim
Trigger1 = !time
value = 5030

[State 3235, 1]
type = ChangeAnim
Trigger1 = anim = 5030 && !animtime
value = 5050

[State 3235, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3235, VelSet]
type = VelSet
trigger1 = !Time 
x = -7.6
y = -4.6

[State 3235, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3235, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3235, SelfState]
type = SelfState
trigger1 = Pos Y + Vel Y >= 0;>= 0 && Vel Y >= 0
value = 5100



;Ya Otome (Target Grabbed)(Orochi)
[Statedef 3236]
type = S
movetype = H
physics = N

[State 3236, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3236, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
value = 3235

[State 3236,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3236, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;Ya Otome (Target Thrown)(Orochi)
[Statedef 3237]
type = A
movetype = H
physics = N

[State 3237, 1]
type = ChangeAnim
Trigger1 = !time
value = 5030

[State 3237, 1]
type = ChangeAnim
Trigger1 = anim = 5030 && !animtime
value = 5050

[State 3237, VelSet]
type = VelSet
trigger1 = !Time
x = -3.6
y = -6.6

[State 3237, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3237, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3237, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3237, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3237, SelfState]
type = SelfState
trigger1 = Pos Y + Vel Y >= 0;>= 0 && Vel Y >= 0
value = 5100


;MAX Ya Otome (Target Grabbed)(Orochi)
[Statedef 3238]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0, 0

[State 3238, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3238, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3238, PalFX]
type = PalFX
trigger1 = AnimElem = 10
trigger2 = AnimElem = 12
trigger3 = AnimElem = 14
trigger4 = AnimElem = 16
time = 20
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3238,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3238, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3236


;MAX Ya Otome (Target Thrown)(Orochi)
[Statedef 3239]
type = A
movetype = H
physics = N
velset = 6.2,-5
ctrl = 0

[State 3239, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3239, ChangeAnim2]
type = ChangeAnim
trigger1 = Time = 0
value = 5030
persistent = 0

[State 3239, ChangeAnim2]
type = ChangeAnim
trigger1 = anim = 5030 && AnimTime = 0
value = 5050

[State 3239, veladd]
type = veladd
trigger1 = 1
y = .45

[State 3239, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100



;====<MAX SHIKI 1201: YA OTOME>=
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
trigger1 = !Time
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

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

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = 0, -114
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3250, VelAdd]
type = VelSet
trigger1 = animelemtime(5)>=0 && animelemtime(7)<0
x = 8.5

[State 3250, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 3250
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0  * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) :=55), var(36) :=-65
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P2Facing = 1
kill = 0

[State 3200, TargetState]
type = TargetState
trigger1 = NumTarget(3250)
trigger1 = MoveHit && Target, Alive
value = 3230
ID = 3250
ignoreHitPause = 1
persistent = 0

[State 3200, ChangeState]
type = ChangeState
trigger1 = NumTarget(3250)
trigger1 = MoveHit && Target, Alive
value = 3251

[State 3250, End]
type = ChangeState
trigger1 = Time = 90
trigger2 = MoveGuarded
value = 3201
ctrl = 0


;Success
[StateDef 3251]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3250

[State 3251, Width]
type = Width
trigger1 = 1
edge = 63,0

;[State 3251, Blood]
;type = Helper
;trigger1 = AnimElem = 15
;trigger2 = AnimElem = 25
;trigger3 = AnimElem = 32
;trigger4 = AnimElem = 36
;trigger5 = AnimElem = 45
;helperType = Normal
;stateNo = 8050
;ID = 8050
;name = "Blood"
;posType = P2
;pos = 0,-52
;facing = -1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1

[State 3251, Explod]
type = Explod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 25
trigger3 = AnimElem = 33
trigger4 = AnimElem = 37
trigger5 = AnimElem = 46
anim = 8150
ID = 8150
pos = 1+random%10,-50-random%50
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .3,.3
sprpriority = 7

[State 3251, Explod]
type = Explod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 25
trigger3 = AnimElem = 33
trigger4 = AnimElem = 37
trigger5 = AnimElem = 46
anim = 1335
ID = 1335
pos = 1+random%10,-50-random%50
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .3,.3
sprpriority = 7

[State 3251, Hit Sound]
type = Null
trigger1 =  AnimElem = 4 || AnimElem = 8 || AnimElem = 37
trigger1 = var(31) := 2
trigger2 = AnimElem = 25 || AnimElem = 33
trigger2 = var(31) := 10
trigger3 = AnimElem = 15 || AnimElem = 46
trigger3 = var(31) := 11

[State 3251, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 || AnimElem = 37
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3251, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3251, HitDef: Slash High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
kill = 0

[State 3251, HitDef: Slash Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 46
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -65
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
kill = 0

[State 3251, Lost Target]
type = ChangeState
trigger1 = AnimElem = 50 && !NumTarget
value = 0
ctrl = 1

[State 3251, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(50) < 0
pos = 55,0
time = 1

[State 3251, TargetState]
type = TargetState
trigger1 = AnimElem = 50 && NumTarget
value = 3234

[State 3251, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(53) >= 0 && AnimElemTime(69) < 0
pos = 36,0
time = 1

[State 3251, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
value = floor(ifElse(23 * fvar(11) < 7, -7, -23 * fvar(11)))
kill = 0

[State 3251, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 69
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 1

[State 3251, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(54) >= 0 && AnimElemTime(55) <= 0 && TimeMod = 8,0
time = 8
freq = 65
ampl = -6

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3200,1
channel = 1

[State 3251, Grab]
type = PlaySnd
trigger1 = AnimElem = 53
value = 2,800
channel = 2

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 66
value = 3200,2
channel = 1

[State 3251, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
value = 1300,3

[State 3251, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 69
value = 1300,3
channel = 3

[State 3251, Explod]
type = Explod
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
anim = 8150
ID = 8150
pos = 1+random%10,-100+(random%42)
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .6,.6
sprpriority = 7

[State 3251, Explod]
type = Explod
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
anim = 1335
ID = 1335
pos = 1+random%10,-100+(random%42)
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .4,.4
sprpriority = 7

[State 3251, EnvShake]
type = EnvShake
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
time = 8
freq = 65
ampl = -6

[State 3251, HitAdd]
type = HitAdd
trigger1 = AnimElem = 57
trigger2 = AnimElem = 59
trigger3 = AnimElem = 61
trigger4 = AnimElem = 63
trigger5 = AnimElem = 65
value = 1

[State 3251, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 69
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3251, Explod]
type = Explod
trigger1 = AnimElemTime(69)=0
trigger2 = AnimElemTime(69)=2
anim = 1335
ID = 1335
pos = 30+random%50,-57-random%50
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7
ontop = 1

[State 3251, EnvShake]
type = EnvShake
trigger1 = AnimElem = 69
time = 15
freq = 75
ampl = -8

[State 3251, TargetState]
type = TargetState
trigger1 = AnimElem = 69
value = 3235

[State 3251, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SHIKI 306: SAIKA>=
[StateDef 3300]
type = S
physics = N
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
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = !Time
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = !time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

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

[State 3300, SuperPause FX]
type = Helper
trigger1 = !time
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -14,-96
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
powerAdd = 0

[State 3300, NotHitBy]
type = NotHitBy
trigger1= AnimElemTime(5) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = !Time
value = 3300,0
channel = 1

[State 3300, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nojugglecheck

[State 3300, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
attr = S, HA
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit   
damage = 0, 0
getPower = 0, 0
givePower = 16, 16
pauseTime = 0, 26
guard.pauseTime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4,-7.77564102564102564102564102563869
air.cornerPush.velOff = 0
yaccel = .5
hitSound = -1 + 0 * (var(31) := 10)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -52
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P1StateNo = 3301
kill = 0

;[State 3300, Blood]
;type = Helper
;TriggerAll = var(1)
;trigger1 = HitPauseTime = IfElse((var(20) || var(14)), 4, 8)
;trigger1 = MoveHit = 1 && NumTarget
;helpertype = Normal
;stateno = 8050
;ID = 8050
;name = "Blood"
;postype = p1
;pos = -10,-52
;facing = IfElse((Target, Facing = Facing), 1, -1)
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State 3300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[Statedef 3301]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
anim = 3301

[State 3301, TargetState]
type = TargetState
trigger1 = !Time
value = 3330

[State 3301, Helper]
type = Helper
trigger1 = Time = 36
trigger2 = Time = 40
trigger3 = Time = 46
trigger4 = Time = 52
trigger5 = Time = 62
helpertype = normal
name = "Slash Spark"
ID = 8016
stateNo = 8016
pos = 1,-65
posType = P2
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = 1
size.yscale = 1

;[State 3301, Blood]
;type = Helper
;TriggerAll = var(1)
;trigger1 = HitPauseTime = IfElse((var(20) || var(14)), 4, 8)
;trigger1 = MoveHit = 1 && NumTarget
;helperType = Normal
;stateNo = 8050
;ID = 8050
;name = "Blood"
;posType = P2
;pos = 1,-65
;facing = -1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1

[State 3301, Slash Sound]
type = PlaySnd
trigger1 = Time = 36
trigger2 = Time = 40
trigger3 = Time = 46
trigger4 = Time = 52
trigger5 = Time = 62
value = S2,10
channel = 2


[State 3301, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3300,1
channel = 0

[State 3301, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 36
trigger2 = Time = 40
trigger3 = Time = 46
trigger4 = Time = 52
trigger5 = Time = 62
value = floor(ifElse(8 * fvar(11) < 7, -7, -8 * fvar(11)))
kill = 0

[State 3301, HitAdd]
type = HitAdd
trigger1 = Time = 36
trigger2 = Time = 40
trigger3 = Time = 46
trigger4 = Time = 52
trigger5 = Time = 62
value = 1

[State 3301, EnvShake]
type = EnvShake
trigger1 = !Time
trigger2 = Time = 65
time = 20
freq = 180
ampl = -6

[State 3301, Yami Barai]
type = Helper
trigger1 = AnimElem = 18
helperType = Normal
stateNo = 3305
ID = 3305
name = "Saika Pillar"
posType = P1
pos = 50,10
ownPal = 1
size.xscale = .5 * const(size.xscale)
size.yscale = .5 * const(size.yscale)

[State 3301, PalFX]
type = PalFX
trigger1 = AnimElemTime(14) > 0 && AnimElemTime(14) <= 26
time = 2
mul = 256-((time-90)*9),256-((time-90)*9),256-((time-90)*9)

[State 3301, PalFX]
type = PalFX
trigger1 = AnimElemTime(14) > 26 && AnimElemTime(15) < 0
time = 2
mul = 0,0,0

[State 3301, ChangeState]
type = ChangeState
trigger1= !AnimTime
value = 0
ctrl = 1



;====<SHIKI 306: SAIKA TARGET>=
[Statedef 3330]
type = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 3330, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3330, Anim 5050]
type = ChangeAnim
triggerall = anim = 5030
trigger1 = animtime = 0
value = 5050

[State 3330, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3330, Anim 5050]
type = ChangeState
trigger1 = HitShakeOver
value = 3331


;Saika-P2
[Statedef 3331]
type = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 3331, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3331, Anim 5050]
type = ChangeAnim2
trigger1 = !time
value = 3330

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 13
y = -21

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 19
x = -13
y = -7

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 25
y = -21

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 31
x = -13
y = -7

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 33
x = -11
y = -7

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 35
x = -8
y = -6

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 66
y = -18

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 68
y = -17

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 70
y = -15

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 72
y = -14

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 74
y = -11

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 76
y = -9

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 78
y = -7

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 80
y = -7

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 82
y = -5

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 84
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 86
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 88
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 90
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 91
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 92
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 93
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 94
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 95
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 96
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 97
y = -1

[State 3331, PosAdd]
type = PosAdd
trigger1 = time = 99
y = -1

[State 3331, VelSet]
type = VelSet
trigger1 = time = 101
y = 0.1

[State 3331, VelAdd]
type = VelAdd
trigger1 = time > 100
y = 0.625

[State 3331, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5051)
trigger1 = time = 76
value = 5051

[State 3331, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(5051)
trigger1 = time = 76
value = 5050

[State 3331, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5061)
trigger1 = time = 89
value = 5061

[State 3331, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3331, SelfState]
type = SelfState
trigger1 = time > 90
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5100


;Saika-P2
[Statedef 3332]
type = A
movetype = H
physics = N

[State 3332, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3332, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5050)
trigger1 = !time
value = 5050

[State 3332, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5052)
trigger1 = !time
value = 5052

[State 3332, VelSet]
type = VelSet
trigger1 = !Time
x = -2.6
y = -11.6

[State 3332, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3332, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3332, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3332, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 18
freq = 120
ampl = -5

[State 3332, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<URA 1029 SHIKI: HOMURABOTOGI>=
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
velSet = 0,0
ctrl = 0
sprPriority = 1
powerAdd = -3000
facep2=1

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

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3400, Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 53

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

[State 3400, SuperPause FX]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = P1
pos = 13,-62
superMoveTime = 255
pauseMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = !Time
value = 3300,1
channel = 0

[State 3400, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 3005
ID = 3005
pos = -27,-38
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pauseMoveTime = -1
superMoveTime = -1
scale = 0.8,0.8
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3400, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 3005
ID = 3005
pos = 36,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pauseMoveTime = -1
superMoveTime = -1
scale = 0.7,0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3400, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 5
id = 3005

[State 3400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3401

[State 3400, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 3400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 3400, Dust Helper]
type = Helper
trigger1 = AnimElem=1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3400, Fire Explod 1]
type = Explod
trigger1 = AnimElem = 5
anim = 10192
ID = 10182
sprPriority = 3
posType = P1
pos = -4,-117
removeTime = 22
bindtime = 999
scale = 0.7,0.7
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3400, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 10182
pos = -7,-112
posType = P1

[State 3400, ModifyExplod 2]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 10182
pos = 11,-96
posType = P1

[State 3400, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 10182
pos = 12,-66
posType = P1

[State 3400, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 10182
pos = 11,-102
posType = P1

[State 3400, ModifyExplod 5]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 10182
pos = -4,-117
posType = P1

[State 3400, Fire Explod 2]
type = Explod
trigger1 = AnimElem = 5
anim = 10192
ID = 10183
sprPriority = 3
posType = P1
pos = -4,-117
removeTime = 22
bindtime = 999
scale = 0.7,0.7
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3400, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 10183
pos = -2,-112
posType = P1

[State 3400, ModifyExplod 2]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 10183
pos = 26,-96
posType = P1

[State 3400, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 10183
pos = 26,-63
posType = P1

[State 3400, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 10183
pos = 26,-96
posType = P1

[State 3400, ModifyExplod 5]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 10183
pos = -4,-117
posType = P1

[State 3400, Vel]
type = velset
trigger1 = AnimElem = 5
x = p2dist x / ((14 + ((14 ** 2) -(4 * 0.375 * (enemynear(0), const(size.height)))) ** 0.5) / 0.75)
y = -8
persistent = 0

[State 3400, Vel]
type = turn
trigger1 = vel x < 0
persistent = 0

[State 3400, Vel]
type = velset
trigger1 = vel x > 10
x = 10

[State 3400, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3400, Accel]
type = veladd
trigger1 = AnimElemTime(5) > 0
y = 0.75

[State 3400, RemoveExplod]
type = RemoveExplod
trigger1 = Anim = 3402
ID = 10182

[State 3400, RemoveExplod]
type = RemoveExplod
trigger1 = Anim = 3402
ID = 10183

[State 3400, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3401


;Attack/Miss
[Statedef 3401]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3401
ctrl = 0

[State 3401, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 3401, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800,0
channel = 0

[State 3401, Grab Attempt]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 3401, Flame Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3005
id = 3005
pos = 66,-80
postype = p1
removeTime = 17
bindtime = 999
ownpal = 1
scale = 0.9,0.7
removeongethit = 1
sprpriority = 2

[State 3401, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 3005
pos = 66,0
posType = P1

[State 3401, Flame Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 10194
id = 3006
pos = 66,0
postype = p1
removeTime = 14
bindtime = 999
ownpal = 1
scale = 0.9,0.7
removeongethit = 1
sprpriority = 2

[State 3401, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3401, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3401, HitDef]
type = HitDef
triggerAll = AnimElem = 1
triggerAll = P2StateNo != [150,159]
trigger1 = P2MoveType = H && P2StateType = A
trigger2 = P2StateType != A
attr = A, HT
hitFlag = MAF
priority = 2, Miss
getPower = 0, 0
givePower = 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
P2facing = 1
P2stateno = 3415

[State 3401, Hit Success]
type = ChangeState
trigger1 = MoveHit
value = 3410

[State 3401, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 3401, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;(Success)
[Statedef 3410]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3410
ctrl = 0

;[State 3410, BlackBG]
;type = helper
;trigger1 = !time
;helpertype = normal
;stateno = 3450
;ID = 3450
;name = "BlackBG"
;postype = Back
;supermovetime = 99999
;pausemovetime = 99999
;ownpal = 1
;ignorehitpause = 1

[State 3410, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50
edge = 80,0

[State 3410, RemoveExplod]
type = RemoveExplod
trigger1 = Anim = 3410
ID = 3005

[State 3410, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3410, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3410, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 75,-97
time = 1

[State 3410, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 71,-2
time = 1

[State 3410, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3410,0
channel = 1

[State 3410, Explosion Sound]
type = PlaySnd
trigger1 = AnimElemTime(2) = 60
value = 1300,3
channel = 3

[State 3410, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 23
freq = 75
ampl = -8

[State 3410, HitAdd]
type = HitAdd
trigger1 = Time = 64
value = 1
persistent = 0
ignorehitpause = 1

[State 3410, Damage]
type = TargetLifeAdd
trigger1 = AnimElem = 2
value = floor(ifElse(403 * fvar(11) < 7, -7, -403 * fvar(11)))
ignorehitpause = 1

[State 3410, Damage]
type = TargetLifeAdd
trigger1 = AnimElemTime(2) = 60
value = floor(ifElse(7 * fvar(11) < 7, -7, -7 * fvar(11)))
ignorehitpause = 1

[State 3410, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 3430
ID = 3430
pos = ceil(10 * const(size.xscale)), -ceil(20 * const(size.yscale))
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 0.5, 0.8
sprpriority = 7

[State 3410, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 3431
ID = 3431
pos = ceil(10 * const(size.xscale)), -ceil(20 * const(size.yscale))
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -1
scale = 0.5, 0.5
sprpriority = -2

[State 3410, Flame Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3005
ID = 3007
pos = 65,-80
posType = p1
removeTime = 84
bindTime = 999
ownPal = 1
scale = 0.9,0.7
sprpriority = 2

[State 3410, ModifyExplod 1]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 3007
pos = 65,0
posType = P1

[State 3410, Flame Disappear]
type = Explod
trigger1 = AnimElem = 2
anim = 10194
id = 10194
pos = 65,0
postype = p1
removeTime = 94
bindtime = 999
ownpal = 1
scale = 0.9,0.7
removeongethit = 1
sprpriority = 2

[State 3410, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElemTime(2) = 60
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3410, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) = 60
time = 23
ampl = 4
freq = 40
persistent = 0
ignorehitpause = 1

[State 3410, EnvShake]
type = EnvShake
trigger1= time = 64
time = 14
freq = 120
ampl = -3

[State 3410, TargetState]
type = TargetState
trigger1 = AnimElemTime(2) = 60
value = 3416

[State 3410, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 54
id = 3431

[State 3410, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


; Homurabotogi-P2
[Statedef 3415]
type = S
movetype = H
physics = N

[State 3415, SprPriority]
type = SprPriority
trigger1 = !Time
value = 3

[State 3415, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
value = 3415

[State 3415, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;Kototsuki In-P2 State
[Statedef 3416]
type = A
movetype = H
physics = N

[State 3416, NotHitBy]
type = NotHitBy
trigger1 = Time >= 2 
value = SCA
time = 1
ignorehitpause =  1

[State 3416, SprPriority]
type = SprPriority
trigger1 = !Time
value = 1

[State 829, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = Anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (Anim % 10))
value = 5160

[State 3416, PosAdd]
type = PosAdd
trigger1 = !Time
x = 18

[State 3416, VelSet]
type = VelSet
trigger1 = !Time
x = -5
y = -5

[State 3416, VelMul]
type = VelMul
trigger1 = 1
x = 0.97

[State 3416, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 3416, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3416, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3416, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -3

[State 3416, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<SHIKI 100: ONI HOMURA>=
[StateDef 3500]
type = S
physics = S
moveType = A
anim = 3500
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
trigger1 = !Time
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = !Time && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

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
trigger1 = Anim = 3500 && Time < 51
time = 1
value = SCA

[State 3500, SuperPause FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -6,-56
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3500,0
channel = 0

[State 3500, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,11
channel = 0

[State 3500, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 14
value = 195,10
channel = 0

[State 3500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 14
value = 1,2
channel = 1

[State 3500, Fire Sound]
type = PlaySnd
trigger1 = AnimElemTime(15) = 0
value = 1000,2
channel = 4

[State 3500, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(15) = 2
value = 40,0
channel = 3

[State 3500, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElemTime(16) = 2
stateType = A
physics = N

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElemTime(16) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oni Homura Dust"
posType = P1
ownPal = 1

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(16) < 0
x = 8

[State 3500, VelMul]
type = VelMul
trigger1 = AnimElemTime(16) >= 0
x = 0.94

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 1
trigger2 = AnimElemTime(20) = 1
x = 0

[State 3500, VelSet]
type = velset
trigger1 = AnimElem = 16
x = 7
y = -12

[State 3500, VelMul]
type = VelMul
trigger1 = AnimElemTime(16) > 2
x = 0.92

[State 3500, Gravity]
type = VelAdd
trigger1 = AnimElemTime(16) >= 2
y = 0.61

[State 3500, Fire Helper]
type = Helper
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3500, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 7
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

[State 3500, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 6
trigger1 = !MoveContact
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
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

[State 3500, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
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
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = AnimElem = 16
trigger1 = !MoveContact
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 37
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Flame Particles]
type = Helper
trigger1 = AnimElemTime(14) > 0
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

[State 3500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 17
moveType = I

[State 3500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;====<MAX SHIKI 100: ONI HOMURA>=
[StateDef 3550]
type = S
physics = S
moveType = A
anim = 3550
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
trigger1 = !Time
fvar(5) = 0

[State 3550, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

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
trigger1 = Anim = 3550 && Time < 51
time = 1
value = SCA

[State 3550, SuperPause FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = -6,-56
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3550, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3550, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3500,0
channel = 0

[State 3550, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,11
channel = 0

[State 3550, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4,11
channel = 0

[State 3550, Voice (Orochi)]
type = PlaySnd
trigger1 = AnimElem = 24
value = 195,10
channel = 0

[State 3550, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 14 || AnimElem = 24
value = 1,2
channel = 1

[State 3550, Fire Sound]
type = PlaySnd
trigger1 = AnimElemTime(25) = 0
value = 1000,2
channel = 4

[State 3550, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(26) = 2
value = 40,0
channel = 3

[State 3550, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElemTime(26) = 2
stateType = A
physics = N

[State 3550, Dust Helper]
type = Helper
trigger1 = AnimElemTime(26) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oni Homura Dust"
posType = P1
ownPal = 1

[State 3550, Fire Helper]
type = Helper
trigger1 = AnimElem = 25
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3550, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(16) < 0
trigger3 = AnimElemTime(24) >= 0 && AnimElemTime(26) < 0
x = 8

[State 3550, VelMul]
type = VelMul
trigger1 = AnimElemTime(26) >= 0
x = 0.94

[State 3550, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 1
trigger2 = AnimElemTime(19) = 1
trigger3 = AnimElemTime(30) = 1
x = 0

[State 3550, VelAdd]
type = PosAdd
trigger1 = AnimElemTime(25) = 1
x = 20

[State 3550, VelSet]
type = velset
trigger1 = AnimElem = 26
x = 7
y = -12

[State 3550, VelMul]
type = VelMul
trigger1 = AnimElemTime(26) > 2
x = 0.92

[State 3550, Gravity]
type = VelAdd
trigger1 = AnimElemTime(26) >= 2
y = 0.61

[State 3550, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 7
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

[State 3550, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 6
trigger1 = !MoveContact
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 14
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

[State 3550, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 15
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = AnimElem = 16
trigger1 = !MoveContact
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 24
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

[State 3550, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 3,4
guard.pauseTime = 3,4
animType = Back
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
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, HitDef 9]
type = HitDef
trigger1 = !var(16) && var(15) < 9
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
animType = Back
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
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3550, Flame Particles]
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

[State 3550, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 27
moveType = I

[State 3550, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;====<SHIKI 1201: YA OTOME (OROCHI)>=
[StateDef 3600]
type = S
physics = S
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3600, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
trigger1 = !Time
fvar(5) = 0

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
trigger1 = 1
time = 1
value = SCA

[State 3600, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = Ifelse(Var(40),-12,0),Ifelse(Var(40),-63,-114)
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3600, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3600, VelAdd]
type = VelSet
trigger1 = animelemtime(10) >= 0 && animelemtime(12) < 0
x = 8.5

[State 3600, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,10
channel = 0

[State 3600, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 3600
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0  * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) :=55), var(36) :=-65
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P2Facing = 1
kill = 0

[State 3600, TargetState]
type = TargetState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3230
ID = 3600
ignoreHitPause = 1
persistent = 0

[State 3600, ChangeState]
type = ChangeState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3610

[State 3600, End]
type = ChangeState
trigger1 = Time = 70
trigger2 = MoveGuarded
value = 3601
ctrl = 0


;Stopping
[StateDef 3601]
type = S
physics = S
moveType = A
anim = 3601
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 0

[State 3601, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 1
movetype = I

[State 3601, Accel]
type = VelSet
trigger1 = animelemtime(1)=0
x = 16.46875

[State 3601, Vel]
type = VelSet
trigger1 = animelemtime(1) > 0
x = (7.470703125*exp((-0.0645)*(animelemtime(1)-1)))

[State 3601, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3610]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
anim = 3610

[State 3610, Width]
type = Width
trigger1 = 1
edge = 63,0

;[State 3610, Blood]
;type = Helper
;trigger1 = AnimElem = 15
;trigger2 = AnimElem = 25
;trigger3 = AnimElem = 33
;trigger4 = AnimElem = 37
;trigger5 = AnimElem = 46
;helperType = Normal
;stateNo = 8050
;ID = 8050
;name = "Blood"
;posType = P2
;pos = 0,-52
;facing = -1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1

[State 3610, Hit Sound]
type = Null
trigger1 =  AnimElem = 4 || AnimElem = 8 || AnimElem = 37
trigger1 = var(31) := 2
trigger2 = AnimElem = 25 || AnimElem = 33
trigger2 = var(31) := 10
trigger3 = AnimElem = 15 || AnimElem = 46
trigger3 = var(31) := 11

[State 3610, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 || AnimElem = 37
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
p2Facing = 1
kill = 0

[State 3610, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3610, HitDef: Slash High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3610, HitDef: Slash Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 46
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3610, Lost Target]
type = ChangeState
trigger1 = AnimElem = 50 && !NumTarget
value = 0
ctrl = 1

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(50) < 0
pos = 55,0
time = 1

[State 3610, TargetState]
type = TargetState
trigger1 = AnimElem = 50 && NumTarget
value = 3236

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(50) >= 0 && AnimElemTime(53) < 0
pos = 45,0
time = 1

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(53)>=0 &&animelemtime(54)<0
pos = 75,-97
time = 1

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(54)>=0 &&animelemtime(56)<0
pos = 77,-55
time = 1

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(56)>=0 &&animelemtime(63)<0
pos = 70,-6
time = 1

[State 3610, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 56
trigger2 = animelem = 58
trigger3 = animelem = 60
value = floor(ifElse(10 * fvar(11) < 7, -7, -10 * fvar(11)))
kill = 0

[State 3610, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 63
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 1

[State 3610, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && animelemtime(50) < 0
pos = 55,0
time = 1

[State 3610, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,10
channel = 0

[State 3610, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4,11
channel = 0

[State 3610, Voice]
type = PlaySnd
trigger1 = AnimElem = 33
value = 4,10
channel = 0

[State 3610, Woosh]
type = PlaySnd
trigger1 = animelem = 50
value = 1,5
channel = 1

[State 3610, Grab]
type = PlaySnd
trigger1 = animelem = 53
value = 2,800
channel = 1

[State 3610, Voice]
type = PlaySnd
trigger1 = animelem = 56
trigger2 = animelem = 58
trigger3 = animelem = 60
value = 4,11
channel = 0

[State 3610, Voice]
type = PlaySnd
trigger1 = animelem = 63
value = 195,10
channel = 0

[State 3610, Explosion Sound]
type = PlaySnd
trigger1 = animelem = 63
value = 1300,3
channel = 2

[State 3610, Width]
type = Width
trigger1 = AnimElem = 50 && FrontEdgeDist < 80 || AnimElem = 51 && FrontEdgeDist < 80 || AnimElem = 52 && FrontEdgeDist < 80
edge = 80,0

[State 3610, PosAdd]
type = PosAdd
trigger1 = animelem = 51 || animelem = 52
x = 15

[State 3610, Flame Particles]
type = Helper
triggerall = Var(40)
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 63
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3610, EnvShake]
type = EnvShake
trigger1 = AnimElem = 56
trigger2 = AnimElem = 58
trigger3 = AnimElem = 60
time = 12
freq = 60
ampl = -3

[State 3610, Helper]
type = Helper
trigger1 = AnimElem = 56
trigger2 = AnimElem = 58
trigger3 = AnimElem = 60
trigger4 = AnimElem = 63
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 60,5
ownpal = 1

[State 3610, Explod]
type = Explod
trigger1 = AnimElemTime(63)=0
anim = 1335
ID = 1335
pos = 71,-46
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7

[State 3610, Explod]
type = Explod
trigger1 = AnimElemTime(63)=2
anim = 1335
ID = 1336
pos = 99,-88
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7

[State 3610, Explod]
type = Explod
trigger1 = AnimElemTime(63)=4
anim = 1335
ID = 1337
pos = 97,-61
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7

[State 3610, TargetState]
type = TargetState
trigger1 = AnimElem = 63
value = 3237

[State 3610, EnvShake]
type = EnvShake
trigger1 = animelem = 63
time = 15
freq = 75
ampl = -8

[State 3610, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SHIKI 1201: YA OTOME (OROCHI)>=
[StateDef 3650]
type = S
physics = N
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3650, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3650, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3650, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3650, Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3650, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

[State 3650, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3650, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3650, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3650, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = -12, -63
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3650, Super Pause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3650, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3650, VelAdd]
type = VelSet
trigger1 = animelemtime(10)>=0 && animelemtime(12)<0
x = 8.5

[State 3650, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,10
channel = 0

[State 3650, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = !Time
ID = 3650
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit   
damage = 0, 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 1, 14
guard.pauseTime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 17
ground.slideTime = 17
guard.hitTime = 17
air.hitTime = 13
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0  * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) :=55), var(36) :=-65
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 0
envShake.ampl = 0
envShake.freq = 0
P2Facing = 1
kill = 0

[State 3650, TargetState]
type = TargetState
trigger1 = NumTarget(3650)
trigger1 = MoveHit && Target, Alive
value = 3230
ID = 3650
ignoreHitPause = 1
persistent = 0

[State 3650, ChangeState]
type = ChangeState
trigger1 = NumTarget(3650)
trigger1 = MoveHit && Target, Alive
value = 3651

[State 3650, End]
type = ChangeState
trigger1 = Time = 70
trigger2 = MoveGuarded
value = 3601
ctrl = 0


;Success
[StateDef 3651]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3650

[State 3651, Width]
type = Width
trigger1 = 1
edge = 63,0

;[State 3651, Blood]
;type = Helper
;trigger1 = AnimElem = 15
;trigger2 = AnimElem = 25
;trigger3 = AnimElem = 33
;trigger4 = AnimElem = 37
;trigger5 = AnimElem = 46
;helperType = Normal
;stateNo = 8050
;ID = 8050
;name = "Blood"
;posType = P2
;pos = 0,-52
;facing = -1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1

[State 3651, Explod]
type = Explod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 25
trigger3 = AnimElem = 33
trigger4 = AnimElem = 37
trigger5 = AnimElem = 46
anim = 8150
ID = 8150
pos = 1+random%10,-50-random%50
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .3,.3
sprpriority = 7

[State 3651, Explod]
type = Explod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 25
trigger3 = AnimElem = 33
trigger4 = AnimElem = 37
trigger5 = AnimElem = 46
anim = 1335
ID = 1335
pos = 1+random%10,-50-random%50
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .3,.3
sprpriority = 7

[State 3651, Hit Sound]
type = Null
trigger1 =  AnimElem = 4 || AnimElem = 8 || AnimElem = 37
trigger1 = var(31) := 2
trigger2 = AnimElem = 25 || AnimElem = 33
trigger2 = var(31) := 10
trigger3 = AnimElem = 15 || AnimElem = 46
trigger3 = var(31) := 11

[State 3651, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 || AnimElem = 37
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3651, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3651, HitDef: Slash High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
kill = 0

[State 3651, HitDef: Slash Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 25 || AnimElem = 33 || AnimElem = 46
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 19 < 7, 7, fvar(11) * 19)), 7
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
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -65
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
kill = 0

[State 3651, Lost Target]
type = ChangeState
trigger1 = AnimElem = 50 && !NumTarget
value = 0
ctrl = 1

[State 3651, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(50) < 0
pos = 55,0
time = 1

[State 3651, TargetState]
type = TargetState
trigger1 = AnimElem = 50 && NumTarget
value = 3238

[State 3651, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(52) < 0
pos = 45,0

[State 3651, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(52) >= 0 && AnimElemTime(54) < 0
pos = 30,0

[State 3651, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(54) >= 0 && AnimElemTime(56) < 0
pos = 25,0

[State 3651, Width]
type = Width
trigger1 = AnimElem = 55 || AnimElem = 56 || AnimElem = 57
trigger1 = BackEdgeDist < 40
edge = 0,40

[State 3651, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(56) >= 0 && AnimElemTime(79) < 0
pos = -30,-10

[State 3651, TargetBind]
type = PosAdd
trigger1 = AnimElem = 55
trigger2 = AnimElem = 56
x = -14

[State 3651, TargetBind]
type = PosAdd
trigger1 = AnimElem = 57
x = -10

[State 3651, 3]
type = SprPriority
trigger1 = AnimElem = 62
value = 3

[State 3651, 3]
type = SprPriority
trigger1 = AnimElem = 84
value = 2

[State 3651, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,10
channel = 1

[State 3651, Voice]
type = PlaySnd
trigger1 = AnimElem = 15
value = 4,11
channel = 1

[State 3651, Voice]
type = PlaySnd
trigger1 = AnimElem = 32
value = 4,10
channel = 1

[State 3651, Voice]
type = PlaySnd
trigger1 = AnimElem = 50
value = 1200,1
channel = 1

[State 3651, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 52
value = 2,800
channel = 2

[State 3651, Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 57
value = 1,5
channel = 2

[State 3651, Voice]
type = PlaySnd
trigger1 = AnimElem = 75
value = 195,10
channel = 1

[State 3651, HitAdd]
type = HitAdd
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
trigger5 = AnimElem = 79
value = 1

[State 3651, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
value = 1300,3

[State 3651, Explosion Sound]
type = PlaySnd
trigger1 = AnimElem = 79
value = 1300,3

[State 3651, Explod]
type = Explod
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
anim = 8150
ID = 8150
pos = -5,-15
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .6,.6
sprpriority = 1

[State 3651, Explod]
type = Explod
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
anim = 1335
ID = 1335
pos = -5,-15
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .4,.4
sprpriority = 1

[State 3651, Helper]
type = Helper
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
trigger5 = AnimElem = 79
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
pos = -10,5
ownPal = 1

[State 3651, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 79
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3651, Explod]
type = Explod
trigger1 = AnimElemTime(79)=0
trigger2 = AnimElemTime(79)=2
anim =1335
ID = 1335
pos = -20+random%20,-10-random%10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 1

[State 3651, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
value = floor(ifElse(30 * fvar(11) < 7, -7, -30 * fvar(11)))
kill = 0

[State 3651, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 79
value = floor(ifElse(79 * fvar(11) < 7, -7, -79 * fvar(11)))
kill = 1

[State 3651, EnvShake]
type = EnvShake
trigger1 = AnimElem = 63
trigger2 = AnimElem = 66
trigger3 = AnimElem = 69
trigger4 = AnimElem = 72
time = 8
freq = 65
ampl = -6

[State 3651, EnvShake]
type = EnvShake
trigger1 = AnimElem = 79
time = 15
freq = 75
ampl = -8

[State 3651, TargetState]
type = TargetState
trigger1 = AnimElem = 79
value = 3239

[State 3651, 3]
type = Turn
trigger1 = AnimElem = 82

[State 3651, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SAN SHINGI NO NI>=
[Statedef 3700]
type = S
movetype = A
physics = N
anim = 3700
poweradd = -3000
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 3700, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3700, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3700, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3700, Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3700, Unguardable]
type = VarSet
trigger1 = !time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

[State 3700, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3700, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3700, SuperPause FX]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = P1
pos = -9,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3700, SuperPause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 3700, Hit]
type = HitDef
trigger1 = !((EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl))
trigger1 = !Time
attr = S,HT
hitFlag = M-
guardFlag =
priority = 3, Miss
damage = 0,0
getPower= 0,0
pauseTime = 1,1
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
ground.hitTime = 1
air.hittime = 13
fall = 0
air.fall = 1
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1
p1StateNo = 3710
kill = 0

[State 3700, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,1
channel = 1

[State 3700, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3700,0
channel = 2

[State 3700, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) = 0
moveType = I

[State 3700, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[Statedef 3710]
type = S
movetype = A
physics = S
anim = 3710
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 3710, Width]
type = Width
trigger1 = 1
edge = 63,0

[State 3710, More Safety]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3710, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3710, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3715

[State 3710, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist > 50 || AnimElem = 2 && FrontEdgeDist > 50 || AnimElem = 3 && FrontEdgeDist > 50
edge = 75,0

;[State 3404,BlackBG]
;type=helper
;trigger1 =AnimElem=6
;helpertype=normal
;stateno=3452
;ID=3452
;name="BlackBG"
;postype=Back
;supermovetime=99999
;pausemovetime=99999
;ownpal=1
;ignorehitpause=1

[State 3710, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(8)>=0 && AnimElemTime(44)<0
value = floor(ifElse(4 * fvar(11) < 4, -4, -4 * fvar(11)))
kill = 0

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1)>=0 &&AnimElemTime(2)<0
pos = 75,-57
time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2)>=0 &&AnimElemTime(3)<0
pos = 66,-8
time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(3)>=0 &&AnimElemTime(5)<0
pos = 71,-2
time = 1

;[State 3710, TargetBind]
;type = TargetBind
;trigger1 = AnimElemTime(4)>=0 &&AnimElemTime(5)<0
;pos = 64,-6
;time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(5)>=0 &&AnimElemTime(6)<0
pos = 42,-33
time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(6)>=0 &&AnimElemTime(7)<0
pos = 65,-67
time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(7)>=0 &&AnimElemTime(8)<0
pos = 61,-104
time = 1

[State 3710, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(8)>=0 &&AnimElemTime(44)<0
pos = 76,-127
time = 1

[State 3710, Explod]
type = Explod
trigger1 = AnimElemTime(44)=0
trigger2 = AnimElemTime(44)=4
trigger3 = AnimElemTime(44)=8
trigger4 = AnimElemTime(44)=12
anim = 1335
ID = 1335
pos = 76+random%50,-100-random%50
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 7
ontop = 1

[State 3710, HitSpark]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 3020
ID = 3020
name = "Ya Sakazuki Ground FX"
pos = 0, 0
facing = -1
ownPal = 1
size.xScale = 0.7
size.yScale = 0.6
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 3710, Impact Dust]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(65 * const(size.xScale)),0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3710, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 10
freq = 60
ampl = -6

[State 3710, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3700,1
channel = 0

[State 3710, Voice]
type = PlaySnd
trigger1 = AnimElem = 44
value = 3700,2
channel = 0

[State 3710, Ground Hit Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,7
channel = 1

[State 3710, Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3700,3
channel = 2

[State 3710, Explosion]
type = PlaySnd
trigger1 = AnimElem = 44
value = 1300,3
channel = 3

[State 3710, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(44) < 0
trigger1 = Time % 4 = 0
time = 4
freq = 240
ampl = -5

[State 3710, Helper]
type = Helper
trigger1 = AnimElem = 8
helpertype = Normal
name = "FlamePillar"
ID = 3730
stateno = 3730
pos = 55,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = .55 * const(size.xscale)
size.yscale = .55 * const(size.yscale)

[State 3710, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 44
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3710, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 44
value = floor(ifElse(10 * fvar(11) < 7, -7, -10 * fvar(11)))
kill = 1

[State 3710, TargetState]
type = TargetState
trigger1 = AnimElem = 44
value = 3716

[State 3710, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;San Shingi no Ni-P2
[Statedef 3715]
type = A
movetype = H
physics = N

[State 3715, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3715, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
value = 3715

[State 3715, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


;San Shingi no Ni-P2
[Statedef 3716]
type = A
movetype = H
physics = N

[State 3716, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State 3716, 1]
type = ChangeAnim
Trigger1 = !time
value = 5030

[State 3716, 1]
type = ChangeAnim
Trigger1 = anim = 5030 && !animtime
value = 5050

[State 3716, PosAdd]
type = PosAdd
trigger1 = !Time
y = 50

[State 3716, VelSet]
type = VelSet
trigger1 = !Time
x = -3.6
y = -7.6

[State 3716, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 3716, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3716, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3716, EnvShake]
type = EnvShake
trigger1= vel y > 0
trigger1= pos y > -vel y
time = 14
freq = 120
ampl = -4

[State 3716, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100



;====<CHI NO BOUSOU>=
[StateDef 3800]
type = S
physics = S
moveType = I
anim = 3800
velSet = 0,0
ctrl = 0
sprPriority = 1
powerAdd = -3000
facep2=1

[State 3800, nhb]
type=nothitby
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3800, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3800, Voice]
type = PlaySnd
trigger1 = !Time
value = 3800,0 + 10 * (var(40) = 1)
channel = 0

[State 3800, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) >= 0
value = SCA,AP
time = 1
ignorehitpause = 1

[State 3800, HitBy]
type = HitBy
trigger1 = AnimElemTime(3) >= 0
value = SCA,AA,AT
time = 1
ignorehitpause = 1

[State 3800, Reversal]
type = ReversalDef
trigger1 = !movehit && AnimElemTime(3) >= 0 && AnimElemTime(32) < 0
attr = S, HT
reversal.attr = SCA, AA
getpower = 0,0
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s130, 0
p1stateno = 3805
p2stateno = 3815
fall = 1
fall.recover = 0
numhits = 0

[State 3800, StopSnd]
type = StopSnd
trigger1 = !AnimTime
channel = 0

[State 3800, StopSnd]
type = StopSnd
trigger1 = !AnimTime
channel = 1

[State 3800, SelfState]
type = ChangeState
trigger1= !AnimTime
value = 0
ctrl = 1


;Attacked
[StateDef 3805]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3805
velset = 0,0
sprpriority = 1

[State 3805, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3805, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3805, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3805, Corner Push]
type = VarSet
trigger1 = !Time
fvar(5) = 0

[State 3805, Unguardable]
type = VarSet
trigger1 = !time && NumEnemy
trigger1 = (EnemyNear, StateNo !=[120,155])
var(17) = 50

[State 3805, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3805, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3805, By Splode]
type = VarSet
trigger1=!time
fvar(1)= Ifelse(Facing = 1, Pi/4, (5*Pi)/3) 

[State 3805, By Splode]
type = VarSet
trigger1=!time
fvar(2)= Ifelse(Facing = 1, (7*Pi)/6, ((7*Pi)/6) - (Pi/2))

[State 3805, By Splode]
type = VarSet
trigger1=!time
fvar(3)= Ifelse(Facing = 1, Pi/4, (5*Pi)/3) 

[State 3805, By Splode]
type = VarSet
trigger1=!time
fvar(4)= Ifelse(Facing = 1, (7*Pi)/6, ((7*Pi)/6) - (Pi/2))

[State 3805, SuperPause FX]
type = Helper
trigger1 = !time
helperType = Normal
stateNo = 8530
ID = 8530
name = "Superpause FX"
posType = P1
pos = 4,-62
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3805, SuperPause]
type = SuperPause
trigger1 = !time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 3805, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 3805, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = !Time
value = 195,10
channel = 0

[State 3805, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = !Time
value = 193,0
channel = 0

[State 3805, Hit]
type = HitDef
trigger1 = AnimElem = 1
attr = S,HT
damage = 0,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag =
hitflag = MAF
priority= 4, Hit
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
guard.sparkxy = -1
sparkxy = -1
persistent = 0
p2stateno = 3815
p1stateno = 3810
numhits = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(32) >= 0
movetype = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3810
ctrl = 0


;Chi No Bosou
[Statedef 3810]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3810
facep2 = 1

[State 3810, AssertSpecial]
type = AssertSpecial
trigger1 = AnimElemTime(1)>=0 &&animelemtime(23)<0
flag = timerfreeze

[State 3810, TargetState]
type = TargetState
trigger1 = !Time
value = 3815

[State 3810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
value = -136
kill = 0

[State 3810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 16
value = -136
kill = 0

[State 3810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 23
value = -1
kill = 1

[State 3810, Voice]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 3
trigger2 = AnimElem = 8
trigger3 = AnimElem = 15
value = 4,11
channel = 0

[State 3810, Voice (Orochi)]
type = PlaySnd
triggerAll = var(40) = 1
trigger1 = AnimElem = 3
value = 4,13
channel = 0

[State 3810, Voice (Orochi)]
type = PlaySnd
triggerAll = var(40) = 1
trigger1 = AnimElem = 8
value = 1000,10
channel = 0

[State 3810, Voice (Orochi)]
type = PlaySnd
triggerAll = var(40) = 1
trigger1 = AnimElem = 15
value = 1200,1
channel = 0

[State 3810, Slash Sounds]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
trigger3 = AnimElem = 16
value = 2,11

[State 3810, Helper]
type = Helper
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
trigger3 = AnimElem = 16
helperType = Normal
name = "Slash Spark"
ID = 8017
stateNo = 8017
pos = 1,-65
posType = p2
facing = 1
keyCtrl = 0
ownPal = 1
size.xScale = 1
size.yScale = 1

[State 3810, HitAdd]
type = HitAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
trigger3 = AnimElem = 16
value = 1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = !Time
time = 10
mul = 0,0,0
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalfx
trigger1 = animelemtime(2)<0
trigger2 = animelemtime(7)>=5 && animelemtime(8)<0
trigger3 = animelemtime(12)>=5 && animelemtime(13)<0
trigger4 = animelemtime(22)>=3 && animelemtime(23)<0
time = 1
mul = 0,0,0
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(2)>=0&&animelemtime(5)<0
time = 1
mul = (time-24)*42,0,0;(time-24)*42,(time-24)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(6)>=0&&animelemtime(7)<5
time = 1
mul = 256-(time-33)*42,0,0;256-(time-33)*42,256-(time-33)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(8)>=0&&animelemtime(10)<0
time = 1
mul = (time-60)*42,0,0;(time-60)*42,(time-60)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(11)>=0&&animelemtime(12)<5
time = 1
mul = 256-(time-70)*42,0,0;,256-(time-70)*42,256-(time-70)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(13)>=0&&animelemtime(16)<0
time = 1
mul = (time-93)*42,0,0;(time-95)*42,(time-95)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(20)>=0&&animelemtime(22)<3
time = 1
mul = 256-(time-107)*42,0,0;256-(time-109)*42,256-(time-109)*42
ignorehitpause=1

[State 3810, AllPalFX]
type = AllPalFX
trigger1 = animelemtime(5)>=0&&animelemtime(6)<0
trigger2 = animelemtime(10)>=0&&animelemtime(11)<0
trigger3 = animelemtime(16)>=0&&animelemtime(20)<0
time = 1
mul = 256,0,0

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(2)>=0&&animelemtime(5)<0
time = 1
mul = (time-24)*42,0,0;(time-24)*42,(time-24)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(6)>=0&&animelemtime(7)<5
time = 1
mul = 256-(time-33)*42,0,0;256-(time-33)*42,256-(time-33)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(8)>=0&&animelemtime(10)<0
time = 1
mul = (time-60)*42,0,0;(time-60)*42,(time-60)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(11)>=0&&animelemtime(12)<5
time = 1
mul = 256-(time-70)*42,0,0;,256-(time-70)*42,256-(time-70)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(13)>=0&&animelemtime(16)<0
time = 1
mul = (time-93)*42,0,0;(time-95)*42,(time-95)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(20)>=0&&animelemtime(22)<3
time = 1
mul = 256-(time-107)*42,0,0;256-(time-109)*42,256-(time-109)*42
ignorehitpause=1
invertall = 1

[State 3810, AllPalFX]
type = BGPalFX
trigger1 = animelemtime(5)>=0&&animelemtime(6)<0
trigger2 = animelemtime(10)>=0&&animelemtime(11)<0
trigger3 = animelemtime(16)>=0&&animelemtime(20)<0
time = 1
mul = 256,0,0
invertall = 1

[State 3810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1)>=0 &&animelemtime(23)<0
pos = 75,0
time = 1
ignorehitpause=1

[State 3810, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 23
value = 195,10
channel = 0

[State 3810, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 23
value = 193,0
channel = 0

[State 3810, TargetState]
type = TargetState
trigger1 = AnimElem = 23
value = 3816

[State 3810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 23
value = -1
kill = 1

[State 3810, ChangeState]
type = ChangeState
trigger1= !AnimTime
value = 0
ctrl = 1



;====<CHI NO BOUSOU (TARGET)>=
[Statedef 3815]
type = S
movetype = H
physics = S

[State 3815, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3815, AfterImageTime]
type = AfterImageTime
trigger1 = !Time
time = 0
ignorehitpause =1

[State 3815, ChangeAnim]
type= ChangeAnim2
trigger1 = Time =1
value = 3815

[State 3815, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0


[Statedef 3816]
type = S
movetype = H
physics = S

[State 3816, SprPriority]
type = SprPriority
trigger1 = !Time
value = -1

[State 3816, ChangeAnim]
type= ChangeAnim2
trigger1 = !Time
value = 3816

[State 3816, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3816, SelfState]
type = SelfState
trigger1 = !Alive
value = 5150

[State 3816, SelfState]
type = SelfState
trigger1 = !AnimTime
value = 5120
