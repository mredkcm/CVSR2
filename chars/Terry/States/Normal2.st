;                          ____________________
;=|Terry Bogard by Memo|=
;                          ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<NORMAL MOVES>====
;==

;---------------------------------------------------------------------------
; Standing Far Light Punch
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

[state 200,Posset]
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
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(Var(20)>0))/2),ceil(8*(2-(Var(20)>0))/2)
guard.pausetime = ceil(10*(2-(Var(20)>0))/2),ceil(10*(2-(Var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = high
air.type = Low
ground.hittime = 10 + 2 * var(9)
ground.slidetime = 10 + 2 * var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifelse(var(20), -3.41, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.41, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 76), var(36) := -84
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 200, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 200
elem = 3
ignoreHitPause = 1

[State 200, Idle]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && !Animtime && p2bodydist x = [25, 70]
triggerall = numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movehit
value = ifelse(random < 750, 440, 240)
ignorehitpause = 1 

[State 0, AI]
type = changestate
triggerall = AILevel && p2bodydist x < 25 && numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movecontact
value = ifelse(moveguarded, 430, ifelse(random < 500, 400, 200))
ignorehitpause = 1

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

[state 201,Posset]
type=posset
trigger1=!time
y=0

[State 201, Voice]
type = PlaySnd
trigger1 = !time && Random < 200
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 201, Woosh]
type = PlaySnd
trigger1 = !time
value = 1,0
channel = 1

[State 201, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(var(20)>0))/2),ceil(8*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 2 * var(9)
ground.slidetime = 10 + 2 * var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifelse(var(20), -4.21, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.21, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45), var(36) := -80
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

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
trigger1= animelemtime(4)>=0
movetype=I

[State 201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 201, ChangeState]
type = ChangeState
triggerall = prevstateno!=201
trigger1 = movecontact
trigger1 = command="a" && (animelemtime(3)>0)
value = 231
ignorehitpause=1

[State 0, AI]
type = changestate
triggerall = numenemy && AILevel && roundstate = 2 && enemy, stateno != 1455 && enemy,statetype != A && p2bodydist x < 15
trigger1 = movehit
value = ifelse((power = [500, 999]), 1330, 1000)

;---------------------------------------------------------------------------
; Standing Far Medium Punch
[Statedef 210]
type = S
physics = S
movetype= A
anim = 210
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[state 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
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
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 14 + 3*var(9)
ground.slidetime = 14 + 3*var(9)
guard.hittime = 14
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0 * (var(35) := 80), var(36) := -79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 210, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && roundstate = 2 && enemy,statetype != A && p2bodydist x < 60 && numenemy
trigger1 = movehit && !Animtime
value = ifelse(enemy, statetype = C, 400, ifelse(random < 750, 200, 400))
ignorehitpause = 1

;---------------------------------------------------------------------------
; Standing Close Medium Punch
[Statedef 211]
type = S
physics = S
movetype= A
anim = 211
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[state 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 211, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.57), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.57)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0 * (var(35) := 80), var(36) := -79
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 210, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = numenemy && AILevel && roundstate = 2 && enemy, stateno != 1455 && enemy,statetype != A && p2bodydist x < 15
trigger1 = movehit
value = ifelse((power = [500, 999]), 1430, 1000)

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

[state 220,Posset]
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
trigger1= animelem=2
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
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
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 220, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 220
elem = 5
ignoreHitPause = 1

[State 220, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 220, ChangeState]
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
anim = 221
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[state 221,Posset]
type=posset
trigger1=!time
y=0

[State 221, Snd]
type=playsnd
trigger1= !time && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 221, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 221, Width]
type = null;Width
trigger1 = AnimElemNo(0) = 3
edge = 0,0
player = 20,0

[State 221, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem = 3
attr = S,NA
hitflag = MA
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*40<7, 7, fvar(11)*40)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -2.26, -10), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.26, -10)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=75), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 221, Hit]
type=HitDef
trigger1= animelem=4
attr = S,NA
hitflag = MA
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*42<7, 7, fvar(11)*42)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 6, 6
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.26, -10), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.26, -10)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-64
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 221, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 221
elem = 4
ignoreHitPause = 1

[State 221, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 221, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && roundstate = 2 && enemy, stateno != 1455
triggerall = p2statetype != A && p2bodydist x < 60 && numenemy
trigger1 = movehit 
value = 1200

;---------------------------------------------------------------------------
; Standing Far Light Kick
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

[state 230,Posset]
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

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(var(20)>0))/2),ceil(8*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 10 + 2*var(9)
ground.slidetime = 10 + 2*var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -6.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -6.49)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 230, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 230
elem = 4
ignoreHitPause = 1

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

