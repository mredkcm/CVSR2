;                          ____________________
;=|Terry Bogard by Memo|=
;                          ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
;Power Geyser
[Statedef 3000]
type=S
physics=N
movetype=A
anim=3000
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1


[State 3000, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3000
trigger1 = AnimElemNo(0) = [5,7]
trigger2 = Anim = 3001
trigger2 = AnimElemNo(0) = [5,7]
trigger3 = Anim = 3002
trigger3 = AnimElemNo(0) = [5,7]
value = SCA
time = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 3, -104
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3000,0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = s3000,1
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = s2000,1

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = s1100,1

[State 3000, Effect]
type = PlaySnd
trigger1 = AnimElemTime(17) = 1
value = 3000, 2
channel = 1

[State 3000, Explod]
type = Explod
trigger1 = animelem=4
anim =3096;3004
ID =3096;3004
pos = 0,-1
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3000, Explod]
type = Explod
trigger1 = animelem =8
anim = 3003
ID = 3003
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3000, Explod]
type = null;Explod
trigger1 = animelem =8
anim = 3007
ID = 3007
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3000, Explod]
type = null;Explod
trigger1 = animelem =8
anim = 6607
ID = 6607
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 1
ontop = 0
ownpal = 1
removetime = 17
removeongethit = 0
ignorehitpause = 1

[State 3000, Explod]
type = Explod
trigger1 = animelem =8
anim = 6608
ID = 6608
pos = 60,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 17
removeongethit = 0
ignorehitpause = 1

[State 3000, Fire1]
type = Explod
trigger1 = AnimElem = 7
Anim = 1290
pos = 14, -1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3000, Power Geyser]
type = Helper
trigger1 = AnimElem = 7
id = 3005
name = "PowerGeyser"
pos = 60,0
postype = P1
stateno = 3005
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3000, Explod]
type = Explod
trigger1 = animelem=8
anim =3006
ID =3006
pos = 63,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Triple Geyser
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -2000
faceP2 = 1

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3050
trigger1 = AnimElemNo(0) = [5,7]
value = SCA,NP,SP;,HP
time = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
;helpertype = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 3, -104
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3000,0
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = s3000,1
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 7 || AnimElem = 17 || AnimElem = 27
value = s2000,1

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 7 || AnimElem = 17 || AnimElem = 27
value = s1100,1

[State 3050, Width]
type = Width
trigger1 = AnimElem = 7
value = 32,0

[State 3000, Explod]
type = Explod
trigger1 = animelem=4 || animelem=24
anim =1004
ID =1004
pos = 0,-1
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =14
anim = 3096
ID = 3096
pos = 0,2
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =8
anim = 6608
ID = 6608
pos = 60,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 17
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =8
anim = 3003
ID = 3003
pos = 70,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =18
anim = 3003
ID = 3003
pos = 110,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =18
anim = 6608
ID = 6608
pos = 100,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 17
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =28
anim = 3003
ID = 3003
pos = 150,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3050, Explod]
type = Explod
trigger1 = animelem =28
anim = 6608
ID = 6608
pos = 140,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 17
removeongethit = 0
ignorehitpause = 1

[State 3050,Bccolor]
type = null;BGPalfx
trigger1 = animelem = 27
ignorehitpause = 1
time = 49
add = 0,0,25
color = 1
invertall = 0

[State 3050, Explod Ground FX]
type = null;Explod
trigger1 = animelem = 27
anim = 6558
id = 6558
sprpriority = -10
postype = p1
pos = 0,0
bindtime = 1
ignorehitpause = 1
supermovetime = 35
pausemovetime = 35
under = 0
ownpal = 1
scale = 1,1

[State 3050, Fire1]
type = Explod
trigger1 = AnimElem = 7 || AnimElem = 27
Anim = 1290
pos = 64,1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3050, Fire1]
type = Explod
trigger1 = AnimElem = 17
Anim = 1290
pos = 14,1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3050, Explod]
type = Explod
trigger1 = animelem=7
anim =3006
ID =3006
pos = 70,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3050, Explod]
type = Explod
trigger1 = animelem=17
anim =3006
ID =3006
pos = 110,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3050, Explod]
type = Explod
trigger1 = animelem=27
anim =3006
ID =3006
pos = 150,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3050, Power Geyser]
type = Helper
trigger1 = AnimElem = 7
id = 3065
name = "PowerGeyser"
pos = 70,0
postype = P1
stateno = 3065
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3050, Power Geyser]
type = Helper
trigger1 = AnimElem = 17
id = 3065
name = "PowerGeyser"
pos = 110,0
postype = P1
stateno = 3065
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3050, High Angled Geyser]
type = Helper
trigger1 = AnimElem = 27
id = 3066
name = "HighAngledGeyser"
pos = 150,0
postype = P1
stateno = 3066
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Burning
[Statedef 3100]
type=S
physics=S
movetype=A
anim=3100
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3100
trigger1 = AnimElemNo(0) = [1,3]
value = SCA
time = 1

[State 3100, Superpause FX]
type = helper
trigger1 = Time = 3
;helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -84
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdz", 2, ifElse(command = "holdy", 1, 0))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 3100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3102, ifElse(var(10) = 1, 3101, 3100))

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 3100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 3100, velset]
type = VelSet
trigger1 = animelem = 4
x = 10
y = ifElse(var(10) = 2, -2, ifElse(var(10) = 1, -1.5, -1))

[State 3100, veladd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.15625

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
;helpertype = Normal
stateNo = 8103
ID = 8100
name = "Jump Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
ID = 3100
attr = A, HA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = 0, 0
getpower = 0, 0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = -1

[State 3100, TargetState]
type = TargetState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3100
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
value = 3110

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105


;Burning Landing (Missed)
[StateDef 3105]
type = S
anim = 3105
physics = N
moveType = I

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 3105, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) < 0
x = 0.88

