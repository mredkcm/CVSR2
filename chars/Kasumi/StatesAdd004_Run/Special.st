; _________________________________________
;| Kasumi Todoh by Falcon Rapper              |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
;Kasane Ate
[Statedef 1000]
type=S
movetype=A
physics=N
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
faceP2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1000

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(7) = 0
id = 1005
name = "Kasane Ate"
pos = 60,0
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = .3
size.yscale = .3
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

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Kasane Ate
[Statedef 1010]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
faceP2=1

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1000

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=-6,-85
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 1

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(7) = 1
id = 1005
name = "Kasane Ate"
pos = 60,0
postype = P1
stateno = 1005
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

[State 200, Type]
type=statetypeset
trigger1 = AnimElemtime(7) >= 1
movetype=I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Kasane Ate (Air)
[Statedef 1050]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
faceP2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
channel = 1

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(4) = 1
id = 1055
name = "Kasane Ate"
pos = 45,-32
postype = P1
stateno = 1055
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = .5
size.yscale = .5

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 1100, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 52

;---------------------------------------------------------------------------
;EX Kasane Ate (Air)
[Statedef 1060]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
faceP2=1

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=-6,-85
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
channel = 1

[State 1003,Helper]
type = Helper
trigger1 = AnimElemtime(4) = 1
id = 1055
name = "Kasane Ate"
pos = 45,-32
postype = P1
stateno = 1055
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = 1
size.yscale = 1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 1100, ChangeState]
type = ChangeState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 52


;---------------------------------------------------------------------------
;Senkou Nagashi
[Statedef 1100]
type = S
movetype= A
physics = N
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
anim = 1100
sprpriority = 2

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100]
type = posadd
trigger1 = AnimElemtime(3) = 0
x = 28 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(4) = 0
x = 6 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(5) = 0
x = 11 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(6) = 0
x = -3 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(7) = 0
x = 21 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(8) = 0
x = 12 + (var(10) * 2)

[State 1100]
type = velset
trigger1 = AnimElemtime(9) > 0
x = 0

[State 1100]
type = playsnd
trigger1 = AnimElem = 3 || AnimElem = 10
value = s1,1
channel = 1

[State 1100]
type = playsnd
trigger1 = AnimElem = 3
value = s4,2
channel = 0

[State 1100]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
getpower=72* !var(20), 0
givepower=35, 35
guardflag = MA
hitflag = MAF
pausetime = 8,11
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = -1
guard.velocity = -3
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1100]
type = HitDef
trigger1 = AnimElem = 11
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
getpower=72* !var(20), 0
givepower=35, 35
guardflag = MA
hitflag = MAF
pausetime = 8,12
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = -6
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 102, Dust]
type = helper
trigger1=AnimElem=3
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100]
type = ChangeState
trigger1 = AnimElemTime(11) = 6
trigger1 = var(2) = 1
value = 1110

[State 1100]
type = ChangeState
trigger1 = AnimElemTime(11) = 6
trigger1 = Ailevel
value = 1110

[State 1100]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Senkou Nagashi 2
[Statedef 1110]
type = S
movetype= A
physics = N
poweradd=12*!var(20)
juggle = 1
ctrl = 0
velset = 0,0
anim = 1110
sprpriority = 2

[State 1100]
type = velset
trigger1 = AnimElemtime(2) > 0 && AnimElemtime(5) < 0
x = 4

[State 1100]
type = velset
trigger1 = AnimElemtime(5) > 0
x = 0

[State 1150]
type = playsnd
trigger1 = AnimElem = 5
value = s1,1
channel = 1

[State 1150]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
guardflag = MA
hitflag = MAF
pausetime = 1,4
ground.type = low
ground.slidetime = 0
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1150]
type = ChangeState
trigger1 = AnimElemTime(6) = 4
trigger1 = var(2) = 2
value = 1120

[State 1150]
type = ChangeState
trigger1 = AnimElemTime(6) = 4
trigger1 = Ailevel
value = 1120

