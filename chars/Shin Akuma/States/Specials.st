; ________________________________________
;| Gouki by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES >===
;====

;==< HADOU KEN >=
[Statedef 1000]
type = S
physics = S
movetype = A
anim = ifelse(var(1), 1010, 1000)
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1000, Hadouken]
type = helper
trigger1 = var(1)!= 1
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 70, -68
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1000, Hadouken]
type = helper
trigger1 = var(1) = 1
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 80, -68
ownpal = 1
size.xscale = 0.65
size.yscale = 0.65

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 3
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SHAKUNETSU HADOU KEN >=
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020 + var(1)
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1020, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "hcbz", 3, ifelse(command = "hcby", 2, 1));(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1020, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

[State 1020, width]
type = width
trigger1 = animelemtime(10) = -1
value = 30, 0

[State 1020, Anim]
type = changeanim
trigger1 = var(10) = 1 && animelem = 5
trigger2 = var(10) = 2 && animelem = 7
value = 1020 + var(1)
elem = 9
persistent = 0

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
trigger1 = var(1)!= 1
trigger1 = animelem = 10
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 68, -68
ownpal = 1
persistent = 0
size.xscale = 0.75
size.yscale = 0.75

[State 1020, Hadouken]
type = helper
trigger1 = var(1) = 1
trigger1 = animelem = 10
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 68, -68
ownpal = 1
persistent = 0
size.xscale = 0.85
size.yscale = 0.85

[State 1020, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
size.xscale = 1
size.yscale = .95

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 10
value = 3, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;==< ZANKUU HADOU KEN >=
[Statedef 1050]
type = A
physics = N
movetype = A
anim = ifelse((!var(1) && var(42) || var(1) && (!var(43) || var(43))),1060,1050)
ctrl = 0
poweradd = 72 * !var(20)
sprpriority = 1

[State 1050, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1050, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 3, ifelse(random < 500, 2, 1))

[State 1050, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 1060 && (!var(1) && var(42) || var(1) && var(43))
physics = A
ignorehitpause = 1

[State 1050, width]
type = width
trigger1 = anim = 1050;var(1)!= 1
trigger1 = animelemtime(2) = -1 || animelemtime(5) = -1
value = 27, 0

[State 1050, width]
type = width
trigger1 = anim = 1060;var(1) = 1
trigger1 = animelemtime(3) = -1 || animelemtime(6) = -1
value = 27, 0

[State 1050, PosFreeze]
type = PosFreeze
trigger1 = anim = 1050;var(1)!= 1
trigger1 = animelemtime(3) < 0

[State 1050, Velocity]
type = VelAdd
trigger1 = anim = 1050;var(1)!= 1
trigger1 = animelemtime(3) = 0
y = -.15*const(size.yscale)

[State 1050, Gravity]
type = veladd
trigger1 = anim = 1050;var(1)!= 1
trigger1 = animelemtime(4) >= 0
y = .5*const(size.yscale)

;[State 1050, PosFreeze]
;type = PosFreeze
;trigger1 = var(1) = 1
;trigger1 = animelemtime(4) < 0
;
;[State 1050, Velocity]
;type = VelSet
;trigger1 = var(1) = 1
;trigger1 = animelemtime(4) = 0
;x = (vel X)*.85
;
;[State 1050, Velocity]
;type = VelAdd
;trigger1 = var(1) = 1
;trigger1 = animelemtime(4) = 0
;y = -0.15*const(size.yscale)

[State 1050, PosFreeze]
type = PosFreeze
trigger1 = anim = 1060 && !var(43) && var(1)
trigger1 = animelemtime(4) < 0

[State 1050, Velocity]
type = VelSet
trigger1 = anim = 1060 && !var(43) && var(1)
trigger1 = animelemtime(4) = 0
x = (vel X)*.85

[State 1050, Velocity]
type = VelAdd
trigger1 = anim = 1060 && !var(43) && var(1)
trigger1 = animelemtime(4) = 0
y = -0.15*const(size.yscale)

[State 1050, Gravity]
type = veladd
trigger1 = anim = 1060 && !var(43) && var(1)
trigger1 = animelemtime(5) >= 0
y = .5

[State 1050, Hadouken]
type = helper
trigger1 = !var(1) && !var(42)
trigger1 = animelem = 5;animelem = 2 || animelem = 5
helpertype = normal
stateno = 1055
ID = 1055
name = "Hadouken"
postype = p1
pos = 67, -48
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1050, Hadouken]
type = helper
trigger1 =  var(1) && !var(43)
trigger1 = animelem = 6
helpertype = normal
stateno = 1065
ID = 1065
name = "Hadouken"
postype = p1
pos = 54, -60
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1050, Hadouken]
type = helper
trigger1 =  var(1) && !var(43)
trigger1 = animelem = 3
helpertype = normal
stateno = 1055
ID = 1055
name = "Hadouken"
postype = p1
pos = 54, -48
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1050, Hadouken]
type = helper
trigger1 = var(1) && var(43)
trigger1 = animelem = 3
helpertype = normal
stateno = 1055
ID = 1055
name = "Hadouken"
postype = p1
pos = 67, -48
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1050, Hadouken]
type = helper
trigger1 = (!var(1) && var(42) || var(1) && var(43))
trigger1 = animelem = 6
helpertype = normal
stateno = 1055
ID = 1055
name = "Hadouken"
postype = p1
pos = 54, -48
ownpal = 1
size.xscale = 0.6
size.yscale = 0.6

[State 1050, Snd]
type = playsnd
trigger1 = !var(1) && !var(42);var(1)!= 1
trigger1 = animelem = 5;animelem = 2 || animelem = 5
value = 3, 10
channel = 0
[State 1050, Snd]
type = playsnd
trigger1 = !var(1) && !var(42);var(1)!= 1
trigger1 = animelem = 5;animelem = 2 || animelem = 5
value = 5, 0
channel = 1

