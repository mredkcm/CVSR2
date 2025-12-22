; _______________________
;| Ingrid by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

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

[State 200, Voice]
type=playsnd
trigger1= !time && random<200
value= 4, ifElse(Random < 500, 0, 1)
channel=0

[State 200, Woosh]
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
sparkxy = -10 + 0 * (var(35) := 52), var(36) := -72
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

[State 210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 15

[State 210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
x = 5

[State 210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 9
x = -15

[State 210, Voice]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 210, Woosh]
type=playsnd
trigger1= animelem=3
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
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
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
sparkxy = -10 + 0*(var(35):=100), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 210, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sunbright
[Statedef 212]
type = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 212, Anim]
type=changeanim
trigger1=!time
value=212

[State 212,Posset]
type=posset
trigger1=!time
y=0

[State 212, Voice]
type=playsnd
trigger1= animelem=4 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 212, Woosh]
type=playsnd
trigger1= animelem=4
value=1,1
channel=1

[State 212, FX]
type = PlaySnd
trigger1 = animelem = 4
value = 200,0

[State 212, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 217
ID = 217
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 24
ignorehitpause = 1

[State 212, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = ifelse(P2BodyDist X >= 30, 30, P2BodyDist X)

[State 212, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = H
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
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
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 212, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 212, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
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

[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 35
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 15
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 5
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = -30
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -20
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = -5
[State 220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = -15

[State 220, Voice]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 220, Woosh]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1

[State 220, FX]
type = PlaySnd
trigger1 = animelem = 3
value = 200,0

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 225
ID = 225
postype = p1
pos = -65,0
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 27
ignorehitpause = 1

[State 220, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 225
postype = p1
pos = -70,0
[State 220, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 225
postype = p1
pos = -40,0
[State 220, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 225
postype = p1
pos = -20,0
[State 220, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 225
postype = p1
pos = -15,0
[State 220, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 225
postype = p1
pos = 0,0

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
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
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Close Strong Punch
[Statedef 221]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 221, Anim]
type=changeanim
trigger1=!time
value=221

[State 221,Posset]
type=posset
trigger1=!time
y=0

[State 221, Voice]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 221, Woosh]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1

[State 221, FX]
type = PlaySnd
trigger1 = animelem = 4
value = 200,0

[State 221, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 226
ID = 226
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 24
ignorehitpause = 1

[State 221, Hit]
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
sparkxy = -10 + 0*(var(35):=60), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 221, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 221, 5]
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

[State 230, Voice]
type=playsnd
trigger1= !time && random<500
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 230, Woosh]
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
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=35), var(36):=-15
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
; Standing Far Medium Kick
[Statedef 240]
type = S
physics = S
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

[State 240, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
x = 15

[State 240, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
x = -15

[State 240, Voice]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 240, Woosh]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
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
sparkxy = -10 + 0*(var(35):=85), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 240, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Close Medium Kick
[Statedef 241]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 241, Anim]
type=changeanim
trigger1=!time
value=241

[State 241,Posset]
type=posset
trigger1=!time
y=0

[State 241, Voice]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 241, Woosh]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 241, Hit]
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
sparkxy = -10 + 0*(var(35):=48), var(36):=-48
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 241, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 241, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Easy Step
[Statedef 242]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 242, Anim]
type=changeanim
trigger1=!time
value=242

[State 242,Posset]
type=posset
trigger1=!time
y=0

[State 242, Voice]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 242, Woosh]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 242, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4
y = -4.25

[State 242, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 242, Snd]
type = playsnd
trigger1 = AnimElem = 3
value = 40, 0

[State 242, Dust]
type = helper
trigger1 = AnimElem = 3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 242, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3)>0
y = .51

[State 242, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
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
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -5.51), -5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -5.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=50), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 242, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 242, 5]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 243

;---------------------------------------------------------------------------
; Easy Step Landing
[Statedef 243]
type = S
physics = S
ctrl = 0
anim = 243
velset = 0,0

[State 243, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 243, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 243, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 243, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
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

[State 250, Voice]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 250, Woosh]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 250, PosAdd]
type = PosAdd
triggerall = AnimElemTime(6)<0
trigger1 = 1
x = 2

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
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
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=41), var(36):=-30
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 250, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
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

