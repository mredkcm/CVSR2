; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SUPER STATES >====
;====

;==< SHINPI KAIBYAKU >====
[Statedef 3000]
type = S
physics = N
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000
facep2 = 1

[State 3000, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3000, Super Level]
type = varadd
trigger1 = !time
var(15) = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3000, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3000, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3000, Snd]
type = playsnd
trigger1 = time = 4 && var(1) != 2
value = 5, 0
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = time = 4 && var(1) = 2
value = 9, 15
channel = 0

[State 3000, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3000, Vel]
type = veladd
trigger1 = vel x > 0
x = -.125
[State 3000, Vel]
type = velset
trigger1 = vel x < 0
x = 0
[State 3000, Vel]
type = velset
trigger1 = animelem = 3 || animelem = 8 || animelem = 15 || animelem = 20 || animelem = 25
x = 4

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 3
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 18
value = 5, 4
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 18 || animelem = 22 || animelem = 29
value = 1, 2
channel = 1

[State 3000, hit low]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 4 || animelem = 13 || animelem = 19
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.25, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -50
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3000, hit high]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 7 || animelem = 10 || animelem = 23
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.25, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -70
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3000, hit final]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 30
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -9.625, -7.15
guard.velocity = -12.65
air.velocity = -9.625, -7.15
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3000, Type]
type = statetypeset
trigger1 = animelemtime(32) >= 0
movetype = I

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< SHINPI KAIBYAKU >====
[Statedef 3050]
type = S
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000
facep2 = 1

[State 3050, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3050, Super Level]
type = varadd
trigger1 = !time
var(15) = 1

[State 3050, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3050, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1

[State 3050, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3100, Snd]
type = playsnd
trigger1 = time = 4 && var(1) != 2
value = 5, 0
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = time = 4 && var(1) = 2
value = 9, 15
channel = 0

[State 3050, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3050, Vel]
type = veladd
trigger1 = vel x > 0
x = -.125
[State 3050, Vel]
type = velset
trigger1 = vel x < 0
x = 0
[State 3050, Vel]
type = velset
trigger1 = animelem = 3 || animelem = 8 || animelem = 15 || animelem = 20 || animelem = 25 || animelem = 37
x = 4

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 3
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 18
value = 5, 4
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 18 || animelem = 22 || animelem = 29
value = 1, 2
channel = 1

[State 3050, hit low]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 4 || animelem = 13 || animelem = 16 || animelem = 28 || animelem = 37
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.25, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -50
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3050, hit high]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 7 || animelem = 10 || animelem = 19 || animelem = 22 || animelem = 32
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 10, 10
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.25, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3050, hit final]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(37))
trigger1 = animelem = 41
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 20, 20
guard.pausetime = 12, 12
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -1.35, -14.1
guard.velocity = -9.22
air.velocity = -1.35, -10.1
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -90
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(42) >= 0
movetype = I

[State 3050, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< KOU'OU KEN >====
[Statedef 3100]
type = S
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000
facep2 = 1

[State 3100, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3100, Super Level]
type = varadd
trigger1 = !time
var(15) = 1

[State 3100, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3100, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1

[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3100, Snd]
type = playsnd
trigger1 = time = 4 && var(1) != 2
value = 5, 0
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = time = 4 && var(1) = 2
value = 9, 15
channel = 0

[State 3100, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(37 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3100, statetype]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
physics = N

[State 3100, Vel]
type = veladd
trigger1 = animelemtime(3) >= 2 && vel x > 0
x = -.1

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(3) >= 2
y = 0.5

[State 3100, Vel]
type = velset
trigger1 = animelemtime(3) = 2
x = 6.25
y = -9.25

[State 3100, Vel]
type = velset
trigger1 = animelem = 13
trigger2 = vel x < 0
x = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) != 2
value = 5, 1
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) = 2
value = 9, 16
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
channel = 1

[State 3100, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < (4 + hitcount) || var(37))
;trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -2.75, -9.33
guard.velocity = 0
air.velocity = -2.75, -9.33
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = sifelse(hitcount, -1, 2), 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3100, hitsound]
type = playsnd
trigger1 = hitcount > 1
trigger1 = movehit = 1 && hitpausetime = 1
value = 2, 2
channel = 2
ignorehitpause = 1

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3101


;--- Land ---
[Statedef 3101]
type = S
physics = N
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3101, Pos]
type = posset
trigger1 = 1
y = 0

