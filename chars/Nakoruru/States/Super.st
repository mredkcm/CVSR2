; ___________________________________
;| Nakoruru by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SUPER STATES >====
;====

;==< ELERUSH KAMUI RIMSE >=
[Statedef 3000]
type = A
physics = N
movetype = I
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 3000, Snd]
type = playsnd
trigger1 = !time
value = 0, 40
[State 3000, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3000, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 3000, Vel]
type = velset
trigger1 = !time
y = -8

[State 3000, ok]
type = changestate
trigger1 = time >= 10 && pos y <= -52
trigger1 = numhelper(10000)
trigger1 = pos y <= (helper(10000), pos y + 94)
value = ifelse(power >= 2000, 3001, 1509)

[State 3000, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1591


;--- Caught ---
[Statedef 3001]
type = A
physics = N
movetype = A
anim = 3001
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3001, Button]
type = varset
trigger1 = var(10) != 1
var(10) = 1

[State 3001, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3001, OC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3001, unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 55
[State 3001, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
time = 1
value = SCA

[State 3001, superpausefx]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = 5, -83
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3001, superpause]
type = superpause
trigger1 = time = 3
time = 55
movetime = 55
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3001, End]
type = changestate
trigger1 = !animtime
value = 3010


;--- Dive ---
[Statedef 3010]
type = A
physics = N
movetype = A
anim = 3010
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3010, Pos]
type = posadd
trigger1 = !time
trigger1 = prevstateno = 3001
y = -16
[State 3010, Vel]
type = velset
trigger1 = 1
x = 12.635
y = 5.985

[State 3010, Snd]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0
[State 3010, Snd]
type = playsnd
trigger1 = !time
value = 7, 1

[State 3010, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
supermovetime = var(17)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 3010, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 27, -4
supermovetime = var(17)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3010, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(28))
trigger1 = !time
ID = 3000
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7 * (var(15) <= 2)
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 48
ground.slidetime = 48
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 38), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3010, Blood]
type = helper
trigger1 = hitpausetime = 11
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = ifelse((target, facing = facing), 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3010, p1state]
type = changestate
trigger1 = movehit = 1 && numtarget(3000)
trigger1 = (target(3000), statetype != A) && !(target(3000), hitshakeover)
value = 3019
ignorehitpause = 1
[State 3010, p1state]
type = changestate
trigger1 = movehit = 1 && !numtarget
trigger2 = moveguarded = 1 || movereversed = 1
value = 3015

[State 3010, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3011


;--- Land ---
[Statedef 3011]
type = S
physics = N
movetype = I
anim = 3011
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3011, Pos]
type = posset
trigger1 = 1
y = 0

[State 3011, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3011, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3011, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- Jump back if blocked ---
[Statedef 3015]
type = A
physics = N
movetype = A
anim = 3015
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3015, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 3015, Vel]
type = velset
trigger1 = !time
x = 0
y = -6

[State 3015, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3011


;--- Jump back if connected ---
[Statedef 3019]
type = A
physics = N
movetype = A
anim = 3015
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3019, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 3019, Vel]
type = velset
trigger1 = !time
x = 0
y = -6

[State 3019, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3020


;--- Combo ---
[Statedef 3020]
type = S
physics = N
movetype = A
anim = 3020
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3020, Pos]
type = posset
trigger1 = 1
y = 0
[State 3020, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3020, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3020, Vel]
type = veladd
trigger1 = vel x > 0
x = -.125
[State 3020, Vel]
type = velset
trigger1 = vel x < 0
x = 0
[State 3020, Vel]
type = velset
trigger1 = animelem = 3 || animelem = 10 || animelem = 17 || animelem = 24 || animelem = 33
x = 2

[State 3020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 9
channel = 0
[State 3020, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 12 || animelem = 19 || animelem = 26 || animelem = 33
value = 7, 2
freqmul = 1.1
channel = 1

[State 3020, Sparkles]
type = explod
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(13) >= 0 && animelemtime(15) < 0
trigger3 = animelemtime(20) >= 0 && animelemtime(22) < 0
trigger4 = animelemtime(27) >= 0 && animelemtime(29) < 0
trigger5 = animelemtime(35) >= 0 && animelemtime(37) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 3020, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 6 || animelem = 13 || animelem = 20 || animelem = 27
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 7 * (var(15) <= 2)
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8014) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -56
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3020, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 35
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 7 * (var(15) <= 2)
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -3.5, -7.33
guard.velocity = -4.49
air.velocity = -3.5, -7.33
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8014) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 94), var(33) := -64
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3020, Sparkles]
type = helper
trigger1 = !numhelper(8160)
trigger1 = movehit && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8160
ID = 8160
name = "Sparkles"
postype = p2
ownpal = 1
ignorehitpause = 1

