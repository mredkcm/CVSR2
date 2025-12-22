; _________________________________________
;| Rose by varo_hades                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<Aura Soul Throw>=
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
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-60 * const(size.yScale))
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

[State 3000, Voice 1]
type = PlaySnd
trigger1 = Animelem = 1
value = 4,3
channel = 0

[State 3000, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 3000, statetype]
type = StateTypeSet
trigger1 = time >= 36
statetype = A
movetype = A
physics = N

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 36
x = 6
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 44
x = 2

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 37
y = -10
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 39
y = -7
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 42
y = -5
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 45
y = -4
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 48
y = -2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 51
y = -1

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 49
x = 0
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 53
y = 0
x = 0

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 55
y = 2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 58
y = 3
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 61
y = 5
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 64
y = 7
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 67
y = 9

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 36
x = 10
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 44
x = 6

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 37
y = -10
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 39
y = -7
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 42
y = -5
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 45
y = -4
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 48
y = -2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 51
y = -1

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 49
x = 2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 53
y = 0
x = 0

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 55
y = 2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 58
y = 3
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 61
y = 5
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 64
y = 7
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 67
y = 9

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 36
x = 12
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 44
x = 6

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 37
y = -12
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 39
y = -8
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 42
y = -6
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 45
y = -4
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 48
y = -2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 51
y = -1

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 49
x = 4
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 53
y = 0
x = 0

[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 55
y = 2
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 58
y = 3
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 61
y = 5
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 64
y = 7
[State 3000, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 67
y = 9

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 36
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 3000 , HitDef 1]
type = HitDef
trigger1 = Time = 30 && p2statetype = A && p2stateno != [150,152]
attr = A, ST
hitflag = AF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 1
p2facing = 1
p1stateno = 3001
p2stateno = 3002
fall = 1
fall.recover = 0

[State 3000,ChangeState]
type = ChangeState
trigger1 = time > 42
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

[State 3000, Explod]
type = Explod
trigger1 = time = 37
anim = 1105
ID = 1100
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3000, Explod]
type = Explod
trigger1 = time = 42
anim = 1105
ID = 1100
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3000, Explod]
type = Explod
trigger1 = time = 46
anim = 1105
ID = 1100
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3000, Dust Helper]
type = Helper
trigger1 = Time = 30
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Dust Helper]
type = Helper
trigger1 = Time = 34
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, Dust Helper]
type = Helper
trigger1 = Time = 38
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 =time = 30
value = SCA,NA,SA,HA
time = 6

;
[Statedef 3001]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim =  1101
juggle = 0

[State 3001, TargetBind]
type = TargetBind
trigger1 = animelem = 1
time = 18
pos = 0,0

[State 3001, SprPriority]
type = SprPriority
trigger1 =  1
value = 1

[State 3001, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 810,0

[State 3001, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 3001, PosAdd]
type = PosAdd
trigger1 = time = 0
y = -20
persistent = 0

[State 3001, VelSet]
type = VelSet
trigger1 = time >= 8
x = 3
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 8
y = -4
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2

[State 3001, VelSet]
type = VelSet
trigger1 = time >= 15
x = 0.5
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 15
y = -1.5

[State 3001, VelSet]
type = VelSet
trigger1 = time >= 22
x = 3
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 22
y = -6
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 26
y = -4
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 34
y = 0
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 36
y = 1
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 40
y = 2
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 44
y = 4
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 48
y = 6
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 52
y = 8
[State 3001, VelSet]
type = VelSet
trigger1 = time >= 56
y = 10

[State 3001, PlaySnd]
type = null;PlaySnd
trigger1 = time = 38
value = 810,0

[State 3001, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 3001,changeState]
type = changeState
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

;
[Statedef 3002]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 3002, SprPriority]
type = SprPriority
trigger1 =  1
value = 2

[State 3002, PalFX]
type = PalFX
trigger1 =  time = 0
time = 30
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 3002, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 3002, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 3002, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 8
y = -4
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2

[State 3002, VelSet]
type = VelSet
trigger1 = time >= 13
x = -1
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 13
y = -2

[State 3002, VelSet]
type = VelSet
trigger1 = time >= 16
x = -0.5
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1.5

[State 3002, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
x = 4
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 22
y = 6
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8
[State 3002, VelSet]
type = VelSet
trigger1 = time >= 27
y = 10

[State 3002, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = var(54)>0
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 54
value = -300
persistent = 0

[State 3002, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 44
value = -300
persistent = 0

[State 3002, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -200
kill=1

[State 3002, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 3002, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 20

[State 3002, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 3002,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;====<Max Aura Soul Throw>=
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

[State 3050, VarSet]
type = VarSet
trigger1 = time = 5
v = 20
value = 0

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3000,0

[State 3050,1]
type = ChangeState
trigger1 = time = 38
value = 3051
ctrl = 0

;
[StateDef 3051]
type = S
anim = 3051
physics = N
moveType = A
velSet = 0,0
juggle = 5

[State 3051, Explod]
type = Explod
trigger1=time=0
ID = 3051
anim = 3052
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3051, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3051, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,0

[State 3051, VelSet]
type = VelSet
trigger1 = time >= 0
trigger1 = movecontact = 0
x = 4
[State 3051, VelSet]
type = VelSet
trigger1 = time >= 2
trigger1 = movecontact = 0
x = 8
[State 3051, VelSet]
type = VelSet
trigger1 = time >= 4
trigger1 = movecontact = 0
x = 10

[State 3051, VelSet]
type = VelSet
trigger1 = time >= 0
trigger1 = movecontact = 1
x = 2
[State 3051, VelSet]
type = VelSet
trigger1 = time >= 2
trigger1 = movecontact = 1
x = 4
[State 3051, VelSet]
type = VelSet
trigger1 = time >= 4
trigger1 = movecontact = 1
x = 6

[State 3051,Hitdef]
type = HitDef
trigger1 = animelem = 2
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 7
getpower = 0
GivePower = 36, 36
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 17
ground.hittime = 17
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -2,-4
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff=  ifelse ( p2statetype=A ,-10, -10)
guard.cornerpush.veloff =  ifelse ( p2statetype=A ,-10, -10)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10
palfx.time = 30
palfx.add = 222,0,222
palfx.mul = 255,255,255
palfx.sinadd = 111,111,111,10

[State 3051, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3052
ctrl = 0

;
[StateDef 3052]
type = S
anim = 3053
physics = N
moveType = A
velSet = 0,0

[State 5052, Explod]
type = Explod
trigger1=time=1
ID = 3053
anim = 3054
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3052, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,2

[State 3052, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0

[State 3052, Hitdef 1]
type = HitDef
trigger1 = animelem = 3
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 8,8
guard.pausetime = 8,8
ground.slidetime = 17
ground.hittime = 17
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -2,-8
air.velocity = -2,-8
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff=  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10
palfx.time = 30
palfx.add = 222,0,222
palfx.mul = 255,255,255
palfx.sinadd = 111,111,111,10

[State 3052,Hitdef 2]
type = HitDef
trigger1 = animelem = 4
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,8
guard.pausetime = 12,8
ground.slidetime = 17
ground.hittime = 17
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -2,-10
air.velocity = -2,-10
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff=  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10
palfx.time = 60
palfx.add = 222,0,222
palfx.mul = 255,255,255
palfx.sinadd = 111,111,111,10

[State 3052, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3053
ctrl = 0

;
[Statedef 3053]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3055
juggle = 0

[State 3053, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 860,0

[State 3053, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,1

[State 3053, VelSet]
type = VelSet
trigger1 = time >= 1
x = 12
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 8
x = 8
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 14
x = 6

[State 3053, VelSet]
type = VelSet
trigger1 = time >= 1
y = -10
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 4
y = -8
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 7
y = -7
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 10
y = -5
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 13
y = -3
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2

[State 3053, VelSet]
type = VelSet
trigger1 = time >= 19
y = 0

[State 3053, VelSet]
type = VelSet
trigger1 = time >= 21
y = 1
x = 0
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 24
y = 3
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 27
y = 6
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 30
y = 8
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 33
y = 9
[State 3053, VelSet]
type = VelSet
trigger1 = time >= 36
y = 11

[State 3053, Hitdef]
type = HitDef
trigger1 = Time = 0 && p2statetype = A
trigger1 = p2stateno != [150,152]
attr = A, HT
hitflag = AF
guardflag = -1
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 1
p2facing = 1
p1stateno = 3054
p2stateno = 3055
fall = 1
fall.recover = 0

[State 3053, Explod]
type = Explod
trigger1 = time = 1
anim = 1105
ID = 3050
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3053, Explod]
type = Explod
trigger1 = time = 6
anim = 1105
ID = 3050
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3053, Explod]
type = Explod
trigger1 = time = 11
anim = 1105
ID = 3050
pos = 0,-30
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 0.6,0.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
persistent = 0

[State 3053, ChangeState]
type = ChangeState
trigger1 = time > 12
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

;
[Statedef 3054]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim =  1101
juggle = 0

[State 3054, TargetBind]
type = TargetBind
trigger1 = animelem = 1
time = 1
pos = 0,0

[State 3054, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 3054, VelSet]
type = VelSet
trigger1 = time >= 8
x = 4
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4

[State 3054, VelSet]
type = VelSet
trigger1 = time >= 15
x = 1
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 15
y = -1
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 15
x = 0
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 15
y = 0

[State 3054, VelSet]
type = VelSet
trigger1 = time >= 22
x = 4
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 22
y = -4
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 26
y = -3
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 30
y = -1
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 34
y = 0
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 36
y = 1
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 40
y = 2
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 44
y = 4
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 48
y = 6
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 52
y = 8
[State 3054, VelSet]
type = VelSet
trigger1 = time >= 56
y = 10

[State 3054, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 3054,changeState]
type = changeState
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

;
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim =  1101
juggle = 0

[State 3055, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 3055, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 3055, PalFX]
type = PalFX
trigger1 = time = 18
time = 40
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 3055, VelSet]
type = VelSet
trigger1 = time >= 8
x = -4
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4

[State 3055, VelSet]
type = VelSet
trigger1 = time >= 13
x = 1
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 13
y = -1

[State 3055, VelSet]
type = VelSet
trigger1 = time >= 16
x = 1
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 16
x = 0
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0

[State 3055, VelSet]
type = VelSet
trigger1 = time >= 22
y = 4
x = 6
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 24
y = 6
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 28
y = 8
[State 3055, VelSet]
type = VelSet
trigger1 = time >= 32
y = 10

[State 3055, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -135

[State 3055, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 3055, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 10

[State 3055, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 3055,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;====<Aura Soul Spark>=
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
pos = ceil(15 * const(size.xScale)), ceil(-91 * const(size.yScale))
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

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,0
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1
channel = 1

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,1
channel = 2

[State 3100, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3105
name = "Aura Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 3100, Explod]
type = Explod
trigger1 = animelem = 1
anim = 1001
id = 1000
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3100, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Max Aura Soul Spark>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3151
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(15 * const(size.xScale)), ceil(-91 * const(size.yScale))
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

[State 3150, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3150,0
channel = 0

[State 3150, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 23 < 7, 7, fvar(11) * 23)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 69), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 3150, HitDef]
type = HitDef
trigger1 = AnimElem = 7
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forceStand = 1

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 2
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 5
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 6
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 7
x = 6

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 3151
ctrl = 1

;
[Statedef 3151]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3150
juggle = 0

[State 3151, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,0
channel = 0

[State 3151, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1300,1
channel = 1

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3100,1
channel = 2

[State 3151, Projectile]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 3105
ID = 3105
name = "Aura Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 3151, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3155
ID = 3150
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3151, Explod]
type = Explod
trigger1 = animelem = 8
anim = 1001
id = 1000
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3151, hitdef]
type = HitDef
trigger1 = animelem = 4
priority = 5, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getpower = 0
GivePower = 20
pausetime = 9,9
guard.pausetime = 9,9
ground.slidetime = 15
ground.hittime = 30
air.hittime = 20
guard.hittime = 14
guard.ctrltime =17
ground.velocity = -4
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff=  ifelse ( p2statetype=A ,-10, -20)
guard.cornerpush.veloff =  ifelse ( p2statetype=A ,-10, -20)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -40
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 6
envshake.freq = 110
envshake.ampl = 7
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 7
palfx.time = 100
palfx.add = 222,0,222
palfx.mul = 255,255,255
palfx.sinadd = 111,111,111,10

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 4
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = Animelem = 10
x = -1

[State 3151, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Illusion Spark>=
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(8 * const(size.xScale)), ceil(-64 * const(size.yScale))
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
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3200,1
channel = 1

[State 3000,HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = M
pausetime = 5,10
p1stateno = 3201
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 3200, End]
type = ChangeState
trigger1 = !AnimTime
value = 3203

[StateDef 3201]
type = S
anim = 3204
physics = N
moveType = I
velSet = 0,0

[State 3200, Sonic Hurricane Projectile]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 3205
ID = 3205
name = "Illusion Spark Helper"
posType = P1
pos = ceil(79 * const(size.xScale)), ceil(-61 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 1
value = -1

[State 3200, End]
type = ChangeState
trigger1 = NumHelper(3205)
trigger1 = Helper(3205), StateNo = 3207
value = 3202

;Finish
[StateDef 3202]
type = S
anim = 3201
physics = N
moveType = I
velSet = 0,0

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[StateDef 3203]
type = S
anim = 3202
physics = N
moveType = I
velSet = 0,0

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Soul Illusion>=
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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2200,0

[State 3300,1]
type = ChangeState
trigger1 = time = 38
value = 3301
ctrl = 0

;
[Statedef 3301]
type = S
movetype = I
physics = S
anim = 0
velset = 0
ctrl = 0

[State 3301, State]
type = ChangeState
trigger1 = time = 1
value = 0
ctrl = 1

;====<Max Soul Illusion>=
[StateDef 3350]
type = S
physics = N
moveType = A
anim = 3350
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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
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

[State 3350, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 3350, Voice 2/4]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 9
value = 4,2
channel = 0

[State 3350, Voice 3/5]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 12
value = 4,3
channel = 0

[State 3350, Voice 6]
type = PlaySnd
trigger1 = AnimElem = 17
value = 3100,0
channel = 0

[State 3350, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1100,1
channel = 1

[State 3350, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
value = 1,2

[State 3350, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 13
x = 140
ignoreHitPause = 1

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 28
ignoreHitPause = 1

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = -41
ignoreHitPause = 1

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 14
x = 6
ignoreHitPause = 1

[State 3350, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 17
stateType = A
physics = N

[State 3350, Dust Helper]
type = Helper
trigger1 = AnimElem = 17
helperType = Normal
stateNo = 8100
ID = 8100
name = "Somersault Kick Dust"
posType = P1
ownPal = 1

[State 3350, VelSet]
type = VelSet
trigger1 = AnimElem = 17
x = 1.333
y = -9.333

[State 3350, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(17) >= 0
y = 0.58

[State 3350, Somersault Kick FX (Additive) Explod]
type = Explod
trigger1 = AnimElem = 21
anim = 1105
ID = 1105
sprPriority = 3
bindTime = -1
posType = P1
scale = 0.5 * const(size.xScale),0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3350, Somersault Kick FX (Subtractive) Explod]
type = Explod
trigger1 = AnimElem = 21
anim = 1106
ID = 1106
sprPriority = 3
bindTime = -1
posType = P1
scale = 0.5 * const(size.xScale),0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3350, Width]
type = Width
trigger1 = !Time
player = 60,0
ignoreHitPause = 1

;[State 3350, Width]
;type = Width
;trigger1 = AnimElem = 11
;player = 60,0
;ignoreHitPause = 1

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 =  AnimElem = 3
trigger2 =  AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.velocity = -6.32,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
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
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, HitDef 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 =  AnimElem = 6
trigger2 =  AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
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
ground.velocity = -10.32,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
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
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Spark XY]
type = Null
trigger1 = AnimElem = 18
trigger1 = var(35) := 57 || var(36) := -39
trigger2 = AnimElem = 19
trigger2 = var(35) := 43 || var(36) := -54
trigger3 = AnimElem = 21
trigger3 = var(35) := 20 || var(36) := -107

[State 3350, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 18
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
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
ground.velocity = -2.16, -10.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -10.81
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
sparkXY = -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3002

;====<Soul Satellite>=
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
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 30
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3400,0
channel = 0

[State 3400, By Splode]
type = VarSet
trigger1=!time
fvar(1)= Ifelse(Facing = 1, Pi/4, (5*Pi)/3)

[State 3400, Soul Satellite (Projectile)]
type=Helper
trigger1=AnimElem=3
helperType=Normal
stateNo=3405
ID=3405
name="Soul Satellite 1"
persistent=0
posType=P1
pos=0,-90
superMoveTime=255
pauseMoveTime=255
size.xscale =0.35
size.yscale =0.35
ownPal=1

[State 3400, State]
type = ChangeState
trigger1 = time = 38
value = 0
ctrl = 1

;====<Max Soul Satellite>=
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

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3450, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3450, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3450, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3450, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3450, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3450, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3450, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 30
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3400,0
channel = 0

[State 3450, By Splode]
type = VarSet
trigger1=!time
fvar(1)= Ifelse(Facing = 1, Pi/4, (5*Pi)/3)

[State 3450, By Splode]
type = VarSet
trigger1=!time
fvar(2)= Ifelse(Facing = 1, Pi/4, (5*Pi)/3)

[State 3450, Soul Satellite (Projectile)]
type=Helper
trigger1=AnimElem=3
helperType=Normal
stateNo=3405
ID=3405
name="Soul Satellite 1"
persistent=0
posType=P1
pos=0,-90
superMoveTime=255
pauseMoveTime=255
size.xscale =0.35
size.yscale =0.35
ownPal=1

[State 3450, Soul Satellite (Projectile)]
type=Helper
trigger1=AnimElem=3
helperType=Normal
stateNo=3415
ID=3405
name="Soul Satellite 2"
persistent=0
posType=P1
pos=0,-90
superMoveTime=255
pauseMoveTime=255
size.xscale =0.35
size.yscale =0.35
ownPal=1

[State 3450, State]
type = ChangeState
trigger1 = time = 38
value = 0
ctrl = 1

;====<Illusion Soul>=
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(8 * const(size.xScale)), ceil(-64 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !Time
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3500,0
channel = 0

[State 3500,explod]
type = Explod
trigger1 = time = 0
anim = 3530
sprpriority = 4
postype = p1
pos = 50,-80
bindtime = -1
supermove = 60
ownpal = 1
scale = 0.7,0.7
removetime = 60

[State 3500,explod]
type = Explod
trigger1 = time = 0
anim = 3530
sprpriority = 4
postype = p1
pos = -50,-80
bindtime = -1
supermove = 60
ownpal = 1
scale = 0.7,0.7
removetime = 60

[State 3500, Helper]
type = Helper
trigger1 = time = 45
helpertype = normal
name = "Illusion Soul Helper"
ID = 3501
stateno = 3501
pos = 0,0
postype = p2
facing = 1
keyctrl = 0
ownpal = 0
supermove
pausemove

[State 3500, End]
type = ChangeState
trigger1 = time = 60
value = 3502
ctrl = 0

;Finish
[StateDef 3501]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3503
juggle = 0

[State 3501, PosSet]
type = PosSet
trigger1 =  1
y = 0
[State 3501, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
[State 3501, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
[State 3501, AssertSpecial]
type = AssertSpecial
trigger1 =  1
flag = invisible
flag2 = noshadow

[State 3501, 1]
type = Explod
trigger1 = time = 1
ID = 3502
anim = 3501
sprpriority = 0
postype = p1
pos = 0,-6
bindtime = 1
pausemovetime = 1
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
supermove = 1

[State 3501,explod]
type = Explod
trigger1 = time = 15
ID = 3502
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 1
ownpal = 1
scale = 1,1.3
removetime = -2

[State 3501,explod]
type = Explod
trigger1 = time = 1
ID = 3502
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 1
ownpal = 1
scale = 0.8,1
removetime = -2

[Statedef 3502]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3500
juggle = 0

[State 3502, ScreenBound]
type = ScreenBound
trigger1 =  1
value = 1
movecamera = 0,0

[State 3502, Explod]
type = Explod
trigger1=time=0
anim = 3507
pos = -50,-80
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0

[State 3502, Explod]
type = Explod
trigger1=time=0
anim = 3507
pos = 50,-80
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 730,0
[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 730,0
[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 730,0

[State 0, Helper]
type = Helper
trigger1 = time = 0
trigger1 = numhelper(3530) = 0
helpertype = normal
name = "Helper Illusion Soul"
ID = 3530
stateno = 3510
pos = 0,0
postype = p2
facing = 1
keyctrl = 0
ownpal = 0
supermove
pausemove

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 40
trigger1 = p2stateno != 3515
value = 52
ctrl = 1
[State 0, ChangeState]
type = ChangeState
trigger1 = time = 20
trigger1 = p2stateno = 3515
value = 3503
ctrl = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 =  p2stateno = 3515
id = 3502

[State 800, 1]
type = Explod
trigger1 = time = 0
ID = 3515
anim = 3508
sprpriority = 0
postype = p1
pos = 0,-6
bindtime = 1
pausemovetime = 1
removetime = -2
ignorehitpause = 1
scale = 1.2,1
ownpal = 1
persistent = 0
supermove = 0

[State 0,explod]
type = Explod
trigger1 = time = 0
ID = 3515
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1.2,1.3
removetime = 48

[State 0,explod]
type = Explod
trigger1 = time = 14
ID = 3515
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1.2,1.3
removetime = 48

[Statedef 3503]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3502
juggle = 0

[State 800, 1]
type = Explod
trigger1 = time = 0
ID = 3515
anim = 3506
sprpriority = 0
postype = p1
pos = 0,-6
bindtime = 1
pausemovetime = 1
removetime = -2
ignorehitpause = 1
scale = 1.2,1
ownpal = 1
persistent = 0
supermove = 0

[State 0,explod]
type = Explod
trigger1 = time = 0
ID = 3515
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1.2,1.3
removetime = 125

[State 0,explod]
type = Explod
trigger1 = time = 14
ID = 3515
anim = 3504
sprpriority = 7
postype = p1
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1.2,1.3
removetime = 125

[State 3502, ScreenBound]
type = ScreenBound
trigger1 =  1
value = 1
movecamera = 0,0

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3500,1
[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 14
value = 1300,1

[State 3502, ChangeState]
type = ChangeState
trigger1 = time = 155
value = 50
ctrl = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 3510
ID = 3570
pos = 0, -70
postype = p1
bindtime = -1
vel = 0, 0
removetime = 100
sprpriority = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
scale = 0.6,0.6

[State 0, Explod]
type = Explod
trigger1 = time = 100
anim = 3511
ID = 3571
pos = 0, -70
postype = p1
bindtime = -1
vel = 0, 0
removetime = -2
sprpriority = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
scale = 0.6,0.6

[State 1000, Projectile 1]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3540
ID = 3540
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(-50 * const(size.xScale)), ceil(-95 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile 2]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3550
ID = 3550
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(50 * const(size.xScale)), ceil(-95 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile 3]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3560
ID = 3560
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(-50 * const(size.xScale)), ceil(-45 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile 4]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3570
ID = 3570
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(50 * const(size.xScale)), ceil(-45 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile 5]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3580
ID = 3580
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-130 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile 6]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 3590
ID = 3590
name = "Illusion Soul Projectile"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-20 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

;ball 01
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3531
ID = 2350
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = -2.4, -1.2
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2350
pos = -50, -95
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1
;----------------------------------------------------------------------------
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3534
ID = 2353
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 2.4, -1.2
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2353
pos = 50, -95
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1

;----------------------------------------------------------------------------
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3537
ID = 2356
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = -2.4, 1.2
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2356
pos = -50, -45
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1

;----------------------------------------------------------------------------
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3540
ID = 2359
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 2.4, 1.2
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2359
pos = 50, -45
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1

;----------------------------------------------------------------------------
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3543
ID = 2362
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0, -2.8
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2362
pos = 0, -130
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1

;----------------------------------------------------------------------------
[State 0, Explod]
type = Explod
trigger1 = time = 20
anim = 3546
ID = 2365
pos = 0, -70
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0, 2.7
removetime = -1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 40
ID = 2365
pos = 0, -20
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,0
removetime = 80
sprpriority = 7
shadow = 0,0,0
ownpal = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(16) < 0
time = 10
value = SCA

;HELPER
[Statedef 3510]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3505
juggle = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
[State 0, PosSet]
type = PosSet
trigger1 =  1
y = 0
[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =  1
flag = invisible
flag2 = noshadow

[State 0,HitDef]
type = HitDef
trigger1 = parent , p2bodydist X < 60
trigger1 = time = 0
priority = 5, Hit
attr = S,HA
hitflag = M
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = 0
getpower = 0
GivePower = ifelse ( var(20) > 0, 40, 40)
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =35
ground.velocity = 12
yaccel = 0.55
guard.velocity = 12
air.velocity = 5, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff =  0
sparkxy = 0, 0
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkno = -1
hitsound = -1
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 110
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 5
p2facing = -1
p1stateno = 3511
p2stateno = 3515
palfx.time = 160
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10
palfx.color = 256

[State 0,HitDef]
type = HitDef
trigger1 = parent , p2bodydist X >= 60
trigger1 = time = 0
priority = 5, Hit
attr = S,HA
hitflag = M
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = 0
getpower = 0
GivePower = ifelse ( var(20) > 0, 40, 40)
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =35;15
ground.velocity = 12
yaccel = 0.55
guard.velocity = 12
air.velocity = 5, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff =  0
sparkxy = 0, 0
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkno = -1
hitsound = -1
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 110
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 5
p2facing = -1
p1stateno = 3511
p2stateno = 3515
palfx.time = 160
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10
palfx.color = 256

;HELPER
[Statedef 3511]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3503
juggle = 0

[State 3511, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
[State 3511, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
[State 3511, AssertSpecial]
type = AssertSpecial
trigger1 =  1
flag = invisible
flag2 = noshadow

[State 3511, 1]
type = Explod
trigger1 = time = 0
ID = 3511
anim = 3508
sprpriority = 0
postype = p2
pos = 0,-6
bindtime = 1
pausemovetime = 1
removetime = 150
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
supermove = 0

[State 3511, 1]
type = Explod
trigger1 = time = 150
trigger1 = p2stateno = 3515
ID = 3511
anim = 3509
sprpriority = 0
postype = p2
pos = 0,-6
bindtime = 1
pausemovetime = 1
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
supermove = 0

[State 0,explod]
type = Explod
trigger1 = time = 0
ID = 3511
anim = 3504
sprpriority = 7
postype = p2
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1,1.3
removetime = 155

[State 0,explod]
type = Explod
trigger1 = time = 14
ID = 3511
anim = 3504
sprpriority = 7
postype = p2
pos = 0, 0
bindtime = 1
supermove = 0
ownpal = 1
scale = 1,1.3
removetime = 150

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = p2stateno != 3515
id = 3511

;P2 throw_throw
[Statedef 3515]
type = S
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3515

[State 0, PosSet]
type = PosSet
trigger1 =  1
y = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 1

[State 0, ChangeState]
type = selfstate
trigger1 = time = 200
value = 3525
ctrl = 0

[Statedef 3525]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050]
type = ChangeAnim2
trigger1 = time = 0
trigger1 = !SelfAnimExist(5052)
value = 3525
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 14

[State 0, SelfState]
type = SelfState
trigger1 = time > 10 && pos Y >= 0 && vel Y > 0
value = 5100

;====<Soul Spiral Teleport>=
[StateDef 3600]
type = S
physics = N
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
trigger1 = Time = 3
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3600, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3600, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3600,0
channel = 0

[State 3600, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 7
value = 810,2
channel = 1

[State 3600, PosAdd]
type = PosAdd
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
x = P2Dist X
persistent = 1

[State 3600, PlayerPush]
type = PlayerPush
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = 0

[State 3600, NotHitBy]
type = NotHitBy
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(8) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 3600, Trans: Fade Out]
type = Trans
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) = [0, 10]
trans = AddAlpha
alpha = (256 - 25 * (AnimElemTime(7))), (25 * (AnimElemTime(7)))

[State 3600, Trans: Fade In]
type = Trans
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(7) = [0, 10]
trans = AddAlpha
alpha = (25 * (AnimElemTime(9))), (256 - 25 * (AnimElemTime(9)))

[State 3600, Snd]
type = PlaySnd
TriggerAll = Anim = 3600
trigger1 = AnimElem = 5 || AnimElem = 7
value = 1500, 0

[State 3600, VelSet]
type = Turn
trigger1 = Anim = 3600 && Vel X < 0
persistent = 0

[State 3600, VelSet]
type = VelSet
trigger1 = Anim = 3600 && Vel X < 0
x = 0

[State 3600, Explod]
type = Explod
trigger1 = time = 0
anim = 3601
ID = 3600
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3600, End]
type = ChangeState
trigger1 = !AnimTime
value = 3601
ctrl = 0

;
[StateDef 3601]
type = S
anim = 1220
physics = N
moveType = A
velSet = 0,0

[State 3601, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 1200,1
Channel = 0

[State 3601, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = 1200,2
Channel = 1

[State 3601, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0

[State 3601, NotHitBy]
type = NotHitBy
TriggerAll = Anim = 1220
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(12) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 3601, Hitdef 1]
type = HitDef
trigger1 = animelem = 13 || animelem = 16 || animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31 || animelem = 34
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 27.7 < 7, 7, fvar(11) * 27.7)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 4,4
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -2
guard.velocity = -2
air.velocity = -3,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10

[State 3601,0]
type = HitDef
trigger1 = animelem = 37
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 60
givepower = 20
pauseTime = 10, 10
guard.pausetime = 10, 10
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -6,-6.5
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
air.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 1252
ID = 3601
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 24
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
x = 0

[State 3052, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Max Soul Spiral Teleport>=
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
trigger1 = Time = 3
fvar(5) = 0

[State 3650, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3650, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3650, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3650, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3600,0
channel = 0

[State 3650, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 7
value = 810,2
channel = 1

[State 3650, PosAdd]
type = PosAdd
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
x = P2Dist X
persistent = 1

[State 3650, PlayerPush]
type = PlayerPush
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = 0

[State 3650, NotHitBy]
type = NotHitBy
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(8) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 3650, Trans: Fade Out]
type = Trans
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(5) = [0, 10]
trans = AddAlpha
alpha = (256 - 25 * (AnimElemTime(7))), (25 * (AnimElemTime(7)))

[State 3650, Trans: Fade In]
type = Trans
TriggerAll = Anim = 3600
trigger1 = AnimElemTime(7) = [0, 10]
trans = AddAlpha
alpha = (25 * (AnimElemTime(9))), (256 - 25 * (AnimElemTime(9)))

[State 3650, Snd]
type = PlaySnd
TriggerAll = Anim = 3600
trigger1 = AnimElem = 5 || AnimElem = 7
value = 1500, 0

[State 3650, VelSet]
type = Turn
trigger1 = Anim = 3600 && Vel X < 0
persistent = 0

[State 3650, VelSet]
type = VelSet
trigger1 = Anim = 3600 && Vel X < 0
x = 0

[State 3650, Explod]
type = Explod
trigger1 = time = 0
anim = 3601
ID = 3650
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3650, End]
type = ChangeState
trigger1 = !AnimTime
value = 3651
ctrl = 0

;
[StateDef 3651]
type = S
anim = 3650
physics = N
moveType = A
velSet = 0,0

[State 3651, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 1200,1
channel = 0

[State 3651, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = 1200,2
channel = 1

[State 3651, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0

[State 3651, NotHitBy]
type = NotHitBy
TriggerAll = Anim = 3650
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(12) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 3651, Hitdef 1]
type = HitDef
trigger1 = animelem = 13 || animelem = 16 || animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31 || animelem = 34 || animelem = 37 || animelem = 40 || animelem = 43 || animelem = 46 || animelem = 49 || animelem = 52
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 23.3 < 7, 7, fvar(11) * 23.3)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 4,4
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -2
guard.velocity = -2
air.velocity = -3,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10

[State 3651,0]
type = HitDef
trigger1 = animelem = 55
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
getpower = 60
givepower = 20
pauseTime = 10, 10
guard.pausetime = 10, 10
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -6,-6.5
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
air.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10

[State 3651, Explod]
type = Explod
trigger1 = time = 5
anim = 3651
ID = 3651
pos = 0,0
postype = p1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 3651, Dust Helper]
type = Helper
trigger1 = AnimElem = 54
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3651, VelSet]
type = VelSet
trigger1 = time >= 11
x = 1
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 13
x = 6
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 18
x = 4
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 24
x = 2
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 26
x = 1
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 28
x = 0
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 34
x = 4
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 36
x = 2
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 40
x = 1
[State 3651, VelSet]
type = VelSet
trigger1 = time >= 44
x = 0

[State 3651, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1