[State 3101, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3101, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KOU'OU KEN >====
[Statedef 3150]
type = S
physics = N
movetype = A
anim = 3150
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000
facep2 = 1

[State 3150, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3150, Super Level]
type = varadd
trigger1 = !time
var(15) = 1

[State 3150, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3150, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1

[State 3150, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3150, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3150, Snd]
type = playsnd
trigger1 = time = 4 && var(1) != 2
value = 5, 0
channel = 0

[State 3150, Snd]
type = playsnd
trigger1 = time = 4 && var(1) = 2
value = 9, 15
channel = 0

[State 3150, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(37 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3150, superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3150, statetype]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
physics = N

[State 3150, Vel]
type = veladd
trigger1 = animelemtime(3) >= 2 && vel x > 0
x = -.1

[State 3150, Accel]
type = veladd
trigger1 = animelemtime(3) >= 2
y = 0.5

[State 3150, Vel]
type = velset
trigger1 = animelemtime(3) = 2
x = 6.25
y = -9.25

[State 3150, Vel]
type = velset
trigger1 = animelem = 13
trigger2 = vel x < 0
x = 0

[State 3150, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) != 2
value = 5, 1
channel = 0

[State 3150, Snd]
type = playsnd
trigger1 = animelem = 4 && var(1) = 2
value = 9, 16
channel = 0

[State 3150, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
channel = 1

[State 3150, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < (4 + hitcount) || var(37))
;trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger1 = animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 5, 5
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -2.75, -9.33
guard.velocity = 0
air.velocity = -2.75, -9.33
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = sifelse(hitcount, -1, 2), 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3150, hitsound]
type = playsnd
trigger1 = hitcount > 1
trigger1 = movehit = 1 && hitpausetime = 1
value = 2, 2
channel = 2
ignorehitpause = 1

[State 3150, Type]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3150, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3101
;==< KILLER SATELLITE-BOUND PUNCH >====
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -3000
facep2 = 1

[State 3200, Button]
type = varset
trigger1 = var(10) != 2
var(10) = 2

[State 3200, Super Level]
type = varadd
trigger1 = !time
var(15) = 3

[State 3200, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3200, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3200, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1
[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 67

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(9) < 0
time = 1
value = SCA

[State 3200, Snd]
type = playsnd
trigger1 = time = 4 && var(1) != 2
value = 4, 0
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = time = 4 && var(1) = 2
value = 9, 7
channel = 0

[State 3200, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-37 * const(size.xscale)), ceil(-49 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, superpause]
type = superpause
trigger1 = time = 4
time = 67
movetime = 67
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 5 && var(1) != 2
value = 4, 12
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 5 && var(1) = 2
value = 9, 8
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 2
channel = 1

[State 3200, Pos]
type = posadd
trigger1 = animelem = 5
x = ceil(30 * const(size.xscale))

[State 3200, Pos]
type = posadd
trigger1 = animelem = 6
x = ceil(12 * const(size.xscale))

[State 3200, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(37))
trigger1 = animelem = 7
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 9
getpower = 0, 0
givepower = 36, 36
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0;-24.4
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -55
hitsound = s2, 6
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3200, Dust]
type = helper
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = 60, 0
ownpal = 1

[State 3200, next]
type = changestate
triggerall = movecontact || movereversed
triggerall = animelemtime(7) >= 0 && animelemtime(9) < 0
trigger1 = !AIlevel && command = "qcfp"
trigger2 = AIlevel
value = 3201

[State 3200, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Connected ---
[Statedef 3201]
type = S
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3201, Pos]
type = posadd
trigger1 = animelem = 1
x = ceil(22 * const(size.xscale))
[State 3201, Pos]
type = posadd
trigger1 = animelem = 2
x = ceil(19 * const(size.xscale))
[State 3201, Pos]
type = posadd
trigger1 = animelem = 3
x = ceil(24 * const(size.xscale))
[State 3201, Pos]
type = posadd
trigger1 = animelem = 4
x = ceil(22 * const(size.xscale))

[State 3201, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) != 2
value = 4, 7
channel = 0

[State 3201, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 2
value = 9, 1
channel = 0

[State 3201, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 3201, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(37))
trigger1 = animelem = 4
ID = 3200
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 9
getpower = 0, 0
givepower = 36, 36
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0;-24.4
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -55
hitsound = s2, 6
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3201, Dust]
type = helper
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = 60, 0
ownpal = 1

[State 3201, next]
type = changestate
triggerall = movecontact || movereversed
triggerall = animelemtime(4) >= 0 && animelemtime(6) < 0
trigger1 = !AIlevel && command = "hcfp"
trigger2 = AIlevel
value = 3202

[State 3201, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 3201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Third ---
[Statedef 3202]
type = S
physics = N
movetype = A
anim = 3202
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3202, Pos]
type = posadd
trigger1 = animelem = 2
x = ceil(19 * const(size.xscale))
[State 3202, Pos]
type = posadd
trigger1 = animelem = 3
x = ceil(24 * const(size.xscale))
[State 3202, Pos]
type = posadd
trigger1 = animelem = 4
x = ceil(22 * const(size.xscale))

[State 3202, Vel]
type = velset
trigger1 = animelem = 6
x = 8
[State 3202, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 3202, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 12
channel = 0
[State 3202, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 2
channel = 1

[State 3202, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(37))
trigger1 = animelem = 7
ID = 3200
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 9
getpower = 0, 0
givepower = 36, 36
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -55
hitsound = s2, 6
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
kill = 0

[State 3202, Dust]
type = helper
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = 60, 0
ownpal = 1

[State 3202, next]
type = changestate
trigger1 = movecontact || movereversed
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
value = 3203

[State 3202, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 3202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Beam ---
[Statedef 3203]
type = S
physics = N
movetype = A
anim = 3203
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3203, Dust]
type = helper
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = 60, 0
ownpal = 1

[State 3203, Beam]
type = helper
trigger1 = !time
trigger1 = numtarget(3200)
helpertype = normal
stateno = 3250
ID = 3250
name = "Satellite Beam"
postype = p1
pos = ceil(target(3200), pos x -pos x) * facing, 0
size.xscale = 0.5
size.yscale = 16
ownpal = 1

[State 3203, End]
type = changestate
trigger1 = !numhelper(3250)
trigger2 = time >= 60
value = 3204

[State 3203, Vel]
type = velmul
trigger1 = 1
x = 0.7
[State 3203, Vel]
type = velset
trigger1 = !time
x = -30

[State 3203, glow]
type = helper
trigger1 = !numhelper(3206)
helpertype = normal
stateno = 3206
ID = 3206
name = "Lighting FX"
postype = p1
ownpal = 1
[State 3203, glow]
type = palfx
trigger1 = numhelper(3206)
time = 1
mul = 128, 128, 128


;--- Beam Over ---
[Statedef 3204]
type = S
physics = N
movetype = I
anim = 3204
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 3204, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KISAKI NO KAKOU >====
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3300, Button]
type = varset
trigger1 = var(10) != 1
var(10) = 1

[State 3300, Super Level]
type = varadd
trigger1 = !time
var(15) = 2

[State 3300, Super Cancels]
type = varadd
triggerall = !time
trigger1 = numenemy
trigger1 = (prevstateno = [3000, 4999]) || var(16)
trigger1 = (enemynear, movetype = H && enemynear, statetype != L)
trigger2 = var(20)
var(16) = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Dampener]
type = varset
trigger1 = !time
fvar(10) = ifelse(var(20), 0.8, 1.0 / (1 + var(16)))
ignorehitpause = 1

[State 3300, ECjuggle]
type = varset
trigger1 = var(20) > 0
var(37) = 1
ignorehitpause = 1

[State 3300, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 55
[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3300, Snd]
type = playsnd
trigger1 = time = 4
value = 6, 1
channel = 0

[State 3300, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(11 * const(size.xscale)), ceil(-38 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3300, superpause]
type = superpause
trigger1 = time = 4
time = 55
movetime = 55
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 3300, Vel]
type = velset
trigger1 = animelem = 3
x = 9
y = 9

[State 3300, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 3300, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(37))
trigger1 = !movecontact && !movereversed
ID = 3300
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 0
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 30
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -9.22, 0
guard.velocity = -9.22
air.velocity = -5, 1.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -20
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
kill = 0

[State 3300, p2state]
type = targetstate
trigger1 = movehit && numtarget(3300)
trigger1 = target(3300), statetype != A
ID = 3300
value = 3302
ignorehitpause = 1
[State 3300, p1state]
type = changestate
trigger1 = movehit && numtarget(3300)
trigger1 = target(3300), statetype != A
value = 3310
ignorehitpause = 1

[State 3300, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3301


;--- Land ---
[Statedef 3301]
type = S
physics = S
movetype = I
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3301, Pos]
type = posset
trigger1 = 1
y = 0

[State 3301, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- --Target -----
[Statedef 3302]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 3302, Anim]
type = changeanim
trigger1 = 1
value = 5012
[State 3302, Pos]
type = posset
trigger1 = 1
y = 0
[State 3302, fall]
type = hitfallset
trigger1 = 1
value = 0
[State 3302, End]
type = changestate
trigger1 = time >= 30
value = 3303

[Statedef 3303]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 3303, Anim]
type = changeanim
trigger1 = !time
value = 5017
[State 3303, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 3303, End]
type = selfstate
trigger1 = time >= 30
value = 5000


;--- Ressen Ha ---
[Statedef 3310]
type = A
physics = N
movetype = A
anim = 3310
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3310, Push]
type = playerpush
trigger1 = 1
value = 0
[State 3310, Pos]
type = bindtotarget
trigger1 = !time
trigger1 = numtarget(3300)
ID = 3300
pos = 0, -(target(3300), const(size.height))

[State 3310, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.4
[State 3310, Vel]
type = velset
trigger1 = animelem = 3
x = 0
y = -5

[State 3310, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 4
channel = 0
[State 3310, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
channel = 1
[State 3310, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40

[State 3310, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(37))
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -5.33, -6.46
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -32
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3310, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3311


;--- Combo ---
[Statedef 3311]
type = S
physics = N
movetype = A
anim = 3311
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3311, Pos]
type = posset
trigger1 = !time
y = 0
[State 3311, Pos]
type = posadd
trigger1 = animelem = 5
x = ceil(40 * const(size.yscale))
[State 3311, Pos]
type = posadd
trigger1 = animelem = 11
x = ceil(36 * const(size.yscale))

[State 3311, Vel]
type = veladd
trigger1 = vel x > 0
x = -.2
[State 3311, Vel]
type = velset
trigger1 = vel x < 0
x = 0
[State 3311, Vel]
type = velset
trigger1 = animelem = 12
x = 6

[State 3311, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0
[State 3310, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 5
channel = 0
[State 3310, Snd]
type = playsnd
trigger1 = animelem = 14
value = 4, 8
channel = 0
[State 3311, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 6
value = 1, 2
channel = 1
[State 3311, Snd]
type = playsnd
trigger1 = animelem = 13 || animelem = 16
value = 1, 5
channel = 1

[State 3311, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3311, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 14, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3311, hit low]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 1 || animelem = 13
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.33, -6.45
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -22
hitsound = s2, ifelse((animelem = 13), 5, 2)
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3311, hit high]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 7
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.33, -6.45
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-9.83
guard.cornerpush.veloff = 0;-9.83
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -74
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3311, hit final]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 17
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -7.5, -10
guard.velocity = -9.22
air.velocity = -7.5, -10
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-9.22
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 3311, statetype]
type = statetypeset
trigger1 = animelemtime(19) >= 0
movetype = I

[State 3311, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;------------------------------------------
;Ultimate counter
[Statedef 3400]
type = S
physics = N
movetype = I
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -3000
facep2 = 1

[State 0, assert]
type = assertspecial
triggerall = Time = [5, 45] ;&& NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
flag = unguardable
ignorehitpause = 1

[State 0, snd]
type = playsnd
trigger1 = Time = 5
value = S4, 10
channel = 0

[State 0, Width]
type = Width
trigger1 = 1
edge = 5, 0

[State 0, Super]
type = superpause
trigger1 = time = 5
time = 35
movetime = 35
p2defmul = 1
unhittable = 1
anim = -1
sound = S0, 8500
darken = 0

[State 0, FX]
type = helper
trigger1 = time = 5
helpertype = normal
stateno = 8530
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(36 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 0, Snd]
type = playsnd
trigger1 = animelem = 2
value = S51, 3

[State 0, cheat]
type = nothitby
trigger1 = AnimElemtime(3) < 0
value = SCA

[State 0, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = SA, NA, SA, HA
pausetime = 0, 20
sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = 0 * (var(35) := 86), var(36) := 0
hitsound = S6, 1
p1stateno = 3510

[State 0, End]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3450]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 0, self]
type = selfstate
trigger1 = IShelper
value = prevstateno
ignorehitpause = 0

[State 0, anim]
type = changeanim
trigger1 = 1
value = anim
elem = AnimElemno(0)

[State 0, assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 0, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, pos]
type = posset
trigger1 = !time;time > 100 ;might need to increase this
y = 0

[State 0, self]
type = selfstate
trigger1 = time > 200 ;might need to increase this
value = 0
ctrl = 1

[Statedef 3451]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 0, anim]
type = changeanim2
trigger1 = !time
value = 3405

[State 0, self]
type = selfstate
trigger1 = IShelper
value = prevstateno
ignorehitpause = 0

[State 0, assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 0, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, pos]
type = posset
trigger1 = !time;time > 100 ;might need to increase this
y = 0

;[State 0, self]
;type = selfstate
;trigger1 = time > 15 ;might need to increase this
;value = 0
;ctrl = 1

[Statedef 3452]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 0, anim]
type = changeanim2
trigger1 = !time
value = 5002

[State 0, self]
type = selfstate
trigger1 = IShelper
value = prevstateno
ignorehitpause = 0

[State 0, assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 0, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, pos]
type = posset
trigger1 = !time;time > 100 ;might need to increase this
y = 0

[State 0, self]
type = selfstate
trigger1 = time > 100 ;might need to increase this
value = 0
ctrl = 1

[Statedef 3407]
type = S
movetype = A
physics = N
anim = 3401
ctrl = 0
poweradd = 0
velset = 0, 0
sprpriority = 2
facep2 = 1

[State 0, target]
type = targetstate
trigger1 = !time
value = 3450

[State 0, nothitby]
type = nothitby
trigger1 = 1
value = SCA

[State 0, Snd]
type = playsnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 14
trigger3 = AnimElem = 24
value = S1, 3

[State 0, snd]
type = playsnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 14
value = S9, 0
channel = 0

[State 0, Snd]
type = playsnd
trigger1 = AnimElem = 24
value = S9, 8

[State 0, Vel]
type = VelSet
trigger1 = AnimElem = 1
trigger2 = AnimElem = 12
x = 3.90626
y = 0

[State 0, vel]
type = VelAdd
trigger1 = AnimElemTime(1) > 0
trigger2 = AnimElemtime(12) > 0
x = ifElse(Vel X <= 0, 0, -.125)  ;-.208337

[State 0, hit]
type = HitDef
trigger1 = AnimElem = 6
attr = S, HA
damage = 77, 7
animtype = Hard
air.animtype = back
fall.animtype = back
guardflag = L
hitflag = MAF
priority = 7, Hit
pausetime = 25, 25
;sparkno = 10+(random%4)
;guard.sparkno = 41
;sparkxy = -15, -55
hitsound = S2, 2
guardsound = s3, 0
ground.type = Low
ground.slidetime = 45
ground.hittime = 45
ground.velocity = -5.77
air.type = Low
air.velocity = -2, -5
air.hittime = 120
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
getpower = 0
fall.recover = 1
fall.recovertime = 120
air.recover = 0
;p2stateno = 901
p1facing = 1
p2facing = 1
p2stateno = 3451
kill = 0
envshake.time = 35
fall.envshake.time = 0
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0
sparkno = S-1 + 0 * (var(33) := 8014)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36) := -55
kill = 0
ID = 3400

[State 0, hit]
type = HitDef
trigger1 = AnimElem = 15
attr = S, HA
damage = 77, 7
animtype = Hard
air.animtype = back
fall.animtype = back
guardflag = L
hitflag = MAF
priority = 7, Hit
pausetime = 25, 25
;sparkno = 10+(random%4)
;guard.sparkno = 41
;sparkxy = -15, -55
hitsound = S2, 2
guardsound = s3, 0
ground.type = High
ground.slidetime = 45
ground.hittime = 45
ground.velocity = -5.77
air.type = High
air.velocity = -2, -5
air.hittime = 120
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
getpower = 0
fall.recover = 1
fall.recovertime = 120
air.recover = 0
;p2stateno = 901
p1facing = 1
p2facing = 1
p2stateno = 3452
kill = 0
envshake.time = 35
fall.envshake.time = 0
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0
sparkno = S-1 + 0 * (var(33) := 8014)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36) := -65
kill = 0
ID = 3400

[State 0, hit]
type = HitDef
trigger1 = AnimElem = 24 || AnimElem = 25
attr = S, HA
damage = 70, 14
animtype = Up
air.animtype = back
fall.animtype = back
guardflag = L
hitflag = MAF
priority = 7, Hit
pausetime = 10, 18
;sparkno = 10+(random%4)
;guard.sparkno = 41
;sparkxy = -15, -55
hitsound = S2, 2
guardsound = s3, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x < 60, -1, ifelse(((p2bodydist x = [60, 90])), 1.5, 3)), -12
air.type = Low
air.velocity = ifelse(p2bodydist x < 60, -1, ifelse(((p2bodydist x = [60, 90])), 1.5, 3)), -12
air.hittime = 120
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
fall = 1
getpower = 0
forcestand = 1
fall.recover = 1
fall.recovertime = 120
air.recover = 0
;p2stateno = 901
p1facing = 1
p2facing = 1
kill = 0
envshake.time = 35
fall.envshake.time = 0
fall.envshake.freq = 0.0
fall.envshake.ampl = 0
fall.envshake.phase = 0.0
sparkno = S-1 + 0 * (var(33) := 8014)
guard.sparkno = S-1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36) := -60
kill = 0
ID = 3400

