; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================< SUPER STATES >========================================
;============================================================================================

;======================< SHINKUU HADOU KEN >=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3000, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0
volume = 200
[State 3000, focus]
type = helper
trigger1 = anim = 3000 && animelem = 2
helpertype = normal
stateno = 3004
ID = 3004
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300
[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3000 && animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -19, -63
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3000, Super Pause]
type = superpause
trigger1 = anim = 3000 && animelem = 2
time = 45
movetime = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3000 && animelem = 2
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000 || (anim = 3001 && animelemtime(2) < 0)
time = 1
value = SCA

[State 3000, width]
type = width
trigger1 = anim = 3001 && animelemtime(2) < 0
trigger2 = anim = 3001 && animelemtime(12) >= 0 && animelemtime(13) < 0
value = 13
[State 3000, width]
type = width
trigger1 = anim = 3001 && animelemtime(2) >= 0 && animelemtime(12) < 0
value = 26

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && time >= 48
value = 3001

[State 3000, hadouken]
type = helper
trigger1 = anim = 3001 && animelem = 2
helpertype = normal
stateno = 3005
ID = 3005
name = "Hadouken"
postype = p1
pos = 86, -55
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = anim = 3001 && animelem = 2
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 40, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 2
value = 4, 1
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


;======================< SHINKUU TENGYOU HADOU KEN >=============================
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3020
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3020, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3020, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0
volume = 200
[State 3020, focus]
type = helper
trigger1 = anim = 3020 && animelem = 2
helpertype = normal
stateno = 3024
ID = 3024
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300
[State 3020, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3020, Super Pause FX]
type = helper
trigger1 = anim = 3020 && animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -9, -57
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3020, Super Pause]
type = superpause
trigger1 = anim = 3020 && animelem = 2
time = 45
movetime = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3020 && animelem = 2
fvar(5) = 0

[State 3020, NHB]
type = nothitby
trigger1 = anim = 3020 || (anim = 3021 && animelemtime(2) < 0)
time = 1
value = SCA

[State 3020, width]
type = width
trigger1 = anim = 3021 && animelemtime(2) < 0
trigger2 = anim = 3021 && animelemtime(12) >= 0 && animelemtime(13) < 0
value = 9
[State 3020, width]
type = width
trigger1 = anim = 3021 && animelemtime(2) >= 0 && animelemtime(12) < 0
value = 18

[State 3020, Anim]
type = changeanim
trigger1 = anim = 3020 && time >= 48
value = 3021

[State 3020, hadouken]
type = helper
trigger1 = anim = 3021 && animelem = 2
helpertype = normal
stateno = 3005
ID = 3025
name = "Hadouken"
postype = p1
pos = 58, -105
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3020, Dust]
type = explod
trigger1 = anim = 3021 && animelem = 2
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 40, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 2
value = 4, 1
channel = 0
[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 2
value = 5, 0

[State 3020, End]
type = changestate
trigger1 = anim = 3021 && !animtime
value = 0
ctrl = 1


;======================< MIDARE ZAKURA >=============================
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelemtime(1) = 1
value = 4, 17
channel = 0
[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3100, Super Pause FX]
type = helper
trigger1 = anim = 3100 && animelemtime(1) = 1
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -18, -68
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3100, Super Pause]
type = superpause
trigger1 = anim = 3100 && animelemtime(1) = 1
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3100 && animelemtime(1) = 1
fvar(5) = 0

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(4) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && (animelem = 2 || animelem = 14)
x = 12
[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelem = 25
x = 18
[State 3100, Dust]
type = explod
trigger1 = anim = 3100 && (animelem = 4 || animelem = 15 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 24, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3100, Vel]
type = velset
triggerall = anim = 3100
trigger1 = (animelemtime(9) >= 0 && animelemtime(14) < 0)
trigger2 = (animelemtime(20) >= 0 && animelemtime(25) < 0)
x = 0

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelemtime(28) = 1
value = 0, 41
[State 3100, Dust]
type = helper
trigger1 = anim = 3100 && animelemtime(28) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(28) = 1
x = 12
y = -10
[State 3100, Vel]
type = velmul
trigger1 = anim = 3100 && animelemtime(28) > 1
x = 0.85

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 6 || animelem = 17)
value = 1, 4
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 28
value = 1, 5
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 28
value = 3, 4
channel = 0

