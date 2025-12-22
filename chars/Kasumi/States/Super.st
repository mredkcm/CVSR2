; _________________________________________
;| Character by Author Name                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
;Chou Kasane Ate
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3000

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(6) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos=-23,-102
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

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(7) = 1
id = 3005
name = "Kasane Ate"
pos = 50,0
postype = P1
stateno = 3005
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = 1
size.yscale = 1

[State 102, Dust]
type = helper
trigger1=AnimElem=6
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000,7]
type = PlaySnd
trigger1 = !Time
value = 3000, 0
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=6
value = 3000, 1
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=7
value = 1000, 1
channel = 1

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
;MAX Chou Kasane Ate
[StateDef 3050]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3000

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(6) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos=-23,-102
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1=time=3&&var(45)
helperType=Normal
stateNo=8525
ID=8500
name="Superpause FX"
posType = p1
pos = 10,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(7) = 1
id = 3005
name = "Kasane Ate"
pos = 50,0
postype = P1
stateno = 3055
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = 1
size.yscale = 1

[State 102, Dust]
type = helper
trigger1=AnimElem=6
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000,7]
type = PlaySnd
trigger1 = !Time
value = 3000, 0
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=6
value = 3000, 1
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=7
value = 3000, 2
channel = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Shingan Kuzu Otoshi
[Statedef 3100]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3100

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1
[State 3000, Adjust]
type=VarSet
trigger1=1
var(10)=0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 12,-76
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

[State 3100]
type = ReversalDef
trigger1 = Time = 38
attr = S, HT
reversal.attr = SCA, NA, SA, HA
pausetime = 0,0
animtype = up
hitsound = s3,0
p1facing = 1
p2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 3110
p2stateno = 3120
id = 3100

[State 3000,7]
type = PlaySnd
trigger1 = !Time
value = 3100, 0
channel = 0

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
;Shingan Kuzu Otoshi (P1) - 1
[Statedef 3110]
type = S
movetype = A
physics = S
velset = 0, 0
anim = 3110

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && prevstateno = 3150
var(10) = 1

[State 1210, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8018
ID = 8000
name = "Spark"
postype = p1
pos = 6,-85
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,800
[State 3110,13]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2

[State 3520,19]
type = PlaySnd
trigger1 = AnimElem = 12
value = 2,3200
channel = 1
[State 3520,20]
type = PlaySnd
trigger1 = AnimElem = 16
value =S2+10*var(44),2
channel = 1

[State 3520,20]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3100,1
channel = 0

[State 3110,0]
type = ChangeAnim
trigger1 = Time = 0
value = 3110

[State 3110,2]
type = TargetBind
trigger1 = AnimElem = 1
pos = 34,-56
time = 17

[State 3110,3]
type = TargetBind
trigger1 = AnimElem = 4
pos = 24,-62
time = 6

[State 3110,4]
type = TargetBind
trigger1 = AnimElem = 5
pos = 10,-94
time = 6

[State 3110,5]
type = TargetBind
trigger1 = AnimElem = 6
pos = -34,-64
time = 11

[State 3110,6]
type = TargetBind
trigger1 = AnimElem = 7
pos = -18,-64
time = 4

[State 3110,7]
type = TargetBind
trigger1 = AnimElem = 8
pos = -4,-68
time = 3

[State 3110,8]
type = TargetBind
trigger1 = AnimElem = 9
pos = -5,-86
time = 2

[State 3110,9]
type = TargetBind
trigger1 = AnimElem = 10
pos = 35,-96
time = 3

[State 3110,10]
type = TargetBind
trigger1 = AnimElem = 11
pos = 34,-36
time = 2

[State 3110,11]
type = SprPriority
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
value = 1

[State 3110,12]
type = SprPriority
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
value = -1

[State 3110,TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 12
value = -60 - (var(10) * 50)
kill = 0

[State 3110,14]
type = TargetLifeAdd
trigger1 = AnimElem = 16
value = -120 - (var(10) * 100)
id = 3100
kill = 1

[State 3110,19]
type = PlaySnd
trigger1 = AnimElem = 14
value = 900, 1

[State -2, Ground Impact Dust]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1
[State 3005, Spark]
type = helper
trigger1 = AnimElem = 16
helpertype = normal
stateno = 8005
ID = 8000
name = "Spark"
posType = P1
pos = 40,-5
facing = -1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State explod];”š”j0
type = Explod
trigger1 = AnimElem = 16
anim = 3155
id = 3100
sprpriority = -10
postype = p1
pos = 60,0
bindtime = 1
ignorehitpause = 1
supermovetime = 32
pausemovetime = 32
under = 0
ownpal = 1
scale =  Ifelse(var(10),0.5,0.15), Ifelse(var(10),0.5,0.45)

[State explod];”š”j1
type = Explod
trigger1 = AnimElem = 16
anim = 3156
id = 3100
sprpriority = 20
postype = p1
pos = 60,0
bindtime = 1
ignorehitpause = 0
supermovetime = 32
pausemovetime = 32
under = 0
ownpal = 1
scale =  Ifelse(var(10),0.5,0.15), Ifelse(var(10),0.5,0.45)

[State 3110,Shake]
type = EnvShake
trigger1 = AnimElem = 12
trigger2 = AnimElem = 16
time = Ifelse((AnimElem = 12),5,30)
ignorehitpause = 1

[State 3110,27]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------“Š‚°‚ç‚ê‘¤
[Statedef 3120]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 3120,0]
type = ChangeAnim2
trigger1 = Time = 0
value = 3120