[State 0, end]
type = changestate
trigger1 = animtime = 0
value = ifelse(movehit, 3401, 0)
ctrl = 1

[Statedef 3401]
type = A
movetype = I
physics = N
anim = 3402
ctrl = 0
sprpriority = 1
velset = 0,0

[State 0, snd]
type = playsnd
trigger1 = Animelem = 2
value = S9, 6
channel = 0

[State 0, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 0, cheat]
type = nothitby
trigger1 = 1
value = SCA

[State 0, snd]
type = playsnd
trigger1 = AnimElemtime(1) = 0
value = S40, 0

[State 0, vel]
type = velset
trigger1 = AnimElem = 2
x = p2bodydist x * 0.1;ifelse(p2bodydist x >= 30, 11, 5)
y = p2bodydist y * 0.1;-8

[State 0, vel]
type = veladd
trigger1 = AnimElemtime(2) > 0
y = .5

[State 0, end]
type = changestate
trigger1 = time = 10 || p2bodydist x < 25 && (p2bodydist y = [-10, 10])
value = 3402
ctrl = 1

[State 0, change]
type = changestate
trigger1 = pos y >= 0 && vel y > 0
value = 52
ctrl = 1

[Statedef 3402]
type = A
movetype = A
physics = A
ctrl = 0
anim = 3403
sprpriority = 2