[State 400, Voice]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 400, Woosh]
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
sparkxy = -10 + 0*(var(35):=42), var(36):=-35
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

[State 410, Width]
type = Width
trigger1 = AnimElemTime(4)>=0 && AnimElemTime(5)<0
player = 15,0
[State 410, Width]
type = Width
trigger1 = AnimElemTime(5)>=0 && AnimElemTime(7)<0
player = 20,0

[State 410, Voice]
type=playsnd
trigger1= AnimElem = 2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 410, Woosh]
type=playsnd
trigger1= AnimElem = 2
value=1,1
channel=1

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
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=60), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
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

[State 420, Width]
type = Width
trigger1 = AnimElemTime(2)>=0 && AnimElemTime(3)<0
trigger2 = AnimElemTime(7)>=0 && AnimElemTime(8)<0
player = 20,0
[State 420, Width]
type = Width
trigger1 = AnimElemTime(3)>=0 && AnimElemTime(7)<0
player = 50,0

[State 420, Voice]
type=playsnd
trigger1= AnimElem = 2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 420, Woosh]
type=playsnd
trigger1= AnimElem = 2
value=1,2
channel=1

[State 420, FX]
type = PlaySnd
trigger1 = animelem = 2
value = 200,0

[State 420, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 425
ID = 425
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 28
ignorehitpause = 1

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
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 420, 5]
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

[State 430, Voice]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0
[State 430, Woosh]
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
sparkxy = -10 + 0*(var(35):=47), var(36):=-4
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

[State 440, Voice]
type=playsnd
trigger1= !Time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 440, Woosh]
type=playsnd
trigger1= !Time
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
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
sparkxy = -10 + 0*(var(35):=60), var(36):=-3
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Little Lag
[Statedef 442]
type = C
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 442, Anim]
type=changeanim
trigger1=!time
value=442

[State 442,Posset]
type=posset
trigger1=!time
y=0

[State 442, Voice]
type=playsnd
trigger1= !Time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 442, Woosh]
type=playsnd
trigger1= !Time
value=1,4
channel=1

[State 442, Snd]
type = playsnd
trigger1 = AnimElem = 1
value = 1,6

[State 442, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 442, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 442, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0 && Vel X > 0
x = .92

[State 442, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
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
sparkxy = -10 + 0*(var(35):=60), var(36):=-3
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 442, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 442, 5]
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

[State 450, Voice]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 450, Woosh]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

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
sparkxy = -10 + 0*(var(35):=83), var(36):=-7
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
; Angled Jump Light Punch
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

[State 600, Voice]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 600, Woosh]
type=playsnd
trigger1= !Time
value=1,0
channel=1

[State 600, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=33), var(36):=-38
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 600, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Neutral Jump Light Punch
[Statedef 601]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 601, Anim]
type=changeanim
trigger1=!time
value=601

[State 601, Voice]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 601, Woosh]
type=playsnd
trigger1= !Time
value=1,0
channel=1

[State 601, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
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
sparkxy = -10 + 0*(var(35):=37), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 601, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 601, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 601, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Angled Jump Medium Punch
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

[State 610, Voice]
type=playsnd
trigger1= !Time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 610, Woosh]
type=playsnd
trigger1= !Time
value=1,1
channel=1

[State 610, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=33), var(36):=-38
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Neutral Jump Medium Punch
[Statedef 611]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 611, Anim]
type=changeanim
trigger1=!time
value=611

[State 610, Voice]
type=playsnd
trigger1= !Time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 611, Woosh]
type=playsnd
trigger1= !Time
value=1,1
channel=1

[State 611, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=37), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 611, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 611, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 611, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Angled Jump Strong Punch
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

[State 620, Voice]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 620, Woosh]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, FX]
type = PlaySnd
trigger1 = animelem = 3
value = 200,0

[State 620, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 625
ID = 625
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1
ignorehitpause = 1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=39), var(36):=-39
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
; Neutral Jump Strong Punch
[Statedef 621]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 621, Anim]
type=changeanim
trigger1=!time
value=621

[State 621, Voice]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 621, Woosh]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 621, FX]
type = PlaySnd
trigger1 = animelem = 3
value = 200,0

