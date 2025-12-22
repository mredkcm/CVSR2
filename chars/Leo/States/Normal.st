; _________________________________________
;| Leo by K6666orochi                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<NORMAL MOVES>====
;==

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
value=1000,8
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,2

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 100, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
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
hitsound = -1 + 0 * (var(31) := 7)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -85
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 200, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 13
value = 1

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

[State 210, Width]
type = Width
trigger1 = animelemno(0) = 5 || animelemno(0) = [7, 9]
player = floor(8*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 210, Width]
type = Width
trigger1 = animelemno(0) = 6
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=5
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=170), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 210, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 11
value = 1

[State 210, 5]
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

[State 220, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=5
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-40
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 450,]
type = ChangeState
trigger1 = command = "z" || command = "z"
trigger1 = AnimElemtime(8) > 1 && AnimElemtime(10) < 2
ignorehitpause = 1
value = 225

[State 220, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 11
value = 1

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Roar Reverse
[Statedef 225]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 225, Anim]
type=changeanim
trigger1=!time
value=225

[State 225,Posset]
type=posset
trigger1=!time
y=0

[State 260, Width]
type = Width
trigger1 = animelemno(0) = 4 || animelemno(0) = 9
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 260, Width]
type = Width
trigger1 = animelemno(0) = [5, 8]
player = floor(32*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 225, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=5
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 3
value=0,20

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*90<7, 7, fvar(11)*98)), 0
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 220, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 13
value = 1

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
trigger1= !time && random<500
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 230, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 1
value=0,2

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
sparkxy = -10 + 0*(var(35):=90), var(36):=-68
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 230, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 8
value = 1

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Kick
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

[State 240, Width]
type = Width
trigger1 = animelemno(0) = 3 || animelemno(0) = 12
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 240, Width]
type = Width
trigger1 = animelemno(0) = [4, 11]
player = floor(32*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 240, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 240, Snd]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 1
value=0,1

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

[State 200, Type]
type=statetypeset
trigger1= animelemtime(11)>=0
movetype=I

[State 240, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 14
value = 1

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
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=5
value=1,5
channel=1

[State 250, Snd]
type=playsnd
trigger1= animelem=1
value=0,5

[State 250, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 9
x = 16*const(size.xscale)

[State 250, PosAdd]
type = PosAdd
trigger1 = anim = 250
trigger1 = animelem = 10
x = 32*const(size.xscale)

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
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 250, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 10
value = 1

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
value=1000,8
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
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-20
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 400, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 10
value = 1

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
trigger1= animelem= 4
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 410, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 12
value = 1

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

[State 420, Snd]
type=playsnd
trigger1= !time && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 420, Snd]
type=playsnd
trigger1= animelem= 4
value=1000,9
channel=1

[State 420, Snd]
type=playsnd
trigger1= animelem= 2
value=0,5

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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 420, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 17
value = 1

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

[State 430, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 430, Snd]
type=playsnd
trigger1= !time
value=1000,8
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
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=85), var(36):=-1
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 430, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 15
value = 1

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
trigger1= animelem=5
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=180), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 440, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 11
value = 1

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
type=playsnd
trigger1= animelem=2
value=1000,9
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-5
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
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 450, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 10
value = 1

[State 450,]
type = ChangeState
trigger1 = command = "c" || command = "c"
trigger1 = AnimElemtime(7) > 1 && AnimElemtime(9) < 2
ignorehitpause = 1
value = 460

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Reply Buster
[Statedef 460]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 460, Anim]
type=changeanim
trigger1=!time
value=460

[State 460,Posset]
type=posset
trigger1=!time
y=0

[State 460, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 460, Snd]
type=playsnd
trigger1= animelem=2
value=1000,9
channel=1

[State 460, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 460, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 460
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-5
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 460, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 460
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 450, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = animelem = 10
value = 1

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
trigger1= animelem=4
value=1000,8
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,2

[State 600, Hit]
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
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 600, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 600
elem = 4
ignoreHitPause = 1

[State 620, Type]
type=statetypeset
trigger1= animelemtime(8)>=0
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
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 1
value=0,1

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=180), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 610
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
; Face Apollon
[Statedef 615]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=615

[State 610, Snd]
type=playsnd
trigger1= animelem=3 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=3
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 1
value=0,1

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=180), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 610
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
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,5

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= animelem=3
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
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
trigger1= animelem=3
value=1000,8
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 1
value=0,2

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
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 630
elem = 4
ignoreHitPause = 1

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

[State 640, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=4
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-34
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 4
ignoreHitPause = 1

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
; Icarus Dive
[Statedef 645]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 645, Anim]
type=changeanim
trigger1=!time
value=645

[State 645, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 645, Snd]
type=playsnd
trigger1= animelem=4
value=1000,9
channel=1

[State 645, Snd]
type=playsnd
trigger1= animelem= 2
value=0,19

[State 645, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=80), var(36):=0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 645, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
movetype = I

[State 645, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 645, End]
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
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Orion Vault
[Statedef 655]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 655, Anim]
type=changeanim
trigger1=!time
value=655

[State 655, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 655, Snd]
type=playsnd
trigger1= animelem=3
value=1000,9
channel=1

[State 200, Snd]
type=playsnd
trigger1= animelem= 2
value=0,19

[State 655, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=8
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 655, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 655, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 655, End]
type=changestate
trigger1= pos y>-vel y
value=52

;===<Throw Attempt>==
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
p1stateno=810
p2facing = 1          ;Force p2 to face player
;p1stateno = 810      ;On success, player changes to state 810
p2stateno = 811 


