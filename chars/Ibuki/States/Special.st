; _________________________________________
;| Ibuki by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<KUNAI>==
[StateDef 1000]
type = A
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1005
ID = 1005
name = "Kunai Projectile"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(3) > 0
trigger1 = time > 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(3) = 0
trigger1 = time > 8
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(3) < 0
trigger1 = time > 8
x = -2

[State 0, VelSet] ;1600
type = VelSet
trigger1 = prevstateno = [1600,1650]
trigger1 = time > 8
x = -2

[State 0, PosFreeze]
type = PosFreeze
trigger1 = time < 8
value = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1610
ctrl = 0

[State 0, VarSet]
type = VarSet
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 3
value = 0

;====<EX KUNAI>=
[StateDef 1030]
type = A
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 24

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1025
ID = 1005
name = "EX Kunai"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-105 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Kunai"
posType = P1
pos = ceil(-5 * const(size.xScale)), ceil(-45 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(3) > 0
trigger1 = time > 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(3) = 0
trigger1 = time > 8
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(3) < 0
trigger1 = time > 8
x = -2

[State 0, VelSet] ;1600
type = VelSet
trigger1 = prevstateno = [1600,1650]
trigger1 = time > 8
x = -2

[State 0, PosFreeze]
type = PosFreeze
trigger1 = time < 8
value = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1610
ctrl = 0

[State 0, VarSet]
type = VarSet
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 3
value = 0

;====<KUBI ORI>=
[StateDef 1100]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1150, ifElse(var(10) = 1, 1150, 1100))

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 11
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 26
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 30
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 11
x = 7

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 30
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 32
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 11
x = 9

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 33
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 36
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, SA
hitflag = MAF
priority = 5
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 0)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
sprpriority = 1
p2facing = 1
p1stateno = 1110
p2stateno = 1115
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Conect
[Statedef 1110]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1110
juggle = 0
poweradd = 0

[State 0, CtrlSet]
type = CtrlSet
trigger1 = time >=50
trigger1 = var(20)
value = 1

[State 0, PowerAdd]
type = PowerAdd
trigger1 = animelem = 1
trigger2 = animelem = 13
value = 40

[State 0, posset]
type = posadd
trigger1 = time = 0
x = 45

[State 0, SprPriority]
type = SprPriority
trigger1 = time > 4
value = -1

[State 871, Hit Spark]
type = Helper
trigger1 = time = 40
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P2
pos = ceil(-30 * const(size.xScale)), ceil(-80 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1112
ID = 1100
pos = 30,0
postype = p2
bindtime = -1
removetime = 15
sprpriority = 2
removeongethit = 1
facing = -1

[State 0, Explod]
type = Explod
trigger1 = time = 18
anim = 1111
ID = 1100
pos = 0,0
postype = p1
bindtime = -1
removetime = 23
sprpriority = 2
removeongethit = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, posset]
type = posset
trigger1 = animelem = 3
y = target,const(size.head.pos.y)

[State 0, posset]
type = posadd
trigger1 = time = 40
y = 70

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -1
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 62
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 74
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 82
y = 10

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 40
time = 10
ampl = 10
freq = 80

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 40
value = -100
kill = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 40
value = -110
kill = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 40
value = -120
kill = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 40
value = 2,2

[State 0, EnvColor]
type = Null;EnvColor
trigger1 = Time = 40
time = 1
value = 255,0,0
under = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = time > 44
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = time > 44
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = time > 44
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 0
ctrl = 1

;Player 2
[Statedef 1115]
type = A
movetype = H
physics = N
ctrl = 0
juggle = 0
poweradd = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time >= 0
value = SCA
time = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1115

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 52
value = 1125

[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
x = -2
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 56
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 76
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 80
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 84
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 88
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 92
y = 10

[State 0, SelfState]
type = SelfState
trigger1 = time >= 44
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<EX KUBI ORI>=
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 51

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
x = 12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
x = 7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1100,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, SA
hitflag = MAF
priority = 5
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 0)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -107
sprpriority = 1
p2facing = 1
p1stateno = 1140
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Conect
[Statedef 1140]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1170
juggle = 0
poweradd = 0

[State -2, ???????]
type = Explod
trigger1 = time = 0
anim = 1112
pos = -ceil(abs(target,pos X-pos X)),0
postype = p1
sprpriority = 10
bindtime = 1
ignorehitpause = 1
ownpal = 1
scale = const(size.xscale), const(size.yscale)

