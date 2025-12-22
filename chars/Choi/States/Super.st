; _________________________________________
;| CVS Choi Bounge by Falcon Rapper        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
; Shin! Chouzetsu Tatsumaki Shinkuu Zan
[Statedef 3000]
type = S
movetype = A
physics = N
anim = 3000
velset = 0, 0
poweradd = -1000
ctrl = 0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 19,-40
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

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = Time = [0,20)
value = SCA

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 3000,0
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4,=0
value = 3000,1

[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -30,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 30,10
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3030,Helper]
type = Helper
trigger1 = !NumHelper(3005) && AnimElem = 4
ID = 3005
pos = 0,0
postype = p1
stateno = 3005
name = "Nail"
keyctrl = 0
ownpal = 1

[State 3030,Wind]
type=Explod
triggerall = !numexplod(3005)
trigger1=AnimElem=4
anim=3005
ID=3005
postype=p1
facing=1
bindtime=-1
removetime=-1
supermove=1
sprpriority=5
scale = .5,.5
ontop=0
ownpal=1
removeongethit=1

[State 3002,VelSet]
type = Velset
trigger1 = Command = "holdfwd" && AnimElem = 8,>0
x = 2.1

[State 3002,VelSet]
type = Velset
trigger1 = Command = "holdback" && AnimElem = 8,>0
x = -2.1

[State 3002,VelSet]
type = Velset
trigger1 = Command != "holdfwd" && Command != "holdback" && AnimElem = 8,>0
x = 0

[State 3000,ChangeState]
type = ChangeState
trigger1 = Time = 170 
value = 3001

; Shin! Chouzetsu Tatsumaki Shinkuu Zan (End)
[Statedef 3001]
type = S
movetype = I
physics = S
anim = 3001
velset = 0, 0
ctrl = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = 1
id= 3055
[State 0, Remove Explods]
type = RemoveExplod
trigger1 = time >= 5
id= 3005

[State 3001, Snd]
type=playsnd
trigger1= animelem=5
value=4,1
channel=0

