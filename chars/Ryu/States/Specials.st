; ________________________________________
;| Ryu by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES==
;====

;HADOU KEN
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
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
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 60, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;SHAKUNETSU HADOU KEN
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020
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
value = 1020
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
trigger1 = animelem = 12
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 58, -68
ownpal = 1
persistent = 0
size.xscale = 0.7
size.yscale = 0.7

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
trigger1 = var(1) = 2
trigger1 = animelem = 3
value = 13, 6
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = var(1) = 3
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelem = 10
value = 13, 3
channel = 0

[State 1020, Snd]
type = playsnd
trigger1 = var(1) = 3
trigger1 = animelem = 10
value = 4, 0
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

;SHORYUU KEN
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
;juggle = ifelse(var(1) = 1, 8, ifelse((p2movetype = H && p2statetype = A), 7, 9))
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 333), 3, ifelse(random < 500, 2, 1))

;[State 1100, NotHitBy]
;type = NotHitBy
;triggerall = prevstateno != 750
;trigger1 = AnimElemTime(3) < 0 && var(10) = 1
;trigger2 = AnimElemTime(4) < 1 && var(10) = 2
;trigger3 = AnimElemTime(2) < 0 && var(10) = 3
;value = SCA
;time = 1

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
x = ifelse(var(10) = 3, 13, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))
[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, 41
[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 4 + (var(1) = 2) * 10, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, NormRyuHit]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && (var(15) < 1 || var(14) && var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 1100 && var(1) <= 1
attr = S, SA
ID = 110000
;damage = ifelse(var(20), 60 + var(10) * 7, 111 + var(10) * 7), 15
damage = ceil(ifElse(fvar(12) * ifelse(var(14), ifelse(var(10) = 3, 111, ifelse(var(10) = 2, 102, 88)), ifelse(var(10) = 3, 139, ifelse(var(10) = 2, 128, 110))) < 7, 7, fvar(12) * ifelse(var(14), ifelse(var(10) = 3, 111, ifelse(var(10) = 2, 102, 88)), ifelse(var(10) = 3, 139, ifelse(var(10) = 2, 128, 110))))), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -79
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4,  ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
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

[State 1100, NormRyuHit Juggle Hit]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && var(15) < var(10)
trigger1 = animelem = 3 && anim = 1100 && var(1) <= 1
trigger1 = (p2movetype = H && p2statetype = A) && !var(20)
trigger1 = !var(27)
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 86, ifelse(var(10) = 2, 74, 38)) < 7, 7, fvar(12) * ifelse(var(10) = 3, 86, ifelse(var(10) = 2, 74, 38)))), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 11)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -79
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12.5, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x <= 0, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4,  ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12.5, ifelse(var(10) = 2, -10, -9))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
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

[State 1100, NormRyuhit2]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = !var(16) && (var(15) < var(10)|| var(20))
trigger1 = animelem = 4 && anim = 1100 && var(1) <= 1
trigger1 = !movecontact && !movereversed
attr = A, SA
;damage = 44 + var(10) * 7, 7
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 65, ifelse(var(10) = 2, 58, 51)) < 7, 7, fvar(12) * ifelse(var(10) = 3, 65, ifelse(var(10) = 2, 58, 51)))), 15
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -106
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 5, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3))), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, Evil/Master LP Hit 1]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = var(10) = 1
trigger1 = !var(16) && !var(17) && (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 1100 && var(1) != 1
attr = S, SA
ID = 11000
;damage = ifelse(var(20), 60 + var(10) * 7, 111 + var(10) * 7), 7
damage = ceil(ifElse(fvar(12) * ifelse(var(27), 100, 110) < 7, 7, fvar(12) * ifelse(var(27), 100, 110))), 7
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
ground.velocity = -4, -7.95
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 5, 4, -4), -9
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