[State -2, ???????]
type = Explod
trigger1 = time = 0
anim = 1113
pos = -ceil(abs(target,pos X-pos X))+ceil(25*const(size.xscale)),ceil(-10*const(size.yscale))
postype = p1
sprpriority = 5
bindtime = 1
ignorehitpause = 1
ownpal = 1
scale = const(size.xscale), const(size.yscale)

[State -2, TargetState]
type = TargetState
Trigger1 = time = 0
value = 1145

[State 810, Playerpush]
type = Playerpush
trigger1 = 1
value = 0

[State -2, ScreenBound]
type = ScreenBound
trigger1 = time > 0
trigger1 = animelemtime(13) < 0
value = 0
movecamera = 1,0

[State 1200, 9]
type = Width
trigger1 = time = 0
edge = ceil(30*const(size.xscale)),0

[State 820, ???????]
type = SprPriority
trigger1 = AnimElem = 7
value = 0

[State -2, explod]
type = explod
trigger1 = animelem = 8
anim = 1175
pos = 0,0
postype = p1
facing = 1
sprpriority = 2
bindtime = -1
ownpal = 0
scale = const(size.xscale),const(size.yscale)

[State -2, explod]
type = explod
trigger1 = animelem = 23
anim = 1176
pos = 0,0
postype = p1
facing = 1
sprpriority = 2
bindtime = -1
ownpal = 0
scale = const(size.xscale),const(size.yscale)

[State -2, explod]
type = explod
trigger1 = animelem = 38
anim = 1177
pos = 0,0
postype = p1
facing = 1
sprpriority = 2
bindtime = -1
ownpal = 0
scale = const(size.xscale),const(size.yscale)

[State 810, ?????]
type = playsnd
trigger1 = animelem = 13
trigger2 = animelem = 28
trigger3 = animelem = 43
value = 2,2

[State -2, posset]
type = posset
trigger1 = time = 0
x = target,pos X

[State 810, TargetBind]
type = TargetBind
trigger1 = animelem = 1
trigger2 = animelem = 2
pos = 0,0

[State -2, posset]
type = posset
trigger1 = animelem = 3
y = target,const(size.head.pos.y)

[State -2, posadd]
type = posadd
trigger1 = animelem = 3
x = 15*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 3
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Hugo"
x = -5*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 5
x = 15*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 5
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Hugo"
x = -5*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 7
x = -15*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 7
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Ibuki"
x = 5*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 7
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Alex" || target,name = "Hugo"
x = -5*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 9
x = -15*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 9
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Ibuki"
x = 5*const(size.xscale)

[State -2, posadd]
type = posadd
trigger1 = animelem = 9
trigger1 = target,authorname = "GM"
trigger1 = target,name = "Alex" || target,name = "Hugo"
x = -5*const(size.xscale)

[State -2, posset]
type = posadd
trigger1 = animelem = 10
y = 4*const(size.yscale)

[State -2, posset]
type = posadd
trigger1 = animelem = 11
y = -4*const(size.yscale)

[State -2, posset]
type = posadd
trigger1 = animelem = 12
x = 10*const(size.xscale)

[State -2, posset]
type = posadd
trigger1 = animelem = 13
y = 42*const(size.yscale)

[State -2, posset]
type = posadd
trigger1 = animelem = 28
trigger2 = animelem = 43
y = -30*const(size.yscale)

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 13
trigger2 = animelem = 28
trigger3 = animelem = 43
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-42 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 23
pos = ceil(6*const(size.xscale)), ceil(-52*const(size.yscale))

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 24
trigger2 = AnimElem = 25
trigger3 = AnimElem = 26
trigger4 = AnimElem = 27
pos = ceil(6*const(size.xscale)), ceil(-72*const(size.yscale))

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 38
pos = ceil(-6*const(size.xscale)), ceil(-52*const(size.yscale))

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 39
trigger2 = AnimElem = 40
trigger3 = AnimElem = 41
trigger4 = AnimElem = 42
pos = ceil(-6*const(size.xscale)), ceil(-72*const(size.yscale))

[State -2, TargetState]
type = TargetState
trigger1 = animelem = 13
value = 1147

[State -2, TargetState]
type = TargetState
trigger1 = animelem = 28
value = 1148

[State -2, TargetState]
type = TargetState
trigger1 = animelem = 43
value = 1149

[State -2, TargetState]
type = TargetState
trigger1 = animelem = 23
trigger2 = animelem = 38
value = 1146

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 13
trigger2 = animelem = 38
value = -44
kill = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 43
value = -44
kill = 1

