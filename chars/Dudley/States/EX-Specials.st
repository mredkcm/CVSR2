; _______________________________________
;| Dudley by Dick Buckus & Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;===< EX SPECIAL STATES >==
;====

; EX Machine Gun Blow
[Statedef 1030]
type = S
movetype= A
physics = S
juggle = 4
poweradd= -500
velset = 0,0
anim = 1030
ctrl = 0
facep2 = 1
sprpriority = 2

[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 6, 2
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 22, -76
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S40,8
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = !time
stateno = 8101
pos = 0, 0
sprpriority = -1
[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(2)>=0 && animelemtime(4)<0
value = ,NA,NP
time = 1
[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(2)<0
value = ,NA,NP,SP
time = 1

[State 1000, Width]
type = Width
trigger1 = AnimElem = 1, >= 0
value = 10,0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
;x = ifelse((p2dist x= [0,100]), 30, 50)
x = (p2dist x/5.5)

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1000, Position]
type = PosAdd
trigger1 = (Anim = 1010 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 15 || AnimElem = 22 || AnimElem = 23 || AnimElem = 25)) || (Anim = 1020 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 16 || AnimElem = 23 || AnimElem = 24 || AnimElem = 26))
x = Ifelse((AnimElem=2),25,Ifelse((AnimElem=4),9,Ifelse((Anim=1010&&AnimElem=15)||(Anim=1020&&AnimElem=16),15,Ifelse((Anim=1010&&AnimElem=22)||(Anim=1020&&AnimElem=23),0,Ifelse((Anim=1010&&AnimElem=23)||(Anim=1020&&AnimElem=26),0,1)))))

;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = animelem = 8||animelem = 9||animelem = 10||animelem = 11||animelem = 12
;value = S100,0
;channel = 0
;
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = animelem = 1||animelem = 17|| animelem = 24
;value = S100,2
;channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1130,0
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1130,0
channel = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 18 || animelem = 25
value = S1,ifelse((animelem=18 || animelem = 25),3,1)
volume = ifelse((animelem=18 || animelem=25),255,100)
[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 8||animelem = 9||animelem = 10||animelem = 11||animelem= 12
attr = S, SA
animtype = Hard
damage = 28, 5
getpower = 0,0
priority=4,Hit
guardflag = HA
hitflag = MAF
pausetime = 5,13
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=(77)), var(13):=ifelse((animelem=9),-83,ifelse((animelem=10),-89,ifelse((animelem=11),-61,ifelse((animelem=12),-72,-77))))
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = 0,0
air.velocity = 0,0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 18
attr = S, SA
animtype = Hard
damage = 42, 5
getpower = 0,0
priority=4,Hit
guardflag = M
hitflag = MAF
pausetime = 0,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=71), var(13):=-92
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 30
ground.velocity = 0,0
air.velocity = 0,0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 25
attr = S, SA
animtype = Up
damage = 44, 5
getpower = 0,0
priority=4,Hit
guardflag = H
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=71), var(13):=-92
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 30
ground.velocity = 0,-7.5
air.velocity = 0,-7.5
fall.recover = 0
fall = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(27)>=0
movetype=I

[State 1006, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; EX Jet Upper
[Statedef 1080]
type = S
movetype= A
physics = S
juggle = 4
poweradd= -500
velset = 0,0
anim = 1080
ctrl = 0
facep2 = 1
sprpriority = 2

[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 6, 2
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 52,-38
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 810, Effect]
type = PlaySnd
trigger1 = anim = 1080
trigger1 = animelem=7
value = 1, 3
[State 220, 1]
type = PlaySnd
trigger1 = anim = 1080
trigger1 = animelem = 7
value = 40, 7

[State -3, Jumping Dust]
type = Helper
helpertype = normal
triggerall = anim = 1080
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1

[State 0, PosAdd]
type = PosAdd
triggerall = anim = 1080
trigger1 = animelem=2||animelem=3||animelem=7
x = 10

[State 1051, VelSet]
type = StatetypeSet
trigger1 = time >=7
statetype=A
physics = N

[State 0, Traditional F, D, DF Uppercut invincibile startup]
type = NotHitBy
trigger1 = time<3
value = ,NA,SA,NP,SP,HP,NT
time = 1

[State 1051, VelSet]
type = VelSet
trigger1 = time =7
x = 2.5
y = -14;-var(1)*2.5

[State 1051, VelAdd]
type = VelAdd
trigger1 = time >=7
y = .5

[State 1051, VelAdd]
type = Velmul
trigger1 = time >=27
x = .95

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1080
trigger1 = animelem = 4
value = S1050,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1080
trigger1 = animelem = 5
value = S1,5

[State 1051, 2]
type = HitDef
trigger1 = animelemtime(5) = ifelse(AIlevel,0,1)
attr = C, SA
damage = 85,6
getpower = 0,0
priority=4,Hit
animtype = Medium
hitflag = MAF
guardflag = L
ID = 1080
pausetime = 8,8
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-38
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 4
ground.hittime = 10
fall = 1
ground.velocity = -1,-11.5
guard.velocity = -6
air.velocity = -1,-11.5
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 1051, 3]
type = HitDef
trigger1 = AnimElem >= 7
attr = S, SA
animtype = Up
damage = ifelse(numtarget(1080),85,128), 6
getpower = 0,0
priority=4,Hit
guardflag = HA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-11.5
guard.velocity = -6
ID = 1081
air.velocity = -1,-11.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0      ;40 ticks before p2 can recover from fall

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 30
value = 1081