[State 3000,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; MAX Shin! Chouzetsu Tatsumaki Shinkuu Zan
[Statedef 3050]
type = S
movetype = A
physics = N
anim = 3000
velset = 0, 0
poweradd = -2000
ctrl = 0

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 19,-40
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1=time=3
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

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = Time = [0,20)
value = SCA

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 3000,0
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4,=0
value = 3000,1

[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -30,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 30,10
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3030,Helper]
type = Helper
trigger1 = !NumHelper(3005) && AnimElem = 4,=1
ID = 3005
pos = 0,0
postype = p1
stateno = 3055
name = "Nail"
keyctrl = 0
ownpal = 1

[State 3030,Wind]
type=Explod
triggerall = !numexplod(3005)
trigger1=AnimElem=4
anim=3055
ID=3005
postype=p1
facing=1
bindtime=-1
removetime=-1
supermove=1
sprpriority=5
scale = .5,.5
ontop=0
ownpal=1
removeongethit=1

[State 3002,VelSet]
type = Velset
trigger1 = Command = "holdfwd" && AnimElem = 8,>0
x = 2.1

[State 3002,VelSet]
type = Velset
trigger1 = Command = "holdback" && AnimElem = 8,>0
x = -2.1

[State 3002,VelSet]
type = Velset
trigger1 = Command != "holdfwd" && Command != "holdback" && AnimElem = 8,>0
x = 0

[State 1000, Spark]
type = Explod
trigger1 = AnimElem = 4
Anim = 3056
id = 3055
pos = 20, 0
scale = .25,.25
postype = p1
ownpal = 1
bindtime = -1
sprpriority = 3
removetime = -1

[State 1000, Spark]
type = Explod
trigger1 = AnimElem = 7
Anim = 3056
id = 3055
pos = -20, 0
scale = .25,.25
postype = p1
ownpal = 1
bindtime = -1
sprpriority = 3
removetime = -1


[State 3000,ChangeState]
type = ChangeState
trigger1 = Time = 170 
value = 3001

; Gethit States
[Statedef 3080]
type = A
movetype = H
physics = N
velset = -2,-47
ctrl = 0

[State 1];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = Time = [0,14)
value = SCA

[State 910,PosFreeze]
type = PosFreeze
trigger1 = TimeMod = 2, 0

[State 830,veladd]
type = veladd
trigger1 = 1
y = 1

[State 830,ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3080

[State 830,SelfState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3081

; Gethit States
[Statedef 3081]
type = A
movetype = H
physics = N
velset = -2,-8
ctrl = 0

[State 1];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State 830,ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3081

[State 830,veladd]
type = veladd
trigger1 = 1
y = .5

[State 5100, 2]
type = ChangeAnim
trigger1 = Pos Y >= 0 && Vel Y > 0 
value = IfElse(SelfAnimExist(5052),5052,5050)

[State 830,SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100

; Gethit States
[Statedef 3085]
type = A
movetype = H
physics = N
velset = -2,-27
ctrl = 0

[State 1];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State 903, Shock]
type = PalFX
trigger1 = animelemtime(1) = 1
time = 105
add = 10,10,100
sinadd = -20,-20,-89,8
color = 20

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = Time = [0,14)
value = SCA

[State 910,PosFreeze]
type = PosFreeze
trigger1 = TimeMod = 2, 0

[State 830,veladd]
type = veladd
trigger1 = 1
y = 1

[State 830,ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 3080

[State 830,ChangeAnim]
type = PalFx
trigger1 = TimeMod = 4, 0
time = 2
color = 5
invertall = 1
add = 0,0,30

[State 830,SelfState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3081

; Hou'ou Kyaku (Start)
[Statedef 3100]
type = S
movetype = A
physics = S
anim = 3100
velset = 0, 0
poweradd = -1000
ctrl = 0

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 19,-30
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 48
moveTime = 48
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 3100,0
channel = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 102, Dust]
type = helper
trigger1 = !animtime
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3101

; Hou'ou Kyaku (Running)
[Statedef 3101]
type = S
movetype = A
physics = N
anim = 3101
velset = 0, 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3010,VelSet]
type = VelSet
trigger1 = 1
x = 8

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 110,0
[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 2 || AnimElem = 4 || AnimElem = 6)
value = 100, ifElse((AnimElem = 4), 0, 1)

[State 3010,HitDef]
type = Hitdef
trigger1 = Time = 0
attr = S, HA
animtype = Hard
hitflag = MAF
guardflag = M
priority = 8,Miss
damage = 0 ,0
getpower = 0,0
sparkno = S30002
guard.sparkno = s30040
sparkxy = -10 + 0 * (var(35) := 90), var(36) := 9999
hitsound = -1
guardsound = S3,0
pausetime = 6,6
ground.slidetime = 15
ground.type = High
ground.velocity = 0
guard.velocity = -5.0
air.velocity = -3.5,-6
ground.cornerpush.veloff = 0
yaccel = .5
fall = 1 
fall.recover = 0
fall.recover = 0
p2facing = 1
p1stateno = 3110
p2stateno = 3120
p2getp1state = 1
id = 3100

[State 1100, HitSpark]
type=Helper
trigger1=moveguarded=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=8001
ID=8000
name="GuardSpark"
pos= ceil(p2dist x),ceil(p2dist y-36)
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 3010,ChangeState]
type = ChangeState
trigger1 = Time = 26 || moveguarded
value = 3102

; Hou'ou Kyaku (Failed)
[Statedef 3102]
type = S
movetype = I
physics = S
anim = 3102

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=2
value = 5, 6

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3010, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = L

[State 3010, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = S

[State 3020,AfterImageTime]
type = AfterImageTime
trigger1 = Time = 0
time = 0

[State 52, Dust]
type = explod
trigger1 = AnimElem = 3
anim = 8102
sprpriority = -3
postype = p1
scale = 0.75, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5110, 6]
type = PlaySnd
trigger1 = AnimElem = 3
value = 52,0

[State 3020,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Hou'ou Kyaku (Hits)
[Statedef 3110]
type = S
movetype = A
physics = N
anim = 3110
velset = 1, 0
poweradd = 0
sprpriority = 1

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3030,AfterImageTime]
type = AfterImageTime
trigger1 = Time = 0
trigger2 = AnimElem = 48
time = 0

[State 3030,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3042, 1]
type = Width
trigger1 = AnimElem = 40,< 0
value = 30+(Target,const(Size.ground.front)),0

[State 3030,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5,>= 0 && AnimElem = 40,< 0
pos = 30+(Target,const(Size.ground.front)), 0

[State 3030,HitAdd]
type = HitAdd
trigger1 = AnimElem =  2,=1 || AnimElem =  4,=1 || AnimElem =  7,=1 || AnimElem = 10,=1 || AnimElem = 14,=1
trigger2 = AnimElem = 19,=1 || AnimElem = 22,=1 || AnimElem = 27,=1 || AnimElem = 31,=1 || AnimElem = 34,=1 || AnimElem = 38,=1
trigger3 = AnimElem = 42,=1 || AnimElem = 44,=1
value = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem =  1,=0 || AnimElem =  2,=2 || AnimElem =  4,=2 || AnimElem =  7,=2 || AnimElem = 10,=2 || AnimElem = 14,=2
trigger2 = AnimElem = 19,=2 || AnimElem = 22,=2 || AnimElem = 27,=2 || AnimElem = 31,=2 || AnimElem = 34,=2 || AnimElem = 38,=2
trigger3 = AnimElem = 42,=2 || AnimElem = 44,=2
time=5
ampl=4

[State 100,1]
type = PlaySnd
trigger1 = AnimElem =  2,=2 || AnimElem =  4,=2
value = S2+10*var(44), 3

[State 100,1]
type = PlaySnd
trigger1 = AnimElem =  7,=2 || AnimElem = 10,=2 || AnimElem = 14,=2
trigger2 = AnimElem = 19,=2 || AnimElem = 22,=2 || AnimElem = 27,=2 || AnimElem = 31,=2 || AnimElem = 34,=2 || AnimElem = 38,=2
trigger3 = AnimElem = 42,=2 || AnimElem = 44,=2
value = S2+10*var(44), 8-(AnimElem = 42,=2 || AnimElem = 44,=2)*3

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem =  1,=0 || AnimElem =  4,=2 || AnimElem = 10,=2 || AnimElem = 19,=2 || AnimElem = 27,=2 || AnimElem = 34,=2
value = 3120

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem =  2,=2 || AnimElem =  7,=2 || AnimElem = 14,=2 || AnimElem = 22,=2 || AnimElem = 31,=2 || AnimElem = 38,=2
value = 3121 

[State 3030,TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem =  2,=2 || AnimElem =  4,=2 || AnimElem =  7,=2 || AnimElem = 10,=2 || AnimElem = 14,=2
trigger2 = AnimElem = 19,=2 || AnimElem = 22,=2 || AnimElem = 27,=2 || AnimElem = 31,=2 || AnimElem = 34,=2 || AnimElem = 38,=2
value = -12
kill = 0

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem = 2
trigger2=AnimElem = 4
helperType = Normal
stateNo = 8005
ID = 8000
name = "Spark"
posType = P1
pos = 28,-46
ownPal = 1
size.xScale=.35
size.yScale=.35
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem = 7 || AnimElem = 10 || AnimElem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=10),68,42),Ifelse((animelem=10),-51,-33)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem = 14 || AnimElem = 19
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=14),57,68),Ifelse((animelem=14),-34,-48)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem = 27 || AnimElem = 31 || AnimElem = 34 || AnimElem = 38
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=27||animelem=34),50,42),Ifelse((animelem=27||animelem=34),-61,-38)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1 = AnimElem = 42
trigger2 = AnimElem = 44
helperType = Normal
stateNo = 8005
ID = 8000
name = "Spark"
posType = P1
pos = 27,Ifelse((animelem=42),-55,-75)
ownPal = 1
size.xScale=.5
size.yScale=.5
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 40
x = 0