[State -2, HitAdd]
type = HitAdd
trigger1 = animelem = 13
value = -1

[State -2, HitAdd]
type = HitAdd
trigger1 = animelem = 13
trigger2 = animelem = 28
trigger3 = animelem = 43
value = 1

[State 5100, EnvShake]
type = EnvShake
trigger1 = animelem = 13
trigger2 = animelem = 28
trigger3 = animelem = 43
time = 10
freq = 80
ampl = -3

[State 5050, 3]
type = VelSet
trigger1 = animelem = 13
trigger2 = animelem = 28
y = -3.0

[State 5050, 3]
type = VelAdd
trigger1 = animelemtime(13) >= 0
trigger1 = animelemtime(23) < 0
trigger2 = animelemtime(28) >= 0
trigger2 = animelemtime(38) < 0
y = .20

[State 5050, 3]
type = VelSet
trigger1 = animelem = 23
trigger2 = animelem = 38
y = 0

[State 5050, 3]
type = VelSet
trigger1 = animelem = 43
x = -2.0*const(size.xscale)
y = -8.5*const(size.yscale)

[State 5050, 3]
type = VelAdd
trigger1 = animelemtime(43) >= 0
y = .50*const(size.yscale)

[State 810, 0]
type = turn
trigger1 = animelem = 50

[State 52, Landing Sound]
type = PlaySnd
trigger1 = animelemtime(43) > 0
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = animelemtime(43) > 0
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = animelemtime(43) > 0
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 52
ctrl = 1

;Player 2
[Statedef 1145]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0
SprPriority = 1

