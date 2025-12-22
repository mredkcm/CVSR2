; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;===< EX SPECIAL STATES >==
;====

;==< HADOU SHOU >=
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1010
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1080, ExFX]
type = varset
trigger1 = !time
var(25) = 16

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1010, width]
type = width
trigger1 = anim = 1010 && animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = anim = 1011 && animelemtime(2) >= 0 && animelemtime(3) < 0
value = 13
[State 1010, width]
type = width
trigger1 = anim = 1010 && animelemtime(5) >= 0
trigger2 = anim = 1011 && animelemtime(2) < 0
value = 26

[State 1010, focus]
type = removeexplod
trigger1 = anim = 1010 && animelemtime(2) < 0
ID = 1012

[State 1010, focus]
type = explod
trigger1 = anim = 1010 && animelem = 2
anim = 1012
ID = 1012
sprpriority = 3
postype = p1
bindtime = -1
removetime = -2
removeongethit = 1
ownpal = 1

[State 1010, Hadoushou]
type = helper
trigger1 = anim = 1010 && animelem = 5
helpertype = normal
stateno = 1015
ID = 1015
name = "Hadoushou"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -20, -55
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, snd]
type = playsnd
trigger1 = anim = 1010 && animelem = 5
value = 3, 5
channel = 0
[State 1010, snd]
type = playsnd
trigger1 = anim = 1010 && animelem = 5
value = 5, 0

[State 1010, End]
type = changeanim
trigger1 = anim = 1010 && animelemtime(5) >= 0 && !numhelper(1015)
value = 1011
[State 1010, End]
type = changestate
trigger1 = anim = 1011 && !animtime
value = 0
ctrl = 1


;==< TENGYOU HADOU SHOU >=
[Statedef 1030]
type = S
physics = S
movetype = A
anim = 1030
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
channel = 1

[State 1030, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1030, width]
type = width
trigger1 = anim = 1030 && animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = anim = 1031 && animelemtime(2) >= 0 && animelemtime(3) < 0
value = 13
[State 1030, width]
type = width
trigger1 = anim = 1030 && animelemtime(5) >= 0
trigger2 = anim = 1031 && animelemtime(2) < 0
value = 26

[State 1030, focus]
type = removeexplod
trigger1 = anim = 1030 && animelemtime(2) < 0
ID = 1034
[State 1030, focus]
type = explod
trigger1 = anim = 1030 && animelem = 2
anim = 1034
ID = 1034
sprpriority = 3
postype = p1
bindtime = -1
removetime = -2
removeongethit = 1
ownpal = 1

[State 1030, Hadoushou]
type = helper
trigger1 = anim = 1030 && animelem = 5
helpertype = normal
stateno = 1015
ID = 1035
name = "Hadoushou"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -20, -55
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, snd]
type = playsnd
trigger1 = anim = 1030 && animelem = 5
value = 3, 5
channel = 0
[State 1030, snd]
type = playsnd
trigger1 = anim = 1030 && animelem = 5
value = 5, 0

[State 1030, End]
type = changeanim
trigger1 = anim = 1030 && animelemtime(5) >= 0 && !numhelper(1035)
value = 1031
[State 1030, End]
type = changestate
trigger1 = anim = 1031 && !animtime
value = 0
ctrl = 1


;==< SHOUOU KEN >=
[Statedef 1110]
type = S
physics = N
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = -500
juggle = ifelse((p2movetype = H && p2statetype = A), 7, 0)
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
channel = 1

[State 1110, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1110, Vel]
type = velset
trigger1 = anim = 1110 && animelem = 2
x = 1.25 * const(velocity.run.fwd.x)
[State 1110, steps]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 3 || animelem = 6
value = 0, 100

[State 1110, shield]
type = helper
trigger1 = anim = 1110 && animelem = 2
helpertype = normal
stateno = 1115
ID = 1115
name = "Projectile Shield"
postype = p1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -20, -62
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 4, 12
channel = 0
ignorehitpause = 1
persistent = 0

