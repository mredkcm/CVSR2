; ________________________________________
;| Gouki by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< HYPER STATES >====
;====

;==< MESSATSU GOU HADOU >=
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = -1000

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3000, width]
type = width
trigger1 = anim = 3001 && animelemtime(7) < 0
value = 30, 0

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3100, Super Cancel Juggle]
type = varadd
trigger1 = !time
trigger1 = var(21) || var(22)
trigger1 = var(1)
var(15) = -5
ignorehitpause = 1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 3
value = 4, 5
channel = 0
volume = 200
[State 3000, Aura]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 8500;7500
ID = 8500;7500
name = "Super Charge"
postype = p1
pos = -22, -48
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3000, Super Pause]
type = superpause
trigger1 = anim = 3000 && animelem = 3
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 43

[State Corner Push]
type = varset
trigger1 = anim = 3000 && animelem = 3
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger2 = anim = 3001 && animelemtime(2) < 1
time = 1
value = SCA

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && time = 48
value = 3001

[State 3000, hadouken]
type = helper
trigger1 = anim = 3001 && animelem = 2
helpertype = normal
stateno = 3005
ID = 3005
name = "Hadouken"
postype = p1
pos = 83, -68
ownpal = 1
size.xscale = 0.85
size.yscale = 0.85

[State 3000, Dust]
type = explod
trigger1 = anim = 3001 && animelem = 2
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 42, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 2
value = 3, 7
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 2
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = anim = 3001 && !animtime
value = 0
ctrl = 1

;==< MESSATSU GOU HADOU AGYO >=
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
facep2 = 1
sprpriority = 1
poweradd = -2000

[State 3070, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3020, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3020, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3020, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = anim = 3020 && animelemtime(31) < 0
value = 30, 0

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 3
value = 4, 5
channel = 0
volume = 200
[State 3000, Aura]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 8510;7500
ID = 8510;7500
name = "Super Charge"
postype = p1
pos = -22, -48
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3000, Super Pause]
type = superpause
trigger1 = anim = 3000 && animelem = 3
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 43

[State Corner Push]
type = varset
trigger1 = anim = 3000 && animelem = 3
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger2 = anim = 3020 && animelemtime(4) < 1
time = 1
value = SCA

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && time = 45
value = 3020

[State 3000, Dust]
type = explod
triggerall = anim = 3020
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 42, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3070, hadouken]
type = helper
triggerall = anim = 3020
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
;trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
helpertype = normal
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 53, -68
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
triggerall = anim = 3020
trigger1 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
;trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
helpertype = normal
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 42, -78
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
triggerall = anim = 3020
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
;trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
helpertype = normal
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 38, -82
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
triggerall = anim = 3020
trigger1 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
;trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
helpertype = normal
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 64, -68
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75

[State 3070, Snd]
type = playsnd
triggerall = anim = 3020
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
;trigger2 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
value = 3, 0
channel = 0
[State 3070, Snd]
type = playsnd
triggerall = anim = 3020
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
trigger2 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
value = 5, 0
channel = 1

[State 3000, End]
type = changestate
trigger1 = anim = 3020 && !animtime
value = 0
ctrl = 1

;==< TENMA GOU ZANKUU >=
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3050, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3050, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3050, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3100, Super Cancel Juggle]
type = varadd
trigger1 = !time
trigger1 = var(21) || var(22)
trigger1 = var(1)
trigger1 = var(15) > 0
var(15) = -5
ignorehitpause = 1
persistent = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 14
channel = 0
volume = 200
[State 3050, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3050, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8500;7500
ID = 8500;7500
name = "Super Charge"
postype = p1
pos = 58, -53
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3050, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 43

[State Corner Push]
type = varset
trigger1 = !time
trigger1 = animelem = 2
fvar(5) = 0

[State Reset]
type = varset
trigger1 = var(15) < 0
trigger1 = var(1)
var(15) = 0
ignorehitpause = 1
persistent = 0

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(8) < 1
time = 1
value = SCA

[State 3050, hadouken]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3055
ID = 3055
name = "Hadouken"
postype = p1
pos = 53, -63
ownpal = 1
size.xscale = 0.85
size.yscale = 0.85

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 8
value = 4, 0
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 0

[State 3050, Vel]
type = velset
trigger1 = animelem = 8
x = -1.5
y = -6
[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(8) > 0
physics = A


;==< TENMA GOU ZANKUU AGYO >=
[Statedef 3070]
type = A
physics = N
movetype = A
anim = 3070
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3070, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3070, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3070, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3070, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3070, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 14
channel = 0
volume = 200
[State 3070, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3070, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8510;7500
ID = 8510;7500
name = "Super Charge"
postype = p1
pos = -8, -103
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3070, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 2
fvar(5) = 0

[State 3070, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3070, hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 63, -58;77, -58
;pos = 67, -48
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 53, -63;57, -38
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 64, -58
;pos = 54, -48
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 44, -47;-38
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
[State 3070, hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 44, -63
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75

[State 3070, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
;trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 3, 0
channel = 0
[State 3070, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 5, 0
channel = 1

[State 3070, Vel]
type = velset
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
x = -2
y = -2.4
[State 3070, Vel]
type = velmul
trigger1 = animelemtime(5) >= 0 && animelemtime(29) < 0
x = 0.75
y = 0.75

[State 3070, Type]
type = statetypeset
trigger1 = animelemtime(32) >= 0
physics = A


;==< MESSATSU GOU SHORYUU >=
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1
poweradd = -1000

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
trigger1 = var(1)
var(15) = 0
ignorehitpause = 1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelemtime(1) = 2
value = 4, 4
channel = 0
[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3100, Super Pause FX]
type = helper
trigger1 = anim = 3100 && animelemtime(1) = 2
helpertype = normal
stateno = 8500;7500
ID = 8500;7500
name = "Super Charge"
postype = p1
pos = 12, -54
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3100, Super Pause]
type = superpause
trigger1 = anim = 3100 && animelemtime(1) = 2
time = 41
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3100 && animelemtime(1) = 2
fvar(5) = 0

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(3) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && (animelem = 2 || animelem = 14)
x = 12
[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelem = 26
x = 19
[State 3100, Dust]
type = explod
trigger1 = anim = 3100 && (animelem = 2 || animelem = 14 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(28) = 1
x = 14;ifelse(var(28)=2,18,9.5)
y = -11

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 4 || animelem = 16)
value = 1, 5
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 28
value = 1, 6
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 4 || animelem = 16 || animelem = 28)
value = 3, ifelse((animelem = 4), 1, ifelse((animelem = 16), 9, 11))
channel = 0

[State 3100, Dust]
type = helper
trigger1 = anim = 3100 && animelem = 28
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelemtime(28) = 1
value = 0, 41

[State 3100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.86
[State 3100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3100, width]
type = width
trigger1 = vel y < 0
edge = const(size.air.front)

[State 3100, hitlow]
type = hitdef
trigger1 = !var(16) && var(15) < 2
trigger1 = animelem = 14 && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 22 < 7, 7, fvar(12) * 22)), 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 24), 18, 6), ifelse((animelem = 24), 18, 6)
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -52
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3100, hitlow2]
type = hitdef
trigger1 = !var(16) && var(15) < 3
trigger1 = (animelem = 3 || animelem = 15) && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 22 < 7, 7, fvar(12) * 22)), 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -75
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4, -6
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3100, hitlow3]
type = hitdef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 26 && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -52
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1, -6
air.velocity = -1, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
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