[State 621, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 626
ID = 625
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1
ignorehitpause = 1

[State 621, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
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
sparkxy = -10 + 0*(var(35):=25), var(36):=-42
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 621, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 621, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 621, End]
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

[State 630, Voice]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 630, Woosh]
type=playsnd
trigger1= !Time
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=23), var(36):=-42
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
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

[State 640, Voice]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 640, Woosh]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=29), var(36):=-38
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Angled Jump Strong Kick
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

[State 650, Voice]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 650, Woosh]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 650, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
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
sparkxy = -10 + 0*(var(35):=36), var(36):=-25
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
; Neutral Jump Strong Kick
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

[State 650, Voice]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 651, Woosh]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 651, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
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
sparkxy = -10 + 0*(var(35):=50), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 651, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 651, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 651, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Throw Attempt
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
p1stateno=ifelse(command="holdback",805,820)

[State 800, Fail]
type = PlaySnd
trigger1 = AnimElem = 3
value = 5000,0; 800,0
channel = 0

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
trigger1 = AnimElem = 4

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

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 30,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 15,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=ifelse(var(10),820,810)



;---TARGET---
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
; Suncrack (Throw Punch)
[StateDef 810]
type = S
physics = N
moveType = A
anim = 810
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 810, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 810, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 810, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 811

;[State 810, Width]
;type = Width
;trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
;edge = 32,0
;ignoreHitPause = 1

[State 810, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 810, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) < 0
pos = 53,-89

[State 810, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) = 0
pos = 53, 0

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 10
value = floor(ifElse(139 * fvar(11) < 7, -7, -139 * fvar(11)))

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 10
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 10 && !var(20)
value = 72

