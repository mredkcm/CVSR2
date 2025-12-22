; _________________________________________
;| Rose by varo_hades                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<Soul Spark>==
[StateDef 1000]
type = S
physics = S
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

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 0

[State 1000, Soul Spark Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,1
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1005
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 1000, Explod]
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

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Ex Soul Spark>=
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1000
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
channel = 0

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 1

[State 1030, Soul Spark Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,1
channel = 2

[State 0, Explod]
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

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Soul Throw>=
[StateDef 1100]
type = S
physics = N
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
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = time >= 6
statetype = A
movetype = A
physics = N

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 6
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 14
x = 2

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 7
y = -10
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 9
y = -7
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 12
y = -5
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 15
y = -4
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 18
y = -2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 21
y = -1

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 19
x = 0
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 23
y = 0
x = 0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 25
y = 2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 28
y = 3
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 31
y = 5
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 34
y = 7
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 37
y = 9

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 6
x = 10
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 14
x = 6

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 7
y = -10
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 9
y = -7
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 12
y = -5
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 15
y = -4
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 18
y = -2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 21
y = -1

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 19
x = 2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 23
y = 0
x = 0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 25
y = 2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 28
y = 3
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 31
y = 5
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 34
y = 7
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 37
y = 9

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 6
x = 12
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 14
x = 6

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 7
y = -12
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 9
y = -8
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 12
y = -6
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 15
y = -4
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 18
y = -2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 21
y = -1

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 19
x = 4
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 23
y = 0
x = 0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 25
y = 2
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 28
y = 3
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 31
y = 5
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 34
y = 7
[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 37
y = 9

[State 1100 , HitDef 1]
type = HitDef
trigger1 = var(10) = 0
trigger1 = Time = 0 && p2statetype = A && p2stateno != [150,152]
attr = A, ST
hitflag = AF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 1101
p2stateno = 1102
fall = 1
fall.recover = 0

[State 1100 , HitDef 2]
type = HitDef
trigger1 = var(10) = 1
trigger1 = Time = 0 && p2statetype = A && p2stateno != [150,152]
attr = A, ST
hitflag = AF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 1101
p2stateno = 1103
fall = 1
fall.recover = 0

[State 1100 , HitDef 3]
type = HitDef
trigger1 = var(10) = 2
trigger1 = Time = 0 && p2statetype = A && p2stateno != [150,152]
attr = A, ST
hitflag = AF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 1101
p2stateno = 1104
fall = 1
fall.recover = 0

[State 1100,ChangeState]
type = ChangeState
trigger1 = time > 12
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

[State 1100, Explod]
type = Explod
trigger1 = time = 7
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

[State 1100, Explod]
type = Explod
trigger1 = time = 12
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

[State 1100, Explod]
type = Explod
trigger1 = time = 16
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

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 8
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1100, NotHitBy]
type = NotHitBy
trigger1 =time = 0
value = SCA,NA,SA,HA
time = 6

;
[Statedef 1110]
type = C
movetype = I
physics = C
velset = 0, 0
ctrl = 0
anim = 1102
juggle = 0
poweradd = 0

[State 1110, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 50,0

[State 1110, Landing Dust Explod]
type = Explod
trigger1 = Time = 0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1110,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 1110, 4]
type = ChangeState
trigger1 = command = "holddown"
trigger1 = AnimTime = 0
value = 11
ctrl = 1

[State 1110, 4]
type = ChangeState
trigger1 = command != "holddown"
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;
[Statedef 1101]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim =  1101
juggle = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 1
time = 18
pos = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 =  1
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 4,1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
y = -20
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 3
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
trigger1 = time >= 15
x = 0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 34
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 56
y = 10

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 38
value = 810,0

[State 0, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 0,changeState]
type = changeState
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

;
[Statedef 1102]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =  1
value = 2

[State 0, PalFX]
type = PalFX
trigger1 =  time = 0
time = 30
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3
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
trigger1 = time >= 13
x = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 10

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = var(54)>0
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 54
value = -300
persistent = 0

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 44
value = -300
persistent = 0

[State 0, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -110
kill=1

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 20

[State 0, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
;ignorehitpause =
persistent = 0

[State 0,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;
[Statedef 1103]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =  1
value = 2

[State 0, PalFX]
type = PalFX
trigger1 =  time = 0
time = 30
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3
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
trigger1 = time >= 13
x = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 10

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = var(54)>0
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 54
value = -300
persistent = 0

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 44
value = -300
persistent = 0

[State 0, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -120
kill=1

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 20

[State 0, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
;ignorehitpause =
persistent = 0

[State 0,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;
[Statedef 1104]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =  1
value = 2

[State 0, PalFX]
type = PalFX
trigger1 =  time = 0
time = 30
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3
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
trigger1 = time >= 13
x = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 10

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = var(54)>0
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 54
value = -300
persistent = 0

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 44
value = -300
persistent = 0

[State 0, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -130
kill=1

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 20

[State 0, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
;ignorehitpause =
persistent = 0

[State 0,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;====<Ex Soul Throw>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1130
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

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 2

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time >= 7
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 14
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 19
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 23
y = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 25
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 31
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 34
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 37
y = 9

[State 800, 1]
type = HitDef
trigger1 = Time = 0 && p2statetype = A && p2stateno != [150,152]
attr = A, ST
hitflag = AF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 1101
p2stateno = 1136
fall = 1
fall.recover = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time > 12
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1110
ctrl = 0

[State 0, Explod]
type = Explod
trigger1 = time = 7
anim = 1105
ID = 1190
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

[State 0, Explod]
type = Explod
trigger1 = time = 12
anim = 1105
ID = 1190
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

[State 0, Explod]
type = Explod
trigger1 = time = 16
anim = 1105
ID = 1190
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

[State 1130, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1130, Dust Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1130, Dust Helper]
type = Helper
trigger1 = Time = 8
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 =time = 0
value = SCA,NA,SA,HA
time = 8

;
[Statedef 1136]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
anim =  1101
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =  1
value = 2

[State 0, PalFX]
type = PalFX
trigger1 =  time = 0
time = 30
add = 222,0,222
mul = 255,255,255
sinadd = 111,111,111,10
invertall = 0
color = 256

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1103

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = -3
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
trigger1 = time >= 13
x = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
x = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -1.5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 10

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = var(54)>0
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 54
value = -300
persistent = 0

[State 0, VarAdd]
type = VarAdd
triggerall = var(40) =1
triggerall = time >= 160
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
v = 44
value = -300
persistent = 0

[State 0, TargetLifeAdd]
type = LifeAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = -150

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10
freq = 120
ampl = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
x = 20

[State 0, Turn]
type = Turn
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
persistent = 0

[State 0,changeState]
type = selfstate
trigger1 = time >= 20
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;=<Soul Spiral>==
[StateDef 1200]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "a", 0, ifElse(command = "b", 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1210, 1200))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1200, Effect]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = AnimElem = 8
value = 1200,2
channel = 1

[State 1200, Effect]
type = PlaySnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 11
value = 1200,2
channel = 1

[State 1200, Effect]
type = PlaySnd
trigger1 = var(10) = 2
trigger1 = AnimElem = 11
value = 1200,2
channel = 1

[State 1000,0]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 110)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -6,-6
air.velocity = -6,-6
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
air.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 6
envshake.freq = 110
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10
palfx.color = 256

[State 1000,0]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1000,0]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 43.5 < 7, 7, fvar(11) * 43.5)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 10
x = 5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 15
x = 3
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 22
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 25
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 28
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 11
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 13
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 18
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 24
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 26
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 28
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 11
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 13
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 18
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 24
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 26
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 28
x = 0

[State 0, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = time = 0
anim = 1250
ID = 1200
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
trigger1 = var(10) = 0
trigger1 = AnimElem = 16
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
trigger1 = var(10) = 0
triggerall = var(21) > 0
trigger1 = time = 0
name = "61300"
ID = 61300
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61300
ignorehitpause = 1
[State 0, helper 61301]
type = helper
trigger1 = var(10) = 0
triggerall = var(21) > 0
trigger1 = time = 0
name = "61301"
ID = 61301
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61301
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = time = 5
anim = 1251
ID = 1200
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
trigger1 = var(10) = 1
trigger1 = AnimElem = 22
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = time = 5
anim = 1252
ID = 1200
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
trigger1 = var(10) = 2
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

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = movecontact
value = 1201
ctrl = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = movecontact
value = 1202
ctrl = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = animtime = 0
value = 0
ctrl = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 1
trigger1 = time = 0
name = "61370"
ID = 61370
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61370
ignorehitpause = 1
[State 0, helper 61371]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 1
trigger1 = time = 0
name = "61371"
ID = 61371
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61371
ignorehitpause = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 2
trigger1 = time = 0
name = "61350"
ID = 61350
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61350
ignorehitpause = 1
[State 0, helper 61351]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 2
trigger1 = time = 0
name = "61351"
ID = 61351
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61351
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = frontedgebodydist <= 60
x = 0

;
[Statedef 1201]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1225
juggle = 0
powerAdd = 72 * !var(20)

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1201
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
trigger1 = time >= 12
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
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
trigger1 = frontedgebodydist <= 60
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1202]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1225
juggle = 0
poweradd = 72 * !var(20)

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1202
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
trigger1 = time >= 12
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 43.5 < 7, 7, fvar(11) * 43.5)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1203
ctrl = 0
persistent = 0

;
[Statedef 1203]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1225
juggle = 0
poweradd = 72 * !var(20)

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1203
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 43.5 < 7, 7, fvar(11) * 43.5)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Ex Soul Spiral>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1220
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

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1130, Voice]
type = PlaySnd
trigger1 = Animelem = 2
value = 1200,1
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = Animelem = 11
value = 1200,2
channel = 2

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 37.5 < 7, 7, fvar(11) * 37.5)), 7
getpower = 0,0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
x = 1.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 13
x = 6.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
x = 4.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
x = 2.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
x = 1.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
x = 0

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 1252
ID = 1230
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

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1231
ctrl = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = time = 0
name = "61350"
ID = 61350
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61350
ignorehitpause = 1
[State 0, helper 61351]
type = helper
triggerall = var(21) > 0
trigger1 = time = 0
name = "61351"
ID = 61351
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61351
ignorehitpause = 1