[State 3120,1]
type = AssertSpecial
trigger1 = Time >= 0
flag = NoAutoTurn

[State 3120,2]
type = VelAdd
trigger1 = Time >= 54
y = .83

[State 3120,3]
type = ChangeState
trigger1 = Time > 54
trigger1 = Pos Y >= 0
value = 3130

;------------------------
[Statedef 3130]
type = L
movetype = H
physics = N
velset = 0, 0

[State 3130,0]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3130,2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3130

[State 3130,3]
type = VelSet
trigger1 = Time = 45
x = -4.0
y = -5.0

[State 3130,4]
type = VelAdd
trigger1 = Time >= 45
y = .41

[State 3130,9]
type = Turn
trigger1 = Time > 45
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 3130,10]
type = SelfState
trigger1 = Time > 45
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5110

;MAX Shingan Kuzu Otoshi
[Statedef 3150]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3100

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1
[State 3000, Adjust]
type=VarSet
trigger1=1
var(10)=0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 12,-76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1=time=3&&var(45)
helperType=Normal
stateNo=8525
ID=8500
name="Superpause FX"
posType = p1
pos = 10,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3100]
type = ReversalDef
trigger1 = Time = 38
attr = S, HT
reversal.attr = SCA, NA, SA, HA
pausetime = 0,0
animtype = up
hitsound = s3,0
p1facing = 1
p2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 3110
p2stateno = 3120
id = 3100

[State 3000,7]
type = PlaySnd
trigger1 = !Time
value = 3100, 0
channel = 0

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
;Shiranei
[Statedef 3200]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3200

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1
[State 3000, Adjust]
type=VarSet
trigger1=1
var(10)=0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos=3,-82
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

[State 3000,7]
type = PlaySnd
trigger1 = Animelem = 11
value = 1200,1
channel = 0

[State 3100]
type = HitDef
Trigger1 = Time = 0
Trigger1 = p2stateno != [120,169]
attr = S, HT
hitflag = M
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3210
p2stateno = 3220
guard.dist = 0
fall = 1
id = 3200

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shiranei (P1 State)
[Statedef 3210]
type = S
movetype= A
physics = S
anim = 3210
velset = 0,0


[State 1350]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && prevstateno = 3250
var(10) = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500 + (var(10) * 10)
ID = 8500
name = "Superpause FX"
posType = P1
pos=38,-77
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
triggerall = var(45)
trigger1=time=3&&var(10)
helperType=Normal
stateNo=8525
ID=8500
name="Superpause FX"
posType = p1
pos = 10,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0 + (var(10) * 1)
darken = 0


[State 3210]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1200,1

[State 3210]
type = PlaySnd
trigger1 = AnimElemTime(9) = 10
value = 3100,2

[State 3210]
type = PlaySnd
trigger1 = AnimElemTime(9) = 17
value = S2,6

[State 3210]
type = EnvShake
trigger1 = AnimElemTime(9) = 17
time = 20
freq = 80
ampl = 8
phase = 110