[State 810, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 10
value = 1

[State 810, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 10
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 10
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 10
var(16) = 1
ignoreHitPause = 1

[State 810, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 10
value = 812

[State 810, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4,2
channel = 0

[State 810, Woosh]
type = PlaySnd
trigger1= AnimElem = 10
value = 1,2
channel = 1

[State 810, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 10
value = 2,2
channel = 2

[State 810, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 10
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 53,-86
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; ---TARGET---
[StateDef 811]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 811, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 811, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 811

[State 811, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


; After Throw
[StateDef 812]
type = A
physics = N
movetype = H
ctrl = 0
velSet = ifelse((prevstateno=[836,837]),-5,-4), -7

[State 812, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 812, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 812, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
trigger1 = SelfAnimExist(5035)
value = 5035

[State 812, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5050 && !AnimTime
value = 5050

[State 812, VelAdd]
type = VelAdd
Trigger1 = 1
y = .5

[State 812, EnvShake]
type = EnvShake
trigger1 = vel y > 0
trigger1 = pos y >= 25
time = 14
ampl = -4
freq = 120

[State 812, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 812, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;---------------------------------------------------------------------------
; Light Punish (Throw Kick)
[Statedef 820]
type = S
movetype = A
physics = S
anim = 820
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 820, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 820, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 835

[State 820, Target Facing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 820, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 820, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2
channel = 0

[State 820, FX]
type = Explod
trigger1 = AnimElem = 2
anim = 825
ID = 825
postype = p1
removetime = -1
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1

[State 820, Arm]
type = Explod
trigger1 = AnimElem = 2
anim = 830
ID = 830
postype = p1
removetime = -2
sprpriority = 4
ownpal = 0
removeongethit = 1
bindtime = -1

[State 820, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = 1
pos = 20,0

[State 820,ChangeState]
type = ChangeState
trigger1 = !AnimTime 
value = 821

; ---HIT---
[StateDef 821]
type = S
physics = N
moveType = A
anim = 821
ctrl = 0
velset = 0,0
sprpriority = -1

[State 821, Arm]
type = Explod
trigger1 = AnimElem = 1
anim = 831
ID = 831
postype = p1
removetime = -1
sprpriority = 4
ownpal = 0
removeongethit = 1
bindtime = -1

[State 821, Throw]
type = TargetState
trigger1= !Time && NumTarget
value = 836

[State 821, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 821, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = 1
pos = 15,0

[State 821, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 821, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 135

[State 821, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 821, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 821, VarAdd]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 821, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 821, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 821, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 821, ChangeAnim] 
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(4) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 821
elem = AnimElemNo(0) + 1

[State 821, ChangeAnim]
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(4)>0
trigger1 = AnimElemTime(4)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(4))
value = 821
elem = 1

[State 821, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 821, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 836

[State 821, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
value = 837

[State 821, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 2
value = floor(ifElse(21 * fvar(11) < 7, -7, -21 * fvar(11)))
kill = 1

[State 821, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 2
value = 30

[State 821, PowerAdd]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 2 && !var(20)
value = 70

[State 821, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 2
value = 1

[State 821, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 2
var(13) = 1

[State 821, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 2
var(15) = 1
ignoreHitPause = 1

[State 821, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 2
var(16) = 1
ignoreHitPause = 1

[State 821, FX]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800,1
channel = 2

[State 821, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 180
value = 822


; ---FINAL HIT---
[StateDef 822]
type = S
physics = N
moveType = A
anim = 822
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 822, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 831
ignorehitpause = 1

[State 822, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 825
ignorehitpause = 1

[State 822, FX]
type = Explod
trigger1 = !Time
anim = 826
ID = 826
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1

[State 822, TargetState]
type = TargetState
trigger1 = !Time
trigger1 = NumTarget
value = 812

[State 822, Width]
type = Width
trigger1 = 1
edge = ceil(40 * const(size.xScale)), 0

[State 822, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(21 * fvar(11) < 7, -7, -21 * fvar(11)))
kill = 1

[State 822, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 822, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 822, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 822, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && !Time
var(16) = 1
ignoreHitPause = 1

[State 822, FX]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 3000,2
channel = 2

[State 822, ModifyExplod]
type = ModifyExplod
trigger1 = !Time
ID = 825
anim = 826
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1

[State 822, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; ---TARGET---
[Statedef 835]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State 835, Screenbound]
type = ScreenBound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 835, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 835

; ---BEING HIT 1---
[StateDef 836]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 836, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 836

[State 836, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0

[State 836, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32


; ---BEING HIT 2---
[StateDef 837]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 837, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 837

[State 837, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0

[State 837, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

;---------------------------------------------------------------------------
; Air Throw Attempt
[Statedef 850]
type=A
physics=N
movetype=A
ctrl=0
;velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 850, Anim]
type=changeanim
trigger1=!time
value=850

[State 850, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 850, Hit]
type=hitdef
trigger1= animelem=2
trigger1= !var(38)
attr=A,NT
hitflag=A-
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
p1stateno=855

[State 850, Fail]
type = PlaySnd
trigger1 = AnimElem = 3
value = 5000,0; 800,0
channel = 0

[State 850, Snd]
type=null;playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 850, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 850, Gravity]
type = Gravity
trigger1 = 1

[State 850, End]
type=changestate
trigger1=Pos Y > -Vel Y
value=52

;---------------------------------------------------------------------------
; Air Throw Success
[StateDef 855]
type = A
physics = N
moveType = A
anim = 855
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 855, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 856

[State 855, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 855, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) < 0
pos = 0,8

[State 855, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(126 * fvar(11) < 7, -7, -126 * fvar(11)))

[State 855, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 855, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 72

[State 855, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 855, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 855, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 855, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 855, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 3
value = 812

[State 855, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,2
channel = 0

[State 855, Woosh]
type = PlaySnd
trigger1= AnimElem = 3
value = 1,5
channel = 1

[State 855, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,5
channel = 2

[State 855, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 8,-43
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 855, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = -3
y = -6

[State 855, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 3
value = 857

[State 855, Gravity]
type = Gravity
trigger1 = AnimElemTime(3)>0

[State 855, End]
type = ChangeState
trigger1 = Pos Y > -Vel Y
value = 52

; ---TARGET---
[StateDef 856]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 856, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 856, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 856

[State 856, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

; ---TARGET 2---
[StateDef 857]
type = A
moveType = H
physics = N
velSet = -3,3
sprPriority = 0

[State 857, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 856

[State 857, Gravity]
type = Gravity
trigger1 = 1

[State 857, SelfState]
type = SelfState
trigger1 = Pos Y > -Vel Y
value = 5100

;---------------------------------------------------------------------------
; Target Escaped
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5940
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