[State 1100, Evil/Master MP/HP Hit 1]
type = hitdef
triggerall = prevstateno!= 750
trigger1 = var(10) > 1
trigger1 = !var(16) && (var(15) < 1 || var(20)) ;var(10) - (var(17)=1) || var(20))
trigger1 = animelem = 3 && anim = 1100 && var(1) != 1
trigger1 = !numtarget(1101)
ID = 1100
attr = S, SA
;damage = ifelse(var(20) || var(17), 23 + var(10) * 7, 47 + var(10) * 7), 7
;damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 92, 100) < 7, 7, fvar(12) * ifelse(var(10) = 3, 92, 100))), 7
damage = ceil(ifElse(fvar(12) * 100 < 7, 7, fvar(12) * 100)), 7
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
ground.velocity = -1, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 4, 1.5, -1.5), -7.5  - (var(10)-1)
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
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, Evil/Master MP/HP Hit 2]
type = hitdef
triggerall = prevstateno!= 750
triggerall = !var(20)
trigger1 = var(10) > 1
trigger1 = (enemy, statetype = A) && (enemy, movetype = H)
trigger1 = !var(16) && ((var(15) > 0) && (var(15) < var(10)))
trigger1 = animelem = 3 && anim = 1100 && var(1) != 1
trigger1 = !numtarget(1100)
attr = S, SA
ID = 1101
;damage = ifelse(var(20) || var(17), 23 + var(10) * 7, 47 + var(10) * 7), 7
;damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, ifelse(var(27) || numtarget(11000), 42, 78), ifelse(var(27) || numtarget(11000), 36, 66)) < 7, 7, fvar(12) * ifelse(var(10) = 3, ifelse(var(27) || numtarget(11000), 42, 70), ifelse(var(27) || numtarget(11000), 36, 60)))), 7
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, ifelse(var(27) || numtarget(11000), 41, 72), ifelse(var(27) || numtarget(11000), 26, 57)) < 7, 7, fvar(12) * ifelse(var(10) = 3, ifelse(var(27) || numtarget(11000), 41, 72), ifelse(var(27) || numtarget(11000), 26, 57)))), 7
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
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), -10 - (var(10)-1)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 4, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3))), -10 - (var(10)-1)
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
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1100, Evil/Master Hit 3]
type = hitdef
triggerall = prevstateno!= 750
triggerall = !numtarget(1101)
trigger1 = !var(16) && (var(15) < var(10) || var(20))
trigger1 = var(10)>1 && animelem = 4 && anim = 1100 && var(1) != 1
trigger2 = !var(16) && !var(17) && (var(15) < 1 || var(20))
trigger2 = var(10)=1 && animelem = 4 && anim = 1100 && var(1) != 1
trigger2 = !movecontact && !movereversed
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 42, ifelse(var(10) = 2, 28, 70)) < 7, 7, fvar(12) * ifelse(var(10) = 3, 42, ifelse(var(10) = 2, 28, 70)))), 7
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -106
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -7.75))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 6, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1.5, 1)), ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3))), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
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

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
trigger3 = anim = 1110 && animelemtime(4) >= 0
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
trigger2 = anim = 1110 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State 1200, VarSet]
type = VarAdd
trigger1 = var(1) = 1
trigger1 = var(10) > 1
trigger1 = numtarget(110000)
var(15) = 2
persistent = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