[State 1150]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Senkou Nagashi 3
[Statedef 1120]
type = S
movetype= A
physics = S
poweradd=12*!var(20)
juggle = 1
ctrl = 0
velset = 0,0
anim = 1120
sprpriority = 2

[State 1190]
type = posadd
trigger1 = AnimElemtime(2) = 0
x = 7
[State 1190]
type = PosAdd
trigger1 = AnimElemTime(3) = 0
x = 20

[State 1190]
type = playsnd
trigger1 = AnimElem = 3
value = s1,5
channel = 1

[State 1190]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
guardflag = MA
hitflag = MAF
pausetime = 2,4
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -6,-5
air.velocity = -2.2,-3.2
fall = 1
fall.recover = 0
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

[State 1190]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Senkou Nagashi EX
[Statedef 1150]
type = S
movetype= A
physics = N
poweradd= -500
ctrl = 0
velset = 0,0
anim = 1100
sprpriority = 2

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=8,-81
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1100]
type = posadd
trigger1 = AnimElemtime(3) = 0
x = 28 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(4) = 0
x = 6 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(5) = 0
x = 11 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(6) = 0
x = -3 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(7) = 0
x = 21 + (var(10) * 2)
[State 1100]
type = posadd
trigger1 = AnimElemtime(8) = 0
x = 12 + (var(10) * 2)

[State 1100]
type = velset
trigger1 = AnimElemtime(9) > 0
x = 0

[State 1100]
type = playsnd
trigger1 = AnimElem = 3 || AnimElem = 10
value = s1,1
channel = 1

[State 1100]
type = playsnd
trigger1 = AnimElem = 3
value = s4,2
channel = 0

[State 1100]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype = Hard
damage = 30,5
guardflag = MA
hitflag = MAF
pausetime = 8,11
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = -1
guard.velocity = -3
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1100]
type = HitDef
trigger1 = AnimElem = 11
attr = S, SA
animtype = Hard
damage = 30,5
guardflag = MA
hitflag = MAF
pausetime = 8,12
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = -6
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 102, Dust]
type = helper
trigger1=AnimElem=3
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100]
type = ChangeState
trigger1 = AnimElemTime(11) = 6
trigger1 = var(2) = 1
value = 1160

[State 1150]
type = ChangeState
trigger1 = AnimElemTime(6) = 4
trigger1 = Ailevel
value = 1160

[State 1100]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Senkou Nagashi EX 2
[Statedef 1160]
type = S
movetype= A
physics = N
poweradd=0
juggle = 1
ctrl = 0
velset = 0,0
anim = 1110
sprpriority = 2

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 1100]
type = velset
trigger1 = AnimElemtime(2) > 0 && AnimElemtime(5) < 0
x = 4

[State 1100]
type = velset
trigger1 = AnimElemtime(5) > 0
x = 0

[State 1150]
type = playsnd
trigger1 = AnimElem = 5
value = s1,1
channel = 1

[State 1150]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype = Hard
damage = 30,5
guardflag = MA
hitflag = MAF
pausetime = 1,4
ground.type = low
ground.slidetime = 0
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1150]
type = ChangeState
trigger1 = AnimElemTime(6) = 4
trigger1 = var(2) = 2
value = 1170

[State 1150]
type = ChangeState
trigger1 = AnimElemTime(6) = 4
trigger1 = Ailevel
value = 1170

[State 1150]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Senkou Nagashi EX 3
[Statedef 1170]
type = S
movetype= A
physics = S
poweradd=0
juggle = 1
ctrl = 0
velset = 0,0
anim = 1120
sprpriority = 2

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 1190]
type = posadd
trigger1 = AnimElemtime(2) = 0
x = 7
[State 1190]
type = PosAdd
trigger1 = AnimElemTime(3) = 0
x = 20

[State 1190]
type = playsnd
trigger1 = AnimElem = 3
value = s1,5
channel = 1