[State 1050, Snd]
type = playsnd
trigger1 = !var(1) && var(42);var(1) = 1
trigger1 = animelem = 6
value = 3, 10
channel = 0
[State 1050, Snd]
type = playsnd
trigger1 = !var(1) && var(42);var(1) = 1
trigger1 = animelem = 6
value = 5, 0
channel = 1

[State 1050, Snd]
type = playsnd
trigger1 = var(1);var(1) = 1
trigger1 = animelem = 3 || animelem = 6
value = 3, 10
channel = 0
[State 1050, Snd]
type = playsnd
trigger1 = var(1);var(1) = 1
trigger1 = animelem = 3 || animelem = 6
value = 5, 0
channel = 1

[State 1050]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
movetype = I

[State 1050, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;==< GOU SHORYUU KEN >=
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
;juggle = ifelse((p2movetype = H && p2statetype = A), 7, 9)
facep2 = 1
sprpriority = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(((p2movetype = H && p2statetype = A) || prevstateno = 750), 3, 1)

;[State 1100, nothitby]
;type = nothitby
;trigger1 = var(10)<2 && anim = 1100 && animelemtime(4) < 0 && prevstateno != 750
;trigger2 = var(10)=3 && anim = 1100 && animelemtime(4) < 0 && prevstateno != 750
;value = SCA
;time = 1
;ignorehitpause = 1

[State 1100, NotHitBy]
type = NotHitBy
triggerall = prevstateno != 750
triggerall = anim = 1100
trigger1 = AnimElemTime(4) < 0 && var(10) = 1
trigger2 = AnimElemTime(4) < 3 && var(10) = 2
trigger3 = AnimElemTime(3) < 0 && var(10) = 3
value = SCA
time = 1

[State 1100, HitBy]
type = HitBy
triggerall = prevstateno != 750
triggerall = anim = 1100
trigger1 = AnimElemTime(3) > 0 && AnimElemTime(4) < 0 && var(10) = 1
trigger2 = AnimElemTime(3) > 0 && AnimElemTime(4) < 3 && var(10) = 2
trigger3 = AnimElemTime(2) > 0 && AnimElemTime(3) < 0 && var(10) = 3
value = SCA,NP,SP,HP,NT,ST,HT,
time = 1

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 1
value = SCA
time = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 4
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))
[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0
[State 1100, PosAdd]
type = PosAdd
trigger1 = !time
trigger1 = prevstateno = 210 && anim = 211
x = 8
[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, ifelse(var(10) = 3, 41, 40)
[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 3160, fire]
type = helper
triggerall = var(10) = 3
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 3165
ID = 3165
name = "Metsu Shoryuu Fire"
postype = p1
ownpal = 1
pos = 20,110
ignorehitpause = 1
persistent = 0
size.xscale = .12
size.yscale = .3
[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 3, 9
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, HP Hit 1]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(1)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 3 && animelem = 2 && anim = 1100
trigger2 = var(1)
trigger2 = !var(16) && (var(15) < 2 || var(20))
trigger2 = var(10) = 3 && animelem = 2 && anim = 1100
trigger2 = !numtarget(1101)
attr = S, SA
;damage = 45,7;ifelse((animelem = 3), 27, 60 + 7 * var(10)), 7
damage = ceil(ifelse(fvar(12) * 70 < 7, 7, fvar(12) * 70)), 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 5, 11)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -52, -75)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1.5, 0;-5.5
air.type = Low
air.velocity = -1, -5.8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, LP Hit]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(1)
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1 && animelem = 3 && anim = 1100
trigger2 = var(1)
trigger2 = !var(16) && (var(15) < 2 || var(20))
trigger2 = var(10) = 1 && animelem = 3 && anim = 1100
ID = 1101
attr = S, SA
;damage = ifelse(var(20), 60 + var(10) * 7, 118 - (var(1)*40)), 7
damage = ceil(ifelse(fvar(12) * 110 < 7, 7, fvar(12) * 110)), 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -52, -79)
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -7.65-var(1)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -3, -8.65-var(1)
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
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

[State 1100, MP/HP Hit 2]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(1) && var(10) = 2 && !numtarget(1101)
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = var(10)!=1 && animelem = 3 && anim = 1100
trigger2 = !var(1) && var(10) = 3 ;&& !numtarget(1101)
trigger2 = !var(16) && (var(15) < 3 || var(20))
trigger2 = var(10)!=1 && animelem = 3 && anim = 1100
trigger3 = var(1)
trigger3 = !var(16) && (var(15) < (var(10) + var(1)) || var(20))
trigger3 = var(10)!=1 && animelem = 3 && anim = 1100
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 38, ifelse(var(15)>=1, 58, 70)) < 7, 7, fvar(12) * ifelse(var(10) = 3, 38, ifelse(var(15)>=1, 58, 70)))), 7
;damage = ifelse(var(20) || var(17), ifelse(var(10)=2,46,28), ifelse(var(10)=2,92,56)), 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((animelem = 2), -52, -79)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2.3, -11
guard.cornerpush.veloff = 0
guard.velocity = -15.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, hit high]
type = hitdef
triggerall = prevstateno!= 750
triggerall = !var(16) && (var(15) < ((var(10) + var(1))) || var(20))
trigger1 = var(10)>1 && animelem = 4 && anim = 1100
trigger2 = var(10)=1 && animelem = 4 && anim = 1100
trigger2 = !movecontact && !movereversed
attr = A, SA
;damage = 21 + var(10) * 7, 7
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 38, ifelse(var(10) = 2, 58, 70)) < 7, 7, fvar(12) * ifelse(var(10) = 3, 38, ifelse(var(10) = 2, 58, 70)))), 7
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -106
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8.35))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
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
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, ZC Hit]
type = hitdef
triggerall = prevstateno = 750
trigger1 = anim = 1100
trigger1 = animelem = 3
trigger2 = anim = 1100 && animelem = 4
trigger2 = !movecontact && !movereversed
attr = S, SA
damage = ceil(ifElse(fvar(12) * 43 < 7, 7, fvar(12) * 43)), 7
;damage = 43, 7
animtype = Diagup
air.animType = DiagUp
fall.animType = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -12
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -12
guard.cornerpush.veloff = 0
guard.velocity = -15.52
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, VarAdd]
type = VarAdd
triggerall = anim = 1100
trigger1 = var(27) && var(10) = 1
trigger1 = (numtarget && movehit)
var(15) = 3 - var(1)
persistent = 0

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