;TATSUMAKI SENPUU KYAKU
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
;juggle = 8
sprpriority = 1
facep2 = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 4 + (var(1) = 2) * 10, 2
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
trigger1 = var(1)!= 2
trigger1 = anim = 1201 && ifelse(var(10) = 3, animelemtime(18) >= 0, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0
[State 1200, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = anim = 1201 && ifelse(var(10) = 3, animelemtime(24) >= 0, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Hit Again]
type = movehitreset
trigger1 = var(1) = 1 || var(1) = 3
trigger1 = movehit = 1 && !numtarget

[State 1200, Hit]
type = hitdef
trigger1 = (var(1) = 1 || var(1) = 3 && var(10) > 1) && (!movehit || var(20))
trigger1 = !var(16) && (var(15) < ifelse(var(1) = 3, var(10), 1) || var(20))
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14)
attr = A, SA
ID = 12000
damage = ceil(ifElse(fvar(12) * ifelse(movehit, 42, ifelse(var(10)=1, 75, ifelse(var(10)=2, 89, 115))) < 7, 7, fvar(12) * ifelse(movehit, 42, ifelse(var(10)=1, 75, ifelse(var(10)=2, 89, 115))))), 7
;damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(20) && var(10) = 1, -3, ifelse(var(10) > 1, -5.25, -4.6)), ifelse(var(10)=3, -7.5, ifelse(var(10)=2, -7.35, -7))
air.type = Low
air.velocity = ifelse(var(20) && var(10) = 1, -3, ifelse(var(10) > 1, -5.25, -4.6)), ifelse(var(10)=3, -7.5, ifelse(var(10)=2, -7.35, -7))
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
fall.recover = var(10)>1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, hitb]
type = hitdef
trigger1 = (var(1) = 1 || var(1) = 3 && var(10) > 1) && (!movehit || var(20))
trigger1 = !var(16) && (var(15) < ifelse(var(1) = 3, var(10), 1) || var(20))
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17)
trigger1 = !numtarget(12000)
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(movehit, 42, ifelse(var(10)=1, 80, ifelse(var(10)=2, 95, 110))) < 7, 7, fvar(12) * ifelse(movehit, 42, ifelse(var(10)=1, 80, ifelse(var(10)=2, 95, 110))))), 7
;damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 4, -7.5
air.type = Low
air.velocity = 4, -7.5
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, Hit Evil A]
type = hitdef
trigger1 = !var(16) && (var(15) < var(10) || var(20))
trigger1 = (var(1) = 2 || var(1) = 3 && var(10) = 1)
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20)
trigger1 = !var(27) && var(10)=1 || var(10) > 1
attr = A, SA
ID = 1200
damage = ceil(ifElse(fvar(12) * 35 < 7, 7, fvar(12) * 40)), 7
;damage = 35, 7
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
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1.91, -6.78
air.type = Low
air.velocity = ifelse(var(10) > 1, -4.62, -2.5), ifelse(numtarget(1250), -7.45, ifelse(var(10) > 1, ifelse(var(10) = 3, -4.4, -3.75), -5.65)); -6.5
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
fall.recover = var(10) > 1 || p2statetype = A
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1200, hitb]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = (var(1) = 2 || var(1) = 3 && var(10) = 1) && hitcount < 3
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23)
attr = A, SA
damage = ceil(ifElse(fvar(12) * 35 < 7, 7, fvar(12) * 40)), 7
;damage = 35, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 3.5, -8
air.type = Low
air.velocity = 3.5, -6.5
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 1200, VarSet]
;type = VarAdd
;trigger1 = var(1)!= 1
;trigger1 = var(10) > 1
;trigger1 = numtarget(1250)
;trigger1 = (p2movetype = H && p2statetype = A)
;var(15) = 1
;persistent = 0

[State 1200, VarSet]
type = VarSet
trigger1 = var(1)!= 1
trigger1 = var(10) = 1 && (movehit = 1 && numtarget)
var(15) = 0

[State 1200, VarSet]
type = VarSet
trigger1 = var(1)!= 1
trigger1 = var(10) = 1 && (movehit = 1 && numtarget)
var(27) = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I


;KUUCHUU TATSUMAKI SENPUU KYAKU
[Statedef 1250]
type = A
physics = A
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 72 * !var(20)
sprpriority = 1
;juggle = 7

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
;trigger1 = anim = 1250 && animelemtime(24) < 0
;y = -const(movement.yaccel) * 0.33