[State 1190]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
animtype = Hard
damage = 30,5
guardflag = MA
hitflag = MAF
pausetime = 2,4
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -6,-5
air.velocity = -2.2,-3.2
fall = 1
fall.recover = 0
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)
P2stateno=4060

[State 1190]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Tatsumaki Souda
[Statedef 1200]
type = S
movetype= A
physics = N
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
anim = 1200
sprpriority = 2

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1300]
type = posadd
trigger1 = AnimElemtime(7) = 0
x = 23
[State 1300]
type = posadd
trigger1 = AnimElemtime(8) = 0
x = 1
[State 1300]
type = posadd
trigger1 = AnimElemtime(9) = 0
x = 6

[State 1300]
type = playsnd
trigger1 = AnimElem = 1 || AnimElem = 7 || AnimElem = 13
value = s1,2

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 1300]
type = playsnd
trigger1 = AnimElem = 1
value = s1200,0

[State 1300]
type = playsnd
trigger1 = AnimElem = 7
value = s1200,1

[State 1300]
type = playsnd
trigger1 = AnimElem = 13
value = s1200,2

[State 1300]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
getpower=72* !var(20), 0
givepower=35, 35
hitflag = M
pausetime = 7,9
ground.type = Low
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1300]
type = HitDef
trigger1 = AnimElem = 8
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
guardflag = MA
hitflag = MAF
pausetime = 7,9
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1300]
type = HitDef
trigger1 = AnimElem = 14
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
guardflag = MA
hitflag = MAF
pausetime = 10,13
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1,-8.5
air.velocity = -1,-8
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1300]
type = HitDef
trigger1 = AnimElem = 16
attr = S, SA
animtype = Hard
damage = IfElse(var(10) = 0,20,IfElse(var(10) = 1,22,24)),5
guardflag = MA
hitflag = MAF
pausetime = 10,10
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -2,-8.5
air.velocity = -2,-8
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 420, ChangeState]
type = ChangeState
trigger1 = animelemtime(18)>=1 && movehit
trigger1 = command="holdup"
value = 40
ctrl = 0
ignorehitpause = 1

[State 102, Dust]
type = helper
trigger1=AnimElem=2
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1300]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Tatsumaki Souda
[Statedef 1250]
type = S
movetype= A
physics = N
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
anim = 1250
sprpriority = 2

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=8,-81
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) <= 0
value = SCA

[State 1300]
type = posadd
trigger1 = AnimElemtime(7) = 0
x = 23
[State 1300]
type = posadd
trigger1 = AnimElemtime(8) = 0
x = 1
[State 1300]
type = posadd
trigger1 = AnimElemtime(9) = 0
x = 6

[State 1300]
type = playsnd
trigger1 = AnimElem = 1 || AnimElem = 7 || AnimElem = 13
value = s1,2

[State 1300]
type = playsnd
trigger1 = AnimElem = 1
value = s1200,0

[State 1300]
type = playsnd
trigger1 = AnimElem = 7
value = s1200,1

[State 1300]
type = playsnd
trigger1 = AnimElem = 13
value = s1200,2

[State 1350]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype = Hard
damage = 20,5
hitflag = M
pausetime = 7,9
ground.type = Low
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1350]
type = HitDef
trigger1 = AnimElem = 8
attr = S, SA
animtype = Hard
damage = 20,5
guardflag = MA
hitflag = MAF
pausetime = 7,9
ground.type = High
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1350]
type = HitDef
trigger1 = AnimElem = 15
attr = C, SA
animtype = Hard
damage = 40,5
guardflag = MA
hitflag = MAF
pausetime = 7,9
ground.type = Low
ground.slidetime = 18
ground.hittime = 22
ground.cornerpush.veloff = 0
ground.velocity = 0
air.velocity = -2.2,-3.2
hitsound=S2+10*var(44),4
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1350]
type = HitDef
trigger1 = AnimElem = 20||AnimElem = 22
attr = S, SA
animtype = Hard
damage = 20,5
guardflag = MA
hitflag = MAF
pausetime = 10,13
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -2,-8
air.velocity = -2,-8
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 420, ChangeState]
type = ChangeState
trigger1 = animelemtime(23)>=1 && movehit
trigger1 = command="holdup"
value = 40
ctrl = 0
ignorehitpause = 1

[State 102, Dust]
type = helper
trigger1=AnimElem=2
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = -10,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1300]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Atemi Nage (Morote Gaeshi, Sasshou Inshuu & Messhin Mutou)
[Statedef 1300]
type = S
movetype= A
physics = S
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2StateType = A || Random < 500), 0, ifElse(Random < 500, 1, 2))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1301, 1302))

[State 1300]
type = playsnd
trigger1 = Time = 2
value = s4,0
channel = 0

[State 1300]
type = playsnd
trigger1 = Time = 2
value = s1,1

[State 1300,Messhin Mutou]
type = ReversalDef
trigger1 = anim=1300&&!Time
trigger1 = enemy,pos Y >= 0
attr = S, ST
reversal.attr = SCA, SA, HA
pausetime = 0,0
hitsound = s3,0
p1facing = 1
P2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 1310
P2stateno = 1320

[State 1300,Messhin Mutou]
type = ReversalDef
trigger1 = anim=1300&&!Time
trigger1 = enemy,pos Y < 0
attr = S, ST
reversal.attr = A, NA, SA, HA
pausetime = 0,0
hitsound = s3,0
p1facing = 1
P2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 1310
P2stateno = 1320

[State 1300,Sasshou Inshuu]
type = ReversalDef
trigger1 = anim=1301&&!Time
attr = S, ST
reversal.attr = S, NA, SA, HA
pausetime = 0,0
hitsound = s3,0
p1facing = 1
P2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 1311
P2stateno = 1321

[State 1300, Morote Gaeshi]
type = ReversalDef
trigger1 = anim=1302&&!Time
attr = C, ST
reversal.attr = C, NA, SA, HA
pausetime = 0,0
hitsound = s3,0
p1facing = 1
P2facing = 1
sparkno = -1 + 0*(var(33):=8017)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 1312
P2stateno = 1322


[State 1300]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Messhin Mutou (P1)
[Statedef 1310]
type = S
movetype= A
physics = N
anim = 1310
poweradd = 0

[State 1210, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8017
ID = 8000
name = "Spark"
postype = p1
pos = 32, -96
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1312]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5

[State 1312]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4,2

[State 1312]
type = TargetBind
trigger1 = AnimElemTime(2) <= 0
pos = 35, 0

[State 1312]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 40, 0
[State 1312]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 3, -64
[State 1312]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -11, -66
[State 1312]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(6) < 1
pos = -54, -70

[State 1312]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 1312]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = -78

[State 1312]
type = TargetState
trigger1 = AnimElemtime(6) = 1
value = 1330

[State 1312]
type = Turn
trigger1 = AnimElemtime(9) = 0

[State 1312]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Sasshou Inshuu (P1)
[Statedef 1311]
type = S
movetype= A
physics = N
anim = 1311
poweradd = 0

[State 1230, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8017
ID = 8000
name = "Spark"
postype = p1
pos = 22, -75
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1550]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5

[State 1550]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, 2

[State 1550]
type = PlaySnd
trigger1 = AnimElem = 5
value = S2+10*var(44),5

[State 1550]
type = TargetBind
trigger1 = AnimElemTime(2) < 0
pos = 27, 0

[State 1550]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
pos = 30, 0
[State 1550]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 34, -75
[State 1550]
type = TargetBind
trigger1 = AnimElemTime(6) = 0
pos = 13, 0

[State 1550]
type = Width
trigger1 = AnimElemTime(7) < 0
edge = 60,0

[State 1550]
type = Posadd
trigger1 = AnimElemTime(5) = 0
x = 43

[State 1550]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -102