[state 231,Posset]
type=posset
trigger1=!time
y=0

[State 231, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 231, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 231, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(var(20)>0))/2),ceil(8*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -6.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -6.41)
guard.cornerpush.veloff = 0
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=58), var(36):=-68
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 231, ChangeAnimElem]
type = null;ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 
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

[State 0, AI]
type = changestate
triggerall = numenemy && AILevel && roundstate = 2 && enemy, stateno != 1455 && enemy,statetype != A && p2bodydist x < 15
trigger1 = movehit
value = ifelse((power = [500, 999]), 1230, 1000)

;---------------------------------------------------------------------------
; Standing Far Medium Kick
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

[state 240,Posset]
type=posset
trigger1=!time
y=0

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

[State 240, Dust]
type = helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 240, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 17

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=6
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=95), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 240, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 240
elem = 7
ignoreHitPause = 1

[State 240, Idle]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 240, ChangeState]
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
anim = 241
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[state 241,Posset]
type=posset
trigger1=!time
y=0

[State 241, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 241, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 241, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -7), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -7)
guard.cornerpush.veloff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=58), var(36):=-68
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 241, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 241
elem = 3
ignoreHitPause = 1

[State 241, Idle]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 241, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[State 0, AI]
type = changestate
triggerall = numenemy && AILevel && roundstate = 2 && enemy, stateno != 1455 && enemy,statetype != A && p2bodydist x < 15
trigger1 = movehit
value = ifelse((power = [500, 999]), 1230, 1000)

;---------------------------------------------------------------------------
; Standing Far Strong Kick
[Statedef 250]
type = S
physics = N
moveType = A
anim = 250
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[state 250,Posset]
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
trigger1= animelem=3
value=1,5
channel=1

[State 250, Dust]
type = helper
trigger1 = animelem = 4
;helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 250, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
statetype = A
physics = N

[State 250, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 0.8320493
y = -2.8050775

[State 250, VelAdd]
type = Veladd
trigger1 = AnimElemTime(3) > 0
x = 0;.222222223877907
y = 0.21875

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 20 + 4*var(9)
ground.slidetime = 20 + 4*var(9)
guard.hittime = 20
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = -16.52
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = -16
air.velocity = -9, -4.25
air.cornerPush.velOff = -16.52
yaccel = 0.5
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=85), var(36):=-66
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 250, Idle]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 250, Gravity]
type = Gravity
trigger1 = Time >= 20

[State 250, ChangeState]
type=changestate
triggerall = Animelemtime(8) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value=252

;---------------------------------------------------------------------------
; Standing Close Strong  Kick
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

[state 251,Posset]
type=posset
trigger1=!time
y=0

[State 251, Snd]
type=playsnd
trigger1= animelem=4 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 251, Snd]
type=playsnd
trigger1= animelem=4
value=1,5
channel=1

[State 251, Width]
type=Width
trigger1=AnimElemTime(3)=1
player = 45, 0
edge = 50, 0

[State 251, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=4
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -6.83, -10), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -6.83, -10)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-82
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 251, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 251
elem = 5
ignoreHitPause = 1

[State 251, Idle]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 251, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Far Strong Kick (Landing)
[Statedef 252]
type = C
physics = C
movetype = I
anim = 252
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 252, PosSet]
type = posset
trigger1 = 1
y = 0

[State 252, Play Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 252, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 252, Change State]
type = changestate
trigger1 = !animtime
value = 11
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

[state 400,Posset]
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
trigger1= animelem=2
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*21<7, 7, fvar(11)*21)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(var(20)>0))/2),ceil(8*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 10 + 2*var(9)
ground.slidetime = 10 + 2*var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -6)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=72), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 400, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && !Animtime && p2bodydist x = [20, 70]
triggerall = numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movecontact
value = 440
ignorehitpause = 1 

[State 0, AI]
type = changestate
triggerall = AILevel && p2bodydist x < 20 && numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movecontact
value = ifelse(enemy, statetype = C, 400, ifelse(random < 500, 400, 200))
ignorehitpause = 1 

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

[state 410,Posset]
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

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -8)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=94), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 410, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) >= 0 
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 410
elem = 4
ignoreHitPause = 1

[State 410, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
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

[state 420,Posset]
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
trigger1= !time
value=1,2
channel=1

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15) < 1 || var(20))
trigger1= !Time && !movecontact && !movereversed
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=94), var(36):=-56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

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
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 420, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch Hold Foward
[Statedef 421]
type = C
physics = S
moveType = A
anim = 421
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[state 421,Posset]
type=posset
trigger1=!time
y=0

[State 421, Snd]
type=playsnd
trigger1= animelem = 2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 421, Snd]
type=playsnd
trigger1= animelem = 2
value=1,2
channel=1