[State 1250, veladd]
type = veladd
trigger1 = animelem = 1
x = ifElse(vel x >= 0, 0.8, -0.8)
y = ifElse(vel y <= 0, (-2 - var(10)) * 0.225, (2 + var(10))* 0.2)

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y <= 0
value = 4 + (var(1) = 2) * 10, 2
channel = 0
[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y > 0
value = 3 + (var(1) = 2) * 10, 2
channel = 0

[State 1250, spin]
type = playsnd
trigger1 = anim = 1250 && !(animelemtime(4) % 9) && animelemtime(26) < 0
value = 1, 6
channel = 1

[State 1250, Hit Again]
type = movehitreset
trigger1 = var(1) ;!= 2
trigger1 = movehit = 1 && !numtarget

[State 1250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < ifelse(prevstateno=265 || var(1)!=1, 2, 1) || var(20))
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1) = 1, 60+(var(10)*7), ifelse(var(1) = 3, 33+(var(10)*7), 40)) < 7, 7, fvar(12) * ifelse(var(1) = 1, 60+(var(10)*7), ifelse(var(1) = 3, 33+(var(10)*7), 40)))), 7
ID = 1250
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(1)!=2, ifelse(var(10)=3, -7.45, ifelse(var(10)=2, -6.3, -3.75)), -5.25), ifelse(var(1)!=2, -6.75+(var(10)*0.65), -4.75)
air.type = Low
air.velocity = ifelse(var(1)!=2, ifelse(var(10)=3, -7.45, ifelse(var(10)=2, -6.3, -3.75)), -5.25), ifelse(var(1)!=2, -4.75+(var(10)*0.65), -4.75)
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1250, hitb]
type = hitdef
trigger1 = !var(16) && (var(15) < var(1) || var(20))
trigger1 = var(1) && (!movehit || var(20)) ;var(1) = 1 && (!movehit || var(20))
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1) = 1, 60+(var(10)*7), ifelse(var(1) = 3, 33+(var(10)*7), 40)) < 7, 7, fvar(12) * ifelse(var(1) = 1, 60+(var(10)*7), ifelse(var(1) = 3, 33+(var(10)*7), 40)))), 7
;damage = ifelse(var(1) = 1, 60, 40), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(1)!=2, ifelse(var(10)=3, 7.45, ifelse(var(10)=2, 6.3, 3.75)), 5.25), ifelse(var(1)!=2, -6.75+(var(10)*0.65), -4.75)
air.type = Low
air.velocity = ifelse(var(1)!=2, ifelse(var(10)=3, 7.45, ifelse(var(10)=2, 6.3, 3.75)), 5.25), ifelse(var(1)!=2, -4.75+(var(10)*0.65), -4.75)
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1250, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1250 && animelem = 16
value = 1250
elem = 28
ignorehitpause = 1

;[State 1200, VarSet]
;type = VarSet
;trigger1 = var(1)!= 1
;trigger1 = (movehit = 1 && numtarget)
;trigger1 = hitcount < 2
;var(15) = 0
;
;[State 1200, VarSet]
;type = VarSet
;trigger1 = var(1)!= 1
;trigger1 = (movehit = 1 && numtarget)
;trigger1 = hitcount < 2
;var(27) = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I


;CLASSIC AERIAL TATSUMAKI
[Statedef 1270]
type = A
physics = N
movetype = A
anim = 1270
ctrl = 0
poweradd = 72 * !var(20)
sprpriority = 1
;juggle = 8

[State 1270, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "hcbc"), 3, ifelse(command = "hcbb", 2, 1))
[State 1270, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1270, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1270, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x < 0, -3.5, 3.5)
y = 0
[State 1270, Vel]
type = veladd
trigger1 = var(10) = 1 && time >= 12
trigger2 = var(10) = 2 && time >= 24;ifelse(prevstateno!=222,23,28)
trigger3 = var(10) = 3 && time >= 36
;trigger3 = time >= ifelse((backedgebodydist <= 0 || frontedgebodydist <= 0), 13, ifelse(prevstateno!=222,33,38))
y = 0.5
[State 1270, Vel]
type = velmul
trigger1 = vel y > 0
x = 0.975

