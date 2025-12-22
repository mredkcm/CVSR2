; _________________________________________
;| Ibuki by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<YOROI DOOSHI>=
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-18 * const(size.xScale)), ceil(-74 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3001
ctrl = 0

;Continue
[Statedef 3001]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3001
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3100,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = Time = 0
trigger1 = p2stateno != [150,152]
attr = A, HT
hitflag = MAF
guardflag = -1
priority = 5
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 0)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
sprpriority = 1
p2facing = 1
p1stateno = 3010
p2stateno = 3015
fall = 1
fall.recover = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 2
value = 3002
ctrl = 1

;Away
[Statedef 3002]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3002
juggle = 0
poweradd = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = -30, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3000,1

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 5
trigger2 = animelem = 8
trigger3 = animelem = 11
trigger4 = animelem = 16
trigger5 = animelem = 20
priority = 5, Hit
attr = S,HP
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 19
trigger5 = animelem = 22
priority = 5, Hit
attr = S,HP
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 23
trigger2 = animelem = 25
priority = 5, Hit
attr = S,HP
hitflag = MAFP
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 26
priority = 5, Hit
attr = S,HP
hitflag = MAFP
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getpower = 0
GivePower = 10
pausetime = 4,4
guard.pausetime = 2,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -12
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, Explod]
type = null;Explod
trigger1 = time = 9
anim = 2005
ID = 2000
pos = 0,0
postype = p1
bindtime = -1
removetime = 33
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 7002
pos = 85,-60
postype = p1
bindtime = -1
removetime = 42
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 26
anim = 7006
pos = 130,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.8,1.6
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 30
anim = 7006
pos = 150,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.6,1.2
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 34
anim = 7006
pos = 170,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.5,1
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 38
anim = 7006
pos = 180,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.3, 0.7
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 42
anim = 7006
pos = 190,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.2, 0.4
ontop = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = animelem = 58
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = animelem = 58
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
x = -4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 79
y = 0
x = 0

[State 0, PosSet]
type = PosSet
trigger1 = time = 79
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 79
x = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 81
x = -3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 83
x = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 85
x = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 87
x = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 60
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = -50, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 47
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 58
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 59
value = 101,0

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Close
[Statedef 3010]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3010
juggle = 0
poweradd = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = FrontEdgeBodyDist <= 50
x = -50

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 70,0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 34
time = 15
ampl = 20
freq = 100

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 34
value = 2,6

[State 750, 3]
type = EnvColor
trigger1 = time = 34
time = 1
value = 255,255,255
under = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[State 0, Explod]
type = Explod
trigger1 = time = 14
anim = 7014
pos = 55,-50
postype = p1
bindtime = -1
removetime = 21
sprpriority = 3
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 1, 0.8
ontop = 1

[State 871, Hit Spark]
type = Helper
trigger1 = time = 34
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 12
anim = 7008
pos = 50,-10
postype = p1
bindtime = -1
removetime = 45
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3015]
type = S
physics = N
movetype = A
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 50

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3015

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 36
value = -300
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 45
value = 3025

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 45
statetype = A
movetype = H
physics = N

[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
x = -12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 50
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 62
y = 2

[State 0,ChangeState]
type = selfstate
trigger1 = time >= 50
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<MAX YOROI DOOSHI>=
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-18 * const(size.xScale)), ceil(-74 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3051
ctrl = 0

;Continue
[Statedef 3051]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3001
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3100,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = Time = 0
trigger1 = p2stateno != [150,152]
attr = A, HT
hitflag = MAF
guardflag = -1
priority = 5
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 0)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
sprpriority = 1
p2facing = 1
p1stateno = 3060
p2stateno = 3065
fall = 1
fall.recover = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 2
value = 3052
ctrl = 1

