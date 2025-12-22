; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES >===
;====

;==< PSYCHO CRUSHER >=
[Statedef 1000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1000
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "bfz" || command = "cbfz"), 3, ifelse((command = "bfy" || command = "cbfy"), 2, 1))

[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
trigger1 = p2bodydist x >= 160
var(10) = ifelse(random < 500, 3, 2)
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
trigger1 = p2bodydist x >= 200
var(10) = 3

[State 1000, width]
type = width
trigger1 = anim = 1000 && animelemtime(4) >= 0
value = 20
ignorehitpause = 1
[State 1000, Push]
type = playerpush
trigger1 = anim = 1000 && animelemtime(6) >= 0
value = 0
ignorehitpause = 1

[State 1000, nothitby]
type = nothitby
trigger1 = anim = 1000 && animelemtime(6) >= 0
value = , NP
time = 1
ignorehitpause = 1

[State 1000, shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = anim = 1000 && animelemtime(6) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 1000, Vel]
type = velset
trigger1 = anim = 1000 && animelemtime(4) >= 0
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 7.5, 5))
y = 0
[State 1000, statetype]
type = statetypeset
trigger1 = anim = 1000 && animelemtime(4) >= 0
statetype = A
physics = N

[State 1000, FX]
type = helper
trigger1 = !numhelper(1005)
trigger1 = anim = 1000 && animelemtime(6) >= 0
helpertype = normal
stateno = 1005
ID = 1005
name = "Psycho Crusher"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 4
value = 0, 40
[State 1000, Dust]
type = explod
trigger1 = anim = 1000 && animelem = 4
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 5
value = 4, 5
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 5
value = 5, 4

[State 1000, hitvar]
type = varset
trigger1 = anim != 1000
trigger2 = anim = 1000 && animelemtime(6) < 0
var(14) = 0
[State 1000, hitvar]
type = varadd
trigger1 = anim = 1000 && (movehit = 1 || moveguarded = 1 || movereversed = 1)
var(14) = ifelse(moveguarded, 1, 3)
[State 1000, hitvar]
type = varset
trigger1 = numtarget(1000)
trigger1 = (target(1000), stateno = [5000, 5020]) && !(target(1000), time)
var(14) = 3
ignorehitpause = 1

[State 1000, Hit]
type = hitdef
trigger1 = anim = 1000 && animelemtime(6) >= 0
trigger1 = !(movecontact % 4) && var(14) < 3
attr = A, SA
damage = 80 + (10 * var(10)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -59
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -6, ifelse(var(10) = 2, -5, -4)), ifelse(var(10) = 3, -6, ifelse(var(10) = 2, -5, -4))
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.type = Low
air.velocity = ifelse(var(10) = 3, -6, ifelse(var(10) = 2, -5, -4)), ifelse(var(10) = 3, -6, ifelse(var(10) = 2, -5, -4))
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 36 + (4 * var(10))
fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1000
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1000, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 1000, Anim]
type = changeanim
triggerall = anim = 1000 && time >= 20
trigger1 = frontedgedist <= (const(size.air.front) + 20)
trigger2 = var(10) = 1 && time >= 37
trigger3 = var(10) = 2 && time >= 61
trigger4 = var(10) = 3 && time >= 85
value = 1001
[State 1000, Vel]
type = velmul
trigger1 = anim = 1001
x = 0.85

[State 1000, End]
type = changeanim
trigger1 = anim = 1001 && !animtime
value = 1002
[State 1000, Vel]
type = velset
trigger1 = anim = 1002
x = 0
y = 0
[State 1000, Pos]
type = posset
trigger1 = anim = 1002
y = 0
[State 1000, statetype]
type = statetypeset
trigger1 = anim = 1002
statetype = S
physics = S
[State 1000, Snd]
type = playsnd
trigger1 = anim = 1002
value = 0, 52
persistent = 0
[State 1000, Dust]
type = explod
trigger1 = anim = 1002
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim != 1000
movetype = I