[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(9) = 10
anim=3205 + (var(10) * 50)
sprPriority=3
posType=p1
pos=46,-56
scale=0.5 + (var(10) * .1), 0.5 + (var(10) * .1)
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1

[State 3210]
type = TargetBind
trigger1 = AnimElemTime(2) <= 0
pos = 43, 0

[State 3210]
type = velset
trigger1 = AnimElemTime(10) = 0
x = -5

[State 3210]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 3210]
type = TargetLifeAdd
trigger1 = AnimElemTime(9) = 17
value = -180 - (var(10) * 80)
id = 3200

[State 1210, Throw]
type = targetstate
trigger1 = var(10)&&AnimElemTime(9) = 17
value = 4060

[State 3210]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Shiranei (P2 State)
[Statedef 3220]
type = A
movetype= H
physics = N
velset = 0,0

[State 3220]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(9219)
value = 9219

[State 3220]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(9219)
value = 3220

[State 3220]
type = ChangeState
trigger1 = Animtime = 0
trigger1 = SelfAnimExist(9219)
value = 3230

[State 3220]
type = SelfState
trigger1 = Animtime = 0
trigger1 = !SelfAnimExist(9219)
value = 5110

;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 3230]
type = L
movetype= H
physics = N

[State 3230]
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5111)
value = 5111

[State 3230]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 3230]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 3230]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3230]
type = VelSet
trigger1 = Time = 0
y = 0

[State 3230]
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5111)
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5111

[State 3230]
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5110

[State 3230]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 3230]
type = VelMul
trigger1 = 1
x = 0.85

[State 3230]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 3230]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 3680]
type = selfstate
trigger1 = alive
trigger1 = Time = 70
value = 5120

[State 3230]
type = selfstate
trigger1 = !alive
trigger1 = Time = 10
value = 5150

;---------------------------------------------------------------------------
; MAX Shiranei
[Statedef 3250]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3200

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=38
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1
[State 3000, Adjust]
type=VarSet
trigger1=1
var(10)=0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos=3,-82
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1=time=3&&var(45)
helperType=Normal
stateNo=8525
ID=8500
name="Superpause FX"
posType = p1
pos = 10,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1
[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3000,7]
type = PlaySnd
trigger1 = Animelem = 11
value = 3100,1
channel = 0

[State 3100]
type = HitDef
Trigger1 = Time = 0
Trigger1 = p2stateno != [120,169]
attr = S, HT
hitflag = M
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3210
p2stateno = 3220
guard.dist = 0
fall = 1
id = 3200

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Sousei Kasane Ate Ryuukasumi
[Statedef 3500]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-3000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3500

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=95
[State 3000, Super Cancel Flag]
type=VarSet
trigger1=!Time
var(21)=(PrevStateNo=[1000,2999]) && var(6)
[State 3000, Hyper Cancel Flag]
type=VarSet
trigger1=!Time
var(22)=((prevstateno=[3000,4999]) && var(7)) || var(20)
[State 3000, Super Cancel Flash]
type=PalFX
trigger1=var(21) || var(22)
trigger1=!(Time % 2) && Time <=12
time=1
add=255,255,255
ignoreHitPause=1
[State 3000, Super Cancel Juggle Reset]
type=VarSet
trigger1=!Time
trigger1=var(21) || var(22)
var(15)=0
ignoreHitPause=1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos=-23,-102
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 95
moveTime = 95
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0



[State 4650,Helper]
type = Helper
trigger1 = AnimElem = 3 && P2Dist X > -10
helpertype = normal
name = "Unknown"
ID = 3505
pos = - (240 - BackEdgeDist),-150
postype = back
facing = 1
stateno = 3550
keyctrl = 0
ownpal = 0
superMoveTime = 255

[State 4650,Helper]
type = Helper
trigger1 = AnimElem = 3 && P2Dist X <= -10
helpertype = normal
name = "Unknown"
ID = 3505
pos = 240 - FrontEdgeDist,-150
postype = front
facing = -1
stateno = 3550
keyctrl = 0
ownpal = 0
superMoveTime = 255















[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(7) = 1
id = 3005
name = "Kasane Ate"
pos = 50,0
postype = P1
stateno = 3505
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = 1
size.yscale = 1

[State 102, Dust]
type = helper
trigger1=AnimElem=6
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000,7]
type = PlaySnd
trigger1 = !Time
value = 3000, 0
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=6
value = 3000, 1
channel = 0
[State 3000,7]
type = PlaySnd
trigger1=AnimElem=7
value = 1000, 1
channel = 1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1