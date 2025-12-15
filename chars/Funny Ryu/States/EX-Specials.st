; ________________________________________
;| Ryu by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;===================================< EX SPECIAL STATES=========
;============================================================================================

;SHAKUNETSU/EX HADOU KEN
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

[State 1010, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1010, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1010, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1010, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1010, Hadouken]
type = helper
trigger1 = var(1)=1 && animelemtime(5) = 1
helpertype = normal
stateno = 1015
ID = 1015
name = "Hadouken"
postype = p1
pos = 80, -68
ownpal = 1

[State 1010, Hadouken]
type = helper
trigger1 = var(1)!=1 && animelemtime(5) = 1
helpertype = normal
stateno = 1017
ID = 1017
name = "Hadouken"
postype = p1
pos = 70, -68
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 2

[State 1010, snd]
type = playsnd
trigger1 = animelem = 3 && var(1) !=2
value = 4, 5
channel = 0
[State 1010, snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 2
value = 13, 3
channel = 0
[State 1010, snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;EX SHAKUNETSU HADOU KEN
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

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -51
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1020, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = 4

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 35

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1020, width]
type = width
trigger1 = animelemtime(9) = -1
value = 30, 0

[State 1020, Dust]
type = explod
trigger1 = animelem = 3 && var(10) > 1
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -3, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = ifelse(var(10) = 3, 0.9, 0.7), ifelse(var(10) = 3, 0.9, 0.7)
pausemovetime = -1
supermovetime = -1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 1035
ID = 1035
name = "Shakunetsu Hadouken"
postype = p1
pos = 68, -68
ownpal = 1
persistent = 0
size.xscale = 0.82
size.yscale = 0.82

[State 1020, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6005
ID = 6005
postype = p1
ownpal = 1
persistent = 0
size.xscale = 1
size.yscale = .95

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 13, 6
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 7
value = 13, 3
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;SHORYUU KEN
[Statedef 1110]
type = S
physics = S
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = -500
;juggle = ifelse((p2movetype = H && p2statetype = A), 7, 9)
facep2 = 1
sprpriority = 1
sprpriority = 1

[State 1110, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 16, -45
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1110, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1110, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 23

[State 1110, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1110, nothitby]
type = nothitby
trigger1 = anim = 1110 && animelemtime(4) < 3
value = SCA
time = 1

[State 1110, Vel]
type = velset
trigger1 = anim = 1110 && animelem = 4
x = 15
y = -12
[State 1110, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1110, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1110, snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 4
value = 0, 41
[State 1110, dust]
type = helper
trigger1 = anim = 1110 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1110, snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 3 && var(1) = 2
value = 14, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1110, snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 3 && var(1) != 2
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1110, hit 1]
type = hitdef
trigger1 = var(1)!= 1
trigger1 = !var(16) && !var(17) && (var(15) < 1 || var(20))
trigger1 = animelem = 2 && anim = 1110
ID = 1110
attr = S, SA
damage = ceil(ifElse(fvar(12) * 58 < 7, 7, fvar(12) * 58)), 8
;damage = 35, 8
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 18
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -53, -79)
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1.5, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -1.5, -8
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1110, hit 2]
type = hitdef
triggerall = animelem = 3 && anim = 1110
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger2 = !var(16) && (var(15) < 2 || var(20))
trigger2 = numtarget(1110)
ID = 1111
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1)!= 1, 50, 95) < 7, 7, fvar(12) * ifelse(var(1)!= 1, 50, 95))), ifelse(var(1)!= 1, 16, 8)
;damage = ceil(ifElse(fvar(12) * ifelse((var(1)!= 1 || var(14)), 50, 92) < 7, 7, fvar(12) * ifelse((var(1)!= 1 || var(14)), 50, 92))), ifelse(var(1)!= 1, 16, 8)
;damage = ifelse(var(1)!= 1, 68, 110), ifelse(var(1)!= 1, 16, 8)
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -53, -79)
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -13
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, 4, -4), -13
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1110, hit 2 alt]
type = hitdef
;trigger1 = !var(14)
trigger1 = !var(16) && ((var(15) > 0) && (var(15) < 3))
trigger1 = animelem = 3 && anim = 1110
trigger1 = (enemy, statetype = A) && (enemy, movetype = H)
trigger1 = !numtarget(1110)
ID = 1112
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1)!= 1, 42, 102) < 7, 7, fvar(12) * ifelse(var(1)!= 1, 42, 102))), ifelse(var(1)!= 1, 16, 8)
;damage = ifelse(var(1)!= 1, 68, 110), ifelse(var(1)!= 1, 16, 8)
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -53, -79)
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -13
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, 4, -4), -13
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1110, hit 3]
type = hitdef
trigger1 = !var(16) &&  (var(15) < 4 || var(20))
trigger1 = animelem = 4 && anim = 1110
trigger1 = (!numtarget(1112) && var(1) = 1)
trigger2 = !var(16) &&  (var(15) < 4 || var(20))
trigger2 = animelem = 4 && anim = 1110
trigger2 = var(1)!= 1
attr = A, SA
damage = ceil(ifElse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 8
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -106
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -13
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 5, 5, -5), -13
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 3160, fire]
;type = helper
;trigger1 = anim = 1110 && animelem = 4 && !numhelper(3165) && var(1) = 2
;helpertype = normal
;stateno = 3165
;ID = 3165
;name = "Metsu Shoryuu Fire"
;postype = p1
;ownpal = 1
;ignorehitpause = 1
;persistent = 0