[State AttackDone]
type=statetypeset
trigger1= anim = 1081
movetype=I

[State 1051, 3] ;Change state when KFM is close to ground
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052

;------------------------------------------------------------------------------------------
;EX Cross-Counter - Start
[Statedef 1110]
type = S
movetype = I
physics = S
anim = 1110
sprpriority = 2
poweradd = -500
velset = 0,0
ctrl = 0
facep2 = 1
[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 6, 2
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 13,-88
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 1100, Reversal]
type = ReversalDef
trigger1 = 1
reversal.attr = SA, AA
pausetime = 0, 24
hitsound = S6,0
priority = 999999
numhits = 0
p1stateno = 1115


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,NP
time = 1

[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 1100, 2
channel = 0
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 1100, 2
channel = 2


[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;EX Cross-Counter - Strike
[Statedef 1115]
type = S
movetype = A
physics = S
Anim = 1107
sprpriority = 0
juggle = 3
velset = 0,0
ctrl = 0
facep2 = 1

[State 1510, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8020
ID = 8000
name = "Spark"
postype = p1
pos = ceil(25 * const(size.xscale)), ceil(-70 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1107 && !animtime
value = 1108
ignorehitpause = 1
persistent = 1
[State 0, Turn]
type = Turn
trigger1 = anim = 1108 && animelemtime(1) = 0
ignorehitpause = 1
persistent = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1105, Cross]
type = Explod
trigger1 = animelem = 5
anim = 1106
postype = p1
sprpriority = 1
bindtime = -1

;[State 1105, Damage]
;type = LifeAdd
;trigger1 = Time = 0
;value = Ifelse ((P2StateNo = [200, 999]), -40, Ifelse ((P2StateNo = [1000, 2999]), -80, -140))

[State 1105, Sprite]
type = SprPriority
trigger1 = AnimElem = 5
value = 2

[State 1105, Push]
type = PlayerPush
trigger1 = AnimElemTime(21) < 0
value = 0

[State 0, VelSet]
type = VelSet
trigger1 =  animelem = 6
x = 40

[State 0, VelSet]
type = VelSet
trigger1 =  animelem = 9
x = 0
[State 0, PlayerPush]
type = PlayerPush
trigger1 = anim = 1107
value = 0
ignorehitpause = 1
persistent = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 1108 && animelem = 7
value = S1100,0
channel = 0
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 1107 && animelem = 7
;value = S100,0
;channel = 0
[State 0, *Wink*]
type = PlaySnd
trigger1 = anim = 1107 && animelem = 1
value = S1100,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S1,3

[State 1105, Hit]
type = HitDef
;triggerall = prevstateno = 1100
trigger1 = anim = 1107 && AnimElem = 8
attr = S, SA
guardflag = MA
hitflag = MAF
animtype = Hard
air.animtype = Diagup
priority = 7
getpower = 0
givepower = 175
damage = 85
pausetime = 1, 1
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-80
hitsound = S2,3
guardsound = S6, 0
ground.type = High
guard.slidetime = 15
ground.hittime = 15
ground.velocity = -2, -10
air.velocity = Ifelse ((Var(2) = 3 && AnimElem = 8), 3, Ifelse ((Var(2) = 3 && AnimElem = 18), -5, -2)), Ifelse ((Var(2) = 3 && AnimElem = 8), -8, -10)
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1
fall.recover = 0
yaccel = .6
[State 1105, Hit]
type = HitDef
;triggerall = prevstateno = 1100
trigger1 = anim = 1108 && AnimElem = 8
attr = S, SA
guardflag = MA
hitflag = MAF
animtype = Hard
air.animtype = Diagup
priority = 8
getpower = 0
givepower = 175
damage = 85
pausetime = 1, 11
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-80
hitsound = S2,3
guardsound = S6, 0
ground.type = High
guard.slidetime = 15
ground.hittime = 15
ground.velocity = -2, -10
air.velocity = Ifelse ((Var(2) = 3 && AnimElem = 8), 3, Ifelse ((Var(2) = 3 && AnimElem = 18), -5, -2)), Ifelse ((Var(2) = 3 && AnimElem = 8), -8, -10)
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1
fall.recover = 0
yaccel = .6

[State AttackDone]
type=statetypeset
trigger1= anim = 1108 && animelemtime(9)>=0
movetype=I

[State 1100, StateChange]
type = ChangeState
trigger1 = anim = 1108 && AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; EX Ducking
[Statedef 1180]
type = S
movetype= I
physics = S
juggle = 0
poweradd= -500
velset = 0,0
anim = 1180
ctrl = 0
facep2 = 1
sprpriority = 2
[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 6, 2
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 22, -76
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1


[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelemtime(2) = 1
stateno = 8101
pos = 0, 0
sprpriority = -1
[State 0, Velset]
type = Velset
trigger1 = animelem= 2
x = (p2dist x/8)

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,24]
value = ,NA,SA,AP,NT

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S100,0
channel = 0

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [12,26]
trigger1 = command = "x"||command = "y"||command = "z"
value = 1181
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [12,26]
trigger1 = command = "holdx"||command = "holdy"||command = "holdz"
value = 1181
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [12,26]
trigger1 = command = "holda"||command = "holdb"||command = "holdc"
value = 1182
ctrl = 0

[State 1100, Uppercut]
type=changestate
trigger1= var(7)>=1 && time>=12 && anim=1180 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<75
value=1182
;---------------------------------------------------------------------------
; EX Ducking Straight
[Statedef 1181]
type = S
movetype= A
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 1181
ctrl = 0
sprpriority = 2

[State 0, Velset]
type = Velset
trigger1 = animelem= 1
x = 8

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S100,2
channel = 0

[State 0, HitBy]
type = HitBy
trigger1 = time = [0,10]
value = ,AA,AT

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,10]
value = ,AP

[State 220, 2]
type = HitDef
trigger1 = AnimElem = 7
attr = S, SA
animtype = Hard
damage = 150
getpower = 0,0
guardflag = HA
hitflag = MAF
pausetime = 8,21
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 19
ground.velocity = 0, 0
air.velocity = -6, -6
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; EX Ducking Upper
[Statedef 1182]
type = S
movetype= A
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 1152
ctrl = 0
sprpriority = 2

[State 0, Velset]
type = Velset
trigger1 = animelem= 1
x = 8

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, HitBy]
type = HitBy
trigger1 = time = [0,10]
value = ,AA,AT

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,10]
value = ,AP

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S1050,0
channel = 0

[State 420, 2]
type = HitDef
trigger1 = animelem = 4
attr = S, SA
damage = 70
getpower = 0,0
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 8,8
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-55
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -1
air.velocity = -1,-2
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 420, 2]
type = HitDef
trigger1 = animelem = 7
attr = S, SA
damage = 70
getpower = 0,0
animtype = Hard
hitflag = MAF
guardflag = H
pausetime = 9,12
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-93
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 23
ground.velocity = 0,-7.5
air.velocity = 0,-7.5
fall = 1
fall.recover = 0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; EX Short Swing Blow
[Statedef 1230]
type = S
movetype= A
physics = S
juggle = 4
poweradd= -500
velset = 0,0
anim = 1230
ctrl = 0
facep2 = 1
sprpriority = 2
[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 6, 2
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 22, -76
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7)<0
value = ,NA,NP,SP
time = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7)>=0 && animelemtime(9)<0
value = ,NA,NP
time = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = -42

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = -43

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 25

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 20
x = 8
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 27
x = 11

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 31 || animelem = 23 || animelem = 12
x = 0