[State 0, voice]
type = playsnd
trigger1 = AnimElem = 3
value = S9, 2
channel = 0

[State 0, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = A, NT
hitflag = MAF
priority = 7, Dodge
pausetime = 0, 0
sparkno = -1
p2facing = 1
p1stateno = 3403
guard.dist = 0
getpower = 120
givepower = 90
numhits = 0
ID = 3400

[State 0, ChangeState]
type = ChangeState
trigger1 = !MoveHit && !AnimTime
value = 620
ctrl = 1

[Statedef 3403]
type = A
movetype = A
physics = N
velset = 0,0
anim = 860

[State 0, Throw]
type = TargetState
trigger1 = Time = 0
value = 3406

[State 0, Width]
type = Width
trigger1 = 1
edge = 45,0

[State 0, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0, 800

[State 0, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S9, 13
channel = 0

[State 0, Bind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(37*const(size.xscale)), ceil(-23*const(size.yscale))
postype = P1
time = -1

[State 0, Bind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0, ceil(-23*const(size.yscale))
postype = P1
time = -1

[State 0, Bind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(33*const(size.xscale)), ceil(-67*const(size.yscale))  ;18
postype = P1
time = -1

[State 0, Bind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(50*const(size.xscale)), ceil(-61*const(size.yscale)) ;50 ;35,-75
postype = P1
time = -1

[State 0, Bind]
type = TargetBind
trigger1 = AnimElem = 5
pos = ceil(45*const(size.xscale)), ceil(-30*const(size.yscale))
postype = P1
time = -1

[State 0, vel]
type = velset
trigger1 = AnimElem = 3
x = 3
y = -4

[State 0, Vel]
type = VelAdd
trigger1 = animelemtime(3) > 0
x = ifelse(vel x <= 0, 0, -.02666666)
y = .5

[State 0, change]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3404

[Statedef 3404]
type = S
movetype = A
physics = N
velset = 0,0
anim = 815

[State 0, Throw]
type = TargetState
trigger1 = Time = 0
value = 3405

[State 0, posset]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0,bind]
type = TargetBind
trigger1 = animelem = 1
pos = ceil(15*const(size.xscale)), 0
postype = P1
time = 1

[State 0, Hits]
type = HitAdd
trigger1 = AnimElem = 1
value = 1

[State 0, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 1
value = -140

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = 20

[State 0, playsnd]
type = playsnd
trigger1 = AnimElem = 1
value = S90, 0

[State 0, Impact Dust]
type = Helper
trigger1 = AnimElem = 1 
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0,0
ownPal = 1

[State 0, snd]
type = playsnd
trigger1 = AnimElem = 1
value = S0, 5100

[State 0, change]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 3405]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, Anim2]
type = ChangeAnim
trigger1 = !Time
value = 5100

[State 0, Anim]
type = ChangeAnim
trigger1 = anim = 5100 && animtime = 0
value = 5110

[State 0, self]
type = SelfState
trigger1 = time >= 45
value = ifelse(!alive, 5150, 5120)

[Statedef 3406]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 0, Anim2]
type = ChangeAnim2
trigger1 = !Time
value = 861

[State 0, bound]
type = screenbound
trigger1 = 1
value = 1

;------------------------------------------------------------------------
[Statedef 3510]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3510
juggle = 0
poweradd = 0

[State 800, 1]
type = HitDef
Trigger1 = time=0
attr = S, HT          ;Attributes: Standing, Normal Throw
hitflag = MAF          ;Affect only ground people who are not being hit
guardflag = -1
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1
hitsound = s0, 800          ;No spark
sprpriority = 1       ;Draw in front of p2
p2facing = 1          ;Force p2 to face player
p1stateno = 3511
p2stateno = 3515
fall = 1
fall.recover = 0
ID = 3500

[State 820, 1]
type = ChangeState
Trigger1 = animtime = 0
value = 0
ctrl = 1

;====
;------------------------------------------------------------------------
[Statedef 3511]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3511
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 820, 1]
type = ChangeState
Trigger1 = animtime = 0
value = 3520
ctrl = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 =  1
value = 0

;---------------------------------------------------------------------------
; P2 throw 02
[Statedef 3515]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 =  1
value = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3515

[State 820, 1]
type = ChangeState
Trigger1 = p2stateno = 3520
value = 3525
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3520]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3520
juggle = 0
poweradd = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 =  1
value = 0

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, TargetFacing]
type = TargetFacing
trigger1 = time = 0
value = -1
persistent = 0

[State 820, 1]
type = ChangeState
Trigger1 = animtime = 0
value = 3530
ctrl = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 || animelem = 27
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
trigger2 = animelem = 15 || animelem = 20 || animelem = 28
x = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 || animelem = 27
anim = 8105
sprpriority = 2
postype = p1
pos = 40,5
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.8
ownpal = 1
ignorehitpause =1
;persistent = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 
value = 1
;ignorehitpause =
;persistent =

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 
value = -40
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 
time = 11
freq = 110
ampl = -8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6 || animelem = 14 || animelem = 19  
value = 1,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = animelem = 14
value = 2,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 19
value = 2,2

[State 0, snd]
type = playsnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
value = S4, 6
channel = 0

[State 0, snd]
type = playsnd
trigger1 = AnimElem = 19
value = S4, 4
channel = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 6 || animelem = 14 || animelem = 19
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(40 * const(size.xscale)), ceil(-55 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1


;---------------------------------------------------------------------------
; P2 throw 02
[Statedef 3525]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
trigger2 = animelem = 14 || animelem = 19 || animelem = 27
x = -2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
trigger2 = animelem = 15 || animelem = 20 || animelem = 28
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 =  1
value = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3525

[State 820, 1]
type = ChangeState
Trigger1 = p2stateno = 3530
value = 3535
ctrl = 0

;---------------------------------------------------------------------------
[Statedef 3530]
type = S
movetype= A
physics = N
anim = 3530
velset = 0,0
ctrl = 0

[State 0, FX]
type = helper
trigger1 = time = 0
helpertype = normal
stateno = 8535
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, superpause]
type = superpause
trigger1 = time = 0
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 0, mode]
type = varset
trigger1 = animelem = 1
var(1) = ifelse(var(1) = 2, 1, 2)

