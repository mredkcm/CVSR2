; ________________________
;| R. Mika by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Anim]
type=changeanim
trigger1=!time
value=200

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifElse(Random < 500, 0, 1)
channel=0

[State 200, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 200, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Anim]
type=changeanim
trigger1=!time
value=210

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random>300, 0, 1)
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 210, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Punch
[Statedef 220]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=220

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random>300, 0, 1)
channel=0

[State 220, Snd]
type=playsnd
trigger1= time=10;animelem=2
value=1,2
channel=1

[State 220, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA

[State 220, 0]
type = velSet
trigger1 = !time
x = 7

[State 220, 0]
type = velSet
trigger1 = animelem = 3
x = 0

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=63), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = 52,0

[State 220, Dust]
type = explod
trigger1 = animelem=3
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
pos = 0,0

[State 220, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Anim]
type=changeanim
trigger1=!time
value=230

[State 230,Posset]
type=posset
trigger1=!time
y=0

[State 230, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<300, 0, 1)
channel=0

[State 230, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=61), var(36):=-32
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 230, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type = S
physics = N;S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Anim]
type=changeanim
trigger1=!time
value=240

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Holdfwd]
type = VelSet
trigger1 = !time && command="holdfwd"
x = 2
[State 240, Holdfwd]
type = VelSet
trigger1 = animelem = 7 && vel X > 0
x = 0

[State 240, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<300, 1, 2)
channel=0

[State 240, Snd]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 240, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0

[State 240, Dust]
type = explod
trigger1 = AnimElem = 7
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=85), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 240, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=250

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<300, 2, 3)
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 250, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 8
value = 52,0

[State 250, Dust]
type = explod
trigger1 = AnimElem = 8
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -4.72)), ifElse(PrevStateNo = 700, -5.25, -5)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1;ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 250, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 250, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Anim]
type=changeanim
trigger1=!time
value=400

[State 400,Posset]
type=posset
trigger1=!time
y=0

[State 400, Snd]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*21<7, 7, fvar(11)*21)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=62), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 400, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Anim]
type=changeanim
trigger1=!time
value=410

[State 410,Posset]
type=posset
trigger1=!time
y=0

[State 410, Snd]
type=playsnd
trigger1= !time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 410, Snd]
type=playsnd
trigger1= !time
value=1,1
channel=1

[State 410, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 3.2
y = -4

[State 410, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A
physics = A

[State 410, VelSet]
type = VelSet
trigger1 = P2BodyDist X < 10
x = 0

[State 410, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A
movetype = A
physics = A

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 12
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -2.46, -6.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=60), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
value = 415;11
ctrl = 0;1

;landing
[Statedef 415]
type = A
movetype= I
physics = A
ctrl = 0
anim = 415

[State 415, ChangeState]
type = ChangeState
trigger1 = pos Y =0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Anim]
type=changeanim
trigger1=!time
value=420

[State 420,Posset]
type=posset
trigger1=!time
y=0

[State 420, Snd]
type=playsnd
trigger1= time=8 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 420, Snd]
type=playsnd
trigger1= time=8
value=1,2
channel=1

[State 420, Snd]
type = playsnd
trigger1 = time=8
value = 110,0

[State 420, Dust]
type = helper
trigger1 = time=8
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 420, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 4
y = -4

[State 420, StateTypeSet]
type = StateTypeSet
trigger1 = animelem=3
statetype = A
physics = N

[State 420, VelAdd]
type = VelAdd
trigger1 = animelemtime(3)>0
y = .5

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -1.15, -3.45), ifElse(var(20), -10.45, -7.45)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20),-1.15,-3.23), ifElse(var(20),-10.45,-7.73)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=34), var(36):=-54
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, ChangeState]
type = ChangeState
trigger1 = animelemtime(3)>0
trigger1 = pos Y >=0 && vel Y>0
trigger2 = movecontact
value = ifelse(movecontact,422,421)
ctrl = 0

;landing
[Statedef 421]
type = C
physics = C
moveType = I
ctrl = 0
velSet = 6,0