;[State 1200, 1]
;type = PlaySnd
;trigger1 = AnimElem = 2
;value = 100, 2
;channel = 0
;[State 1200, 1]
;type = PlaySnd
;trigger1 = AnimElem = 16
;value = 100, 0
;channel = 0
;[State 1200, 1]
;type = PlaySnd
;trigger1 = AnimElem = 28
;value = 100, 4
;channel = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElemtime(5) = 0
value = 1230, 0
channel = 0
[State 1200, 1]
type = PlaySnd
trigger1 = AnimElemtime(5) = 0
value = 1230, 0
channel = 2
[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 14,1
value = 1230, 1
channel = 0
[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 14,1
value = 1230, 1
channel = 2
[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 28,1
value = 1230, 2
channel = 0
[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 28,1
value = 1230, 2
channel = 2

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 11 || animelem = 21 || animelem = 31
value = 1, 3;ifelse((animelem=21),2,3)

[State 1200, Width 1]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(17) < 0
value = 20,0

[State 240, 2]
type = HitDef
trigger1 = time = 0
attr = S, SA
animtype = Medium
damage = 61
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-64
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -0
air.velocity = -0,-3
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 420, 2]
type = HitDef
trigger1 = animelem = 22
attr = S, SA
damage = 62
getpower = 0,0
animtype = Hard
hitflag = MAF
guardflag = H
pausetime = 9,12
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-93
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 23
ground.velocity = 1,0
air.velocity = 0,-3
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 220, 2]
type = HitDef
trigger1 = animelem = 31
attr = S, NA
animtype = Hard
damage = 62
getpower = 0,0
guardflag = HA
hitflag = MAF
pausetime = 8,12
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
fall = 1
fall.recover = 0
ground.velocity = -6,-4
air.velocity = -6,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(33)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