[State 0, RemapPal]
type = RemapPal
trigger1= animelem=1
source = 1,1
dest = 1,Ifelse(var(1)=2,palno+6,palno)

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 11
freq = 110
ampl = -4

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 11
freq = 110
ampl = -11

[state bgpalfx]
type=bgpalfx
triggerall=anim=3530
trigger1=animelemtime(1)=0
time=4
invertall=1

[state palfx]
type=palfx
triggerall=anim=3530
triggerall=time>=0
triggerall=time<=43
trigger1=(gametime%4)=0
add=0,50,255
sinadd=0,-50,-255,10
time=10

[state palfx/2]
type=palfx
triggerall=anim=3530
triggerall=time>=0
triggerall=time<=43
trigger1=(gametime%3)=0
add=0,250,255
sinadd=0,-250,-255,10
time=10

[state palfx/3]
type=palfx
triggerall=anim=3530
triggerall=time>=0
triggerall=time<=43
trigger1=(gametime%3)=0
add=200,120,120
sinadd=200,-200,-50,10
time=10

[state effect]
type=playsnd
triggerall=anim=3530
trigger1=animelemtime(1)=40
value=9,18

[state effect/2]
type=playsnd
triggerall=anim=3530
trigger1=animelemtime(1)=40
value=9,19