;[State 3020, Hi -Jump Cancel]
;type = changestate
;value = 60
;trigger1 = !AIlevel && roundstate = 2
;trigger1 = command = "highjump"
;trigger1 = animelemtime(35) > 0 && animelemtime(38) < 0 && movecontact

[State 3020, statetype]
type = statetypeset
trigger1 = animelemtime(36) >= 0
movetype = I
[State 3020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SHICHIKAPU KAMUI IRUSHIKA >=
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

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
trigger1 = !time
var(16) = 1

[State 3100, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3100, OC Reset]
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
trigger1 = animelemtime(6) < 0
time = 1
value = SCA

[State 3100, Snd]
type = playsnd
trigger1 = time = 4
value = 5, ifelse(prevstateno = 3020, 4, 5)
channel = 0

[State 3100, Mamahaha]
type = helper
trigger1 = !time
helpertype = normal
stateno = 10400
ID = 10000
name = "Mamahaha"
postype = left
pos = ceil(fvar(1) + 160), ceil(fvar(2))
facing = facing
ownpal = 1
supermovetime = 47

[State 3100, superpausefx]
type = helper
trigger1 = time = 4
trigger1 = numhelper(10000)
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = left
pos = ceil(helper(10000), pos x) + 160, ceil(helper(10000), pos y) - 26
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

[State 3100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< SHIRIKORO KAMUI NOMI >=
[Statedef 3200]
type = S
physics = S
movetype = I
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -3000

[State 3200, Button]
type = varset
trigger1 = var(10) != 2
var(10) = 2

[State 3200, Super Cancels]
type = varadd
trigger1 = !time
var(16) = 1

[State 3200, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3200, OC Reset]
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
trigger1 = 1
time = 1
value = SCA

[State 3200, Snd]
type = playsnd
trigger1 = time = 4
value = 5, 6
channel = 0

[State 3200, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8520
ID = 8520
name = "Super Charge"
postype = p1
pos = 1, -69
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

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 3201


;--- Channeling ---
[Statedef 3201]
type = S
physics = S
movetype = I
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3201, heal]
type = lifeadd
trigger1 = 1
value = ifelse(time <= 60, 3, ifelse(time <= 120, 2, 1))

;[State 3201, heal]
;type = lifeadd
;trigger1 = (time % 10)
;value = 3

[State 3201, FX]
type = helper
trigger1 = !numhelper(3210)
helpertype = normal
stateno = 3210
ID = 3210
name = "Healing FX"
postype = p1
size.xscale = 0.5
size.yscale = 16
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3201, End]
type = changestate
trigger1 = roundstate != 2
trigger2 = life >= lifemax
trigger3 = time >= 180;100
trigger4 = !AIlevel
trigger4 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger5 = AIlevel
trigger5 = inguarddist || (p2dist x = [ -80, 80])
value = 3202


;--- Finished ---
[Statedef 3202]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3202, Anim]
type = changeanim
trigger1 = !time && anim != 3201
value = 3201
[State 3202, Anim]
type = changeanim
trigger1 = time >= 16 && anim != 3202
value = 3202

[State 3202, Snd]
type = playsnd
trigger1 = anim = 3202 && animelem = 1
value = 5, 7
channel = 0
[State 3202, FX]
type = helper
trigger1 = anim = 3202 && animelem = 1
helpertype = normal
stateno = 3215
ID = 3215
name = "Healing FX"
postype = p1
ownpal = 1

[State 3202, End]
type = changestate
trigger1 = anim = 3202 && !animtime
value = 0
ctrl = 1


;==< IRUSUKA YATORO LISE >=
[Statedef 3300]
type = S
physics = S
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
trigger1 = !time
var(16) = 1

