; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES >===
;====

;=< HOUZANTOU >==
[Statedef 1000]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = -1
juggle = 8
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcbx", 1, ifelse(command = "qcby", 2, 3))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 333, 3, ifelse(random < 500, 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel && p2movetype = H
var(10) = 1

[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1002, ifelse(var(10) = 2, 1001, 1000))

[State 1000, width]
type = width
trigger1 = animelemtime(9) >= 0 && animelemtime(11) < 0
player = 40, 0
[State 1000, spr]
type = sprpriority
trigger1 = animelemtime(8) >= 0
value = 1

[State 1000, Vel]
type = velset
trigger1 = animelem = 4 || animelem = 8
x = ifelse(anim = 1002, 12, ifelse(anim = 1001, 10, 8))

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 9
value = 3, 3
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelem = 9
value = 1, 3
channel = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 0
[State 1000, Dust]
type = explod
trigger1 = animelem = 9
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = 4, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1000, Hit]
type = hitdef
trigger1 = anim = 1000 && animelem = 10
attr = S, SA
damage = 70, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -77
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -7
air.type = Low
air.velocity = -5, -3
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120

[State 1000, Hit]
type = hitdef
trigger1 = (anim = 1001 || anim = 1002) && animelem = 9
attr = S, SA
damage = ifelse(anim = 1002, 104, 83), 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -58
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = ifelse(var(10) = 3, -6, -4.5), -4.5
air.type = High
air.velocity = ifelse(var(10) = 3, -6, -4.5), -4.5
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1000, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = anim = 1001 || anim = 1002
trigger1 = animelemtime(9) >= 0 && animelemtime(10) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 5, 12)
value = anim
elem = 10
ignorehitpause = 1

[State 1000, End]
type = changestate
triggerall = anim = 1000 && animelemtime(10) > 0 && animelemtime(12) < 0
trigger1 = !AIlevel && command = "qcbx"
trigger2 = AIlevel && movecontact = 1 && random < 500
value = 1005