[State 3010, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 42
statetype = A

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 42
x = 7
y = -8

[State 105, VelMul]
type = VelMul
trigger1 = AnimElem = 42,>11 && AnimElem = 42,<0
trigger2 = AnimElem = 44,>17
x = .90

[State 1305,Veladd]
type = Veladd
trigger1 = AnimElem = 42,>11 && AnimElem = 42,<0
trigger2 = AnimElem = 44,>17
y = .55

[State 860,PosFreeze]
type = PosFreeze
trigger1 = AnimElem = 42,>=0 && AnimElem = 42,<=11
trigger2 = AnimElem = 44,>=0 && AnimElem = 44,<=17

[State 3010,AfterImage]
type = AfterImage
trigger1 = AnimElem = 40
time = 999
length = 10
palcolor = 256
palinvertall = 0
palbright = 20,20,30
palcontrast = 100,100,220
palpostbright = 0, 0, 0
paladd = 10,10,45
palmul = .65,.65,.85
timegap = 1
framegap = 2
trans = add1

[State 3030,TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 42,=2 || AnimElem = 44,=2
value = -30
kill = 1

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem = 42,=1
value = 3122

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem = 44,=1
value = 3123

[State 3005, envshake]
type = envshake
trigger1 = AnimElem = 44
time = 10
freq = 60
ampl = -8

[State 3005, Pause]
type = Pause
triggerall = RoundState = 2
trigger1 = AnimElem = 44
time = 1

[State 3030,ChangeState]
type = ChangeState
trigger1 = AnimElem = 44,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3111
ctrl = 0

; Hou'ou Kyaku (End)
[Statedef 3111]
type = S
movetype= I
physics = S
velset = 0,0
anim = ifElse(prevstateno = 3170,3003,3002)
ctrl = 0

[State 1305,PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = -10,0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3001, Snd]
type=playsnd
trigger1= animelem=3
value=4,3
channel=0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Hou'ou Kyaku (Gethit 1)
[Statedef 3120]
type = S
movetype= H
physics = N
anim = 5002
velset = 0, 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3000, NotHitBy]
type = NotHitBy
triggerall = enemy, stateno!=3170
trigger1 = 1
value = SCA

[State 1120, PosSet]
type = PosSet
trigger1 = Time < 30
y = -1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5007

[State 1120, PosSet]
type = PosSet
trigger1 = Time > 30
y = 0

[State 5011, 6]
type = SelfState
trigger1 = Time > 30
value = 5001

; Hou'ou Kyaku (Gethit 2)
[Statedef 3121]
type = S
movetype= H
physics = N
anim = 5012
velset = 0, 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = enemy, stateno!=3170
trigger1 = 1
value = SCA

[State 1120, PosSet]
type = PosSet
trigger1 = Time < 30
y = -1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5017

[State 1120, PosSet]
type = PosSet
trigger1 = Time > 30
y = 0

[State 5011, 6]
type = SelfState
trigger1 = Time > 30
value = 5011

; Hou'ou Kyaku (Gethit 3)
[Statedef 3122]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 5020, 3]
type = ChangeAnim
trigger1 = Time <= 8
value = 5050