[State 3300, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 55
[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3300, Snd]
type = playsnd
trigger1 = time = 4
value = 5, 10
channel = 0

[State 3300, Mamahaha]
type = helper
trigger1 = !time
helpertype = normal
stateno = 10600
ID = 10000
name = "Mamahaha"
postype = left
pos = ceil(fvar(1) + 160), ceil(fvar(2))
facing = facing
ownpal = 1
supermovetime = 59

[State 3300, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = -1, -73
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

[State 3300, FX]
type = helper
trigger1 = animelemtime(7) >= 0
trigger1 = !numhelper(3305)
helpertype = normal
stateno = 3305
ID = 3305
name = "I.Y.L. FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3300, End]
type = changestate
triggerall = animelemtime(9) >= 0
trigger1 = !numhelper(10000)
trigger2 = numhelper(10000)
trigger2 = (helper(10000), stateno != [10600, 10639])
value = 3301


;--- Recovery ---
[Statedef 3301]
type = S
physics = S
movetype = A
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< GANSO LELA MUTSUBE >=
[Statedef 3400]
type = S
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3400, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3400, Super Level]
type = varadd
trigger1 = !time
var(15) = 1
[State 3400, Super Cancels]
type = varadd
trigger1 = !time
var(16) = 1

[State 3400, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3400, OC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43
[State 3400, NHB]
type = nothitby
trigger1 = animelemtime(10) < 0
time = 1
value = SCA

[State 3400, Snd]
type = playsnd
trigger1 = time = 4
value = 4, 2
channel = 0

[State 3400, superpausefx]
type = helper
trigger1 = time = 4
trigger1 = numhelper(10000)
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = -16, -27
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, superpause]
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

[State 3400, statetype]
type = statetypeset
trigger1 = animelemtime(10) >= 0
statetype = A
physics = N

[State 3400, Vel]
type = veladd
trigger1 = animelemtime(10) >= 0 && animelemtime(12) < 0
x = 0.125
y = -.4375
[State 3400, Vel]
type = velset
trigger1 = animelem = 10
x = 10.1875
y = -3.84375

[State 3400, Vel]
type = veladd
trigger1 = animelemtime(12) >= 0
x = -.125
y = 0.5
[State 3400, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3400, Vel]
type = velset
trigger1 = animelem = 12
x = 6.5
y = -2.5
persistent = 0
[State 3400, Pos]
type = posadd
trigger1 = animelem = 12
y = 36
persistent = 0

[State 3400, Snd]
type = playsnd
trigger1 = animelem = 9
value = 5, 1
channel = 0
[State 3400, Snd]
type = playsnd
trigger1 = animelem = 10
value = 7, 1

[State 3400, FX]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 3405
ID = 3405
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 3400, Dust]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3400, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(28))
trigger1 = animelem = 10
ID = 3400
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 18
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -2
guard.velocity = -10.52
air.velocity = 0, -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3400, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 11 && !movecontact && !movereversed
ID = 3400
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 18
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -2
guard.velocity = -10.52
air.velocity = 0, -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3400, Hit]
type = hitdef
trigger1 = animelemtime(10) >= 0
trigger1 = !(!var(27) && (var(14) < 2 || var(28)))
trigger2 = animelemtime(11) >= 0 && !movecontact && !movereversed
trigger2 = !(!var(27) && (var(14) < 1 || var(28)))
attr = A, HA
hitflag = 
sparkxy = -10, -10

[State 3400, p1state]
type = changestate
trigger1 = movehit = 1 && numtarget(3400)
value = 3410

[State 3400, Blood]
type = helper
trigger1 = hitpausetime = 11
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = ifelse((target, facing = facing), 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3400, End]
type = changestate
trigger1 = animelemtime(11) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3401


;--- Land ---
[Statedef 3401]
type = S
physics = N
movetype = I
anim = 3401
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3401, Pos]
type = posset
trigger1 = 1
y = 0

[State 3401, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3401, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3401, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Spinning ---
[Statedef 3410]
type = A
physics = N
movetype = A
anim = 3410
ctrl = 0
velset = 0, 0
sprpriority = 1
hitcountpersist = 1

[State 3400, Pos]
type = posset
trigger1 = !time && numtarget(3400)
x = (target(3400), pos x) - (36 * facing)
y = (target(3400), pos y) + (target(3400), const(size.mid.pos.y))

[State 3410, Snd]
type = playsnd
trigger1 = !(time % 8)
value = 1, 7
channel = 1

[State 3410, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Blade"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3410, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < (2 + hitcount) || var(28))
trigger1 = time = 2 || time = 8 || time = 14 || time = 20 || time = 26 || time = 32
ID = 3410
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -2
guard.velocity = -10.52
air.velocity = 0, -2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3410, Blood]
type = helper
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = ifelse(random < 500, -1, 1);(target, facing = facing), 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3410, End]
type = changestate
trigger1 = time >= 33
value = 3411


;--- Kick ---
[Statedef 3411]
type = A
physics = N
movetype = A
anim = 3411
ctrl = 0
velset = 0, 0
sprpriority = 1
hitcountpersist = 1

[State 3411, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5
[State 3411, Vel]
type = velset
trigger1 = animelem = 2
x = -2
y = -8

[State 3411, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0
[State 3411, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 3411, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < (2 + hitcount) || var(28))
trigger1 = animelem = 2
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 18
air.hittime = 120
ground.velocity = -6, -6
guard.velocity = -10.52
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 20), var(33) := -10
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3411, Sparkles]
type = helper
trigger1 = !numhelper(8160)
trigger1 = movehit && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8160
ID = 8160
name = "Sparkles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3411, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3401

;==< APEFUCHI KAMUI RIMSE >=
[Statedef 3500]
type = S
physics = N
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3500, Button]
type = varset
trigger1 = var(10) != 0
var(10) = 0

[State 3500, Super Level]
type = varadd
trigger1 = !time
var(15) = 1
[State 3500, Super Cancels]
type = varadd
trigger1 = !time
var(16) = 1