[State 1270, Snd]
type = playsnd
trigger1 = !time
value = 4 + (var(1) = 2) * 10, 2
channel = 0

[State 1270, spin]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1270, Hit]
type = hitdef
triggerall = P2Dist x >= 0
triggerall = animelem = 5
trigger1 = var(1)!= 2 && (!movehit || var(20))
trigger1 = !var(16) && (var(15) < 3 - (var(10)=1) || var(20))
trigger2 = var(1) = 2
trigger2 = !var(16) && (var(15) < 3 - (var(10)=1) || var(20))
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1)!= 2, 60+(var(10)*7), 40) < 7, 7, fvar(12) * ifelse(var(1)!= 2, 60+(var(10)*7), 40))), 7
;damage = ifelse(var(1) = 1, 60, 40), 5+var(10)
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
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, -5
air.type = Low
air.velocity = -3, ifelse(prevstateno!=222,-6,-4.5)
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1270, hitb]
type = hitdef
triggerall = P2Dist x < 0
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 8
attr = A, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(1)!= 2, 60+(var(10)*7), 40) < 7, 7, fvar(12) * ifelse(var(1)!= 2, 60+(var(10)*7), 40))), 7
;damage = ifelse(var(1) = 1, 60, 40), 5+var(10)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 3, -6
air.type = Low
air.velocity = 3, -6
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 11), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 1275
movetype = I

[State 1250, ChangeAnim]
type = ChangeAnim
triggerall = anim = 1270 ;animelem = 16
trigger1 = var(10) = 1 && time > 12
trigger2 = var(10) = 2 && time > 24
trigger3 = var(10) = 3 && time > 36
;trigger3 = time > ifelse((backedgebodydist <= 0 || frontedgebodydist <= 0), 13, 36)
value = 1275

[State 1270, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;JOUDAN SOKUTOU GERI
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
;juggle = 8
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcfc"), 3, ifelse(command = "qcfb", 2, 1))
[State 1300, Strength AI]
type = varset
triggerall = var(1)= 1
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(1) !=1, ifelse(var(10) = 3, 1302, ifelse(var(10) = 2, 1301, 1300)), ifelse(var(10) = 3, 1302, ifelse(var(10) = 2, 1301, 1300)))
;value = ifelse(var(10) = 3, 1302, ifelse(var(10) = 2, 1301, 1300))

;[State 1300, Anim]
;type = changeanim
;trigger1 = var(1) != 1
;trigger1 = !time
;value = ifelse(var(10) = 3, 1300, ifelse(var(10) = 2, 1301, 1302))

[State 1300, Vel]
type = velset
trigger1 = (anim = [1301, 1302]) && animelemtime(4) < 0
trigger2 = (anim = [1300, 1304]) && animelemtime(2) < 0
x = 4

[State 1300, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 3, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 7, 6))
channel = 0
[State 1300, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
trigger3 = anim = 1304 && animelem = 4
value = 13, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1, 3))
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300  && animelem = 4
trigger3 = anim = 1304 && animelem = 4
value = 1, 6
channel = 1
[State 1300, Snd]
type = playsnd
trigger1 = (anim = [1300, 1304]) && animelem = 3
trigger2 = (anim = [1302, 1301]) && animelem = 5
value = 0, 100