[State 1110, statetype]
type = statetypeset
trigger1 = anim = 1110 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 1110, Anim]
type = changeanim
trigger1 = anim = 1110 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


;SHINKUU TATSUMAKI
[Statedef 1210]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = -500
;juggle = 8
facep2 = 1
sprpriority = 1

[State 1210, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1210, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -91
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1210, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1210, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1
[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
[State 1210, width]
type = width
trigger1 = anim = 1210 && movehit
edge = 50, 35
[State 1210, Push]
type = playerpush
trigger1 = anim = 1210
value = 0
ignorehitpause = 1

[State 1210, snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1 && var(1)!=2
value = 4, 7
channel = 0

[State 1210, snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1 && var(1) =2
value = 13, 5
channel = 0
[State 1210, snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 41
[State 1210, dust]
type = explod
trigger1 = anim = 1200 && animelem = 1
anim = 6022
ID = 6022
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.75, 0.75

[State 1210, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1210, Dust]
type = explod
triggerall = anim = 1210
trigger1 = animelem = 2 || animelem = 8 || animelem = 14
anim = 7104
ID = 7102
sprpriority = -2
postype = p1
pos = 0, floor(-pos y)
scale = 0.65, 0.65
ownpal = 1
removeonhit = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1210
[State 1210, Vel]
type = velset
trigger1 = prevstateno != 222
trigger1 = anim = 1200 && animelem = 1
x = 2.46
y = -3.9

[State 1210, Vel]
type = velset
trigger1 = anim = 1210 && prevstateno!= 222
x = 0
y = 1

[State 1210, Vel]
type = velset
trigger1 = anim = 1210 && prevstateno = 222
x = 0
y = -1.3

[State 1210, Vel]
type = velset
trigger1 = anim = 1205
x = -0.5
y = 5

[State 1210, Vel]
type = velset
trigger1 = anim = 1207
x = -1.5

[State 1210, spin]
type = playsnd
triggerall = anim = 1210
trigger1 = animelem = 1 || animelem = 7 || animelem = 13
value = 1, 6
channel = 1

[State 1210, dust]
type = explod
trigger1 = anim = 1210 && !(time % 6)
anim = 3206
ID = 3206
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = 1, 1
removetime = -2
ownpal = 1

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1210 && !animtime
;trigger1 = var(1) = 1 && anim = 1210 && !animtime
;trigger2 = var(1) != 1 && anim = 1210 && animelem = 15
value = ifelse(prevstateno = 222, 1205, 1207)
;elem = 4
persistent = 0
[State 1210, statetype]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(1) > 1
trigger2 = anim = 1205 && animelemtime(1) > 1
trigger3 = anim = 1207 && animelemtime(1) > 1
statetype = A
physics = A
[State 1210, statetype]
type = statetypeset
trigger1 = anim = 1210
statetype = A
physics = N

[State 1210, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 3+1*(numtarget(12102) || numtarget(1015)) || var(20))
trigger1 = var(1) = 1 && anim = 1210 && (animelem = 2 || animelem = 8 || animelem = 14)
trigger2 = !var(16) && (var(15) < 3+1*(numtarget(12102)) || var(20))
trigger2 = var(1) != 1 && anim = 1210 && (animelem = 2 || animelem = 8)
attr = A, SA
ID = 12101
;damage = ceil(ifElse(fvar(12) * ifelse(var(1) = 1, 17, 22) < 7, 7, fvar(12) * ifelse(var(1) = 1, 17, 22))), 7
damage = ceil(ifElse(fvar(12) *  22 < 7, 7, fvar(12) *  22)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 12, 11), 0;ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.type = Low
air.velocity = ifelse(p2dist x > 30, 8, 6), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -7, -5) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = prevstateno = 222
air.fall = 1
fall.recover = 0
sprpriority = -1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1210, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 3+2*(numtarget(12101) || numtarget(1015)) || var(20))
trigger1 = anim = 1210 && (animelem = 5 || animelem = 11)
attr = A, SA
ID = 12102
;damage = ceil(ifElse(fvar(12) * ifelse(var(1) = 1, 17, 22) < 7, 7, fvar(12) * ifelse(var(1) = 1, 17, 22))), 7
damage = ceil(ifElse(fvar(12) * 22 < 7, 7, fvar(12) *  22)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -12, -11), 0;ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.type = Low
air.velocity = ifelse(p2dist x > 30, -8, -6), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -7, -5) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = prevstateno = 222;ifelse((anim = 1210 && animelem = 11), 1, 0);1
air.fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 1210, hit final norm]
;type = hitdef
;trigger1 = P2Dist x >= 0
;trigger1 = !var(16) && (var(15) < 6 || var(20))
;trigger1 = var(1)=1 && anim = 1210 && animelem = 17
;attr = A, SA
;damage = ceil(ifElse(fvar(12) * 28 < 7, 7, fvar(12) * 28)), 7
;animtype = Diagup
;air.animtype = Diagup
;fall.animtype = Diagup
;guardflag = MA
;hitflag = MAF
;priority = 4, Hit
;pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
;hitSound = -1 + 0 * (var(31) := 6)
;guardSound = -1 + 0 * (var(32) := 0)
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;p2facing = 1
;ground.velocity = ifelse(p2dist x < 0, 6.45, -6.45), ifelse(p2dist x < 0, -4.45, -5.95)
;air.type = Low
;air.velocity = ifelse(p2dist x < 0, 6.45, -6.45), ifelse(p2dist x < 0, -4.45, -5.95)
;air.cornerpush.veloff = 0
;ground.cornerpush.veloff = 0
;guard.velocity = -10.52
;guard.cornerpush.veloff = 0;-12.74
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 4
;fall = 1
;fall.recover = 0
;sprpriority = 1
;yaccel = 0.4
;airguard.ctrltime = 16
;airguard.cornerpush.veloff = 0
;airguard.velocity = ifelse(var(20), -4, -8), -1.5
;forcestand = 1
;sparkNo = -1 + 0 * (var(33) := 8013)
;guard.sparkNo = -1 + 0 * (var(34) := 8001)
;sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
;palFX.time = 12 * var(29)
;palFX.add = 255,255,255
;palFX.sinAdd= -255,-255,-255,48

;[State 1210, hit final norm]
;type = hitdef
;trigger1 = P2Dist x < 0
;trigger1 = !var(16) && (var(15) < 6 || var(20))
;trigger1 = var(1) = 1 && anim = 1210 && animelem = 17
;attr = A, SA
;damage = ceil(ifElse(fvar(12) * 28 < 7, 7, fvar(12) * 28)), 7
;animtype = Diagup
;air.animtype = Diagup
;fall.animtype = Diagup
;guardflag = MA
;hitflag = MAF
;priority = 4, Hit
;pausetime = 5, 0
;hitSound = -1 + 0 * (var(31) := 6)
;guardSound = -1 + 0 * (var(32) := 0)
;ground.type = High
;ground.slidetime = 16
;ground.hittime = 16
;p2facing = 1
;ground.velocity = ifelse(p2dist x < 0, 6.45, -6.45), ifelse(p2dist x < 0, -4.45, -5.95)
;air.type = Low
;air.velocity = ifelse(p2dist x < 0, 6.45, -6.45), ifelse(p2dist x < 0, -4.45, -5.95)
;air.cornerpush.veloff = 0
;ground.cornerpush.veloff = 0
;guard.velocity = -10.52
;guard.cornerpush.veloff = 0;-12.74
;getpower = 0
;givepower = 36, 36
;envshake.time = 16
;envshake.freq = 120
;envshake.ampl = 4
;fall = 1
;fall.recover = 0
;sprpriority = 1
;yaccel = 0.4
;airguard.ctrltime = 16
;airguard.cornerpush.veloff = 0
;airguard.velocity = ifelse(var(20), -4, -8), -1.5
;forcestand = 1
;sparkNo = -1 + 0 * (var(33) := 8013)
;guard.sparkNo = -1 + 0 * (var(34) := 8001)
;sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
;palFX.time = 12 * var(29)
;palFX.add = 255,255,255
;palFX.sinAdd= -255,-255,-255,48

[State 1210, hit final evil]
type = hitdef
triggerall = P2Dist x >= 0
;triggerall = var(1) > 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = anim = 1210 && (animelem = 14 || animelem = 17)
trigger2 = !var(16) && (var(15) < 6 || var(20))
trigger2 = anim = 1210 && animelem = 14
attr = A, SA
damage = ceil(ifElse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x < 0, 5.45, -5.45), -6.45
air.type = Low
air.velocity = ifelse(p2dist x < 0, 5.45, -5.45), -6.45
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1210, hit final evil]
type = hitdef
triggerall = P2Dist x < 0
;triggerall = var(1) > 1
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = anim = 1210 && (animelem = 14 || animelem = 17)
trigger2 = !var(16) && (var(15) < 6 || var(20))
trigger2 = anim = 1210 && animelem = 17
attr = A, SA
damage = ceil(ifElse(fvar(12) * 35 < 7, 7, fvar(12) * 35)), 7
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x < 0, 5.45, -5.45), -6.45
air.type = Low
air.velocity = ifelse(p2dist x < 0, 5.45, -5.45), -6.45
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State Idle]
type = statetypeset
trigger1 = anim = 1207
movetype = I