[State 3100, hitlow]
type = hitdef
trigger1 = (animelem = 4 || animelem = 15 || animelem = 26) && anim = 3100
attr = S, HA
damage = 28, 6
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -30
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, ifelse((animelem = 26), -5, 0)
air.velocity = -4, ifelse((animelem = 26), -5, -2)
getpower = 0
givepower = 36, 36
fall = (animelem = 26)
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5

[State 3100, hitmedium]
type = hitdef
trigger1 = (animelem = 5 || animelem = 16 || animelem = 27) && anim = 3100
attr = S, HA
damage = 28, 6
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -61
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, ifelse((animelem = 27), -5, 0)
air.velocity = -4, ifelse((animelem = 27), -5, -2)
getpower = 0
givepower = 36, 36
air.fall = 1
fall = (animelem = 27)
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5

[State 3100, hithigh]
type = hitdef
trigger1 = (animelem = 6 || animelem = 17) && anim = 3100
attr = S, HA
damage = 28, 6
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5

[State 3100, hitfinal]
type = hitdef
trigger1 = (animelem = 28) && anim = 3100
attr = S, HA
damage = 27, 6
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -10
air.velocity = -5, -10
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1

[State 3100, statetype]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(28) >= 1
statetype = A
physics = A
[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100 && animelemtime(28) > 1 && vel y > -5
value = 1103

[State Idle]
type = statetypeset
trigger1 = anim = 1103
movetype = I


;======================< HARU ICHIBAN >=============================
[Statedef 3200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3200
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3200, Super Pause FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 20, -66
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3200, Super Pause]
type = superpause
trigger1 = animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 3
fvar(5) = 0

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(8) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Vel]
type = velset
trigger1 = animelemtime(6) >= 0 && animelemtime(31) < 0
x = 4

[State 3200, Dust]
type = explod
trigger1 = animelemtime(6) >= 0 && animelemtime(31) < 0 && !(time % 4)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 20, 0
vel = -1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 7
value = 3, 0
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = animelem = 32
value = 3, 4
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20 || animelem = 24 || animelem = 28
value = 1, 5
channel = 1
[State 3200, Snd]
type = playsnd
trigger1 = animelem = 32
value = 1, 6
channel = 1

[State 3200, statetype]
type = statetypeset
trigger1 = animelemtime(6) >= 0 && animelemtime(31) < 0
statetype = C
physics = C
[State 3200, statetype]
type = statetypeset
trigger1 = animelemtime(6) < 0 || animelemtime(31) >= 0
statetype = C
physics = C

[State 3200, hitlow]
type = hitdef
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20 || animelem = 24 || animelem = 28
attr = C, HA
damage = 26, 6
animtype = Hard
fall.animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -10
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
air.velocity = -4, -1
down.hittime = 30
down.velocity = -4, -11
getpower = 0
givepower = 36, 36
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
ID = 3200
nochainID = 3201
yaccel = 0.5

[State 3200, hitlow]
type = hitdef
trigger1 = animelem = 10 || animelem = 14 || animelem = 18 || animelem = 22 || animelem = 26
attr = C, HA
damage = 26, 6
animtype = Hard
fall.animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -10
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
air.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 4, 0
air.velocity = 4, -1
down.hittime = 30
down.velocity = 4, -11
getpower = 0
givepower = 36, 36
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
ID = 3201
nochainID = 3200
yaccel = 0.5