[State 3105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3105, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Burning Success
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3110, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3110, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(89) < 0
pos = 50,0

[State 3110, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(89) < 0
edge = 80,0

[State 3110, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3110, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3110, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 89
value = 3100,2
channel = 0

[State 3110, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time || AnimElem = 6 || AnimElem = 11
value = 1,0

[State 3110, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1,1

[State 3110, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 40 || AnimElem = 62 || AnimElem = 72 || AnimElem = 79
value = 1,2

[State 3110, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,3

[State 3110, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1,4

[State 3110, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 56
value = 1,5

[State 3110, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 90
value = 1,2
channel = 1

[State 3110, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 90
value = 40,0
channel = 4

[State 3110, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(90) >= 0
stateType = A
physics = N

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 90
;helpertype = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 90
x = 7.12493896484375
y = -10.5

[State 3110, VelMul]
type = VelMul
trigger1 = AnimElemTime(90) > 0
x= 0.85415699024616813748258244310265

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(90) > 0
y = 0.5

[State 3110, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7
trigger1 = var(35) := 76 || var(36) := -86
trigger2 = AnimElem = 12
trigger2 = var(35) := 54 || var(36) := -85
trigger3 = AnimElem = 17
trigger3 = var(35) := 72 || var(36) := -98
trigger4 = AnimElem = 26
trigger4 = var(35) := 85 || var(36) := -74
trigger5 = AnimElem = 28
trigger5 = var(35) := 45 || var(36) := -50
trigger6 = AnimElem = 34
trigger6 = var(35) := 82 || var(36) := -77
trigger7 = AnimElem = 41
trigger7 = var(35) := 48 || var(36) := -78
trigger8 = AnimElem = 49
trigger8 = var(35) := 84 || var(36) := -77
trigger9 = AnimElem = 57
trigger9 = var(35) := 83 || var(36) := -57
trigger10 = AnimElem = 64
trigger10 = var(35) := 53 || var(36) := -69
trigger11 = AnimElem = 73
trigger11 = var(35) := 71 || var(36) := -79
trigger12 = AnimElem = 81
trigger12 = var(35) := 40 || var(36) := -106

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 12 || AnimElem = 34 || AnimElem = 49 || AnimElem = 57 || AnimElem = 81
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
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
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 17 || AnimElem = 26 || AnimElem = 41 || AnimElem = 64 || AnimElem = 73
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3110, Koho Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 89
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -16.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -16.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 24
envShake.ampl = 4
envShake.freq = 120

[State 3110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(90) >= 0
moveType = I

[State 3110, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111


;Burning Land
[Statedef 3111]
type=S
physics=N
movetype=I
anim=3111
ctrl=0
velset=0,0
sprpriority=1

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && roundstate = 2 && enemy, stateno != 1455
triggerall = p2statetype != A ;&& p2bodydist x < 60 && numenemy
trigger1 = animelem = 2
value = ifelse((power = [1000, 1999]), 3300, 3300)

;---------------------------
;Burning Target
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

[State 3115, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3116


;Sliding
[StateDef 3116]
type = S
movetype = H
physics = S

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5017

[State 3116, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3116, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;MAX Burn
[Statedef 3150]
type=S
physics=S
movetype=A
anim=3150
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3150, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3150, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 2
time = 1
value = SCA

[State 3150, Superpause FX]
type = helper
trigger1 = Time = 3
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = 0, -84
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3150, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
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
value = 1200,1
channel = 1

[State 3100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 3100, Velocity]
type = VelSet
trigger1 = AnimElem = 4
x = 10
y = -2

[State 3100, Gravity]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.15625

[State 40, Dust]
type = helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8103
ID = 8100
name = "Jump Dust"
postype = p1
pauseMoveTime = 255
superMoveTime = 255
ownpal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 4
ID = 3150
attr = A, HA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = 0, 0
getpower = 0, 0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = -1

[State 3100, TargetState]
type = TargetState
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3150
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
value = 3160

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105


;MAX Burn Success
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3160, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3160, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(141) < 0
pos = 50,0

[State 3160, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(141) < 0
edge = 80,0

[State 3160, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3160, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3160, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time || AnimElem = 6 || AnimElem = 11
value = 1,0

[State 3160, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 63 || AnimElem = 80 || AnimElem = 95
value = 1,1

[State 3160, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 40 || AnimElem = 49 || AnimElem = 56 || AnimElem = 88
trigger2 = AnimElem = 111 || AnimElem = 120 || AnimElem = 126 || AnimElem = 136
value = 1,2

[State 3160, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,3

[State 3160, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1,4

[State 3160, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 72 || AnimElem = 104
value = 1,5

[State 3160, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 143
value = 1,2
channel = 1

[State 3160, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 143
value = 40,0
channel = 4

[State 3160, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(143) >= 0
stateType = A
physics = N

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 143
;helpertype = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 143
x = 1.494781494140625
y = -5.5

[State 3160, VelMul]
type = VelMul
trigger1 = AnimElemTime(143) > 0
x= 0.85415699024616813748258244310265

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(143) > 0
y = 0.5

[State 3160, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 12
trigger1 = var(31) := 0
trigger2 = AnimElem = 65 || AnimElem = 82 || AnimElem = 97
trigger2 = var(31) := 1
trigger3 = AnimElem = 41 || AnimElem = 50 || AnimElem = 57 || AnimElem = 89 || AnimElem = 112 || AnimElem = 121 || AnimElem = 129 || AnimElem = 137
trigger3 = var(31) := 2
trigger4 = AnimElem = 17
trigger4 = var(31) := 3
trigger5 = AnimElem = 34
trigger5 = var(31) := 4
trigger6 = AnimElem = 26 || AnimElem = 73 || AnimElem = 105
trigger6 = var(31) := 5

[State 3160, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7
trigger1 = var(35) := 55 || var(36) := -82
trigger2 = AnimElem = 12
trigger2 = var(35) := 35 || var(36) := -86
trigger3 = AnimElem = 17
trigger3 = var(35) := 46 || var(36) := -80
trigger4 = AnimElem = 26
trigger4 = var(35) := 63 || var(36) := -22
trigger5 = AnimElem = 28
trigger5 = var(35) := 76 || var(36) := -67
trigger6 = AnimElem = 34
trigger6 = var(35) := 85 || var(36) := -58
trigger7 = AnimElem = 41 || AnimElem = 112
trigger7 = var(35) := 63 || var(36) := -69
trigger8 = AnimElem = 50 || AnimElem = 121
trigger8 = var(35) := 40 || var(36) := -72
trigger9 = AnimElem = 57 || AnimElem = 89
trigger9 = var(35) := 54 || var(36) := -72
trigger10 = AnimElem = 65 || AnimElem = 98
trigger10 = var(35) := 66 || var(36) := -71
trigger11 = AnimElem = 73 || AnimElem = 105
trigger11 = var(35) := 81 || var(36) := -85
trigger12 = AnimElem = 82
trigger12 = var(35) := 52 || var(36) := -18
trigger13 = AnimElem = 129
trigger13 = var(35) := 30 || var(36) := -115
trigger14 = AnimElem = 137
trigger14 = var(35) := 40 || var(36) := -75

[State 3160, HitDef: High]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 12 || AnimElem = 34 || AnimElem = 65 || AnimElem = 73
trigger2 = AnimElem = 97 || AnimElem = 105 || AnimElem = 129
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
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
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, HitDef: Low]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 17 || AnimElem = 26
trigger2 = AnimElem = 41 || AnimElem = 50  || AnimElem = 57 || AnimElem = 81
trigger3 = AnimElem = 89 || AnimElem = 112 || AnimElem = 121 || AnimElem = 137
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
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
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3160, Koho Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 142
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Koho Hit 2/3]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 143
trigger2 = AnimElem = 144
attr = A, HA
hitFlag = MAF
guardFlag = MA
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(145) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161


;MAX Burn Finish
[StateDef 3161]
type = S
anim = 3161
physics = N
moveType = A
velSet = 0,0

[State 3161, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3161, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3161, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3161, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3161, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 3161, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 3161, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
stateType = A
physics = N

[State 3161, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
;helpertype = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3161, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 5.12493896484375
y = -11

[State 3161, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x= 0.85415699024616813748258244310265

[State 3161, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.5

[State 3161, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = vel x
y = -2

[State 3161, PalFXWiz]
type = PalFX
trigger1 = !Time
time = 40
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0


[State 3161, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Hit 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = MA
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 3]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 = AnimElem = 7
attr = A, HA
hitFlag = MAF
guardFlag = MA
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 4]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = MA
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
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
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 5]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 9
attr = A, HA
hitFlag = MAF
guardFlag = MA
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 28,28
guard.pauseTime = 28,28
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111

;---------------------------------------------------------------------------
;Overheat Geyser
[Statedef 3200]
type=S
physics=N
movetype=A
anim=3200
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[state 3200,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,0
channel = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,0
channel = 1

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3200
trigger1 = AnimElemNo(0) = [1,6]
value = SCA
time = 1

[State 3200, Superpause FX]
type = helper
trigger1 = Time = 3
;helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 42, -30
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Explod]
type = Explod
trigger1 = AnimElem=4
anim = 6044
ID = 6044
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 30
removeongethit = 1
ignorehitpause = 1

[State 3200, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(4)
X = 23.5582046508789

[State 3200, VelMul]
Type = VelMul
Trigger1 	= 1
X = 0.860690295696259

[State 3200, Width]
Type = Width
Trigger1 = Animelem = 12, >= 0
edge = 50,0

[State 3200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
statetype = A
physics = N

[State 3200, Dust]
type = helper
trigger1 = AnimElem=10
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3200, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(10)
X = 0.2;03036460874204875148632580261593

[State 3200, VelAdd]
Type = VelAdd
Trigger1 = AnimelemTime(10) >= 0
X = 0.109036860879904875148632580261593
Y = 0.609036860879904875148632580261593

[State 3200, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(10)
Y = -10.9310344827586206896551724137931

[State 3200, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 6
id = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,5
getPower = 0,0
givePower = 36, 36
pauseTime = 23,25
guard.pauseTime = 23,25
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = low
air.type = high
ground.hitTime = 32
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 2,0
ground.cornerPush.velOff = 0
guard.velocity = 0
airguard.velocity = 0, -7.51851892471313
guard.cornerPush.velOff = 0
air.velocity = 0, -7.51851892471313
air.cornerPush.velOff = 0
yAccel = 0.58333333
fall = 0
fall.recover = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -53
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3200, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 10
id = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,3
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = low
air.type = high
ground.hitTime = 16
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = -1.8279581069946, -6.4
ground.cornerPush.velOff = 0
guard.velocity = -2
airguard.velocity = -4.8279581069946, -6.4
guard.cornerPush.velOff = 0
air.velocity = -1, -7.4
air.cornerPush.velOff = 0
yAccel = 0.426666666666666666666666666666667
fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3200, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 11 || Animelem = 12
id = 3200
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,2
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = high
air.type = high
ground.hitTime = 16
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = -1.5, -7.4
ground.cornerPush.velOff = 0
guard.velocity = -4.5
airguard.velocity = -4.5, -7.4
guard.cornerPush.velOff = 0
air.velocity = -1.5, -6.4
air.cornerPush.velOff = 0
yAccel = 0.426666666666666666666666666666667
fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 56), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3200, PosSet]
Type = PosSet
Trigger1 = Pos Y >= 0
Y = 0

[State 3200, ChangeState]
Type = ChangeState
Trigger1 = Pos Y >= 0 && Vel Y > 0
Value = 3201

;---------------------------------------------------------------------------
;Overheat Geyser (Land)
[Statedef 3201]
type=S
physics=N
movetype=A
anim=3201
ctrl=0
velset=0,0
sprpriority=1
poweradd=0

[state 3201,Posset]
type=posset
trigger1=!time
y=0

[State 3201, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3201
trigger1 = AnimElemNo(0) = [1,2]
value = SCA,NP,SP;,HP
time = 1

[State 3201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3201, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,1
channel = 0

[State 3201, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,1
channel = 1

[State 3201, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s2000,1

[State 3201, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s1100,1

[State 3201, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000, 2
  
[State 3201, Fire1]
type = Explod
trigger1 = AnimElem = 2
Anim = 1290
pos = 64,1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3201, Explod]
type = Explod
trigger1 = animelem =2
anim = 3003
ID = 3003
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3201, Explod]
type = Explod
trigger1 = animelem =2
anim = 3007
ID = 3007
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3201, Over Heat Geyser]
type = Helper
trigger1 = AnimElem = 1
id = 3205
name = "OverOverGeyser"
pos = 60,0
postype = P1
stateno = 3205
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3201, Explod]
type = Explod
trigger1 = animelem=2
anim =3006
ID =3006
pos = 63,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Overheat Geyser
[Statedef 3250]
type=S
physics=N
movetype=A
anim=3251
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[state 3250,Posset]
type=posset
trigger1=!time
y=0

[State 3250, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,0
channel = 0

[State 3250, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,0
channel = 1

[State 3250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3250, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3250, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3250, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3250, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3250
trigger1 = AnimElemNo(0) = [1,4]
value = SCA
time = 1

[State 3250, Superpause FX]
type = helper
trigger1 = Time = 3
;helpertype = normal
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = 41, -29
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3250, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Explod]
type = Explod
trigger1 = AnimElem=4
anim = 6044
ID = 6044
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 30
removeongethit = 1
ignorehitpause = 1

[State 3250, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(4)
X = 32.5582046508789
  
[State 3250, VelAdd]
Type = VelAdd
Trigger1 = !MoveHit
Trigger2 = !AnimelemTime(5)
X = 0

[State 3250, VelMul]
Type = VelMul
Trigger1 = 1
X = 0.860690295696259

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = !Time
id = 3250
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 10,5
getPower = 0,0
givePower = 36, 36
pauseTime = 43,45
guard.pauseTime = 43,45
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 5,0
ground.cornerPush.velOff = 0
guard.velocity = 0
airguard.velocity = 0, -7.51851892471313
guard.cornerPush.velOff = 0
air.velocity = 0, -7.51851892471313
air.cornerPush.velOff = 0
yAccel = 0.58333333
fall = 0
fall.recover = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -53
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3500, TargetState]
type = TargetState
trigger1 = NumTarget(3250)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3250
ignoreHitPause = 1
persistent = 0

[State 3250, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 3250, ChangeState]
type = ChangeState
trigger1 = moveHit
value = 3251
ignorehitpause = 0

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Overheat Geyser
[Statedef 3251]
type=S
physics=N
movetype=A
anim=3250
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[state 3250,Posset]
type=posset
trigger1=!time
y=0

[State 3250, Width]
Type = Width
Trigger1 = Animelem = 13, >= 0
edge = 50,0

[State 3250, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
statetype = A
physics = N

[State 3250, Dust]
type = helper
trigger1 = AnimElem=9
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3250, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(1)
Trigger2 = !AnimelemTime(3)
Trigger3 = !AnimelemTime(6)
X = 3.5582046508789
  
[State 3250, VelAdd]
Type = Velset
Trigger1 = !AnimelemTime(2)
Trigger2 = !AnimelemTime(4)
Trigger3 = !AnimelemTime(7)
X = 0

[State 3250, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(9)
X = 0.2;03036460874204875148632580261593

[State 3250, VelAdd]
Type = VelAdd
Trigger1 = AnimelemTime(9) >= 0
X = 0.203036560870904875142632510261503
Y = 0.609036860879904875148632580261593

[State 3250, VelAdd]
Type = VelAdd
Trigger1 = !AnimelemTime(9)
Y = -11.9310344827586206896551724137931

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 1 
id = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 10,5
getPower = 0,0
givePower = 36, 36
pausetime = ceil(9*(2-(var(20)>0))/2),ceil(9*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
airguard.velocity = 0, -7.51851892471313
guard.cornerPush.velOff = 0
air.velocity = 0, -7.51851892471313
air.cornerPush.velOff = 0
yAccel = 0.58333333
fall = 0
fall.recover = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -81
palfx.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 3 
id = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 10,5
getPower = 0,0
givePower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
airguard.velocity = 0, -7.51851892471313
guard.cornerPush.velOff = 0
air.velocity = 0, -7.51851892471313
air.cornerPush.velOff = 0
yAccel = 0.58333333
fall = 0
fall.recover = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 54), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 6
id = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,5
getPower = 0,0
givePower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 32
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
airguard.velocity = 0, -7.51851892471313
guard.cornerPush.velOff = 0
air.velocity = 0, -7.51851892471313
air.cornerPush.velOff = 0
yAccel = 0.58333333
fall = 0
fall.recover = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 58), var(36) := -67
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = AnimElem = 9
id = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,3
getPower = 0,0
givePower = 36, 36
pausetime = ceil(9*(2-(var(20)>0))/2),ceil(9*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = -1.8279581069946, -6.4
ground.cornerPush.velOff = 0
guard.velocity = -2
airguard.velocity = -4.8279581069946, -6.4
guard.cornerPush.velOff = 0
air.velocity = -1, -7.4
air.cornerPush.velOff = 0
yAccel = 0.426666666666666666666666666666667
fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 31), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3250, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = AnimElem = 11
id = 3251
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = 15,2
getPower = 0,0
givePower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = high
air.type = high
ground.hitTime = 16
ground.slideTime = 0
guard.slidetime = 0
guard.hitTime = 30
air.hitTime = 13
ground.velocity = -1.5, -7
ground.cornerPush.velOff = 0
guard.velocity = -1.5
airguard.velocity = -1.5, -7
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.426666666666666666666666666666667
fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 39), var(36) := -73
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3250, PosSet]
Type = PosSet
Trigger1 = Pos Y >= 0
Y = 0

[State 3250, ChangeState]
Type = ChangeState
Trigger1 = Pos Y >= 0 && Vel Y > 0
Value = 3252

;---------------------------------------------------------------------------
;MAX Overheat Geyser (Land)
[Statedef 3252]
type=S
physics=N
movetype=A
anim=3255
ctrl=0
velset=0,0
sprpriority=1
poweradd=0

[state 3251,Posset]
type=posset
trigger1=!time
y=0

[State 3251, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3251
trigger1 = AnimElemNo(0) = [1,2]
value = SCA,NP,SP;,HP
time = 1

[State 3251, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,1
channel = 0

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3200,1
channel = 1

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 12
value = s2000,1

[State 3251, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 12
value = s1100,1

[State 3251, Effect]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 12
value = 3000, 2

[State 3251, Explod]
type = Explod
trigger1 = animelem = 2
anim = 3003
ID = 3003
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3251, Explod]
type = Explod
trigger1 = animelem = 2
anim = 3007
ID = 3007
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3251, Explod]
type = Explod
trigger1 = animelem = 12
anim = 3003
ID = 3003
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3251, Explod]
type = Explod
trigger1 = animelem = 12
anim = 3007
ID = 3007
pos = 50,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3251, Explod]
type = Explod
trigger1 = animelem = 9
anim = 3096
ID = 3096
pos = 0,2
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = 1,1
sprpriority = 2
ontop = 0
ownpal = 1
removetime = 18
removeongethit = 0
ignorehitpause = 1

[State 3251, MAX Over Heat Geyser]
type = Helper
trigger1 = AnimElem = 2
id = 3055
name = "MAXOverHeatGeyser"
pos = 60,0
postype = P1
stateno = 3055
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3251, MAX Over Heat Geyser]
type = Helper
trigger1 = AnimElem = 12
id = 3056
name = "MAXOverHeatGeyser"
pos = 60,0
postype = P1
stateno = 3056
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3251, Explod]
type = Explod
trigger1 = animelem= 12
anim =3006
ID =3006
pos = 63,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3251, Explod]
type = Explod
trigger1 = animelem= 12
anim =3006
ID =3006
pos = 63,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =0

[State 3251, Fire1]
type = Explod
trigger1 = AnimElem = 2 
Anim = 1290
pos = 64,1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3251, Fire1]
type = Explod
trigger1 = AnimElem = 12 
Anim = 1290
pos = 14,1
postype = p1
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = 1,1

[State 3251, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Buster Wolf
[Statedef 3300]
type=S
physics=S
movetype=A
anim=3300
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[state 3300,Posset]
type=posset
trigger1=!time
y=0

[State 3300, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3300, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3300, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3300, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3300
trigger1 = AnimElemNo(0) = [1,10]
value = SCA,NP,SP;,HP
time = 1

[State 3300, Superpause FX]
type = helper
trigger1 = Time = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 6, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = Time = 3
time = 41
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3300,0
channel = 0

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 16
y = -2;-(var(5)*.5)

[State 3300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = 0.21875

[State 3300, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 9
StateType = A
physics = N

[State 3300, Explod]
type = Explod
trigger1 = animelem =9
anim = 6644
ID = 6644
pos = 82,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 24
removeongethit = 1
ignorehitpause = 1

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
Anim = 6186
pos = 5, 0
postype = p1
facing = 1
ownpal = 1
sprpriority = 3
supermovetime = -1
scale = .5,.5

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
anim = 3306
pos = 70,-71
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
removetime = -1
ID = 3306
sprpriority = 2
scale = .5,.5

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
anim = 3307
pos = 70,-71
postype = p1
ownpal = 1
bindtime = 1
vel = -.6,0
removeongethit = 1
pausemovetime = 255
removetime = -2
ID = 3307
sprpriority = 3
scale = .5,.5

[State 3300, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = !Time
id = 3300
attr = S, HA
hitFlag = MAF
guardFlag = MA
;priority = 7, Hit
damage = 60,5
getPower = 0,0
givePower = 36, 36
pauseTime = 15,15
guard.pauseTime = 15,15
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.slidetime = 30
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 5
ground.cornerPush.velOff = 0
guard.velocity = -9
airguard.velocity = -4.5,-4.5
guard.cornerPush.velOff = 0
air.velocity = 2,-2.5
air.cornerPush.velOff = 0
yaccel = .49
persistent = 0
fall = 0
Air.Fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 76), var(36) := -72
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
ForceStand = 1

[State 3300, ChangeState]
type = ChangeState
triggerall = !AnimTime;animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3301

[State 3300, ChangeState]
type = ChangeState
triggerall = animelemtime(9) > 0
trigger1 = moveContact
value = 3302
ignorehitpause = 0

;--------------------------------------------
;Buster Wolf (Miss)
[Statedef 3301]
type = S
physics = S
movetype=I
ctrl = 0
anim = 3301
velset = 0,0
sprpriority=1

[state 3301,Posset]
type=posset
trigger1=!time
y=0

[State 3301, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 3306

[State 3301, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 3301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------
;Buster Wolf Hit
[Statedef 3302]
type=S
physics=N
movetype=I
ctrl = 0
anim = 3302
movehitpersist = 1
sprpriority=1

[state 3302,Posset]
type=posset
trigger1=!time
y=0

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 3306

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 3302, VelSet]
type = VelSet
trigger1 = !Time
X = 0
Y = 0

[State 3302, Velmul]
type = Velmul
trigger1 = !Time
x = .92

[State 3302, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3302, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
ampl = 8

[State 3302, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3300,1
channel = 0

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3300,2
channel = 2

[State 3302, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3304
ID = 3304
pos = -100,0
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 3202, Buster Wolf]
type = Helper
trigger1 = AnimElem = 4
id = 3305
name = "BusterWolf"
pos = -13,0
postype = P1
stateno = 3305
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3302, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 3302, Power Geyser Chain]
type = changestate
triggerall = power >= 1000 
trigger1 = Anim = 3302
trigger1 = AnimElemNo(0) = [5,18]
trigger1 = command = "PowerGeyser" && RoundState = 2
value = 3000

;---------------------------------------------------------------------------
;MAX Buster Wolf
[Statedef 3350]
type=S
physics=S
movetype=A
anim=3300
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[state 3350,Posset]
type=posset
trigger1=!time
y=0

[State 3300, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3300, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3300, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3300, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3350, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3350
trigger1 = AnimElemNo(0) = [1,9]
value = SCA,NP,SP;,HP
time = 1

[State 3300, Superpause FX]
type = helper
trigger1 = Time = 3
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = 6, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = Time = 3
time = 41
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3300,0
channel = 1

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 16
y = -2;-(var(5)*.5)

[State 3300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = 0.21875

[State 3300, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 9
StateType = A
physics = N

[State 3300, Explod]
type = Explod
trigger1 = animelem =9
anim = 6644
ID = 6644
pos = 82,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 24
removeongethit = 1
ignorehitpause = 1

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
Anim = 6186
pos = 5, 0
postype = p1
facing = 1
ownpal = 1
sprpriority = 3
supermovetime = -1
scale = .5,.5

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
anim = 3306
pos = 70,-71
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
removetime = -1
ID = 3306
sprpriority = 2
scale = .5,.5

[State 3300, Explod]
type = Explod
trigger1 = AnimElem = 9
anim = 3307
pos = 70,-71
postype = p1
ownpal = 1
bindtime = 1
vel = -.6,0
removeongethit = 1
pausemovetime = 255
removetime = -2
ID = 3307
sprpriority = 3
scale = .5,.5

[State 3300, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = !Time
id = 3350
attr = S, HA
hitFlag = MAF
guardFlag = MA
;priority = 7, Hit
damage = 10,5
getPower = 0,0
givePower = 36, 36
pauseTime = 15,15
guard.pauseTime = 15,15
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.slidetime = 30
guard.hitTime = 30
air.hitTime = 13
ground.velocity = 5
ground.cornerPush.velOff = 0
guard.velocity = -9
airguard.velocity = -4.5,-4.5
guard.cornerPush.velOff = 0
air.velocity = 2,-0.5
air.cornerPush.velOff = 0
yaccel = .49
persistent = 0
fall = 0
Air.Fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 76), var(36) := -72
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
ForceStand = 1

[State 3300, ChangeState]
type = ChangeState
triggerall = !AnimTime;animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3301

[State 3300, ChangeState]
type = ChangeState
triggerall = animelemtime(9) > 0
trigger1 = moveHit
value = 3352
ignorehitpause = 0

;--------------------------------------------------
;MAX Buster Wolf Hit
[Statedef 3352]
type=S
physics=N
movetype=I
ctrl = 0
anim = 3302
movehitpersist = 1
sprpriority=1

[state 3352,Posset]
type=posset
trigger1=!time
y=0

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 3306

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 3302, VelSet]
type = VelSet
trigger1 = !Time
X = 0
Y = 0

[State 3302, Velmul]
type = Velmul
trigger1 = !Time
x = .92

[State 3302, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3302, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
ampl = 8

[State 3302, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3300,1
channel = 1

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3300,2
channel = 2

[State 3302, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3304
ID = 3304
pos = -100,0
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 3302, Explod]
type = null; Explod
trigger1 = animelem = 5
anim = 3305
ID = 3305
pos = 0,0
postype = p1
bindtime = 1
removetime = 4
scale = 2,2
sprpriority = 9
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 3202, MAX Buster Wolf]
type = Helper
trigger1 = AnimElem = 4
id = 3306
name = "MAXBusterWolf"
pos = -13,0
postype = P1
stateno = 3306
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3302, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;Trinity Geyser
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[state 3400,Posset]
type=posset
trigger1=!time
y=0

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
trigger1 = Anim = 3400
trigger1 = AnimElemNo(0) = [1,31]
value = SCA,NP,SP,HP
time = 1

[State 3400, PlayerPush]
type = PlayerPush
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType = A || EnemyNear, StateType = L
value = 0
ignoreHitPause = 1

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 2
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = -27, -92
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

;--------------
[State 3400, Super Zoom]
type = Helper
trigger1 = !time  && NumHelper(259) = 0
name = "P1ZOOM"
ID = 259
pos = 0,0
stateno = 259
sprpriority = 3
ownpal = 1
pausemovetime = 20
supermovetime = 20
[State 3400, VarSet]
type = VarSet
trigger1 = !Time 
var(52) = 3403
;--------------

[State 3400, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 3400, Voice]
type = PlaySnd
trigger1 = !Time
value = s3400,1
;channel = 1
[State 3400, Voice]
type = PlaySnd
trigger1 = !Time
value = s3400,1
;channel = 1

[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = s3400,0
;channel = 1
[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = s3400,0
;channel = 1

[State 3400, SND FX]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14
value = s2000,1
channel=0

[State 3400, SND FX]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14
value = s1100,1
channel=0

[State 3400, SND FX]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14
value = 3000, 2
channel = 0

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(5)<0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 3400, Explod]
type = Explod
trigger1 = animelem= 5
anim =3401
ID =3401
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = .3,.5
sprpriority = 3
removeongethit =0

[State 3400, Explod]
type = Explod
trigger1 = animelem= 8
anim =3401
ID =3401
pos = 100,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = .3,.5
sprpriority = 3
removeongethit =0

[State 3400, Explod]
type = Explod
trigger1 = animelem= 11
anim =3401
ID =3401
pos = 200,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = .3,.5
sprpriority = 3
removeongethit =0

[State 3400, Explod]
type = Explod
trigger1 = animelem= 14
anim =3401
ID =3401
pos = 300,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = .3,.5
sprpriority = 3
removeongethit =0

[State 3400, Dust]
type = explod
trigger1 = AnimElem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3400, Trinity Geyser]
type = Helper
trigger1 = AnimElem = 5
id = 3405
name = "TrinityGeyser"
pos = 0,0
postype = P1
stateno = 3405
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .575
size.yscale = .657

[State 3400, Trinity Geyser]
type = Helper
trigger1 = AnimElem = 8
id = 3405
name = "TrinityGeyser"
pos = 100,0
postype = P1
stateno = 3405
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .575
size.yscale = .657

[State 3400, Trinity Geyser]
type = Helper
trigger1 = AnimElem = 11
id = 3405
name = "TrinityGeyser"
pos = 200,0
postype = P1
stateno = 3405
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .575
size.yscale = .657

[State 3400, Trinity Geyser]
type = Helper
trigger1 = AnimElem = 14
id = 3405
name = "TrinityGeyser"
pos = 300,0
postype = P1
stateno = 3405
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .575
size.yscale = .657

[State 3400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------
;Rising Force
[StateDef 3500]
type = S
physics = S
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0

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
trigger1 = Anim = 3500
trigger1 = AnimElemNo(0) = [1,9]
value = SCA,NP,SP,HP
time = 1

[State 3500, PlayerPush]
type = PlayerPush
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType = A || EnemyNear, StateType = L
value = 0
ignoreHitPause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 2
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 11, -63
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Terrys Spirit]
type = helper
trigger1 = animelem = 8
id = 3505
pos = 0, 0 ;50
postype = p1
facing = 1
stateno = 3505
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
persistent = 0

[State 3500, Play Snd]
type = PlaySnd
trigger1 = !Time
value = 1400,1
channel = 0
persistent = 0

[State 3500, Play Snd]
type = PlaySnd
trigger1 = !Time
value = 1400,1
channel = 0
persistent = 0

[State 3500, Explod]
type = Explod
trigger1 = animelem = 9
anim = 6644
ID = 6644
pos = 82,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 24
removeongethit = 1
ignorehitpause = 1

[State 3500, FX]
type = Explod
trigger1 = AnimElem = 9
anim = 2290
pos = 90,-76
postype = p1
ownpal = 1
bindtime = 9999
removeongethit = 1
ignorehitpause = 1
ID = 2290
sprpriority = 3
scale = .5,.5

[State 3500, Vel Set]
type = VelSet
trigger1 = animelem = 9
x = 29
y = -0.5

[State 3500, Vel Add]
type = VelAdd
trigger1 = animelemtime(9) > 0 
y = 0.15625

[State 3500, State Type set]
type = StateTypeSet
trigger1 = AnimElem = 9
statetype = A
physics = N

[State 3500, Dust]
type = helper
trigger1 = AnimElem = 9
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3500, TargetBind]
type = TargetBind
trigger1 = movehit;NumTarget && AnimElemTime(6) < 0
pos = 30,0

[State 3500, Hit]
type = HitDef
triggerall = !var(16) && var(15) < 2
trigger1 = !Time;animelemno(0) = [9,13]
id = 3500
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 7, Hit
damage = 150
getPower = 0,0
givePower = 36, 36
pausetime = ceil(18*(2-(var(20)>0))/2),ceil(18*(2-(var(20)>0))/2)
guard.pausetime = ceil(15*(2-(var(20)>0))/2),ceil(15*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 40
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.hittime = 120
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.ampl = 7       
envshake.freq = 50
envshake.time = 20 
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 92), var(36) := -75
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0
ForceStand = 1
p2Facing = -1

[State 3500, TargetState]
type = TargetState
trigger1 = NumTarget(3500)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3500
ignoreHitPause = 1
persistent = 0

[State 3500, Change State]
type = ChangeState
trigger1 = movehit && numtarget(3500)
value = 3502
ignorehitpause = 0

[State 3500, Change State]
type = ChangeState
triggerall = AnimElemTime(9) > 0
trigger1 = Vel Y + Pos Y >= 0
value = 3501

;-------------------------------
;Rising Force Miss
[StateDef 3501]
type = s
MoveType = I
VelSet = 0, 0
Anim = 3501
sprpriority = 2 
ctrl=0

[State 3501, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3501, Pos Set]
type = PosSet
trigger1=!time
y = 0

[State 3501, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =2290

[State 3501, Change State]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1 

;-------------------------------
;Rising Force Attack
[StateDef 3502]
type = S
MoveType = A
Physics = N
VelSet = 0, 0
Anim = 3503

[State 3502, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3502, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =2290

[State 3502, Pos Set]
type = PosSet
trigger1 = !time
y = 0

[State 3502, Pos Add]
type = PosAdd
trigger1 = animelem = 1
x = 18

[State 3502, Pos Add]
type = PosAdd
trigger1 = animelem = 2
x = 14

[State 3502, Pos Add]
type = PosAdd
trigger1 = animelem = 3
x = 16

[State 3502, Pos Add]
type = PosAdd
trigger1 = animelem = 5
trigger2 = animelem = 7
x = 8

[State 3502, Vel Set]
type = VelSet
trigger1 = animelemtime(8) >= 0 && animelemtime(21) < 0
x = (8*exp((-0.15764085357327987476627784162604)*(time-22)))

[State 3502, Vel Set]
type = VelSet
trigger1 = animelem = 21
x = 0

[State 3502, vel Set]
type = VelSet
trigger1 = animelem = 8
y = -13

[State 3502, vel Add]
type = VelAdd
trigger1 = animelemtime(8) > 0 
y = 0.51171875

[State 3502, Play Sound]
type = PlaySnd
trigger1 = animelem = 8
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
value = 1100,2

[State 3502, State Type Set]
type = StateTypeSet
trigger1 = AnimElem = 8
statetype = A
physics = N

[State 3502, Dust]
type = helper
trigger1 = AnimElem = 8
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3502, Explod]
type = Explod
trigger1 = animelem=9
anim = 3505
ID = 3505
pos = -2,-130
postype = p1
bindtime = 999999
removetime = -1
scale = .7,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
  
[State 3502, Explod]
type = Explod
trigger1 = animelem = 9
anim = 3506
ID = 3506
pos = 20,10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 18
removeongethit = 1
ignorehitpause = 1

[State 3502, Explod]
type = Explod
trigger1 = animelem = 9
anim = 3506
ID = 3506
pos = 60,10
postype = p1
facing = -1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 18
removeongethit = 1
ignorehitpause = 1

[State 3502, Explod]
type = Explod
trigger1 = animelem = 9
anim = 3507
ID = 3507
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 34
removeongethit = 1
ignorehitpause = 1

[State 3502, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 21
id = 3505

[State 3502, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 3
id = 3502
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 7, Hit
damage = 55
getPower = 0,0
givePower = 16,16
pauseTime = 44,45
guard.pauseTime = 44,45
animtype = Hard
air.animtype = up
ground.type = Low
air.type = High
ground.hitTime = 45
ground.slideTime = 45
guard.hitTime = 45
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
fall.yvelocity = -3
air.hittime = 13
air.cornerPush.velOff = 0
yaccel = 0.5
fall = 0
air.fall = 0
ForceStand = 1
envshake.ampl = 7       
envshake.freq = 50
envshake.time = 20 
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 34), var(36) := -54
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3500, Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 7
id = 3502
attr = S, HA
hitFlag = MAF
guardFlag = M
;priority = 7, Hit
damage = 45
getPower = 0,0
givePower = 16,16
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Back
ground.type = Low
air.type = High
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 40
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -2,-17.25
ground.cornerPush.velOff = 0
guard.velocity = -11.1796875
guard.cornerPush.velOff = 0
air.velocity = -2,-17.25
fall.yvelocity = -3
air.hittime = 13
air.juggle = 0
air.cornerPush.velOff = 0
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ForceStand = 1
envshake.ampl = 7       
envshake.freq = 50
envshake.time = 20 
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 22), var(36) := -54
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
kill = 0

[State 3502, Hit]
type = HitDef
trigger1 = animelem = 8
trigger2 = animelem = 10
trigger3 = animelem = 12
trigger4 = animelem = 14
trigger5 = animelem = 16
trigger6 = animelem = 18
trigger7 = animelem = 20
id = 3502
attr = A, HA
hitFlag = MAF
guardFlag = M
;priority = 7, Hit
damage = 25
getPower = 0,0
givePower = 16,16
pauseTime = 2,5
guard.pauseTime = 2,5
animtype = Up
air.animtype = up
ground.type = Low
air.type = High
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 40
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -2,-17.25
ground.cornerPush.velOff = 0
guard.velocity = -11.1796875
guard.cornerPush.velOff = 0
air.velocity = -2,-17.25
fall.yvelocity = -3
air.hittime = 13
air.juggle = 0
air.cornerPush.velOff = 0
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.ampl = 7       
envshake.freq = 50
envshake.time = 20 
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 24), var(36) := -53
palfx.time = 12 * var(9)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 3502, Change State]
type = ChangeState
triggerall = AnimElemTime(8) > 0
trigger1 = Vel Y + Pos Y >= 0
value = 3503

;---------------------
;Rising Force land
[StateDef 3503]
type=S
physics=N
movetype=A
VelSet = 0, 0
Anim = 3504
sprpriority = 2 
ctrl=0
  
[State 3503, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3503, Play Snd]
type = PlaySnd
trigger1 = !time
value =  52,0

[State 3503, Pos Set]
type = PosSet
trigger1 = !time
y = 0

[State 3503, Change State]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1 