[State 1110, hitrunning]
type = hitdef
trigger1 = animelem = 2 && anim = 1110
attr = S, SA
damage = 25, 6
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
guard.pausetime = 8, 8
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -55
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
forcestand = 1

[State 1110, Anim]
type = changeanim
trigger1 = anim = 1110 && animelemtime(2) >= 0 && movehit
value = 1111

[State 1110, hitlow]
type = hitdef
trigger1 = (animelem = 2 || animelem = 4) && anim = 1111
attr = S, SA
damage = 25, 6
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10, ifelse((animelem = 4), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1100, hithigh]
type = hitdef
trigger1 = (animelem = 1 || animelem = 3) && anim = 1111
attr = S, SA
damage = 25, 6
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10, ifelse((animelem = 5), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1110, hitfinal]
type = hitdef
trigger1 = animelem = 5 && anim = 1111
ID = 1110
attr = S, SA
damage = 25, 6
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.5, -10
air.type = Low
air.velocity = -3.5, -10
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
forcestand = 1

[State 1110, statetype]
type = statetypeset
trigger1 = anim = 1111
statetype = S
physics = S
[State 1110, missed]
type = changestate
trigger1 = anim = 1110 && animelemtime(2) >= 0 && !movehit
trigger1 = time >= 40
value = 1112
[State 1110, guarded]
type = changestate
trigger1 = anim = 1110 && animelemtime(2) >= 0 && moveguarded
value = 1113

[State Idle]
type = statetypeset
trigger1 = anim = 1111 && animelemtime(6) >= 0
movetype = I

[State 1110, End]
type = changestate
trigger1 = anim = 1111 && !animtime
value = 0
ctrl = 1


;--- BREAK ---
[Statedef 1112]
type = S
physics = S
movetype = I
anim = 1112
ctrl = 0
sprpriority = 1