[State 1300, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = (anim = [1300, 1304]) && animelem = 4
attr = S, SA
ID = 1300
damage = ceil(ifElse(fvar(12) * (ifelse(var(10) = 3, 125, ifelse(var(10) = 2, 98, 75))*ifelse(var(1)=3, 0.80, 1)) < 7, 7, fvar(12) * (ifelse(var(10) = 3, 125, ifelse(var(10) = 2, 98, 75))*ifelse(var(1)=3, 0.80, 1)))), 7
;damage = (70 + var(10) * 14), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -78
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5 -var(10) * 1, -6
air.type = Low
air.velocity = -5 -var(10) * 1, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 8) || ((anim = [1301, 1302]) && animelem = 10)
x = 15
[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 9) || ((anim = [1301, 1302]) && animelem = 11)
x = 10
[State 1300, Pos]
type = posadd
trigger1 = !animtime
x = 5

[State 1310, p2state]
type = targetstate
trigger1 = movehit && numtarget(1300) && var(14) < 3 && var(1) = 3
trigger1 = (target(1300), stateno = 5000) || (target(1300), stateno = 5010) || (target(1300), stateno = 5020)
value = 1111300
ID = 1300
ignorehitpause = 1

[State 1200, VarSet]
type = VarAdd
trigger1 = var(1) = 3
trigger1 = numtarget(1300)
trigger1 = (p2movetype = H && p2statetype = A)
var(15) = ifelse(var(10) < 3, 1, 0)
persistent = 0

[State 1200, VarSet]
type = VarAdd
trigger1 = var(1) = 1
trigger1 = var(10) > 1
trigger1 = numtarget(1300)
var(15) = 2
persistent = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1300 && animelemtime(6) >= 0
trigger2 = anim = 1301 && animelemtime(8) >= 0
trigger3 = anim = 1302 && animelemtime(8) >= 0
trigger4 = anim = 1304 && animelemtime(6) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;ASHURA SENKUU
[Statedef 1400]
type = S
physics = N
movetype = I
anim = 1400
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
trigger1 = var(1)!= 3
var(10) = ifelse(command = "df3p", 3, ifelse(command = "df3k", 2, ifelse(command = "db3p", -3, -2)))

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
trigger1 = var(1) = 3
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

[State 1400, afterimage]
type = afterimage
trigger1 = anim = 1400
trigger1 = animelem = 3
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

[State 1400, Vel]
type = velset
trigger1 = anim = 1400
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)
[State 1400, Vel]
type = velset
trigger1 = anim = 1400
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 9.5, ifelse(var(10) = 2, 7, ifelse(var(10) = -3, -9.5, -7)))
;x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))
[State 1400, Vel]
type = velmul
trigger1 = anim = 1400
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = anim = 1400
trigger1 = animelem = 2
value = 3 + (var(1) = 2) * 10, 4 * (var(1) != 2)
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = anim = 1400
trigger1 = animelem = 6
value = 5, 4
persistent = 0

[State 1020, Aura]
type = helper
trigger1 = anim = 1400
trigger1 = animelem = 3
helpertype = normal
stateno = 6005
ID = 6005
postype = p1
ownpal = 1
persistent = 0
;size.xscale = 1
;size.yscale = .95

[State 1400, Push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0
[State 1400, nothitby]
type = nothitby
triggerall = anim = 1400
triggerall = animelemtime(6) <= ifelse((var(10) = 3 || var(10) = -3), 35, 20)
trigger1 = animelemtime(6) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
trigger3 = vel x > 0 && frontedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1400, Turn]
type = turn
trigger1 = anim = 1400
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changeanim
triggerall = anim = 1400
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 1405

[State 0, ChangeState]
type = ChangeState
trigger1 = anim = 1405 && !animtime
value = 0
ctrl = 1

;RYUSOKYAKU
[Statedef 1500]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
;juggle = ifelse(var(10)=2,7,8)
sprpriority = 1
facep2 = 1