[State 421, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time 
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
;priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.06, -10), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.06, -10)
guard.cornerPush.velOff = 0
air.velocity = -3, -8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 421, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 421
elem = 4
ignoreHitPause = 1

[State 421, Idle]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

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

[state 430,Posset]
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
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(8*(2-(var(20)>0))/2),ceil(8*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 10 + 2*var(9)
ground.slidetime = 10 + 2*var(9)
guard.hittime = 11
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -6)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
yAccel = 0.5
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
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 430, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 
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

[State 0, AI]
type = changestate
triggerall = AILevel && !Animtime && p2bodydist x = [25, 70]
triggerall = !numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movecontact
value = 1500 && Random < (350 * (AILevel ** 2 / 64.0))
ignorehitpause = 1 

[State 0, AI]
type = changestate
triggerall = AILevel && p2bodydist x < 25 && numenemy && enemy, statetype != A && roundstate = 2
trigger1 = movecontact
value = ifelse(!movehit, 430, ifelse(random < 750, 400, 430))
ignorehitpause = 1

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

[state 440,Posset]
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
trigger1= animelem=3
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -8)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=78), var(36):=-11
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 440, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 440
elem = 4
ignoreHitPause = 1

[State 440, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 440, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

[State 0, AI]
type = changestate
triggerall = AILevel && roundstate = 2 && enemy, stateno != 1455
triggerall = p2statetype != A && p2bodydist x < 60 && numenemy
trigger1 = movehit
value = ifelse((power = [500, 999]), 1230, 1000)

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

[state 450,Posset]
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
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(12*(2-(var(20)>0))/2),ceil(12*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
air.velocity = -.7,-6.25
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=98), var(36):=-54
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 450
elem = 5
ignoreHitPause = 1

[State 450, Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
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

[State 445, Change Anim]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 445, Change State]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 445, Force Feed Back]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140

;----------------------------------
;Tripped get-hit (knocked away)
[Statedef 456]
type = A
movetype= H
physics = N

[State 456, Hit Vel Set]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 456, Vel Add] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 456, Self State] ;Hit ground
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
;anim = 600
ctrl = 0
sprPriority = 1
;powerAdd = 0

