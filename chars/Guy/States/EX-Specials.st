; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;===< EX SPECIAL STATES >==
;====

;=< HOUZANTOU >==
[Statedef 1010]
type = S
movetype = A
physics = S
anim = 1010
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = -1
juggle = ifelse((p2movetype = H && p2statetype = A), 7, 0)
facep2 = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 6

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1010, width]
type = width
trigger1 = animelemtime(9) >= 0 && animelemtime(11) < 0
player = 40, 0
[State 1010, spr]
type = sprpriority
trigger1 = animelemtime(8) >= 0
value = 1

[State 1010, Vel]
type = velset
trigger1 = animelem = 4 || animelem = 8
x = 12

[State 1010, snd]
type = playsnd
trigger1 = animelem = 9
value = 3, 3
channel = 0
[State 1010, snd]
type = playsnd
trigger1 = animelem = 9
value = 1, 3
channel = 1

[State 1010, snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 0
[State 1010, dust]
type = explod
trigger1 = animelem = 9
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = 4, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1010, hit]
type = hitdef
trigger1 = animelem = 9
ID = 1010
attr = S, SA
damage = 84, 11
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -58
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -10, -5
air.type = High
air.velocity = -10, -5
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1010
forcestand = 1

[State 1010, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(9) >= 0 && animelemtime(10) <= 0
trigger1 = hitpausetime <= 10
value = 1010
elem = 10
ignorehitpause = 1



[State Idle]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< HAYAGAKE >=
;--- < RUNNING > ---
[Statedef 1130]
type = S
physics = S
movetype = A
anim = 1130
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 6

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1130, Vel]
type = velset
trigger1 = anim = 1130
x = 13.87

[State 1130, Snd]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0

[State 1130, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, 100

[State 1130, Dust]
type = explod
trigger1 = animelem = 2 || animelem = 5
anim = 7101
ID = 7101
sprpriority = 3
postype = p1
pos = -55, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1130, teleport]
type = changestate
trigger1 = !AIlevel && time >= 2 && p2dist x >= 0
trigger1 = command = "FF"
;trigger1 = (command = "qcfx" || command = "qcfy" || command = "qcfz")
value = 1150

[State 1130, teleport]
type = changestate
trigger1 = AIlevel && time >= 2 && p2dist x >= 0
trigger1 = p2bodydist x <= 120 && p2movetype = A && random < 500
value = 1150

[State 1130, kick]
type = changestate
trigger1 = !AIlevel && time >= 2 && p2dist x >= 0
trigger1 = command = "a" || command = "b" || command = "c"
value = ifelse(command = "c", 1140, ifelse(command = "b", 1145, 1135))

[State 1130, kick]
type = changestate
trigger1 = AIlevel && time >= 2 && p2dist x >= 0
trigger1 = p2bodydist x < 80 && random < 500
value = ifelse((random < 250 || p2statetype = L), 1135, ifelse((random < 666 || p2statetype = A), 1145, 1135))
;ifelse(p2statetype = C, 1140, ifelse(p2statetype = S && ((p2stateno = [120, 155]) || random < 500), 1135, 1145))

[State 1130, Stop]
type = changestate
trigger1 = time >= 32
trigger2 = time >= 2
trigger2 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger3 = time >= 8 && p2bodydist x <= 0
trigger4 = AIlevel
trigger4 = (p2bodydist x >= 160 && inguarddist) || (p2bodydist x >= 80 && time = 16 && random < 333)
value = 1102


;--- < STOP > ---
[Statedef 1102]
type = S
physics = S
movetype = I
anim = 1102
ctrl = 0
sprpriority = 1

[State 1102, Snd]
type = playsnd
trigger1 = !time
value = 5, 0

[State 1102, Dust]
type = explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 70, 0
vel = 1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< KAGE SUKUI >==
[Statedef 1135]
type = S
movetype = A
physics = N
anim = 1135
ctrl = 0
sprpriority = 1
juggle = 0
poweradd = 0