[State 3100, hitlow4]
type = hitdef
trigger1 = !var(16) && var(15) < 6
trigger1 = animelem = 27 && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 38 < 7, 7, fvar(12) * 38)), 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -75
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -80
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1, -6
air.velocity = -1, -6
ground.cornerpush.veloff = 0
guard.velocity = -24.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
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

[State 3100, hithigh]
type = hitdef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 4 && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -100
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4.5*ifelse(p2dist x>=5,1,-1)*const(size.xscale),-9.85*const(size.yscale)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3100, hithigh 2]
type = hitdef
trigger1 = !var(16) && var(15) < 3
trigger1 =  animelem = 16 && anim = 3100
attr = S, HA
damage = ceil(ifelse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -100
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -5.8*ifelse(p2dist x>=5,1,-1)*const(size.xscale),-10.0*const(size.yscale);-4.25, -5.45
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3100, hitfinal]
type = hitdef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 28 && anim = 3100
persistent = 0
attr = A, HA
damage = ceil(ifelse(fvar(12) * 32 < 7, 7, fvar(12) * 32)), 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -100
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -12
air.velocity = -6, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
airguard.ctrltime = 16
yaccel = 0.5
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3160, fire]
type = helper
trigger1 = anim = 3100 && animelem = 28
helpertype = normal
stateno = 3165
ID = 3165
name = "Metsu Shoryuu Fire"
postype = p1
ownpal = 1
pos = 20,110
ignorehitpause = 1
persistent = 0
size.xscale = .16
size.yscale = .34

[State 3100, statetype]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(28) >= 1
statetype = A
physics = A
[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100 && animelemtime(28) > 2 && vel y > -5.5
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


;==< MESSATSU GOU RASEN >=
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
;juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1
poweradd = -1000

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
trigger1 = var(1)
var(15) = 0
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 2
value = 4, 4
channel = 0
[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3200, Super Pause FX]
type = helper
trigger1 = anim = 3200 && animelem = 2
helpertype = normal
stateno = 8500;7500
ID = 8500;7500
name = "Super Charge"
postype = p1
pos = -32, -8
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3200, Super Pause]
type = superpause
trigger1 = anim = 3200 && animelem = 2
time = 47
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 42

[State Corner Push]
type = varset
trigger1 = anim = 3200 && animelem = 2
fvar(5) = 0

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200 && animelemtime(8) < 0
trigger2 = anim = 3201 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 7
trigger2 = anim = 3201 && animelem = 55
value = 3, ifelse((animelem = 7), 6, 7)
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3201
value = 5, 13
persistent = 0

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 8
value = 0, 41
[State 3200, Dust]
type = helper
trigger1 = anim = 3200 && animelem = 8
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 10
x = 0
y = -7.5
[State 3200, Vel]
type = velset
trigger1 = anim = 3201 && vel y > 0
y = 0

[State 3200, Vel]
type = veladd
trigger1 = anim = 3201 && vel y < 0
y = 0.14

[State 3200, ctrlvel]
type = veladd
trigger1 = anim = 3201 && (vel x = [ -1.33, 1.33]) && vel y < 0
x = ifelse(command = "holdfwd", 0.15, ifelse(command = "holdback", -.15, 0))
[State 3200, ctrlvelAI]
type = veladd
trigger1 = anim = 3201 && (vel x = [ -1.33, 1.33]) && vel y < 0 && AIlevel
x = ifelse(p2bodydist x > 35, 0.15, ifelse(p2bodydist x < -35, -.15, 0))

