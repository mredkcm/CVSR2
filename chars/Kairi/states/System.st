
;KAIRI FROM STREET FIGHTER EX + EDITS BY Mr.KARATE AND GUSTAVO C. MORAES
;CODES - Mr.KARATE
;SPRITES - GUSTAVO C. MORAES

;==
;===<SYSTEM STATES>====
;==

;====<RUN/DASH>====
; Dash Forward
[Statedef 100]
type = S
physics = S
anim = 102
sprpriority = 1
ctrl = 0

[State 100, dust]
type = Explod
trigger1 = Time = 1
Anim = 8103
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 3
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 100, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 3,2)
trigger1 =  power >= 1000
trigger1 =  power <3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .2,.2
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 100, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 4,3)
trigger1 =  power >= 1000
trigger1 =  power <3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .2,.2
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 100, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 5,3)
trigger1 =  power >= 3000
anim = 71001
postype = p1
pos = -19,-72
supermove = 9999
random = 10,40
scale = .3,.3
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 100, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 3,2)
trigger1 =  power >= 3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .3,.3
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, 2]
type = Playsnd
trigger1 = time = 0
value = 2,6

[State 100, 3]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 4]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, ChangeState]
type = ChangeState
trigger1 = Statetype = S && command = "holdup" || command = "up"
value = 40

[State 100, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = ifelse(command != "holdfwd", 102, 101)

[State 100, ChangeState]
type = ChangeState
triggerall = var(58)>=1
trigger1 = animtime = 0
value = ifelse(p2dist x>=60, 101, 102)

;-------------------------------------------------------------------------------
; Run
[Statedef 101]
type = S
physics = S
anim = 100
sprpriority = 1
ctrl = 0

[State 101, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 3,2)
trigger1 =  power >= 1000
trigger1 =  power <3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .2,.2
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 101, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 4,3)
trigger1 =  power >= 1000
trigger1 =  power <3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .2,.2
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 101, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 5,3)
trigger1 =  power >= 3000
anim = 71001
postype = p1
pos = -19,-72
supermove = 9999
random = 10,40
scale = .3,.3
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 101, explod]
type = Explod
triggerall = var(59) = 0
trigger1 = (timemod = 3,2)
trigger1 =  power >= 3000
anim = 71001
postype = p1
pos = 19,-72
supermove = 9999
random = 10,40
scale = .3,.3
sprpriority = 5
ownpal = 1
ignorehitpause=1
ID = 1113

[State 101,as]
type=assertspecial
trigger1= 1
flag=nowalk
flag2=noautoturn

[State 101, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 101 , 4]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6
value = 2, 5

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4321

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4322

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43210

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43220

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 432101

[State 101, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 432202

[State 101, 4]
type = ChangeState
trigger1 = command != "holdfwd"
value = 102

[State 101, ChangeState]
type = ChangeState
trigger1 = Statetype = S && command = "holdup" || command = "up"
value = 40

;---------------------------------------------------------------------------
; Stop Run
[Statedef 102]
type = S
physics = S
ctrl = 0
anim = 101

[State 102, changeanim]
type= changeanim
triggerall = prevstateno = 101
trigger1= time = 0
value = 103

[State 102,Stop Dust]
type=explod
trigger1 = time=0 | time=3 || time=6
anim = 7416
pos = 15,0
postype = P1
scale = .3,.3
velocity = 2,-0.5
sprpriority = 5
ownpal = 1
supermovetime = 999

[State 100, Snd]
type=playsnd
trigger1= 1
value=0,101
persistent=0

[State 6002, 1]
type = VelAdd
trigger1 = 1
x = -.5 ; -1

[State 6002, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Dash Back
[Statedef 105]
type = A   
physics = N   
anim = 105    
ctrl = 0  
velset = 0,0
sprpriority = 1

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 2]
type = PlaySnd
trigger1 = Time = 0
value = 2,6

[State 105, 2]
type = PlaySnd
trigger1 = Time = 1
value = 2000,12

[State 105, 2]
type = Gravity
trigger1 = time >= 2

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

[State 105, Dust]
type=helper
trigger1= animelem = 1
helpertype=normal
stateno=7100
ID=7100
pos=0,0
name="Dust"
postype=p1
ownpal=1

[State 6002, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 106
ctrl = 0

;-------------------------------------------------------------------------------
;Back dash landing
[Statedef 106]
type = S
physics = S
ctrl = 1
anim = 47
ctrl = 0

[State 106, 1]
type = VelSet
trigger1 = Time = 0
Y = 0

[State 100 , 4]
type = PlaySnd
trigger1 = time = 1
value = 2, 6

[State 106, 1]
type = PosSet
trigger1 = Time = 0
Y = 0

[State 106, Dust]
type=explod
trigger1= !time
anim=7102
ID=7102
sprpriority=-2
postype=p1
scale=.5,.5
ownpal=1
pausemovetime=-1
supermovetime=-1

[State 101, 5] 
type = ChangeState
trigger1 = animTime = 0
value = 0
ctrl = 1

;====<WIN POSES/INTROS>====
; Lose by Time Over
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 106, 1]
type = PlaySnd
trigger1 = time = 0
value = 11,1

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;-------------------------------------------------------------------------------
; Win state decider
[Statedef 180]
type = S

[State 180,  winKR]
type=changestate
trigger1=prevstateno=183
value=prevstateno

[State 180, 1]
type=changestate
trigger1=!time
value=ifelse(random<181,182,ifelse(random<183,181,184))

;---------------------------------------------------------------------------
; Win pose 1 - atacks
[Statedef 181]
type = S
ctrl = 0
anim = 180
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, 1]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 10
trigger3 = animelem = 16
value = 2,9

