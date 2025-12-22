; _______________________________________
;| Dudley by Dick Buckus & Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES >===
;====

; Light Machine Gun Blow
[Statedef 1000]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1000
ctrl = 0
facep2 = 1
sprpriority = 2
[State 1000, Width]
type = Width
trigger1 = AnimElem = 1, >= 0
value = 10,0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(5)<0
value = ,NP
time = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 0

[State 1000, Position]
type = PosAdd
trigger1 = (Anim = 1000 && (AnimElem = 2 || AnimElem = 12 || AnimElem = 19 || AnimElem = 20 || AnimElem = 23)) || (Anim = 1003 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 16))
x = Ifelse ((Anim = 1000 && AnimElem = 2) || (AnimElem = 4), 7, Ifelse ((AnimElem = 12) || (AnimElem = 16), 15, Ifelse ((Anim = 1003 && AnimElem = 2), 18, Ifelse ((AnimElem = 19), 0, Ifelse ((AnimElem = 20), 3, 1)))))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6||animelem = 7
value = S100,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = S100,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6 || animelem = 7 || animelem = 14
value = S1,ifelse((animelem=14),3,1)
volume = ifelse((animelem=14),255,100)
[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 6||animelem = 7
attr = S, SA
animtype = Hard
damage = 33, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 5,13
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=ifelse((animelem=7),-83,-71)
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -4,0
air.velocity = -4,0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 14
attr = S, SA
animtype = Hard
damage = 35, 4
getpower = 50,50
priority=4,Hit
guardflag = M
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=71), var(13):=-92
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -6,0
air.velocity = -.5,-5
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(15)>=0
movetype=I

[State 1000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Strong Machine Gun Blow
[Statedef 1010]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1010
ctrl = 0
facep2 = 1
sprpriority = 2

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
trigger1 = time = 1
stateno = 8101
pos = 0, 0
sprpriority = -1
[State 1000, Width]
type = Width
trigger1 = AnimElem = 1, >= 0
value = 10,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7)<0
value = ,NP
time = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 14

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1000, Position]
type = PosAdd
trigger1 = (Anim = 1010 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 15 || AnimElem = 22 || AnimElem = 23 || AnimElem = 25)) || (Anim = 1002 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 16 || AnimElem = 24 || AnimElem = 25 || AnimElem = 27))
x = Ifelse((AnimElem=2),18,Ifelse((AnimElem=4),7,Ifelse((Anim=1010&&AnimElem=15)||(Anim=1002&&AnimElem=16),15,Ifelse((Anim=1010&&AnimElem=22)||(Anim=1002&&AnimElem=23),0,Ifelse((Anim=1010&&AnimElem=23)||(Anim=1002&&AnimElem=25),0,1)))))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8||animelem = 9||animelem = 10
value = S100,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1||animelem = 16
value = S100,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 17
value = S1,ifelse((animelem=17),3,1)
volume = ifelse((animelem=17),255,100)
[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 8||animelem = 9||animelem = 10
attr = S, SA
animtype = Hard
damage = 33, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 5,13
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=ifelse((animelem=9),-89,ifelse((animelem=10),-80,-71))
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -4,0
air.velocity = -4,0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 17
attr = S, SA
animtype = Hard
damage = 35, 4
getpower = 25,25
priority=4,Hit
guardflag = M
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=71), var(13):=-92
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 22
ground.velocity = -6,0
air.velocity = -.5,-5
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(18)>=0
movetype=I

[State 1003, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Fierce Machine Gun Blow
[Statedef 1020]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1020
ctrl = 0
facep2 = 1
sprpriority = 2

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
trigger1 = time = 2
stateno = 8101
pos = 0, 0
sprpriority = -1
[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7)<0
value = ,NP
time = 1

[State 1000, Width]
type = Width
trigger1 = AnimElem = 1, >= 0
value = 10,0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 20

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 1000, Position]
type = PosAdd
trigger1 = (Anim = 1010 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 15 || AnimElem = 22 || AnimElem = 23 || AnimElem = 25)) || (Anim = 1020 && (AnimElem = 2 || AnimElem = 4 || AnimElem = 16 || AnimElem = 23 || AnimElem = 24 || AnimElem = 26))
x = Ifelse((AnimElem=2),25,Ifelse((AnimElem=4),9,Ifelse((Anim=1010&&AnimElem=15)||(Anim=1020&&AnimElem=16),15,Ifelse((Anim=1010&&AnimElem=22)||(Anim=1020&&AnimElem=23),0,Ifelse((Anim=1010&&AnimElem=23)||(Anim=1020&&AnimElem=26),0,1)))))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8||animelem = 9||animelem = 10||animelem = 11
value = S100,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1||animelem = 17
value = S100,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 18
value = S1,ifelse((animelem=18),3,1)
volume = ifelse((animelem=18),255,100)
[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 8||animelem = 9||animelem = 10||animelem = 11||animelem= 12
attr = S, SA
animtype = Hard
damage = 26, 4
getpower = 12,12
priority=4,Hit
guardflag = MA
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
ground.velocity = -4,0
air.velocity = -4,0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 10001, 2] ;Opponent near
type = HitDef
trigger1 = AnimElem = 18
attr = S, SA
animtype = Hard
damage = 35, 4
getpower = 15,15
priority=4,Hit
guardflag = M
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
ground.velocity = -6,0
air.velocity = -.5,-5
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(19)>=0
movetype=I