[State 3500, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3500, OC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43
[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3500, Snd]
type = playsnd
trigger1 = time = 4
value = 4, 2
channel = 0

[State 3500, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = -23, -64
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3500, superpause]
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

[State 3500, Vel]
type = velmul
trigger1 = animelemtime(26) < 0
x = 0.8
[State 3500, Vel]
type = velset
trigger1 = animelem = 5
x = 10
[State 3500, Vel]
type = velset
trigger1 = animelem = 12 || animelem = 20 || animelem = 28
x = 4
[State 3500, Vel]
type = velset
trigger1 = animelem = 25
x = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 11
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 6 || animelem = 13
value = 7, 2
channel = 1
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 20 || animelem = 25 || animelem = 32
value = 7, 2
freqmul = 1.1
channel = 1
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 39
value = 1, 5
channel = 1

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 102
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 38
value = 0, 41
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 45
value = 0, 52

[State 3500, Sparkles]
type = explod
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
trigger2 = animelemtime(14) >= 0 && animelemtime(16) < 0
trigger3 = animelemtime(21) >= 0 && animelemtime(23) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 3500, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 7 || animelem = 14 || animelem = 26
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 27
ground.slidetime = 27
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -56
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3500, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 22
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7 * (var(15) <= 1)
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 27
ground.slidetime = 27
guard.hittime = 18
air.hittime = 120
ground.velocity = -5, -6.2
guard.velocity = -4.49
air.velocity = -4.51, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -56
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3500, Sparkles]
type = helper
trigger1 = animelemtime(38) < 0
trigger1 = !numhelper(8160)
trigger1 = movehit && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8160
ID = 8160
name = "Sparkles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3500, statetype]
type = statetypeset
trigger1 = animelemtime(26) >= 0
movetype = I
[State 3500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< MAX APEFUCHI KAMUI RIMSE >=
[Statedef 3550]
type = S
physics = N
movetype = A
anim = 3550
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3550, Button]
type = varset
trigger1 = var(10) != 1
var(10) = 1

[State 3550, Super Level]
type = varadd
trigger1 = !time
var(15) = 2
[State 3550, Super Cancels]
type = varadd
trigger1 = !time
var(16) = 1

[State 3550, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 3550, OC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43
[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3500, Snd]
type = playsnd
trigger1 = time = 4
value = 4, 2
channel = 0

[State 3500, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = -23, -64
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3500, superpause]
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

[State 3500, Vel]
type = velmul
trigger1 = animelemtime(38) < 0
x = 0.8
[State 3500, Vel]
type = velset
trigger1 = animelem = 5
x = 12
[State 3500, Vel]
type = velset
trigger1 = animelem = 12 || animelem = 20 || animelem = 28 || animelem = 33 || animelem = 38
x = 6
[State 3500, Vel]
type = velset
trigger1 = animelem = 45
x = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 11
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 6 || animelem = 13
value = 7, 2
channel = 1
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 20 || animelem = 25 || animelem = 32
value = 7, 2
freqmul = 1.1
channel = 1
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 39
value = 1, 5
channel = 1

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 102
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 38
value = 0, 41
[State 3500, Snd]
type = playsnd
trigger1 = animelem = 45
value = 0, 52

[State 3500, Sparkles]
type = explod
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
trigger2 = animelemtime(14) >= 0 && animelemtime(16) < 0
trigger3 = animelemtime(21) >= 0 && animelemtime(23) < 0
trigger4 = animelemtime(26) >= 0 && animelemtime(28) < 0
trigger5 = animelemtime(33) >= 0 && animelemtime(35) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 3500, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 7 || animelem = 14 || animelem = 26
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -56
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3500, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 22 || animelem = 34
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 7 
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -56
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3500, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(28))
trigger1 = animelem = 40
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 40)), 7 
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -8, -4
guard.velocity = -4.49
air.velocity = -8, -4
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 94), var(33) := -64
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3500, Sparkles]
type = helper
trigger1 = animelemtime(38) < 0
trigger1 = !numhelper(8160)
trigger1 = movehit && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8160
ID = 8160
name = "Sparkles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3500, statetype]
type = statetypeset
trigger1 = animelemtime(42) >= 0
movetype = I
[State 3500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< SUICIDE >=
[Statedef 4000]
type = S
physics = S
movetype = I
anim = 4000
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4000, Assert]
type = assertspecial
trigger1 = 1
flag = timerfreeze

[State 4000, Trans]
type = trans
trigger1 = time >= 30
trans = addalpha
alpha = 256 -ceil(4.27 * (time -30)), ceil(4.27 * (time -30))
ignorehitpause = 1

[State 4000, soul]
type = helper
trigger1 = time = 30
helpertype = normal
stateno = 4005
ID = 4005
name = "Soul"
postype = p1
ownpal = 1

[State 4005, Snd]
type = playsnd
trigger1 = animelem = 2
value = 6, 5
channel = 0
[State 4005, Snd]
type = playsnd
trigger1 = time = 30
value = 7, 3