[State 182, 1]
type = PlaySnd
trigger1 = animelem = 25
value = 2000,26

;---------------------------------------------------------------------------
; Win pose 2 -
[Statedef 182]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,16

;-------------------------------------------------------------------------------
; Win pose 3 - Win by Kyouja Renbu
[Statedef 183]
type=S
sprpriority=-4
anim=184

[State 183, kanjibg]
type=helper
trigger1=!time&&prevstateno=7201
helpertype=normal
stateno=7610
ID=7610
postype=left
ownpal=1
persistent=0

[State 183, snd]
type=playsnd
trigger1=time=2&&prevstateno=7201
value=11,0
channel=1

[State 183, snd]
type=playsnd
trigger1=time=2&&prevstateno=7201
value=2000,8
channel=0

[State 183, win]
type=changestate
trigger1=prevstateno=7201&&time>50
value=183
ctrl=1

[State 183, win]
type=changestate
trigger1=time>50
value=188
ctrl=1
;------------------------------------------------------------------------
[Statedef 188]
type = S
ctrl = 0
anim = 188
velset = 0,0
sprpriority= 4

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;--------------------------------------------------------------------------
; Win pose 4 -
[Statedef 184]
type = S
ctrl = 0
anim = 742
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, golpe]
type = PlaySnd
trigger1 = animelem = 4
value = 2,9

[State 182, voz1]
type = PlaySnd
trigger1 = animelem = 3
value = 11,0

[State 182, voz2]
type = PlaySnd
trigger1 = animelem = 17
value = 1,5

[State 1800, Explod]
type = Explod
trigger1 = animelem = 7
anim = 183
pos = 90,0
postype = p1
sprpriority = 2
shadow = -1

;---------------------------------------------------------------------------
; Introduction
[Statedef 190]
type = S
ctrl = 0
velset = 0,0