[State 1006, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Light Jet Upper
[Statedef 1050]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1050
ctrl = 0
facep2 = 1
sprpriority = 2
[State 810, Effect]
type = PlaySnd
trigger1 = anim = 1050
trigger1 = animelem=7
value = 1, 3
[State 220, 1]
type = PlaySnd
trigger1 = anim = 1050
trigger1 = animelem = 7
value = 40, 7
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=2||animelem=3||animelem=7
x = 8

[State 0, Traditional F, D, DF Uppercut invincibile startup]
type = NotHitBy
trigger1 = time<2
value = ,NA,SA,NP,SP,NT
time = 1

[State 1051, VelSet]
type = StatetypeSet
trigger1 = time >=7
statetype=A
physics = N

[State 1051, VelSet]
type = VelSet
trigger1 = time =7
x = 1
y = -7;-var(1)*2.5

[State 1051, VelAdd]
type = VelAdd
trigger1 = time >=7
y = .5

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1050
trigger1 = animelem = 4
value = S1050,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1050
trigger1 = animelem = 5
value = S1,5

[State 1051, 3]
type = HitDef
trigger1 = AnimElem = 6
attr = S, SA
animtype = Up
damage = 82, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-8
guard.velocity = -6
air.velocity = -1,-6.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0      ;40 ticks before p2 can recover from fall

[State 1051, 3]
type = HitDef
trigger1 = AnimElem >= 7
trigger1= !movecontact && !movereversed
attr = S, SA
animtype = Up
damage = 82, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
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
ground.velocity = -1,-8
guard.velocity = -6
air.velocity = -1,-6.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 20
value = 1051

[State AttackDone]
type=statetypeset
trigger1= anim=1051
movetype=I

[State 1051, 3] ;Change state when KFM is close to ground
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052
;--------------------------------------------------------------------------
;Jet Upper - Land
[Statedef 1052]
type = S
movetype= I
physics = S
anim = ifelse(prevstateno=1080,1053,1052)
sprpriority = 1
velset = 0,0

[State 1052, 1] ;Reset y-position to ground level
type = PosSet
trigger1 = Time = 0
y = 0

[State 1052, 2] ;Play a sound for landing
type = PlaySnd
trigger1 = Time = 0
value = 40, 0

[State 1052, 3] ;Give KFM back control early
type = CtrlSet
trigger1 = AnimElem = 3, -1
value = 1

[State 1052, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-----------------------------------------
;---------------------------------------------------------------------------
; Strong Jet Upper
[Statedef 1060]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1060
ctrl = 0
facep2 = 1
sprpriority = 2
[State 810, Effect]
type = PlaySnd
trigger1 = anim = 1060
trigger1 = animelem=7
value = 1, 3
[State 220, 1]
type = PlaySnd
trigger1 = anim = 1060
trigger1 = animelem = 7
value = 40, 7

[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=2||animelem=3||animelem=7
x = 8

[State 1051, VelSet]
type = StatetypeSet
trigger1 = time >=10
statetype=A
physics = N

[State 0, Traditional F, D, DF Uppercut invincibile startup]
type = NotHitBy
trigger1 = time<2
value = ,NA,SA,NP,SP,NT
time = 1

[State 1051, VelSet]
type = VelSet
trigger1 = time =10
x = 1.25
y = -8.5;-var(1)*2.5

[State 1051, VelAdd]
type = VelAdd
trigger1 = time >=10
y = .5

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1060
trigger1 = animelem = 4
value = S1050,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1060
trigger1 = animelem = 5
value = S1,5

[State 1051, 3]
type = HitDef
trigger1 = AnimElem = 6
attr = S, SA
animtype = Up
damage = 117, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-8
guard.velocity = -6
air.velocity = -1,-6.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0      ;40 ticks before p2 can recover from fall

[State 1051, 3]
type = HitDef
trigger1 = AnimElem >= 7
trigger1= !movecontact && !movereversed
attr = S, SA
animtype = Up
damage = 117, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
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
ground.velocity = -1,-8
guard.velocity = -6
air.velocity = -1,-6.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 26
value = 1061

[State AttackDone]
type=statetypeset
trigger1= anim=1061
movetype=I

[State 1051, 3] ;Change state when KFM is close to ground
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052
;---------------------------------------------------------------------------
; Fierce Jet Upper
[Statedef 1070]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1070
ctrl = 0
facep2 = 1
sprpriority = 2
[State 810, Effect]
type = PlaySnd
trigger1 = anim = 1070
trigger1 = animelem=7
value = 1, 3
[State 220, 1]
type = PlaySnd
trigger1 = anim = 1070
trigger1 = animelem = 7
value = 40, 7

[State 450, 2]
type = nothitby
trigger1 = prevstateno = 750
value = SCA

[State -3, Jumping Dust]
type = Helper
helpertype = normal
triggerall = anim = 1070
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1

[State 0, PosAdd]
type = PosAdd
triggerall = anim = 1070
trigger1 = animelem=2||animelem=3||animelem=7
x = 10

[State 1051, VelSet]
type = StatetypeSet
trigger1 = time >=13
statetype=A
physics = N

[State 1051, VelSet]
type = VelSet
trigger1 = time =13
x = 1.5
y = -10;-var(1)*2.5

[State 1051, VelAdd]
type = VelAdd
trigger1 = time >=13
y = .5

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1070
trigger1 = animelem = 4
value = S1050,0
channel = 0

[State 0, Traditional F, D, DF Uppercut invincibile startup]
type = NotHitBy
trigger1 = time<2
value = ,NA,SA,NP,SP,NT
time = 1

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 1070
trigger1 = animelem = 5
value = S1,5

[State 1051, 2]
type = HitDef
trigger1 = animelem = 6
attr = C, SA
damage = 64
getpower = 25,25
priority=4,Hit
animtype = Medium
hitflag = MAF
guardflag = L
pausetime = 8,8
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 4
ground.hittime = 10
ground.velocity = -2, 0
air.velocity = -0,-3
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 1051, 3]
type = HitDef
trigger1 = AnimElem >= 7
attr = S, SA
animtype = Up
damage = 63, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
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
ground.velocity = -1,-8
guard.velocity = -6
air.velocity = -1,-6.5
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
value = 1071

[State AttackDone]
type=statetypeset
trigger1= anim=1071
movetype=I

[State 1051, 3] ;Change state when KFM is close to ground
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052
;------------------------------------------------------------------------------------------
;Cross-Counter - Start
[Statedef 1100]
type = S
movetype = I
physics = S
anim = ceil(ifelse(AIlevel, ifelse(random<333,1100,ifelse(random<500,1101,1102)), ifelse(command = "HCB_z", 1102, ifelse(command = "HCB_x", 1100, 1101))))
sprpriority = 2
poweradd = 20
velset = 0,0
ctrl = 0
facep2 = 1

[State 1100, Reversal]
type = ReversalDef
trigger1 = 1
reversal.attr = SA, AA
pausetime = 0, 24
hitsound = S6,0
priority = 999999
numhits = 0
p1stateno = 1105

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Cross-Counter - Strike
[Statedef 1105]
type = S
movetype = A
physics = S
Anim = ifelse(anim=1102,1125, ifelse(anim=1100,1105, 1115))
sprpriority = 0
juggle = 2
velset = 0,0
ctrl = 0
facep2 = 0

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

[State 1105, Damage]
type = LifeAdd
trigger1 = Time = 0
value = ceil((Ifelse((P2StateNo = [200, 999]), -40, Ifelse ((P2StateNo = [1000, 2999]), -80, -140)))*(const(data.attack)*0.01))
kill = 0

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
x = ifelse(anim=1105,25, ifelse(anim=1125, 40, 30))

[State 0, VelSet]
type = VelSet
trigger1 =  animelem = 9
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S1100,0
channel = 0
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = animelem = 1
;value = S1100,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S1,3

[State 1105, Hit]
type = HitDef
;triggerall = prevstateno = 1100
trigger1 = AnimElem = 8
attr = S, SA
guardflag = MA
hitflag = MAF
animtype = Hard
air.animtype = Diagup
priority = 7
getpower = 225
givepower = 175
damage = Ifelse ((P2StateNo = [200, 999]), 80, Ifelse ((P2StateNo = [1000, 2999]), 125, 170))
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
trigger1= animelemtime(9)>=0
movetype=I

[State 1100, StateChange]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Light Ducking
[Statedef 1150]
type = S
movetype= I
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 1150
ctrl = 0
facep2 = 1
sprpriority = 2

[State 0, Velset]
type = Velset
trigger1 = animelem= 2
x = 6

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [3,20]
value = ,AP, NA,NT

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
triggerall = time = [10,19]
trigger1 = command = "holdx"||command = "holdy"||command = "holdz"
value = 1151
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [10,19]
trigger1 = command = "holda"||command = "holdb"||command = "holdc"
value = 1152
ctrl = 0

[State 1100, Straight]
type=changestate
trigger1= var(7)>=1 && time>=10 && anim=1150 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<95 && random<500
value=1151

[State 1100, Uppercut]
type=changestate
trigger1= var(7)>=1 && time>=10 && anim=1150 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<75 && random<500
value=1152

;---------------------------------------------------------------------------
; Ducking Straight
[Statedef 1151]
type = S
movetype= A
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 220
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
damage = 98
getpower = 150,150
guardflag = MA
hitflag = MAF
pausetime = 8,14
priority=4,Hit
sparkno = -1 * (var(10):=8013)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 19
ground.velocity = -10.5
air.velocity = -2.5,-4
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
; Ducking Upper
[Statedef 1152]
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

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,10]
value = ,AP, NA,NT

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1050,0
channel = 0

[State 420, 2]
type = HitDef
trigger1 = animelem = 6
attr = S, SA
damage = 66
getpower = 75,75
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
damage = 42
getpower = 75,75
animtype = Hard
hitflag = MAF
guardflag = M
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
ground.velocity = -8.6
air.velocity = -3,-4
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
; Strong Ducking
[Statedef 1160]
type = S
movetype= I
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 1160
ctrl = 0
facep2 = 1
sprpriority = 2
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
trigger1 = animelem = 2
stateno = 8101
pos = 0, 0
sprpriority = -1
[State 0, Velset]
type = Velset
trigger1 = animelem= 2
x = 14

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, HitBy]
type = HitBy
trigger1 = time = [5,24]
value = ,NA,NT

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [5,24]
value = ,AP

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
triggerall = time = [12,23]
trigger1 = command = "holdx"||command = "holdy"||command = "holdz"
value = 1151
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [12,23]
trigger1 = command = "holda"||command = "holdb"||command = "holdc"
value = 1152
ctrl = 0