[State 3056, PosAdd]
type = PosAdd
trigger1 = Time <= 8
x = IfElse(Time % 2 = 0,1,-1)

[State 810,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 830,SelfState]
type = ChangeState
trigger1 = Time > 8
value = 3124

; Hou'ou Kyaku (Gethit 4)
[Statedef 3123]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 5020, 3]
type = ChangeAnim
trigger1 = Time <= 18 && SelfAnimExist(5051) 
value = 5051

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time <= 18 && !SelfAnimExist(5051) 
value = 5050

[State 3056, PosAdd]
type = PosAdd
trigger1 = Time <= 18
x = IfElse(Time % 2 = 0,1,-1)

[State 810,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 830,SelfState]
type = ChangeState
trigger1 = Time > 18
value = 3124

; Hou'ou Kyaku (Gethit 5)
[Statedef 3124]
type = A
movetype= H
physics = N
velset = -2,-10
ctrl = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 810,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5050, 2]
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = Time > 0
y = .45

[State 1111,VelSet]
type = VelSet
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
x = -2

[State 5050, 6]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100

; MAX Hou'ou Kyaku
[Statedef 3150]
type = S
movetype = A
physics = S
anim = 3100
velset = 0, 0
poweradd = -2000
ctrl = 0

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 19,-30
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1 = Time = 12
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
trigger1 = Time = 0
time = 48
moveTime = 48
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 3100,0
channel = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 102, Dust]
type = helper
trigger1 = !animtime
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3151

; MAX Hou'ou Kyaku (Running)
[Statedef 3151]
type = S
movetype = A
physics = N
anim = 3101
velset = 0, 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3010,VelSet]
type = VelSet
trigger1 = 1
x = 8

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 110,0
[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 2 || AnimElem = 4 || AnimElem = 6)
value = 100, ifElse((AnimElem = 4), 0, 1)

[State 3010,HitDef]
type = Hitdef
trigger1 = Time = 0
attr = S, HA
animtype = Hard
hitflag = MAF
guardflag = M
priority = 8,Miss
damage = 0 ,0
getpower = 0,0
sparkno = -1
guard.sparkno = -1
sparkxy = -10 + 0 * (var(35) := 90), var(36) := 9999
hitsound = -1
guardsound = S3,0
pausetime = 6,6
ground.slidetime = 15
ground.type = High
ground.velocity = 0
guard.velocity = -5.0
air.velocity = -3.5,-6
ground.cornerpush.veloff = 0
yaccel = .5
fall = 1 
fall.recover = 0
fall.recover = 0
p2facing = 1
p1stateno = 3160
p2stateno = 3120
p2getp1state = 1
id = 3100

[State 1100, HitSpark]
type=Helper
trigger1=moveguarded=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=8001
ID=8000
name="GuardSpark"
pos= ceil(p2dist x),ceil(p2dist y-36)
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 3010,ChangeState]
type = ChangeState
trigger1 = Time = 28 || moveguarded
value = 3102

; MAX Hou'ou Kyaku (Hits)
[Statedef 3160]
type = S
movetype = A
physics = N
anim = 3150
velset = 2, 0
poweradd = 0
sprpriority = 1

