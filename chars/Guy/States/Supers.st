; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SUPER STATES >====
;====

;==< BUSHIN GOURAI KYAKU >=
[Statedef 3000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3000
velset = 0, 0
poweradd = -1000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelemtime(1) = 3
value = 4, 1
channel = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 35, -70
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3000 && animelemtime(1) = 3
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3000, Vel]
type = velset
trigger1 = anim = 3000 && animelemtime(2) >= 0
x = 4

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && animelemtime(13) > 0
value = 3001
persistent = 0

[State 3000, Type]
type = statetypeset
trigger1 = anim = 3001 && animelemtime(3) < 0
statetype = S
physics = S
[State 3000, Vel]
type = velset
trigger1 = anim = 3001 && animelemtime(3) < 0
x = 0
y = 0
[State 3000, Pos]
type = posset
trigger1 = anim = 3001 && animelemtime(3) < 0
y = 0

[State 3000, Vel]
type = velset
trigger1 = anim = 3001 && animelem = 3
x = 10
y = -5

[State 3000, Type]
type = statetypeset
trigger1 = anim = 3001 && animelemtime(3) >= 0
statetype = A
physics = N
[State Accel]
type = veladd
trigger1 = anim = 3001 && animelemtime(3) >= 0
y = 0.45

[State 3000, Vel]
type = velset
trigger1 = anim = 3001 && animelemtime(5) >= 0 && animelemtime(6) < 0
y = 0

[State 3000, trail]
type = explod
trigger1 = anim = 3001 && animelem = 5
anim = 1121
sprpriority = 2
postype = p1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && (animelem = 2 || animelem = 6 || animelem = 11)
value = 3, 8
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 4
value = 3, 7
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 2
value = 1, 1
channel = 1
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 6
value = 1, 2
channel = 1
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 11
value = 1, 5
channel = 1
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 5
value = 1, 6
channel = 1

[State 3000, hithigh]
type = hitdef
trigger1 = anim = 3000 && (animelem = 2 || animelem = 11)
attr = S, HA
damage = 31*1.3, 5*1.3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit 
pausetime = 4, 4
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -76
hitsound = s2, ifelse((animelem = 19), 6, 3)
guardsound = s2, 0
ground.type = High
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 16
ground.velocity = -5.62, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((animelem = 19), -1, -3), -3
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
air.fall = 1
fall.recover = 0
yaccel = 0.5

[State 3000, hitlow]
type = hitdef
trigger1 = anim = 3000 && animelem = 6
attr = S, HA
damage = 31*1.3, 5*1.3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit 
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -60
hitsound = s2, ifelse((animelem = 17), 6, 3)
guardsound = s2, 0
ground.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 16
ground.velocity = -5.62
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -3, -3
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
air.fall = 1
fall.recover = 0
yaccel = 0.5

[State 3000, hitfinal]
type = hitdef
trigger1 = anim = 3001 && animelem = 5
attr = A, SA
damage = 31*2, 5*2
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 14 / ((var(20) > 0) + 1), 14 / ((var(20) > 0) + 1)
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -77
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -6, -6
air.type = Low
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.6
forcestand = 1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 1
value = 0, 52
persistent = 0
[State 3000, Dust]
type = explod
trigger1 = anim = 3001 && animelem = 1
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 3
value = 0, 41
persistent = 0
[State 3000, Dust]
type = helper
trigger1 = anim = 3001 && animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3001 && animelemtime(6) >= 0
movetype = I
[State Land]
type = changestate
trigger1 = anim = 3001 && animelemtime(6) >= 0
trigger1 = pos y > -vel y
value = 52


;==< BUSHIN HASSOU KEN >=
[Statedef 3050]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3050
velset = 0, 0
poweradd = -1000
juggle = ifelse(numtarget, 0, 6) * !var(20)
sprpriority = 1