[State -2, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1180

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Gill"
value = 1180+(facing=-1)*100004

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Ibuki"
value = 101180

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Ryu" || name = "Ken" || name = "Gouki"
value = 101181

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Alex"
value = 101182

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Hugo"
value = 101183

;Player 2 part 2
[Statedef 1146]
type = A
movetype= H
physics = N
velset = 0,0
ctrl = 0
SprPriority = 1

[State -2, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1181

[State 811, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Gill"
value = 1181+(facing=-1)*10000

;Player 2 part 3
[Statedef 1147]
type = A
movetype= H
physics = N
velset = 0,0
SprPriority = 1

[State -3, PlaySnd]
type = PlaySnd
triggerall = time = 2
triggerall = alive
triggerall = authorname = "GM"
trigger1 = name = "Ryu" || name = "Ken" || name = "Gouki"
trigger2 = name = "Alex" || name = "Hugo" || name = "Ibuki"
trigger3 = name = "Gill"
value = S5000,1
channel = 2

[State 810, 0]
type = turn
trigger1 = time = 0

[State 820, posadd]
type = null;posadd
trigger1 = Time = 0
x = const(size.mid.pos.Y)-const(size.head.pos.Y)

[State 5050, 3]
type = VelSet
trigger1 = time = 0
y = -3.0

[State 811, ChangeAnim2]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050+(SelfAnimExist(5052))*2

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Hugo"
value = 5050

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Gill"
value = 5052+(facing=-1)*100000

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = 1
y = .20

[State 5050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 4
[Statedef 1148]
type = A
movetype= H
physics = N
velset = 0,0
SprPriority = 1

[State -3, PlaySnd]
type = PlaySnd
triggerall = time = 2
triggerall = alive
triggerall = authorname = "GM"
trigger1 = name = "Ryu" || name = "Ken" || name = "Gouki"
trigger2 = name = "Alex" || name = "Hugo" || name = "Ibuki"
trigger3 = name = "Gill"
value = S5000,1
channel = 2

[State 810, 0]
type = turn
trigger1 = time = 0

[State 820, posadd]
type = posadd
trigger1 = Time = 0
;x = const(size.mid.pos.Y)-const(size.head.pos.Y)
y = -const(size.head.pos.Y)

[State 5050, 3]
type = VelSet
trigger1 = time = 0
y = -3.0

[State 811, ChangeAnim2]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050+(SelfAnimExist(5052))*2

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Hugo"
value = 5050

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Gill"
value = 5052+(facing=-1)*100000

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = 1
y = .20

[State 5050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 5
[Statedef 1149]
type = A
movetype= H
physics = N
velset = 0,0
SprPriority = 1

[State -3, PlaySnd]
type = PlaySnd
triggerall = time = 2
triggerall = alive
triggerall = authorname = "GM"
trigger1 = name = "Ryu" || name = "Ken" || name = "Gouki"
trigger2 = name = "Alex" || name = "Hugo" || name = "Ibuki"
trigger3 = name = "Gill"
value = S5000,1
channel = 2

[State 810, 0]
type = turn
trigger1 = time = 0

[State 820, posadd]
type = posadd
trigger1 = Time = 0
;x = const(size.mid.pos.Y)-const(size.head.pos.Y)
y = -const(size.head.pos.Y)

[State 5050, 3]
type = VelSet
trigger1 = time = 0
x = 1.5
y = -7.0

[State 811, ChangeAnim2]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050+(SelfAnimExist(5052))*2

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Hugo"
value = 5050

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = authorname = "GM"
trigger1 = name = "Gill"
value = 5052+(facing=-1)*100000

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = 1
y = .55

[State 5050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;====<KAZEKIRI>=
[StateDef 1200]
type = S
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1250, ifElse(var(10) = 1, 1270, 1200))

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(10) = 0
trigger1 = animelem = 8
statetype = A
movetype = A
physics = N

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(10) = 1
trigger1 = animelem = 7
statetype = A
movetype = A
physics = N

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(10) = 2
trigger1 = animelem = 8
statetype = A
movetype = A
physics = N

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,10

[State 1200,1]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 12,10
guard.pausetime = 12,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.55
guard.velocity = -4
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 0
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 1200,1.5]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 6
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-14
air.velocity = -2,-14
yaccel = 0.8
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 7
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 7,7
guard.pausetime = 7,7
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-14
air.velocity = -2,-14
yaccel = 0.8
guard.velocity = -14
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 3 || var(20))
triggerall = hitcount < 3
trigger1 = animelem = 8
trigger2 = animelem = 9
trigger3 = animelem = 10
trigger4 = animelem = 11
trigger5 = animelem = 12
trigger6 = animelem = 13
trigger7 = animelem = 14
trigger8 = animelem = 15
trigger9 = animelem = 16
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,10
guard.pausetime = 6,8
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 1200,1]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-14
yaccel = 0.6
guard.velocity = -4
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 1200,1.5]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 6
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-14
air.velocity = -2,-14
yaccel = 0.75
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 7
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-14
air.velocity = -2,-14
yaccel = 0.75
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 3 || var(20))
triggerall = hitcount < 3
trigger1 = animelem = 8
trigger2 = animelem = 9
trigger3 = animelem = 10
trigger4 = animelem = 11
trigger5 = animelem = 12
trigger6 = animelem = 13
trigger7 = animelem = 14
trigger8 = animelem = 15
trigger9 = animelem = 16
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,10
guard.pausetime = 6,8
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 1200,1]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = 0,-12
yaccel = 0.6
guard.velocity = -4
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 1200,1.5]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 6
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-14
yaccel = 0.75
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 7
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,10
guard.pausetime = 6,8
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-14
air.velocity = -2,-14
yaccel = 0.75
guard.velocity = -4
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 8
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,10
guard.pausetime = 6,8
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.75
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 4 || var(20))
triggerall = hitcount < 4
trigger1 = animelem = 9
trigger2 = animelem = 10
trigger3 = animelem = 11
trigger4 = animelem = 12
trigger5 = animelem = 13
trigger6 = animelem = 14
trigger7 = animelem = 15
trigger8 = animelem = 16
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.75
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 0
trigger1 = time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 0
x = 2
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 7
x = 2
y = -9

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 11
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 15
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 18
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 20
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 23
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 27
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 31
y = 11

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 35
y = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 1
trigger1 = time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 0
x = 2
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 7
x = 2
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 11
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 17
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 19
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 21
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 24
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 27
y = 7

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 32
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 35
y = 12

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 2
trigger1 = time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 6
x = 4
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 11
x = 4
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 14
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 18
x = 2
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 22
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 24
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 26
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 30
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 34
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 38
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 42
y = 12

[State 0,Explod]
type = Explod
trigger1 = var(10) = [0,1]
trigger1 = time = 5
anim = 7011
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
pausemovetime = 0
removetime = 9
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 40, Dust Helper]
type = Helper
trigger1 = var(10) = [0,1]
trigger1 = time = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0,Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = time = 8
anim = 7011
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
pausemovetime = 0
removetime = 9
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 40, Dust Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = time = 11
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 7
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1210
ctrl = 0