[State 1000, ]
type = Varset
trigger1 = time = 0
var(15) = 0

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3030,AfterImageTime]
type = AfterImageTime
trigger1 = Time = 0
trigger2 = AnimElem = 89
time = 0

[State 3030,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3042, 1]
type = Width
trigger1 = 1
value = 20+(Target,const(Size.ground.front)), 0

[State 3030,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1,>= 0
pos = 20+(Target,const(Size.ground.front)), 0

[State 3030,HitAdd]
type = HitAdd
trigger1 = AnimElem = 2 || AnimElem =  5 || AnimElem = 9|| AnimElem = 15 || AnimElem = 17
trigger2 = AnimElem = 22 || AnimElem = 25 || AnimElem = 32 || AnimElem = 35 || AnimElem = 39
trigger3 = AnimElem = 44 || AnimElem = 47 || AnimElem = 49|| AnimElem = 51 || AnimElem = 53
trigger4 = AnimElem = 55|| AnimElem = 57 || AnimElem = 59 || AnimElem = 61 || AnimElem = 63
trigger5 = AnimElem = 65 || AnimElem = 67 || AnimElem = 69
value = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2 || AnimElem =  5 || AnimElem = 9|| AnimElem = 15 || AnimElem = 17
trigger2 = AnimElem = 22 || AnimElem = 25|| AnimElem = 32 || AnimElem = 35 || AnimElem = 39
trigger3 = AnimElem = 44 || AnimElem = 47 || AnimElem = 49|| AnimElem = 51 || AnimElem = 53
trigger4 = AnimElem = 55|| AnimElem = 57 || AnimElem = 59 || AnimElem = 61 || AnimElem = 63
trigger5 = AnimElem = 65 || AnimElem = 67 || AnimElem = 69
time=5
ampl=4

[State 100,1]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem =  5
trigger2 = AnimElem = 22 || AnimElem = 25|| AnimElem = 32 || AnimElem = 35 || AnimElem = 39
trigger3 = AnimElem = 44
value = S2,7

[State 100,1]
type = PlaySnd
trigger1 =AnimElem = 9|| AnimElem = 15 || AnimElem = 17
value = S2+10*var(44),4

[State 100,1]
type = PlaySnd
trigger1 = AnimElem = 47 || AnimElem = 49|| AnimElem = 51 || AnimElem = 53
trigger2 = AnimElem = 55|| AnimElem = 57 || AnimElem = 59 || AnimElem = 61 || AnimElem = 63
trigger3 = AnimElem = 65 || AnimElem = 67 || AnimElem = 69
value = S2+10*var(44),1

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem =  5,=2 || AnimElem =  5,=2 || AnimElem = 15,=0 || AnimElem = 17,=2 || AnimElem = 22,=2 
trigger2 = AnimElem = 25,=2 || AnimElem = 32,=2 || AnimElem = 44,=0 || AnimElem = 51,=0 || AnimElem = 53,=0
trigger3 = AnimElem = 55,=0 || AnimElem = 57,=0 || AnimElem = 59,=0 || AnimElem = 61,=0 || AnimElem = 63,=0
trigger4 = AnimElem = 65,=0 || AnimElem = 67,=0 || AnimElem = 68,=0 || AnimElem = 69,=0
value = 3120

[State 1000, TargetState]
type = TargetState
trigger1 = AnimElem =  2,=2 || AnimElem =  9,=0 || AnimElem = 25,=2 || AnimElem = 35,=2 || AnimElem = 39,=0
value = 3121

[State 3030,TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 2 || AnimElem =  5 || AnimElem = 9|| AnimElem = 15 || AnimElem = 17
trigger2 = AnimElem = 22 || AnimElem = 25|| AnimElem = 32 || AnimElem = 35 || AnimElem = 39
trigger3 = AnimElem = 44 || AnimElem = 47 || AnimElem = 49|| AnimElem = 51 || AnimElem = 53
trigger4 = AnimElem = 55|| AnimElem = 57 || AnimElem = 59 || AnimElem = 61 || AnimElem = 63
trigger5 = AnimElem = 65 || AnimElem = 67 || AnimElem = 69
value = -8
kill = 0

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem = 2 || AnimElem = 5
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=5),58,32),Ifelse((animelem=5),-51,-33)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1 = AnimElem = 9|| AnimElem = 15 || AnimElem = 17
helperType = Normal
stateNo = 8005
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=9),48,32),Ifelse((animelem=9),-45,-40)
ownPal = 1
size.xScale=.35
size.yScale=.35
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1= AnimElem = 22 || AnimElem = 25
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=22),47,39),Ifelse((animelem=22),-34,-84)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1= AnimElem = 32 || AnimElem = 35
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=32),58,47),Ifelse((animelem=32),-48,-48)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1= AnimElem = 39 || AnimElem = 44
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = Ifelse((animelem=39),48,40),Ifelse((animelem=39),-47,-31)
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit Spark]
type = Helper
trigger1 = AnimElem = 47 || AnimElem = 49|| AnimElem = 51 || AnimElem = 53
trigger2 = AnimElem = 55|| AnimElem = 57 || AnimElem = 59 || AnimElem = 61
trigger3 = AnimElem = 63 || AnimElem = 65 || AnimElem = 67 || AnimElem = 69
helperType = Normal
stateNo = 8005
ID = 8000
name = "Spark"
posType = P1
pos = 38,Ifelse((AnimElem = 47 || AnimElem = 51 || AnimElem = 55 || AnimElem = 59 || AnimElem = 63 || AnimElem = 67),-68,-48)
ownPal = 1
size.xScale=.35
size.yScale=.35
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3030,ChangeState]
type = ChangeState
trigger1 = Animtime = 0
value = 3170
ctrl = 0