[State Idle]
type = statetypeset
trigger1 = anim = 1000 && animelemtime(12) >= 0
trigger2 = anim != 1000 && animelemtime(11) >= 0
movetype = I

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- < 2nd > ---
[Statedef 1005]
type = S
movetype = A
physics = S
juggle = 8
anim = 1005
velset = vel x, 0
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1005, Strength]
type = varset
trigger1 = var(10) != 2
var(10) = 2
[State 1005, width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
player = 15, 0
[State 1005, Vel]
type = velset
trigger1 = animelem = 2
x = 9

[State 1005, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 2
channel = 0
[State 1005, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1005, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, SA
damage = 28, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -20 + 0 * (var(35) := 89), var(36):= -53
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -10
air.type = Low
air.velocity = -6, -4
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 6
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1005, End]
type = changestate
triggerall = animelemtime(5) > 0 && animelemtime(7) < 0
trigger1 = !AIlevel && command = "qcbx"
trigger2 = AIlevel && movecontact = 1
value = 1006

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 1005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- < 3rd > ---
[Statedef 1006]
type = S
movetype = A
physics = S
juggle = 8
anim = 1006
velset = vel x, 0
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1006, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3
[State 1006, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
player = 30, 0
[State 1006, Vel]
type = velset
trigger1 = animelem = 2
x = 9

[State 1006, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 7
channel = 0
[State 1005, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 1006, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
damage = 28, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -20 + 0 * (var(35) := 89), var(36):= -76
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -4, -8
air.type = Low
air.velocity = -4, -8
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 1006, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< HAYAGAKE >=
;--- < RUNNING > ---
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
x = 8.87

[State 1100, Snd]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0
[State 1100, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 1100, Dust]
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

[State 1100, teleport]
type = changestate
trigger1 = !AIlevel && time >= 2 && p2dist x >= 0
trigger1 = command = "FF"
;trigger1 = (command = "qcfx" || command = "qcfy" || command = "qcfz")
value = 1150
[State 1100, teleport]
type = changestate
trigger1 = AIlevel && time >= 2 && p2dist x >= 0
trigger1 = p2bodydist x <= 120 && p2movetype = A && random < 500
value = 1150

[State 1100, kick]
type = changestate
trigger1 = !AIlevel && time >= 2 && p2dist x >= 0
trigger1 = command = "a" || command = "b" || command = "c"
value = ifelse(command = "c", 1115, ifelse(command = "b", 1120, 1110))
[State 1100, kick]
type = changestate
trigger1 = AIlevel && time >= 2 && p2dist x >= 0
trigger1 = p2bodydist x < 80 && random < 500
value = ifelse((random < 250 || p2statetype = L), 1110, ifelse((random < 666 || p2statetype = A), 1120, 1110))
;ifelse(p2statetype = C, 1115, ifelse(p2statetype = S && ((p2stateno = [120, 155]) || random < 500), 1110, 1120))

[State 1100, Stop]
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
[Statedef 1110]
type = S
movetype = A
physics = N
anim = 1110
ctrl = 0
sprpriority = 1
juggle = 0
poweradd = 0

[State 1110, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1110, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0
[State 1110, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1110, Hit]
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

[State 1110, Vel]
type = velset
trigger1 = animelem = 6
x = 6
[State 1110, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = C
[State 1110, Type]
type = statetypeset
trigger1 = animelem = 7
physics = C

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 1110, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< KUBIKARI >==
[Statedef 1115]
type = S
movetype = A
physics = S
anim = 1115
ctrl = 0
sprpriority = 1
juggle = 8
poweradd = 0

[State 1115, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1115, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 7
channel = 0
[State 1115, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1115, trail]
type = explod
trigger1 = animelem = 6
anim = 1116
sprpriority = 2
postype = p1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 1115, Hit]
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

[State 1115, Hit]
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

[State 1115, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 1115, Vel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.66
[State 1115, Vel]
type = velset
trigger1 = animelem = 3
x = 6
y = -7

[State 1115, End]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = pos y > -vel y
value = 52


;=< SEICHUUKARI >==
[Statedef 1120]
type = S
movetype = A
physics = S
anim = 1120
ctrl = 0
sprpriority = 1
juggle = ifelse((p2movetype = H && p2statetype = A), 8, 0)
poweradd = 0

[State 1120, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1120, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0
[State 1120, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1120, trail]
type = explod
trigger1 = animelem = 5
anim = 1121
sprpriority = 2
postype = p1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 5
ID = 1120
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

[State 1120, Vel]
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
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, NHB]
type = nothitby
trigger1 = anim = 1200
time = 1
value = SCA
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && animelem = 1
value = 3, 7
channel = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && animelem = 1
value = 0, 40
persistent = 0
[State 1200, Dust]
type = helper
trigger1 = anim = 1201 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State STS]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = veladd
trigger1 = anim = 1201
x = ifelse(var(10) = 3, -.33, ifelse(var(10) = 2, -.33, -.22))
y = 0.44
[State 1200, Vel]
type = velset
trigger1 = anim = 1201 && animelem = 1
x = ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 7, 6))
y = ifelse(var(10) = 3, -8, ifelse(var(10) = 2, -7, -6))
[State 1200, Vel]
type = velset
trigger1 = anim = 1201 && animelemtime(15) >= 0
x = 0

[State 1200, spin]
type = playsnd
trigger1 = anim = 1201 && (animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14)
value = 1, 5
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1201 && var(10) < 3 && animelemtime(11) >= 0 && animelemtime(15) < 0
value = 1201
elem = 15
persistent = 0

[State 1200, Hit]
type = hitdef
trigger1 = anim = 1201 && (animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14)
attr = A, SA
damage = ifelse(var(10) = 3, 28, 35), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6.5, -8
air.type = Low
air.velocity = -6.5, -7
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, hitb]
type = hitdef
trigger1 = anim = 1201 && (animelem = 4 || animelem = 8 || animelem = 12)
attr = A, SA
damage = ifelse(var(10) = 3, 28, 35), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 6.5, -7
air.type = Low
air.velocity = 6.5, -7
ground.cornerpush.veloff = 0
guard.velocity = -12.65
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), 4, 8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1201 && animelemtime(15) >= 0
movetype = I
[State Land]
type = changestate
trigger1 = anim = 1201 && vel y > 0
trigger1 = pos y > -vel y
value = 52


;==< BUSHIN IZUNA OTOSHI ATTEMPT >=
[Statedef 1300]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = 72 * !var(20)

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2dist x > 240, 3, ifelse(p2dist x > 120, 2, 1))

[State 1300, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 40
persistent = 0
[State 1300, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1300, Vel]
type = velset
trigger1 = anim = 40 && !animtime
x = ifelse(var(10) = 3, 9.31, ifelse(var(10) = 2, 6, 3))
y = ifelse(var(10) = 3, -9.3, ifelse(var(10) = 2, -9.9, -11.2))
[State 1300, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1300

[State 1300, Type]
type = statetypeset
trigger1 = anim = 1300
statetype = A
physics = N
[State Accel]
type = veladd
trigger1 = anim = 1300
y = 0.61

;[State 1300, width]
;type = width
;trigger1 = anim = 1300
;player = 25
;edge = ifelse(frontedgebodydist > 45, 45, 0)

[State 1300, elbow]
type = changestate
triggerall = anim = 1300 && animelemtime(3) >= 0 && vel y >= -2 && pos y <= -24
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z" || command = "rlsx" || command = "rlsy" || command = "rlsz")
trigger2 = AIlevel && p2bodydist x <= 20 && p2dist y >= -50
value = 1305
[State Land]
type = changestate
trigger1 = anim = 1300 && animelemtime(3) >= 0
trigger1 = pos y > -vel y
value = 52


;=< IZUNA NO HIJI OTOSHI >==
[Statedef 1305]
type = A
movetype = A
physics = N
juggle = 8
anim = 1305
velset = 0, 0
sprpriority = 1
poweradd = 0
ctrl = 0

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
[State 1305, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 1305, Vel]
type = veladd
trigger1 = 1
y = 0.61

[State 1305, grab]
type = hitdef
trigger1 = !time
trigger1 = !var(38)
attr = A, ST
hitflag = MAF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1320
fall = 1
fall.recover = 0

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 3
attr = A, SA
damage = 90, 7
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -56
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -9.22
air.type = Low
air.velocity = -4, -4
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 14
envshake.ampl = 5
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


;==< IZUNA OTOSHI >=
;--- PLAYER ---
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
velset = 0, 0
juggle = 8
sprpriority = 1
[State 1320, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State Throw]
type = targetstate
trigger1 = !time
value = 1325

[State 1320, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800
[State 1320, Snd]
type = playsnd
trigger1 = !time
value = 3, 8
channel = 0

[State 1320, Vel]
type = velset
trigger1 = !time;!vel x && animelemtime(4) < 0
x = ((target, pos x -pos x) * facing + target, const(size.mid.pos.x) + 41) / 5.0
y = (target, pos y + target, const(size.mid.pos.y) -pos y + 12) / 5.0
[State 1320, Bind 1]
type = bindtotarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -41 + (target, const(size.mid.pos.x)), 12 + (target, const(size.mid.pos.y))

[State 1320, Vel]
type = velset
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
x = 0
y = 0
[State 1320, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 1
[State 1320, Vel]
type = velset
trigger1 = animelem = 5
x = 4
y = -10

[State 1320, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = -35, -13
[State 1320, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = -49, -31
[State 1320, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = -54, -66
[State 1320, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = -44, -94
[State 1320, Bind 9]
type = targetbind
trigger1 = animelemtime(9) >= 0
pos = -9, -113

[State 1320, End]
type = changestate
trigger1 = animelemtime(5) > 0 && vel y > 0 && pos y >= -5
value = 1321


;--- HIT FLOOR ---
[Statedef 1321]
type = C
physics = C
movetype = A
anim = 1321
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 120

[State 1321, width]
type = width
trigger1 = 1
edge = 80

[State 1321, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn
[State 1321, throw]
type = targetstate
trigger1 = !time
value = 1326

[State 1321, Pos]
type = posadd
trigger1 = !time
x = -34
[State 1321, Pos]
type = posset
trigger1 = 1
y = 0

[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1321, Dust]
type = explod
trigger1 = !time
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
pos = 16, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
[State 1321, Dust]
type = explod
trigger1 = !time
anim = 7120
ID = 7120
sprpriority = -2
postype = p1
vfacing = -1
pos = 88, 0
scale = 0.5, 0.5
ownpal = 1
[State 1321, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 120
ampl = 6

[State 1321, Bind 1]
type = targetbind
trigger1 = animelem = 1
pos = 88, -4
[State 1321, hurt]
type = targetlifeadd
trigger1 = animelem = 1
value = -ceil(132 * fvar(12))
[State 1321, hurt]
type = targetpoweradd
trigger1 = animelem = 1
value = 36
[State 1321, hurt]
type = poweradd
trigger1 = animelem = 1 && !var(20)
value = 72

[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 3, 6
channel = 0

[State 1321, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1325]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0
[State 1325, Anim]
type = changeanim2
trigger1 = !time
value = 1325
[State 1325, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0


;--- TARGET HIT FLOOR ---
[Statedef 1326]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 1326, Anim]
type = changeanim2
trigger1 = !time
value = 1326

[State 1326, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -8

[State 1326, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.6

[State Safe Fall]
type = selfstate
trigger1 = animelemtime(2) > 0
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1326, End]
type = selfstate
trigger1 = animelemtime(2) > 0 && vel y > 0 && pos y >= -5
value = 5100


;=< HASSOU KYAKU >==
[Statedef 1400]
type = A
movetype = A
physics = N
anim = 1400
ctrl = 0
velset = 0, 0
sprpriority = 1
juggle = 8

[State 1400, Strength]
type = varset
trigger1 = var(10) != 2
var(10) = 2

[State 1400, Turn]
type = turn
trigger1 = !time && frontedgedist < backedgedist

[State 1400, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1400, Dust]
type = explod
trigger1 = !time
anim = 7101
ID = 7101
sprpriority = 3
postype = p1
pos = -22, -33
ownpal = 1
scale = 0.66, 0.66
pausemovetime = -1
supermovetime = -1
[State 1400, Pos]
type = posset
trigger1 = animelemtime(2) < 0
x = -134 * facing
[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
x = 9
y = 9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 3
attr = A, SA
damage = 92, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -18
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -3, -5
air.type = Low
air.velocity = -3, -5
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

[State Land]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 52