[State 3050, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3050, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3050, Snd]
type = playsnd
trigger1 = animelemtime(1) = 1
value = 4, 1
channel = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 12, -89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State Corner Push]
type = varset
trigger1 = animelemtime(1) = 1
fvar(5) = 0

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3050, Snd]
type = playsnd
trigger1 = animelemtime(1) = 2 && statetype != A
value = 0, 41
persistent = 0
[State 3050, Dust]
type = helper
trigger1 = animelemtime(1) = 2 && statetype != A
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 3
value = 0, 41
persistent = 0
[State 3050, Dust]
type = helper
trigger1 = anim = 3001 && animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3050, Snd]
type = playsnd
trigger1 = animelemtime(1) = 2 && !pos y
value = 0, 41
[State 3050, Dust]
type = helper
trigger1 = animelemtime(1) = 2 && !pos y
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3050, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
x = -.66
y = 1.1
[State 3050, Vel]
type = velset
trigger1 = animelem = 2
x = 12
y = -12
[State 3050, Vel]
type = velset
trigger1 = animelemtime(6) >= 0 && animelemtime(29) < 0
x = 1.5
y = -1.5

[State 3050, Anim]
type = changeanim
trigger1 = animelem = 6 && !movecontact
trigger2 = (animelem = 12 || animelem = 17 || animelem = 28)
trigger2 = (movecontact != [1, 12]) && (movereversed != [1, 12])
value = 3050
elem = 29
[State 3050, Anim]
type = velset
trigger1 = animelem = 29
x = 0
y = 0
[State Type]
type = statetypeset
trigger1 = animelemtime(29) >= 0
physics = A

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 9 || animelem = 14
value = 3, 8
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 22
value = 3, 6
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 9
value = 1, 2
channel = 1
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 14
value = 1, 3
channel = 1
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 22
value = 1, 3
channel = 1

[State 3050, 1sthit]
type = hitdef
trigger1 = animelem = 4
attr = A, HA
damage = 32*1.3, 5*1.3
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -86
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -1.5, -8
air.type = High
air.velocity = -1.5, ifelse(p2dist y >= 0, -7.5, -5)
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
forcestand = 1

[State 3050, hithigh]
type = hitdef
trigger1 = animelem = 9 || animelem = 14
attr = A, HA
damage = 32*1.3, 5*1.3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -78
hitsound = s2, ifelse((animelem = 19 || animelem = 25), 6, 3)
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -1.5, -8
air.type = High
air.velocity = -1.5, ifelse(p2dist y >= 0, -6, -3.3)
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
forcestand = 1

[State 3050, hitfinal]
type = hitdef
trigger1 = animelem = 22
attr = A, HA
damage = 32*2, 5*2
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -86
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -12, -4
air.type = High
air.velocity = -6, -4
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(23) >= 0
movetype = I

;==< BUSHIN MUSOU RENGE >=
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000
juggle = 15
facep2 = 1
sprpriority = 1