[State 4005, Sparkles]
type = explod
trigger1 = time >= 30
trigger1 = !(time % 2)
anim = 8161
sprpriority = 3
postype = p1
pos = -5, -45
random = 40, 90
vel = 0, -(random / 500.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 4000, Assert]
type = assertspecial
trigger1 = time >= 90
flag = nokoslow
flag2 = nokosnd

[State 4000, flag]
type = varset
trigger1 = time = 90
var(47) = 1
[State 4000, life]
type = lifeset
trigger1 = time = 90
value = 0
kill = 1

[State 4000, End]
type = changestate
trigger1 = time >= 90
value = 5150


;==< ZETSUMEI OUGI >=
[Statedef 4100]
type = S
physics = N
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -3000

[State 4100, Button]
type = varset
trigger1 = var(10) != 2
var(10) = 2

[State 4100, OC Flag]
type = varset
trigger1 = var(20) > 0
var(28) = 1
ignorehitpause = 1
[State 4100, OC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4100, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 67
[State 4100, NHB]
type = nothitby
trigger1 = animelemtime(14) < 0
time = 1
value = SCA

[State 4100, Snd]
type = playsnd
trigger1 = time = 4
value = 6, 8
channel = 0

[State 4100, superpausefx]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8520
ID = 8520
name = "Super Charge"
postype = p1
pos = 8, -55
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4100, superpause]
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

[State 4100, Hit]
type = hitdef
trigger1 = animelem = 13
trigger1 = !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= 36
attr = S, HT
hitflag = M-
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + (var(30) := 0) * 0
guard.sparkno = -1 + (var(31) := 16000) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -50
hitsound = -1 * (var(34) := 800) * 0
guardsound = -1 * (var(35) := 0) * 0
yaccel = 0.5
fall = 1
fall.recover = 0
numhits = 0
p1stateno = 4110

[State 4100, Snd]
type = playsnd
trigger1 = animelem = 14
value = 5000, 0
channel = 0
[State 4100, Snd]
type = playsnd
trigger1 = animelem = 14
value = 1, 0
channel = 1

[State 4100, Type]
type = statetypeset
trigger1 = animelemtime(14) >= 0
movetype = I
[State 4100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Throw ---
[Statedef 4110]
type = S
physics = S
movetype = A
anim = 4110
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4110, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1
[State 4110, Safety]
type = superpause
trigger1 = !time
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 4110, throw]
type = targetstate
trigger1 = !time && numtarget
value = 4115
[State 4110, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4110, juggle]
type = varadd
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1
[State 4110, juggle]
type = varset
trigger1 = !time && numtarget
var(27) = 1
ignorehitpause = 1

[State 4110, width]
type = width
trigger1 = 1
edge = 48, 0