;Landing
[Statedef 1210]
type = S
movetype = I
physics = S
velset = 0, 0
ctrl = 0
anim = 1210
juggle = 0
poweradd = 0

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

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0, CtrlSet]
type = CtrlSet
trigger1 = time = 12
value = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<EX KAZEKIRI>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1280
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 11

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 210,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getpower = 0
GivePower = 10
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-12
yaccel = 0.6
guard.velocity = -2
ground.cornerpush.veloff = -2
guard.cornerpush.veloff = -2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -50
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 6
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getpower = 0
GivePower = 10
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-12
yaccel = 0.6
guard.velocity = -2
ground.cornerpush.veloff = -2
guard.cornerpush.veloff = -2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 8
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getpower = 0
GivePower = 10
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,0
air.velocity = -2,-12
yaccel = 0.55
guard.velocity = -2
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -80
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 210,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 10
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getpower = 0
GivePower = 10
pausetime = 6,6
guard.pausetime = 6,6
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,0
air.velocity = -2,-12
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -80
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
x = 6
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 34
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
y = 12

[State 0,Explod]
type = Explod
trigger1 = time = 8
anim = 7011
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
pausemovetime = 0
removetime = 9
ignorehitpause = 1
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "x"
trigger1 = time >= 12
value = 600
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "a"
trigger1 = time >= 12
value = 630
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "y"
trigger1 = time >= 12
value = 610
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "b"
trigger1 = time >= 12
value = 640
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "z"
trigger1 = time >= 12
value = 620
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = command = "c"
trigger1 = time >= 12
value = 651
ctrl = 0

[State 0, VelSet]
type = VelSet
triggerall = vel Y < 0
trigger1 = movecontact && time >= 12
y = -6

[State 0, VelSet]
type = VelSet
triggerall = vel Y < 0
trigger1 = movecontact && time >= 16
y = -4

[State 0, VelSet]
type = VelSet
triggerall = vel Y < 0
trigger1 = movecontact && time >= 20
y = -2

[State 40, Dust Helper]
type = Helper
trigger1 = time = 11
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 7
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1210
ctrl = 0

;====<TSUMUJI>=
[StateDef 1300]
type = S
movetype = A
physics = N
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1350, ifElse(var(10) = 1, 1350, 1300))

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = animelem = 8
trigger2 = animelem = 22
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = animelem = 10
trigger2 = animelem = 24
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = animelem = 12
trigger2 = animelem = 26
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = [1,2]
trigger1 = animelem = 8
trigger2 = animelem = 22
trigger3 = animelem = 37
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = [1,2]
trigger1 = animelem = 10
trigger2 = animelem = 24
trigger3 = animelem = 39
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = var(10) = [1,2]
trigger1 = animelem = 12
trigger2 = animelem = 26
trigger3 = animelem = 41
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
triggerall = var(10) = 0
trigger1 = animelem = 1
trigger2 = animelem = 22
value = 1300,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = animelem = 8
trigger2 = animelem = 22
value = 1,5
channel = 1

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(10) = [1,2]
trigger1 = animelem = 8
trigger2 = animelem = 22
trigger3 = animelem = 37
value = 1300,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(10) = [1,2]
trigger1 = animelem = 8
trigger2 = animelem = 22
trigger3 = animelem = 37
value = 1,5
channel = 1

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 0
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 7
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 10
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 12
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 16
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 18
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 20
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 24
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 0
trigger1 = time >= 36
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 0
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 7
x = 3

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 10
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 12
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 16
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 18
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 20
x = 3

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 24
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 1
trigger1 = time >= 36
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 0
x = 0

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 10
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 15
x = 3

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 20
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 24
x = 3

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 28
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 32
x = 1

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 36
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 40
x = 4

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 44
x = 3

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 48
x = 2

[State 0,1]
type = velset
trigger1 = var(10) = 2
trigger1 = time >= 52
x = 0

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,12
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 23
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,12
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 23
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 38
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -2,-10
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,12
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 23
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 6,12
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 38
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -2,-10
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0,Explod]
type = Explod
triggerall = var(10) = 0
trigger1 = time = 9
trigger2 = time = 24
anim = 7000
sprpriority = 1
postype = p1
pos = -5,-65
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 0
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0,Explod]
type = Explod
triggerall = var(10) = [1,2]
trigger1 = time = 13
trigger2 = time = 27
trigger3 = time = 43
anim = 7000
sprpriority = 1
postype = p1
pos = -5,-65
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 0
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
ontop=1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 0

[State 0, VarSet]
type = VarSet
trigger1 = var(10) = 0
triggerall = time <= 21
trigger1 = command = "down_a"
trigger2 = command = "down_b"
trigger3 = command = "down_c"
v = 27
value = 1