;==< TATSUMAKI ZANKUU KYAKU >=
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
;juggle = 8
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2movetype = H, 3, 1)

[State 1200, nothitby]
type = nothitby
trigger1 = anim = 1200 && animelemtime(2) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 3, 11
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 40
[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = A
[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 3.5
y = -4
[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 3.5
y = 0

[State 1200, spin]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1201 && ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Hit]
type = hitdef
trigger1 = var(10) > 1
trigger1 = !var(16) && (var(15) < var(10) || var(20))
trigger1 = anim = 1200 && animelemtime(2) = -1
ID = 1200
attr = S, SA
damage = ceil(ifelse(fvar(12) * 42 < 7, 7, fvar(12) * 42)), 7
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, ifelse(!var(1) && (p2movetype = H && p2statetype = A), 8, 14))
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, ifelse((anim = 1200), -62, -69)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, 0 + (var(1)*-8);-8
air.type = Low
air.velocity = -2.5, ifelse(var(10)>1 && numtarget(1201), -9.26, -6.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = var(1)
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, Hit A.1]
type = hitdef
triggerall = P2Dist x >= 0
triggerall = !var(16) && (var(15) < ifelse(var(10) = 1, 1, var(10) + var(1)) || var(20))
trigger1 = var(10) = 1 && anim = 1201 && animelem = 2 && !var(27)
trigger2 = var(10) = 2 && anim = 1201 && (animelem = 2 || animelem = 8)
trigger3 = var(10) = 3 && anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20)
ID = 1201
attr = A, SA
damage = ceil(ifelse(fvar(12) * 42 < 7, 7, fvar(12) * 42)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10)!=1, -3.34, -1.55), ifelse((movehit && numtarget(1200)) && var(10)!=1, -9.44, ifelse(var(10)!=1, -8, -6.71))
air.type = Low
air.velocity = ifelse(movehit && numtarget(1200), -2.5 - var(15), ifelse(var(1) && var(10)=1, -2.55, -4.35)), ifelse(var(10)=3, -4.38, -5.5-var(1))
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = ifelse(var(10) > 1, 1, 0)
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, hitb]
type = hitdef
triggerall = P2Dist x < 0
trigger1 = !var(16) && (var(15) < (1 + var(1)) || var(20))
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23)
attr = A, SA
damage = ceil(ifelse(fvar(12) * 42 < 7, 7, fvar(12) * 42)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2.5, -8
air.type = Low
air.velocity = 2.5, -6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, VarSet]
type = VarAdd
trigger1 = var(10) > 1 && var(27) ;&& var(10)!= 1
trigger1 = numtarget(1200) || numtarget(1250)
trigger1 = (p2movetype = H && p2statetype = A)
;trigger2 = var(10) = 1 && var(27)
;trigger2 = numtarget(1250)
;trigger2 = (p2movetype = H && p2statetype = A)
trigger2 = var(10) = 1
trigger2 = numtarget(3300)
trigger2 = (p2movetype = H && p2statetype = A)
var(15) = 1
persistent = 0

[State 1200, VarSet]
type = VarSet
trigger1 = var(27) < 1
trigger1 = var(10) = 1 && (movehit = 1 && numtarget)
var(15) = 0

[State 1200, VarSet]
type = VarSet
trigger1 = var(27) < 1
trigger1 = var(10) = 2 && (movehit = 1 && numtarget(1201))
var(15) = 1

[State 1200, VarSet]
type = Varadd
trigger1 = var(10) = 1 && (movehit = 1 && numtarget)
var(27) = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I

;==< KUUCHUU TATSUMAKI ZANKUU KYAKU >=
[Statedef 1250]
type = A
physics = A
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 72 * !var(20)
;juggle = 7
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1250, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

;[State 1250, slow]
;type = veladd
;trigger1 = 1
;y = -const(movement.yaccel) * 0.33

[State 1250, veladd]
type = veladd
trigger1 = AnimElem = 1
x = ifElse(vel x >= 0, 0.8, -0.8)
y = ifElse(vel y <= 0, (-2 - var(10)) * 0.225, (2 + var(10))* 0.2)

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 11
channel = 0

[State 1250, spin]
type = playsnd
trigger1 = !(animelemtime(4) % 9)
value = 1, 6
channel = 1

[State 1250, Hit]
type = hitdef
triggerall = P2Dist x >= 0
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
ID = 1250
attr = A, SA
damage = ceil(ifelse(fvar(12) * 42 < 7, 7, fvar(12) * 42)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.55, -7
air.type = Low
air.velocity = -2.25, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
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
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1250, hitb]
type = hitdef
triggerall = P2Dist x < 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
ID = 1250
attr = A, SA
damage = ceil(ifelse(fvar(12) * 42 < 7, 7, fvar(12) * 42)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2.35, -5
air.type = Low
air.velocity = 2.35, -5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
yaccel = 0.5
forcestand = 1
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 1200, VarSet]
;type = VarAdd
;triggerall = var(27)
;trigger1 = hitcount > 1 && numtarget(1250)
;trigger1 = (p2movetype = H && p2statetype = A)
;var(15) = 1
;persistent = 0