[State 180, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(190)
value = 190

[State 180, VarRandom]
type = VarRandom
trigger1 = Time = 0
v = 11
range = 0,20

[State 180, Intro 1]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(11) = [0,10]
value = 192

[State 180, Intro 2]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(11) = [11,20]
value = 191

;vs Gouki
[State 191, 1]
type = ChangeState
triggerall = Time = 0
trigger1 = P2Name = "Shin Gouki" && enemy,authorname = "Phantom.of.the.Server"
trigger2 = P2Name = "Gouki" && enemy,authorname = "GM"
trigger3 = P2Name = "cvsgouki" && enemy,authorname = "Warusaki3"
trigger4 = P2Name = "Skullomania" && enemy,authorname = "SeanAltly&DivineWolf"
trigger5 = P2Name = "Blair Dame" && enemy,authorname = "Dampir"
value = 199

;-------------------------------------------------------------------------------
;Intro 1 - Trans
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0

[State 192, 0]
type = SprPriority
trigger1 = Time >= 0
value = 4

[State 191, 2]
type = AssertSpecial
trigger1 = time >= 0
flag = Intro

[State 1800, Explod]
type = Explod
trigger1 = animelem = 5
anim = 194
pos = 0,0
postype = p1
sprpriority = 5
removetime = 80

[State 1800, Explod]
type = Explod
trigger1 = animelem = 5
persistent = 0
anim = 173
pos = 0,0
postype = p1
sprpriority = 1
removetime = 15

[State 192, efect]
type = PlaySnd
trigger1 = animelem = 5
value = 2001,3

[State 192, efect]
type = PlaySnd
trigger1 = animelem = 6
value = 5,2

[State 191, voice]
type = PlaySnd
trigger1 = Animelem = 5
value = 171,6

[State 191, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;-------------------------------------------------------------------------------
;Intro 2 - jump
[Statedef 192]
type = S
ctrl = 0
anim = 443
velset = 0

[State 6101, 4]
type = AfterImageTime
trigger1 = Time >= 2
time = 2

[State 220, Position]
type = PosAdd
trigger1 = time = 0
x = 227.4
y = -49

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -6.6
y = -7.2

[State 1100, Velocity]
type = VelAdd
trigger1 = AnimElemTime(2) >= 0
y = .57

[State 1201, screenbound]
type = screenbound
trigger1 = 2
value = 0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 50, Snd]
type=playsnd
trigger1= !time
value=3,6

[State 50, Snd]
type=playsnd
trigger1= animelem = 2
value=1,0

[State 6901, End]
type=changestate
trigger1= !animtime
value=5279
;-------------------------------------------------------------------------------
[Statedef 5279]
type = S
physics = S
ctrl = 0
anim = 47

[State 52, Snd]
type=playsnd
trigger1= !time
value=3,4

[State 52, Dust]
type=explod
trigger1= !time
anim=7100
ID=7100
sprpriority=-2
postype=p1
scale=.5,.5
ownpal=1
pausemovetime=-1
supermovetime=-1

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 3
value = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 0

;-------------------------------------------------------------------------------
;Intro VS Gouki
[Statedef 199]
type = S
ctrl = 0
anim = 44467
velset = 0
sprpriority = 0

[State 191, 2]
type = AssertSpecial
trigger1 = time >= 0
flag = Intro

[State 1300, 1]
type = PlaySnd
trigger1 = animelem =6
value = 2000,27

[State 191, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

[State 191, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;====<TAUNT>====
[Statedef 195]
type = S
ctrl = 0
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[State 195, 1]
type = ChangeAnim
triggerall = power < 3000
trigger1 = Anim != 195 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 195
value = 195

[State 195, 1]
type = ChangeAnim
triggerall = power >=3000
trigger1 = Anim != ifelse(var(59),195,196) && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = ifelse(var(59),195,196)

[State 195, 1]
type = CtrlSet
trigger1 = Time = 40
value = 1

[State 182, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,8

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<ROLL-DODGE>====
;Roll forward
[Statedef 300]
type = S
physics = N
movetype= I
anim = 310
ctrl = 0
velset = 0,0
sprpriority = 0

[State 300, SprPriority]
type = SprPriority
trigger1 = 1
value = 0

[State 300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S171,7
volume = 255
channel = -1

[State 300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,5

[State 300, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 300, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 6.2

[State 300, Velocity]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 300, HitBy]
type = HitBy
trigger1 = time <= 20
value = SCA;, NT,ST,HT

[State 300, Push]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0

[State 300, AfterImage]
type = Afterimage
trigger1 = AnimElem = 3
time = 15
timegap=1
framegap=4
length=9
palbright=0,0,0
paladd=0,0,0
palmul=.9,.9,.9
palcontrast=120,120,120
palpostbright=0,0,0
trans=add1

[State 300, StateChange]
type = Changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Roll back
[Statedef 301]
type = S
physics = N
movetype= I
anim = 311
ctrl = 0
velset = 0,0
sprpriority = 0

[State 301, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,5

[State 301, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S171,7
volume = 255
channel = 2

[State 301, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 301, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -6.2

[State 301, Velocity]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 301, HitBy]
type = HitBy
trigger1 = time <= 20
value = SCA;, NT,ST,HT

[State 301, Push]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0

[State 301, AfterImage]
type = Afterimage
trigger1 = AnimElem = 3
time = 15
timegap=1
framegap=4
length=9
palbright=0,0,0
paladd=0,0,0
palmul=.9,.9,.9
palcontrast=120,120,120
palpostbright=0,0,0
trans=add1

[State 301, StateChange]
type = Changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;dodge stand
[Statedef 302]
type = S
physics = S
movetype = I
anim = 1300
ctrl = 0
velset = 0,0
sprpriority = -1
poweradd =0

[State 302, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 302, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 302, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S1,0
volume = 255
channel = -1

[State 302, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 302, Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 302, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NT,ST,HT

[State 302, AfterImage]
type = Afterimage
trigger1 = AnimElem = 1
time = 26
timegap=1
framegap=4
length=9
palbright=0,0,0
paladd=0,0,0
palmul=.9,.9,.9
palcontrast=120,120,120
palpostbright=0,0,0
trans=add1

[State 302, attack]
type=changestate
trigger1= time=[15,25]
trigger1= command="x" || command="y" || command="z" || command="a" || command="b" || command="c"
value=ifelse((command="x" || command="y" || command="z"),304,303)

[State 302, StateChange]
type = Changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
; strong kick - Dodge counter atack
[Statedef 303]
type = S
movetype= A
physics = S
juggle = 3
poweradd= 45
ctrl = 0
velset = 0
anim = 242
sprpriority = 2

[State 303, 1]
type = PlaySnd
trigger1 = Time = 0
value = 7,5

[State 303, 1]
type = PlaySnd
trigger1 = Time = 0
value = 1,15

[State 303, 2]
type = HitDef
trigger1 = animelem = 5
attr = S, NA
animtype = Medium
damage = 60,0
guardflag = MA
pausetime = IfElse(var(21),6,12),ifElse(var(21),6,12)
guard.pausetime = 14, 14
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 80), var(36) := -35
hitsound = s2,13
guardsound = s2,4
ground.type = high
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -3, -2
air.velocity = -2.2,-3.2
fall = 1
envshake.time = 12
envshake.ampl = 3

[State 303, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
; Strong punch - Dodge counter atack
[Statedef 304]
type = S
movetype= A
physics = S
juggle = 2
poweradd = 40
ctrl = 0
velset = 0,0
anim = 243
sprpriority = -1

[State 304, voice]
type = PlaySnd
trigger1 = Time = 0
value = 7,1

[State 304, 1]
type = PlaySnd
trigger1 = Time = 0
value = 4,1

[State 304, PlaySnd]
type = PlaySnd
triggerall = var(59) = 0
triggerall = power >= 1000
trigger1 = animelem = 1
value = S171,8
volume = 255
channel = -1

[State 304, 2]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
animtype = Medium
damage = 43, ifelse(var(59)<=1 && power>1000,10,0)
guardflag = MA
pausetime = IfElse(var(21),6,10),ifElse(var(21),6,10)
guard.pausetime = 14, 14
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 70), var(36) := -70
hitsound = s2,1
guardsound = s2,4
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -5.5
air.velocity = -2.5,-4
palfx.time = ifelse(var(59)<=1 && power>1000,20,0)
palfx.sinadd=64,64,64,4
palfx.mul=128,128,128

[State 304, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7180) < 1
triggerall = var(59) = 0
triggerall = power >= 1000
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 304 ]
type = explod
triggerall = var(59) = 0
triggerall = power >= 1000
trigger1 = AnimElem = 2
persistent = 1
ignorehitpause = 0
anim = 60050
scale = .4 , .4
pos = 20,-8
postype = p1
removetime = 12
removeongethit = 1
sprpriority = 2

[State 210, Hadouken]
type=helper
triggerall = var(59) = 0
triggerall = power >= 3000
trigger1= anim = 243
trigger1 = animelem = 2
helpertype=normal
stateno=2003
ID=2004
name="fireball destroyer"
postype=p1
pos=-15,10
ownpal=1

[State 304,re ]
type = RemoveExplod
trigger1 = anim != 243
ID = 243

[State 304, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EXCEL>====
;Excel - Original combo
[Statedef 360]
type=U
physics=U
movetype=A
anim=760+(statetype=A)
ctrl=(statetype=A)
velset=ifelse((statetype=S),0,vel x),ifelse((statetype=S),0,vel y)
poweradd=-1000

[State 760, Snd]
type=playsnd
trigger1= !time
value=4,12
channel=0
volume=200

[State 760, Snd]
type=playsnd
trigger1= !time
value=2000,19

[State 760, Super Pause FX]
type=helper
trigger1= !time
helpertype=normal
stateno=7260
ID=7260
postype=p1
pos= 19,-87-(anim=761)*10
ownpal=1
size.xscale=1
size.yscale=1
persistent=0
supermovetime=9999

[State 760, superchargepause]
type=superpause
trigger1= !time
time=30
anim=-1
sound=s7,2
darken=0
movetime=30*(anim=760)

[State Corner Push]
type=varset
trigger1= !time
fvar(5)= 0

[State 760, var]
type=varset
trigger1= anim=760
trigger2= anim=761 && !time
var(20)=180

[State 760, nhb]
type=nothitby
trigger1= anim=760
trigger2= anim=761 && time<=1
time=8
value=SCA

[State 760, image]
type=afterimage
trigger1= anim=760 && time=30
trigger2= anim=761 && time=1
time=2
timegap=1
framegap=4
length=13
paladd=0,0,0
palmul=.75,.75,.75
palcontrast=64,128,192
palpostbright=0,0,0
trans=add1

[State 760, End]
type=changeanim
trigger1= anim=761 && !animtime
value=41+(vel x>0)+(vel x<0)*2
elem=7-(!vel x)*4
persistent=0

[State 760, Type]
type=statetypeset
trigger1= anim=[41,43]
statetype=A
physics=A

[State 760, End]
type=changestate
trigger1= anim=760 && !animtime
value=0
ctrl=1

;====<POWER CHARGE>====
[Statedef 340]
type=S
physics=S
movetype=I
anim=740
ctrl=0
velset=0,0

[State 340, ctrlset]
type = ctrlset
triggerall = !ctrl
trigger1 = anim = 741
value = 1

[State 340, power]
type=poweradd
triggerall= anim=740 && power<powermax
trigger1= var(59)<=0 && (command="holdb" && command="holdy")
trigger2= var(59)>=1
value=2+(time/10)

[State 340, Snd]
type=playsnd
trigger1= anim=740 && time=8
trigger2 = animelem = 4
value=1,12
channel=1

[State 340, shake]
type=envshake
trigger1= anim=740 && !(time%4)
time=4
freq=120
ampl=2

[State 340, flash]
type=palfx
trigger1= 1
time=1
add = 0, 15 + ceil(sin(time / 7.0 * pi) * 15), 75 + ceil(sin(time / 7.0 * pi) * 75)

[State 340, FX]
type=helper
trigger1= anim=740 && animelemtime(2)>=0
trigger1= !numhelper(72400)
helpertype=player
stateno=72400
ID=72400
name="Power Charge"
postype=p1
pausemovetime=65535
supermovetime=65535
pos=10,0
size.xscale = 0.5
size.yscale = 0.5
ownpal=1

[State 730, Particles]
type = Helper
trigger1 = !NumHelper(8331)
helperType = Normal
stateNo = 8331
ID = 8331
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 340, Anim]
type=changeanim
triggerall= anim!=741
trigger1= var(59)<=0 && (command!="holdb" || command!="holdy")
trigger2= power>=const(data.power) || power>=powermax || roundstate!=2
trigger3= var(59)>=1 && (inguarddist || p2bodydist x<160)
value=741

[State 340, ctrl]
type=ctrlset
trigger1=anim=741
value=1

[State 340, stopsnd]
type=stopsnd
trigger1= anim=741
channel=1
persistent=1

[State 340, Snd]
type=playsnd
trigger1= anim=741 && power>=powermax
value= s2000,18

[State 340, End]
type=changestate
trigger1= anim=741 && !animtime
value=0
ctrl=1

[State 340, 2]
type = ChangeState
trigger1 = Power >= 3000
value = 341
ctrl=0

;-------------------------------------------------------------------------------
[Statedef 341]
type = S
movetype = I
physics = S
anim = 743
ctrl= 0

[State 341, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S2000,20

[State 341, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 7720
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = .7,.7
sprpriority = 7
ownpal = 1

[State 341, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
freq = 90
ampl = -4
phase = 90

[State 341, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<ZERO COUNTER>====
[Statedef 350]
type=S
physics=S
movetype=I
anim=750
ctrl=0
velset=0,0
poweradd=-1000
sprpriority=2
facep2=1

[State 350, strengthvar]
type=varset
trigger1= !time && var(56)<=0
var(10)=ifelse((command="bdx" || command="bdy" || command="bdz"),1,2)
ignorehitpause=1

[State 350, strengthvarAI]
type=varset
trigger1= !time && var(56)>=1
var(10)=ifelse((p2statetype=A),1,ifelse((p2statetype=C),2,ifelse(random<500,1,2)))
ignorehitpause=1

[State 350, Snd]
type=playsnd
trigger1= !time
value=2000,19
channel=0

[State 350, ECreset]
type=palfx
trigger1= !time
trigger1= var(20):=-1
time=1

[State 350, Super Pause FX]
type=helper
trigger1= !time
helpertype=normal
stateno=7250
ID=7250
postype=p1
pos=23,-74
ownpal=1
persistent=0
supermovetime=999

[State 350, Super Pause]
type=superpause
trigger1= !time
time=20
movetime=20
anim=-1
sound=s2000,20
p2defmul=1
darken=0

[State 400,re ]
type = RemoveExplod
trigger1 = anim != 210
ID = 210

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4323

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4324

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43230

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43240

[State 350, End]
type=changestate
trigger1= time>=20
value=ifelse(var(10)=1,1610,353)

;---------------------------------------------------------------------------
;Zero counter - kof style scape
[Statedef 351]
type=S
physics=S
movetype=I
anim=750
ctrl=0
velset=0,0
poweradd=-1000
sprpriority=2
facep2=1

[State 351, strengthvar]
type=varset
trigger1= !time && var(56)<=0
var(10)=ifelse((command = "x" && command = "a" && command = "holdfwd"|| command = "x" && command = "a" && command = "holdback"),1,2)
ignorehitpause=1

[State 351, strengthvarAI]
type=varset
trigger1= !time && var(56)>=1
var(10)=ifelse((p2statetype=A),1,ifelse((p2statetype=C),2,ifelse(random<500,1,2)))
ignorehitpause=1

[State 351, Snd]
type=playsnd
trigger1= !time
value=2000,12
channel=0

[State 351, ECreset]
type=palfx
trigger1= !time
trigger1= var(20):=-1
time=1

[State 351, Super Pause FX]
type=helper
trigger1= !time
helpertype=normal
stateno=7250
ID=7250
postype=p1
pos=23,-74
ownpal=1
persistent=0
supermovetime=999

[State 351, Super Pause]
type=superpause
trigger1= !time
time=20
movetime=20
anim=-1
sound=s2000,20
p2defmul=1
darken=0

[State 400,re ]
type = RemoveExplod
trigger1 = anim != 210
ID = 210

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4323

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4324

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43230

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43240

[State 351, End]
type=changestate
trigger1= time>=20
value=ifelse(var(10)=1,300,300)

;-------------------------------------------------------------------------------
[Statedef 352]
type=S
physics=S
movetype=I
anim=750
ctrl=0
velset=0,0
poweradd=-1000
sprpriority=2
facep2=1

[State 352, strengthvar]
type=varset
trigger1= !time && var(56)<=0
var(10)=ifelse(( command = "x" && command = "a" && command = "holdback"),1,2)
ignorehitpause=1

[State 351, strengthvarAI]
type=varset
trigger1= !time && var(56)>=1
var(10)=ifelse((p2statetype=A),1,ifelse((p2statetype=C),2,ifelse(random<500,1,2)))
ignorehitpause=1

[State 352, Snd]
type=playsnd
trigger1= !time
value=2000,12
channel=0

[State 352, ECreset]
type=palfx
trigger1= !time
trigger1= var(20):=-1
time=1

[State 352, Super Pause FX]
type=helper
trigger1= !time
helpertype=normal
stateno=7250
ID=7250
postype=p1
pos=23,-74
ownpal=1
persistent=0
supermovetime=999

[State 352, Super Pause]
type=superpause
trigger1= !time
time=20
movetime=20
anim=-1
sound=s2000,20
p2defmul=1
darken=0

[State 400,re ]
type = RemoveExplod
trigger1 = anim != 210
ID = 210

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4323

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4324

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43230

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43240

[State 352, End]
type=changestate
trigger1= time>=20
value=ifelse(var(10)=1,301,301)

;-------------------------------------------------------------------------------
;Roundhouse strong kick
[Statedef 353]
type = S
movetype= A
physics = S
juggle = 3
poweradd=20*!var(20)
ctrl = 0
velset = 0
anim = 245
sprpriority = 2

[State 353, 1]
type = PlaySnd
trigger1 = Time = 0
value = 7,5

[State 353, 1]
type = PlaySnd
trigger1 = Time = 0 && random<350
value=2000,ifelse(random<500,17,18)

[State 353, 1]
type = HitDef
trigger1 = animelem = 6
attr = S, Na
damage = 60,0
animtype = daiup
guardflag = ma
hitflag = Ma
priority = 3, Hit
pausetime = 18,18
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -75
hitsound = s2,13
guardsound = s2,4
ground.type = low
ground.slidetime = 21
ground.hittime = 21
ground.velocity = -4,-5
air.velocity = -2,-3
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall=1
air.fall=1
envshake.ampl = 4
envshake.freq = 120
envshake.time = 5
fall.recover = 0
getpower = 20,20
givepower =25,25
envshake.time = 10
envshake.ampl = 3
p2stateno = 354

[State 353,explod]
type = Explod
trigger1 = P2StateNo = 354
trigger1 = P2MoveType = H
trigger1 = MoveHit = 1
persistent = 0
anim = 8420
id = 8420
pos =  10,-55
postype = P2
sprpriority = 1
scale = .5,.5
ignorehitpause = 1
bindtime = -1
ownpal = 1

[State 353,re ]
type = RemoveExplod
trigger1 = anim != 210
ID = 210

[State 353, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4323

[State 353, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 4324

[State 353, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43230

[State 353, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 1
id = 43240

[State 353, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Zero Counter - Roundhouse strong kick - P2 Get Hit State
;---------------------------------------------------------------------------
[Statedef 354]
type = A
movetype= H
physics = N
ctrl = 0

[State 354, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 354

[State 1502, 2]
type = PosSet
trigger1 = Time = 0
y = -30

[State 1502, 3]
type = VelSet
trigger1 = AnimElem = 1
x = -4
y = -7

[State 1502, 4]
type = VelAdd
trigger1 = 1
y = .55

[State 354, 5]
type = SelfState
trigger1 = Pos Y >= 0
value = 5100

;====<PARRY>====
;Standing Parry
[StateDef 760]
type = S
physics = S
moveType = I
anim = 760
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78 * !var(20)
faceP2 = 1

[State 760, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 760, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 760, No Walking]
type = VarSet
trigger1 = 1
var(26) = 7

[State 760, Voice]
type = PlaySnd
trigger1= !Time
value = 0,0
channel = 0

[State 310, blueflash]
type=palfx
trigger1= !time
add=0,50,255
sinadd=0,-50,-255,60
time=15

[State 310, redflash]
type=palfx
trigger1=time<15&&var(21)=2
mul=256,time*17,time*17
time=1

[State 310, Snd]
type=playsnd
trigger1= !time
value= 1, 0
channel=0

[State 310, Snd]
type=playsnd
trigger1= !time
value=2000,21

[State 310, Spark]
type=explod
trigger1= animelem=2
anim=7200
ID=7200
sprpriority=5
postype=p1
pos=36,-65
pausemovetime=60
ownpal=1
scale=.5,.5

[State 760, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 760, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Crouching Parry
[StateDef 761]
type = C
physics = C
moveType = I
anim = 761
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78 * !var(20)
faceP2 = 1

[State 761, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 761, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 761, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 761, No Walk]
type = VarSet
trigger1 = 1
var(26) = 7

[State 310, blueflash]
type=palfx
trigger1= !time
add=0,50,255
sinadd=0,-50,-255,60
time=15

[State 310, redflash]
type=palfx
trigger1=time<15&&var(21)=2
mul=256,time*17,time*17
time=1

[State 310, Snd]
type=playsnd
trigger1= !time
value= 1, 0
channel=0

[State 310, Snd]
type=playsnd
trigger1= !time
value=2000,21

[State 310, Spark]
type=explod
trigger1= animelem=2
anim=7200
ID=7200
sprpriority=5
postype=p1
pos= ceil(30 * const(size.xScale)), ceil(-47 * const(size.yScale))
pausemovetime=60
ownpal=1
scale=.5,.5

[State 761, EnvShake]
type = EnvShake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;-------------------------------------------------------------------------------
;Jumping Parry
[StateDef 762]
type = A
physics = N
moveType = I
anim = 762
ctrl = 0
sprPriority = 2
powerAdd = 78 * !var(20)
faceP2 = 1

[State 762, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 762, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 762, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 310, blueflash]
type=palfx
trigger1= !time
add=0,50,255
sinadd=0,-50,-255,60
time=15

[State 310, redflash]
type=palfx
trigger1=time<15&&var(21)=2
mul=256,time*17,time*17
time=1

[State 310, Snd]
type=playsnd
trigger1= !time
value= 1, 0
channel=0

[State 310, Snd]
type=playsnd
trigger1= !time
value=2000,21

[State 310, Spark]
type=explod
trigger1= animelem=2
anim=7200
ID=7200
sprpriority=5
postype=p1
pos= ceil(30 * const(size.xScale)), ceil(-67 * const(size.yScale))
pausemovetime=60
ownpal=1
scale=.5,.5

[State 762, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 762, End]
type = ChangeState
trigger1 = !AnimTime
value = 763
ctrl = 1

;-------------------------------------------------------------------------------
;Falling
[StateDef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(vel x > 2, 2, ifElse(vel x < -2, -2, vel x))
y = ifElse(vel y < -2, vel y, -2)

[State 763, Gravity]
type = Gravity
trigger1 = 1

[State 763, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value=52

;====<TRHOWS>====
;Trhow 1 - Kutei Kaku
[Statedef 800]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, hit]
type=hitdef
trigger1=!time
attr=S, NT
hitflag=M-
priority=1,Miss
sparkno=-1
p1stateno=801
guard.dist=0
fall=1
ID=800

[State 800, 3]
type = ChangeState
trigger1 = MoveContact = 0
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Switching sides
[StateDef 801]
type = S
moveType = A
physics = S
anim = 805
ctrl = 0
sprPriority = 0

[State 801, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 802

[State 801, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 801, Width]
type = Width
trigger1 = 1
edge = 24,24
ignoreHitPause = 1

[State 801, Turn]
type = Turn
trigger1 = AnimElem = 3

[State 801, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 801, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 801, Tech Hit Countdown]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 801, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
pos = 35,0

[State 801, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = 11,0

[State 801, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 1

[State 801, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4)< 0
value = -1

[State 801, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

[State 801, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0 && var(40) != 1
value = 803

;-------------------------------------------------------------------------------
;Switching sides - target
[StateDef 802]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 802, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 802, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 802, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 802, SelfState]
type = SelfState
trigger1 = Time >= 60
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1

;-------------------------------------------------------------------------------
;Success
;---PLAYER---
[Statedef 803]
type=S
movetype=A
physics=S
anim=801
juggle=15
ctrl=0

[State 803, Grab Sound]
type = PlaySnd
trigger1 = time = 1
value = s2, 10

[State 803, Grab Sound]
type = PlaySnd
trigger1 = animelem = 3
value = s1, 15

[State 803, Grab Sound]
type = PlaySnd
trigger1 = animelem = 3
value = s7, 5
volume=255

[State 803, Grab Sound]
type = PlaySnd
trigger1 = target,stateno=5110
value = s2000, 23
persistent = 0

[State 803, bind 1]
type=targetbind
trigger1=animelem = 2
pos=40,0

[State 803, bind 1]
type=targetbind
trigger1=animelem = 3
pos=15,-76

[State 803, bind 2]
type=targetbind
trigger1=animelem = 4
pos=-11,-105

[State 803, bind 3]
type=targetbind
trigger1=animelem =5
pos=-40,-80

[State 803, bind 4]
type=targetbind
trigger1=animelem=5
pos=-70,-45

[State 803, hurt]
type=targetpoweradd
trigger1=animelem=5
value=48

[State 803, power]
type=poweradd
trigger1=animelem=5
value= 72*!var(20);ifelse(!var(13),72,36)*!var(20), 36*!var(20)

[State 803, throw]
type=targetstate
trigger1=animelem=1
value=804

[State 803, throw]
type=targetstate
trigger1=animelem=5
value=805

[State 803, pos]
type=posadd
trigger1=!animtime
x=3

[State 803, turn]
type=turn
trigger1=!animtime

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 581
ID = 581
pos = -135, 28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermovetime = 9999
pausemovetime = 9999
scale = 1, 1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause =1
;persistent =

[State 803, end]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;---TARGET---
[Statedef 804]
type=A
movetype=H
physics=N
velset=0,0
sprpriority=0

[State 804, anim]
type=changeanim2
trigger1=!time
value=802

[State 804, camera]
type=screenbound
trigger1=1
value=1
movecamera=0,0

;-------------------------------------------------------------------------------
[Statedef 805]
type=A
movetype=H
physics=N
velset=2,10

[State 805, grav]
type=gravity
trigger1=1

[State 805, hurt]
type=lifeadd
trigger1=vel y>0
trigger1=pos y>=-9
value=-100
persistent=0

[State 740, shake]
type=envshake
trigger1=vel y>0
trigger1=pos y>=0
time=8
freq=80
ampl=6

[State 805, hitground]
type=selfstate
trigger1=vel y>0
trigger1=pos y>=-9
value=5110

;---------------------------------------------------------------------------
;Trhow 2 - Ura Jigoku Guruma
[Statedef 810]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 810, No shaking]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 810, Grab Sound]
type = PlaySnd
trigger1 = time = 1
value = s2, 10

[State 810, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno= -1
sprpriority = 1
p1facing = ifelse (command = "holdfwd", 1, 1)
p2facing = 1
p1stateno = 811
guard.dist = 0
fall = 1
getpower = 50
givepower = 20
numhits = 0

[State 810, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Ura Jigoku Guruma
[Statedef 811]
type = A
physics = N
moveType = A
anim = 810
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 811, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 811, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 811, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 815

[State 811, Throw]
type = TargetFacing
trigger1 = AnimElem = 17
value = 1

[State 811, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(16) < 0
edge = 32,32
ignoreHitPause = 1

[State 811, Width]
type = Width
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
edge = 64,64
ignoreHitPause = 1

[State 811, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 35,0

[State 811, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 18,0

[State 811, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 12,-62

[State 811, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 2,-55

[State 811, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -14,-36

[State 811, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 9,0

[State 811, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 20,-52

[State 811, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = 2,-55

[State 811, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = -14,-36

[State 811, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = 9,0

[State 811, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = 20,-52

[State 811, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
pos = 2,-55

[State 811, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
pos = -14,-36

[State 811, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
pos = 9,0

[State 811, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
pos = 20,-52

[State 811, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
pos=-7,-54

[State 811, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 17
pos = -74,-57

[State 811, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 23
value = -150

[State 811, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 17
value = 36

[State 811, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 17 && !var(20)
value = 72

[State 811, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = -5

[State 811, VelSet]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 811, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 17
value = 1

[State 811, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 17
var(16) = 1
ignoreHitPause = 1

[State 811, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 17
value = 816

[State 811, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 0

[State 811, Woosh Sound 1]
type = PlaySnd
trigger1= AnimElem = 4
value = 2001,2

[State 811, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 6
value = 7,4

[State 811, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 8
value = 2001,2

[State 811, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 10
value = 7,4

[State 811, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 12
value = 2001,2

[State 811, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 14
value = 7,4

[State 811, Woosh Sound 1]
type = PlaySnd
trigger1= AnimElem = 16
value = 7,5

[State 811, voice]
type = PlaySnd
trigger1= AnimElem = 17
value = 2000,17

[State 811, Skid Dust]
type = Explod
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(8) < 0 && !(AnimElemTime(4) % 5)
anim = 7100
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 811, Skid Dust]
type = Explod
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(12) < 0 && !(AnimElemTime(9) % 5)
anim = 7100
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 811, Skid Dust]
type = Explod
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(16) < 0 && !(AnimElemTime(13) % 5)
anim = 7100
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 811, Turn]
type = Turn
trigger1 = !AnimTime

[State 811, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---TARGET---
[StateDef 815]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 815

[State 815, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

;-------------------------------------------------------------------------------
;After Throw
[StateDef 816]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -4.5, -8.5
sprPriority = 2

[State 816, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(1) >= 0
value = 1

[State 816, Turn]
type = Turn
trigger1 = !Time

[State 816, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 816, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5

[State 816, EnvShake]
type = EnvShake
trigger1 = vel y > 0 && pos y >= -24
time = 14
ampl = 4
freq = 120

[State 816, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= 0
value = 5200

[State 816, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= -24
value = 5100