[State 1135, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1135, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0
[State 1135, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1135, Hit]
type = hitdef
trigger1 = animelem = 6
attr = C, SA
damage = 76, 7
animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -8
hitsound = s2, 6
guardsound = s2, 0
ground.type = Trip
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -6, -4
air.type = Trip
air.velocity = -6, -4
down.hittime = 20
down.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 5
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1135, Vel]
type = velset
trigger1 = animelem = 6
x = 6
[State 1135, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = C
[State 1135, Type]
type = statetypeset
trigger1 = animelem = 7
physics = C

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 1135, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< KUBIKARI >==
[Statedef 1140]
type = S
movetype = A
physics = S
anim = 1140
ctrl = 0
sprpriority = 1
juggle = 8
poweradd = 0

[State 1140, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1140, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 7
channel = 0
[State 1140, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1140, trail]
type = explod
trigger1 = animelem = 6
anim = 1116
sprpriority = 2
postype = p1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 5
attr = A, SA
damage = 69, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -50
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -12, 0
air.type = Low
air.velocity = -4, -2
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 8
envshake.ampl = 3
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 6
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -46
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -12, 0
air.type = Low
air.velocity = -6, -4
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1140, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 1140, Vel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.66
[State 1140, Vel]
type = velset
trigger1 = animelem = 3
x = 6
y = -7

[State 1140, End]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = pos y > -vel y
value = 52


;=< SEICHUUKARI >==
[Statedef 1145]
type = S
movetype = A
physics = S
anim = 1145
ctrl = 0
sprpriority = 1
juggle = ifelse((p2movetype = H && p2statetype = A), 8, 0)
poweradd = 0

[State 1145, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1145, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0
[State 1145, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1145, trail]
type = explod
trigger1 = animelem = 5
anim = 1121
sprpriority = 2
postype = p1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 1145, Hit]
type = hitdef
trigger1 = animelem = 5
ID = 1145
attr = A, SA
damage = 66, 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -77
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -3, -12
air.type = Low
air.velocity = -3, -12
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
ground.cornerpush.veloff = 0
guard.velocity = -12.65
givepower = 36, 36
envshake.time = 14
envshake.ampl = 5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.6
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1145, Vel]
type = velset
trigger1 = animelem = 3
x = 6
y = -4

[State STS]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
physics = N
[State Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.45

[State Land]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = pos y > -vel y
value = 52
[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I


;====< WARP >==
[Statedef 1150]
type = S
physics = S
movetype = I
anim = 1150
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 1150, Vel]
type = velset
trigger1 = animelemtime(10) < 0
x = 1.2 * const(velocity.run.fwd.x)
[State 1150, Push]
type = playerpush
trigger1 = animelemtime(13) < 0
value = 0

[State 1150, HB]
type = nothitby
trigger1 = animelemtime(13) < 0
value = SCA, AA, AP, AT
time = 1

[State 1150, Trans]
type = trans
trigger1 = animelemtime(13) < 0
trans = addalpha
alpha = 256, 128
[State 1150, Pos]
type = posadd
trigger1 = animelem = 7
x = 60

[State 1150, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0
[State 1150, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
[State 1150, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 0
[State 1150, Dust]
type = explod
trigger1 = animelem = 10
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 70, 0
vel = 1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1150, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;==< BUSHIN SENPUU KYAKU >=
[Statedef 1210]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = -500
juggle = 7
facep2 = 1
sprpriority = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 6

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1210, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1210

[State 1210, NHB]
type = nothitby
trigger1 = anim = 1200
time = 1
value = SCA
ignorehitpause = 1

[State 1210, snd]
type = playsnd
trigger1 = anim = 1210 && animelem = 1
value = 3, 7
channel = 0

[State 1210, snd]
type = playsnd
trigger1 = anim = 1210 && animelem = 1
value = 0, 40
persistent = 0
[State 1210, dust]
type = helper
trigger1 = anim = 1210 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1210, statetype]
type = statetypeset
trigger1 = anim = 1210
statetype = A
physics = N

[State 1200, Vel]
type = veladd
trigger1 = anim = 1210
x = -.33
y = 0.33
[State 1200, Vel]
type = velset
trigger1 = anim = 1210 && animelem = 1
x = 10
y = -8
[State 1200, Vel]
type = velset
trigger1 = anim = 1210 && animelemtime(19) >= 0
x = 0


[State 1210, spin]
type = playsnd
trigger1 = anim = 1210 && (animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18)
value = 1, 5
channel = 1

[State 1210, hit]
type = hitdef
trigger1 = anim = 1210 && (animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18)
attr = A, SA
damage = 28, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -6.5, -8
air.type = Low
air.velocity = -6.5, -7
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 1210, hitb]
type = hitdef
trigger1 = anim = 1210 && (animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16)
attr = A, SA
damage = 28, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = 6.5, -7
air.type = Low
air.velocity = 6.5, -7
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), 4, 8), -1.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1210 && animelemtime(19) >= 0
movetype = I
[State Land]
type = changestate
trigger1 = anim = 1210 && animelemtime(19) >= 0
trigger1 = pos y > -vel y
value = 52


;==< BUSHIN IZUNA OTOSHI ATTEMPT >=
[Statedef 1330]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = -500

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 6

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1330, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 40
persistent = 0

[State 1330, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1330, Vel]
type = velset
trigger1 = anim = 40 && !animtime
x = 3
y = -15

[State 1330, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1330

[State 1330, Type]
type = statetypeset
trigger1 = anim = 1330
statetype = A
physics = N

[State Accel]
type = veladd
trigger1 = anim = 1330
y = 0.61

;[State 1330, width]
;type = width
;trigger1 = anim = 1330
;player = 25
;edge = ifelse(frontedgebodydist > 45, 45, 0)

[State 1330, elbow]
type = changestate
triggerall = anim = 1330 && animelemtime(3) >= 0 && vel y >= -2 && pos y <= -24
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z" || command = "rlsx" || command = "rlsy" || command = "rlsz")
trigger2 = AIlevel && p2bodydist x <= 20 && p2dist y >= -50
value = 1305

[State Land]
type = changestate
trigger1 = anim = 1330 && animelemtime(3) >= 0
trigger1 = pos y > -vel y
value = 52