[State 1100, HitSpark]
type=Helper
trigger1 = AnimElem = 5
helperType=Normal
stateNo=8005
ID=8000
name="Spark"
pos= 30,-70
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 1550]
type = TargetState
trigger1 = AnimElemTime(6) = 1
value = 1331

[State 1550]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Morote Gaeshi (P1)
[Statedef 1312]
type = S
movetype= A
physics = N
anim = 1312
poweradd = 0

[State 1210, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8017
ID = 8000
name = "Spark"
postype = p1
pos = 26, -33
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1, 5

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4,2

[State 1350]
type = TargetBind
trigger1 = AnimElemTime(2) < 0
pos = 38, 0

[State 1350]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 30, 0
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 22, -70
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -1, -85
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = -8, -85
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(7) = 0
pos = -60, -50

[State 1350]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 1350]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value = -78

[State 1350]
type = TargetState
trigger1 = AnimElemtime(7) = 1
value = 1332

[State 1350]
type = Turn
trigger1 = AnimElemtime(10) = 0

[State 1350]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Messhin Mutou (P2) 1
[Statedef 1320]
type = A
movetype= H
physics = N
velset = 0,0

[State 1322]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1320

;---------------------------------------------------------------------------
;Sasshou Inshuu (P2) 1
[Statedef 1321]
type = A
movetype= H
physics = N
velset = 0,0

[State 1590]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1321

;---------------------------------------------------------------------------
;Morote Gaeshi (P2) 1
[Statedef 1322]
type = A
movetype= H
physics = N
velset = 0,0

[State 1390]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1322

;---------------------------------------------------------------------------
;Messhin Mutou (P2) 2
[Statedef 1330]
type = A
movetype= H
physics = N
velset = 4,-4.5
poweradd = 40

[State 1332]
type = VelAdd
Trigger1 = 1
y = .45

[State 1332]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


;---------------------------------------------------------------------------
;Sasshou Inshuu (P2) 2
[Statedef 1331]
type = A
movetype= H
physics = N
velset = -4.5,-5
poweradd = 40

[State 1591]
type = VelAdd
Trigger1 = 1
y = .45

[State 1591]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;Morote Gaeshi (P2) 2
[Statedef 1332]
type = A
movetype= H
physics = N
velset = 4,-5.5
poweradd = 40

[State 1391]
type = VelAdd
Trigger1 = 1
y = .45

[State 1391]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;Atemi Nage EX
[Statedef 1350]
type = S
movetype= A
physics = N
anim = 1350
poweradd=-500
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=8,-81
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1300]
type = playsnd
trigger1 = Time = 2
value = s4,0
channel = 0

[State 1300]
type = playsnd
trigger1 = Time = 2
value = s1,1

[State 1300,Sasshou Inshuu]
type = ReversalDef
trigger1 = !Time
attr = S, ST
reversal.attr = SCA, NA, SA, HA
pausetime = 0,0
hitsound = s3,0
p1facing = 1
P2facing = 1
sparkno = -1 + 0*(var(33):=8013)
sparkxy = -10 + 0*(var(35):=160), var(36):=9999
p1stateno = 1360
P2stateno = 860

[State 1300]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Morote Gaeshi (P1)
[Statedef 1360]
type = S
movetype= A
physics = N
anim = 1360
poweradd = 0

[State 1210, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8017
ID = 8000
name = "Spark"
postype = p1
pos = 32, -76
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 820]
type = PlaySnd
trigger1 = time = 0
value = 5, 8

[State 820]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0, 1

[State 820]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,3

[State 820]
type = TargetBind
trigger1 = AnimElemTime(3) <= 0
pos = 50, 0

[State 820]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 55, 0
[State 820]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 50, 0
[State 820]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 25, -50
[State 820]
type = TargetBind
trigger1 = AnimElemTime(7) = 0
pos = -12, 0

[State 820]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 820]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = -78

[State 820]
type = PlaySnd
trigger1 = AnimElem = 7
value = 2+10*var(44),5

[State 820]
type = EnvShake
trigger1 = AnimElem = 7
time = 15

[State -2, Ground Impact Dust]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1

[State 820]
type = TargetState
trigger1 = AnimElemtime(10) = 0
value = 1322

[State 820]
type = Turn
trigger1 = AnimElemtime(10) = 0

[State 820]
type = ChangeState
trigger1 = AnimElemtime(10) = 0
value = 1370

;---------------------------------------------------------------------------
;Messhin Mutou (P1)
[Statedef 1370]
type = S
movetype= A
physics = N
anim = 1312
poweradd = 0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1, 5

[State 1350]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4,2

[State 1350]
type = TargetBind
trigger1 = AnimElemTime(2) < 0
pos = 38, 0

[State 1350]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 30, 0
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 22, -70
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -1, -85
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = -8, -85
[State 1350]
type = TargetBind
trigger1 = AnimElemTime(7) = 0
pos = -60, -50

[State 1350]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 1350]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value = -78

[State 1350]
type = TargetState
trigger1 = AnimElemtime(7) = 1
value = 1390

[State 1350]
type = Turn
trigger1 = AnimElemtime(10) = 0

[State 1350]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Messhin Mutou (P2) 1
[Statedef 1380]
type = A
movetype= H
physics = N
velset = 0,0

[State 1312]
type = Turn
trigger1 = !time

[State 1322]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1322

;---------------------------------------------------------------------------
;Morote Gaeshi (P2) 2
[Statedef 1390]
type = A
movetype= H
physics = N
velset = -4,-7.5
poweradd = 40

[State 1391]
type = VelAdd
Trigger1 = 1
y = .45

[State 1391]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;Tenchi Shuuten
[Statedef 1400]
type = S
movetype= A
physics = S
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
anim = 1400
sprpriority = 2

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 0 + (var(10) * 2)

[State 1400]
type = playsnd
trigger1 = Time = 2
value = s1200,1
channel = 0

[State 1400]
type = playsnd
trigger1 = Time = 2
value = s1,3
channel = 1

[State 1400]
type = HitDef
Trigger1 = Time = 0
Trigger1 = P2stateno != [120,169]
attr = S, ST
hitflag = MAF
priority = 1, Miss
sparkno = s6040
sparkxy = -37, -94
hitsound = s2,800
sprpriority = 1
p1facing = 1
P2facing = 1
p1stateno = 1410
P2stateno = 1420
guard.dist = 0
fall = 1
fall.recover = 0
numhits = 0

[State 1400]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Tenchi Shuuten (P1)
[Statedef 1410]
type = S
movetype= A
physics = N
anim = 1410
velset = 0,0
poweradd = 0
sprpriority = 1

[State 1410]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1

[State 1410]
type = Hitadd
trigger1 = AnimElem = 5
value = 1

[State 1410]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2

[State 1410]
type = TargetBind
trigger1 = AnimElemTime(2) < 0
pos = 37, -94

[State 1410]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 40, -83
[State 1410]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 28, -47
[State 1410]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 0, -31
[State 1410]
type = TargetBind
trigger1 = AnimElemTime(5) = 0
pos = -32, -74

[State 1410]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 60,0

[State 1410]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -68 - (var(10) * 6)

[State 1410]
type = Turn
trigger1 = AnimElemtime(7) = 0

[State 1410]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Tenchi Shuuten (P2)
[Statedef 1420]
type = A
movetype= H
physics = N
velset = 0,0
poweradd = 40
sprpriority = 2

[State 1420]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1420

[State 1420]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 1420]
type = VelSet
Trigger1 = AnimElemTime(5) = 0
x = 2
y = -13

[State 1420]
type = VelAdd
Trigger1 = AnimElemTime(5) >= 0
y = .45

[State 1420]
type = VelSet
trigger1 = AnimElemTime(5) >= 0
trigger1 = FrontEdgeDist < 0
x = 0
[State 1420]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
trigger1 = FrontEdgeDist < 0
x = 0

[State 1410]
type = LifeAdd
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -40