[State 0, VelSet]
type = posadd
trigger1 = time = 0
x = -30

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 102
value = 3540
ctrl = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem =5 || animelem = 7
time = 4
freq = 100
ampl = 6

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(60 * const(size.xscale)), ceil(-60 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 7
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(40 * const(size.xscale)), ceil(-30 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 7 
value = 1,1
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 2,1
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 2,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 192,0
channel = 1

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem =5 || animelem = 7
value = 2
;ignorehitpause =
;persistent =

;---------------------------------------------------------------------------
; P2 throw 02
[Statedef 3535]
type = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3535

[State 820, 1]
type = ChangeState
Trigger1 = p2stateno=3540
value = 3545
ctrl = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = animelem = 4 || animelem = 6
value = -10
kill = 0

;---------------------------------------------------------------------------
[Statedef 3540]
type = S
movetype= A
physics = N
anim = 3540
velset = 0,0
ctrl = 0

[State 0, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(50 * const(size.xscale)), ceil(-60 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 3
value = 1
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 2,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3 
value = 1,1
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 9,7
channel = 4

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3407
ctrl = 1

;---------------------------------------------------------------------------
; P2 throw 02
[Statedef 3545]
type = A
movetype= H
physics = N
velset = 0,0
ctrl = 0

[State 0, LifeAdd]
type = LifeAdd
Trigger1 = animtime = 0
value = -10
kill = 0
absolute = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3545

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = -10
y = 0

[State 820, 1]
type = ChangeState
Trigger1 = animtime = 0
value = 3451
ctrl = 0


;==< NEKKETSU HADOU KEN >=
[Statedef 4300]
type = S
physics = S
movetype = A
anim = 4300
ctrl = 0
velset = 0, 0
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4300, Snd]
type = playsnd
trigger1 = !time
value = 6, 1
channel = 0
volume = 200

[State 4300, focus]
type = helper
trigger1 = anim = 4300 && animelem = 2
helpertype = normal
stateno = 3004
ID = 3004
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300

[State 4300, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8535
ID = 8500
name = "Superpause FX"
posType = P1
pos = -20, -63
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
sound = s0,8500
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 4300 && animelem = 2
fvar(5) = 0

[State 4300, NHB]
type = nothitby
trigger1 = anim = 4300 || (anim = 4301 && animelemtime(2) < 2)
time = 1
value = SCA

[State 4300, width]
type = width
trigger1 = anim = 4301 && animelemtime(2) < 0
trigger2 = anim = 4301 && animelemtime(12) >= 0 && animelemtime(13) < 0
value = 13
[State 4300, width]
type = width
trigger1 = anim = 4301 && animelemtime(2) >= 0 && animelemtime(12) < 0
value = 26

[State 4300, Anim]
type = changeanim
trigger1 = anim = 4300 && time >= 40
value = 4301

[State 4300, Hadouken]
type = helper
trigger1 = anim = 4301 && animelem = 2
helpertype = normal
stateno = 4305
ID = 4305
name = "Hadouken"
postype = p1
pos = 86, -54
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 4300, Dust]
type = explod
trigger1 = anim = 4301 && animelem = 2
vel = 0, 0
anim = 8105
ID = 8105
sprpriority = 3
postype = p1
pos = 40, 0
scale = 1, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4300, Snd]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 4, 1;3, 3
channel = 0

[State 4300, Snd]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 5, 0

[State 4300, End]
type = changestate
trigger1 = anim = 4301 && animelemtime(17) < 0
trigger1 = numenemy = 1 && numhelper(4305)
trigger1 = helper(4305), var(3) && helper(4305), movehit
value = 4301
[State 4300, End]
type = changestate
trigger1 = anim = 4301 && !animtime
value = 0
ctrl = 1


;--- OFF SCREEN ---
[Statedef 4301]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4301, Anim]
type = changeanim
trigger1 = !time && anim != 4301
value = 4301

[State 4301, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 4301, NHB]
type = nothitby
trigger1 = animelemtime(2) < 0 
time = 1
value = SCA

[State 4301, width]
type = width
trigger1 = animelemtime(2) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(13) < 0
value = 13

[State 4301, width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(12) < 0
value = 26

[State 4301, End]
type = changestate
trigger1 = !animtime
value = ifelse((backedgebodydist < 0 || frontedgebodydist < 0), 110, 0)
ctrl = 1



;==< MODE CHANGE >=
[Statedef 4400]
type = S
physics = S
movetype = I
anim = 4400
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = -1
facep2 = 1

[state envshake]
type=envshake
triggerall=anim=4400
trigger1=animelemtime(1)=30||animelemtime(1)=35||animelemtime(1)=40
time=20
freq=70
ampl=20

[state bgpalfx]
type=bgpalfx
triggerall=anim=4400
trigger1=animelemtime(1)=40
time=4
invertall=1

[state palfx]
type=palfx
triggerall=anim=4400
triggerall=time>=0
triggerall=time<=40
trigger1=(gametime%4)=0
add=0,50,255
sinadd=0,-50,-255,10
time=10

[state palfx/2]
type=palfx
triggerall=anim=4400
triggerall=time>=0
triggerall=time<=40
trigger1=(gametime%3)=0
add=0,250,255
sinadd=0,-250,-255,10
time=10

[state palfx/3]
type=palfx
triggerall=anim=4400
triggerall=time>=0
triggerall=time<=40
trigger1=(gametime%3)=0
add=200,120,120
sinadd=200,-200,-50,10
time=10

[state effect]
type=playsnd
triggerall=anim=4400
trigger1=animelemtime(1)=40
value=9,18

[state effect/2]
type=playsnd
triggerall=anim=4400
trigger1=animelemtime(1)=40
value=9,19


[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4400, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 4400, Snd]
type = playsnd
trigger1 = !time && var(1) = 2
value = 4, 1
channel = 0
volume = 200

[State 4400, Snd]
type = playsnd
trigger1 = !time && var(1) != 2
value = 9, 8
channel = 0
volume = 200

[State 4400, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 0, -55
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
sound = s0,8500
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 3
fvar(5) = 0

[State 4400, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 4400, spr]
type = sprpriority
trigger1 = time
value = -1

[State 4400, mode]
type = varset
trigger1 = animelem = 3
var(1) = ifelse(var(1) = 2, 1, 2)

[State 0, RemapPal]
type = RemapPal
trigger1= animelem=3
source = 1,1
dest = 1,Ifelse(var(1)=2,palno+6,palno)

[State 4400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

; Shun Goku Satsu (Adapted from P.o.t.S. version)
[Statedef 4500]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 4500
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
Time = 1
value = SCA

[State 3000, No Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = (PrevStateNo = [1000,2999]) && var(6)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(7)

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
Time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle Reset]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
StateNo = 8540
ID = 8530
name = "Superpause FX"
posType = P1
pos = 15, -55
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
Time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s0,8500
darken = 0
poweradd = 0

[State 3000, Voice Start]
type = PlaySnd
trigger1 = AnimElem = 1
value = 9, 7
channel = 0

[State 3000, FX]
type = PlaySnd
trigger1 = AnimElem = 2
value = 9, 17
channel = 1

[State 4000, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 7

[State 4000, Hitdef]
type = HitDef
trigger1 = Time
trigger1 = !Var(38)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 12
attr = S,HT
hitFlag = M-
priority = 7,Miss
getPower = 0,0
givePower = 0,0
numhits = 0
sparkno =  -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1Stateno = 4501
p2getp1State = 1
hitsound = s800, 0
fall = 1
fall.recover = 0
ID = 4500

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime 
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Success
[Statedef 4501]
type = S
movetype = A
physics = N
anim = 4501
velset = 0, 0
poweradd = 0
sprpriority = 1

[State 4500, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 4500, More Safety]
type = NotHitBy
trigger1 = 1
value = SCA

[State 4500, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 4502



[State 4501, Push]
type = PlayerPush
trigger1 = AnimElemTime(17) >= 0
value = 0

[State 4501, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(17) < 0
value = SCA
Time = 1

[State 4501, Black]
type = AllPalFX
trigger1 = AnimElemTime(2) = -16
Time = 16
sinadd = -255, -255, -255, 64

[State 4501, More Black]
type = EnvColor
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(17) < 0
Time = 4
value = 0, 0, 0

[State 4501, No Bars]
type = AssertSpecial
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(17) < 0
flag = NoBarDisplay
flag2 = noFG

[State 4501, Sprite Priority]
type = SprPriority
trigger1 = AnimElemTime(17) >= 0
value = 1

[State 4501, Bind]
type = TargetBind
trigger1 = AnimElemTime(17) < 0
pos = 45, 0

[State 4501, HitAdd]
type = HitAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 1

[State 4501, Damage]
type = TargetLifeAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = -29
kill = AnimElem = 16

[State 4501, Give Power]
type = TargetPowerAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 36

[State 810, VarAdd]
type = VarAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
var(13) = 1

[State 4501, Hit Sound]
type = PlaySnd
trigger1 = (Time = [32,89]) && !(Time % 5)
value = 2, 2
channel = 2

[State 4501, Final Hit Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 2, 9
channel = 2

[State 4501, Voice]
type = PlaySnd
triggerall = !WinKo
trigger1 = AnimElemTime(16) = 5
value = 9, 10
channel = 0

[State 820, Hit Spark]
type = Helper
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
helperType = Normal
StateNo = 8015
ID = 8000
name = "Spark"
posType = P2
pos = 0, (Target, Const(size.mid.pos.y))
onTop = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
sprpriority = 5

[State 4501, Shake]
type = EnvShake
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
Time = 6
freq = 120
ampl = -4

[State 4500, TargetState]
type = TargetState
trigger1 = AnimElemTime(16) >= 0 && NumTarget
value = 4503

[State 810, State End (Win)]
type = ChangeState
trigger1 = AnimElemTime(16) >= 0 && WinKo
value = 188

[State 810, State End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Target 1
[Statedef 4502]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4502, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 4502

;Target 2
[Statedef 4503]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 4503, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 4503

[State 4503, End]
type = SelfState
trigger1 = !Alive
value = 5150

[State 4503, End]
type = SelfState
trigger1 = Time >= 76 && Alive
value = 5120