; MAX Hou'ou Kyaku (Hienzan)
[Statedef 3170]
type = S
movetype= A
physics = N
poweradd=0
velset = 0,0
anim = 3170
ctrl = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1,5
persistent = 0

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
physics = N

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5
y = -4

[State 1051, 1]
type = VelAdd
trigger1 = AnimElem = 13,> 0
y = .5

[State 1300,HitDef]
type = HitDef 
trigger1=AnimElem=4
attr=S, HA
damage=61,4
priority=4, hit
animtype=Hard
getpower=0,0
givepower=15, 15
guardflag=M
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=12,11
guard.pauseTime=10,10
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=150), var(36) :=-55
air.animtype=Up
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=12
ground.velocity=-1,-5
air.velocity=Ifelse(var(20),-1,-3),-3
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
air.fall=1
;yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=12
envshake.ampl=3
envShake.freq=120
kill=1
id=3100

[State 1300,HitDef]
type = HitDef 
trigger1=animelem=7||animelem=10||animelem=12
attr=A, HA
damage=15,4
priority=4, hit
animtype=Hard
getpower=0,0
givepower=15, 15
guardflag=MA
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=12,12
guard.pauseTime=ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=160), var(36) :=-82
air.animtype=Up
fall.animtype=Back
ground.type=High
air.type=Low
ground.slidetime=12
ground.hittime =12
guard.hittime=12
ground.velocity=-3,-10
air.velocity=-3,-8
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
;yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=12
envshake.ampl=4
envShake.freq=120
kill=1
id=3100

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 1201,ChangeState]
type = ChangeState
trigger1 = AnimElem = 5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3111

;---------------------------------------------------------------------------
; Shin! Chouzetsu Rinkaiten Toppa (Start)
[Statedef 3200]
type = A
movetype = A
physics = N
anim = 3200
juggle = 0
sprpriority = 2
velset = 0, 0
ctrl = 0
poweradd = -1000

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "a" || command = "rlsa", 0, 1)

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 17,-78
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

[State 3050, 2]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 3050, 6]
type = PlaySnd
trigger1 = !time
value = 3200,0
channel = 0
[State 3050, 6]
type = PlaySnd
trigger1 = Anim = 3200 && AnimTime = 0
value = 3200,1
channel = 0

[State 3050, 8]
type = ChangeAnim
trigger1 = Anim = 3200 && AnimTime = 0
value = 3201

[State 3050, 9]
type = ChangeState
trigger1 = Anim = 3201
value = 3201
;---------------------------------------------------------------------------
; Shin! Chouzetsu Rinkaiten Toppa (Hits)
[Statedef 3201]
type = A
movetype = A
physics = N
sprpriority = 2
velset = 0, 0
ctrl = 0

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time&&prevstateno!=3201
value = ifElse(var(10) = 1, 3211,3201)

[State 3051, 1] ;ƒGƒtƒFƒNƒg
type = Helper
trigger1 = !Time&&prevstateno!=3201
id = ifElse(var(10) = 1, 3215,3205)
helpertype = Normal
name = "Drill"
stateno = 3205
pos = 0,0
postype = P1
supermovetime = 0
pausemovetime = 0

[State 1000,2]
type=PlaySnd
trigger1 = prevstateno!=3201
trigger1 = time%5=0
value=S1000,1
channel = 12

[State 3051, 2]
type = VelSet
trigger1 = 1
x = ifElse(var(10) = 1, 4,0)
y = 4