;
[Statedef 1231]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1225
juggle = 0
poweradd = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1231
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
trigger1 = time >= 12
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 37.5 < 7, 7, fvar(11) * 37.5)), 7
getpower = 0,0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1232
ctrl = 0
persistent = 0

;
[Statedef 1232]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1225
juggle = 0
poweradd = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1232
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
trigger1 = time >= 12
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 37.5 < 7, 7, fvar(11) * 37.5)), 7
getpower = 0, 0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
value = 1233
ctrl = 0
persistent = 0

;
[Statedef 1233]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1225
juggle = 0
poweradd = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1253
ID = 1233
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 0

[State 1000,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 37.5 < 7, 7, fvar(11) * 37.5)), 7
getpower = 0, 0
givepower = 20
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = 40,5
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=<Soul Reflect>==
[StateDef 1300]
type = S
physics = S
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "x", 0, ifElse(command = "y", 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300,0
channel = 0

[State 1200, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300,1
channel = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 1
trigger1 =  time=0
x = 5
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 2
trigger1 = time = 0
x = 5
y = 0

[State 1000,0]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -5,-6
air.velocity = -5,-6
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = ifelse ( var(21) > 0,-35,-17)
guard.cornerpush.veloff = ifelse ( var(21) > 0,-35,-17)
air.cornerpush.veloff = ifelse ( var(21) > 0,-15,-15)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10

[State 1000,0]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -5,-6
air.velocity = -5,-6
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = ifelse ( var(21) > 0,-35,-17)
guard.cornerpush.veloff = ifelse ( var(21) > 0,-35,-17)
air.cornerpush.veloff = ifelse ( var(21) > 0,-15,-15)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10

[State 1000,0]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 5, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 126 < 7, 7, fvar(11) * 126)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -3,-10.5
air.velocity = -3,-10.5
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = ifelse ( var(21) > 0,-35,-15)
guard.cornerpush.veloff = ifelse ( var(21) > 0,-35,-15)
air.cornerpush.veloff = ifelse ( var(21) > 0,-15,-15)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10

[State 0, VarSet]
type = VarSet
trigger1 = var(10) = 2
trigger1 = time = 0
v = 39
value = 0
[State 0, VarSet]
type = VarSet
trigger1 = var(10) = 2
trigger1 = movehit
v = 39
value = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 0
trigger1 = time = 4
attr = SCA,NP,SP,HP
stateno = 1301
time = 4
[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 0
trigger1 = time = 8
attr = SCA,NP,SP,HP
stateno = 1302
time = 4
[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 0
trigger1 = time = 12
attr = SCA,NP,SP,HP
stateno = 1303
time = 9

[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 1
trigger1 = time = 4
attr = SCA,NP,SP,HP
stateno = 1304
time = 3
[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 1
trigger1 = time = 7
attr = SCA,NP,SP,HP
stateno = 1305
time = 7

[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 2
trigger1 = time = 3
attr = SCA,NP,SP,HP
stateno = 1306
time = 4
[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 2
trigger1 = time = 7
attr = SCA,NP,SP,HP
stateno = 1307
time = 5
[State 0, HitOverride]
type = HitOverride
trigger1 = var(10) = 2
trigger1 = time = 12
attr = SCA,NP,SP,HP
stateno = 1308
time = 5

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = time = 0
anim = 1305
ID = 1300
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

[State 0, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 5
anim = 1105
ID = 1300
pos = 50,-20
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 0.6,0.6
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0
persistent = 0

[State 1300, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 4
anim = 8102
sprPriority = -3
posType = P1
pos = 5,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 0
trigger1 = time = 0
name = "61200"
ID = 61200
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61200
ignorehitpause = 1
[State 0, helper 61201]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 0
trigger1 = time = 0
name = "61201"
ID = 61201
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61201
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = time = 0
anim = 1315
ID = 1300
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

[State 0, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 6
anim = 1105
ID = 1300
pos = 50,-20
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 0.6,0.6
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0
persistent = 0

[State 1300, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 4
anim = 8102
sprPriority = -3
posType = P1
pos = 20,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 1
trigger1 = time = 0
name = "61270"
ID = 61270
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61270
ignorehitpause = 1
[State 0, helper 61201]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 1
trigger1 = time = 0
name = "61271"
ID = 61271
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61271
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = time = 0
anim = 1325
ID = 1300
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

[State 0, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 5
anim = 1105
ID = 1300
pos = 50,-20
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 0.6,0.6
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0
persistent = 0

[State 0, landing explode]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 5
anim = 7231
sprpriority = 0
postype = p1
pos = 20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2, 0.7
ownpal = 1

[State 1300, Landing Dust Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 5
anim = 8102
sprPriority = -3
posType = P1
pos = 10,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 2
trigger1 = time = 0
name = "61250"
ID = 61250
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61250
ignorehitpause = 1
[State 0, helper 61251]
type = helper
triggerall = var(21) > 0
trigger1 = var(10) = 2
trigger1 = time = 0
name = "61251"
ID = 61251
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61251
ignorehitpause = 1

;
[Statedef 1301]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1301

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1306
ID = 1301
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

juggle = 0
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1302]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1302

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1307
ID = 1302
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

juggle = 0
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1303]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1303

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1308
ID = 1303
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

juggle = 0
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1304]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1311

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1316
ID = 1304
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

[State 1304, Projectile]
type = Helper
trigger1 = time = 4
helperType = Normal
stateNo = 1005
ID = 1005
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1312

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1317
ID = 1305
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

[State 1305, Projectile]
type = Helper
trigger1 = time = 7
helperType = Normal
stateNo = 1005
ID = 1005
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1306]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1321

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1326
ID = 1306
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

[State 1306, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1015
ID = 1015
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1307]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1322

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1327
ID = 1307
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

[State 1307, Projectile]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1015
ID = 1015
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1308]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1323

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1328
ID = 1308
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

[State 1308, Projectile]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 1015
ID = 1015
name = "Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Ex Soul Reflect>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1320
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 11

[State 1330, EX FX]
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

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA
time = 4

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1330, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300,0
channel = 1

[State 1330, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300,1
channel = 2

[State 1330, PosAdd]
type = PosAdd
trigger1 =time=0
x = 5
y = 0

[State 1330,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 5, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 140 < 7, 7, fvar(11) * 140)), 7
getPower = 0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -3,-10.5
air.velocity = -3,-10.5
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = ifelse ( var(21) > 0,-35,-15)
guard.cornerpush.veloff = ifelse ( var(21) > 0,-35,-15)
air.cornerpush.veloff = ifelse ( var(21) > 0,-15,-15)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -50
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 10

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
v = 39
value = 0
[State 0, VarSet]
type = VarSet
trigger1 = movehit
v = 39
value = 1

[State 1330, HitOverride]
type = HitOverride
trigger1 = time = 3
attr = SCA,NP,SP,HP
stateno = 1331
time = 8
[State 1330, HitOverride]
type = HitOverride
trigger1 = time = 7
attr = SCA,NP,SP,HP
stateno = 1332
time = 10
[State 1330, HitOverride]
type = HitOverride
trigger1 = time = 12
attr = SCA,NP,SP,HP
stateno = 1333
time = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1325
ID = 1330
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

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1105
ID = 1330
pos = 50,-20
postype = p1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = -2
scale = 0.6,0.6
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 0
persistent = 0

[State 1330, Landing Dust Explod]
type = Explod
trigger1 = animelem = 5
anim = 8102
sprPriority = -3
posType = P1
pos = 10,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

; ##21# rose helper
[State 0, helper 61200]
type = helper
triggerall = var(21) > 0
trigger1 = time = 0
name = "61250"
ID = 61250
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61250
ignorehitpause = 1
[State 0, helper 61251]
type = helper
triggerall = var(21) > 0
trigger1 = time = 0
name = "61251"
ID = 61251
helpertype = normal
pos = 0,0
postype = p1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
stateno = 61251
ignorehitpause = 1

;
[Statedef 1331]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1321

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1326
ID = 1331
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

[State 1306, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1332]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1322

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1327
ID = 1332
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

[State 1307, Projectile]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1333]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1323

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1328
ID = 1333
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

[State 1308, Projectile]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Soul Spark Projectile"
posType = P1
pos = ceil(65 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = 0.9
size.yScale = 1
ownPal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=<Soul Teleport>==
[StateDef 1400]
type = S
movetype = I
physics = N
anim = 1400
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2
facep2 = 0

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifelse(command = "SoulTeleportFront_3P", 2, ifelse(command = "SoulTeleportFront_3K", 1, ifelse(command = "SoulTeleportBack_3P", -2, -1)))

[State 1400, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = 0

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
trigger1 = ((Command = "holdx") + (Command = "holdy") + (Command = "holdz") < 2)
trigger2 = AnimElemTime(5) >= 0 && AnimElemTime(8) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 1400, Trans: Fade Out]
type = Trans
trigger1 = AnimElemTime(5) = [0, 10]
trans = AddAlpha
alpha = (256 -25 * (AnimElemTime(5))), (25 * (AnimElemTime(5)))

[State 1400, Trans: Fade In]
type = Trans
trigger1 = AnimElemTime(7) = [0, 10]
trans = AddAlpha
alpha = (25 * (AnimElemTime(7))), (256 -25 * (AnimElemTime(7)))

[State 1400, Snd]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 7
value = 810, 2
channel = 1

[State 1400, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1400, 0
channel = 0

[State 1400, Vel]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
x = ifelse(var(10) = 2, 32, ifelse(var(10) = -2, -32, ifelse(var(10) = 1, 16, -16)))

[State 1400, Vel]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1400, Turn]
type = Turn
trigger1 = AnimElem = 7 && P2Dist X < 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 1405
ID = 1400
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

[State 1400, Position Fix]
type = PosAdd
trigger1 = AnimElem = 2 || animelem = 3 || animelem = 8 || animelem = 9
x = ifelse((AnimElem = 2), -8, ifelse((AnimElem = 3), -12, ifelse((AnimElem = 8), 8, 12)))

[State 1400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<Soul Drill>==
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

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "a", 0, ifElse(command = "b", 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0
channel = 0

[State 1500, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,2
channel = 1

[State 1500,0]
type = HitDef
trigger1 = var(10) = 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -6,-6
air.velocity = -6,-6
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
air.cornerpush.veloff = -5
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -56
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 6
envshake.freq = 110
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6
palfx.time = 30
palfx.mul = 255,255,255
palfx.add = 222,0,222
palfx.sinadd = 111,111,111,10
palfx.color = 256

[State 1500,0]
type = HitDef
trigger1 = var(10) = 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 21.5 < 7, 7, fvar(11) * 21.5)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1500,0]
type = HitDef
trigger1 = var(10) = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 0
trigger1 = movecontact && NumTarget
value = 1

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 1
trigger1 = movecontact && NumTarget
value = 1

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 2
trigger1 = movecontact && NumTarget
value = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = movecontact && NumTarget
value = 1501
ctrl = 0
persistent = 0

[State 1500, ChangeState]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = movecontact && NumTarget
value = 1502
ctrl = 0
persistent = 0

[State 1500, ChangeState]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1501]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1525
juggle = 0
powerAdd = 72 * !var(20)

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 1
trigger1 = movecontact && NumTarget
value = 3

[State 1500,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 21.5 < 7, 7, fvar(11) * 21.5)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 1500, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1502]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1525
juggle = 0
poweradd = 72 * !var(20)

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 2
trigger1 = movecontact && NumTarget
value = 3

[State 1500,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1500, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = movecontact && NumTarget
value = 1503
ctrl = 0
persistent = 0

;
[Statedef 1503]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1525
juggle = 0
poweradd = 72 * !var(20)

[State 1500, LifeAdd]
type = LifeAdd
trigger1 = var(10) = 2
trigger1 = movecontact && NumTarget
value = 4

[State 1500,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 1500, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Ex Soul Drill>=
[StateDef 1530]
type = S
physics = N
moveType = A
anim = 1520
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1530, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1530, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 35

[State 1530, EX FX]
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

[State 1530, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0
channel = 1

[State 1500, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,2
channel = 2

[State 1530,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 23.25 < 7, 7, fvar(11) * 23.25)), 7
getpower = 0,0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1530, LifeAdd]
type = LifeAdd
trigger1 = movecontact && NumTarget
value = 2

[State 1530, ChangeState]
type = ChangeState
trigger1 = movecontact && NumTarget
value = 1531
ctrl = 0
persistent = 0

[State 1530, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1531]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1525
juggle = 0
poweradd = 0

[State 1531, LifeAdd]
type = LifeAdd
trigger1 = movecontact && NumTarget
value = 3

[State 1531,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 23.25 < 7, 7, fvar(11) * 23.25)), 7
getpower = 0,0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1531, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1531, ChangeState]
type = ChangeState
trigger1 = movecontact && NumTarget
value = 1532
ctrl = 0
persistent = 0

;
[Statedef 1532]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1525
juggle = 0
poweradd = 0

[State 1532, LifeAdd]
type = LifeAdd
trigger1 = movecontact && NumTarget
value = 4

[State 1532,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 23.25 < 7, 7, fvar(11) * 23.25)), 7
getpower = 0, 0
givepower = 20
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pausetime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
ground.slidetime = 15
ground.hittime = 15
air.hittime = 20
guard.hittime = 14
guard.ctrltime =14
ground.velocity = -4
air.velocity = -6,-6.5
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
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

[State 1532, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1532, ChangeState]
type = ChangeState
trigger1 = movecontact && NumTarget
value = 1533
ctrl = 0
persistent = 0

;
[Statedef 1533]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1525
juggle = 0
poweradd = 0

[State 1533, LifeAdd]
type = LifeAdd
trigger1 = movecontact
value = 6

[State 1533,0]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 23.25 < 7, 7, fvar(11) * 23.25)), 7
getpower = 0,0
givepower = 20
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
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
sparkNo = -1 + 0 * (var(33) := 8013)
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

[State 1533, ChangeState]
type = ChangeState
trigger1 = animtime = 0
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
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4, 4
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 82 < 7, 7, fvar(11) * 82)), 0
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
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
trigger1 = AnimElem = 3
value = 4,4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