;Away
[Statedef 3052]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3052
juggle = 0
poweradd = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = -30, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3000,1

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 5
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 9
trigger5 = animelem = 11
trigger6 = animelem = 12
trigger7 = animelem = 16
trigger8 = animelem = 17
trigger9 = animelem = 18
trigger10 = animelem = 20
priority = 5, Hit
attr = S,HP
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 14
trigger5 = animelem = 15
trigger6 = animelem = 19
trigger7 = animelem = 21
trigger8 = animelem = 22
priority = 5, Hit
attr = S,HP
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 23
trigger2 = animelem = 25
priority = 5, Hit
attr = S,HP
hitflag = MAFP
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0
GivePower = 5
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 26
priority = 5, Hit
attr = S,HP
hitflag = MAFP
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getpower = 0
GivePower = 10
pausetime = 4,4
guard.pausetime = 2,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 20
guard.hittime = 15
guard.ctrltime =15
ground.velocity = -12
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  0
guard.cornerpush.veloff =  0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 15
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 15

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 7002
pos = 85,-60
postype = p1
bindtime = -1
removetime = 42
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 26
anim = 7006
pos = 130,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.8,1.6
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 30
anim = 7006
pos = 150,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.6,1.2
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 34
anim = 7006
pos = 170,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.5,1
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 38
anim = 7006
pos = 180,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.3, 0.7
ontop = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 42
anim = 7006
pos = 190,-60
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 0.2, 0.4
ontop = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = animelem = 58
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = animelem = 58
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
x = -4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 79
y = 0
x = 0

[State 0, PosSet]
type = PosSet
trigger1 = time = 79
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 79
x = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 81
x = -3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 83
x = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 85
x = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 87
x = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 60
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = -50, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 47
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 58
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 59
value = 101,0

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Close
[Statedef 3060]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3010
juggle = 0
poweradd = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = FrontEdgeBodyDist <= 50
x = -50

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 70,0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 34
time = 15
ampl = 20
freq = 100

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 34
value = 2,6

[State 750, 3]
type = EnvColor
trigger1 = time = 34
time = 1
value = 255,255,255
under = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[State 0, Explod]
type = Explod
trigger1 = time = 14
anim = 7014
pos = 55,-50
postype = p1
bindtime = -1
removetime = 21
sprpriority = 3
ownpal = 1
removeongethit = 1
pausemovetime = 0
scale = 1, 0.8
ontop = 1

[State 871, Hit Spark]
type = Helper
trigger1 = time = 34
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 12
anim = 7008
pos = 50,-10
postype = p1
bindtime = -1
removetime = 45
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3065]
type = S
physics = N
movetype = A
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 50

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3015

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 36
value = -400
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 45
value = 3025

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 45
statetype = A
movetype = H
physics = N

[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
x = -12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 50
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 62
y = 2

[State 0,ChangeState]
type = selfstate
trigger1 = time >= 50
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<KASUMI SUZAKU>=
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

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-6 * const(size.xScale)), ceil(-100 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3101
ctrl = 0

;Kunais
[Statedef 3101]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3101
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3000,0

[State 3000, Kunai]
type=helper
trigger1= animelem=1
helpertype=normal
stateno=3105
ID=3100
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= animelem=3
helpertype=normal
stateno=3107
ID=3100
name="Kunai 2"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 3]
type=helper
trigger1= animelem=13
helpertype=normal
stateno=3108
ID=3100
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 4]
type=helper
trigger1= animelem=15
helpertype=normal
stateno=3109
ID=3100
name="Kunai 4"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,SND]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 13
trigger4 = animelem = 15
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3120
ctrl = 0

;Kunais 2
[Statedef 3120]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 46
value = 0

[State 0, VarSet]
type = VarSet
triggerall = time <= 14
trigger1 = command = "xxx"
trigger2 = command = "yyy"
trigger3 = command = "zzz"
v = 46
value = 1

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3110
ID=3100
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3105
ID=3100
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
trigger1 = var(46) > 0
value = 3125
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;Part 2
[Statedef 3125]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 46
value = 0