[State 1000, End]
type = changestate
trigger1 = anim = 1002 && !animtime
value = 0
ctrl = 1


;==< DOUBLE KNEE PRESS >=
[Statedef 1100]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1100
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "bfc" || command = "cbfc"), 3, ifelse((command = "bfb" || command = "cbfb"), 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1102, ifelse(var(10) = 2, 1101, 1100))

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 2
value = 0, 40
[State 1100, Dust]
type = explod
trigger1 = (anim = [1100, 1102]) && animelem = 2
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1100, Vel]
type = velset
trigger1 = (anim = [1100, 1102]) && animelem = 2
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 8, 6))
y = -ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2.5, 2))
[State 1100, statetype]
type = statetypeset
trigger1 = (anim = [1100, 1102]) && animelemtime(2) >= 0
statetype = A
physics = N
[State 1100, Accel]
type = veladd
trigger1 = (anim = [1100, 1102]) && animelemtime(2) >= 0
y = 0.25

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 3
value = 3, 6
channel = 0
[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 4
value = 1, 6
channel = 1

[State 1100, hithigh]
type = hitdef
trigger1 = (anim = [1100, 1102]) && animelem = 4
attr = A, SA
damage = 45 + (10 * var(10)), 7
animtype = Hard
fall.animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -85
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1100, hitlow]
type = hitdef
trigger1 = (anim = [1100, 1102]) && animelem = 5
attr = A, SA
damage = 50, 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -26
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -6
air.type = Low
air.velocity = -3, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1100, End]
type = changeanim
trigger1 = vel y > 0 && pos y >= -ceil(vel y)
value = 1103
[State 1100, Vel]
type = velset
trigger1 = anim = 1103
x = 0
y = 0
[State 1100, Pos]
type = posset
trigger1 = anim = 1103
y = 0
[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1103
statetype = S
physics = S
movetype = I
[State 1100, Snd]
type = playsnd
trigger1 = anim = 1103
value = 0, 52
persistent = 0
[State 1100, Dust]
type = explod
trigger1 = anim = 1103
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1
[State 1100, End]
type = changestate
trigger1 = anim = 1103 && !animtime
value = 0
ctrl = 1


;==< HEAD PRESS >=
[Statedef 1200]
type = S
physics = N
movetype = A
ctrl = 0
anim = 40
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = !time
var(10) = 3

[State 1200, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 40
[State 1200, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 1200, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1200

[State 1200, Vel]
type = velset
trigger1 = anim = 1200
x = p2dist x / ((14 + ((14 ** 2) -(4 * 0.375 * (enemynear(0), const(size.height)))) ** 0.5) / 0.75)
y = -14
persistent = 0
[State 1200, Vel]
type = turn
trigger1 = anim = 1200 && vel x < 0
persistent = 0
[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && vel x > 10
x = 10
[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && vel x < 0
x = 0

[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1200
statetype = A
physics = N
[State 1200, Accel]
type = veladd
trigger1 = anim = 1200
y = 0.75

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 2
value = 3, 0
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && animelem = 4
value = 3, 5
channel = 0

[State 1200, statetype]
type = statetypeset
trigger1 = vel y > 0 && !movecontact && numenemy
trigger1 = (enemynear(0), pos y -pos y) < 0.75 * (enemynear(0), const(size.height))
trigger1 = (enemynear, statetype != L)
movetype = I
[State 1200, statetype]
type = statetypeset
triggerall = vel y >= 0 && numenemy
trigger1 = (enemynear(0), pos y -pos y) >= 0.75 * (enemynear(0), const(size.height))
trigger2 = (enemynear, statetype = L)
movetype = A

[State 1200, hitstomp]
type = hitdef
trigger1 = vel y >= 0 && !movecontact && !movereversed
trigger1 = numenemy
trigger1 = (enemynear(0), pos y -pos y) >= 0.75 * (enemynear(0), const(size.height))
attr = A, SA
damage = 100, 13
animtype = Hard
air.animtype = Back
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 22
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, 0
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -7, 0
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1200
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1200, Pos]
type = posset
trigger1 = anim = 1200 && movecontact && numtarget(1200)
x = target(1200), pos x
ignorehitpause = 1
persistent = 0
[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && (movecontact || movereversed)
value = 1201
ignorehitpause = 1

[State 1200, Pos]
type = posfreeze
trigger1 = anim = 1200 && (movecontact || movereversed)
trigger2 = anim = 1201 && numtarget(1200) && animelemtime(4) < 0
value = 1
ignorehitpause = 1
[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && (movecontact || movereversed)
trigger2 = anim = 1201 && animelemtime(5) < 0
x = 0
y = 0
ignorehitpause = 1
[State 1200, Push]
type = playerpush
trigger1 = anim = 1201 && animelemtime(5) < 0
value = 0

[State 1200, Vel]
type = velset
trigger1 = anim = 1201 && animelem = 5
x = 0
y = -8
[State 1200, Accel]
type = veladd
trigger1 = anim = 1201 && animelemtime(5) >= 0
y = 0.5

[State 1200, veldir]
type = velset
trigger1 = anim = 1201 && animelemtime(5) >= 0
x = ifelse(command = "holdfwd", 4.5, ifelse(command = "holdback", -6, vel x))
[State 1200, veldir]
type = velmul
trigger1 = anim = 1201 && animelemtime(5) >= 0 && vel x
trigger1 = command != "holdfwd" && command != "holdback"
x = 0.95

[State 1200, skulldiver]
type = changestate
triggerall = anim = 1201 && animelemtime(8) >= 0
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && (p2dist y = [ -50, 100])
value = 1205

[State 1200, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -ceil(vel y)
value = ifelse(anim = 1200, 1202, 52)


;--- MISS ---
[Statedef 1202]
type = S
physics = S
ctrl = 0
anim = 1202
sprpriority = 1
[State 1202, Vel]
type = velset
trigger1 = 1
x = 0
y = 0
[State 1202, Pos]
type = posset
trigger1 = 1
y = 0
[State 1202, Snd]
type = playsnd
trigger1 = !time
value = 5, 7
[State 1202, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1202, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1202, Shake]
type = envshake
trigger1 = !time
time = 12
freq = 60
ampl = 4
[State 1202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SOMERSAULT SKULL DIVER >=
[Statedef 1205]
type = A
movetype = A
physics = N
juggle = 7
anim = 1205
poweradd = 72 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 1205, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1205, veldir]
type = velset
trigger1 = command != "holddown" || AIlevel
x = ifelse(command = "holdfwd", 4.5, ifelse(command = "holdback", -6, vel x))
[State 1205, veldir]
type = velmul
trigger1 = command != "holdfwd" && command != "holdback"
x = 0.95

[State 1205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0
[State 1205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1205, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
channel = 1
[State 1205, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1205, Hit]
type = hitdef
trigger1 = animelem = 4
attr = A, SA
damage = 70, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -98
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7
air.type = Low
air.velocity = -5, -6
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 3
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.cornerpush.veloff = 0

[State 1205, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 1205, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 52


;==< DEVIL REVERSE >=
[Statedef 1250]
type = S
physics = N
movetype = A
ctrl = 0
anim = 40
velset = 0, 0
poweradd = 72 * !var(20)
juggle = ifelse((p2movetype = H && p2statetype = A), 9, 0)
facep2 = 1
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = !time
var(10) = 3

[State 1250, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 40
[State 1250, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 1250, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1250

[State 1250, Vel]
type = velset
trigger1 = anim = 1250
x = p2dist x / ((14 + ((14 ** 2) -(4 * 0.375 * (enemynear(0), const(size.height)))) ** 0.5) / 0.75)
y = -14
persistent = 0
[State 1250, Vel]
type = turn
trigger1 = anim = 1250 && vel x < 0
persistent = 0
[State 1250, Vel]
type = velset
trigger1 = anim = 1250 && vel x > 10
x = 10
[State 1250, Vel]
type = velset
trigger1 = anim = 1250 && vel x < 0
x = 0

[State 1250, statetype]
type = statetypeset
trigger1 = anim = 1250
statetype = A
physics = N
[State 1250, Accel]
type = veladd
trigger1 = anim = 1250
y = 0.75

[State 1250, Snd]
type = playsnd
trigger1 = anim = 1250 && animelem = 2
value = 3, 0
channel = 0
[State 1250, Snd]
type = playsnd
trigger1 = anim = 1255 && animelem = 4
value = 3, 5
channel = 0

[State 1250, Anim]
type = changeanim
triggerall = anim = 1250 && animelemtime(3) >= 0
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && (p2dist y = [ -50, 100])
value = 1255

[State 1250, Turn]
type = turn
trigger1 = anim = 1255 && animelem = 1
trigger1 = p2dist x < 20

[State 1250, Accel]
type = veladd
trigger1 = anim = 1255
y = 0.75
[State 1250, Vel]
type = velset
trigger1 = anim = 1255 && animelem = 1
x = -6
y = -9

[State 1250, veldir]
type = velmul
trigger1 = anim = 1255
x = 0.95
[State 1250, veldir]
type = velset
trigger1 = anim = 1255 && animelemtime(6) >= 0
x = ifelse(command = "holdfwd", 6, ifelse(command = "holdback", -6, vel x))

[State 1250, Snd]
type = playsnd
trigger1 = anim = 1255 && animelem = 8
value = 5, 2
channel = 1
[State 1250, FX]
type = helper
trigger1 = anim = 1255 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1250, Hit]
type = hitdef
trigger1 = anim = 1255 && animelem = 8
attr = A, SA
damage = 60, 7
animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -60
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -8.5
air.type = Low
air.velocity = -4, -8.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 3
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 36
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 1200, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -ceil(vel y)
value = 52


;==< PSYCHO IMPACT >=
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1300
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "hcfz" || prevstateno = 750), 3, ifelse(command = "hcfy", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((random < 500 || prevstateno = 750), 3, ifelse(random < 666, 2, 1))

[State 1300, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
physics = N
[State 1300, statetype]
type = statetypeset
trigger1 = animelemtime(2) < 0 || animelemtime(13) >= 0
physics = S

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 1300, Dust]
type = explod
trigger1 = animelem = 2
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1300, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(var(10) = 3, 15, ifelse(var(10) = 2, 12.5, 10))
[State 1300, Vel]
type = velmul
trigger1 = animelemtime(2) >= 0
x = 0.95
[State 1300, Anim]
type = changeanim
triggerall = animelemtime(2) >= 2 && animelemtime(3) < 0
trigger1 = var(10) = 1 && animelemtime(2) >= 20
trigger2 = var(10) = 2 && animelemtime(2) >= 24
trigger3 = p2bodydist x <= 40
value = 1300
elem = 3

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 8
value = 3, ifelse((animelem = 1), 1, ifelse((animelem = 3), 4, 8))
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 2
channel = 1

[State 1300, FX]
type = explod
trigger1 = animelem = 9
anim = 1305
ID = 1305
sprpriority = 2
postype = p1
bindtime = -1
removeongethit = 1
scale = 0.5, 0.5

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 0 && time <= 9
value = SCA
time = 1

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
damage = 35 + (5 * var(10)), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -66
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10, 0
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 9
attr = S, SA
damage = 65 + (5 * var(10)), 9
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -85
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -3
air.type = Low
air.velocity = -6, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 36 + (4 * var(10))
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5

[State 1300, flames]
type = helper
trigger1 = movehit && numtarget && animelemtime(9) >= 0 && animelemtime(10) < 0
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< PSYCHO BANISH >=
[Statedef 1400]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1400
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "dfz", 3, ifelse(command = "dfy", 2, 1))
[State 1400, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
[State 1400, Anim]
type = changeanim
trigger1 = !time && (var(10) = [1, 3])
value = 1399 + var(10)

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3
channel = 1
[State 1400, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1400, shield]
type = helper
triggerall = animelemtime(7) >= 0 && !numhelper(1407)
trigger1 = anim = 1400 && animelemtime(10) < 0
trigger2 = anim = 1401 && animelemtime(11) < 0
trigger3 = anim = 1402 && animelemtime(12) < 0
helpertype = normal
stateno = 1407
ID = 1407
name = "Projectile Banisher"
postype = p1
ownpal = 1

[State 1400, Hit]
type = hitdef
trigger1 = var(10) = 1 && (animelem = 7 || animelem = 8 || animelem = 9)
trigger2 = var(10) = 2 && (animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10)
trigger3 = var(10) = 3 && (animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11)
ID = 1400
attr = S, SA
damage = 33 -(3 * var(10)), 7
animtype = Hard
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 0, 4
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ceil(-100 + (animelemno(0) -7) * ifelse(var(10) = 3, 19, ifelse(var(10) = 2, 25, 37)))
hitsound = sifelse(hitcount, -1, 2), 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10, 0
ground.cornerpush.veloff = 0;-20.0 * (animelemno(0) >= var(10) + 8)
;ground.cornerpush.veloff = 0;-20.0 / (animelemno(0) -var(10) -5);-13
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 22
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5

[State 1400, hitsound]
type = playsnd
trigger1 = hitcount > 1
trigger1 = movehit = 1
value = 2, 3
channel = 2
ignorehitpause = 1

[State 1400, PTF]
type = targetlifeadd
trigger1 = movehit = 1
trigger1 = numtarget(1400) = 1
trigger1 = !(target(1400), hitshakeover)
trigger1 = target(1400), gethitvar(damage) < 7
value = -7 + (target(1400), gethitvar(damage))
ID = 1400
ignorehitpause = 1

[State 1400, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1400 && animelemtime(10) >= 0
trigger2 = anim = 1401 && animelemtime(11) >= 0
trigger3 = anim = 1402 && animelemtime(12) >= 0
movetype = I

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< PSYCHO FIELD >=
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1600, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "hcbz", 3, ifelse(command = "hcby", 2, 1))
[State 1600, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x > 180, 3, ifelse(p2bodydist x > 120, 2, 1))

[State 1600, field]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1605
ID = 1605
name = "Psycho Field"
postype = p1
pos = 47, -71
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0
[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 11

[State 1600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< VEGA WARP >=
[Statedef 1700]
type = S
physics = N
movetype = I
anim = 1700
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1700, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

[State 1700, nothitby]
type = nothitby
trigger1 = animelemtime(7) < 0
trigger1 = ((command = "holdx") + (command = "holdy") + (command = "holdz") < 2)
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 1700, fadeout]
type = trans
trigger1 = animelemtime(7) = [0, 10]
trans = addalpha
alpha = (256 -25 * (animelemtime(7))), (25 * (animelemtime(7)))
[State 1700, fadein]
type = trans
trigger1 = animelemtime(9) = [0, 10]
trans = addalpha
alpha = (25 * (animelemtime(9))), (256 -25 * (animelemtime(9)))

[State 1700, delay]
type = changeanim
triggerall = animelemtime(6) >= 0 && animelemtime(7) < 0 && !AIlevel
trigger1 = (var(10) = -3 || var(10) = 3) && ((command = "holdx") + (command = "holdy") + (command = "holdz") >= 2)
trigger2 = (var(10) = -2 || var(10) = 2) && ((command = "holda") + (command = "holdb") + (command = "holdc") >= 2)
value = 1700
elem = ifelse(time >= 60, 10, 6)

[State 1700, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 2
channel = 0
[State 1700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 9
value = 5, 6
[State 1700, FX]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1

[State 1700, Vel]
type = velset
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
x = ifelse(var(10) = 3, 32, ifelse(var(10) = -3, -32, ifelse(var(10) = 2, 16, -16)))
[State 1700, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 1700, Turn]
type = turn
trigger1 = animelem = 9 && p2dist x < 0
[State 1700, FX]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0
ownpal = 1

[State 1700, posfix]
type = posadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 13 || animelem = 14
x = ifelse((animelem = 2), -8, ifelse((animelem = 3), -12, ifelse((animelem = 13), 8, 12)))
[State 1700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- ALTERNATE ---
[Statedef 1710]
type = U
physics = U
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1710, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))
[State 1710, strengthvarcounter]
type = varset
trigger1 = !time && prevstateno = 750
var(10) = 2
[State 1710, Anim]
type = changeanim
trigger1 = time < 10 && (anim != [1710, 1711])
value = anim
elem = animelemno(0)
[State 1710, Anim]
type = changeanim
trigger1 = time >= 10 && (anim != [1710, 1711])
value = ifelse(prevstateno = 750, 1711, 1710)

[State 1710, nothitby]
type = nothitby
trigger1 = (anim != [1710, 1711]) || animelemtime(3) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
[State 1710, Push]
type = playerpush
trigger1 = (anim != [1710, 1711]) || animelemtime(3) < 0
value = 0

[State 1710, fadeout]
type = trans
trigger1 = (anim != [1710, 1711]) && (time = [0, 10])
trans = addalpha
alpha = (256 -25 * time), (25 * time)
[State 1710, fadein]
type = trans
trigger1 = (anim = [1710, 1711]) && (animelemtime(2) = [0, 10])
trans = addalpha
alpha = (25 * (animelemtime(2))), (256 -25 * (animelemtime(2)))

[State 1710, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0
[State 1710, Snd]
type = playsnd
trigger1 = !time || ((anim = [1710, 1711]) && animelem = 2)
value = 5, 6
[State 1710, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1

[State 1710, Vel]
type = velset
trigger1 = anim = 1710 && animelemtime(2) < 0 && (var(10) = -3 || var(10) = 3)
x = (p2dist x + ifelse(var(10) = 3, 160, -160)) / 10.0
persistent = 0
[State 1710, Vel]
type = velset
trigger1 = anim = 1710 && animelemtime(2) < 0 && (var(10) = -2 || var(10) = 2)
x = (p2dist x + ifelse(var(10) = 2, 80, -80)) / 10.0
persistent = 0
[State 1710, Vel]
type = velset
trigger1 = anim = 1711 && animelemtime(2) < 0
x = (p2dist x + 80) / 2.0
persistent = 0

[State 1710, Vel]
type = velset
trigger1 = (anim != [1710, 1711])
trigger2 = (anim = [1710, 1711]) && animelemtime(2) >= 0
x = 0
y = 0

[State 1710, statetype]
type = statetypeset
trigger1 = (anim = [1710, 1711]) && animelemtime(2) >= 0
statetype = S
physics = S
[State 1710, Pos]
type = posset
trigger1 = (anim = [1710, 1711]) && animelemtime(2) >= 0 && pos y
y = 0

[State 1710, Turn]
type = turn
trigger1 = (anim = [1710, 1711]) && animelem = 2 && p2dist x < 0
[State 1710, FX]
type = helper
trigger1 = (anim = [1710, 1711]) && animelem = 2
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0
ownpal = 1

[State 1710, posfix]
type = posadd
trigger1 = anim = 1710 && (animelem = 6 || animelem = 7)
x = ifelse((animelem = 6), 8, 12)
[State 1710, End]
type = changestate
trigger1 = (anim = [1710, 1711]) && !animtime
value = 0
ctrl = 1