[State 1100, Straight]
type=changestate
trigger1= var(7)>=1 && time>=12 && anim=1160 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<95 && random<500
value=1151

[State 1100, Uppercut]
type=changestate
trigger1= var(7)>=1 && time>=12 && anim=1160 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<75 && random<500
value=1152
;---------------------------------------------------------------------------
; Fierce Ducking
[Statedef 1170]
type = S
movetype= I
physics = S
juggle = 0
poweradd= 0
velset = 0,0
anim = 1170
ctrl = 0
facep2 = 1
sprpriority = 2
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
x = 20

[State 0, Velset]
type = Velset
trigger1 = animelem= 6
x = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [7,28]
value = ,AP, NA,NT

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
triggerall = time = [14,26]
trigger1 = command = "x"||command = "y"||command = "z"
value = 1151
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [14,26]
trigger1 = command = "holdx"||command = "holdy"||command = "holdz"
value = 1151
ctrl = 0

[State 1000, 8]
type = ChangeState
triggerall = var(7) != 1
triggerall = time = [14,26]
trigger1 = command = "holda"||command = "holdb"||command = "holdc"
value = 1152
ctrl = 0

[State 1100, Uppercut]
type=changestate
trigger1= var(7)>=1 && time>=14 && anim=1170 && p2dist x>=0;var(30)=1
trigger1= p2bodydist x<75 && random<500
value=1152