[State 0, VarSet]
type = VarSet
trigger1 = var(10) = 1
triggerall = time = [28,36]
trigger1 = command = "down_a"
trigger2 = command = "down_b"
trigger3 = command = "down_c"
v = 27
value = 1

[State 0, VarSet]
type = VarSet
trigger1 = var(10) = 2
triggerall = time <= 38
trigger1 = command = "down_a"
trigger2 = command = "down_b"
trigger3 = command = "down_c"
v = 27
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time = 21
trigger1 = var(27) > 0
value = 1310
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
triggerall = time = 37
trigger1 = var(27) > 0
value = 1310
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 38
trigger1 = var(27) > 0
value = 1310
ctrl = 0

;Finish
[Statedef 1310]
type = C
physics = C
movetype = A
ctrl = 0
poweradd = 0
anim = 1310
juggle = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 0

[State 1310,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = C,NA
hitflag = MAF
guardflag = L
animtype = hard
air.animtype = hard
ground.type = trip
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
ground.slidetime = 15
ground.hittime = 15
air.hittime = 9
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -1,-8
air.velocity = -3,-8
yaccel = 0.6
guard.velocity = -12
airguard.velocity = -4,-2
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -20
fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 110, Dust Helper]
type = Helper
trigger1 = time = 10
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,Explod]
type = Explod
trigger1 = time = 8
anim = 7000
sprpriority = 2
postype = p1
pos = -5,-8
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 1
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1,5

[State 0,0]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;====<EX TSUMUJI>=
[StateDef 1330]
type = S
movetype = A
physics = N
anim = 1380
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 41

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 18
trigger3 = animelem = 28
trigger4 = animelem = 38
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 18
trigger3 = animelem = 28
trigger4 = animelem = 38
value = 1,5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 19
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 25
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
x = 0

[State 110, Dust Helper]
type = Helper
trigger1 = animelem = 7
trigger2 = animelem = 17
trigger3 = animelem = 27
trigger4 = animelem = 38
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = animelem = 9
trigger2 = animelem = 19
trigger3 = animelem = 29
trigger4 = animelem = 40
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Dust Helper]
type = Helper
trigger1 = animelem = 11
trigger2 = animelem = 21
trigger3 = animelem = 31
trigger4 = animelem = 42
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 8
trigger2 = animelem = 28
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0,0
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -2
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = animelem = 18
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0,0
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2
air.velocity = -2,-8
yaccel = 0.50
guard.velocity = -2
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 39
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0,0
givePower = 36, 36
pausetime = 2,4
guard.pausetime = 2,4
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-10
air.velocity = -2,-10
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -60
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0,Explod]
type = Explod
trigger1 = time = 7
trigger2 = time = 17
trigger3 = time = 27
trigger4 = time = 37
anim = 7000
ID = 1380
sprpriority = 2
postype = p1
pos = -5,-65
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 0
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 0

[State 0, VarSet]
type = VarSet
triggerall = time <= 13
trigger1 = command = "down_a"
trigger2 = command = "down_b"
trigger3 = command = "down_c"
v = 27
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 13
trigger1 = var(27) > 0
value = 1335
ctrl = 0

;Conect
[Statedef 1335]
type = C
physics = C
movetype = A
anim = 1385
ctrl = 0
juggle = 10
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 27
value = 0

[State 205,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 6
trigger2 = animelem = 17
priority = 4, Hit
attr = C,SA
guardflag = L
hitflag = MAF
animtype = medium
air.animtype = hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
pausetime = 3,4
guard.pausetime = 3,4
ground.slidetime = 14
ground.hittime = 14
air.hittime = 14
guard.hittime = 15
guard.ctrltime = 15
ground.velocity = -4
air.velocity = -2,-8
yaccel = 0.55
guard.velocity = -4
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
getpower = 0,0
givePower = 36, 36
fall = 0
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -10
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 110, Dust Helper]
type = Helper
trigger1 = time = 7
trigger2 = time = 21
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,Explod]
type = Explod
trigger1 = time = 7
trigger2 = time = 21
anim = 7000
ID = 1385
sprpriority = 2
postype = p1
pos = -5,-8
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 1
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 7
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 21
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 21
value = 1,5