[State 0, VarSet]
type = VarSet
triggerall = time <= 14
trigger1 = command = "xxx"
trigger2 = command = "yyy"
trigger3 = command = "zzz"
v = 46
value = 1

[State 3000, Kunai]
type=helper
trigger1= Time=1
helpertype=normal
stateno=3111
ID=3100
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3108
ID=3100
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
trigger1 = var(46) > 0
value = 3140
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;Finish
[Statedef 3140]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3112
ID=3100
name="Kunai 7"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=3
helpertype=normal
stateno=3110
ID=3100
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;Landing
[Statedef 3130]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 3130

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, Posset]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, CtrlSet]
type = CtrlSet
trigger1 = time >= 14
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<MAX KASUMI SUZAKU>=
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

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-6 * const(size.xScale)), ceil(-100 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3151
ctrl = 0

;Kunais
[Statedef 3151]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3101
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3000,0

[State 3000, Kunai]
type=helper
trigger1= animelem=1
helpertype=normal
stateno=3105
ID=3150
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= animelem=2
helpertype=normal
stateno=3110
ID=3150
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= animelem=3
helpertype=normal
stateno=3107
ID=3150
name="Kunai 2"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 3]
type=helper
trigger1= animelem=13
helpertype=normal
stateno=3108
ID=3150
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 3]
type=helper
trigger1= animelem=14
helpertype=normal
stateno=3111
ID=3150
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 4]
type=helper
trigger1= animelem=15
helpertype=normal
stateno=3109
ID=3150
name="Kunai 4"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,SND]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 13
trigger4 = animelem = 15
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3160
ctrl = 0

;Kunais 2
[Statedef 3160]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 46
value = 0

[State 0, VarSet]
type = VarSet
triggerall = time <= 14
trigger1 = command = "xxx"
trigger2 = command = "yyy"
trigger3 = command = "zzz"
v = 46
value = 1

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3110
ID=3150
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=2
helpertype=normal
stateno=3111
ID=3150
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3105
ID=3150
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=4
helpertype=normal
stateno=3107
ID=3150
name="Kunai 2"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
trigger1 = var(46) > 0
value = 3170
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;Part 2
[Statedef 3170]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 46
value = 0

[State 0, VarSet]
type = VarSet
triggerall = time <= 14
trigger1 = command = "xxx"
trigger2 = command = "yyy"
trigger3 = command = "zzz"
v = 46
value = 1

[State 3000, Kunai]
type=helper
trigger1= Time=1
helpertype=normal
stateno=3111
ID=3150
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=2
helpertype=normal
stateno=3112
ID=3150
name="Kunai 7"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3108
ID=3150
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=4
helpertype=normal
stateno=3109
ID=3150
name="Kunai 4"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
trigger1 = var(46) > 0
value = 3180
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;Finish
[Statedef 3180]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3112
ID=3150
name="Kunai 7"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=2
helpertype=normal
stateno=3105
ID=3150
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=3
helpertype=normal
stateno=3110
ID=3150
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=4
helpertype=normal
stateno=3111
ID=3150
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3130
ctrl = 0