[State 3051, 3]
type = VelSet
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
y = 0
x = 0
ignorehitpause = 1

[State 3051, 4]
type = PosSet
trigger1 = Pos Y >= 0
y = 0
ignorehitpause = 1

[State 3051, 5]
type = HitDef
trigger1 = AnimElemTime(1) = 0 || AnimElemTime(9) = 0 || AnimElemTime(17) = 0 || AnimElemTime(25) = 0
trigger2 = AnimElemTime(33) = 0 || AnimElemTime(41) = 0 || AnimElemTime(49) = 0 || AnimElemTime(57) = 0
attr = A, HA
hitflag = MAFD
guardflag = MA
animtype = Back
damage = 22,3
priority = 7, Hit
pausetime = 0, IfElse(AnimElemTime(57) = 0, 13, 24)
guard.pausetime = 0, 11
ground.type = High
ground.slidetime = 18
guard.slidetime = 18
ground.hittime = 49
guard.hittime = 21
guard.ctrltime = 21
air.hittime = 49
yaccel = 0.44
ground.velocity = -4, -6.38
guard.velocity = IfElse(AnimElemTime(57) = 0, -12, 0)
air.velocity = -4, -6.38
airguard.velocity = -2, 4.5
down.velocity = 0, 0
down.hittime = 10
fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 20
hitsound = S2,9
guardsound = s3,0
sparkno = -1
guard.sparkno = -1
sparkxy = -10 + 0*(var(35):=120), var(36):=9999
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100, HitSpark]
type=Helper
trigger1=movecontact=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=ifElse(MoveGuarded, 8001, 8015)
ID=8000
name="Spark"
pos= ceil(p2dist x),-20
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 3051, 8]
type = ChangeState
triggerall = AnimTime != 0
trigger1 = MoveContact
value = 3201

[State 3051, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 3202
ctrl = 0

; Shin! Chouzetsu Rinkaiten Toppa (End)
[Statedef 3202]
type = A
movetype = I
physics = A
anim = 105
sprpriority = 2
ctrl = 0

[State 1000,2]
type=StopSnd
trigger1 = time > 5
channel = 12

[State 105, Snd]
type = playsnd
trigger1 = animelem = 1
value = 105,0

[State 105, Dust]
type = helper
trigger1 = animelem = 1
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1


[State 3052, 0]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3052, 1]
type = VelSet
trigger1 = Time = 0
x = Const(Velocity.Run.Back.X)
y = Const(Velocity.Run.Back.Y)

[State 3052, 2]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

; MAX Shin! Chouzetsu Rinkaiten Toppa (Start)
[Statedef 3250]
type = A
movetype = A
physics = N
anim = 3200
juggle = 0
sprpriority = 2
velset = 0, 0
ctrl = 0
poweradd = -2000

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = 1

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 17,-78
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1
[State 3300, SuperPause FX]
type=Helper
trigger1 = Time = 12
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

[State 3050, 2]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 3050, 6]
type = PlaySnd
trigger1 = !time
value = 3200,0
channel = 0
[State 3050, 6]
type = PlaySnd
trigger1 = Anim = 3200 && AnimTime = 0
value = 3200,1
channel = 0

[State 3050, 8]
type = ChangeAnim
trigger1 = Anim = 3200 && AnimTime = 0
value = 3251

[State 3050, 9]
type = ChangeState
trigger1 = Anim = 3251
value = 3251
;---------------------------------------------------------------------------
; Shin! Chouzetsu Rinkaiten Toppa (Hits)
[Statedef 3251]
type = A
movetype = A
physics = N
sprpriority = 2
velset = 0, 0
ctrl = 0

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time&&prevstateno!=3251
value = 3251

[State 3051, 1]
type = Helper
trigger1 = !Time&&prevstateno!=3251
id = 3215
helpertype = Normal
name = "Drill"
stateno = 3205
pos = 0,0
postype = P1
supermovetime = 0
pausemovetime = 0

[State 1000,2]
type=PlaySnd
trigger1 = prevstateno!=3251
trigger1 = time%5=0
value=S1000,1
channel = 12

[State 3051, 2]
type = VelSet
trigger1 = 1
x = 4
y = 4

[State 3051, 3]
type = VelSet
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
y = 0
x = 0
ignorehitpause = 1

[State 3051, 4]
type = PosSet
trigger1 = Pos Y >= 0
y = 0
ignorehitpause = 1