[State 200,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 1340
ctrl = 0

;Finish
[Statedef 1340]
type = C
physics = C
movetype = A
ctrl = 0
poweradd = 0
anim = 1390
poweradd = 0
juggle = 0

[State 1310,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = C,NA
hitflag = MAF
guardflag = L
animtype = hard
air.animtype = hard
ground.type = trip
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0,0
givePower = 36, 36
pausetime = 3,4
guard.pausetime = 3,4
ground.slidetime = 15
ground.hittime = 15
air.hittime = 9
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -1,-8
air.velocity = -3,-8
yaccel = 0.6
guard.velocity = -12
airguard.velocity = -4,-2
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -20
fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 110, Dust Helper]
type = Helper
trigger1 = time = 10
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 7000
sprpriority = 2
postype = p1
pos = -5,-8
bindtime = -1
pausemovetime = 0
removetime = 16
ignorehitpause = 1
scale = 1.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
ontop = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1,5

[State 0,0]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;====<HIEN>=
[StateDef 1400]
type = A
movetype = A
physics = N
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1450, ifElse(var(10) = 1, 1450, 1400))

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 4
x = 3
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 16
x = 2
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 18
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 20
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 24
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 28
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 32
x = 1
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 36
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 5
x = 4
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 9
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 12
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 16
x = 4
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 18
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 20
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 24
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 28
y = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 32
x = 3
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 36
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 5
x = 8
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 9
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 12
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 16
x = 6
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 18
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 20
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 24
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 28
y = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 32
x = 3
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 36
y = 14

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =  0
value = 1,5
channel = 0

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0
channel = 1

[State 300,2]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
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
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 300,2]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
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
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 300,2]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
pausetime = 6,18
air.pausetime = 4,18
guard.pausetime = 6,18
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = 0
air.velocity = 0,-10
yaccel = 0.55
guard.velocity = -2
airguard.velocity = -2, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1410
ctrl = 0

[State 110, Dust Helper]
type = Helper
trigger1 = Time = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1420
ctrl = 0

;Finish
[Statedef 1410]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1410
juggle = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 8
value = -1

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
x = -3
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -6

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
trigger1 = time >= 29
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 41
y = 10

[State 300,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 4
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
pausetime = 6,16
air.pausetime = 6,16
guard.pausetime = 8,10
ground.slidetime = 15
ground.hittime = 15
guard.hittime = 17
air.hittime = 15
guard.hittime = 17
ground.velocity = -6
air.velocity = -1,-10
yaccel = 0.55
guard.velocity = -12
airguard.velocity = -2, -8
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1420
ctrl = 0

;Landing
[Statedef 1420]
type = S
movetype = I
physics = S
velset = 0, 0
ctrl = 0
anim = 1420
juggle = 0
poweradd = 0

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

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<EX HIEN>=
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 41

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 5
x = 12
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = 8
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
x = 3
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 14

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =  0
value = 1,5
channel = 1

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0
channel = 2

[State 300,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 11
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 75 < 7, 7, fvar(11) * 75)), 7
pausetime = 6,18
air.pausetime = 4,18
guard.pausetime = 6,18
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = 0
air.velocity = 0,-10
yaccel = 0.55
guard.velocity = -2
airguard.velocity = -2, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 5
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1410
ctrl = 0

[State 110, Dust Helper]
type = Helper
trigger1 = Time = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1420
ctrl = 0

;Finish
[Statedef 1410]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1410
juggle = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 8
value = -1

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
x = -3
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -6

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
trigger1 = time >= 29
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 41
y = 10