[State 3200, hitfinal]
type = hitdef
trigger1 = animelem = 33
attr = C, HA
damage = 26, 6
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -20, -71
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -4
air.velocity = -8, -4
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(34) >= 0
movetype = I

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHUN GOKU SATSU >=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
juggle = 15
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 3, 0
channel = 0
volume = 200
[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -8, -58
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
x = 5
[State 4000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 105
[State 4000, Dust]
type = explod
trigger1 = animelem = 3
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = -1, 0
pausemovetime = -1
supermovetime = -1

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
trigger1 = p2dist x >= 0 && p2bodydist x <= 25
trigger1 = !var(38)
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4001
fall = 1
fall.recover = 0
yaccel = 0.5

[State 4000, misssnd]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
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
value = 1114001

[State 4001, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4001, Snd]
type = playsnd
trigger1 = animelem = 6
value = 3, 3
channel = 0
[State 4001, width]
type = width
trigger1 = animelemtime(2) < -1
edge = 85, 45

[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = animelemtime(23) < 0
value = SCA
time = 1

[State 4001, kei]
type = helper
trigger1 = animelemtime(2) < 0 && !numhelper(6000)
helpertype = normal
stateno = 6010
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1

[State 4001, wait]
type = changeanim
trigger1 = animelemtime(2) < 0 && numhelper(6000)
trigger1 = (helper(6000), stateno = 6010) && (helper(6000), anim = 6002)
value = 4001
elem = 1
[State 4001, wait]
type = changeanim
trigger1 = animelemtime(2) < 0 && numhelper(6000)
trigger1 = (helper(6000), stateno = 6010) && (helper(6000), anim = 6010)
value = 4001
elem = 2

[State 4001, throw]
type = targetstate
trigger1 = animelem = 8
value = 1114002

[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(7) >= 0
time = 0
[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(8) >= 0 && animelemtime(23) < 0
flag = nobardisplay
flag2 = noFG

[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 40, 0
[State 4001, Bind]
type = posadd
trigger1 = animelem = 8
x = -25
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(23) < 0
pos = 65, 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelem = 7
time = 30
sinadd = -255, -255, -255, 120

[State 4001, BG PalFX]
type = bgpalfx
trigger1 = animelemtime(10) = -1 || animelemtime(14) = -1 || animelemtime(18) = -1
invertall = 1
add = 255, 255, 255
sinadd = -1000, -1000, -1000, 80
mul = 256, 128, 256
color = 0
time = 20
[State 4001, palfx]
type = palfx
trigger1 = animelemtime(10) = -1 || animelemtime(14) = -1 || animelemtime(18) = -1
add = -50, -50, -50
sinadd = -155, -155, -155, 80
mul = 256, 128, 256
color = 0
time = 20
[State 4001, black]
type = envcolor
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < -1
trigger2 = animelemtime(12) >= 0 && animelemtime(14) < -1
trigger3 = animelemtime(16) >= 0 && animelemtime(18) < -1
trigger4 = animelemtime(20) >= 0 && animelemtime(23) < -1
time = 2
value = 0, 0, 0

[State 4001, palfx]
type = palfx
trigger1 = animelemtime(23) = -1
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1
[State 4001, BG PalFX]
type = bgpalfx
trigger1 = animelemtime(23) = -1
add = 0, 0, 0
sinadd = 0, 0, 0, 1
color = 256
time = 1

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 1

[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = -ceil(38 * fvar(12))
kill = animelem = 22
[State 4001, givepower]
type = targetpoweradd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 36

;[State 4001, Snd]
;type = playsnd
;trigger1 = animelem = 10 || animelem = 14 || animelem = 18
;value = 3, ifelse((animelem = 10), 1, ifelse((animelem = 14), 2, 3))
;channel = 0
[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(23) = 10
value = 4, 7
channel = 0

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 2, ifelse((animelem = 22), 10, 3)

[State 4001, Sparks]
type = explod
trigger1 = animelem = 10 || animelem = 14 || animelem = 18
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = ifelse((animelem = 10), 69, ifelse((animelem = 10), 71, 59)), ifelse((animelem = 10), -85, ifelse((animelem = 10), -34, -88))
ownpal = 1
ontop = 1
pausemovetime = 300
supermovetime = 300
;[State 4001, Sparks]
;type = explod
;trigger1 = animelem = 8 || animelem = 9 || animelem = 12 || animelem = 13 || animelem = 16
;trigger2 = animelem = 17 || animelem = 20 || animelem = 21 || animelem = 22
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = p1
;pos = 65, -65
;random = 160, 160
;ownpal = 1
;ontop = 1
;pausemovetime = 300
;supermovetime = 300

[State 4001, Sparks]
type = explod
trigger1 = animelem = 8 || animelem = 9 || animelem = 12 || animelem = 13 || animelem = 16
trigger2 = animelem = 17 || animelem = 20 || animelem = 21 || animelem = 22
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = 65 + ceil(65 * cos(animelemtime(8) / 3.0)), -65 + ceil(65 * sin(animelemtime(8) / 3.0))
ownpal = 1
ontop = 1
pausemovetime = 300
supermovetime = 300

[State 4001, flowers]
type = explod
trigger1 = animelemtime(23) >= 0 && animelemtime(24) < 0 && numexplod(6090) < 12
vel = -(random / 2000.0), 0.5
accel = -.0075, 0
anim = 6090
ID = 6090
sprpriority = 4
postype = p1
pos = 25, -110
random = 100, 50
removetime = 210
facing = ifelse(random < 500, -1, 1)
scale = 0.25, 0.25
ownpal = 1

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(23) >= -1 && numtarget
value = 1114003
persistent = 0
[State 3100, statetype]
type = statetypeset
trigger1 = animelemtime(23) >= 0
movetype = I
[State 4001, End]
type = changestate
trigger1 = animelemtime(23) >= 0 && winko
value = 4002
[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1114001]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0
[State 1114001, Anim]
type = changeanim2
trigger1 = !time
value = 1114001

[Statedef 1114002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0
[State 1114002, Anim]
type = changeanim2
trigger1 = !time
value = 1114002
[State 1114002, palfx]
type = palfx
trigger1 = animelemtime(3) = -1 || animelemtime(7) = -1 || animelemtime(11) = -1
add = -50, -50, -50
sinadd = -155, -155, -155, 80
mul = 256, 128, 256
color = 0
time = 20

[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0
[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 1114003
[State 1114003, palfx]
type = palfx
trigger1 = !time
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1
[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150
[State 1114003, End]
type = selfstate
trigger1 = time >= 80 && alive
value = 5120


;======================< HARU ISSEN >=============================
[Statedef 4100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 4100
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -2000
sprpriority = 1
facep2 = 1

[State 4100, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 4100, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 17
channel = 0
[State 4100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4100, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -11, -56
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4100, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 53
movetime = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 2
fvar(5) = 0

[State 4100, NHB]
type = nothitby
trigger1 = time < 61
time = 1
value = SCA
ignorehitpause = 1

[State 4100, Vel]
type = velset
trigger1 = animelemtime(8) >= 0
x = 1.25 * const(velocity.run.fwd.x)
[State 4100, steps]
type = playsnd
trigger1 = animelem = 9 || animelem = 12
value = 0, 100

[State 4100, hitrunning]
type = hitdef
trigger1 = animelem = 8
ID = 4100
attr = S, HA
damage = 0, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 12
guard.pausetime = 4, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -55
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, 0
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
getpower = 0
givepower = 0, 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
p1stateno = 4101
kill = 0
yaccel = 0.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 4100, statetype]
type = statetypeset
trigger1 = anim = 1111
statetype = S
physics = S

[State 4100, missed]
type = changestate
trigger1 = animelemtime(8) >= 0 && !movehit
trigger1 = time >= 98
value = 1112
[State 4100, guarded]
type = changestate
trigger1 = animelemtime(8) >= 0 && moveguarded
value = 1113


;--- --TARGET -----
[Statedef 4105]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 4105, Pos]
type = posset
trigger1 = 1
y = 0
[State 4105, fall]
type = hitfallset
trigger1 = 1
value = 0
[State 4105, End]
type = selfstate
trigger1 = 1
value = 5000


;--- COMBO ---
[Statedef 4101]
type = S
physics = S
movetype = A
ctrl = 0
anim = 4101
velset = 0, 0
sprpriority = 1

[State 4101, p2state]
type = targetstate
trigger1 = !time && numtarget(4100)
value = 4105
ID = 4100
ignorehitpause = 1
[State 4101, Bind]
type = targetbind
trigger1 = !time && numtarget(4100)
pos = 64, 0
ID = 4100
ignorehitpause = 1

[State 4101, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
[State 4101, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 4101, Vel]
type = velset
trigger1 = anim = 4101 && animelem = 56
x = 12

[State 4101, Snd]
type = playsnd
trigger1 = anim = 4101 && animelemtime(62) = 1
value = 0, 41
[State 4101, Dust]
type = helper
trigger1 = anim = 4101 && animelemtime(62) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 4101, Vel]
type = velset
trigger1 = anim = 4101 && animelemtime(62) = 1
x = 12
y = -10
[State 4101, Vel]
type = velmul
trigger1 = anim = 4101 && animelemtime(62) > 1
x = 0.85

;[State 4101, Snd]
;type = playsnd
;trigger1 = anim = 4101 && animelem = 10
;value = 3, 0
;channel = 0
;[State 4101, Snd]
;type = playsnd
;trigger1 = anim = 4101 && animelem = 44
;value = 3, 2
;channel = 0
;[State 4101, Snd]
;type = playsnd
;trigger1 = anim = 4101 && animelem = 49
;value = 3, 6
;channel = 0
[State 4101, Snd]
type = playsnd
trigger1 = anim = 4101 && animelem = 56
value = 3, 3
channel = 0

[State 4101, Snd]
type = playsnd
trigger1 = anim = 4101 && (animelem = 2 || animelem = 10 || animelem = 16 || animelem = 23)
trigger2 = anim = 4101 && (animelem = 31 || animelem = 38 || animelem = 45 || animelem = 49)
value = 3, ifelse(random < 250, 1, ifelse(random < 333, 2, ifelse(random < 500, 5, 6)))
channel = 0

[State 4101, Snd]
type = playsnd
trigger1 = anim = 4101 && (animelem = 2 || animelem = 10 || animelem = 31 || animelem = 61)
value = 1, 3
channel = 1
[State 4101, Snd]
type = playsnd
trigger1 = anim = 4101 && (animelem = 16 || animelem = 23 || animelem = 38 || animelem = 45 || animelem = 49)
value = 1, 6
channel = 1

[State 4101, hitlow]
type = hitdef
trigger1 = (animelem = 11 || animelem = 24 || animelem = 39 || animelem = 50) && anim = 4101
attr = S, HA
damage = 32, 6
animtype = Hard
fall.animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, ifelse((animelem = 11), -66, ifelse((animelem = 24), -91, ifelse((animelem = 39), -54, -58)))
hitsound = s2, ifelse((animelem = 11), 3, 6)
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.type = Low
air.velocity = -6, -4
getpower = 0
givepower = 36, 36
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
kill = (numtarget != numenemy)
yaccel = 0.5

[State 4101, hithigh]
type = hitdef
trigger1 = (animelem = 3 || animelem = 17 || animelem = 32 || animelem = 46) && anim = 4101
attr = S, HA
damage = 32, 6
animtype = Hard
fall.animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, ifelse((animelem = 3), -66, ifelse((animelem = 17), -80, ifelse((animelem = 32), -58, -43)))
hitsound = s2, ifelse((animelem = 3), 3, 6)
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.type = Low
air.velocity = -6, -4
getpower = 0
givepower = 36, 36
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
kill = ifelse((animelem = 3), 0, (numtarget != numenemy))
yaccel = 0.5

[State 4101, hitlowshououken]
type = hitdef
trigger1 = (animelem = 59 || animelem = 61) && anim = 4101
attr = S, HA
damage = 32, 6
animtype = Hard
fall.animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 61), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0
air.type = Low
air.velocity = ifelse(p2bodydist x > 10, 0, -2), 0.5
getpower = 0
givepower = 36, 36
fall = (animelem = 61)
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 4101, hithighshououken]
type = hitdef
trigger1 = (animelem = 58 || animelem = 60) && anim = 4101
attr = S, HA
damage = 32, 6
animtype = Hard
fall.animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 60), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0
air.type = Low
air.velocity = ifelse(p2bodydist x > 10, 0, -2), 0.5
getpower = 0
givepower = 36, 36
fall = (animelem = 60)
air.fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 4101, hitfinal]
type = hitdef
trigger1 = animelem = 62 && anim = 4101
attr = A, HA
damage = 32, 6
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -16
air.type = High
air.velocity = -4, -16
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5

[State 4101, statetype]
type = statetypeset
trigger1 = anim = 4101 && animelemtime(62) >= 0 && animelemtime(68) < 1
statetype = S
physics = N
[State 4101, statetype]
type = statetypeset
trigger1 = anim = 4101 && animelemtime(62) >= 1
trigger2 = anim = 1103
statetype = A
physics = N
[State 4101, Accel]
type = gravity
trigger1 = anim = 4101 && animelemtime(62) >= 1
trigger2 = anim = 1103
[State 4101, Anim]
type = changeanim
trigger1 = anim = 4101 && animelemtime(62) > 1 && vel y > -5
value = 1103

[State Idle]
type = statetypeset
trigger1 = anim = 1103
movetype = I

[State 4101, End]
type = changestate
trigger1 = anim = 1103 && vel y > 0 && pos y >= 0
value = ifelse((movehit && !win), 4103, 52)


;--- TAUNT ---
[Statedef 4103]
type = S
physics = S
movetype = I
ctrl = 0
anim = 4103
[State 4103, imageoff]
type = afterimagetime
trigger1 = 1
time = 0
[State 4103, Snd]
type = playsnd
trigger1 = time = 1
value = 0, 52
[State 4103, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 4103, Stop]
type = velset
trigger1 = 1
y = 0
[State 4103, Pos]
type = posset
trigger1 = 1
y = 0
[State 4103, Snd]
type = playsnd
trigger1 = animelem = 10
value = 4, 7
channel = 0
[State 4103, Ctrl]
type = ctrlset
trigger1 = numenemy
trigger1 = enemy, ctrl
value = 1
[State 4103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHUNPUU CHOU RASEN >=============================
[Statedef 4200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 4200
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -2000
sprpriority = 1
facep2 = 1

[State 4200, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 4200, Snd]
type = playsnd
trigger1 = anim = 4200 && animelem = 3
value = 4, 5
channel = 0
[State 4200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4200, Super Pause FX]
type = helper
trigger1 = anim = 4200 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -3, -16
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4200, Super Pause]
type = superpause
trigger1 = anim = 4200 && animelem = 3
time = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 4200 && animelem = 3
fvar(5) = 0

[State 4200, NHB]
type = nothitby
trigger1 = anim = 4200
trigger2 = anim = 4201 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 4200, Anim]
type = changeanim
trigger1 = anim = 4200 && !animtime
value = 4201

[State 4200, Snd]
type = playsnd
trigger1 = anim = 4201 && animelem = 1
value = 0, 41
[State 4200, Dust]
type = helper
trigger1 = anim = 4201 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 4200, Dust]
type = explod
trigger1 = anim = 4201 && animelem = 1
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
;scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4200, Vel]
type = velset
trigger1 = anim = 4201 && animelem = 1
y = -7
[State 4200, slow]
type = veladd
trigger1 = anim = 4201 && animelemtime(21) < 0
y = -const(movement.yaccel) * 0.5

[State 4200, Anim]
type = changeanim
trigger1 = anim = 4201 && numtarget(4201)
trigger1 = animelemtime(21) >= 0 && animelemtime(22) < 0
value = 4202
[State 4200, Turn]
type = turn
trigger1 = anim = 4202 && animelem = 1
trigger1 = p2dist x < 0

[State 4200, Vel]
type = velset
trigger1 = anim = 4202 && animelemtime(23) < 0
y = 0

[State 4200, Snd]
type = playsnd
trigger1 = anim = 4201 && animelem = 1
value = 3, 0
channel = 0
[State 4200, Snd]
type = playsnd
trigger1 = anim = 4202 && (animelem = 2 || animelem = 6 || animelem = 11)
value = 3, ifelse((animelem = 2), 6, ifelse((animelem = 6), 1, 2))
channel = 0
[State 4200, Snd]
type = playsnd
trigger1 = anim = 4202 && animelem = 19
value = 4, 12
channel = 0
[State 4200, Snd]
type = playsnd
trigger1 = anim = 4201 && animelem = 21 && !numtarget(4201)
value = 3, 7
channel = 0

[State 4200, Snd]
type = playsnd
trigger1 = anim = 4202 && (animelem = 2 || animelem = 7 || animelem = 12 || animelem = 19)
value = 1, ifelse((animelem = 12), 6, 3)
channel = 1
[State 4200, spin]
type = playsnd
trigger1 = anim = 4201
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
value = 1, 5
channel = 1

[State 4200, hitrising]
type = hitdef
trigger1 = anim = 4201 && (animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18)
attr = A, HA
damage = 36, 7
animtype = Up 
guardflag = M
hitflag = MAF 
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, -44
hitsound = s2, ifelse(random < 500, 6, 5)
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 30, 1, 0), ceil(vel y) -1
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
ID = ifelse((animelem = 18), 4201, 4200)
yaccel = 0.5
forcestand = 1

[State 4200, hitrising]
type = hitdef
trigger1 = anim = 4201 && (animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16)
attr = A, HA
damage = 36, 7
animtype = Up 
guardflag = M
hitflag = MAF 
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, -44
hitsound = s2, ifelse(random < 500, 6, 5)
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 30, 1, 0), ceil(vel y) -1
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
ID = 4200
yaccel = 0.5
forcestand = 1

[State 4200, hitcombohigh]
type = hitdef
trigger1 = anim = 4202 && animelem = 2
attr = A, HA
damage = 36, 7
animtype = Hard
guardflag = M
hitflag = MAF 
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, -85
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -6
air.type = High
air.velocity = ifelse(p2bodydist x > 30, 1, 0), -3.5
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

[State 4200, hitcombolow]
type = hitdef
trigger1 = anim = 4202 && (animelem = 7 || animelem = 12)
attr = A, HA
damage = 36, 7
animtype = Hard
guardflag = M
hitflag = MAF 
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, ifelse((animelem = 7), -43, -34)
hitsound = s2, ifelse((animelem = 7), 3, 6)
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -6
air.type = Low
air.velocity = ifelse(p2bodydist x > 30, 1, 0), -3.5
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

[State 4200, hitfinal]
type = hitdef
trigger1 = anim = 4202 && animelem = 21
attr = A, HA
damage = 36, 7
animtype = Hard
guardflag = M
hitflag = MAF 
priority = 4, Hit
pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001 
sparkxy = -10, -32
hitsound = s2, 3
guardsound = s2, 0
ground.type = Trip
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -12, 8
air.type = Trip
air.velocity = -12, 8
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 8
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 4200, posfix]
type = posadd
trigger1 = anim = 4201 && animelem = 21
x = 10
y = -5

[State 4200, statetype]
type = statetypeset
trigger1 = anim = 4201 || anim = 4202
statetype = A
physics = A
[State 4200, statetype]
type = statetypeset
trigger1 = anim = 4201 && animelemtime(22) >= 0
movetype = I
[State 4200, imageoff]
type = afterimagetime
trigger1 = anim = 4201 && animelemtime(22) >= 0
time = 0

[State Idle]
type = statetypeset
trigger1 = anim = 4201 && animelemtime(21) >= 0
trigger2 = anim = 4202 && animelemtime(23) >= 0
movetype = I

[State 4200, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 52


;======================< NEKKETSU HADOU KEN >=============================
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

[State 4300, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4300, Snd]
type = playsnd
trigger1 = !time
value = 4, 21
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
[State 4300, Super Pause FX]
type = helper
trigger1 = anim = 4300 && animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -19, -63
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4300, Super Pause]
type = superpause
trigger1 = anim = 4300 && animelem = 2
time = 60
movetime = 60
anim = -1
sound = s7, 0
p2defmul = 1
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
trigger1 = anim = 4300 && time >= 63
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
anim = 7106
ID = 7106
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


;======================< MODE CHANGE >=============================
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

[State 4400, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 4400, Snd]
type = playsnd
trigger1 = !time
value = 3, 0
channel = 0
volume = 200
[State 4400, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4400, Super Pause FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 6, -81
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4400, Super Pause]
type = superpause
trigger1 = animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
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
var(1) = ifelse(var(1) = 1, 2, 1)

[State 4400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