[State 3200, statetype]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(8) > 0
statetype = A
physics = N
[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && !animtime
value = 3201
[State 3200, Anim]
type = changeanim
trigger1 = anim = 3201 && !animtime
value = 3205
persistent = 0
[State 3200, statetype]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = A

[State 3200, spin]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55
value = 1, 5
channel = 1

[State 3200, 1sthit]
type = hitdef
trigger1 = !var(16) && var(15) < 2 + var(1)
trigger1 = anim = 3200 && animelem = 8
attr = S, HA
ID = 3200
damage = ceil(ifelse(fvar(12) * 25 < 7, 7, fvar(12) * 25)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -62
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 2, 0), -6
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 2, 0), -5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3200, mainhits]
type = hitdef
triggerall = anim = 3201 && (p2dist x >= 0)
triggerall = !var(16) && var(15) < 10
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger2 = animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50
attr = A, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -70
hitSound = -1 + 0 * (var(31) := ifelse(random < 500, 6, 5))
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 1.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3200, mainhitsb]
type = hitdef
triggerall = anim = 3201 && (p2dist x < 0)
triggerall = !var(16) && var(15) < 10
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger2 = animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47
attr = A, HA
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
hitSound = -1 + 0 * (var(31) := ifelse(random < 500, 6, 5))
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 1.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3200, lasthit]
type = hitdef
triggerall = !var(16) && var(15) < 11
trigger1 = anim = 3201 && animelem = 56
attr = S, HA
damage = ceil(ifelse(fvar(12) * 34 < 7, 7, fvar(12) * 34)), 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 81), var(36) := -80
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, -2
air.type = Low
air.velocity = -7, -2
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I


;==< MESSATSU GOU SENPUU >=
[Statedef 3250]
type = A
physics = N
movetype = A
anim = 3250
ctrl = 0
velset = 0, 0
;juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
poweradd = -1000

[State 3250, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3250, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3250, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3250, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
trigger1 = var(1)
var(15) = 0
ignorehitpause = 1

[State 3250, Snd]
type = playsnd
trigger1 = anim = 3250 && animelem = 3
value = 4, 4
channel = 0
[State 3250, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3250, Super Pause FX]
type = helper
trigger1 = anim = 3250 && animelem = 3
helpertype = normal
stateno = 8500;7500
ID = 8500;7500
name = "Super Charge"
postype = p1
pos = -34, -63
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3250, Super Pause]
type = superpause
trigger1 = anim = 3250 && animelem = 3
time = 42
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3250 && animelem = 3
fvar(5) = 0

[State 3250, NHB]
type = nothitby
trigger1 = anim = 3250
trigger2 = anim = 3251 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3250, Snd]
type = playsnd
trigger1 = anim = 3250 && animelem = 4
trigger2 = anim = 3251 && animelem = 61
value = 3, ifelse((animelem = 4), 6, 7)
channel = 0
[State 3250, Snd]
type = playsnd
trigger1 = anim = 3251
value = 5, 13
persistent = 0

[State 3250, Vel]
type = velset
trigger1 = anim = 3250
x = 0
y = 0
[State 3250, Vel]
type = velset
trigger1 = anim = 3251 && animelemtime(15) < 0 && pos y < -10
y = ifelse(animelemtime(9) < 0, 0.33, 0.1)
[State 3250, Vel]
type = velset
trigger1 = anim = 3251 && animelem = 15
x = 0
y = -4

[State 3250, Vel]
type = veladd
trigger1 = anim = 3251 && animelemtime(15) >= 0 && vel y < 0
y = 0.05

[State 3250, ctrlvel]
type = veladd
trigger1 = anim = 3251 && (vel x = [ -1.33, 1.33]) && vel y < 0
x = ifelse(command = "holdfwd", 0.15, ifelse(command = "holdback", -.15, 0))
[State 3250, ctrlvelAI]
type = veladd
trigger1 = anim = 3251 && (vel x = [ -1.33, 1.33]) && vel y < 0 && AIlevel
x = ifelse(p2bodydist x > 50, 0.15, ifelse(p2bodydist x < -50, -.15, 0))

[State 3250, Anim]
type = changeanim
trigger1 = anim = 3250 && !animtime
value = 3251
[State 3250, Anim]
type = changeanim
trigger1 = anim = 3251 && !animtime
value = 3205
persistent = 0
[State 3250, statetype]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = A

[State 3250, spin]
type = playsnd
triggerall = anim = 3251
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
trigger2 = animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55 || animelem = 61
value = 1, 5
channel = 1

[State 3250, mainhits]
type = hitdef
triggerall = !var(16) && var(15) < 12
triggerall = anim = 3251
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
trigger2 = animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50 || animelem = 56
attr = A, HA
;damage = 24, 5
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Up
air.animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
hitSound = -1 + 0 * (var(31) := ifelse(random < 500, 6, 5))
guardSound = -1 + 0 * (var(32) := 0)
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 4)/1.5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3250, mainhitsb]
type = hitdef
triggerall = !var(16) && var(15) < 12
triggerall = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 35 || animelem = 41 || animelem = 47 || animelem = 53
attr = A, HA
;damage = 24, 5
damage = ceil(ifelse(fvar(12) * 20 < 7, 7, fvar(12) * 20)), 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -69
hitSound = -1 + 0 * (var(31) := ifelse(random < 500, 6, 5))
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 4)/1.5
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -43), var(36) := -70
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 3250, lasthit]
type = hitdef
triggerall = !var(16) && var(15) < 13
trigger1 = anim = 3251 && animelem = 62
attr = S, HA
;damage = 24, 5
damage = ceil(ifelse(fvar(12) * 39 < 7, 7, fvar(12) * 39)), 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, -2
air.type = Low
air.velocity = -7, -2
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -60
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I

;==< TENMA SHINZUI WARI >=
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3300, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 6