[State 1420]
type = SelfState
Trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;Tenchi Shuuten EX
[Statedef 1450]
type = S
movetype= A
physics = S
poweradd=-500
ctrl = 0
velset = 0,0
anim = 1400
sprpriority = 2

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=8,-81
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3


[State 1000, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 6

[State 1400]
type = playsnd
trigger1 = Time = 2
value = s1200,1
channel = 0

[State 1400]
type = playsnd
trigger1 = Time = 2
value = s1,3
channel = 1

[State 1400]
type = HitDef
Trigger1 = Time = 0
Trigger1 = P2stateno != [120,169]
attr = S, ST
hitflag = MAF
priority = 1, Miss
sparkno = s6040
sparkxy = -37, -94
hitsound = s2,800
sprpriority = 1
p1facing = 1
P2facing = 1
p1stateno = 1410
P2stateno = 1420
guard.dist = 0
fall = 1
fall.recover = 0

[State 1400]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hakusan Tou
[Statedef 1500]
type = S
movetype= A
physics = N
poweradd=72*!var(20)
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1500

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1200]
type = playsnd
trigger1 = AnimElem = 3
value = s4,2
channel = 0

[State 1200]
type = playsnd
trigger1 = AnimElem = 3
value = s1,2

[State 1200]
type = ReversalDef
trigger1 = AnimElem = 2
attr = S, ST
reversal.attr = SCA, NA, SA, HA
pausetime = 11,11
hitsound = s3,0
sparkno = -1
sparkxy = 0,10
numhits = 0

[State 1200]
type = HitDef
trigger1 = AnimElem = 5 && enemy,stateno!=1599
attr = S, SA
animtype = Hard
damage = 32 + (var(10) * 2),5
getpower=72* !var(20), 0
guardflag = MA
hitflag = MAF
pausetime = 10,10
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1,-8
air.velocity = -1,-4
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1200]
type = HitDef
trigger1 = AnimElem = 7 && enemy,stateno!=1599
attr = S, SA
animtype = Hard
damage = 48 + (var(10) * 2),10
guardflag = MA
hitflag = MAF
pausetime = 10,10
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1,-8
air.velocity = -1,-7
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)
id = 1500

[State 1400, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1500)
trigger1 = !(Target(1500), Time)
value = 1599
ID = 1500
ignoreHitPause = 1

[State 200, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 1200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hakusan Tou
[Statedef 1550]
type = S
movetype= A
physics = N
poweradd=-500
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1500

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1 = AnimElemTime(1) = 0
anim=8210
sprPriority=3
posType=p1
pos=8,-81
scale=0.5, 0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1200]
type = playsnd
trigger1 = AnimElem = 3
value = s4,2
channel = 0

[State 1200]
type = playsnd
trigger1 = AnimElem = 3
value = s1,2

[State 1200]
type = ReversalDef
trigger1 = AnimElem = 2
attr = S, ST
reversal.attr = SCA, NA, SA, HA
pausetime = 11,11
hitsound = s3,0
sparkno = -1
sparkxy = 0,10
numhits = 0

[State 1200]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype = Hard
damage = 32 + (var(10) * 2),5
getpower=72* !var(20), 0
guardflag = MA
hitflag = MAF
pausetime = 15,15
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1,-8
air.velocity = -1,-4
yaccel = .5
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1200]
type = HitDef
trigger1 = AnimElem = 7
attr = S, SA
animtype = Hard
damage = 48 + (var(10) * 2),10
guardflag = MA
hitflag = MAF
pausetime = 10,10
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1,-8
air.velocity = -1,-7
fall = 1
fall.recover = 0
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)
id = 1500

[State 1400, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1500)
trigger1 = !(Target(1500), Time)
value = 1599
ID = 1500
ignoreHitPause = 1

[State 1200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Hakusan Gethit State
[Statedef 1599]
type = A
movetype= H
physics = N
velset = -1,-7
ctrl = 0
anim = 5050

[State 3030,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

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
y = .35

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