[State 300,2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 4
priority = 4, Hit
attr = A, SA
hitflag = MAF
guardflag = HA
animtype = hard
air.animtype =  hard
ground.type = low
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
pausetime = 6,16
air.pausetime = 6,16
guard.pausetime = 8,10
ground.slidetime = 15
ground.hittime = 15
guard.hittime = 17
air.hittime = 15
guard.hittime = 17
ground.velocity = -6
air.velocity = -1,-10
yaccel = 0.55
guard.velocity = -12
airguard.velocity = -2, -8
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := -40
fall = 0
air.fall = 1
fall.recover = 1
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 15
fall.envshake.freq = 100
fall.envshake.ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1420
ctrl = 0

;====<RAIDA>=
[StateDef 1500]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1550, ifElse(var(10) = 1, 1500, 1500))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1500,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, SA
hitflag = M
priority = 5
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
sprpriority = 1
p2facing = 1
p1stateno = 1510
p2stateno = 1515
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 0
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 2
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 4
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 12
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 16
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 20
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 0
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 2
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 12
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 16
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 20
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 2
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 4
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 12
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 16
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 20
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Throw
[Statedef 1510]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1510
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
anim = 6007
sprpriority = 4
postype = p1
pos = 65 , -60
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = animelem = 8
anim = 6009
sprpriority = 4
postype = p1
pos = 62 , -57
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = animelem = 10
anim = 6009
sprpriority = 4
postype = p1
pos = 72 , -57
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 9
helperType = Normal
sprpriority = 5
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(72 * const(size.xScale)), ceil(-57 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
trigger1 = frontedgebodydist <= 60
x = -40

[State 0, posset]
type = null;posadd
trigger1 = time = 0
x = 45

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1500,10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 2,6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2stateno = 5110
value = 820,2
persistent = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = time > 4
value = 1

[State 0, Explod]
type = Explod
trigger1 = time = 9
anim = 1511
ID = 1500
pos = 0,0
postype = p1
bindtime = -1
removetime = 74
sprpriority = 2
removeongethit = 0
facing = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 60,0

[State 800, EnvShake]
type = EnvShake
trigger1 = time = 25
time = 10
ampl = 10
freq = 100

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 25
value = -120
kill = 1
absolute = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 25
value = -130
kill = 1
absolute = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 25
value = -140
kill = 1
absolute = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = var(10) = 3
trigger1 = time = 25
value = -150
kill = 1
absolute = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 8
time = 1
value = 255,255,255
under = 1
ignorehitpause = 1
persistent =0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Player 2
[Statedef 1515]
type = S
movetype = H
physics = N
ctrl = 0
juggle = 0
poweradd = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 23

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1515

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 40
value = 1525

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = 5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 56
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 68
y = 12

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 40
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 15
ampl = 10
freq = 100

[State 0, SelfState]
type = SelfState
trigger1 = time >= 40
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<EX RAIDA>=
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1550
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 54

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1500,0

[State 800, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, SA
hitflag = M
priority = 5
getPower = 0,0
givePower = 36, 36
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
sprpriority = 1
p2facing = 1
p1stateno = 1510
p2stateno = 1515
fall = 1
fall.recover = 1
envshake.time = 0
envshake.freq = 100
envshake.ampl = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 2
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;====<TSUIJI GOE>=
[StateDef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1650, ifElse(var(10) = 1, 1600, 1600))

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A
movetype = A
physics = N

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =  0
value = 41,0

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 0
x = -3
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 4
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 16
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 20
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 40
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 44
y = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 0
x = -4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 4
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 8
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 16
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 20
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 40
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 44
y = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 0
x = -5
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 4
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 8
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 16
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 20
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 32
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 36
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 40
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 44
x = 0
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "MAXYoroi Dooshi"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 3150
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "Yoroi Dooshi"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 3100
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "EXKunai"
trigger1 = p2bodydist X <= 0
trigger1 = time > 8
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "EXKunai"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "Kunai"
trigger1 = p2bodydist X <= 0
trigger1 = time > 8
value = 1000
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "Kunai"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 1000
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "EXKunai"
trigger1 = p2bodydist X <= 0
trigger1 = time > 8
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "EXKunai"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "Kunai"
trigger1 = p2bodydist X <= 0
trigger1 = time > 8
value = 1000
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "Kunai"
trigger1 = p2bodydist X > 0
trigger1 = time > 8
value = 1000
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 40
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1610
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 0

;Landing
[Statedef 1610]
type = S
movetype = I
physics = S
velset = 0, 0
ctrl = 0
anim = 1610

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

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<KASUMI GAKE>=
[StateDef 1700]
type = S
physics = S
moveType = I
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1750, ifElse(var(10) = 1, 1750, 1700))

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 000, snd]
type = playsnd
trigger1 = time = 0
value = 4,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1,3
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 0
x = 14

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 2
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 4
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 6
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 11
x = 0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = time >= 11
anim = 8100
sprPriority = -3
posType = P1
pos = ceil(0 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 0
x = 16

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 2
x = 14

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 4
x = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 6
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 8
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 11
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 13
x = 0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = time >= 13
anim = 8100
sprPriority = -3
posType = P1
pos = ceil(0 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 0
x = 20

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 2
x = 18

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 4
x = 16

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 6
x = 12

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 8
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 11
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 13
x = 0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = time >= 13
anim = 8100
sprPriority = -3
posType = P1
pos = ceil(0 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time = 17
value = 0
ctrl = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = time = 22
value = 0
ctrl = 1

[State 0,ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = time = 22
value = 0
ctrl = 1

;====<PUNCH ZERO COUNTER>=
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<KICK ZERO COUNTER>=
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4, 3
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 10
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(11) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