[State 1500, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcfc"), 3, ifelse(command = "qcfb", 2, 1))
[State 1500, Strength AI]
type = varset
triggerall = var(1) != 1
trigger1 = !time && AIlevel
var(10) = ifelse(((prevstateno = 210 || prevstateno = 240 || prevstateno = 255) || random < 200), 2, ifelse(((prevstateno = 205 || prevstateno = 220 || prevstateno = 235 || prevstateno = 250) || random < 200), 1, 2))

[State 1500, Anim]
type = changeanim
trigger1 = var(1) != 1
trigger1 = !time
value = ifelse(var(10) = 3, 1502, ifelse(var(10) = 2, 1501, 1500))

[State 1500, Vel]
type = velset
trigger1 = (anim = [1500, 1502]) && animelemtime(5) < 0
x = ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 4, 1))

[State 1500, Vel]
type = velset
trigger1 = (anim = [1500, 1502]) && animelem = 5
x = 0

[State 1300, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = anim = 1500 && animelem = 7
trigger2 = anim = 1501 && animelem = 7
trigger3 = anim = 1502 && animelem = 7
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1500 && animelem = 7
trigger2 = anim = 1501 && animelem = 7
trigger3 = anim = 1502 && animelem = 7
value = 1, 6
channel = 1
[State 1300, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = anim = 1500 && animelem = 7
trigger2 = anim = 1501 && animelem = 7
trigger3 = anim = 1502 && animelem = 7
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 1500, hit]
type = hitdef
triggerall = var(1) !=1
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = anim = 1500 && animelem = 10 && (enemynear, statetype!= A)
trigger2 = !var(16) && (var(15) < 1 || var(20))
trigger2 = anim = 1501 && animelem = 10 && (enemynear, statetype!= A)
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 2, 68, 79) < 7, 7, fvar(12) * ifelse(var(10) = 2, 68, 79))), 7
;damage = ifelse(var(20), 32 - var(10) * 7, 82 - var(10) * 7), 15
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(p2statetype=A, 5,ifelse(var(20) || var(10) = 1, 10, 12))
guard.pauseTime = ifelse(var(20), 4, 10), ifelse(var(20), 4, 10)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -16
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16 + 4 * var(29)
ground.hittime = 22 + 4 * var(29); 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -13.82, -6.93), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.fall = 1
air.type = Low
air.velocity = -vel x, 15
air.cornerpush.veloff = 0
fall.yvelocity = 0
down.hittime = 20
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 0;ifelse((p2stateno = [5012,5030]),1,0)
fall.recover = 0
yaccel = 0.5
forcestand = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -7
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1500, hit juggle]
type = hitdef
triggerall = var(1) !=1
trigger1 = !var(16) && var(15) < 4
trigger1 = anim = 1501 && animelem = 9 && (enemynear, statetype = A)
trigger2 = !var(16) && var(15) < 3
trigger2 = anim = 1502 && animelem = 9 && (enemynear, statetype = A)
ID = 15000
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(var(10) = 3, 120, 79) < 7, 7, fvar(12) * ifelse(var(10) = 3, 120, 79))), 7
;damage = ifelse(var(20), 32 - var(10) * 7, 82 - var(10) * 7), 15
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 5
guard.pauseTime = ifelse(var(20), 4, 10), ifelse(var(20), 4, 10)
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7000
;sparkxy = -10, -16
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16 + 4 * var(29)
ground.hittime = 22 + 4 * var(29); 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -13.82, -6.93), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.fall = 1
air.type = Low
air.velocity = -vel x, 15
air.cornerpush.veloff = 0
fall.yvelocity = 0
down.hittime = 20
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 0;ifelse((p2stateno = [5012,5030]),1,0)
fall.recover = 0
yaccel = 0.5
forcestand = 0
p2facing = 1
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 121), var(36) := -55
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1500, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = anim = 1502 && animelem = 10 && (enemynear, statetype!= A)
trigger1 = !numtarget(15000)
ID = 1500
attr = S, SA
damage = ceil(ifElse(fvar(12) * ifelse(enemynear, statetype = L, 60, 120) < 7, 7, fvar(12) * ifelse(enemynear, statetype = L, 60, 120))), 7
;damage = ifelse(var(20), 32 + var(10) * 7, 81 + var(10) * 7), 15
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
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
ground.velocity = -vel x, 10
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.fall = 1
air.type = Low
air.velocity = -vel x, 15
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
fall.yvelocity = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 0
;SUfall.recovertime = 0
down.hittime = 20
down.velocity = 0, 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 0
airguard.cornerpush.veloff = 0
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -7
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1510, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1500)
trigger1 = !(Target(1500), Time)
trigger1 = (Target(1500), StateNo = 5000) || (Target(1500), StateNo = 5010)
value = 1111500
ID = 1500
ignoreHitPause = 1