[State 4110, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 40, 0
[State 4110, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 14, 0
[State 4110, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -14, 0
[State 4110, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -40, 0
[State 4110, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = -24, 0
[State 4110, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = -8, 0
[State 4110, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 7
pos = 0, 0

[State 4110, damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 7
value = ceil(ifelse(20 * fvar(11) < 7, -7, -20 * fvar(11)))
kill = 0

[State 4110, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 7
value = 36

[State 4110, hitcount]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 7
value = 1
[State 4110, hitcount]
type = varadd
trigger1 = numtarget
trigger1 = animelem = 7
var(13) = 1

[State 4110, throw]
type = targetstate
trigger1 = animelem = 7
value = 4116

[State 4110, sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 2
channel = 0
[State 4110, sound]
type = playsnd
trigger1 = animelem = 7
value = 1, 2
channel = 1

[State 4110, End]
type = changestate
trigger1 = !animtime
value = 4111


;--- Follow ---
[Statedef 4111]
type = A
physics = N
movetype = A
anim = 4111
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4111, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 4111, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 41
[State 4111, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 4111, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.6
[State 4111, Vel]
type = velset
trigger1 = animelem = 2
x = 4.5
y = -12

[State 4111, End]
type = changestate
trigger1 = numtarget && vel y >= 0
trigger1 = target, stateno = 4116
trigger1 = abs(target, pos x -pos x) <= 32 && abs(target, pos y -pos y) <= 32
value = 4112

[State 4111, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;--- Grab midair ---
[Statedef 4112]
type = A
physics = N
movetype = A
anim = 4112
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4112, throw]
type = targetstate
trigger1 = !time && numtarget
value = 4117
[State 4112, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4112, width]
type = width
trigger1 = 1
edge = 16, 0

[State 4112, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 12, -20
[State 4112, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0
pos = 6, -16

[State 4112, Snd]
type = playsnd
trigger1 = !time
value = 0, 800
channel = 2
[State 4112, sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 0
channel = 0
[State 4112, sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 4112, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5
[State 4112, Vel]
type = velset
trigger1 = animelem = 2
x = 8
y = 8

[State 4112, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4113


;--- Hit Ground ---
[Statedef 4113]
type = A
physics = N
movetype = A
anim = 4113
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4113, throw]
type = targetstate
trigger1 = !time && numtarget
value = 4118
[State 4113, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4113, width]
type = width
trigger1 = 1
edge = 16, 0

[State 4113, Pos]
type = posset
trigger1 = 1
y = 0

[State 4113, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
x = 6
y = 0

[State 4113, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 6, 0
[State 4113, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -2, -12
[State 4113, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -19, -25
[State 4113, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -21, -30
[State 4113, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = -5, -59
[State 4113, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 24, -45
[State 4113, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0
pos = 27, -33


[State 4113, damage]
type = targetlifeadd
trigger1 = !time && numtarget
value = ceil(ifelse(85 * fvar(11) < 7, -7, -80 * fvar(11)))
kill = 0
[State 4113, givepower]
type = targetpoweradd
trigger1 = !time && numtarget
value = 36

[State 4113, hitcount]
type = hitadd
trigger1 = !time && numtarget
value = 1
[State 4113, hitcount]
type = varadd
trigger1 = !time && numtarget
var(13) = 1

[State 4113, FX]
type = playsnd
trigger1 = !time
value = 0, 5100
[State 4113, FX]
type = explod
trigger1 = !time
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
ownpal = 1
[State 4113, Shake]
type = envshake
trigger1 = !time
time = 18
ampl = -6
freq = 120

[State 4113, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1
[State 4113, Dust]
type = explod
trigger1 = animelemtime(2) >= 0
trigger1 = !(time % 4)
anim = 8103
sprpriority = 3
postype = p1
pos = 0, -ceil(pos y)
vel = -2, 0
scale = 1, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4113, throw]
type = targetstate
trigger1 = !time
value = 4118

[State 4113, End]
type = changestate
trigger1 = !animtime
value = 4120


;--- Stab ---
[Statedef 4120]
type = A
physics = N
movetype = A
anim = 4120
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4120, kill]
type = changestate
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
trigger1 = target, life <= (100 * fvar(11))
trigger2 = animelem = 14
trigger2 = target, life <= (60 * fvar(11))
value = 4130

[State 4120, throw]
type = targetstate
trigger1 = !time && numtarget
value = 4125
[State 4120, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4120, Bind]
type = bindtotarget
trigger1 = numtarget
trigger1 = time && animelemtime(17) < 0
pos = 0, 34 -(target, const(size.ground.front))
[State 4120, Bind]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(17) >= 0
pos = 0, -(target, const(size.ground.front))

[State 4120, damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
value = ceil(ifelse(115 * fvar(11) < 7, -7, -100 * fvar(11)))
kill = 0
[State 4120, damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 17
value = ceil(ifelse(60 * fvar(11) < 7, -7, -60 * fvar(11)))
kill = 1
[State 4120, givepower]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 17
value = 36

[State 4120, hitcount]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 17
value = 1
[State 4120, hitcount]
type = varadd
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 17
var(13) = 1

[State 4120, throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 17
value = 4126

[State 4120, speech]
type = playsnd
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
value = 4, 4
channel = 0
[State 4120, speech]
type = playsnd
trigger1 = animelem = 17
value = 4, 1
channel = 0

[State 4120, blade]
type = helper
trigger1 = !numhelper(4121)
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
helpertype = normal
stateno = 4121
ID = 4121
name = "Blade"
postype = p1
pos = 0, 0
sizexscale = 64
sizeyscale = 64
pausemovetime = 65536
supermovetime = 65536

[State 4120, whiffsound]
type = playsnd
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
value = 1, 8
channel = 1
[State 4120, whiffsound]
type = playsnd
trigger1 = animelem = 17
value = 1, 5
channel = 1
[State 4120, hitsound]
type = playsnd
trigger1 = numtarget && (animelem = 4 || animelem = 8 || animelem = 12)
value = 2, 8
channel = 2
[State 4120, hitsound]
type = playsnd
trigger1 = numtarget && animelem = 17
value = 2, 5
channel = 2
[State 4120, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 17
time = 18
ampl = -6
freq = 120

[State 4120, Sparks]
type = helper
trigger1 = numtarget && (animelem = 4 || animelem = 8 || animelem = 12)
helpertype = normal
stateno = 8015
ID = 8000
name = "Spark"
postype = p1
pos = 14, -25
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535
[State 4120, Sparks]
type = helper
trigger1 = numtarget && animelem = 17
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 14, -2
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535

[State 4120, Blood]
type = helper
trigger1 = numtarget && (animelem = 4 || animelem = 8 || animelem = 12)
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = 14, -25
facing = ifelse(random < 500, 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4120, throw]
type = targetstate
triggerall = numtarget
trigger1 = target, name = "Bulleta" || target, name = "Baby Bonnie Hood"
trigger2 = target, name = "Dizzy"
trigger3 = target, name = "Felicia" || target, name = "cvsfelicia"
trigger4 = target, name = "Jam" || target, name = "Jam Kuradoberi" || target, name = "Kuradoberi Jam"
trigger5 = target, name = "Lei -Lei" || target, name = "Hsien -ko"
trigger6 = target, name = "Makoto"
trigger7 = target, name = "Q -Bee"
value = 4129

[State 4120, End]
type = changestate
trigger1 = !animtime
value = 4122


;--- Jump off ---
[Statedef 4122]
type = A
physics = N
movetype = A
anim = 4122
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4122, throw]
type = targetstate
trigger1 = !time && numtarget
trigger1 = target, alive
value = 4127
[State 4122, throw]
type = targetstate
trigger1 = !time && numtarget
trigger1 = !(target, alive)
value = 4135

[State 4122, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4122, Pos]
type = posset
trigger1 = !time && pos y > 0
y = 0

[State 4122, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 4122, Vel]
type = velset
trigger1 = !time
x = -4
y = -8

[State 4122, End]
type = changestate
trigger1 = vel y > 0 && pos y > -vel y
value = 52


;--- Finisher ---
[Statedef 4130]
type = A
physics = N
movetype = A
anim = 4130
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4130, throw]
type = targetstate
trigger1 = !time && numtarget
value = 4125
[State 4130, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 4130, Bind]
type = bindtotarget
trigger1 = numtarget
pos = 0, 34 -(target, const(size.ground.front))

[State 4130, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 20
value = -65536
absolute = 1
[State 4130, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 20
value = 36

[State 4130, hitcount]
type = hitadd
trigger1 = numtarget && animelem = 20
value = 1
[State 4130, hitcount]
type = varadd
trigger1 = numtarget && animelem = 20
var(13) = 1

[State 4130, throw]
type = targetstate
trigger1 = numtarget && animelem = 20
value = 4126

[State 4130, speech]
type = playsnd
trigger1 = animelem = 1
value = 6, 6
channel = 0
[State 4130, speech]
type = playsnd
trigger1 = animelem = 10
value = 6, 7
channel = 0

[State 4130, blade]
type = helper
trigger1 = !numhelper(4121) && animelemtime(20) >= 0
helpertype = normal
stateno = 4121
ID = 4121
name = "Blade"
postype = p1
pos = 0, 0
sizexscale = 64
sizeyscale = 64
pausemovetime = 65536
supermovetime = 65536

[State 4130, whiffsound]
type = playsnd
trigger1 = animelem = 20
value = 1, 8
channel = 1
[State 4130, hitsound]
type = playsnd
trigger1 = numtarget && animelem = 20
value = 2, 8
channel = 2
[State 4130, Shake]
type = envshake
trigger1 = numtarget && animelem = 20
time = 18
ampl = -6
freq = 120

[State 4130, Sparks]
type = helper
trigger1 = numtarget && animelem = 20
helpertype = normal
stateno = 8035
ID = 8000
name = "Spark"
postype = p1
pos = 14, -25
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535
[State 4130, Blood]
type = helper
trigger1 = numtarget
trigger1 = !(time % 4)
trigger1 = animelemtime(20) >= 0 && animelemtime(20) < 32
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = 14, -25
facing = ifelse(random < 500, 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4130, throw]
type = targetstate
triggerall = numtarget
trigger1 = target, name = "Bulleta" || target, name = "Baby Bonnie Hood"
trigger2 = target, name = "Dizzy"
trigger3 = target, name = "Felicia" || target, name = "cvsfelicia"
trigger4 = target, name = "Jam" || target, name = "Jam Kuradoberi" || target, name = "Kuradoberi Jam"
trigger5 = target, name = "Lei -Lei" || target, name = "Hsien -ko"
trigger6 = target, name = "Makoto"
trigger7 = target, name = "Q -Bee"
value = 4129

[State 4130, End]
type = changestate
trigger1 = animelemtime(23) >= 6 && numtarget
trigger1 = target, alive || target, stateno = 4129
trigger2 = animelemtime(23) >= 6 && numenemy
trigger2 = enemynear, stateno != 5150 || (enemynear, anim != 5110 && enemynear, anim != 5150)
value = 4122
[State 4130, End]
type = changestate
trigger1 = animelemtime(23) >= 60 && winko
value = 4131


;--- Win Pose ---
[Statedef 4131]
type = S
physics = N
movetype = I
velset = 0, 0
sprpriority = 1

[State 4131, Anim]
type = changeanim
trigger1 = anim != 4131
value = 4131
[State 4131, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 4131, speech]
type = playsnd
trigger1 = animelem = 1
value = 6, 5
channel = 0

[State 4131, blade]
type = helper
trigger1 = !numhelper(4121)
helpertype = normal
stateno = 4121
ID = 4121
name = "Blade"
postype = p1
pos = 0, 0
sizexscale = 64
sizeyscale = 64
pausemovetime = 65536
supermovetime = 65536

[State 4131, throw]
type = targetstate
triggerall = numtarget
trigger1 = target, name = "Bulleta" || target, name = "Baby Bonnie Hood"
trigger2 = target, name = "Dizzy"
trigger3 = target, name = "Felicia" || target, name = "cvsfelicia"
trigger4 = target, name = "Jam" || target, name = "Jam Kuradoberi" || target, name = "Kuradoberi Jam"
trigger5 = target, name = "Lei -Lei" || target, name = "Hsien -ko"
trigger6 = target, name = "Makoto"
trigger7 = target, name = "Q -Bee"
value = 4129

[State 4131, End]
type = changestate
trigger1 = prevstateno != 180
value = 180
ctrl = 1

[State 4131, End]
type = changestate
trigger1 = numtarget
trigger1 = target, alive || target, stateno = 4129
trigger2 = numenemy
trigger2 = enemynear, stateno != 5150 || (enemynear, anim != 5110 && enemynear, anim != 5150)
value = 4122


;--- Target ---
[Statedef 4115]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 1
[State 4115, Anim]
type = changeanim2
trigger1 = !time
value = 4115
[State 4115, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 4115, spr]
type = sprpriority
trigger1 = 1
value = ifelse(animelemtime(2) >= 0, 2, 0)


;--- Target Thrown ---
[Statedef 4116]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4116, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA
[State 4116, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0
[State 4116, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4116, Anim]
type = changeanim
trigger1 = vel y < -2
value = 5030
[State 4116, Anim]
type = changeanim
trigger1 = selfanimexist(5035)
trigger1 = anim = 5030 && vel y >= -2
value = 5035
[State 4116, Anim]
type = changeanim
trigger1 = !selfanimexist(5035)
trigger1 = anim = 5030 && vel y >= -2
trigger2 = anim = 5035 && !animtime
value = 5050

[State 4116, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 4116, Vel]
type = velset
trigger1 = !time
x = -3
y = -15

[State 4116, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;--- Target Caught ---
[Statedef 4117]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 4117, Anim]
type = changeanim2
trigger1 = !time
value = 4117
[State 4117, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


;--- Target Grounded ---
[Statedef 4118]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4118, Anim]
type = changeanim2
trigger1 = !time
value = 4118
[State 4118, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


;--- Target Ready ---
[Statedef 4125]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4125, Pos]
type = posset
trigger1 = 1
y = 0
[State 4125, width]
type = width
trigger1 = 1
edge = 0, 32
[State 4125, Var]
type = varset
trigger1 = 1
sysvar(0) = 1
[State 4125, Anim]
type = changeanim2
trigger1 = 1
value = 4125
[State 4125, End]
type = selfstate
trigger1 = time >= 300
value = 5110
[State 4125, End]
type = selfstate
trigger1 = !alive
value = 5150


;--- Target Stabbed ---
[Statedef 4126]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4126, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA
[State 4126, Pos]
type = posset
trigger1 = 1
y = 0
[State 4126, width]
type = width
trigger1 = 1
edge = 0, 32
[State 4126, Anim]
type = changeanim
trigger1 = !time
value = 5080
[State 4126, End]
type = changestate
trigger1 = !animtime || time >= 12
value = 4125


;--- Target hit back ---
[Statedef 4127]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4127, Anim]
type = changeanim
trigger1 = !time
value = 5030
[State 4127, Anim]
type = changeanim
trigger1 = selfanimexist(5035)
trigger1 = anim = 5030 && !animtime
value = 5035
[State 4127, Anim]
type = changeanim
trigger1 = !selfanimexist(5035)
trigger1 = anim = 5030 && !animtime
trigger2 = anim = 5035 && !animtime
value = 5050
[State 4127, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 4127, Vel]
type = velset
trigger1 = !time
x = -2.66
y = -6
[State 4127, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Target Recover ---
[Statedef 4128]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4128, Pos]
type = posset
trigger1 = 1
y = 0
[State 4128, Anim]
type = changeanim
trigger1 = !time && anim != 5110
value = 5110
[State 4128, End]
type = selfstate
trigger1 = time >= 24
value = 5120


;--- Target Ready ---
[Statedef 4129]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4129, Pos]
type = posset
trigger1 = 1
y = 0
[State 4129, width]
type = width
trigger1 = 1
edge = 0, 32
[State 4129, Var]
type = varset
trigger1 = 1
sysvar(0) = 1
[State 4129, Anim]
type = changeanim2
trigger1 = 1
value = 4129
[State 4129, End]
type = selfstate
trigger1 = time >= 300
value = 5110


;--- Target KO ---
[Statedef 4135]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 4135, Pos]
type = posset
trigger1 = 1
y = 0
[State 4129, End]
type = selfstate
trigger1 = 1
value = ifelse(alive, 5110, 5150)