;KUUCHUU SHINKUU TATSUMAKI
[Statedef 1260]
type = A
physics = A
movetype = A
anim = 1260
ctrl = 0
poweradd = -500
;juggle = 7
sprpriority = 1

[State 1260, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1260, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1260, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1210, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1260, width]
type = width
trigger1 = movehit
edge = 50, 35
[State 1260, Push]
type = playerpush
trigger1 = animelemtime(3)>0 && animelemtime(22) < 0
value = 0
[State 1260, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
[State 1260, slow]
type = velmul
trigger1 = animelemtime(4) >= 0 && animelemtime(22) < 0 && vel y > 0
x = 0.75
y = 0.66
[State 1260, slow]
type = velset
trigger1 = animelemtime(14) < 0 && pos y >= -10
x = 0
y = 0
[State 1210, snd]
type = playsnd
trigger1 = anim = 1260 && animelem = 1 && var(1)!=2
value = 4, 7
channel = 0

[State 1210, snd]
type = playsnd
trigger1 = anim = 1260 && animelem = 1 && var(1) =2
value = 13, 5
channel = 0

[State 1260, spin]
type = playsnd
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22
value = 1, 6
channel = 1

[State 1260, dust]
type = explod
trigger1 = animelemtime(4) >= 0 && animelemtime(22) < 0 && !(time % 6)
anim = 3206
ID = 3206
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = ifelse(pos y < -120, 0.5, ifelse(pos y < -60, 0.75, 1)), ifelse(pos y < -120, 0.5, ifelse(pos y < -60, 0.75, 1))
removetime = -2
ownpal = 1

[State 1260, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 5 || animelem = 11
attr = A, SA
damage = ceil(ifElse(fvar(12) * 27 < 7, 7, fvar(12) * 27)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 9, 8) -vel x, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -3, -6)
air.type = Low
air.velocity = ifelse(p2dist x > 20, 10, 7) -vel x, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -3, -6) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = -1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1260, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = animelem = 8 || animelem = 14
attr = A, SA
damage = ceil(ifElse(fvar(12) * 27 < 7, 7, fvar(12) * 27)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -9, -8) -vel x, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -3, -6)
air.type = Low
air.velocity = ifelse(p2dist x > 20, -10, -7) -vel x, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, -3, -6) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1260, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 =  animelem = 17
attr = A, SA
damage = ceil(ifElse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -6, -4
air.type = Low
air.velocity = -6, -4
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1260, hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 =  animelem = 20
attr = A, SA
damage = ceil(ifElse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = 8, -4
air.type = Low
air.velocity = 8, -4
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1260, afterimageoff]
type = afterimagetime
trigger1 = animelemtime(22) >= 0
time = 0
[State 1260, palfxoff]
type = palfx
trigger1 = animelemtime(22) >= 0
time = 1
mul = 256, 256, 256

[State Idle]
type = statetypeset
trigger1 = animelemtime(21) >= 0
movetype = I


;JOUDAN SOKUTOU GERI
[Statedef 1310]
type = S
physics = S
movetype = A
anim = 1301
ctrl = 0
velset = 0, 0
poweradd = -500
;juggle = ifelse((p2movetype = H && p2statetype = A), 7, 0)
facep2 = 1
sprpriority = 1

[State 1310, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1310, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 27

[State 1310, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1310, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -61
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1310, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1310, Vel]
type = velset
trigger1 = (anim = [1301, 1302]) && animelemtime(4) < 0
trigger2 = anim = 1300 && animelemtime(2) < 0
x = 6.5

[State 1310, snd]
type = playsnd
trigger1 = animelem = 6
value = 3, 4
channel = 0
[State 1310, snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 6
channel = 1
[State 1310, snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 100

[State 1310, hit]
type = hitdef
trigger1 = !time
trigger1 = !var(16) && (var(15) < 3 || var(20))
ID = 1310
attr = S, SA
damage = ceil(ifElse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12 / ((var(20) > 0) + 1), 12 / ((var(20) > 0) + 1)
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -12, -6
air.type = Low
air.velocity = -12, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
p2facing = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
fall = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1310) && var(14) < 3
trigger1 = (target(1310), stateno = 5000) || (target(1310), stateno = 5010) || (target(1310), stateno = 5020)
value = 1111300
ID = 1310
ignorehitpause = 1

[State 1310, Pos]
type = posadd
trigger1 = animelem = 10 || animelem = 11
x = ifelse((animelem = 10), 15, 10)
[State 1310, Pos]
type = posadd
trigger1 = !animtime
x = 5
[State 1310, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

[State 1310, Juggle Points Reset]
type = VarSet
trigger1 = var(14) < 2
trigger1 = var(15) < 2
trigger1 = MoveHit && NumTarget(1310)
var(15) = 0

[State 1310, Normal Juggle Limit]
type = VarSet
trigger1 = (movehit = 1 && numtarget(1310))
var(27) = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I



;RYUSOKYAKU
[Statedef 1510]
type = S
physics = S
movetype = A
anim = 1503
ctrl = 0
velset = 0, 0
poweradd = -500
;juggle = ifelse((p2movetype = H && p2statetype = A), 7, 0)
facep2 = 1
sprpriority = 1

[State 1510, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4

[State 1510, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 32

[State 1510, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1510, Vel]
type = velset
trigger1 = anim = 1503 && animelemtime(5) < 0
x = 3

[State 1510, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -61
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1300, Snd]
type = playsnd
trigger1 = anim = 1503 && animelem = 9
value = 1, 6
channel = 1
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1503 && animelem = 9
value = 13, 2
channel = 0
;
[State 1510, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = anim = 1503 && animelem = 10 && (enemynear, statetype!= A)
trigger1 = !numtarget(15000) || !numtarget(15100)
ID = 15100
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(enemynear, statetype = L, 65, 135) < 7, 7, fvar(12) * ifelse(enemynear, statetype = L, 65, 135))), 15
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = H
hitflag = MAFD
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(p2statetype=A, 5,ifelse(var(20), 4, 8))
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -16
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -2, 0;10
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.velocity = -vel x, 15
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 4;-12.74
fall.yvelocity = 0
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 0
down.hittime = 20
down.velocity = 0, 0
down.bounce = 1
hitonce = 1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 111), var(36) := -7
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1510, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(15100)
trigger1 = !(Target(15100), Time)
trigger1 = (Target(15100), StateNo = 5000) || (Target(15100), StateNo = 5010)
value = 1111500
ID = 15100
ignoreHitPause = 1

[State 1303, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = anim = 1503 && animelem = 9 && (enemynear, statetype = A)
trigger1 = !numtarget(15000) || !numtarget(15100)
ID = 15000
attr = S, SA
damage = ceil(ifElse(fvar(12) * 120 < 7, 7, fvar(12) * 120)), 15
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = H
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 4
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -16
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -2, 10
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.velocity = -vel x, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 4;-12.74
fall.yvelocity = 0
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 0
down.hittime = 20
down.velocity = 0, 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 111), var(36) := -55
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1510, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(15000)
trigger1 = !(Target(15000), Time)
trigger1 = (Target(15000), Stateno = 5020)
value = 1111500
ID = 15000
ignoreHitPause = 1

[State 1510, Shake]
type = envshake
trigger1 = anim = 1503 && animelemtime(10) >= 0 && animelemtime(11) <= 20
trigger1 = !(animelemtime(10) % 5)
time = 4
freq = 100
ampl = 6 -ceil(animelemtime(8) * 0.25)
ignorehitpause = 1

[State 1510, Snd]
type = playsnd
trigger1 = anim = 1503 && animelem = 10
value = 5, 3
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 4
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
pos = -36, -52
ownpal = 1
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 5
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.75, 0.75
pos = -32, -83
ownpal = 1
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 6
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.6, 0.6
pos = -20, -112
ownpal = 1
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 7
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.35, 0.35
pos = 0, -121
ownpal = 1
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 10
anim = 7160;7107
ID = 7160
sprpriority = 2
postype = p1
pos = 47, 0
scale = 0.38, 0.38;0.38, 0.2
ownpal = 1
[State 1510, Dust]
type = explod
trigger1 = anim = 1503 && animelem = 10
anim = 7240;7107
ID = 7240
sprpriority = 2
postype = p1
pos = 47, 0
scale = 0.5, 0.5;0.38, 0.2
ownpal = 1
[State 1510, fire]
type = helper
trigger1 = anim = 1503 && animelem = 9
helpertype = normal
stateno = 6150
ID = 6150
name = "Ryusokyaku Fire"
postype = p1
ownpal = 1
ignorehitpause = 1
persistent = 0
xscale = 0.5
yscale = 0.5

[State 1510, Pos]
type = posadd
trigger1 = (anim = 1503 && animelem = 6)
x = 10
[State 1500, Pos H]
type = posadd
trigger1 = (anim = 1503 && (animelem = 9 || animelem = 10))
x = ifelse((anim =1503 && animelem = 9), 12, 13)
[State 1500, Pos]
type = posadd
trigger1 = (anim = 1503 && animelem = 13)
x = 2
[State 1500, Pos]
type = posadd
trigger1 = (anim = 1503 && (animelem = 14 || animelem = 15))
x = 4

[State Idle]
type = statetypeset
trigger1 = anim = 1503 && animelemtime(12) >= 0
movetype = I

[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