[State 1510, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(15000)
trigger1 = !(Target(15000), Time)
trigger1 = (Target(15000), Stateno = 5020)
value = 1111500
ID = 15000
ignoreHitPause = 1

[State 1500, Shake]
type = envshake
trigger1 = (anim = [1500, 1502]) && animelemtime(10) >= 0 && animelemtime(11) <= 20
trigger1 = !(animelemtime(10) % 5)
time = 4
freq = 100
ampl = 6 -ceil(animelemtime(8) * 0.25)
ignorehitpause = 1

[State 1500, Snd]
type = playsnd
trigger1 = (anim = [1500, 1502]) && animelem = 10
value = 5, 3
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 4
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
pos = -36, -52
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 5
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.75, 0.75
pos = -32, -83
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 6
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.6, 0.6
pos = -20, -112
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 7
anim = 7101
ID = 7100
sprpriority = 2
postype = p1
vel = 0.5, 0
scale = 0.35, 0.35
pos = 0, -121
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 10
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = 47, 0
scale = 0.5, 0.5
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 10
anim = 7160;7107
ID = 7160
sprpriority = 2
postype = p1
pos = 47, 0
scale = 0.28, 0.28;0.38, 0.2
ownpal = 1
[State 1500, Dust]
type = explod
trigger1 = (anim = [1500, 1502]) && animelem = 10
anim = 7240;7107
ID = 7240
sprpriority = 2
postype = p1
pos = 47, 0
scale = 0.5, 0.5;0.38, 0.2
ownpal = 1
;[State 1500, Dust]
;type = explod
;trigger1 = (anim = [1500, 1502]) && animelem = 9
;anim = 1510
;ID = 1510
;sprpriority = 2
;postype = p1
;pos = ifelse(var(10)=3, 65, 30), -60
;scale = 0.5, 0.48;0.38, 0.2
;ownpal = 1

[State 1500, fire]
type = helper
trigger1 =(anim = [1500, 1501]) && animelem = 9
trigger2 = anim = 1502 && time = 22
helpertype = normal
stateno = 6150
ID = 6150
name = "Ryusokyaku Fire"
postype = p1
ownpal = 1
xscale = 0.5
yscale = 0.5

[State 1500, Pos]
type = posadd
trigger1 = ((anim = [1500, 1502]) && animelem = 6)
x = 10
[State 1500, Pos]
type = posadd
trigger1 = ((anim = [1500, 1501]) && animelem = 9)
x = 27;ifelse(var(10)=3,31,27)
[State 1500, Pos H]
type = posadd
trigger1 = (anim = 1502 && (animelem = 9 || animelem = 10))
x = ifelse((anim =1502 && animelem = 9), 10, 21)
[State 1500, Pos]
type = posadd
trigger1 = ((anim = [1500, 1502]) && animelem = 13)
x = var(10)
[State 1500, Pos]
type = posadd
trigger1 = ((anim = [1500, 1502]) && (animelem = 14 || animelem = 15))
x = 2 + var(10)

[State Idle]
type = statetypeset
trigger1 = anim = 1500 && animelemtime(12) >= 0
trigger2 = anim = 1501 && animelemtime(12) >= 0
trigger3 = anim = 1502 && animelemtime(12) >= 0
movetype = I

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