[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0
volume = 200

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 0, -64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 3
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = animelemtime(5) < 1
time = 1
value = SCA

[State 4000, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= 28
attr = S, HT
hitflag = M-
priority = 7, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4001
animtype = Up
ground.velocity = -2, -16
air.velocity = -2, -16
sprpriority = -1
fall = 1
fall.recover = 0

[State 4000, misssnd]
type = playsnd
trigger1 = animelem = 6
value = 3, 0
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 4000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4001]
type = S
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 4002

[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4001, throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 4001, bound]
type = screenbound
trigger1 = animelemtime(18) < 0
value = 0
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = 1

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 19
sinadd = -255, -255, -255, 76
[State 4001, afterimage]
type = afterimagetime
trigger1 = animelemtime(11) < 0
time = 0

[State 4001, BG PalFX]
type = bgpalfx
trigger1 = animelemtime(2) = -1 || animelemtime(3) = -1 || animelemtime(4) = -1 || animelemtime(5) = -1 || animelemtime(6) = -1
trigger2 = animelemtime(7) = -1 || animelemtime(8) = -1 || animelemtime(9) = -1 || animelemtime(10) = -1 || animelemtime(11) = -1
invertall = 1
add = 255, 255, 255
sinadd = -1000, -1000, -1000, 80
color = 0
time = 20
[State 4001, palfx]
type = palfx
trigger1 = animelemtime(2) = -1 || animelemtime(3) = -1 || animelemtime(4) = -1 || animelemtime(5) = -1 || animelemtime(6) = -1
trigger2 = animelemtime(7) = -1 || animelemtime(8) = -1 || animelemtime(9) = -1 || animelemtime(10) = -1 || animelemtime(11) = -1
add = -50, -50, -50
sinadd = -155, -155, -155, 80
color = 0
time = 20
[State 4001, palfx]
type = palfx
trigger1 = animelemtime(12) = -1
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1
[State 4001, BG PalFX]
type = bgpalfx
trigger1 = animelemtime(12) = -1
add = 0, 0, 0
sinadd = 0, 0, 0, 1
color = 256
time = 1

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(11) < 0
flag = nobardisplay

[State 4001, fix]
type = posset
triggerall = animelem = 2
trigger1 = facing = 1 && pos x > 20
trigger2 = facing = -1 && pos x < -20
x = ifelse(pos x < -20, -20, 20)
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(2) <= 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
trigger2 = animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
value = 1
[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
trigger2 = animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
value = -ceil(40 * fvar(12))
kill = animelem = 11
[State 4001, hitpower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
trigger2 = animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
value = 36

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 9
value = 2, 7
[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 6 || animelem = 7 || animelem = 8 || animelem = 10 || animelem = 11
value = 2, ifelse((animelem = 11), 9, 8)
[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
trigger2 = animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
time = 6
freq = 120
ampl = -4

[State 821, Hit Spark]
type = Helper
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
trigger2 = animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = -10, -60
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(12) >= 0 && numtarget
value = 4003
persistent = 0

[State 4001, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
statetype = A
movetype = I
physics = N
[State 4001, gravity]
type = gravity
trigger1 = animelemtime(11) >= 0
[State 4001, Vel]
type = velset
trigger1 = animelem = 11
x = -3
y = -8

[State 4001, End]
type = changestate
trigger1 = animelemtime(11) > 0 && vel y > 0 && pos y >= -5
value = ifelse(winko, 186, 4005)

[Statedef 4005]
type = S
movetype = I
physics = S
anim = 4005
velset = 0, 0
sprpriority = -1
ctrl = 0
[State 4005, Pos]
type = posset
trigger1 = pos y
y = 0
[State 4005, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 3
channel = 0
[State 4005, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 1
channel = 1
[State 4005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- TARGET ---
[Statedef 4002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[State 4002, palfx]
type = palfx
trigger1 = animelemtime(2) = -1 || animelemtime(3) = -1 || animelemtime(4) = -1 || animelemtime(5) = -1 || animelemtime(6) = -1
trigger2 = animelemtime(7) = -1 || animelemtime(8) = -1 || animelemtime(9) = -1 || animelemtime(10) = -1 || animelemtime(11) = -1
add = -50, -50, -50
sinadd = -155, -155, -155, 80
color = 0
time = 20

[Statedef 4003]
type = S
physics = N
movetype = H
velset = -2, -16
ctrl = 0

[State 4003, BG PalFX]
type = palfx
trigger1 = !time
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1

[State 4003, End]
type = selfstate
trigger1 = time
value = 5020


;------------------------------------------------------------------------
[Statedef 3200]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
juggle = 0
poweradd = -3000
anim= 3200

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 20, -80
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000,SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 40
anim = -1
sound =  s8500,0
pos = 0,0
movetime = 40
darken = 0
unhittable = 1
supermove = 1
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4000,0
channel = 7


[State 1001,1]
type = ChangeState
trigger1 = time= 40
value = 3201
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3201]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
juggle = 0
anim= 3201


[State 800, 1]
type = HitDef
Triggerall = time=0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
Trigger2 = p2stateno=52 || p2stateno = 0|| p2stateno = [10,12]
attr = S, HT          ;Attributes: Standing, Normal Throw
hitflag = M           ;Affect only ground people who are not being hit
guardflag = -1
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
sprpriority = 1       ;Draw in front of p2
p2facing = 1          ;Force p2 to face player
p1stateno = 3210
p2stateno = 3215
fall = 1
fall.recover = 1

[State 1001,1]
type = ChangeState
trigger1 = animtime=0
value = 0
ctrl = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 3,2

;------------------------------------------------------------------------
[Statedef 3210]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3210
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 2,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,6

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
trigger2 = animelem = 9
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
trigger2 = animelem = 9
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 9
trigger2 = animelem = 3
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xscale)), ceil(-55 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 9
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(60 * const(size.xscale)), ceil(-80 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 60,0  ;x - more then more near P1

[State 0, PosSet]
type = null; Posset
trigger1 = var(39) = 1
trigger1 = time=0
x = -20

[State 0, PosSet]
type = null; Posset
trigger1 = var(39) = 2
trigger1 = time=0
x = 20

[State 0, landing explode]
type = Explod
trigger1 = animtime = 0
anim = 3260
sprpriority = 4
postype = p1
pos = 0,0
bindtime = 1
pausemovetime = -2
removetime = 6
ignorehitpause = 0
scale = 1,1
ownpal = 1
facing = 1
vfacing = 1
ontop = 1
vel = -40,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3211
ctrl = 0

[Statedef 3211]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3220
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,3
channel = 6

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =  time >= 0
flag = invisible
flag2 = noshadow

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 3212
ctrl = 0

[Statedef 3212]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3222
juggle = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3212"
ID = 3212
stateno = 32120
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3212"
ID = 3212
stateno = 32121
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3212"
ID = 3212
stateno = 32122
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = -140

[State 0, AssertSpecial]
type = null;AssertSpecial
trigger1 =  time <= 4
flag = invisible
flag2 = noshadow

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 40
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 3230
ctrl = 0

;====
;====
[Statedef 32120]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3222
juggle = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 99,99,99
mul = 99,99,99
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = -145

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 40

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 10

[Statedef 32121]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3222
juggle = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 66,66,66
mul = 66,66,66
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = -152

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 40

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 10

[Statedef 32122]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3222
juggle = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 33,33,33
mul = 33,33,33
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = -162

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 40

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 10
;====
;====

[Statedef 3230]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3230
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S3200,1
channel = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3230
sprpriority = 0
postype = p1
pos = -20,-50
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.5,0.4
ownpal = 1
facing = -1
vfacing = -1
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 2,6

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 4
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 4
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 4
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-20 * const(size.xscale)), ceil(-70 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time= 0
time = 14
add = 0,0,0
mul = 255,255,255
sinadd = 255,255,255, 34
persistent = 0

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time= 4
time = 222
add = 255,255,255
mul = 255,255,255
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3231
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = 60

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = -60

;---------------------------------------------------------------------
[Statedef 3231]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3231
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, ModifyExplod]
type = Explod
trigger1 = Time = 0
anim = 7305
ID = 3231
postype = p1
sprpriority = 4
postype = p1
pos = 30,-40
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.5,0.4
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,3

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 2
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(30 * const(size.xscale)), ceil(-50 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3232
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = -60

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = 60

;---------------------------------------------------------------------
[Statedef 3232]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3232
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3232
sprpriority = 4
postype = p1
pos = -20,-50
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.5,0.4
ownpal = 1
facing = -1
vfacing = -1
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,4

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 2
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-40 * const(size.xscale)), ceil(-90 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3233
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = 60

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = -60

;---------------------------------------------------------------------
[Statedef 3233]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3233
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3233
sprpriority = 4
postype = p1
pos = 40,-30
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.7,0.3
ownpal = 1
facing = 1
vfacing = 1
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,5

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 2
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(40 * const(size.xscale)), ceil(-20 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3234
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = -60

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = 60

;---------------------------------------------------------------------
[Statedef 3234]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3234
juggle = 0

[State 0, landing explode]
type = Explod
trigger1 = animtime = 0
anim = 3260
sprpriority = 4
postype = p1
pos = 0,0
bindtime = 1
pausemovetime = -2
removetime = 6
ignorehitpause = 0
scale = 1,1
ownpal = 1
facing = -1
vfacing = 1
ontop = 1
vel = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3234
sprpriority = 4
postype = p1
pos = -40,-80
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.6,0.4
ownpal = 1
facing = -1
vfacing = 1
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 2,6

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 3
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-60 * const(size.xscale)), ceil(-40 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 32344
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = 60

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = -60

;---------------------------------------------------------------------
[Statedef 32344]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3223
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,3
channel = 6

[State 0, AssertSpecial]
type =AssertSpecial
trigger1 =  time >= 0
flag = invisible
flag2 = noshadow

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = -10

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 32345
ctrl = 0

[Statedef 32345]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3223
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = 120

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = -30
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 3235
ctrl = 0

;====
;====
[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3290"
ID = 3290
stateno = 3290
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3291"
ID = 3291
stateno = 3291
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "3292"
ID = 3292
stateno = 3292
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
;====
;====

;====
;====
[Statedef 3290]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3223
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 99,99,99
mul = 99,99,99
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = 5

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = -30

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 15

[Statedef 3291]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3223
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 66,66,66
mul = 66,66,66
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = 10

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = -30

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 15

[Statedef 3292]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3223
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PalFX]
type = PalFX
trigger1 =  1
time = 22
add = 33,33,33
mul = 33,33,33
invertall = 0
color = 256

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
x = 15

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = -30

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 15
;====
;====

;------------------------------------------------------------------------
[Statedef 3235]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3235
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3235
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.6,0.4
ownpal = 1
facing = 1
vfacing = 1
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 11
value = 2,5

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
trigger2 = animelem = 11
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
trigger2 = animelem = 11
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 3
trigger2 = animelem = 11
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xscale)), ceil(-90 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 11
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xscale)), ceil(-100 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = -65

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = 65

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3237
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3237]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3237
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3235
sprpriority = 4
postype = p1
pos = -50,-50
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.6,0.3
ownpal = 1
facing = -1
vfacing = 1
ontop = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 10
value = 2,1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
trigger2 = animelem = 10
value = -30
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
trigger2 = animelem = 10
freq = 100
ampl = 10
time = 6

[State 0, Pause]
type = Pause
trigger1 = animelem = 3
trigger2 = animelem = 10
time = 6
movetime = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-80 * const(size.xscale)), ceil(-60 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 10
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(-70 * const(size.xscale)), ceil(-50 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = 65

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = -65

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3239
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3239]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3239
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 30
value = 0,101

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = S3200,2
channel = 6

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7305
ID= 3235
sprpriority = 4
postype = p1
pos = 30,-40
bindtime = 1
pausemovetime = -2
removetime = -2
ignorehitpause = 0
scale = 0.7,0.4
ownpal = 1
facing = 1
vfacing = 1
ontop = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 1
trigger1 = time = 0
x = -65

[State 0, PosSet]
type = Posset
trigger1 = var(39)= 2
trigger1 = time = 0
x = 65

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 14
time = 2
add = 155,155,155
mul = 155,155,155
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 16
time = 2
add = 145,145,145
mul = 145,145,145
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 18
time = 2
add = 135,135,135
mul = 135,135,135
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 20
time = 2
add = 125,125,125
mul = 125,125,125
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 22
time = 2
add = 115,115,115
mul = 115,115,115
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 24
time = 2
add = 105,105,105
mul = 105,105,105
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 26
time = 2
add = 95,95,95
mul = 95,95,95
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 28
time = 2
add = 85,85,85
mul = 85,85,85
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 30
time = 2
add = 75,75,75
mul = 75,75,75
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 32
time = 2
add = 65,65,65
mul = 65,65,65
color = 256

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 34
time = 2
add = 45,45,45
mul = 45,45,45
color = 256

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3250
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3250]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 100
juggle = 0

[State 0, PalFX]
type = null;PalFX
trigger1 = time = 0
time = 100
add = 0,0,0
mul =0,0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time = 0
time = 140
add = 0,0,0
mul = 0,0,0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

;===
[State 0, Hit Spark]
type = Helper
trigger1 = time = 10
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xscale)), ceil(-80 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 40
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(20 * const(size.xscale)), ceil(-30 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 60
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(120 * const(size.xscale)), ceil(-120 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 80
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(120 * const(size.xscale)), ceil(-120 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 90
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(70 * const(size.xscale)), ceil(-60 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 100
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(10 * const(size.xscale)), ceil(-80 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 105
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(120 * const(size.xscale)), ceil(-40 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 110
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(60 * const(size.xscale)), ceil(-10 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 115
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(180 * const(size.xscale)), ceil(-90 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 120
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(20 * const(size.xscale)), ceil(-10 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 125
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(40 * const(size.xscale)), ceil(-90 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 130
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(140 * const(size.xscale)), ceil(-20 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 135
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(120 * const(size.xscale)), ceil(-120 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = time = 140
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(60 * const(size.xscale)), ceil(-70 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 10
trigger2 = time = 40
trigger3 = time = 90
trigger4 = time = 100
trigger5 = time = 115
trigger6 = time = 125
trigger7 = time = 135
value = 2,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 60
trigger2 = time = 80
trigger3 = time = 105
trigger4 = time = 110
trigger5 = time = 120
trigger6 = time = 130
value = 2,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 140
value = 2,9

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 10
trigger2 = time = 40
trigger3 = time = 90
trigger4 = time = 100
trigger5 = time = 115
trigger6 = time = 125
trigger7 = time = 135
value = -10
kill = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 140
value = -20
kill = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 140
value = 3251
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3251]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3251
juggle = 0

[State -3, Lv3 Shadows]
type = afterimage
trigger1 = time = 1
time = 75
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State 1330, Vel]
type = velset
trigger1 = animelem = 1
x = 2

[State 1330, Vel]
type = velset
trigger1 = animelem = 2
x = 0


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 15
value = 3200,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 15
value = 3200,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
;------------------------------------------------------------------------
[Statedef 3215]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
anim = 3215
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3215

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 20
x = -10
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3230
value = 3240
ctrl = 0

;------------------------------------------------------------------------
;------------------------------------------------------------------------
[Statedef 3240]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = -10
[State 0, VelSet]
type = VelSet
trigger1 = time>=4
x = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3240

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3231
value = 3241
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3241]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3241

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3232
value = 3242
ctrl = 0


;------------------------------------------------------------------------
[Statedef 3242]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3242

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3233
value = 3243
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3243]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3243

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3234
value = 3244
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3244]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3244

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 32344
value = 32444
ctrl = 0

;------------------------------------------------------------------------
[Statedef 32444]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 32444

[State 0, VelSet]
type = VelSet
trigger1 =  time>=0
x = 10
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3235
value = 3245
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3245]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, VelSet]
type = VelSet
trigger1 =  time>=0
x = 5
y = 0

[State 0, VelSet]
type = VelSet
trigger1 =  time>=4
x = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3245

[State 0, PosSet]
type = Posset
trigger1 = time >= 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3237
value = 3247
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3247]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3247

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3239
value = 3249
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3249]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 32499

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3250
value = 32499
ctrl = 0

;------------------------------------------------------------------------
[Statedef 32499]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 140
add = 0,0,0
mul =0,0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 0

[State 0, PosSet]
type = Posset
trigger1 = time = 0
x = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3251
value = 3255
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3255]
type = S
movetype = H
physics = N
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3205

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
y = 20

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = -5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = 10

[State 3000, Vel]
type = VelSet
trigger1 = AnimElem = 1
x = 10
y = 0

[State 3000, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 0
y = 0

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && vel Y > 0 && time >= 10
value = 5080

;------------------------------------------------------------------------
;------------------------------------------------------------------------
[Statedef 3300]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
juggle = 0
poweradd = -3000
anim= 3300

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 20, -80
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

;SUPER EFFECT
;SUPER PAUSE
[State 2000,SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 40
anim = -1
sound =  s8500,0
pos = 0,0
movetime = 40
darken = 0
unhittable = 1
supermove = 1
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4000,0
channel = 7

[State 1001,1]
type = ChangeState
trigger1 = time= 40
value = 3301
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3301]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
juggle = 0
anim= 3301

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 25
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 50
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 9
trigger3 = animelem = 14
trigger4 = animelem = 22
value = 1,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 14
value = 3,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 3,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 22
value = 3,6

[State 210,2]
type = HitDef
trigger1 = animelem= 3
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = S,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = high
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -6
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
;
hitsound = S2,1
guardsound = S6,1
sparkxy = -20 + 0 * (var(35) := 89), var(36):= -65
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
;
p2stateno = 50000
kill=0

[State 210,2]
type = HitDef
trigger1 = animelem=9
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = S,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = low
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -6
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -5
;
hitsound = S2,2
guardsound = S6,1
sparkxy = -20 + 0 * (var(35) := 89), var(36):= -65
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
;
p2stateno = 50000
kill=0

[State 210,2]
type = HitDef
trigger1 = animelem= 14
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = S,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = high
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -6
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
;
hitsound = S2,6
guardsound = S6,1
sparkxy = -25 + 0 * (var(35) := 89), var(36):= -80
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
;
p2stateno = 50000
kill=0
[State 210,2]
type = HitDef
trigger1 = animelem= 22
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = S,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = low
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
;
hitsound = S2,5
guardsound = S6,1
sparkxy = -30 + 0 * (var(35) := 89), var(36):= -70
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
;
p2stateno = 50000
p1stateno = 3310
kill=0
;===
;------------------------------------------------------------------------
[Statedef 3310]
type = S
movetype = A
physics = N
ctrl = 0
anim = 3310
velset = 0,0
juggle = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time>=8
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=10
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time>=13
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=23
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time>=26
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=36
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time>=39
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time>=42
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=40
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time>=43
y = -3
[State 0, VelSet]
type = VelSet
trigger1 = time>=45
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=47
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time>=50
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time>=53
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time>=56
y = 7

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 7
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N        ;A,C,S,N

[State 0,HitDef]
type = HitDef
trigger1 = animelem= 6
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = low
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,16
guard.pausetime = 10,16
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
;
hitsound = S2,6
guardsound = S6,1
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -60
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
kill=0

[State 0,HitDef]
type = HitDef
trigger1 = animelem= 8
priority = 5, Hit		;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard		; = medium		;2p ANIM
ground.type = high
damage = 50,5
getpower = 0
GivePower = 0
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4
air.velocity = -2,-4
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
;
hitsound = S2,6
guardsound = S6,1
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -60
sparkno = -1 + 0 * (var(12) := 8014)
guard.sparkno = -1 + 0 * (var(13) := 8001)
;
fall=0
air.fall=0
fall.recover=0
;
envshake.time = 5
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100
fall.envshake.ampl = 6
;
p2stateno = 3315
p1stateno = 3320
kill=0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3320
ctrl = 0
;===
;------------------------------------------------------------------------
[Statedef 3320]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3320
velset = 0,0
juggle = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time>=3
y = -3
[State 0, VelSet]
type = VelSet
trigger1 = time>=5
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=7
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time>=10
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time>=13
y = 5

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time>=0
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=16
x = 40
y = -6

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=16
trigger1 = FrontEdgeDist <= 10
value = 3321
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3321]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3322
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3300,2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 1
x = 30
y = -30
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=1
trigger1 = FrontEdgeDist <= 10
value = 3322
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3322]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3322
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3300,2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 1
x = 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = -20

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=1
trigger1 = FrontEdgeDist <= 10
value = 3323
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3323]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3322
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3300,2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 1
x = 30
y = 20
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 5
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 7
y = -20

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=1
trigger1 = FrontEdgeDist <= 10
value = 3324
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3324]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3322
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3300,2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 1
x = 30
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 5
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 7
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 3330
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3330]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3330
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 3300,3

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
x = 0
y = -100

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 100
pos = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = -5
[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = -3
[State 0, VelSet]
type = VelSet
trigger1 = time>= 16
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 20
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time>= 48
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>= 51
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time>= 54
y = 2

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3340
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3340]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3340
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 3300,4

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 10
pos = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0
value = 3350
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3350]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3350
velset = 0,0
juggle = 0

[State 0, landing explode]
type = Explod
trigger1 = Time = 4
anim = 7235
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 8
anim = 7235
sprpriority = 4
postype = p1
pos = 30,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.4,0.4
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 6
anim = 7235
sprpriority = 4
postype = p1
pos = -30,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.4,0.4
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7235
sprpriority = 4
postype = p1
pos = 20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7235
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 6014
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.4
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 6014
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.4
ownpal = 1
facing = -1

[State 0, EnvShake]
type = EnvShake
trigger1 = time=0
time = 14
freq = 110
ampl = -11

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 5,1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 3351
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3351]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3351
velset = 0,0
juggle = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 10

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = -2
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time>= 9
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>= 15
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 18
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time>= 21
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = 8

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0 && time >= 4
value = 1999
ctrl = 0
;===
;------------------------------------------------------------------------
[Statedef 3305]
type = S
physics = N
movetype = H
ctrl = 0
juggle = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time >= 0
statetype = S       ;S,A,C,L
movetype = H        ;I,A,H
physics = N         ;A,C,S,N

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3305

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, ChangeState]
type = selfstate
trigger1 = animtime = 0
value = 0
ctrl = 1

;===
;------------------------------------------------------------------------

;===
;------------------------------------------------------------------------
[Statedef 3315]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3316
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3316]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ScreenBound]
type = null;ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3315

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0
x = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
y =-60

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -2

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 53
value = 3335
ctrl = 0
;anim =
;ignorehitpause =
;persistent =

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && vel Y > 0
value = 5100

;===
;------------------------------------------------------------------------
;------------------------------------------------------------------------
[Statedef 3335]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3335

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3340
value = 3345
ctrl = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 4
trigger2 = animelem = 8
trigger3= animelem = 12
trigger4 = animelem = 16
trigger5 = animelem = 20
value = 4
[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 5
trigger2 = animelem = 9
trigger3 = animelem = 13
trigger4 = animelem = 17
trigger5 = animelem = 21
value = -1

;------------------------------------------------------------------------
[Statedef 3345]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 4
value = 4
[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 5
trigger2 = animelem = 1
trigger3 = animelem = 2
trigger4 = animelem = 3
value = -1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3345

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3350
value = 3355
ctrl = 0
;------------------------------------------------------------------------
[Statedef 3355]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3355

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3351
value = 3356
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3356]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 =time=0
value = -100
kill = 1

[State 0, SelfState]
type =  VelSet
trigger1 = time=0
x = -10
[State 0, SelfState]
type = SelfState
trigger1 = time=0
value = 5100


;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 50000]
type = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 5000

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;HITG_SLIDE

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

;------------------------------------------------------------------------
[Statedef 1999]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 1999
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 50,0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1