[State 3051, 5]
type = HitDef
trigger1 = AnimElemTime(1) = 0 || AnimElemTime(9) = 0 || AnimElemTime(17) = 0 || AnimElemTime(25) = 0  || AnimElemTime(33) = 0 || AnimElemTime(41) = 0
trigger2 = AnimElemTime(49) = 0 || AnimElemTime(57) = 0 || AnimElemTime(65) = 0 || AnimElemTime(73) = 0 || AnimElemTime(81) = 0
attr = A, HA
hitflag = MAFD
guardflag = MA
animtype = Back
damage = 22,3
priority = 7, Hit
pausetime = 0, IfElse(AnimElemTime(73) = 0, 13, 24)
guard.pausetime = 0, 11
ground.type = High
ground.slidetime = 18
guard.slidetime = 18
ground.hittime = 49
guard.hittime = 21
guard.ctrltime = 21
air.hittime = 49
yaccel = 0.44
ground.velocity = -4, -6.38
guard.velocity = IfElse(AnimElemTime(73) = 0, -12, 0)
air.velocity = -4, -6.38
airguard.velocity = -2, 4.5
down.velocity = 0, 0
down.hittime = 10
fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 20
hitsound = S2,9
guardsound = s3,0
sparkno = -1
guard.sparkno = -1
sparkxy = -10 + 0*(var(35):=120), var(36):=9999
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100, HitSpark]
type=Helper
trigger1=movecontact=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=ifElse(MoveGuarded, 8001, 8015)
ID=8000
name="Spark"
pos= ceil(p2dist x),-20
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 3051, 8]
type = ChangeState
triggerall = AnimTime != 0
trigger1 = MoveContact
value = 3251

[State 3051, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 3202
ctrl = 0
;-----------------------------------------------
; Shakushi
[Statedef 3500]
type = A
movetype = A
physics = N
anim = 3500
ctrl = 0
velset = 0, 0
poweradd = -3000

[State 3000, No Corner Push]
type=VarSet
trigger1=time=3
fvar(5)=0
[State 3000, Unguardable]
type=VarSet
trigger1=time=3 && NumEnemy
trigger1=(EnemyNear, StateNo !=[120,155])
var(17)=47
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

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 17,-78
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
sound = s8500,2
darken = 0

[State 1305,PosSet]
type = ScreenBound
trigger1 = AnimElemNo(0) >= 7
value = 1
movecamera = 0,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3500,0
channel = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 7,< 0
value = SCA

[State 3000, Posadd]
type = Posset
trigger1 = AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10
trigger2 = AnimElem = 11 || AnimElem = 12 || AnimElem = 13
X = EnemyNear,Pos X - (120 * Facing)
y = -100

[State -3,Super]
type = Helper
trigger1 = AnimElem = 7 || AnimElem = 9 || AnimElem = 11 || AnimElem = 13
id = ifelse((AnimElem = 7 || AnimElem = 11),3505,3506)
pos = 0,0
postype = P2
stateno = 3510
facing = -1
helpertype = normal
keyctrl = 0
ownpal = 1
facing = ifelse(Random<500,1,-1)
ignorehitpause = 1

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3501
ctrl = 0

; Shakushi End
[Statedef 3501]
type = A
movetype= A
physics = N
velset = 11,11
anim = 3501
ctrl = 0
facep2 = 1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 3500,1

[State 1300,HitDef]
type = HitDef 
trigger1 = !time
attr = A, HA
animtype = diagup
damage=Ifelse(p2movetype=H,30,300),10
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 11,13
guard.pausetime = 11,11
sparkno = -1
guard.sparkno = -1
hitsound = S2,9
guardsound = S3,1
sparkxy = 12,9999
ground.type = High
ground.slidetime = 16
ground.hittime = 20
ground.velocity = -6,-12
guard.velocity = -10
air.velocity = -6,-12
yaccel = .45
fall = 1
fall.recover = 0
envshake.time=12
envshake.ampl=3
envShake.freq=120

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8015)
ID = 8000
name = "Spark"
posType = P1
pos= ceil(p2dist x),ceil(p2dist y-70)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3000, End]
type = ChangeState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3502

; Shakushi Fall
[Statedef 3502]
type = S
movetype= I
physics = S
velset = 0,0
anim = 3502
ctrl = 0

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = -10,0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1305,PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Shakushi Gethit State
[Statedef 3520]
type = A
movetype= H
physics = N
velset = -2,-7
ctrl = 0
anim = 5050

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 810,NotHitBy]
type = NotHitBy
triggerall = Enemy, Name != "Choi Bounge" && enemy,authorname !="Falcon Rapper"
trigger1 = enemy, stateno != 3500
value = SCA

[State 5050, 2]
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = Time > 0
y = .45

[State 1111,VelSet]
type = VelSet
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
x = -2

[State 5050, 6]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100