[State 421,Posset]
type=posset
trigger1=!time
y=0

[State 421, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 421, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 421, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 421

[State 421, end]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;landing 2
[Statedef 422]
type = C
physics = C
moveType = I
ctrl = 0
velSet = 0,0

[State 422,Posset]
type=posset
trigger1=!time
y=0

[State 422, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 422, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 422, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 422

[State 422, end]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Anim]
type=changeanim
trigger1=!time
value=430

[State 430,Posset]
type=posset
trigger1=!time
y=0

[State 430, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0
[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=  !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-35
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Anim]
type=changeanim
trigger1=!time
value=440

[State 440,Posset]
type=posset
trigger1=!time
y=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-46
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 450, Anim]
type=changeanim
trigger1=!time
value=450

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 450, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 450, Snd]
type=null;playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 450, Snd]
type=playsnd
trigger1= animelem=3
value=101,0

[State 450, VelSet]
type = VelSet
trigger1 = animelem=3
x = 13

[State 450, Dust]
type = helper
trigger1 = animelem=3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 450
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110


;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Anim]
type=changeanim
trigger1=!time
value=600

[State 600, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=47), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 600, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 600
elem = 5
ignoreHitPause = 1

[State 620, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=610

[State 610, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=3
value=1,1
channel=1

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=42), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 600
elem = 5
ignoreHitPause = 1

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Anim]
type=changeanim
trigger1=!time
value=620

[State 620, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Flying Body Press
[Statedef 625]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 625, Anim]
type=changeanim
trigger1=!time
value=625

[State 625, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 625, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 625, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20),-1.45,-6.46), ifElse(var(20),-7.45,-5.25)
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 625, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 625, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 625, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Anim]
type=changeanim
trigger1=!time
value=630

[State 630, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=66), var(36):=-68
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 630
elem = 4
ignoreHitPause = 1

[State 630, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Knee Drop
[Statedef 635]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 635, Anim]
type=changeanim
trigger1=!time
value=635

[State 635, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 635, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 635, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*43<7, 7, fvar(11)*43)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=66), var(36):=-48
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 635, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 635, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 635, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Anim]
type=changeanim
trigger1=!time
value=640

[State 640, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=54), var(36):=-34
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 4
ignoreHitPause = 1

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 650, Anim]
type=changeanim
trigger1=!time
value=650

[State 650, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=60), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Neutral Strong Kick
[Statedef 651]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 651, Anim]
type=changeanim
trigger1=!time
value=651

[State 651, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 651, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 651, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 651, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 651, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 651, End]
type=changestate
trigger1= pos y>-vel y
value=52

;Throw Attempt
[Statedef 800]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=800

[State 800,Posset]
type=posset
trigger1=!time
y=0

[State 800, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="kk")

[State 800, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,810)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",820,805)

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38) && numtarget(3200)
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,810)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38) && numtarget(3200)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",820,805)