;====<HASHINSHO>=
[StateDef 3200]
type = S
physics = N
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

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(15 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =3300,0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3210
ctrl = 0

;Start
[Statedef 3210]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3210
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200,1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 7
kill = 0
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3220
ctrl = 0

;Conect
[Statedef 3220]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3220
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200,1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = time = 0
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 7
kill = 0
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -85
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3230
ctrl = 0

;Part 2
[Statedef 3230]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3230
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200,1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = time = 0
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 7
kill = 0
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3240
ctrl = 0

;Part 3
[Statedef 3240]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3240
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200,1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = time = 0
priority = 4, Hit
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
kill = 0
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3250
ctrl = 0

;Part 4
[Statedef 3250]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3250
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 15
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 18
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 21
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>= 27
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 30
y = 10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,3

[State 0,HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 4
priority = 5, Hit
attr = A, HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
pausetime = 12,12
air.pausetime = 12,12
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = 0
air.velocity = -1,-10
yaccel = 0.6
guard.velocity = 0
airguard.velocity = -2, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -60
fall = 0
air.fall = 0
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 10
fall.envshake.ampl = 5
p2stateno = 3255
p1stateno = 3251
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3252
ctrl = 0

;Part 5
[Statedef 3252]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3252
juggle = 0
poweradd = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Part 6
[Statedef 3251]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3251
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 20,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>= 15
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>= 18
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>= 21
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = 10

[State 0,HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = animelem = 1
priority = 5, Hit
attr = A, HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
pausetime = 4,4
air.pausetime = 4,4
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -1,-10
air.velocity = -1,-10
yaccel = 0.6
guard.velocity = -12
airguard.velocity = -1, -14
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -80
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 10
fall.envshake.ampl = 5
kill = 0

[State 0,HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 2
priority = 5, Hit
attr = A, HA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
pausetime = 4,4
air.pausetime = 4,4
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -1,-14
air.velocity = -1,-14
yaccel = 0.6
guard.velocity = -12
airguard.velocity = -1, -14
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -90
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 10
fall.envshake.ampl = 5
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=10
trigger1 = Pos Y >= 0 && vel Y > 0
value = 3260
ctrl = 0

;Player 2
[Statedef 3255]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 5000

[State 0, PosSet]
type = PosSet
trigger1 =  time = 0
y = 0

[State 0, ChangeState]
type = selfstate
trigger1 = time = 30
value = 0
ctrl = 1

;Part 7
[Statedef 3260]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3260
poweradd = 0
juggle = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 3
trigger1 = p2statetype = A
trigger1 = p2movetype = H
value = 3261
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 3
trigger1 = p2statetype != A
trigger1 = p2movetype != H
value = 0
ctrl = 1

[Statedef 3261]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3261
poweradd = 0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =  0
value = 1,5

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 2
y = -14

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = 2
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = time >= 17
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 14

[State 0,HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = time = 0
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
pausetime = 6,18
air.pausetime = 4,12
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -2
air.velocity = -2,-10
yaccel = 0.55
guard.velocity = -2
airguard.velocity = -2, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 10
fall.envshake.ampl = 5
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 3262
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1420
ctrl = 0

[State 40, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

;Part 8
[Statedef 3262]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3262
juggle = 0
poweradd = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
x = -4
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 0
x = 0

[State 300,2]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = animelem = 4
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
pausetime = 6,60
air.pausetime = 6,60
guard.pausetime = 10,10
ground.slidetime = 15
ground.hittime = 15
guard.hittime = 17
air.hittime = 15
guard.hittime = 17
ground.velocity = -12
air.velocity = 0,-8
yaccel = 0.55
guard.velocity = -8
airguard.velocity = -2, -8
ground.cornerpush.veloff =  -20
guard.cornerpush.veloff = -20
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -40
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 5
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 28
value = 3264
ctrl = 0

;Part 8
[Statedef 3264]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3101
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 3000,0

[State 3000, Kunai]
type=helper
trigger1= animelem=1
helpertype=normal
stateno=3105
ID=3100
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= animelem=3
helpertype=normal
stateno=3107
ID=3100
name="Kunai 2"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 3]
type=helper
trigger1= animelem=13
helpertype=normal
stateno=3108
ID=3100
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai 4]
type=helper
trigger1= animelem=15
helpertype=normal
stateno=3109
ID=3100
name="Kunai 4"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,SND]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 13
trigger4 = animelem = 15
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3265
ctrl = 0

;Part 9
[Statedef 3265]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 46
value = 0

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3110
ID=3100
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3105
ID=3100
name="Kunai 1"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
value = 3266
ctrl = 0

;Part 10
[Statedef 3266]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 3000, Kunai]
type=helper
trigger1= Time=1
helpertype=normal
stateno=3111
ID=3100
name="Kunai 6"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= Time=3
helpertype=normal
stateno=3108
ID=3100
name="Kunai 3"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 14
value = 3267
ctrl = 0

;Part 11
[Statedef 3267]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3110
juggle = 0

[State 0,SND]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 3
value = 1500,0

[State 3000, Kunai]
type=helper
trigger1= time=1
helpertype=normal
stateno=3112
ID=3100
name="Kunai 7"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 3000, Kunai]
type=helper
trigger1= time=3
helpertype=normal
stateno=3110
ID=3100
name="Kunai 5"
postype=p1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 3269
ctrl = 0

;Part 12
[Statedef 3268]
type = A
physics = N
movetype = A
ctrl = 0
velset = -0.2,-0.2
anim = 3268
juggle = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 80
value = 3269
ctrl = 0

;Part 13
[Statedef 3269]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3269
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 16
value = 1100,0

[State 0, VelSet]
type = VelSet
trigger1 = time>=16
x = 10
y = 12

[State 800, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
Trigger1 = time=0
attr = A, HA
hitflag = MAF
guardflag = M
priority = 5,hit
sprpriority = 1
p2facing = 1
p1stateno = 3270
p2stateno = 3275
pausetime = 20,20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -60
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 5
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0
value = 1420
ctrl = 1

;Part 14
[Statedef 3270]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3270
juggle = 0

[State 0, PosSet]
type = null;PosSet
trigger1 =  time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 10
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0
trigger1 = p2stateno !=3275
value = 3272
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0
trigger1 = p2stateno =3275
value = 3271
ctrl = 0

;Part 15
[Statedef 3272]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3271
juggle = 0

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 52, Landing Sound]
type = PlaySnd
trigger1 = Animelem = 1
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = animelem = 1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 2
x = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 101,0

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Part 16
[Statedef 3271]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3271
juggle = 0

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 52, Landing Sound]
type = PlaySnd
trigger1 = Animelem = 1
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = Animelem = 1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 2
x = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 101,0

[State 0,1]
type = ChangeState
trigger1 = animtime = 0
value = 3280
ctrl = 0

;Player 2
[Statedef 3275]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3275

[State 0, PosSet]
type = null;PosSet
trigger1 =  time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 30
value = 3276
ctrl = 0

;Player 2 part 4
[Statedef 3276]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3276

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 0
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time>=4
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time>=7
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time>=10
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>=13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>=16
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=19
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=22
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time>=25
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>=28
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>=31
y = 12

[State 0, SelfState]
type = changeState
trigger1 = Pos Y >= 0 && vel Y > 0
value = 3285

;End
[Statedef 3280]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3320

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7007
ID = 3320
pos = 0,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 17
anim = 7007
ID = 3320
pos = 70,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 17
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 33
anim = 7007
ID = 3320
pos = -100,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 33
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-100 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 47
anim = 7007
ID = 3320
pos = 70,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 47
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 61
anim = 7007
ID = 3320
pos = 0,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 10
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 61
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, Hit]
type = HitAdd
trigger1 = Time = 0 || Time = 17 || Time = 33 || Time = 47 || Time = 61
value = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
x = -70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 37
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
x = -70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
x = 50

[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
value = 2,7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 61
value = 2,7

[State 0, EnvColor]
type = Null;EnvColor
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
trigger5 = time = 61
time = 4
value = 255,255,255
under = 0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
trigger5 = time = 61
time = 10
ampl = 10
freq = 100

[State 02, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
value = -20
kill = 1

[State 0, Pause]
type = Pause
trigger1 = time = 61
time = 10
movetime = 0

[State 01, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 61
value = -30
kill = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2 prefinal
[Statedef 3285]
type = S
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3325

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 63
value = 3286
ctrl = 0

;Player 2 final
[Statedef 3286]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 20

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
y = -80

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 12
value = 25

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 16
value = 50

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 20
value = 75

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 24
value = 90

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 28
value = 115

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 32
value = 140

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 36
value = 165

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 40
value = 180

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 2999

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -2
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = 10

[State 0, SelfState]
type = SelfState
trigger1 = time >= 10
trigger1 = Pos Y >= -60
trigger1 = Vel Y > 0
value = 5100

;====<YAMI SHINGURE>=
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

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-45 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =3300,0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3301
ctrl = 0

;Part 1
[Statedef 3301]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3301
juggle = 0
poweradd = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,0

[State 0,explod]
type = Explod
trigger1 = time = 0
anim = 7001
sprpriority = 2
postype = p1
pos = 10,-60
bindtime = -1
pausemovetime = 0
removetime = 18
ignorehitpause = 1
scale = 0.6,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0,explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 70,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 150,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 0
trigger1= animelem = 4
helpertype=normal
stateno=3305
ID=3301
name="Kunai"
postype=p1
pos = ceil(130 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 120,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 200,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 1
trigger1= animelem = 4
helpertype=normal
stateno=3305
ID=3301
name="Kunai"
postype=p1
pos = ceil(180 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 170,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 250,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 2
trigger1= animelem = 4
helpertype=normal
stateno=3305
ID=3301
name="Kunai"
postype=p1
pos = ceil(230 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, changestate]
type = ChangeState
trigger1 = p2stateno = 3315
value = 3310
ctrl = 1

;Conect
[Statedef 3310]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3310

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
x = 30

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 30

[State 800, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = Time = 0
attr = S, HA
hitflag = MAF
priority = 5
pausetime = 0,0
guard.pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -65
sprpriority = 1
p2facing = 1
p1stateno = 3320
p2stateno = 3325
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

;Part 1
[Statedef 3320]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3340

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7007
ID = 3320
pos = 0,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 17
anim = 7007
ID = 3320
pos = 70,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 17
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 33
anim = 7007
ID = 3320
pos = -100,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 31
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, Hit]
type = HitAdd
trigger1 = Time = 0
value = 1

[State 820, Hit]
type = HitAdd
trigger1 = Time = 0 || Time = 17 || Time = 31
value = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
x = -70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 34
x = 50

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger2 = time = 17
value = 2,7;5,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 31
value = 2,7;5,3

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 16
trigger2 = time = 32
value = 3300,10

[State 0, EnvColor]
type = Null;EnvColor
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
time = 4
value = 255,255,255
under = 0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 31
time = 10
ampl = 10
freq = 100

[State 02, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 0
trigger2 = time = 16
value = -50
kill = 1

[State 0, Pause]
type = Pause
trigger1 = time = 31
time = 10
movetime = 0

[State 01, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 31
value = -150
kill = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3315]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3315

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 60
value = 3335
ctrl = 0

;Player 2 continue
[Statedef 3325]
type = S
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3345

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 33
value = 3335
ctrl = 0

;Player 2 end
[Statedef 3335]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 20

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
y = -80

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 12
value = 25

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 16
value = 50

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 20
value = 75

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 24
value = 90

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 28
value = 115

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 32
value = 140

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 36
value = 165

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 40
value = 180

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 2999

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -2
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = 10

[State 0, SelfState]
type = SelfState
trigger1 = time >= 10
trigger1 = Pos Y >= -60
trigger1 = Vel Y > 0
value = 5100

;====<MAX YAMI SHINGURE>=
[StateDef 3350]
type = S
physics = N
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

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-45 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifelse((command="c" && command="b"),2,ifelse((command="c" && command="a"),1,0))

[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =3300,0

[State 1001,1]
type = ChangeState
trigger1 = time = 60
value = 3351
ctrl = 0

;Part 1
[Statedef 3351]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3301
juggle = 0
poweradd = 0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,0

[State 0,explod]
type = Explod
trigger1 = time = 0
anim = 7001
sprpriority = 2
postype = p1
pos = 10,-60
bindtime = -1
pausemovetime = 0
removetime = 18
ignorehitpause = 1
scale = 0.6,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0,explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 70,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 150,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 0
trigger1= animelem = 4
helpertype=normal
stateno=3355
ID=3351
name="Kunai"
postype=p1
pos = ceil(130 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 120,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 200,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 1
trigger1= animelem = 4
helpertype=normal
stateno=3355
ID=3351
name="Kunai"
postype=p1
pos = ceil(180 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 0,explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 4
anim = 3303
sprpriority = 2
postype = p1
pos = 170,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 0,explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 4
anim = 3305
sprpriority = 2
postype = p1
pos = 250,0
bindtime = -1
pausemovetime = 0
removetime = 32
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1

[State 3000, Kunai]
type=helper
trigger1 = var(10) = 2
trigger1= animelem = 4
helpertype=normal
stateno=3355
ID=3351
name="Kunai"
postype=p1
pos = ceil(230 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xscale=1
size.yscale=1
ownpal=1

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, changestate]
type = ChangeState
trigger1 = p2stateno = 3365
value = 3360
ctrl = 1

;Conect
[Statedef 3360]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3310

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
x = 30

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 30

[State 800, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = Time = 0
attr = S, HA
hitflag = MAF
priority = 5
pausetime = 0,0
guard.pausetime = 0,0
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -65
sprpriority = 1
p2facing = 1
p1stateno = 3370
p2stateno = 3375
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

;Part 1
[Statedef 3370]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3320

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7007
ID = 3320
pos = 0,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 17
anim = 7007
ID = 3320
pos = 70,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 17
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 33
anim = 7007
ID = 3320
pos = -100,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 33
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 47
anim = 7007
ID = 3320
pos = 70,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 0
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 47
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 61
anim = 7007
ID = 3320
pos = 0,-50
postype = p1
bindtime = 1
removetime = 16
sprpriority = 2
ownpal = 1
removeongethit = 1
pausemovetime = 10
ontop = 1
scale = 1,0.5

[State 871, Hit Spark]
type = Helper
trigger1 = time = 61
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, Hit]
type = HitAdd
trigger1 = Time = 0
value = 1

[State 820, Hit]
type = HitAdd
trigger1 = Time = 0 || Time = 17 || Time = 33 || Time = 47 || Time = 61
value = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
x = -70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 37
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
x = -70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
x = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
x = 50

[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 16
trigger2 = time = 32
trigger3 = time = 46
value = 2,7;5,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 61
value = 2,7;5,3

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 16
trigger2 = time = 32
trigger3 = time = 46
trigger1 = time = 61
value = 3300,10

[State 0, EnvColor]
type = Null;EnvColor
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
trigger5 = time = 61
time = 4
value = 255,255,255
under = 0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
trigger5 = time = 61
time = 10
ampl = 10
freq = 100

[State 02, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 0
trigger2 = time = 16
trigger3 = time = 32
trigger4 = time = 46
value = -50
kill = 1

[State 0, Pause]
type = Pause
trigger1 = time = 61
time = 10
movetime = 0

[State 01, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 61
value = -150
kill = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3365]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3315

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 60
value = 3385
ctrl = 0

;Player 2 continue
[Statedef 3375]
type = S
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3325

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 63
value = 3385
ctrl = 0

;Player 2 end
[Statedef 3385]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 20

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
y = -80

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 12
value = 25

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 16
value = 50

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 20
value = 75

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 24
value = 90

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 28
value = 115

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 32
value = 140

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 36
value = 165

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 40
value = 180

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 2999

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -2
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = 10

[State 0, SelfState]
type = SelfState
trigger1 = time >= 10
trigger1 = Pos Y >= -60
trigger1 = Vel Y > 0
value = 5100