[State 3300, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3300, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 3300, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(22)
trigger1 = var(1)
trigger2 = var(15) < 0
var(15) = 0
ignorehitpause = 1

[State 3300, Super Cancel Juggle]
type = varadd
trigger1 = !time
trigger1 = var(21)
trigger1 = var(1)
trigger1 = var(15) > 0
var(15) = -5
ignorehitpause = 1

[State 3300, comboposition]
type = posadd
trigger1 = !time
trigger1 = (prevstateno = [1200, 1250]) || (prevstateno = [3200, 3250])
y = -30

[State 3300, Snd]
type = playsnd
trigger1 = !time
value = 4, 14
channel = 0
[State 3300, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3300, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8510;7500
ID = 8510;7500
name = "Super Charge"
postype = p1
pos = 5, -45
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3300, Super Pause]
type = SuperPause
trigger1 = !time
time = 41
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3300, NHB]
type = nothitby
trigger1 = anim = 3300 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3300, trail]
type = helper
trigger1 = anim = 3300 && animelem = 2
helpertype = normal
stateno = 3305
ID = 3305
name = "Tenma trail"
postype = p1
ownpal = 1
persistent = 0
[State 3300, Dust]
type = explod
trigger1 = anim = 3300 && animelem = 2
anim = 3306
ID = 3306
sprpriority = 2
postype = p1
ownpal = 1
[State 3300, Vel]
type = velset
trigger1 = anim = 3300 && animelem = 2
x = 12
y = 12

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 3, 7
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 1, 6
channel = 1