[State 800, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;---PLAYER TURNS---
[Statedef 805]
type=S
movetype=A
physics=S
ctrl=0
sprpriority=0

[State 805, Anim]
type=changeanim
trigger1=!time
value=805

[State 805,Posset]
type=posset
trigger1=!time
y=0

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=806

[State 805, Throw]
type=targetfacing
trigger1= !time && numtarget
value=-1

[State 805, Width]
type=width
trigger1= 1
edge=24,24
ignoreHitPause = 1

[State 805, Turn]
type=turn
trigger1 = AnimElem = 2

[State 805, facing]
type=targetfacing
trigger1= 1
value=-1

[State 805, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 805, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=ifelse(prevstateno=850,851,ifelse(var(10),820,810))


;---TARGET TURNS---
[Statedef 806]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 806, NHB]
type=nothitby
trigger1= 1
value=SCA
time=1

[State 806, Anim]
type=changeanim2
trigger1= !time
value=806

[State 806, Camera]
type=screenbound
trigger1= 1
value=0
movecamera=1,1
ignoreHitPause = 1

[State 806, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1

;---------------------------------------------------------------------------
; Throw Punch
[Statedef 810]
type = S
movetype= A
physics = N
velset = 0,0
anim = 810

[State 810, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 810, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 810, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 810, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 810, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 810, TargetState]
type = TargetState
trigger1 = !time && NumTarget
value = 811

[State 810, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 4,3
channel = 0

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 10, 0

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0, 0

[State 810, Bind 3]
type = TargetBind
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
trigger5 = AnimElem = 7
pos = -50, 0

[State 810, Bind 8]
type = TargetBind
trigger1 = AnimElem = 8
pos = -20, -60

[State 810, Bind 9]
type = TargetBind
trigger1 = AnimElem = 9
pos = 6, -87

[State 810, Bind 10]
type = TargetBind
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
pos = 50, -15

[State 810, Hurt]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 10
value = -120

[State 810, HitAdd]
type = HitAdd
trigger1 = animelem = 10
value = 1

[State 810, EnvShake]
type = EnvShake
trigger1 = animelem = 10
time = 20
freq = 90
ampl = -4

[State 810, Helper]
type = Helper
trigger1 = animelem = 10
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 50,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 810, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
value = 2,5 

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---TARGET---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0,0

[State 811, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 811

[State 811, VelSet]
type = VelSet
trigger1 = animelem = 11
x = -2.5
y = -8

[State 811, 1] ;Gravity
type = VelAdd
trigger1 = animelemtime(11)>0
y = .49

[State 811, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground


;---------------------------------------------------------------------------
; Throw Kick
[Statedef 820]
type = S
movetype= A
physics = N
velset = 0,0
anim = 820

[State 820, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 820, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 820, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 820, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 820, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 820, TargetState]
type = TargetState
trigger1 = !time && NumTarget
value = 821

[State 820, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 4,4
channel = 0

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 25, 0

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
pos = 0, 0

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -5, -100

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -18, -104

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 6
pos = -29, -100

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 7
pos = -39, -86

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 8
pos = -29, -64

[State 820, Bind]
type = TargetBind
trigger1 = AnimElem = 9
pos = -55, 0

[State 820, Hurt]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9
value = -120

[State 820, HitAdd]
type = HitAdd
trigger1 = animelem = 9
value = 1

[State 820, EnvShake]
type = EnvShake
trigger1 = animelem = 9
time = 20
freq = 90
ampl = -4

[State 820, Helper]
type = Helper
trigger1 = animelem = 9
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = -70,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 820, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,5 

[State 820, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---TARGET---
[Statedef 821]
type = A
movetype = H
physics = N
velset = 0,0

[State 821, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 821


[State 821, VelSet]
type = VelSet
trigger1 = animelem = 10
x = 2.5
y = -8

[State 821, 1] ;Gravity
type = VelAdd
trigger1 = animelemtime(10)>0
y = .49

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground


;---------------------------------------------------------------------------
; Hip Buster / Neck Breaker
[Statedef 830]
type=A
physics=N
movetype=A
ctrl=0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 830, Anim]
type=changeanim
trigger1=!time
value=830

[State 830, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 830, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="kk")

[State 830, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 830, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,ST
hitflag=A
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(var(10),841,831)

[State 830, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 830, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 830, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 830, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 830, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---SUCCESS---
[Statedef 831]
type = A
movetype = A
physics = S
anim = 831
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 831, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 831, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 831, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 835

[State 831, Width]
type = Width
trigger1 = 1
edge = 45,0

[State 831, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 830,0
channel = 0

[State 831, BindToTarget]
type = BindToTarget
trigger1 = !time && numtarget
pos = 0,0,head;"Foot","Mid","Head"

[State 831, TargetBind]
type = TargetBind
trigger1 = numtarget && animelemtime(2)>=0
pos = 0,0

[State 831, Gravity]
type = Gravity
trigger1 = animelemtime(2)>0

[State 831, ChangeState]
type = ChangeState
trigger1 = pos Y >= -10
value = 832
ctrl = 0


;---END---
[Statedef 832]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 832,Posset]
type=posset
trigger1=!time
y=0

[State 832, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 832

[State 832, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 836

[State 832, TargetBind]
type = TargetBind
trigger1 = numtarget && !time
pos = 0,-10

[State 832, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = !time
value = floor(ifElse(115 * fvar(11) < 7, -7, -115 * fvar(11)))

[State 832, EnvShake]
type = EnvShake
trigger1 = !time
time = 20
freq = 90
ampl = -4

[State 832, HitAdd]
type = HitAdd
trigger1 = NumTarget
trigger1 = !time
value = 1

[State 832, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 2,5

[State 832, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = -10,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 832, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 835]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 835, 1]
type = ChangeAnim2
trigger1 = !Time
value = 835

[State 835, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0
value = 836
ctrl = 0

;---TARGET END---
[Statedef 836]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1411, 1]
type = ChangeAnim2
trigger1 = !Time
value = 836

[State 1411, VelSet]
type = VelSet
trigger1 = !time
x = 4
y = -7

[State 1411, VelAdd]
type = VelAdd
trigger1 = time>=1
y = .5

[State 1411, Recover]
type = SelfState
trigger1 = command = "recovery"
trigger1 = Alive && CanRecover
trigger1 = vel y > -1 && pos y >= 0
value = 5200

[State 1411, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;---SUCCESS---
[Statedef 841]
type = A
movetype = A
physics = S
anim = 841
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 841, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 841, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 841, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 845

[State 841, Width]
type = Width
trigger1 = 1
edge = 45,0

[State 841, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 840,0
channel = 0

[State 841, Bind]
type = TargetBind
trigger1 = 1
trigger1 = NumTarget
pos = -5,-70

[State 841, Gravity]
type = Gravity
trigger1 = time>=10

[State 841, ChangeState]
type = ChangeState
trigger1 = pos Y >= 10
value = 842
ctrl = 0


;---END---
[Statedef 842]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 842,Posset]
type=posset
trigger1=!time
y=0

[State 842, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 842

[State 842, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 846

[State 842, TargetBind]
type = TargetBind
trigger1 = numtarget && !time
pos = 25,0

[State 842, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = !time
value = floor(ifElse(115 * fvar(11) < 7, -7, -115 * fvar(11)))

[State 842, EnvShake]
type = EnvShake
trigger1 = !time
time = 20
freq = 90
ampl = -4

[State 842, HitAdd]
type = HitAdd
trigger1 = NumTarget
trigger1 = !time
value = 1

[State 842, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 2,5

[State 842, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 0,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 842, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 845]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 845, 1]
type = ChangeAnim2
trigger1 = !Time
value = 845

[State 845, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0
value = 846
ctrl = 0

;---TARGET END---
[Statedef 846]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 846, Turn]
type = Turn
trigger1 = !time

[State 846, 1]
type = ChangeAnim2
trigger1 = !Time
value = 846

[State 846, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 4
y = -7

[State 846, VelAdd]
type = VelAdd
trigger1 = animelemtime(2)>=0
y = .5

[State 846, Recover]
type = SelfState
trigger1 = command = "recovery"
trigger1 = Alive && CanRecover
trigger1 = vel y > -1 && pos y >= 0
value = 5200

[State 846, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;---------------------------------------------------------------------------
; Headbutt
[Statedef 850]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 850, Anim]
type=changeanim
trigger1=!time
value=800

[State 850,Posset]
type=posset
trigger1=!time
y=0

[State 850, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 850, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 850, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,851)

[State 850, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 850, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 850, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 850, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;---HIT---
[StateDef 851]
type = S
physics = N
moveType = A
anim = 851
ctrl = 0
velset = 0,0
sprpriority = 1

[State 851, ChangeState]
type = ChangeState
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 851, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 851, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 851, TargetState]
type = TargetState
trigger1= !Time && NumTarget
value = 855

[State 851, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = 1
pos = 20,0

[State 851, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 135

[State 851, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 851, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 851, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 851, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 851, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 851, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 851, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 851, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 851, Anim Skip]
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 851
elem = AnimElemNo(0) + 1

[State 851, Anim Skip]
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 851
elem = 1

[State 851, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

[State 851, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 3
value = 856

[State 851, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(11 * fvar(11) < 7, -7, -11 * fvar(11)))
kill = 1

[State 851, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 30

[State 851, PowerAdd]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 70

[State 851, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 851, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 851, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 851, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 851, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,5
channel = 0

[State 851, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,2

[State 851, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 18, -73
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

;[State 851, EnvShake]
;type = EnvShake
;trigger1 = NumTarget && AnimElem = 3
;time = 9
;ampl = 3
;freq = 60

[State 851, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 180
value = 852


;---FINAL HIT
[StateDef 852]
type = S
physics = N
moveType = A
anim = 852
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 852, SprPriority]
type = SprPriority
trigger1 = !time
value = -1

[State 852, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 852, Bind]
type = TargetBind
trigger1 = AnimElemTime(4) < 0 
trigger1 = NumTarget
pos = 40,0

[State 852, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 4
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 1

[State 852, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4 
time = 14
freq = 120
ampl = 4

[State 852, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 4
value = 1

[State 852, Hit Count Increment]
type = varAdd
trigger1 = NumTarget && AnimElem = 4
var(13) = 1

[State 852, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(15) = 1
ignoreHitPause = 1

[State 852, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 4
var(16) = 1
ignoreHitPause = 1

[State 852, TargetState]
type = TargetState
trigger1 = NumTarget && AnimElem = 4
value = 857

[State 852, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,2
channel = 0

[State 852, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 852, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 4
value = 2,2
channel = 2

[State 852, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 4
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 33,-73
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 852, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---TARGET---
[Statedef 855]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 855, 1]
type = ChangeAnim2
trigger1 = !Time
value = 855

[State 855, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1


;---TARGET HIT---
[StateDef 856]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 856, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 856

[State 856, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0

[State 856, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

[State 856, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1


;---TARGET FINAL HIT---
[StateDef 857]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 857, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 857, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 857, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
trigger1 = SelfAnimExist(5035)
value = 5035

[State 857, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5050 && !AnimTime
value = 5050

[State 857, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0

[State 857, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 857, VelSet]
type = VelSet
trigger1 = !Time
x = -4
y = -8

[State 857, Recover]
type = SelfState
trigger1 = command = "recovery"
trigger1 = Alive && CanRecover
trigger1 = vel y > -1 && pos y >= -20
value = 5200

[State 857, ChangeAnim]
type = ChangeAnim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = SelfAnimExist(5051)
value = 5051

[State 857, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;Target Escaped
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5910
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0

[State 890, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 895

[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, Pos]
type = posadd
trigger1 = !time
x = 24

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 890, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

;[State 890, SprPriority 1]
;type = SprPriority
;trigger1 = AnimElemTime(6) >= 0
;value = 1
;
;[State 890, SprPriority -1]
;type = SprPriority
;trigger1 = AnimElemTime(2) <= 0
;value = -1

[State 890, Pos]
type = posset
trigger1 = !time
y = 0

[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000,2
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 760,0

[State 890, FX]
type = helper
trigger1 = !time
stateno = 8000
ID = 8000
name = "Spark"
postype = p1
pos = 0, -64
facing = -1
ownpal = 1
size.xscale = 1;0.5
size.yscale = 1;0.5
pausemovetime = 65535
supermovetime = 65535

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1


;---TARGET---
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5945), 5945, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 895, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, Pos]
type = posset
trigger1 = !time
y = 0

[State 895, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 27
value = 0
ctrl = 1


;---TARGET---
[Statedef 821]
type = A
movetype = H
physics = N
velset = 0,0

[State 821, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 821


[State 821, VelSet]
type = VelSet
trigger1 = animelem = 10
x = 2.5
y = -8

[State 821, 1] ;Gravity
type = VelAdd
trigger1 = animelemtime(10)>0
y = .49

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground