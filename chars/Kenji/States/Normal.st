; _________________________________________
;|Kenji by K6666orochi
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<NORMAL MOVES>====
;==

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type = S
physics = S
movetype= A
anim = 200
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Snd]
type=playsnd
trigger1= animelem = 2
value=1,6
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 3, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = high
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 15
ground.velocity = ifelse(var(20), -4.41, -6.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.41, -6.49)
guard.cornerpush.veloff = 0
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 200
elem = 3
ignoreHitPause = 1

[State 1000, Spark]
type = Explod
;triggerall = id <enemy,id
trigger1 = AnimElem=2
Anim = 6300
id = 6300
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 1,1
persistent = 1

[State 200, Idle]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 210,Exit]
type = ChangeState
triggerall = movecontact
trigger1 = command="z" && command = "holddown" ;&& !fvar(38)
value = 203

[State 210,Exit]
type = ChangeState
triggerall = movecontact
trigger1 = command="z" ;&& !fvar(38)
value = 202

[State 200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Close Light Punch
[Statedef 201]
type = S
physics = S
movetype= A
anim = 201
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Snd]
type=playsnd
trigger1= animelem = 2
value=1,6
channel=1

[State 201, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 3, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = high
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 15
ground.velocity = ifelse(var(20), -4.41, -6.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.41, -6.49)
guard.cornerpush.veloff = 0
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 201, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 201
elem = 3
ignoreHitPause = 1

[State 1000, Spark]
type = Explod
;triggerall = id <enemy,id
trigger1 = AnimElem=2
Anim = 6300
id = 6300
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 1,1
persistent = 1

[State 201, Idle]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 210,Exit]
type = ChangeState
triggerall = movecontact
trigger1 = command="z" && command = "holddown" ;&& !fvar(38)
value = 203

[State 210,Exit]
type = ChangeState
triggerall = movecontact
trigger1 = command="z" ;&& !fvar(38)
value = 202

[State 201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 202]
type = S
physics = S
movetype= A
anim = 202
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 201, Woosh]
type = PlaySnd
trigger1 = animelem = 3
value = 1,2
channel = -1

[State 203, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 6300

[State 201, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 3, Hit
damage = ceil(ifelse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -1, -3), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -1, -3)
guard.cornerpush.veloff = 0
air.velocity = -3,-3 
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45), var(36) := -50
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200,VarSet]
type = PosAdd
trigger1 = AnimElem=4
x = 50

[State 201, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 201
elem = 3
ignoreHitPause = 1

[State 201, Idle]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 300
ctrl = 1

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 203]
type = S
physics = S
movetype= A
anim = 203
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 201, Woosh]
type = PlaySnd
trigger1 = animelem = 4
value = 1,0
channel = -1

[State 203, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 6300

[State 201, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
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
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45), var(36) := -70
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 201, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 201
elem = 3
ignoreHitPause = 1

[State 200,VarSet]
type = PosAdd
trigger1 = AnimElem=2
x = 35

[State 201, Idle]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 300
ctrl = 1

;------------------------------
;Stand atack recover
[Statedef 300]
type = S
movetype= I
physics = S
poweradd= 0
ctrl = 1
velset = 0,0
anim = 1
sprpriority = 1

[State 210,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 1
ctrl = 1
;---------------------------------------
;crouch atack recover
[Statedef 460]
type = C
movetype= I
physics = C
poweradd= 00
ctrl = 1
velset = 0,0
anim = 13
sprpriority = 1

[State 210,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 1
ctrl = 1
;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type = S
physics = S
movetype= A
anim = 210+1*(p2bodydist x <= (const(size.xscale) * 29))
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Snd]
type=playsnd
trigger1= animelem=4
value= 4, 1
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=4
value=1,7
channel=-1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,15
channel = 2

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
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
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=80), var(36):=Ifelse((anim=210),-77,Ifelse((anim=211),-79,-79))
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 210, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=3
Anim = 6310
id = 6310
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,1
persistent = 1

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 211]
type = S
movetype= A
physics = N
anim = 212
ctrl = 0
velset = 3,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Snd]
type=playsnd
trigger1= animelem=4
value= 4,1
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=4
value=1,7
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 2,15
channel = 2


[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 7, 12), ifelse(var(20), 7, 12)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = low
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
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=80), var(36):=Ifelse((anim=210),-77,Ifelse((anim=211),-79,-79))
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 210, Idle]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 350]
type = velSet
trigger1 = AnimElem=9
x = 0

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=5
Anim = 6311
id = 6311
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,1
persistent = 1

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 300
ctrl = 1
;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
anim = 220
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Snd]
type=playsnd
trigger1= animelem=6
value= 4, 2
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=6
value=2,16
channel=2

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=8
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
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
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Idle]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 210,Exit]
type = ChangeState
triggerall = AnimElemTime(12)>0 && AnimElemTime(14)<0 ;&& movecontact
trigger1 = command="z" ;&& !fvar(38)
value = 222


[State 220, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Close Heavy Punch
[Statedef 221]
type = S
physics = S
moveType = A
anim = 221
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Snd]
type=playsnd
trigger1= animelem=6
value= 4, 2
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=6
value=2,16
channel=2

[State 221, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8 
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.06, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.06, -3)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 221, Idle]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 210,Exit]
type = ChangeState
triggerall = AnimElemTime(12)>0 && AnimElemTime(14)<0 ;&& movecontact
trigger1 = command="z" ;&& !fvar(38)
value = 222

[State 221, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Strong Punch
[Statedef 222]
type = S
physics = S
moveType = A
anim = 222
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Snd]
type=playsnd
trigger1= animelem=4
value=2,16
channel=2

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=6
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 16 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 220, Idle]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 220, ChangeState]
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
anim = 230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Snd]
type=playsnd
trigger1= animelem = 1
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=2
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
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
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 230, Idle]
type=statetypeset
trigger1= animelemtime(5)>=1
movetype=I

[State 230, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Close Light Kick
[Statedef 231]
type = S
physics = S
moveType = A
anim = 231
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 230, Snd]
type=playsnd
trigger1= animelem= 1
value=1,3
channel=1

[State 231, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=2
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 231, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 231
elem = 3
ignoreHitPause = 1

[State 231, Idle]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 231, ChangeState]
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
anim = 240
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 240, Dust]
type = null;helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 240, 2]
type = null;HitDef
trigger1 = Time = 0
attr = S, NA
animtype = Medium
damage = 80
guardflag = MA
pausetime = 12,12
sparkno = 1
sparkxy = -10,-60
hitsound = S5,1
guardsound = S6,0
ground.type = Low
ground.slidetime = 5
ground.hittime = 5
ground.velocity = -1,-10
air.velocity = -1,-10
fall = 1
air.fall = 1
yaccel = .38
fall.recover=0

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
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
ground.hittime = 5 + 3*var(9)
ground.slidetime = 5 + 3*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = -1,-10
ground.cornerPush.velOff = 0
air.velocity = -1,-10
fall = 1
air.fall = 1
yaccel = .38
fall.recover=0
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=95), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 240, Idle]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 210,Exit]
type = ChangeState
triggerall = movecontact && time <12
trigger1 = command="c" ;&& !fvar(38)
value = 241

[State 240, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 241]
type = A
movetype= A
physics = N
anim = 241
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 241, Snd]
type=playsnd
trigger1= animelem=1
value=4,1
channel=1

[State 241, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = 1,4
channel = -1

[State 240, Dust]
type = helper
trigger1 = animelem = 2
;helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 240, 2]
type = HitDef
trigger1 = Time = 0
attr = S, NA
animtype = Medium
damage = ceil(ifelse(fvar(11)*70<7, 7, fvar(11)*70)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=95), var(36):=-100
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
ground.type = Low
ground.slidetime = 12
ground.hittime = 17
ground.velocity = -3,-8
air.velocity = -3,-8
yaccel = .55


[State 240, Idle]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 200,VarSet]
type = VelSet
trigger1 = Animelem = 2
x = 3
y = -4.5

[State 200,VarSet]
type = Veladd
trigger1 = time > 3
y = .25

[State 200,VarSet]
type = Velset
trigger1 = Animelem = 6
x = 2

[State 200,VarSet]
type = ChangeAnim
triggerall = time >10
trigger1 = Vel Y>=0 && Pos Y>=-Vel Y && Anim!=47
value = 47

[State 200,VarSet]
type = StatetypeSet
trigger1 = Anim=47
statetype=S
physics = S

[State 200,VarSet]
type = PosSet
trigger1 = Anim=47
y = 0

[State 200,VarSet]
type = VelSet
trigger1 = Anim=47
x = 0
y = 0

[State 210,Exit]
type = CtrlSet
trigger1 = Anim=47&&AnimElem=2
value = 1

[State 210,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
anim = 250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Snd]
type=playsnd
trigger1= animelem=11
value=3100,2
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -5,-3
ground.cornerPush.velOff = 0
air.velocity = -5,-3
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-66
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 250, Idle]
type=statetypeset
trigger1= animelemtime(13)>=0
movetype=I

[State 250, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 250
elem = 6
ignoreHitPause = 1

[State 100, Explod]
type = Explod
trigger1 = AnimElem=11
Anim = 451
id = 451
pos = 0, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
persistent = 1
sprpriority = 2
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 14
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 40, -10
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 25, 0
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 15, -5
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 19
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 55, 0
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3


[State 250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Close Heavy  Kick
[Statedef 251]
type = S
physics = S
moveType = A
anim = 251
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Snd]
type=playsnd
trigger1= animelem=11
value=3100,2
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -5,-3
ground.cornerPush.velOff = 0
air.velocity = -5,-3
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=200), var(36):=-66
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 250, Idle]
type=statetypeset
trigger1= animelemtime(13)>=0
movetype=I

[State 250, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 250
elem = 6
ignoreHitPause = 1

[State 100, Explod]
type = Explod
trigger1 = AnimElem=11
Anim = 451
id = 451
pos = 0, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
persistent = 1
sprpriority = 2
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 14
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 40, -10
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 25, 0
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 15, -5
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 19
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 55, 0
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 251, ChangeState]
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
anim = 400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=2
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=72), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 400
elem = 3
ignoreHitPause = 1

[State 400, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, ChangeState]
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
anim = 410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Snd]
type=playsnd
trigger1 = animelem = 3
value= 4,1
channel=0

[State 410, Snd]
type=playsnd
trigger1 = animelem = 2
value=1,7
channel=3

[State 410, Snd]
type=playsnd
trigger1 = animelem = 4
value=1,7
channel=3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
value = 2,15
channel = 2

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem= 3
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),104,72)*!var(20), 36*!var(20)
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=94), var(36):=-30
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem= 5
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*45<7, 7, fvar(11)*45)), 0
getpower = ifelse(!var(13),104,72)*!var(20), 36*!var(20)
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=94), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Spark]
type = Explod
triggerall = id <enemy, id
trigger1 = AnimElem=3
Anim = 411
id = 411
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,1
persistent = 1

[State 1000, Spark]
type = Explod
triggerall = id >enemy, id
trigger1 = AnimElem=3
Anim = 411
id = 411
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,2
persistent = 1


[State 410, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 410, ChangeState]
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
anim = 420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Snd]
type=playsnd
trigger1= animelem = 4 
value= 4, 2
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 2,16
channel = 2

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=6
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 10), ifelse(var(20), 2, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
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
sparkxy = -10 + 0*(var(35):=195), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 420, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 420
elem = 4
ignoreHitPause = 1

[State 420, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 420, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 460
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch Hold Foward
[Statedef 421]
type = C
physics = C
moveType = A
anim = 421
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Snd]
type=playsnd
trigger1= animelem = 4 
value= 4, 2
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 2,16
channel = 2

[State 421, Velocity]
type = VelSet
trigger1 = AnimElem=3
x = 4

[State 421, Gravity]
type = Veladd
trigger1 = AnimElem=5
x = 0
y = 0

[State 421, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*42<7, 7, fvar(11)*42)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 6, 6)
guard.pausetime = ifelse(var(20), 6, 6), ifelse(var(20), 6, 6)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.26, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.26, -4.52)
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
sparkxy = -10 + 0*(var(35):=47), var(36):=-53
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 421, Hit]
type=hitdef
trigger1= animelem=4
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*42<7, 7, fvar(11)*42)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 6, 6
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
ground.velocity = ifElse(var(20), -4.26, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.26, -4.52)
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
sparkxy = -10 + 0*(var(35):=76), var(36):=-63
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1

[State 421, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 421, ChangeState]
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
anim = 430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=2
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
priority = 4, Hit
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
ground.hittime = 15 + 2*var(9)
ground.slidetime = 15 + 2*var(9)
guard.hittime = 15
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
sparkxy = -10 + 0*(var(35):=68), var(36):=-2
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 430
elem = 3
ignoreHitPause = 1

[State 430, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, ChangeState]
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
anim = 440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Snd]
type=playsnd
trigger1= animelem=4 
value= 4, 0
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=5
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=90), var(36):=-11
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 440, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 441]
type = C
physics = C
moveType = A
anim = 441
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Snd]
type=playsnd
trigger1= animelem=4 
value= 4, 0
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1

[State 240, 2]
type =null; HitDef
trigger1 = Time = 0
attr = S, NA
animtype = Medium
damage = 70
guardflag = MA
pausetime = 12,12
sparkno = 1
sparkxy = -10,-60
hitsound = S5,1
guardsound = S6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 17
ground.velocity = -1,-10
air.velocity = -1,-10
fall = 1
air.fall = 1
yaccel = .38
fall.recover=0


[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = S, NA
animtype = Medium
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*65<7, 7, fvar(11)*65)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = -1,-10
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.velocity = -1, -10
air.cornerPush.velOff = 0
fall = 1
air.fall = 1
yaccel = .38
fall.recover=0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 440, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 460
ctrl = 1


;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
anim = 450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 3100,2
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time= 0
ID = 450
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 17 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = 0, -5
air.cornerPush.velOff = 0
yAccel = .3
fall = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-25
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 100, Explod]
type = Explod
trigger1 = AnimElem=11
Anim = 451
pos = 22, 27
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 14
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 50, -10
bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 35, 0
bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 25, -5
bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 19
;trigger1 = (time % 10) = 1
ID = 41
anim = 452 + random%3
postype = p1
pos = 65, 0
bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, Idle]
type = StateTypeset
trigger1= AnimElemTime(12) >= 0
moveType = I

[State 450, ChangeState]
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
anim = 600
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,6
channel=1

[State 600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-40
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

[State 600, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 601]
type = A
physics = N
moveType = A
anim = 601
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,0
channel = 0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,6
channel=1

[State 600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=45), var(36):=-150
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

[State 600, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics = N
moveType = A
anim = 610
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Snd]
type=playsnd
trigger1= animelem=4 
value= 1000,2
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=4
value=1,7
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,15
channel = 2

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=5
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=80), var(36):=-60
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

[State 1000, Spark]
type = Explod
triggerall = id <enemy,id
trigger1 = AnimElem=4
Anim = 611
id = 610
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,1
persistent = 1

[State 1000, Spark]
type = Explod
triggerall = id >enemy,id
trigger1 = AnimElem=4
Anim = 611
id = 610
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,2
persistent = 1

[State 610, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
anim = 620
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Snd]
type=playsnd
trigger1= animelem=5 
value= 4, 2
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 2,16
channel = 2

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= animelem=6
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=180), var(36):=0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 620, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
anim = 630
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=60), var(36):=-30
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 630
elem = 5
ignoreHitPause = 1

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 630, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
anim = 640
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Snd]
type=playsnd
trigger1= animelem=4
value= 4, 0
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=84), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 4
ignoreHitPause = 1

[State 640, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------
[Statedef 645]
type = A
physics = N
moveType = A
anim = 645
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=84), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 4
ignoreHitPause = 1

[State 640, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = A
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,2
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=90), var(36):=0
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 650, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 100, Explod]
type = Explod
trigger1 = AnimElem=9
Anim = 652
id = 652
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 40, -10+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 25, 0+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 20
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 15, -5+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 22
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 55, ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3


[State 350]
type = ChangeState
trigger1 = AnimElem=9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52


;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 651]
type = A
physics = A
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,2
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=90), var(36):=0
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 650, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 100, Explod]
type = Explod
trigger1 = AnimElem=9
Anim = 652
id = 652
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 40, -10+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 25, 0+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 20
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 15, -5+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 22
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 55, ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3

[State 350]
type = ChangeState
trigger1 = AnimElem=9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 652]
type = A
physics = A
moveType = A
anim = 653
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,2
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=0), var(36):=60
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 650, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 100, Explod]
type = Explod
trigger1 = AnimElem=9
Anim = 654
id = 654
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 40, -10+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 25, 0+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 20
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 15, -5+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 22
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 55, ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3


[State 350]
type = ChangeState
trigger1 = AnimElem=9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 653]
type = A
physics = A
moveType = A
anim = 655
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 3100,2
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3
channel = -1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= time=0
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
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
sparkxy = -10 + 0*(var(35):=100), var(36):=-80
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 650, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 100, Explod]
type = Explod
trigger1 = AnimElem=9
Anim = 451
id = 451
pos = 0, -30
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 100, 6]
type = Explod
trigger1 = animelem = 16
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 40, -10+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 18
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 25, 0+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 20
;trigger1 = (time % 15) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 15, -5+ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 100, 6]
type = Explod
trigger1 = animelem = 22
;trigger1 = (time % 10) = 1
ID = 452
anim = 452 + random%3
postype = p1
pos = 55, ceil(-pos Y)
;bindtime = 1
;removetime = 24
ownpal = 1
random = 0, 5
sprpriority = 3

[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = 0
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3


[State 350]
type = ChangeState
trigger1 = AnimElem=9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52


;------------------------------------------------------------------------------;
[Statedef 800]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = ifelse(var(40)!=2 && command = "pp",800,ifelse(var(40)=2 && command = "kk",800,801))
sprpriority = 2

[State 800, HitDef]
type = HitDef
trigger1 = Anim = 800
trigger1 = Animelem = 2
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = M-          ;Affect only ground people who are not being hit
priority = 3, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
p1sprpriority = 1     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1          ;Force p2 to face KFM
p1stateno = 801       ;On success, KFM changes to state 810
p2stateno = 802       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
numhits = 0
hitsound = S2,800

[State 800, HitDef]
type = HitDef
triggerall = Anim = 801
triggerall = P2StateNo != [150,155]
triggerall = P2MoveType != H
trigger1 = Animelem = 2
attr = S, NT
hitflag = M-
priority = 3, Miss
sparkno = -1
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
p1stateno = 804
p2stateno = 805
down.bounce = 1
guard.dist = 0
numhits = 0
hitsound = S2,800

[State 800, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S4,0
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 800, Swing Snd]
type=PlaySnd
trigger1=AnimElem=3
value=1,0
channel=1

[State 800, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;
[Statedef 801]
type = S
movetype = A
physics = N
velset = 0,0


[State Throw Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890
[State Throw Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 801, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 11
value = S4, 1
volumescale = 255
ignorehitpause = 1
persistent = 1


[State 801, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 802

[State 801, TargetState]
type = TargetState
trigger1 = AnimElem = 12
value = 803

[State 801, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 802
persistent = 0

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 5
x = 37

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 6
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 7
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 8
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 11
x = 28


[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = 42,0
;postype = P1
time = -1

[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 11
pos = 42,0
;postype = P1
time = -1

[State 801, TargetBind]
type = targetBind
trigger1 = animelem = 12
pos = 38, 0
;postype = P1
time = 1

[State 801, HitAdd]
type = HitAdd
trigger1 = AnimElem = 12
value = 1

[State 801, Sparks]
type=helper
trigger1 = AnimElem = 12
;helpertype=normal
stateno=8013
ID=8013
name="Spark"
postype=p1
pos= 50,-50
facing= -1
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1
size.xscale =1.1
size.yscale =1.1

[State 810, Woosh Sound]
type=PlaySnd
trigger1=AnimElem=11
value=1, 8
channel=1
[State 810, Hitsound]
type=PlaySnd
trigger1=AnimElem=12
value=s2,5
channel=2
[State 810, EnvShake]
type=EnvShake
trigger1=animelem=12
time=12
ampl=5

[State 801, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 12
value = -132


[State 801, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 300
ctrl = 1

;-------------------------------------------------------------------------------
;
[Statedef 802]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State Throw Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State Throw Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 802, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 802, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1

[State 802, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 803
;-------------------------------------------------------------------------------
[Statedef 803]
type=A
physics=N
movetype=H
ctrl=0
velset = -5,-6.5
sprpriority=-1

[State 803, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.55

[State 803, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5061

[State 803, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 803, SelfState]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;-------------------------------------------------------------------------------
[Statedef 804]
type = S
movetype = A
physics = N
velset = 0,0

[State 804, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = S820, 1
volumescale = 255
ignorehitpause = 1
persistent = 1
channel= 4

[State 804, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = S4,2
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 804, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 804, TargetState]
type = TargetState
trigger1 = AnimElem = 18
value = 803

[State 804, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 804
persistent = 0

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 5
x = 37

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 6
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 7
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 8
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 14
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 15
x = 17

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 16
x = 16

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 17
x = 18

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 18
x = 27

[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = -20,0
;postype = P1
time = -1

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(13)>=0 && AnimElemTime(14)<0
pos = ceil(-8*const(size.xscale)),ceil(-75*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(14)>=0 && AnimElemTime(15)<0
pos = ceil(-20*const(size.xscale)),ceil(-97*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(15)>=0 && AnimElemTime(16)<0
pos = ceil(-25*const(size.xscale)),ceil(-105*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(16)>=0 && AnimElemTime(17)<0
pos = ceil(-35*const(size.xscale)),ceil(-105*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(17)>=0 && AnimElemTime(18)<0
pos = ceil(50*const(size.xscale)),ceil(-100*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(18)>=0 && AnimElemTime(19)<0
pos = ceil(55*const(size.xscale)),ceil(-20*const(size.yscale)) 

[State 804, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 18
value = -132



[State 801, EnvShake]
type = EnvShake
trigger1 = AnimElem = 18
time = 10
freq = 50
ampl = 5
phase = 270

[State 52, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 52
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 805]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 805, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 815

[State 805, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

;===< Target Escaped >==
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
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

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, Pos]
type = posset
trigger1 = !time
y = 0

[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, FX]
type = helper
trigger1 = !time
;helpertype = normal
stateno = 8000
ID = 8000
name = "Spark"
postype = p1
pos = 0, -64
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1


;--- TARGET ---
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