[State 3300, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 2
ID = 3300
attr = A, HA
damage = ceil(ifelse(fvar(12) * 176 < 7, 7, fvar(12) * 176)), 18
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -15
hitsound = s2, 11
guardsound = s2, 0
ground.type = High
animtype = Diagup
fall.animtype = Diagup
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -6.85
air.velocity = 0, -6.85
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 54
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -22

[State 3300, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3300 && animelemtime(2) > 0 && pos y >= -5
value = 3301
persistent = 0

[State 3300, Type]
type = statetypeset
trigger1 = anim = 3301
statetype = S
physics = N
[State 3300, Type]
type = velmul
trigger1 = anim = 3301
x = 0.8

[State 3300, Stop]
type = posset
trigger1 = anim = 3301
y = 0
[State 3300, Stop]
type = velset
trigger1 = anim = 3301
y = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && animelem = 1
anim = 7104
ID = 7102
sprpriority = -2
postype = p1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && vel x > 1 && !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 42, 0
vel = -1, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 0, 52
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 5, 14

[State 3300, End]
type = changestate
trigger1 = anim = 3301 && !animtime
value = 0
ctrl = 1

;==< SHUN GOKU SATSU >=
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

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 14, 6
channel = 0
volume = 200
[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8520;7500
ID = 8520;7500
name = "Super Charge"
postype = p1
pos = 7, -105
ownpal = 1
persistent = 0
supermovetime = 9999

[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = ifelse(!var(1), 3, 4), ifelse(!var(1), 0, 13)
channel = 0
volume = 200

[State 4000, NHB]
type = nothitby
trigger1 = time < 6
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = 1
x = 5 + (var(1) * 3)
[State 4000, Snd]
type = playsnd
trigger1 = animelemtime(1) > 1
value = 5, 6
persistent = 0

[State 4000, Miss]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = time
trigger1 = !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= 12
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = ifelse(var(1) = 1, 4004, 4001)
fall = 1 
fall.recover = 0

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
sprpriority = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1114002

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0
[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4001, vsothers]
type = varset
trigger1 = !time
var(41) = 234

[State 4001, vsgoukiorgen]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Gouki" || target, name = "Shin Gouki" || target, name = "Akuma" || target, name = "Shin Akuma"
trigger2 = target, name = "Mech Gouki" || target, name = "Cyber Akuma" || target, name = "Gen"
trigger3 = target, name = "Pocket Shin Gouki" || target, name = "cvsgouki" || target, name = "SF3Gouki"
trigger4 = target, name = "SoulGen" || target, name = "Gouki_Cota" || target, name = "Gouki CVS 3"
var(41) = 15

[State 4001, vsevilryu]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Evil Ryu" || target, name = "ERyu"
trigger2 = target, name = "Ryu" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger3 = target, name = "CVSEvilRyu" || target, name = "Destrudo Ryu"
trigger4 = target, name = "Ryu" && target, authorname = "N64Mario" && target, palno >= 7
trigger5 = target, name = "cvsryu" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger6 = target, name = "eRYU -SvsC"
var(41) = 20

[State 4001, vsothersgsusers]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "God Rugal" || target, name = "Dark Sakura"
trigger2 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger3 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger4 = target, name = "cvsg_rugal" && target, authorname = "Warusaki3"
trigger5 = target, name = "Tin's S_Gouki" || target, name = "Blaze Agent"
var(41) = 25

[State 4001, vsCAPCOMbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Demitri" || target, name = "Jedah"
trigger2 = target, name = "Vega" && (target, authorname = "Phantom.of.the.Server" || target, authorname = "Messatsu")
trigger3 = target, name = "cvsvega" && (target, authorname = "Warusaki3" || target, authorname = "Gargoyle")
trigger4 = target, name = "M.Bison" && target, authorname = "N -Mario"
trigger5 = target, name = "[Necromancer's] M. Bison"
trigger6 = target, name = "M. Bison" && target, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger7 = target, name = "CvSBison" && target, authorname = "Team Kai (Saiai and Koga)"
trigger8 = target, name = "Shadow DIO" || target, name = "Gill"
var(41) = 456

[State 4001, vsSNKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Geese" || target, name = "Orochi" || target, name = "Mukai" || target, name = "Ryuji Yamazaki"
trigger2 = target, name = "Geese Howard" || target, name = "Yamazaki"
trigger3 = target, name = "cvsgeese" || target, name = "DGeese" || target, name = "ORIGINAL ZERO"
trigger4 = target, name = "cvsyamazaki" || target, name = "Orochi Rebirth" || target, name = "Tin's Mukai"
trigger5 = target, name = "geese_mmx" || target, name = "Setsuna"
var(41) = 456

[State 4001, vsrugal]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Rugal" || target, name = "Rugal Bernstein" || target, name = "Omega Rugal"
trigger2 = target, name = "Rugal94" || target, name = "Rugal94(BOSS)" || target, name = "rugal_B"
trigger3 = target, name = "Rugal_TLE" || target, name = "Omega Rugal Gb" || target, name = "Tin G_rugal"
trigger4 = target, name = "Mech Rugal" || target, name = "Tin 2002_rugal" 
trigger5 = target, name = "Rugal CvS" 
trigger6 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) != 10
var(41) = 456

[State 4001, vsMKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Shao Kahn" || target, name = "Shang Tsung" || target, name = "Goro"
trigger2 = target, name = "Kintaro" || target, name = "Motaro"
trigger3 = target, name = "shaokahn"
var(41) = 456

[State 4001, vsMARVELbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dr.Doom"
trigger2 = target, name = "Dr. Doom by WhiteMagic2002"
var(41) = 456

[State 4001, vsGGbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Justice" || target, name = "Testament"
var(41) = 456

[State 4001, vsrandombadguys >= )]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Sevil Nahte" || target, name = "Perfect Weapon MB -02"
trigger2 = target, name = "Jaian"; lol = D
var(41) = 456

;NEED TO FINISH

[State 4001, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(16) < 0
triggerall = (var(41) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(41) = -1

[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(41) < 100
text = " %d button presses to recover"
params = var(41)
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(41) = 234
text = "Normal Damage"
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(41) = 456
text = "Extra Damage"

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
movetime = 2
[State 4001, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = animelemtime(17) < 0
value = SCA
time = 1
[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 16
sinadd = -255, -255, -255, 64
[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 4
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(17) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(17) < 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
triggerall = var(41) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1

[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = ifelse((var(41) = 456), -40, -32)
kill = animelem = 16

[State 4001, givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 36

[State 4001, HitSound]
type = playsnd
trigger1 = (Time = [32,89]) && !(Time % 5)
;trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
;trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 2, ifelse(!var(41), 0, ifelse((animelem = 16), 10, 3))
channel = 2

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 16
value = 2, ifelse(!var(41), 0, 10)
channel = 2

;[State 4001, Sparks]
;type = explod
;trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
;trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
;anim = ifelse(!var(30), 7001, 7030 + (random % 8))
;ID = 7000
;sprpriority = 5
;postype = p2
;pos = 0, (target, const(size.mid.pos.y))
;random = 60, 60
;facing = -1
;ownpal = 1
;ontop = 1
;pausemovetime = 300
;supermovetime = 300

[State 3610, Hit Sparks]
type = Helper
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
sprPriority = 5
posType = p2
pos = 0, (target, const(size.mid.pos.y))
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
time = 6
freq = 120
ampl = -4

[State 4001, Kanji]
type = explod
trigger1 = animelem = 17
anim = 7700
ID = 7700
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 3, 30),-19
bindtime = -1
removeongethit = 1
ownpal = 1
scale = 0.75,0.8

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(16) = 10
value =  4, 9
channel = 0

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(16) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(16) < 0
trigger1 = !var(41) && numtarget
trigger2 = target, stateno = 1114010
value = 4009

[State 4001, End]
type = changestate
trigger1 = animelemtime(16) >= 0 && winko
value = 362
[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- PLAYER ---
[Statedef 4004]
type = S
physics = N
movetype = A
anim = 4004
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4004, throw]
type = targetstate
trigger1 = !time
value = 1114002
[State 4004, throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4004, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0
[State 4004, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4004, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4004, vsothers]
type = varset
trigger1 = !time
var(41) = 345

[State 4004, vsgoukiorgen]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Gouki" || target, name = "Shin Gouki" || target, name = "Akuma" || target, name = "Shin Akuma"
trigger2 = target, name = "Mech Gouki" || target, name = "Cyber Akuma" || target, name = "Gen"
trigger3 = target, name = "Pocket Shin Gouki" || target, name = "cvsgouki" || target, name = "SF3Gouki"
trigger4 = target, name = "SoulGen" || target, name = "Gouki_Cota" || target, name = "Gouki CVS 3"
var(41) = 30

[State 4004, vsevilryu]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Evil Ryu" || target, name = "ERyu"
trigger2 = target, name = "Ryu" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger3 = target, name = "CVSEvilRyu" || target, name = "Destrudo Ryu"
trigger4 = target, name = "Ryu" && target, authorname = "N64Mario" && target, palno >= 7
trigger5 = target, name = "cvsryu" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger6 = target, name = "eRYU -SvsC"
var(41) = 30

[State 4004, vsothersgsusers]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "God Rugal" || target, name = "Dark Sakura"
trigger2 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger3 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger4 = target, name = "cvsg_rugal" && target, authorname = "Warusaki3"
trigger5 = target, name = "Tin's S_Gouki" || target, name = "Blaze Agent"
var(41) = 30

[State 4004, vsdhalsimetc]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dhalsim"
var(41) = 30

[State 4004, vsCAPCOMbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Demitri" || target, name = "Jedah"
trigger2 = target, name = "Vega" && (target, authorname = "Phantom.of.the.Server" || target, authorname = "Messatsu")
trigger3 = target, name = "cvsvega" && (target, authorname = "Warusaki3" || target, authorname = "Gargoyle")
trigger4 = target, name = "M.Bison" && target, authorname = "N -Mario"
trigger5 = target, name = "[Necromancer's] M. Bison"
trigger6 = target, name = "M. Bison" && target, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger7 = target, name = "CvSBison" && target, authorname = "Team Kai (Saiai and Koga)"
trigger8 = target, name = "Shadow DIO" || target, name = "Gill"
var(41) = 456

[State 4004, vsSNKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Geese" || target, name = "Orochi" || target, name = "Mukai" || target, name = "Ryuji Yamazaki"
trigger2 = target, name = "Geese Howard" || target, name = "Yamazaki"
trigger3 = target, name = "cvsgeese" || target, name = "DGeese" || target, name = "ORIGINAL ZERO"
trigger4 = target, name = "cvsyamazaki" || target, name = "Orochi Rebirth" || target, name = "Tin's Mukai"
trigger5 = target, name = "geese_mmx" || target, name = "Setsuna"
var(41) = 456

[State 4004, vsRugal]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Rugal" || target, name = "Rugal Bernstein" || target, name = "Omega Rugal"
trigger2 = target, name = "Rugal94" || target, name = "Rugal94(BOSS)" || target, name = "rugal_B"
trigger3 = target, name = "Rugal_TLE" || target, name = "Omega Rugal Gb" || target, name = "Tin G_rugal"
trigger4 = target, name = "Mech Rugal" || target, name = "Tin 2002_rugal"
trigger5 = target, name = "Rugal CvS" || target, name = "omega -rugal"
trigger6 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) != 10
var(41) = 456

[State 4004, vsMKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Shao Kahn" || target, name = "Shang Tsung" || target, name = "Goro"
trigger2 = target, name = "Kintaro" || target, name = "Motaro"
trigger3 = target, name = "shaokahn"
var(41) = 456

[State 4004, vsMARVELbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dr.Doom"
trigger2 = target, name = "Dr. Doom by WhiteMagic2002"
var(41) = 456

[State 4004, vsrandombadguys >= )]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Sevil Nahte" || target, name = "Perfect Weapon MB -02"
trigger2 = target, name = "Jaian"; lol = D
var(41) = 456

;NEED TO FINISH

[State 4004, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(41) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(41) = -1

[State 4004, preventrecover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(41) = [1, 98]) && numtarget
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
var(41) = 1

[State 4004, Debug]
type = displaytoclipboard
trigger1 = var(41) < 100
text = " %d button presses to recover"
params = var(41)
[State 4004, Debug]
type = displaytoclipboard
trigger1 = var(41) = 345
text = "Normal Damage"
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(41) = 456
text = "Extra Damage"

[State 4004, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 2
movetime = 2
[State 4004, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4004, nothitby]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1
[State 4004, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4004, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120
[State 4004, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 4
value = 0, 0, 0

[State 4004, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG
[State 4004, spr]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1
[State 4004, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 4004, hitadd]
type = hitadd
triggerall = var(41) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 1

[State 4004, hitdamage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = -17 -(var(41) = 456) * 4 + (!var(41)) * 12
;-ceil(ifelse((var(30) = 456), (target, lifemax * 0.8), (target, lifemax * 0.6)) / 33)
kill = animelem = 34
absolute = 1

[State 4004, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 36

[State 4004, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 2, ifelse(!var(41), 0, ifelse((animelem = 34), 10, ifelse(random<800,3,6)))
channel = 2

[State 3610, Hit Sparks]
type = Helper
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
sprPriority = 5
posType = p2
pos = 0, (target, const(size.mid.pos.y))
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300

;[State 4004, Sparks]
;type = explod
;trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
;trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
;trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
;trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
;anim = ifelse(!var(30), 7001, 7030 + (random % 8))
;ID = 7000
;sprpriority = 5
;postype = p2
;pos = 0, (target, const(size.mid.pos.y));-70
;random = 60, 60
;facing = -1
;ownpal = 1
;ontop = 1
;pausemovetime = 300
;supermovetime = 300

[State 4004, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
time = 6
freq = 120
ampl = -4

[State 4004, Kanji]
type = explod
trigger1 = animelem = 35
anim = 6013
ID = 6013
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4004, Snd]
type = playsnd
trigger1 = animelemtime(35) = 10
value = 4, 9
channel = 0

[State 4004, throw]
type = targetstate
trigger1 = animelemtime(34) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4004, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
trigger1 = !var(41) && numtarget
trigger2 = target, stateno = 1114010
value = 4009

[State 4004, End]
type = changestate
trigger1 = animelemtime(34) >= 0 && winko
value = 362
[State 4004, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;--- TARGET ---
[Statedef 1114002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
[State 1114002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 4003
[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150
[State 1114003, End]
type = selfstate
trigger1 = time >= 76 && alive
value = 5120


;--- PLAYER ---
[Statedef 4009]
type = S
physics = S
movetype = H
anim = 5910
velset = -5, 0
ctrl = 0
[State 4009, target]
type = targetstate
trigger1 = !time && numtarget
value = 1114010
[State 4009, imageoff]
type = afterimagetime
trigger1 = 1
time = 0
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 5010, 5
channel = 0
[State 4009, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 4009, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 7, 1
[State 4009, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4012
ID = 4012
postype = p1
pos = 0, -60
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4009, End]
type = changestate
trigger1 = anim = 5911 && !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1114010]
type = S
physics = S
movetype = H
anim = 0
velset = -5, 0
ctrl = 0
[State 1114010, Anim]
type = changeanim
trigger1 = !time && selfanimexist(150)
value = 150
[State 1114010, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140
[State 1114010, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 1114010, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = anim = 0 && time >= 54
value = 0
ctrl = 1

;==< MISOGI >=
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
juggle = 0
facep2 = 1
poweradd = -3000
sprpriority = 1

[State 4100, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 4100, Snd]
type = playsnd
trigger1 = !time
value = 4, 3
channel = 0
[State 4100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4100, Super Pause FX]
type = helper
trigger1 = anim = 4100 && animelem = 3
helpertype = normal
stateno = 8520;7500
ID = 8520;7500
name = "Super Charge"
postype = p1
pos = -5, -45
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4100, Super Pause]
type = superpause
trigger1 = anim = 4100 && animelem = 3
persistent = 0
time = 43
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 43

[State Corner Push]
type = varset
trigger1 = anim = 4100 && animelem = 3
fvar(5) = 0

[State 4100, NHB]
type = nothitby
trigger1 = anim = 4100
time = 1
value = SCA

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4100 && time = 46
value = 4101
[State 4100, statetype]
type = statetypeset
trigger1 = anim != 4101
statetype = S
physics = S
[State 4100, statetype]
type = statetypeset
trigger1 = anim = 4101
statetype = A
physics = N

[State 4100, Push]
type = playerpush
trigger1 = anim != 4100 && anim != 4103
value = 0
ignorehitpause = 1
[State 4100, sprpriority]
type = sprpriority
trigger1 = anim != 4100
value = -1
ignorehitpause = 1

[State 4100, illusions]
type = helper
trigger1 = anim = 4100 && time = 61
helpertype = normal
stateno = 4104
ID = 4104
name = "Misogi Illusion"
postype = p1
ownpal = 1
persistent = 0
pausemovetime = 999
supermovetime = 999

[State 4100, Pos]
type = posadd
trigger1 = anim = 4101 && animelem = 1
x = p2dist x -10
y = p2dist y -240
[State 4100, Snd]
type = playsnd
trigger1 = anim = 4101 && animelem = 1
value = 5, 9
persistent = 0

[State 4100, Vel]
type = velset
trigger1 = anim = 4101 && animelemtime(2) < 0
x = 0
y = 0

[State 4100, Vel]
type = velset
trigger1 = anim = 4101 && animelem = 2
y = 16;20
[State 4100, Accel]
type = gravity
trigger1 = anim = 4101 && animelemtime(2) > 0

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4101 && animelemtime(2) > 3 && p2dist y < (enemynear, const(size.height) + 20)
trigger2 = anim = 4101 && animelemtime(1) > 0 && pos y > -30
value = 4101
elem = 3
persistent = 0
[State 4100, Snd]
type = playsnd
trigger1 = anim = 4101 && animelemtime(2) > 3 && p2dist y < (enemynear, const(size.height) + 20)
trigger2 = anim = 4101 && animelemtime(1) > 0 && pos y > -30
value = 4, 11
channel = 0
persistent = 0

[State 4100, particles]
type = explod
trigger1 = anim = 4101 && animelemtime(2) > 0
vel = 0, -4
anim = 4111
sprpriority = 3
postype = p1
pos = 3, -60
random = 40, 40
facing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1

[State 4100, Hit]
type = hitdef
trigger1 = anim = 4101 && animelem = 3
trigger1 = var(11) := 6 && var(12) := -20 && var(13) := -55
attr = A, HA
;damage = 487, 69
damage = ceil(ifelse(fvar(12) * 487 < 7, 7, fvar(12) * 487)), 69
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 30
;sparkno = s7030 + (random % 8)
;guard.sparkno = s7001
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := 0
hitsound = s2, 9
guardsound = s2, 0
ground.type = High
air.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
guard.velocity = -10
air.velocity = 0, 20
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
;p2stateno = ifelse(p2statetype = A, 1114110, 1114100)
sprpriority = -1
ID = 4100
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * var(29)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 4100, p2state]
type = targetstate
trigger1 = movehit && numtarget(4100)
trigger1 = (target(4100), stateno = 5000) || (target(4100), stateno = 5010)
value = 1114100
ID = 4100
ignorehitpause = 1
[State 4100, p2state]
type = targetstate
trigger1 = movehit && numtarget(4100)
trigger1 = (target(4100), stateno = 5020)
value = 1114110
ID = 4100
ignorehitpause = 1

[State 4100, cutFX]
type = explod
triggerall = anim = 4101 && animelemtime(3) >= 0 && movehit && numtarget
trigger1 = (target, time = 0) && (target, movetype = H)
anim = 4107
sprpriority = 4
postype = p2
facing = -1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4101 && pos y >= -5
value = ifelse((movehit && p2movetype = H), 4102, 4103)

[State 4100, Stop]
type = posset
trigger1 = anim = [4102, 4103]
y = 0
[State 4100, Stop]
type = velset
trigger1 = anim = [4102, 4103]
y = 0

[State 4100, Shake]
type = envshake
trigger1 = (anim = 4102 || anim = 4103) && animelem = 1
time = ifelse((anim = 4102), 30, 15)
time = 18
freq = 120
ampl = 12

[State 4100, Snd]
type = playsnd
trigger1 = anim = 4102 && animelem = 1
value = 5, 7
[State 4100, fire]
type = explod
trigger1 = anim = 4102 && animelem = 1
vel = 0, 0
anim = 4105
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Snd]
type = playsnd
trigger1 = anim = 4103 && animelem = 1
value = 5, 10
[State 4100, fire]
type = explod
trigger1 = anim = 4103 && animelem = 1
vel = 0, 0
anim = 4106
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Dust]
type = explod
trigger1 = (anim = 4102 || anim = 4103) && animelem = 1
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 4100, Dust]
type = explod
trigger1 = anim = 4102 && animelemtime(1) = 13
vel = 0, 0
anim = 7107
ID = 7107
sprpriority = 5
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, particles]
type = explod
trigger1 = anim = 4102 && animelemtime(1) >= 5 && animelemtime(1) < 17
vel = ceil(5 + random / 100), ceil(1 + random / 500)
accel = -.4, -.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 60
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.1
[State 4100, particles]
type = explod
trigger1 = anim = 4102 && animelemtime(1) >= 3 && animelemtime(1) < 15
vel = -ceil(5 + random / 100), ceil(1 + random / 500)
accel = 0.4, -.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 60
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.1

[State Idle]
type = statetypeset
trigger1 = anim = 4102 || anim = 4103
movetype = I

[State 4100, End]
type = changestate
trigger1 = anim = 4102 && animelemtime(17) >= 0 && winko
value = 184
persistent = 0
[State 4100, End]
type = changestate
trigger1 = (anim = [4102, 4103]) && !animtime
value = 0
ctrl = 1


;--- TARGET STANDING ---
[Statedef 1114100]
type = S
physics = S
movetype = H
ctrl = 0
velset = gethitvar(xvel), 0
sprpriority = 1

[State 1114100, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 1114100, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5950)
value = 5950
[State 1114100, Anim]
type = changeanim2
trigger1 = !time && !selfanimexist(5950)
value = 1114100

[State 1114100, Stop]
type = posset
trigger1 = 1
y = 0
[State 1114100, Stop]
type = velset
trigger1 = 1
y = 0
[State 1114100, dust]
type = gamemakeanim
trigger1 = anim = 1114100 && animelem = 7
value = 60
pos = 0, 0
under = sysvar(1) <= 14
[State 1114100, snd]
type = playsnd
trigger1 = anim = 1114100 && animelem = 7
value = f7, 0

[State 1114100, Anim]
type = changeanim
trigger1 = time >= 110 && selfanimexist(5111)
value = 5111
[State 1114100, End]
type = selfstate
trigger1 = time >= 110
value = ifelse(alive, 5120, 5150)


;--- TARGET MID -AIR ---
[Statedef 1114110]
type = A
physics = N
movetype = H
ctrl = 0
velset = gethitvar(xvel), gethitvar(yvel)
sprpriority = 1

[State 1114110, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 1114110, Anim]
type = changeanim2
trigger1 = !time
value = 1114110

[State 1114110, Accel]
type = gravity
trigger1 = animelemtime(5) < 0
[State 1114110, Stop]
type = posset
trigger1 = pos y >= 0
y = 0
[State 1114110, Stop]
type = velset
trigger1 = pos y >= 0
y = 0
[State 1114110, sts]
type = statetypeset
trigger1 = pos y >= 0
type = L
physics = C

[State 1114110, Anim]
type = changeanim2
trigger1 = pos y >= 0
value = 1114110
elem = 5
persistent = 0
[State 1114110, dust]
type = gamemakeanim
trigger1 = animelem = 5
value = 62
pos = 0, 0
under = sysvar(1) <= 14
[State 1114110, snd]
type = playsnd
trigger1 = animelem = 5
value = f7, 2

[State 1114110, End]
type = selfstate
trigger1 = animelemtime(7) >= 110
value = ifelse(alive, 5120, 5150)

;==< KONGOU KOKURETSU ZAN >=
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 4200
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1
poweradd = -3000

[State 4200, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = (prevstateno = [1000,2999]) || var(20)
[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000,4999])

[State 4200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4200, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8520;7500
ID = 8520;7500
name = "Super Charge"
postype = p1
pos = -18, -126
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4200, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 55
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 55

[State Corner Push]
type = varset
trigger1 = animelem = 2
fvar(5) = 0

[State 4200, NHB]
type = nothitby
trigger1 = animelemtime(13) < 0
time = 1
value = SCA
[State 4200, Push]
type = playerpush
trigger1 = animelemtime(17) < 0
value = 0
ignorehitpause = 1

[State 4200, Aura]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 4203
ID = 4203
name = "KKZ Aura"
postype = p1
ownpal = 1
supermovetime = 46

[State 4200, Shake]
type = envshake
trigger1 = animelem = 15
time = 32
freq = 120
ampl = 12

[State 4200, Snd]
type = playsnd
trigger1 = animelem = 12
value = 4, 6
channel = 0
[State 4200, Snd]
type = playsnd
trigger1 = animelem = 15
value = 5, 15

[State 4200, lightning]
type = helper
trigger1 = animelem = 15
helpertype = normal
stateno = 4205
ID = 4206
name = "KKZ"
postype = p1
pos = -8, 7
ownpal = 1
size.xscale = 0.85
size.yscale = 0.85

[State 4200, shockwave1]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal
stateno = 4206
ID = 4205
name = "KKZ"
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
size.xscale = 0.85
size.yscale = 0.85
[State 4200, shockwave2]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal
stateno = 4206
ID = 4205
name = "KKZ"
postype = p1
facing = -1
pos = 0, 0
ownpal = 1
size.xscale = 0.85
size.yscale = 0.85

[State 4200, shockwave3]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
sprpriority = -3
facing = 1
pos = 0, 0
ownpal = 1
[State 4200, shockwave4]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
sprpriority = -3
facing = -1
pos = 0, 0
ownpal = 1

[State 4200, Dust]
type = helper
trigger1 = animelem = 15
helpertype = normal
stateno = 4210
ID = 4210
name = "Purple Dust"
postype = p1
pos = -8, 0
ownpal = 1

[State 4200, imageoff]
type = afterimagetime
trigger1 = animelemtime(17) >= 0
time = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 4200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