[State 1250, VarSet]
type = VarSet
trigger1 = var(27) < 1
trigger1 = (movehit = 1 && numtarget)
trigger1 = hitcount < 2
var(15) = 0

[State 1250, VarSet]
type = Varadd
trigger1 = (movehit = 1 && numtarget)
trigger1 = hitcount < 2
var(27) = 1

[State 1250, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1250 && animelem = 16
value = 1250
elem = 28

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I


;==< HYAKKI SHU >=
[Statedef 1300]
type = A
physics = N
movetype = I
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 1300, Accel]
type = gravity
trigger1 = animelemtime(1) > 1
[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "dfc", 3, ifelse(command = "dfb", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2dist x >= 180, 3, ifelse(p2dist x >= 100, 2, 1))

[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 0, 40
[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 3, 1
channel = 0
[State 1300, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1300, Vel]
type = velset
trigger1 = var(1)!= 1
trigger1 = animelem = 1
x = ifelse(var(10) = 3, 5.13, ifelse(var(10) = 2, 3.6, 1.8))
y = -9

;[State 0, VelMul]
;type = Veladd
;trigger1 = var(1) = 1
;trigger1 = vel y < -6
;x = 0.332
;
;[State 0, VelMul]
;type = Veladd
;trigger1 = var(1) = 1
;trigger1 = vel y > 0
;x = -0.222

[State 0, VelMul]
type = Velset
trigger1 = var(1) = 1
trigger1 = animelem = 1
x = ifelse(var(10) = 3, 5.13, ifelse(var(10) = 2, 3.6, 1.8))
y = -14.2

[State 0, VelMul]
type = Veladd
trigger1 = var(1) = 1
trigger1 = vel y < 0
;x = 0.1
y = 0.5

[State 1300, goudan]
type = changestate
triggerall = var(1) = 1
trigger1 = !AIlevel && vel y > -3 && command = "holdup"
trigger1 = command = "a" || command = "rlsa" || command = "b" || command = "rlsb" || command = "c" || command = "rlsc"
trigger2 = AIlevel && vel y > -3 && (p2dist x = [0, 60]) && p2dist y >= -75 && (random < 333 || p2movetype = A)
value = 1303

[State 1300, goushou]
type = changestate
trigger1 = !AIlevel && vel y > (-2-var(1)) && (command = "x" || command = "y" || command = "z" || command = "rlsx" || command = "rlsy" || command = "rlsz")
trigger2 = AIlevel && vel y > (-2-var(1)) && (p2dist x = [0, 90]) && p2dist y >= -60 && (random < 333 || p2movetype = A)
value = 1301

[State 1300, goujin]
type = changestate
trigger1 = !AIlevel && vel y > (-2-var(1))
trigger1 = command = "a" || command = "rlsa" || command = "b" || command = "rlsb" || command = "c" || command = "rlsc"
trigger2 = AIlevel && vel y > (-2-var(1)) && (p2dist x = [0, 120]) && p2dist y >= 0 && (random < 333 || p2movetype = A)
value = 1302

[State 1300, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -30
value = 1305


;=< HYAKKI GOU SHOU >==
[Statedef 1301]
type = A
movetype = A
physics = A
anim = 1301
poweradd = ifelse(prevstateno = 1310,0,72 * !var(20))
sprpriority = 1
ctrl = 0

[State 1301, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1
[State 1301, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 8
channel = 0

[State 1301, hitgrabp]
type = hitdef
trigger1 = !time
trigger1 = !var(38)
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = p2statetype != A
attr = A, ST
hitflag = M
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1350
fall = 1
fall.recover = 0

[State 1301, Hit]
type = hitdef
trigger1 = (!var(1) && var(10)!= 4) || var(1)
trigger1 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger1 = animelem = 6
ID = 1301
attr = A, SA
damage = ceil(ifelse(fvar(12) * 85 < 7, 7, fvar(12) * 85)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -54
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -65
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.5, 18
air.type = Low
air.velocity = -2.5, 18
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(prevstateno = 1310, 0, ifelse(p2movetype = H, 72, 144) * !var(20)), 36 * !var(20)
givepower = ifelse(prevstateno = 1310, 0, 36), 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1310, Hit]
type = hitdef
trigger1 = !var(1) && var(10) = 4
trigger1 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger1 = animelem = 6
trigger2 = var(1) && var(29)
trigger2 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger2 = animelem = 6
ID = 1310
attr = A, SA
damage = ceil(ifelse(fvar(12) * 50 < 7, 7, fvar(12) * 50)), 9
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 6
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -54
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -65
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 25
air.type = Low
air.velocity = -2, 25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(prevstateno = 1310, 0, ifelse(p2movetype = H, 72, 144) * !var(20)), 36 * !var(20)
givepower = ifelse(prevstateno = 1310, 0, 36), 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
airguard.cornerpush.veloff = 0
p2facing = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1310, p2state]
type = targetstate
trigger1 = (!var(1) && var(10) = 4) || var(1)
trigger1 = movehit && numtarget(1310)
trigger1 = (target(1310), stateno = 5000) || (target(1310), stateno = 5010) || (target(1310), stateno = 5020)
value = 1111310
ID = 1310
ignorehitpause = 1

[State 1301, VarSet]
type = Varadd
trigger1 = (!var(1) && var(10) = 4) || var(1)
trigger1 = (movehit = 1 && numtarget(1310))
var(27) = 1

[State 4100, Dust]
type = explod
trigger1 = !var(1) && (movehit && numtarget(1301))
trigger1 = (target, movetype = H) && !(target, time)
trigger2 = var(1) && (movehit && numtarget(1310))
trigger2 = (target, movetype = H) && !(target, time)
anim = 7104
ID = 7104
sprpriority = -2         ;
postype = p1
pos = ((target, const(size.mid.pos.x)) + ceil(p2dist x)), floor(-pos y)
vel = 0, 0
ownpal = 1
scale = 1, 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
;[State 4100, Dust]
;type = explod
;trigger1 = movehit && numtarget(1310)
;trigger1 = (target, stateno = 1111310) ;
;trigger1 = (target, movetype = H) && !(target, time); && (target, pos y = 0)
;vel = 0, 0
;anim = 1338
;ID = 1338
;sprpriority = 5
;postype = p1
;scale = 0.5, 0.5
;pos = ((target, const(size.mid.pos.x)) + ceil(p2dist x)), floor(-pos y)
;ownpal = 1
;ignorehitpause = 1
;pausemovetime = -1
;supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

;=< HYAKKI GOU JIN >==
[Statedef 1302]
type = A
physics = N
movetype = A
anim = 1302
velset = 0, 0
ctrl = 0
poweradd = 0
sprpriority = 1

[State 1302, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1
[State 1302, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 9
channel = 0

[State 1302, Vel]
type = velset
trigger1 = animelemtime(5) > 0
x = 6.8
y = 7.8

[State 1302, hitgrabk]
type = hitdef
trigger1 = !time
trigger1 = !var(38)
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = p2statetype = A
attr = A, ST
hitflag = MAF
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = -1
p2facing = 1
p1stateno = 1330
fall = 1

[State 1302, Hit]
type = hitdef
trigger1 = var(10)!=4
trigger1 = !var(16) && (var(15) < (1 + var(1)) || var(20))
trigger1 = animelem = 5
attr = A, NA
damage = ceil(ifelse(fvar(12) * 64 < 7, 7, fvar(12) * 64)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -7
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -22
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4
air.type = Low
air.velocity =  -4, -4
down.hittime = 30
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 3
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1302, Hit]
type = hitdef
trigger1 = var(10) =4
trigger1 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger1 = animelem = 5
attr = A, NA
damage = ceil(ifelse(fvar(12) * 70 < 7, 7, fvar(12) * 70)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -7
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -22
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4
air.type = Low
air.velocity =  -4, -4
down.hittime = 30
down.velocity = 0, 0
getpower = 0,36 * !var(20);ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 3
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
yaccel = 0.5
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1302, trail]
type = helper
trigger1 = var(10) = 4
trigger1 = anim = 1302 && animelem = 5
helpertype = normal
stateno = 3305
ID = 3305
name = "Tenma trail"
postype = p1
ownpal = 1
persistent = 0

[State 1302, End]
type = changestate
trigger1 = pos y >= 0
value = 52


;=< HYAKKI GOU DAN >==
[Statedef 1303]
type = A
movetype = A
physics = N
anim = 1303
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1303, Accel]
type = gravity
trigger1 = 1

[State 1303, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1
[State 1303, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0

[State 1303, Anim]
type = changeanim
triggerall = animelemtime(3) > 2 && animelemtime(4) < 0
trigger1 = p2bodydist x < 35
trigger2 = pos y >= -25
value = 1303
elem = 4
persistent = 0

[State 1303, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (2 + var(1)) || var(20))
trigger1 = animelem = 4
attr = A, SA
damage = ceil(ifelse(fvar(12) * 60 < 7, 7, fvar(12) * 60)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 2, 4)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -56
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -40
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -vel x, 10
air.type = Low
air.velocity = -vel x, 8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
fall.yvelocity = 0
givepower = 200
envshake.time = 12
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1303, End]
type = changestate
trigger1 = pos y >= 0 && vel y > 0
value = 1304


[Statedef 1304]
type = C
movetype = A
anim = 1304
physics = C
velset = 0, 0
juggle = 0
ctrl = 0
sprpriority = 1

[State 1304, Pos]
type = posset
trigger1 = 1
y = 0
[State 1304, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
ignorehitpause = 1
[State 1304, Dust]
type = explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
pos = -22, 0
vel = 0, 0
removetime = -2
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 1304, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 40, 0
vel = 0, 0
removetime = -2
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 1304, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger1 = animelem = 1
attr = C, SA
damage = ceil(ifelse(fvar(12) * 90 < 7, 7, fvar(12) * 90)), 7
animtype = Hard
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = ifelse(var(20), 12, 24), ifelse(var(20), 12, 24)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -4
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -10
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 12
ground.slidetime = 16
ground.hittime = 16
air.type = Low
air.velocity = -7, 7
down.velocity = 0, 0
down.bounce = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1304, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 120
ampl = 6
[State 1304, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< HYAKKI GOU ZAN >==
[Statedef 1305]
type = A
movetype = A
physics = N
anim = 1305
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1305, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
value = 30
[State 1305, Accel]
type = gravity
trigger1 = animelemtime(3) >= 0
[State 1305, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && pos y >= -5
value = 1305
elem = 2
persistent = 0
[State 1305, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = S
physics = S
[State 1305, Pos]
type = velset
trigger1 = animelemtime(2) >= 0
y = 0
[State 1305, Pos]
type = posset
trigger1 = animelemtime(2) >= 0
y = 0

[State 1305, Dust]
type = explod
trigger1 = animelem = 2
anim = 6050
ID = 6050
sprpriority = -2
postype = p1
pos = 20, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.66, 0.66
persistent = 0
[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 53

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1
[State 1305, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 0
channel = 0

[State 1305, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (3 + var(1)) || var(20))
trigger1 = animelem = 3
attr = C, NA
damage = ceil(ifelse(fvar(12) * 70 < 7, 7, fvar(12) * 70)), 7
animtype = Hard
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -18
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -18
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Trip
ground.slidetime = 12
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1.33, -2.25
air.type = Low
air.velocity = -1.33, -6.85
;down.velocity = -1.33, -6.85
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 1305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< HYAKKI GOUSAI >=
;--- PLAYER ---
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
velset = 0, 0
juggle = 8
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
value = 4, 10
channel = 0

[State 1320, Vel]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0
[State 1320, Vel]
type = velset
trigger1 = animelem = 3
x = 2
y = -6
[State 1320, Accel]
type = gravity
trigger1 = animelemtime(3) > 0
[State 1320, accel]
type = velmul
trigger1 = animelemtime(3) > 0 && vel y > 1
y = 1.2
[State 1320, width]
type = width
trigger1 = 1
edge = 30, 0

[State 1320, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = target, const(size.head.pos.x), 35 + (target, const(size.head.pos.y))

[State 1320, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -11, -50
[State 1320, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -28, -64
[State 1320, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 4, -96
[State 1320, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 14, -100
[State 1320, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0
pos = 12, -112

[State 1320, spr 1]
type = sprpriority
trigger1 = animelemtime(1) >= 0 && animelemtime(5) < 0
value = 1
[State 1320, spr 2]
type = sprpriority
trigger1 = animelemtime(5) >= 0
value = -1

[State 1320, End]
type = changestate
trigger1 = animelemtime(3) > 0 && vel y > 0 && pos y > -15
value = 1321

;--- HIT FLOOR ---
[Statedef 1321]
type = C
physics = C
movetype = A
anim = 1321
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1321, Pos]
type = posadd
trigger1 = !time
x = 13

[State 1321, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1321, throw]
type = targetstate
trigger1 = !time
value = 1326

[State 1321, Pos]
type = posset
trigger1 = 1
y = 0

[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 0, 53

[State 1321, Dust]
type = explod
trigger1 = !time
anim = 6050
ID = 6050
sprpriority = -2
postype = p1
pos = 2, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.75, 0.75

[State 1321, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 12, -68

[State 1321, Bind 2]
type = targetbind
trigger1 = animelem = 2
pos = 15, -13

[State 1321, hurt]
type = targetlifeadd
trigger1 = animelem = 2
value = -ceil(100 * fvar(12))

[State 1321, hurt]
type = targetpoweradd
trigger1 = animelem = 2
value = 36

[State 1321, hurt]
type = poweradd
trigger1 = animelem = 2 && !var(20)
value = 72
[State 1321, Snd]
type = playsnd
trigger1 = animelem = 2
value = 2, 3
[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 3, 7
channel = 0
[State 1321, Sparks]
type = explod
trigger1 = animelem = 2
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = 17, -30
removetime = -2
ownpal = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1321, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;--- TARGET ---
[Statedef 1325]
type = A
physics = N
movetype = H
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
ctrl = 0
sprpriority = 0
[State 1326, Anim]
type = changeanim2
trigger1 = !time
value = 1326

[State 1326, Accel]
type = gravity
trigger1 = animelemtime(3) >= 0
[State 1326, Vel]
type = velset
trigger1 = animelem = 3
x = -3
y = -6

[State 1326, Recover]
type = selfstate
trigger1 = command = "recovery"
trigger1 = animelemtime(3) > 0
trigger1 = vel y > 0 && alive
trigger1 = pos y >= (-52 - (const(size.head.pos.y) - const(size.mid.pos.y)))
value = 5200

[State 1326, End]
type = selfstate
trigger1 = animelemtime(3) > 0 && vel y > 0
trigger1 = pos y >= (-32 - (const(size.head.pos.y) - const(size.mid.pos.y)))
value = 5100


;==< HYAKKI GOU TSUI >=
;--- PLAYER ---
[Statedef 1330]
type = A
physics = N
movetype = A
anim = 1330
ctrl = 0
velset = 0, 0
juggle = 8
sprpriority = 1
[State 1330, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State Throw]
type = targetstate
trigger1 = !time
value = 1335

[State 1330, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800
[State 1330, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 6
channel = 0
[State 815, spinsnd]
type = playsnd
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
value = 1, 6
channel = 1

[State 1330, Vel]
type = velset
trigger1 = animelemtime(4) < 0
x = 0
y = 0
[State 1330, Vel]
type = velset
trigger1 = animelem = 4
x = -3.5
y = -12
[State 1330, Accel]
type = gravity
trigger1 = animelemtime(4) > 0
[State 1330, accel]
type = velmul
trigger1 = animelemtime(4) > 0 && (vel y = [1, 20])
y = 1.1
[State 1330, accel]
type = velmul
trigger1 = vel y > 0
x = 0.95
[State 1330, width]
type = width
trigger1 = 1
edge = 30, 0

[State 1330, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))
;-23
[State 1330, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 8 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))
[State 1330, Bind 4]
type = bindtotarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 18 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))

[State 1330, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 12, -62
[State 1330, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger3 = animelemtime(14) >= 0 && animelemtime(15) < 0
pos = 2, -55
[State 1330, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger3 = animelemtime(15) >= 0
pos = -14, -36
[State 1330, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = 9, 0
[State 1330, Bind 9]
type = targetbind
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger2 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = 20, -52

[State 1330, End]
type = changestate
trigger1 = animelemtime(4) > 0 && vel y > 0 && pos y > -15
value = 1331

;--- HIT FLOOR ---
[Statedef 1331]
type = C
physics = C
movetype = A
anim = 1331
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1331, Pos]
type = posadd
trigger1 = !time
x = 32
[State 1331, Pos]
type = posset
trigger1 = !time
y = 0

[State 1331, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn
[State 1331, throw]
type = targetstate
trigger1 = !time
value = 1336

[State 1331, hurt]
type = targetlifeadd
trigger1 = !time
value = -ceil(137 * fvar(12))
[State 1331, hurt]
type = targetpoweradd
trigger1 = !time
value = 36
[State 1331, hurt]
type = poweradd
trigger1 = !time && !var(20)
value = 72

[State 1331, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -32, 0

[State 1331, Snd]
type = playsnd
trigger1 = !time
value = 3, 7
channel = 0

[State 1331, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 120
ampl = 6

[State 1331, Snd]
type = playsnd
trigger1 = !time
value = 5, 4
ignorehitpause = 1
[State 1331, Dust]
type = explod
trigger1 = !time
anim = 1338
ID = 1338
sprpriority = -2
postype = p1
pos = -24, 0
removetime = -2
scale = 0.75, 0.75
ownpal = 1

[State 1331, Vel]
type = velset
trigger1 = animelem = 2
x = 3
y = -3
[State 1331, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = A


;--- TARGET ---
[Statedef 1335]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
[State 1335, Anim]
type = changeanim2
trigger1 = !time
value = 1335
[State 1335, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0


;--- TARGET HIT FLOOR ---
[Statedef 1336]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
[State 1336, Anim]
type = changeanim2
trigger1 = !time
value = 1336

[State 1336, Vel]
type = velset
trigger1 = animelem = 2
x = 4
y = -5
[State 1336, Accel]
type = gravity
trigger1 = animelemtime(2) > 0

[State 1326, Recover]
type = selfstate
trigger1 = command = "recovery"
trigger1 = animelemtime(2) > 0
trigger1 = pos y >= -20 && vel y > 0 && alive
value = 5200

[State 1336, End]
type = selfstate
trigger1 = animelemtime(2) > 0 && vel y > 0 && pos y >= -10
value = 5100


[Statedef 1350]
type = S
movetype= A
physics = N
anim = 1350
velset = 0,0
SprPriority = 1

[State 1350, targetstate]
type = targetstate
Trigger1 = time = 0
value = 1360

[State 1350, playerpush]
type = playerpush
trigger1 = 1
value = 0

[State 1350, 9]
type = width
trigger1 = 1
edge = 50,0

[State 1350, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 1350, Snd]
type = playsnd
trigger1 = animelem = 8 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0

[State 1350, posset]
type = posset
trigger1 = time = 0
y = target,const(size.head.pos.y)

[State 1350, posset]
type = posset
trigger1 = animelemtime(6) = 0
y = 0

[State 1350, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(3) = 0
trigger3 = animelemtime(4) = 0
x = 10*const(size.xscale)

[State 1350, posadd]
type = posadd
trigger1 = animelemtime(5) = 0
x = 20*const(size.xscale)

[State 1350, posadd]
type = posadd
trigger1 = animelemtime(7) = 0
x = 50*const(size.xscale)

[State 1320, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = target, const(size.head.pos.x), (target, const(size.head.pos.y))

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 1
pos = ceil(15*const(size.xscale)), -target,const(size.head.pos.y)

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 2
pos = ceil(5*const(size.xscale)), -target,const(size.head.pos.y)

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 3
pos = ceil(0*const(size.xscale)), -target,const(size.head.pos.y)

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 4
pos = ceil(-5*const(size.xscale)), -target,const(size.head.pos.y)

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 5
pos = ceil(-15*const(size.xscale)), -target,const(size.head.pos.y)

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 6
pos = ceil(-20*const(size.xscale)), ceil(-90*const(size.yscale))

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElem = 7
pos = ceil(-10*const(size.xscale)), ceil(-100*const(size.yscale))

[State 1350, targetbind]
type = targetbind
trigger1 = AnimElemTime(8) = 0
pos = ceil(40*const(size.xscale)), ceil(-60*const(size.yscale))

[State 1350, targetstate]
type = targetstate
Trigger1 = AnimElemTime(8) = 0
value = 1370

[State 1350, hurt]
type = targetlifeadd
trigger1 =  AnimElemTime(8) = 0;target,stateno = 5100
value = -ceil(137 * fvar(12))

[State 1350, hurt]
type = targetpoweradd
trigger1 =  AnimElemTime(8) = 0;target,stateno = 5100
value = 36

[State 1350, hurt]
type = poweradd
trigger1 =  AnimElemTime(8) = 0 && !var(20)
value = 72

[State 1350, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====
[Statedef 1360]
type = S
movetype= H
physics = N
ctrl = 0
velset = 0,0
SprPriority = 0

[State 1360, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1360, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !time
value = 1360

;====
[Statedef 1370]
type = A
movetype= H
physics = N
velset = -6,-4
SprPriority = 0

[State 1370, ScrnBnd]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1370, ChangeAnim2]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050+(SelfAnimExist(5060))*10

[State 1370, Gravity]
type = Gravity
trigger1 = 1

[State 1370, SlfSt]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;==< ASHURA SENKUU >=
[Statedef 1400]
type = S
physics = N
movetype = I
anim = ifelse(var(1), 1405, 1400)
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
trigger1 = !var(1)
var(10) = ifelse(command = "df3p" || command = "dfs", 3, ifelse(command = "df3k" || command = "dfs" , 2, ifelse(command = "db3p", -3, -2)))

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
trigger1 = var(1)
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

[State 1400, Anim]
type = changeanim
trigger1 = !time && (prevstateno = 195 || prevstateno = 1020 || prevstateno = 1500)
value = ifelse(var(1), 1405, 1400)
elem = 3

[State 1400, afterimage]
type = afterimage
trigger1 = animelem = 3 && !var(20)
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 3 || var(10) = -3), 24, 18)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1400, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)

[State 1400, Vel]
type = velset
trigger1 = var(1)
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 14, ifelse(var(10) = 2, 9, ifelse(var(10) = -3, -14, -9)))
[State 1400, Vel]
type = velset
trigger1 = !var(1)
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 9.5, ifelse(var(10) = 2, 7, ifelse(var(10) = -3, -9.5, -7)))
[State 1400, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 6
persistent = 0

[State 1400, Push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0
[State 1400, nothitby]
type = nothitby
triggerall = animelemtime(6) <= ifelse((var(10) = 3 || var(10) = -3), 35, 20)
trigger1 = animelemtime(6) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 14, 9)
trigger3 = vel x > 0 && frontedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 14, 9)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1400, Turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changestate
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 0
ctrl = 1

;==< ZENPOU TENSHIN >=
[Statedef 1450]
type = S
physics = N
movetype = I
anim = 1450
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 1450, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcbz", 3, ifelse(command = "qcby", 2, 1))
[State 1450, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 1, ifelse(random < 500, 2, 3))

[State 1450, Type]
type = statetypeset
trigger1 = anim = 1450 && animelemtime(3) >= 0
statetype = C
[State 1450, Type]
type = statetypeset
trigger1 = anim = 1451 && animelemtime(3) >= 0
statetype = S
physics = S

[State 1450, Vel]
type = velset
trigger1 = anim = 1450 && animelemtime(2) >= 0
x = ifelse(animelemtime(4) >= 0, 5, 6)

[State 1400, Dust]
type = explod
trigger1 = anim = 1450 && animelem = 2
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, 0
vel = -.33, 0
removetime = -2
ownpal = 1
scale = 0.66, 0.66
pausemovetime = -1
supermovetime = -1
[State 1400, Snd]
type = playsnd
trigger1 = anim = 1450 && animelem = 2
value = 0, 105
persistent = 0

[State 1450, Dust]
type = explod
trigger1 = anim = 1450 && animelemtime(4) >= 0 && !(animelemtime(4) % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = -1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1450, Push]
type = playerpush
trigger1 = anim = 1450
trigger2 = anim = 1451 && animelemtime(3) < 0
value = 0
[State 1450, nothitby]
type = nothitby
trigger1 = anim = 1450
value = , AT
time = 1

[State 1450, Anim]
type = changeanim
trigger1 = anim = 1450
trigger1 = ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(8) >= 0, animelemtime(4) >= 0))
value = 1451

[State 1400, Dust]
type = explod
trigger1 = anim = 1451 && animelem = 3
anim = 7104
ID = 7102
sprpriority = -2
postype = p1
pos = 25, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 1400, Snd]
type = playsnd
trigger1 = anim = 1451 && animelem = 3
value = 0, 100
persistent = 0

[State 1450, End]
type = changestate
trigger1 = anim = 1451 && !animtime
value = 0
ctrl = 1

;==< TENMA SHURETTOU >=
;--- POSE ---
[Statedef 1500]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
facep2 = 1
sprpriority = 1

[State 1500, Anim]
type = changeanim
trigger1 = !time && !AIlevel && command = "2dk"
trigger2 = !time && AIlevel && p2statetype = C
value = 1501
[State 1500, statetype]
type = statetypeset
trigger1 = anim = 1501
statetype = C
physics = C

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1500 && animelem = 3
reversal.attr = SCA, AA
p1stateno = 1505
pausetime = 0, 12
hitSound = -1 + 0 * (var(31) := 0)
sparkno = -1;s7001
;sparkxy = 0, 0
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
numhits = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1501 && animelem = 3
reversal.attr = SC, AA
p1stateno = 1510
pausetime = 0, 12
hitSound = -1 + 0 * (var(31) := 0)
sparkno = -1;s7001
;sparkxy = 0, 0
numhits = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 1500, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 1501, 11, 0)
ctrl = 1


;--- GOUHA KEN ---
[Statedef 1505]
type = S
movetype = A
physics = S
anim = 1505
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
ctrl = 0

[State 1505, width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(12) < 0
value = 35, 0
ignorehitpause = 1

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 8
value = 1, 3
channel = 1
[State 1505, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 4
ignorehitpause = 1
[State 1505, Dust]
type = explod
trigger1 = animelem = 7
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = 48, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 1505, Dust]
type = explod
trigger1 = animelem = 7
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 48, 0
scale = 0.75, 0.75
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 1505, Shake]
type = envshake
trigger1 = animelem = 7
time = 18
freq = 60
ampl = 4
ignorehitpause = 1

[State 1505, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9
ID = 1505
attr = S, SA
damage = ceil(ifelse(fvar(12) * 86 < 7, 7, fvar(12) * 86)), 14
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -74
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -6
air.type = Low
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1505, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p1
pos = ceil(25 * const(size.xscale)), ceil(-76 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- GOUHA KEN ---
[Statedef 1510]
type = S
movetype = A
physics = S
anim = 1505
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
ctrl = 0

[State 1510, width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(12) < 0
value = 35, 0
ignorehitpause = 1

[State 1510, Snd]
type = playsnd
trigger1 = animelem = 8
value = 1, 3
channel = 1
[State 1510, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 1510, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 4
ignorehitpause = 1
[State 1510, Dust]
type = explod
trigger1 = animelem = 7
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = 48, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 1510, Dust]
type = explod
trigger1 = animelem = 7
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 48, 0
scale = 0.75, 0.75
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 1510, Shake]
type = envshake
trigger1 = animelem = 7
time = 18
freq = 60
ampl = 4
ignorehitpause = 1

[State 1510, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 9
ID = 1505
attr = S, SA
damage = ceil(ifelse(fvar(12) * 86 < 7, 7, fvar(12) * 86)), 14
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -74
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -6
air.type = Low
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1510, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p1
pos = ceil(25 * const(size.xscale)), ceil(-18 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