;---------------------------------------------------------------------------
; Light Short Swing Blow
[Statedef 1200]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1200
ctrl = 0
facep2 = 1
sprpriority = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = -35

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = -35

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 15

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 12
x = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 100, 0
channel = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1, 3

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(6)<0
value = ,NA,NP
time = 1

[State 1200, Width 1]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(17) < 0
value = 20,0

[State 240, 2]
type = HitDef
trigger1 = time = 0
attr = S, SA
animtype = Medium
damage = 82
getpower = 100,100
guardflag = MA
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
ground.velocity = -6
air.velocity = -2.2,-3.2
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(14)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Strong Short Swing Blow
[Statedef 1210]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1210
ctrl = 0
facep2 = 1
sprpriority = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = -35

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = -35

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 15

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 12
x = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 100, 0
channel = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1, 3

[State 1200, Width 1]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(17) < 0
value = 20,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(6)<0
value = ,NA,NP
time = 1

[State 240, 2]
type = HitDef
trigger1 = time = 0
attr = S, SA
animtype = Medium
damage = 107
getpower = 100,100
guardflag = MA
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
ground.velocity = -6
air.velocity = -2.2,-3.2
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(14)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Fierce Short Swing Blow
[Statedef 1220]
type = S
movetype= A
physics = S
juggle = 4
poweradd= 100
velset = 0,0
anim = 1220
ctrl = 0
facep2 = 1
sprpriority = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = -35

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = -35

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 15.4

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 12
x = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 100, 0
channel = 0