[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=5000,0
channel=0

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;===<Throw Attempt>==
[Statedef 801]
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
p1stateno=820
p2facing = 1          ;Force p2 to face player
;p1stateno = 810      ;On success, player changes to state 810
p2stateno = 825 



[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=5000,0
channel=0

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;===<Throw Attempt>==
[Statedef 802]
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
p1stateno=810
p1facing = -1 
p2facing = 1          ;Force p2 to face player
;p1stateno = 810      ;On success, player changes to state 810
p2stateno = 811 


[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=5000,0
channel=0

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;===<Throw Attempt>==
[Statedef 803]
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
p1stateno=820
p1facing = -1 
p2facing = 1          ;Force p2 to face player
;p1stateno = 810      ;On success, player changes to state 810
p2stateno = 825 



[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=5000,0
channel=0

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

[State 806, Throw]
type=targetstate
trigger1= animelemtime (5)= 12
trigger1= !time && numtarget
value=811

[State 805, Throw]
type=targetstate
trigger1= animelemtime (5)= 12
trigger1= !time && numtarget
value= 806

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
pos = 42,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 11,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(5) >= 0
value = 1

[State 805, SprPriority 2]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
value = -1

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
; Throwing the opponent
[Statedef 810]
type = S
movetype= A
physics = N
anim = 810

[State 801, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 200, 1
channel = 0

[State 801, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 105

[State 801, Bind 2]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = 85*const(size.xscale), 0

[State 801, Bind 3]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = 85*const(size.xscale), 0

[State 801, Bind 4]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 95*const(size.xscale) + 0.8*target, const(size.head.pos.x), -40*const(size.yscale) + 0.6*target, const(size.head.pos.y)

[State 801, Bind 5]
type = TargetBind
trigger1 = animelemno(0) = 5
pos = 95*const(size.xscale), -40*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 801, Bind 6]
type = TargetBind
trigger1 = animelemno(0) = 6
pos = 95*const(size.xscale), -50*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 801, Bind 7]
type = TargetBind
trigger1 = animelemno(0) = 7
pos = 45*const(size.xscale) - 0.8*target, const(size.head.pos.x), -140*const(size.yscale) + 0.33*target, const(size.head.pos.y)

[State 801, Bind 8]
type = TargetBind
trigger1 = animelemno(0) = 8
pos = 35*const(size.xscale) - 0.9*target, const(size.head.pos.x), -135*const(size.yscale) + 0.30*target, const(size.head.pos.y)

[State 801, Bind 9]
type = TargetBind
trigger1 = animelemno(0) = 9
pos = 50*const(size.xscale) - target, const(size.head.pos.x), -130*const(size.yscale) + 0.27*target, const(size.head.pos.y)

[State 801, Bind 10]
type = TargetBind
trigger1 = animelemno(0) = 10
pos = 67*const(size.xscale) - target, const(size.head.pos.x), -110*const(size.yscale) + 0.27*target, const(size.head.pos.y)

[State 801, Bind 10]
type = TargetBind
trigger1 = animelemno(0) = 11
pos = 20*const(size.xscale), 0


[State 801, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 11
value = ceil(-100.0*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)

[State 801, EnvShake]
type = EnvShake
trigger1 = AnimElem = 11
time = 10
freq = 50
ampl = 5
phase = 270

[State 801, Explod]
type = null
triggerall = var(22)
trigger1 = AnimElem = 11
postype = p1
anim = 17005
bindtime = 1
pos = floor(20*const(size.xscale)), 5
facing = -1
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State 801, Explod]
type = null
triggerall = !var(22)
trigger1 = AnimElem = 11
postype = p1
anim = F62
bindtime = 1
pos = floor(20*const(size.xscale)), 5
facing = -1
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State XP Add]
type = VarAdd
trigger1 = animelem = 11
var(19) = 700
ignorehitpause = 1

[State 801, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 11
pan = floor(20*const(size.xscale))
value = 820, 1

[State 801, 8]
type = Explod
trigger1 = AnimElem = 11
postype = p1
anim =  3120
scale= 0.25,0.25
pos = floor(20*const(size.xscale)), 0
sprpriority = -5
facing = -1
ownpal = 1

[Statedef 811]
type = A
movetype= H
physics = N
velset = 0,0

[State 805, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 811

[State 805, Turn]
type = null
Trigger1 = Time = 27

[State 805, 1]
type = ChangeAnim
trigger1 = selfanimexist(5100)
Trigger1 = Time = 31
value = 5100

[State 805, SelfState]
type = SelfState
Trigger1 = anim = 5100
trigger1 = animtime = 0 || animtime = 3
trigger2 = time = 31
trigger2 = anim != 5100
value = 5101

[State 805, SelfState]
type = SelfState
trigger1 = time
trigger1 = anim != 5100
trigger1 = !gethitvar(isbound)
value = 5050

[State 805, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 0

;---------------------------------------------------------------------------
; Throwing the opponent
[Statedef 812]
type = S
movetype= A
physics = N
anim = 810

[State 801, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 200, 1
channel = 0

[State 801, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 105

[State 801, Bind 2]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = 85*const(size.xscale), 0

[State 801, Bind 3]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = 85*const(size.xscale), 0

[State 801, Bind 4]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 95*const(size.xscale) + 0.8*target, const(size.head.pos.x), -40*const(size.yscale) + 0.6*target, const(size.head.pos.y)

[State 801, Bind 5]
type = TargetBind
trigger1 = animelemno(0) = 5
pos = 95*const(size.xscale), -40*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 801, Bind 6]
type = TargetBind
trigger1 = animelemno(0) = 6
pos = 95*const(size.xscale), -50*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 801, Bind 7]
type = TargetBind
trigger1 = animelemno(0) = 7
pos = 45*const(size.xscale) - 0.8*target, const(size.head.pos.x), -140*const(size.yscale) + 0.33*target, const(size.head.pos.y)

[State 801, Bind 8]
type = TargetBind
trigger1 = animelemno(0) = 8
pos = 35*const(size.xscale) - 0.9*target, const(size.head.pos.x), -135*const(size.yscale) + 0.30*target, const(size.head.pos.y)

[State 801, Bind 9]
type = TargetBind
trigger1 = animelemno(0) = 9
pos = 50*const(size.xscale) - target, const(size.head.pos.x), -130*const(size.yscale) + 0.27*target, const(size.head.pos.y)

[State 801, Bind 10]
type = TargetBind
trigger1 = animelemno(0) = 10
pos = 67*const(size.xscale) - target, const(size.head.pos.x), -110*const(size.yscale) + 0.27*target, const(size.head.pos.y)

[State 801, Bind 10]
type = TargetBind
trigger1 = animelemno(0) = 11
pos = 20*const(size.xscale), 0


[State 801, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 11
value = ceil(-100.0*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)

[State 801, EnvShake]
type = EnvShake
trigger1 = AnimElem = 11
time = 10
freq = 50
ampl = 5
phase = 270

[State 801, Explod]
type = null
triggerall = var(22)
trigger1 = AnimElem = 11
postype = p1
anim = 17005
bindtime = 1
pos = floor(20*const(size.xscale)), 5
facing = -1
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State 801, Explod]
type = null
triggerall = !var(22)
trigger1 = AnimElem = 11
postype = p1
anim = F62
bindtime = 1
pos = floor(20*const(size.xscale)), 5
facing = -1
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State XP Add]
type = VarAdd
trigger1 = animelem = 11
var(19) = 700
ignorehitpause = 1

[State 801, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 11
pan = floor(20*const(size.xscale))
value = 820, 1

[State 801, 8]
type = Explod
trigger1 = AnimElem = 11
postype = p1
anim =  3120
scale= 0.25,0.25
pos = floor(20*const(size.xscale)), 0
sprpriority = -5
facing = -1
ownpal = 1


;---------------------------------------------------------------------------
; Opponent Thrown
[Statedef 815]
type = A
movetype= H
physics = N
velset = 0,0

[State 805, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 805

[State 805, Turn]
type = Turn
Trigger1 = Time = 27

[State 805, 1]
type = ChangeAnim
trigger1 = selfanimexist(5100)
Trigger1 = Time = 31
value = 5100

[State 805, SelfState]
type = SelfState
Trigger1 = anim = 5100
trigger1 = animtime = 0 || animtime = 3
trigger2 = time = 31
trigger2 = anim != 5100
value = 5101

[State 805, SelfState]
type = SelfState
trigger1 = time
trigger1 = anim != 5100
trigger1 = !gethitvar(isbound)
value = 5050

[State 805, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 0

;---------------------------------------------------------------------------
; Throwing the opponent
[Statedef 820]
type = S
movetype= A
physics = N
anim = 820

[State 811, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 0, 2
channel = 0

[State 811, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 0

[State 811, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = 0

[State 811, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = 8

[State 811, VarSet]
type = VarSet
trigger1 = time = 0
fvar(1) = 0

[State 811, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
pan = floor(65*const(size.xscale))
value = 2, 7

[State 811, Explod]
type = Explod
trigger1 = var(22)
trigger1 = animelem = 10
postype = p1
anim = 8051
bindtime = 1
pos = floor(75*const(size.xscale)), floor(-65*const(size.yscale))
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State 811, Explod]
type = Explod
trigger1 = !var(22)
trigger1 = animelem = 10
postype = p1
anim = 8051
scale= 0.25,0.25
facing = -1
bindtime = 1
pos = floor(75*const(size.xscale)), floor(-65*const(size.yscale))
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State 811, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 10
value = floor(-32*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100)

[State 811, VarAdd]
type = VarAdd
trigger1 = animelem = 10
fvar(1) = -32*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1) - floor(-32*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1))%100

[State 811, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 10
trigger1 = fvar(1) > 1
value = floor(fvar(1))

[State 811, VarAdd]
type = VarAdd
trigger1 = animelem = 10
trigger1 = fvar(1) > 1
fvar(1) = fvar(1) - floor(fvar(1))

[State XP Add]
type = VarAdd
trigger1 = animelem = 10
var(19) = 100
ignorehitpause = 1

[State 811, VarAdd]
type = VarAdd
trigger1 = var(59) < 1
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = var(59) > 0
trigger2 = time%2 = 0
trigger2 = !time || random/(0.5 + 0.5*(fvar(10))) < 500
var(0) = ifelse(var(0) < 0, -1, 1)

[State 811, VarSet]
type = VarSet
trigger1 = var(59) < 1
trigger1 = var(0) > 0
trigger1 = command = "holdback" && command != "holdfwd"
trigger2 = var(59) > 0
trigger2 = time%6 = 0
trigger2 = random/(0.5 + 0.5*(fvar(10))) < 500
var(0) = -var(0) - 2

[State 811, VarSet]
type = VarSet
trigger1 = var(59) < 1
trigger1 = var(0) < 0
trigger1 = command = "holdfwd" && command != "holdback"
trigger2 = var(59) > 0
trigger2 = time%6 = 3
trigger2 = random/(0.5 + 0.5*(fvar(10))) < 500
var(0) = -var(0) + 2


[State 811, VarAdd]
type = VarAdd
trigger1 = target, command = "a" || target, command = "b" || target, command = "c" || target, command = "x" || target, command = "y" || target, command = "z"
var(1) = ifelse(var(1) < 0, -2, 2)

[State 811, VarSet]
type = VarSet
trigger1 = var(1) > 0
trigger1 = target, command = "holdback" && target, command != "holdfwd"
var(1) = -var(1) - 4

[State 811, VarSet]
type = VarSet
trigger1 = var(1) < 0
trigger1 = target, command = "holdfwd" && target, command != "holdback"
var(1) = -var(1) + 4

[State 811, TargetVelSet]
type = TargetVelSet
trigger1 = animelem = 11
trigger1 = ifelse(abs(var(0)) - abs(var(1)) > 0, fvar(0) > 27 + abs(var(0)), fvar(0) > 32) || abs(var(0)) - abs(var(1)) < -32
x = -5
y = -7.5

[State 811, ChangeState]
type = ChangeState
trigger1 = animelem = 11
trigger1 = ifelse(abs(var(0)) - abs(var(1)) > 0, fvar(0) > 27 + abs(var(0)), fvar(0) > 32) || abs(var(0)) - abs(var(1)) < -32
value = 822

[State 811, VarAdd]
type = VarAdd
trigger1 = animelem = 11
fvar(0) = fvar(0)*.5

[State 811, Bind 2]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = 85*const(size.xscale), 0

[State 811, Bind 3]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = 85*const(size.xscale), 0

[State 811, Bind 4]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 95*const(size.xscale) + 0.8*target, const(size.head.pos.x), -40*const(size.yscale) + 0.6*target, const(size.head.pos.y)

[State 811, Bind 5]
type = TargetBind
trigger1 = animelemno(0) = 5
pos = 95*const(size.xscale), -40*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 811, Bind 6]
type = TargetBind
trigger1 = animelemno(0) = 6
pos = 95*const(size.xscale), -50*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 811, Bind 7]
type = TargetBind
trigger1 = animelemno(0) = 7
pos = 85*const(size.xscale), -60*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 811, Bind 8]
type = TargetBind
trigger1 = animelemno(0) = 8
pos = 85*const(size.xscale), -60*const(size.yscale) + 0.8*target, const(size.head.pos.y)*(0.5 + 0.5*((target, const(size.head.pos.y)/target, const(size.mid.pos.y)) - 0.25))

[State 811, Bind 9]
type = TargetBind
trigger1 = animelemno(0) = 9
pos = 65*const(size.xscale), 0

[State 811, Bind 10]
type = TargetBind
trigger1 = animelemno(0) = 10
pos = 67*const(size.xscale), 0

[State 811, Bind 11]
type = TargetBind
trigger1 = animelemno(0) = 11
pos = 65*const(size.xscale), 0


[Statedef 822]
type = S
physics = S
ctrl = 1
anim = 821
velset = 0,0

[State 812, 4]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = animelemno(0) > 5
trigger2 = p2dist x < 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Opponent Grabbed
[Statedef 825]
type = A
movetype= H
physics = N
velset = 0,0

[State 815, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 822

[State 815, SelfState]
type = SelfState
trigger1 = time
trigger1 = !gethitvar(isbound)
value = 5050

[State 815, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 0