[state 600,anim]
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
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(9*(2-(var(20)>0))/2),ceil(9*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 2*var(9)
ground.slidetime = 10 + 2*var(9)
guard.hittime = 11
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -3.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -3.49)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-66
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

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
;anim = 610
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[state 610,anim]
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
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(11*(2-(var(20)>0))/2),ceil(11*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
guard.velocity = ifElse(var(20), -3.66, -4.51)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=58), var(36):=-42
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 610, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 610
elem = 5
ignoreHitPause = 1

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
;anim = 620
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[state 620,anim]
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
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
ground.velocity = ifElse(var(20), -3.41, -5.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
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
sparkxy = -10 + 0*(var(35):=58), var(36):=-42
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 620, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 620
elem = 5
ignoreHitPause = 1

[State 620, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
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
;anim = 630
ctrl = 0
sprPriority = 1
;powerAdd = 0

[state 630,anim]
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
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(9*(2-(var(20)>0))/2),ceil(9*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 2*var(9)
ground.slidetime = 10 + 2*var(9)
guard.hittime = 11
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -3.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -3.49)
guard.cornerPush.velOff = 0
air.velocity = -3, -8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-108
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 3
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 630, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 630
elem = 5
ignoreHitPause = 1

[State 630, Idle]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

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
;anim = 640
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[state 640,anim]
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
trigger1 = !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(11*(2-(var(20)>0))/2),ceil(11*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
air.velocity = -6.4, -4.8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
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
envshake.time = 6
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 640, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 640
elem = 5
ignoreHitPause = 1

[State 640, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Neutral Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
;anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[state 650,anim]
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
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
ground.velocity = ifElse(var(20), -2.41, -5.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity =  -6.4, -4.8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=78), var(36):=-34
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 650, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 650
elem = 5
ignoreHitPause = 1

[State 650, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 651]
type = A
physics = N
moveType = A
;anim = 651
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[state 651,anim]
type=changeanim
trigger1=!time
value=651

[State 651, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 651, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 651, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
;priority = 4, Hit
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
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
ground.velocity = ifElse(var(20), -2.41, -5.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity =  -6.4, -4.8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=78), var(36):=-34
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
fall.envshake.time = 1
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0

[State 651, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 651
elem = 5
ignoreHitPause = 1

[State 651, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 651, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 651, ChangeState]
type=changestate
trigger1= pos y>-vel y
value=52

;= THROWS ==
;----------------throw punches----------------
[Statedef 800]
type = S
movetype = A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
poweradd=36*!var(20)
facep2=1

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

[State 900, 1]
type = HitDef
triggerall = Anim = 800
triggerall = P2MoveType != H
;triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 2
attr = S, NT
hitflag = M-
priority = 3, Miss
sparkno = -1
;p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
;p1stateno = 801
;p2stateno = 809
guard.dist = 0
numhits = 0
hitsound = S2,800
p1stateno=ifelse(command="holdback",855,801)

[State 900, 1]
type = HitDef
triggerall = Anim = 800
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
;triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 2
attr = S, NT
hitflag = MF
priority = 3, Miss
sparkno = -1
;p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
;p1stateno = 801
;p2stateno = 809
guard.dist = 0
numhits = 0
hitsound = S2,800
p1stateno=ifelse(command="holdback",855,801)

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S0,0
volumescale = 0
channel = 5

[State 800, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S4,3
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;----------------throw kicks----------------
[Statedef 820]
type = S
movetype = A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 810
poweradd=36*!var(20)
facep2=1

[State 900, 1]
type = HitDef
triggerall = Anim = 810
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 2
attr = S, NT
hitflag = M-
priority = 3, Miss
sparkno = -1
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
p1stateno = 811
p2stateno = 819
guard.dist = 0
numhits = 0
hitsound = S2,800

[State 900, 1]
type = HitDef
triggerall = Anim = 810
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 2
attr = S, NT
hitflag = MF
priority = 3, Miss
sparkno = -1
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
p1stateno = 811
p2stateno = 819
guard.dist = 0
numhits = 0
hitsound = S2,800

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S0,0
volumescale = 0
channel = 5

[State 800, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S4,3
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;throw punch
[Statedef 801]
type = S
movetype = A
physics = N
velset = 0,0

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 801, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S4, 4
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 810, Hitsound]
type=PlaySnd
trigger1=AnimElem = 4
value=s2,5
channel=2

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 805

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 4
value = 806

[State 820, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 801
persistent = 0

[State 3001, Width]
type = Width
trigger1 = animelemtime(4) < 0
edge = 45,0

[State 3001, Width]
type = Width
trigger1 = animelemtime(4) = 0
edge = 75,0

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = 42,0
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = 42,-16
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = 58, -53
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 4
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S1,2
volumescale = 0
channel = -1

[State 801, Sparks]
type=helper
trigger1 = AnimElem = 4
;helpertype=normal
stateno=8013
ID=8013
name="Spark"
postype=p1
pos= 40,-100
facing= -1
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1
size.xscale =1.1
size.yscale =1.1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
ampl = -4

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 4
value = -132

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = AnimElem = 4
value = 24

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;p2
[Statedef 805]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1
;facep2=1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 805
;---------------------------------------------------------------------------
;p2
[Statedef 806]
type = A
movetype = H
physics = N
sprpriority = -1
velset = -5,-6.5

[State 902, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 5160

[State 903, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 903, Vel]
type = veladd
trigger1 = 1
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;---------------------------------------------------------------------------
;p2
[Statedef 809]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
;---------------------------------------------------------------------------
;throw kicks
[Statedef 811]
type = S
movetype = A
physics = N
velset = 0,0

[State 820, Lost Target]
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

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s1,9
volumescale = 0
channel = -1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 815

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 4
value = 816

[State 820, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 811
persistent = 0

[State 3001, Width]
type = Width
trigger1 = animelemtime(4) < 0
edge = 45,0

[State 3001, Width]
type = Width
trigger1 = animelemtime(4) = 0
edge = 75,0

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = -35,-69
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = 10,-87
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = 37, -91
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = 80, -48
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 4
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S2,5
volumescale = 1
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S0,2
volumescale = 1
channel = -1

[State 804, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S4,2
volumescale = 255
ignorehitpause = 1
persistent = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 4
value = -141

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = AnimElem = 4
value = 24

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;p2
[Statedef 815]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 815
;---------------------------------------------------------------------------
;p2
[Statedef 816]
type = A
movetype = H
physics = N
sprpriority = -1
velset = -3,17

[State 902, 1]
type = Turn
trigger1 = Time = 0

[State 902, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 5160

[State 903, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 903, Vel]
type = veladd
trigger1 = 1
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20
freq = 60
ampl = -6

[State 903, 2]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;---------------------------------------------------------------------------
;p2
[Statedef 819]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
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

[State 890, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5940,0
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


;---PLAYER TURNS---
[Statedef 855]
type=S
movetype=A
physics=S
anim=855
ctrl=0
sprpriority=3

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=866

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
value=801;ifelse(var(10),820,801)



;---TARGET---
[Statedef 866]
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
value=866

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