[State 1200, 1]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1, 3

[State 1200, Width 1]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(17) < 0
value = 20,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(6)<0
value = ,NA,NP
time = 1

[State 240, 2]
type = HitDef
trigger1 = time = 0
attr = S, SA
animtype = Medium
damage = 122
getpower = 100,100
guardflag = MA
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
ground.velocity = -6
air.velocity = -2.2,-3.2
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(14)>=0
movetype=I

[State 1200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢
; “ÁŽê”½“]‹Â‚¯”½‚è(HITSHAKE)3rdƒLƒƒƒ‰ê—p
[Statedef 5600]
type = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5600

[State 5000, 1]
type = ChangeAnim
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger1 = !SelfAnimExist(5052)
trigger1 = 1
value = 5030

[State 5000, 1]
type = ChangeAnim
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger1 = SelfAnimExist(5052)
trigger1 = 1
value = 5052

[State 5000, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = authorname = "GM" && name = "Gill"
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5600+(facing=-1)*100000

[State 5000, 1]
type = ChangeAnim
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger1 = authorname = "GM" && name = "Gill"
value = 5030+(facing=-1)*100000

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State -2, posset]
type = posset
trigger1 = time = 0
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
y = 0

[State 5000, 5]
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = SelfState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5610

[State 5000, 7]
type = SelfState
trigger1 = HitShakeOver
value = 5030

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5600
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢
; “ÁŽê”½“]‹Â‚¯”½‚è(HITBACK)3rdƒLƒƒƒ‰ê—p
[Statedef 5610]
type = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = GetHitVar(hittime) = 4
value = 5610

[State 5001, 4]
type = VelSet
trigger1 = Time >= GetHitVar(slidetime)
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, NotHitBy]
type = NotHitBy
trigger1 = fvar(2) < 72
trigger1 = GetHitVar(hittime) = 0
value = , NT,ST,HT
time = 6

[State 5001, 6]
type = ChangeState
trigger1 = fvar(2) = 72
trigger1 = GetHitVar(hittime) = 0
value = 5300

[State 200, Ctrlset]
type = Ctrlset
trigger1 = GetHitVar(hittime) = 0
value = 1

[State 920]
type = StateTypeSet
trigger1 = GetHitVar(hittime) = 0
movetype = I 

[State 5001, 6]
type = ChangeState
trigger1 = anim = 5610
trigger1 = animtime = 0
value = 0
ctrl = 1

;¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢
; “ÁŽê”½“]‹Â‚¯”½‚è(HITSHAKE)”Ä—p
[Statedef 5620]
type = S
movetype= H
physics = N
velset = 0,0

[State -2, ChangeState]
type = ChangeState
triggerall = time = 0
triggerall = authorname = "GM"
trigger1 = name = "Ryu" || name = "Ken"  || name = "Gouki" || name = "Alex" || name = "Hugo"
trigger2 = name = "Ibuki" || name = "Gill"
value = 5600

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
trigger1 = 1
value = 5620

[State 5000, 1]
type = ChangeAnim
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger1 = !SelfAnimExist(5052)
trigger1 = 1
value = 5030

[State 5000, 1]
type = ChangeAnim
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger1 = SelfAnimExist(5052)
trigger1 = 1
value = 5052

[State -2, posset]
type = posset
trigger1 = time = 0
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
y = 0

[State 5000, 5]
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5630

[State 5000, 7]
type = SelfState
trigger1 = HitShakeOver
value = 5030

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5620
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢
; “ÁŽê”½“]‹Â‚¯”½‚è(HITBACK)”Ä—p
[Statedef 5630]
type = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 4]
type = VelSet
trigger1 = Time >= GetHitVar(slidetime)
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, NotHitBy]
type = NotHitBy
trigger1 = GetHitVar(hittime) = 0
value = , NT,ST,HT
time = 6

[State 5001, 6]
type = SelfState
trigger1 = GetHitVar(hittime) = 0
value = 0
ctrl = 1