[State 1112, snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 7
channel = 0
persistent = 0
[State 1112, snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 101
persistent = 0
[State 1112, dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 18, 0
vel = 2, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1112, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- JUMP BACK ---
[Statedef 1113]
type = A
physics = A
movetype = I
anim = 43
ctrl = 0
velset = const(velocity.jump.back.x), const(velocity.jump.y)
sprpriority = 1

[State 1113, dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1
[State 1113, snd]
type = playsnd
trigger1 = !time
value = 0, 40
[State 1113, snd]
type = playsnd
trigger1 = !time && prevstateno = 4100
value = 3, 7
channel = 0


;==< SHUNPUU KYAKU >=
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

[State 1210, shunpuuvar]
type = varset
triggerall = anim = 1210
trigger1 = command = "qcba" || command = "qcbb" || command = "qcbc"
trigger2 = AIlevel && random < 100
var(30) = 1
ignorehitpause = 1

[State 1210, shunpuuvar]
type = varset
triggerall = anim = 1210
trigger1 = command = "qcb2k"
trigger2 = AIlevel && random < 50
var(30) = 2
ignorehitpause = 1

[State 1210, shunpuuvar]
type = varset
trigger1 = anim != 1210
trigger2 = AIlevel && (p2dist x < 0 || p2dist y <= -120)
var(30) = 0

[State 1210, snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 5
value = 4, 15
channel = 0

[State 1210, snd]
type = playsnd
trigger1 = anim = 1200 && !animtime
value = 0, 40
persistent = 0

[State 1210, dust]
type = helper
trigger1 = anim = 1200 && !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1210

[State 1210, Vel]
type = velset
trigger1 = anim = 1210 && animelem = 1
x = 6
y = -6

[State 1210, statetype]
type = statetypeset
trigger1 = anim = 1210
statetype = A
physics = N
[State 1210, Accel]
type = veladd
trigger1 = anim = 1210
y = 0.6

[State 1210, spin]
type = playsnd
trigger1 = anim = 1210
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
value = 1, 5
channel = 1

[State 1210, hit]
type = hitdef
trigger1 = anim = 1210 && (animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19) && (hitcount < 5)
attr = A, SA
damage = 34, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 14, 14
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7, 0
air.type = Low
air.velocity = -5, -5
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 1210, hit]
type = hitdef
trigger1 = anim = 1210 && (animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17) && (hitcount < 5)
attr = A, SA
damage = 34, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 14, 14
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 7, 0
air.type = Low
air.velocity = 5, -5
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 1210, End]
type = changestate
trigger1 = anim = 1210 && vel y > 0 && pos y >= 0 && var(30)
value = ifelse((var(30) = 2 && power >= 500 && !var(20)), 1230, 1220)

[State 1210, End]
type = changeanim
trigger1 = anim = 1210 && vel y > 0 && pos y >= 0
value = 1205

[State 1210, Vel]
type = velset
trigger1 = anim = 1205
x = 0
y = 0

[State 1210, Pos]
type = posset
trigger1 = anim = 1205
y = 0

[State 1210, statetype]
type = statetypeset
trigger1 = anim = 1205
statetype = S
physics = S

[State 1210, snd]
type = playsnd
trigger1 = anim = 1205
value = 0, 52
persistent = 0
[State 1210, dust]
type = explod
trigger1 = anim = 1205
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I

[State 1210, End]
type = changestate
trigger1 = anim = 1205 && !animtime
value = 0
ctrl = 1


;==< SHUNPUU REN KYAKU >=
[Statedef 1230]
type = S
physics = S
movetype = A
anim = 1221
ctrl = 0
velset = 0, 0
poweradd = -250
juggle = 0
sprpriority = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

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

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 7

[State 1230, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1230, shunpuuvar]
type = varset
trigger1 = var(30)
var(30) = 0

[State 1230, width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
value = 25, 0

[State 1230, snd]
type = playsnd
trigger1 = time = 1
value = 0, 52

[State 1230, dust]
type = explod
trigger1 = !time
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
pos = 15, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1230, Stop]
type = velset
trigger1 = 1
y = 0

[State 1230, Pos]
type = posset
trigger1 = 1
y = 0

[State 1230, snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0

[State 1230, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 0, hit]
type = HitDef
triggerall = !var(4) && var(2) < 1
trigger1 = AnimElem = 3
attr = S, SA
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 4
animtype = Up
guardflag = M
hitflag = MAF
priority = 7, hit
pausetime = 10, 10
guard.pausetime = 10, 10
hitsound = F2, 5
guardsound = F6, 0
ground.type = Low
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 12
ground.velocity = 0, -12
guard.velocity = -5.77
air.type = High
air.velocity = 0, -12
air.hittime = 120
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = .5
air.recover = 0
Id = 2201
getpower = 0
givepower = 35, 35
envshake.time = 12
fall.envshake.time = 5
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0
sparkno = S-1 + 0 * (var(33) := 8013)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -95

[State 0, var]
type = varset
trigger1 = movehit
var(2) = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 1230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KUUCHUU SHUNPUU KYAKU >=
[Statedef 1260]
type = A
physics = N
movetype = A
anim = 1260
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 2, -2), (vel y) -2
poweradd = -500
juggle = 7
sprpriority = 1

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

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 7

[State 1260, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1260, shunpuuvar]
type = varset
triggerall = animelemtime(3) >= 0
trigger1 = !AIlevel && (command = "qcba" || command = "qcbb" || command = "qcbc")
trigger2 = AIlevel && random < 100
var(30) = 1
ignorehitpause = 1
[State 1260, shunpuuvar]
type = varset
triggerall = animelemtime(3) >= 0
trigger1 = !AIlevel && command = "qcb2k" && !var(20)
trigger2 = AIlevel && random < 50
var(30) = 2
ignorehitpause = 1
[State 1260, shunpuuvar]
type = varset
trigger1 = animelemtime(15) >= 0 && var(30)
var(30) = -1
ignorehitpause = 1
[State 1260, shunpuuvar]
type = varset
trigger1 = animelemtime(3) < 0
trigger2 = AIlevel && (p2dist x < 0 || p2dist y <= -120)
var(30) = 0

[State 1260, snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 5
channel = 0

[State 1260, Accel]
type = veladd
trigger1 = animelemtime(15) < 0 && vel y > -2
y = -const(movement.yaccel) * 0.5
[State 1260, Accel]
type = gravity
trigger1 = 1

[State 1260, spin]
type = playsnd
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1, 5
channel = 1

[State 1260, hit]
type = hitdef
trigger1 = (animelem = 4 || animelem = 8 || animelem = 12) && hitcount < 3
attr = A, SA
damage = ifelse(movehit, 35, 80), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 14, 14
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -4
air.type = Low
air.velocity = -4, -4
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

[State 1260, hit]
type = hitdef
trigger1 = (animelem = 6 || animelem = 10) && hitcount < 3
attr = A, SA
damage = ifelse(movehit, 35, 80), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 14, 14
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 4, -4
air.type = Low
air.velocity = 4, -4
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

[State 1260, posfix]
type = posadd
trigger1 = animelem = 15
x = 10
y = -5

[State 1260, statetype]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I

[State 1260, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = ifelse(var(30) = -1, 1252, ifelse(var(30) = 2, 1230, ifelse(var(30) = 1, 1220, 52)))


;====< TAUNT >==
[Statedef 1195]
type = S
movetype = A
physics = S
juggle = 7
anim = 1195
velset = 0, 0
sprpriority = 1
poweradd = -500
ctrl = 0
sprpriority = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

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


[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1195, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1195, hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
damage = 25, 0
animtype = Hard
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -79
hitsound = s5, 7
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -20, 0
air.velocity = -9, -5
getpower = 0
givepower = 36, 36
forcestand = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1195, snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 4
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I

[State 1195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< OUKA KYAKU >=
[Statedef 1410]
type = A
physics = A
movetype = A
anim = 1410
ctrl = 0
velset = 0, 0
poweradd = -500
juggle = 7
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

[State 1410, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1410, snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 2
channel = 0
[State 1410, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 1410, freeze]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0
[State 1410, Vel]
type = velset
trigger1 = animelem = 3
x = 10
y = 8

[State 1410, hit]
type = hitdef
trigger1 = animelem = 3
attr = A, SA
damage = 105, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -16
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10, 0
air.type = Low
air.velocity = -4, 2
down.velocity = 0, 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

;==<EX SAKURA OTOSHI >=
[Statedef 1330]
type = U
physics = U
movetype = A
anim = 40
ctrl = 0
velset = vel x * (prevstateno = 1305), vel y * (prevstateno = 1305)
poweradd = 72 * !var(20)
facep2 = (prevstateno != [1300, 1399])
sprpriority = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

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

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1330, Anim]
type = changeanim
trigger1 = !time && prevstateno = 1305
value = 1300
elem = 3

[State 1330, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfc"), 3, ifelse(command = "dfb", 2, 1))
[State 1330, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))

[State 1330, otoshivar]
type = varset
trigger1 = !time && (prevstateno != [1300, 1305])
var(31) = 0

[State 1330, Vel]
type = velset
trigger1 = anim = 40 && !animtime
x = ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2.5, 2))
y = ifelse(var(10) = 3, -9, ifelse(var(10) = 2, -7, -5))

[State 1330, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 41
persistent = 0

[State 1330, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0
[State 1300, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1300

[State 1330, statetype]
type = statetypeset
trigger1 = anim = 1300
statetype = A
physics = N
[State 1330, Accel]
type = veladd
trigger1 = anim = 1300
y = 0.4

[State 1330, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 1
value = 4, 5
channel = 0

[State 1330, punch]
type = changestate
triggerall = anim = 1300 && animelemtime(3) > 0 && var(31) < 3
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && (p2bodydist x = [0, 75]) && (p2bodydist y = [ -75, 75]) && (p2statetype != L)
trigger3 = AIlevel && vel y >= 0 && (enemy, numproj)
value = 1305

[State 1330, cancel]
type = changestate
triggerall = anim = 1300 && animelemtime(3) > 0 && var(31) < 3
trigger1 = !AIlevel && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel && !var(31) && random < 50
value = 1302

[State 1330, End]
type = changestate
trigger1 = anim = 1300 && vel y > 0 && pos y >= 0
value = ifelse(var(31), 52, 1301)


;--- PUNCH ---
[Statedef 1305]
type = A
movetype = A
physics = N
juggle = 8 * (var(31) = 1)
anim = 1305
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1305, Accel]
type = veladd
trigger1 = 1
y = 0.4
[State 1305, otoshivar]
type = varadd
trigger1 = !time && var(31) < 3
var(31) = 1

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(31) < 3, 3, 4), ifelse(var(31) = 1, 1, ifelse(var(31) = 2, 2, 12))
channel = 0
[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 1305, helper]
type = helper
trigger1 = !time && !numhelper(1306)
helpertype = normal
stateno = 1306
ID = 1306
name = "Projectile Hitter"
postype = p1
[State 1305, NHB]
type = nothitby
trigger1 = numhelper(1306)
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
value = SCA, NP, SP, HP
time = 1
ignorehitpause = 1

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 2 && var(31) < 3
attr = A, SA
damage = 50, 7 
animtype = Hard
guardflag = HA 
hitflag = MAF 
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -64
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -8
air.type = High
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 2 && var(31) >= 3
attr = A, SA
damage = 40, 7 
animtype = Hard
guardflag = HA 
hitflag = MAF 
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -64
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, 4
air.type = High
air.velocity = -8, 4
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1305, Vel]
type = velset
trigger1 = (movecontact = 1 || movereversed = 1)
x = 3
y = -7
[State 1305, Vel]
type = velset
trigger1 = numhelper(1306)
trigger1 = helper(1306), stateno = 1307
x = 4
y = -8
persistent = 0

[State 1305, HitSound]
type = playsnd
trigger1 = numhelper(1306)
trigger1 = helper(1306), stateno = 1307
value = 2, 3
persistent = 0
[State 1305, Sparks]
type = explod
trigger1 = numhelper(1306)
trigger1 = helper(1306), stateno = 1307
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = 45, -29
removetime = -2
ownpal = 1
persistent = 0
pausemovetime = 100
supermovetime = 100
persistent = 0

[State 1305, punch]
type = changestate
trigger1 = (movecontact || movereversed) && animelemtime(5) >= 0 && var(31) < 3
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
value = 1305

[State 1305, back]
type = changestate
triggerall = var(31) < 3
trigger1 = animelemtime(8) >= 0 && (movecontact || movereversed)
trigger2 = animelemtime(8) >= 0 && numhelper(1306)
trigger2 = helper(1306), stateno = 1307
value = 1300

[State Idle]
type = statetypeset
trigger1 = var(31) >= 3 && animelemtime(4) >= 0
movetype = I

[State 1305, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 52


;--- LAND ---
[Statedef 1301]
type = S
physics = S
ctrl = 0
anim = 1301
velset = ifelse(vel x <= 0, 3, 1.5 * vel x), 0
[State 1301, Snd]
type = playsnd
trigger1 = time = 1
value = 4, 11
channel = 0
[State 1301, Snd]
type = playsnd
trigger1 = time = 1
value = 0, 101
[State 1301, Dust]
type = explod
trigger1 = !time
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1301, Dust]
type = explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 18, 0
vel = 2, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1301, Stop]
type = velset
trigger1 = 1
y = 0
[State 1301, Pos]
type = posset
trigger1 = 1
y = 0
[State 1301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CANCEL ---
[Statedef 1302]
type = A
physics = A
ctrl = 0
anim = 1302
velset = 0, 0
[State 1302, Snd]
type = playsnd
trigger1 = time = 1
value = 3, 7
channel = 0
