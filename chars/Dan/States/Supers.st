; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SUPER STATES >====
;====

;==< SHINKUU GADOU KEN >=
; Shinkuu Gadouken
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
poweradd = -1000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3000, width]
type = width
trigger1 = !time
value = floor(40 * const(size.xscale))

[State 3000, Snd]
type = playsnd
trigger1 = !time
value = 4, 16
channel = 0
volume = 200
[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(-44 * const(size.xscale)), floor(-185 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3000, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0


[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3000, gadouken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 3005
ID = 3005
name = "Shinkuu Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 6028
ID = 6028
pos = 60,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 20
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KOURYUU REKKA >=
; Koryuu Rekka
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
;juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -1000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1

[State 0, PosSet]
type = Posset
trigger1 = teammode = simul
trigger1 = numtarget && movehit 
trigger1 = anim = 3100 && animelemtime(12)<0
x = target, pos x -(40*facing)

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Snd]
type = playsnd
trigger1 = !time
value = 4, 15
channel = 0
[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3100, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(30 * const(size.xscale)), floor(-98 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3100, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime=43
anim = -1
p2defmul = 1
darken = 0


[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelem = 2
x = 12

[State 105, Dust]
type = helper
trigger1 = anim = 3100 && animelem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pos = 0, -pos y
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 10
value = 4, 9
channel = 0

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelem = 11
y = -11

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 11
value = 0, 41
[State 3100, Dust]
type = helper
trigger1 = anim = 3100 && animelem = 11
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 2 || animelem = 11)
value = 1, 3 + (animelem = 11) * 3
channel = 1

[State 3100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.8

[State 3100, statetype]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(11) >= 0
statetype = A
physics = A

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100 && animelemtime(11) > 0 && vel y > -2
value = 3101
persistent = 0

[State 3100, hitlow]
type = hitdef
trigger1 = animelem = 2 && anim = 3100
attr = S, HA
damage = 36, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -69
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
p2facing = 1
air.velocity = -3, -2.5
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
air.fall = 1
fall.recover = 0

[State 3100, hithigh]
type = hitdef
trigger1 = animelem = 3 && anim = 3100
trigger2 = animelem = 4 && anim = 3100
attr = S, HA
damage = 36, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 3), -83, -97)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
p2facing = 1
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -1, -2.5
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
air.fall = 1
fall.recover = 0

[State 3100, hitlow2]
type = hitdef
trigger1 = animelem = 10 && anim = 3100
attr = S, HA
damage = 36, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -69
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
p2facing = 1
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0.5, -6
air.velocity = 0, -6
guard.velocity = 0
ground.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3100, hithigh2]
type = hitdef
trigger1 = animelem = 11 && anim = 3100
persistent = 0
attr = S, HA
damage = 36, 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -83
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
p2facing = 1
ground.velocity = -2, -9
air.velocity = 0, -6
guard.velocity = 0
ground.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3100, hitfinal]
type = hitdef
trigger1 = animelem = 12 && anim = 3100
persistent = 0
attr = A, HA
damage = 36, 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -97
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -9
p2facing = 1
air.velocity = -2, -9
guard.velocity = 0
ground.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim != 3100
movetype = I


;==< HISHOU BURAIKEN >=
; Hisshou Buraiken
[Statedef 3200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3200
velset = 0, 0
;juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
poweradd = -1000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3200, Snd]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0
[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3200, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(0 * const(size.xscale)), floor(-155 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3200, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0



[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200 && animelemtime(9) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 5
value = 3, 6
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && (animelem = 48 || animelem = 54)
value = 3, 0
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 64
value = 4, 0
channel = 0

[State 3200, Snd]
type = playsnd
triggerall = anim = 3200
trigger1 = animelem = 8 || animelem = 14 || animelem = 21 || animelem = 30 || animelem = 37
trigger2 = animelem = 43 || animelem = 49 || animelem = 55 || animelem = 61 || animelem = 66
value = 1, ifelse((animelem = 8 || animelem = 21 || animelem = 43 || animelem = 55), 2, 5)
channel = 1
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 66
value = 1, 6
channel = 1

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 66
y = -11
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 66
value = 0, 41
[State 3200, Dust]
type = helper
trigger1 = anim = 3200 && animelem = 66
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1


[State 3200, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.8

[State 3200, statetype]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(66) >= 0
statetype = A
physics = A
[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && animelemtime(66) > 0 && vel y > -2
value = 3101
persistent = 0

[State 3200, hitlow]
type = hitdef
trigger1 = anim = 3200
trigger1 = animelem = 8 || animelem = 14 || animelem = 21 || animelem = 37 || animelem = 55 || animelem = 61
attr = S, HA
damage = 25, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 2
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 8), -43, ifelse((animelem = 14), -50, ifelse((animelem = 21), -65, ifelse((animelem = 37), -6, ifelse((animelem = 55), -54, -9)))))
sparkxy = -10, ifelse((animelem = 8), -43, ifelse((animelem = 14), -50, ifelse((animelem = 21), -65, ifelse((animelem = 37), -6, ifelse((animelem = 55), -54, -9)))))
hitsound = s2, ifelse((animelem = 8 || animelem = 21 || animelem = 55), 3, 6)
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = 0, -4.5
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
p2facing = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
guard.kill = 1
fall.kill = 1
kill = 0

[State 3200, hithigh]
type = hitdef
trigger1 = anim = 3200
trigger1 = animelem = 30 || animelem = 43 || animelem = 49
attr = S, HA
damage = 25, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 2
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 43), -46, -43)
hitsound = s2, ifelse((animelem = 43), 3, 6)
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
p2facing = 1
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = 0, -4.5
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
guard.kill = 1
fall.kill = 1
kill = 0

[State 3200, hitkouryuken]
type = hitdef
trigger1 = animelem = 65 && anim = 3200
attr = S, HA
damage = 24, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -69
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 1, -6
air.velocity = 1, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
p2facing = 1
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5

[State 3200, hitfinal]
type = hitdef
trigger1 = animelem = 66 && anim = 3200
persistent = 0
attr = A, HA
damage = 24, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -97
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
p2facing = 1
ground.hittime = 16
ground.velocity = -1, -10
air.velocity = -1, -10
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
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim != 3200
movetype = I


;==< CHOUHATSU DENSETSU >=
; Chouhatsu Densetsu
[Statedef 3300]
type = S
physics = S
movetype = I
ctrl = 0
anim = 3300
velset = 0, 0
poweradd = -1000 * !var(33)
sprpriority = 1
facep2 = 1

[State 3300, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3300, Anim]
type = changeanim
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger1 = time <= 45 && var(39)
value = 3300
elem = 3

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 3
value = 4, 2
channel = 0
persistent = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 3
value = 5, 5
persistent = 0
[State 3300, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3300, Super Pause FX]
type = helper
trigger1 = !time && !var(39)
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(85 * const(size.xscale)), floor(-182 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3300, Super Pause]
type = superpause
trigger1 = !time && !var(39)
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0


[State Corner Push]
type = varset
trigger1 = anim = 3300 && animelem = 3 && !var(39)
fvar(5) = 0

[State 3300, NHB]
type = nothitby
trigger1 = time < 10
trigger2 = anim = 3301
time = 1
value = SCA
ignorehitpause = 1
[State 3300, Push]
type = playerpush
trigger1 = anim = 3301
value = 0

[State 3300, densetsuvar]
type = varset
trigger1 = anim = 3300 || anim = 3303
var(31) = 0
[State 3300, densetsuvar]
type = varadd
trigger1 = anim = 3301 && !animtime
var(31) = 1
[State 3300, densetsuvar]
type = varset
trigger1 = anim >= 3304 && roundstate != 2
var(31) = 5

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3300 && !animtime
value = 3301

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3301 && !animtime && var(31) >= 6
value = 3302
[State 3300, Anim]
type = changeanim
trigger1 = anim = 3301 && !animtime && var(31) = 5
value = ifelse(random < 500, 3304, 3320)
[State 3300, Anim]
type = changeanim
trigger1 = anim = 3301 && !animtime
value = 3305 + (random % 10)
[State 3300, Anim]
type = changeanim
trigger1 = anim = 3302 && vel y > 0 && pos y >= -5
value = 3303
[State 3300, Anim]
type = changeanim
trigger1 = anim >= 3304 && !animtime
value = 3301

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3302 && animelem = 5
value = 4, 17
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3303 && animelem = 2
value = 4, ifelse(win,5,32)
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3304 && animelem = 5
value = 4, 24
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3305 && animelem = 5
trigger2 = anim = 3306 && animelem = 4
trigger3 = anim = 3307 && animelem = 3
trigger4 = anim = 3308 && animelem = 5
trigger5 = anim = 3309 && animelem = 4
trigger6 = anim = 3310 && animelem = 3
trigger7 = anim = 3311 && animelem = 3
trigger8 = anim = 3312 && animelem = 3
trigger9 = anim = 3313 && animelem = 3
trigger10 = anim = 3314 && animelem = 3
trigger11 = anim = 3320 && animelem = 4
value = 4, ceil(ifelse(random<83,59,ifelse(random < 90, 1, ifelse(random < 100, 2, ifelse(random < 111, 3, ifelse(random < 125, 10, ifelse(random < 142, 11, ifelse(random < 167, 13, ifelse(random < 200, 14, ifelse(random < 250, 17, ifelse(random < 333, 21, ifelse(random < 500, 39, 40))))))))))))
channel = 0

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3320 && animelem = 4
value = 5, 11

[State 3300, full]
type = palfx
trigger1 = anim = 3303 && animelem = 1 && roundstate = 2
time = 20
add = 255, 100, 0
sinadd = -255, -100, 0, 80
[State 3300, full]
type = playsnd
trigger1 = anim = 3303 && animelem = 1 && roundstate = 2
value = 7, 8
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3303 && animelem = 1 ;&& roundstate = 2
value = 6, 0
[State 3300, Power]
type = powerset
trigger1 = anim = 3303 && animelem = 1 && roundstate = 2
value = powermax

[State 3300, Power]
type = changestate
trigger1 = anim = 3303 && animelem = 1 && var(33) && win
value = 4101

[State 3300, flashsnd]
type = playsnd
trigger1 = anim = 3302 && animelemtime(3) >= 0 && !(time % 6)
value = 6, 2 + (random % 3)
[State 3300, flashes]
type = explod
trigger1 = anim = 3302 && animelemtime(3) >= 0 && !(time % 2)
anim = 4110
ID = 4105
sprpriority = -5
postype = left
pos = 160, 120
facing = -1 + (random < 500) * 2
random = 320, 240
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
ownpal = 1
pausemovetime = 20
supermovetime = 20
[State 3300, flashpalfx]
type = bgpalfx
trigger1 = anim = 3302 && animelemtime(3) >= 0 && !(time % 9)
time = 6
add = 128, 128, 128
sinadd = -128, -128, -128, 24

[State 3300, Turn]
type = turn
triggerall = p2dist x < 0
trigger1 = anim = 3302 && animelem = 3
trigger2 = anim = 3304 && animelem = 3
trigger3 = anim = 3305 && animelem = 3
trigger4 = anim = 3306 && animelem = 2
trigger5 = anim = 3307 && animelem = 3
trigger6 = anim = 3308 && animelem = 3
trigger7 = anim = 3309 && animelem = 3
trigger8 = anim = 3310 && animelem = 3
trigger9 = anim = 3311 && animelem = 3
trigger10 = anim = 3312 && animelem = 3
trigger11 = anim = 3313 && animelem = 3
trigger12 = anim = 3314 && animelem = 3
trigger13 = anim = 3320 && animelem = 3

[State 3300, Vel]
type = velset
trigger1 = anim = 3301
x = 5;3
[State 3300, Vel]
type = velset
trigger1 = anim = 3312
x = -2
[State 3300, Vel]
type = posset
trigger1 = anim = 3301 || anim = 3303
y = 0
[State 3300, Vel]
type = velset
trigger1 = anim = 3303
x = 0
y = 0
[State 3300, Vel]
type = velset
trigger1 = anim = 3302 && animelem = 3
x = 4
y = -12
[State 3300, Accel]
type = gravity
trigger1 = anim = 3302 && animelemtime(3) >= 0

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 3
trigger2 = anim = 3311 && animelem = 3
value = 0, 40
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3302 && animelem = 3
value = 0, 41
[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && animelemtime(3) >= 0 && !(time % 5)
anim = 7103
sprpriority = 3
postype = p1
scale = 0.5, 0.5
vel = -1, 0
ownpal = 1
[State 3300, Dust]
type = explod
trigger1 = anim = 3311 && animelem = 3
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
[State 3300, Dust]
type = helper
trigger1 = anim = 3302 && animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3303 && animelem = 1
value = 0, 52
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3313 && animelem = 6
value = 5, 6
[State 3300, Dust]
type = explod
trigger1 = anim = 3303 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
removetime = -2
ownpal = 1
scale = 0.5, 0.5
[State 3300, Dust]
type = explod
trigger1 = anim = 3313 && animelem = 6
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
removetime = -2
ownpal = 1
scale = 0.75, 0.75
[State 3300, Shake]
type = envshake
trigger1 = anim = 3313 && animelem = 6
time = 18
freq = 120
ampl = 6

[State 3300, turnoffCS]
type = varset
trigger1 = var(39) && anim = 3303
var(39) = 0

[State 3300, statetype]
type = statetypeset
trigger1 = anim = 3300 || anim = 3303
trigger2 = anim = 3301 && animelemtime(2) < 0
trigger3 = anim = 3305 && animelemtime(3) >= 0 && animelemtime(20) < 0
trigger4 = anim = 3307 && animelemtime(3) >= 0 && animelemtime(10) < 0
trigger5 = anim = 3308 && animelemtime(3) >= 0 && animelemtime(16) < 0
trigger6 = anim = 3309 && animelemtime(3) >= 0 && animelemtime(11) < 0
trigger7 = anim = 3310 && animelemtime(3) >= 0 && animelemtime(11) < 0
trigger8 = anim = 3311 && animelemtime(11) >= 0
trigger9 = anim = 3312 && animelemtime(3) >= 0 && animelemtime(10) < 0
trigger10 = anim = 3314 && animelemtime(3) >= 0 && animelemtime(12) < 0
trigger11 = anim = 3320 && animelemtime(3) >= 0 && animelemtime(9) < 0
statetype = S
physics = S
[State 3300, statetype]
type = statetypeset
trigger1 = anim = 3301 && animelemtime(2) >= 0
trigger2 = anim = 3302 && animelemtime(3) < 0
trigger3 = anim = 3304 && (animelemtime(3) < 0 || animelemtime(7) >= 0)
trigger4 = anim = 3305 && (animelemtime(3) < 0 || animelemtime(20) >= 0)
trigger5 = anim = 3306
trigger6 = anim = 3307 && (animelemtime(3) < 0 || animelemtime(10) >= 0)
trigger7 = anim = 3308 && (animelemtime(3) < 0 || animelemtime(16) >= 0)
trigger8 = anim = 3309 && (animelemtime(3) < 0 || animelemtime(11) >= 0)
trigger9 = anim = 3310 && (animelemtime(3) < 0 || animelemtime(11) >= 0)
trigger10 = anim = 3311 && (animelemtime(3) < 0 || animelemtime(12) >= 0)
trigger11 = anim = 3312 && (animelemtime(3) < 0 || animelemtime(10) >= 0)
trigger12 = anim = 3313 && (animelemtime(3) < 0 || animelemtime(6) >= 0)
trigger13 = anim = 3314 && (animelemtime(3) < 0 || animelemtime(12) >= 0)
trigger14 = anim = 3320 && (animelemtime(3) < 0 || animelemtime(9) >= 0)
statetype = C
physics = C
[State 3300, statetype]
type = statetypeset
trigger1 = anim = 3313 && animelemtime(3) >= 0 && animelemtime(6) < 0
statetype = L
physics = C
[State 3300, statetype]
type = statetypeset
trigger1 = anim = 3302 && animelemtime(3) >= 0
trigger2 = anim = 3311 && animelemtime(3) >= 0 && animelemtime(11) < 0
trigger3 = anim = 3313 && animelemtime(3) >= 0 && animelemtime(6) < 0
statetype = A
physics = N
[State 3300, End]
type = changestate
trigger1 = anim = 3303 && !animtime
value = 0
ctrl = 1


;==< MAX SHINKUU GADOU KEN >=
; MAX Shinkuu Gadouken 
[Statedef 3400]
type = S
physics = S
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
poweradd = -2000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1

[State 3400, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
[State 3400, width]
type = width
trigger1 = anim = 3401 && animelemtime(6) = -1
value = floor(40 * const(size.xscale))

[State 3400, Snd]
type = playsnd
trigger1 = !time
;value = 3, 7
value = 4, 44
channel = 0
volume = 200
[State 3400, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3400, Super Pause FX]
type = helper
trigger1 = time = 8
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(-26 * const(size.xscale)), floor(-110 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3400, Super Pause]
type = superpause
trigger1 = !time
time = 51
movetime = 51
anim = -1
p2defmul = 1
darken = 0



[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3400, NHB]
type = nothitby
trigger1 = anim = 3400
trigger2 = anim = 3401 && animelemtime(6) < 1
time = 1
value = SCA

[State 3400, Anim]
type = changeanim
trigger1 = anim = 3400 && time >= 43
value = 3401

[State 3400, gadouken]
type = helper
trigger1 = anim = 3401 && animelem = 6
helpertype = normal
stateno = 3405
ID = 3405
name = "Shinkuu Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 0.25
size.yscale = 0.25
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = anim = 3401 && animelem = 6
anim = 6028
ID = 6028
pos = 60,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.06125
sprpriority = 3

[State 3400, Snd]
type = playsnd
trigger1 = anim = 3401 && animelem = 6
value = 4, 45
channel = 0
[State 3400, Snd]
type = playsnd
trigger1 = anim = 3401 && animelem = 6
value = 5, 0

[State 3400, End]
type = changestate
trigger1 = anim = 3401 && !animtime
value = 0
ctrl = 1

;==< MAX HISSHOU BURAIKEN >=
; MAX Hisshou Buraiken
[Statedef 3500]
type = S
physics = S
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
poweradd = -2000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1


[State 3500, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3500, Snd]
type = playsnd
trigger1 = !time
value = 4, 47
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = !time
value = 4, 47
[State 3500, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3500, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(0 * const(size.xscale)), floor(-155 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3500, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0



[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3120, Dust]
type = helper
trigger1 = anim = 3500 && animelemtime(88) = 0 && numtarget
helpertype = normal
stateno = 3625
ID = 3625
name = "B&W Dust"
persistent = 0
postype = p1
pos= 40,0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3500, NHB]
type = nothitby
trigger1 = anim = 3500 && animelemtime(9) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 5
value = 4, 48
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 5
value = 4, 48
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && (animelem = 65 || animelem = 72)
value = 4, ifelse((animelem=72),51,50)
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && (animelem = 65 || animelem = 72)
value = 4, ifelse((animelem=72),51,50)
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 86
value = 4, 46
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 86
value = 4, 46
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 87
value = 5, 18

[State 3500, Snd]
type = playsnd
triggerall = anim = 3500
trigger1 = animelem = 6 || animelem = 8 || animelem = 13 || animelem = 20 || animelem = 25
trigger2 = animelem = 28 || animelem = 42 || animelem = 36 || animelem = 40 || animelem = 45
trigger3 = animelem = 51 || animelem = 58 || animelem = 65 || animelem = 71 || animelem = 73
trigger4 = animelem = 78 || animelem = 82 || animelem = 88
value = 1, ifelse(((animelem = 13) || (animelem = 20) || (animelem = 32) || (animelem = 45) || (animelem = 45) || (animelem = 58) || (animelem = 65) || (animelem = 77)), 2, ifelse((animelem=88),3,5))
channel = 1
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 88
value = 1, 6
channel = 1

[State 3500, Vel]
type = velset
trigger1 = anim = 3500 && animelem = 88
y = -13
[State 3500, Vel]
type = velset
trigger1 = anim = 3500 && animelem = 86
x = 8
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3500 && animelem = 88
value = 0, 41
[State 3500, Dust]
type = helper
trigger1 = anim = 3500 && animelem = 88
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3500, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.8

[State 3500, statetype]
type = statetypeset
trigger1 = anim = 3500 && animelemtime(88) >= 0
statetype = A
physics = A
[State 3500, Anim]
type = changeanim
trigger1 = anim = 3500 && animelemtime(88) > 0 && vel y > -2
value = 3101
persistent = 0

[State 3500, hitlow]
type = hitdef
trigger1 = anim = 3500
trigger1 = animelem = 8 || animelem = 25 || animelem = 28 || animelem = 32 || animelem = 45 || animelem = 51 || animelem = 65 || animelem = 71 || animelem = 77 || animelem = 82
attr = S, HA
damage = 25, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 2
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 8), -43, ifelse((animelem = 14), -50, ifelse((animelem = 21), -65, ifelse((animelem = 37), -6, ifelse((animelem = 55), -54, -9)))))
sparkxy = -10, ifelse((animelem = 32 || animelem = 65), -10, ifelse((animelem = 45 || animelem = 77), -50, -55))
hitsound = s2, ifelse((animelem = 32 || animelem = 45 || animelem = 65 || animelem = 78), 6, 3)
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = 0, -3
p2facing = 1
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
guard.kill = 1
fall.kill = 1
kill = 0


[State 3500, hithigh]
type = hitdef
trigger1 = anim = 3500
trigger1 = animelem = 6 || animelem = 13 || animelem = 20 || animelem = 36 || animelem = 40 || animelem = 58 || animelem = 73
attr = S, HA
damage = 25, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 2
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 40), -42, -85)
hitsound = s2, ifelse((animelem = 43), 3, 6)
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
p2facing = 1
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = 0, ifelse((animelem=58),-4,-3)
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
guard.kill = 1
fall.kill = 1
kill = 0

[State 3500, hitfinal]
type = hitdef
trigger1 = animelem = 88 && anim = 3500
persistent = 0
attr = A, HA
damage = 40, 7
animtype = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 30, 30
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -97
hitsound = s2, 8
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
p2facing = 1
ground.hittime = 16
ground.velocity = -1, -13
air.velocity = -1, -13
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
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim != 3500
movetype = I


;==< SHISSOU BURAIKEN >=
; Shissou Buraiken
[Statedef 3600]
type = S
physics = S
movetype = A
anim = 3600
ctrl = 0
velset = 0, 0
poweradd = ifelse(((partner, name = "Akuma" && partner, authorname = "Mr.Ansatsuken") && (prevstateno = 1251131 || prevstateno = 1251132)),-1000,-2000 + ((prevstateno=3300)*1000))
sprpriority = 1
facep2 = 1


[State 3500, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 0, PosSet]
type = Posset
triggerall = teammode = simul
trigger1 = anim = 3603 && animelemtime(41)<0
trigger2 = anim = 3602
trigger2 = prevstateno = 1251131 || prevstateno = 1251132
x = target, pos x -(40*facing)

[State 0, PosSet]
type = targetbind
triggerall = teammode = simul
trigger1 = anim = 3603 && animelemtime(41)<0
trigger2 = anim = 3602
trigger2 = prevstateno = 1251131 || prevstateno = 1251132
pos = 40, ifelse(target,statetype=A,-1,0)

[State 3500, Snd]
type = playsnd
trigger1 = !time
value = 4, 43
channel = 0
[State 3500, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3500, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(0 * const(size.xscale)), floor(-155 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3500, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0


[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3500, NHB]
type = nothitby
trigger1 = anim = 3600
trigger2 = anim = 3601 && time <8
trigger3 = anim = 3602 || anim = 3603
time = 1
value = SCA
ignorehitpause = 1

[State 3500, NHB]
type = nothitby
trigger1 = anim = 3601 && time >=8
time = 2
value = ,AP
ignorehitpause = 1


[State 105, Dust]
type = helper
trigger1 = anim = 3600 && !animtime
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3600 && !animtime
value = 3601 


[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
forcestand = 1
guard.pausetime = 15,15
forcenofall = 1
pausetime = 0, 30
sparkno = -1
numhits = 0
hitsound = -1
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -50
guard.sparkNo = -1 + 0*(var(44) := 8001)
guardsound = s2, 0
p2stateno = 58743
p2facing = 1
ID = 3600
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3601 && movehit = 1 && numtarget
value = 3602

[State 100, steps]
type=playsnd
trigger1= anim = 3601 && (animelem=2 || animelem=5)
value= 0,ifelse((animelem=2),50,51)

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3602 && !animtime
value = 3603

[State 3200, Vel]
type = velset
trigger1 = anim = 3603 && animelemtime(41) = 0
y = -14

[State 3200, Vel]
type = targetbind
trigger1 = anim = 3602 && animelemtime(1) = 0
pos = 20,0

[State 3120, Dust]
type = helper
trigger1 = anim = 3603 && animelemtime(40) = 3
trigger2 = anim = 3602 && animelemtime(2) = 0
helpertype = normal
stateno = 3625
ID = 3625
name = "B&W Dust"
persistent = 1
postype = p1
pos= 40,0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3603 && animelemtime(41) > 0 && vel y > -2
value = 3101

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3101 && pos y >= 0
value = 3606

;
;[State 0, Pause]
;type = Pause
;trigger1 = anim = 3602 && animelemtime(2)<0
;trigger1 = (gametime % 2) = 1
;time = 4
;movetime = 1


[State 0, ChangeAnim]
type = PosSet
trigger1 = anim = 3601 && time = 62
y = -30

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3601
trigger2 = anim = 3604
trigger3 = anim = 3607
x = 8

[State 3500, Snd]
type = playsnd
trigger1 = anim = 3601 && time = 62
value = 5000, ifelse(anim=3601,5,4)
;value = 5000, ifelse(anim=3601,5,1)
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3601 && time = 62
trigger2= anim = 3607 && animelemtime(1) = 1
y = ifelse((anim=3607),-4,-5)
[State 0, VelAdd]
type = VelAdd
trigger1 = anim = 3604
trigger2 = anim = 3607
trigger3 = anim = 3101
trigger4 = anim = 3603 && animelemtime(41)>=0
;trigger5 = anim = 3602 && animelemtime(4)<0
y = .5

[State 100, steps]
type = playsnd
trigger1 = time = 8
trigger2 = time = 24
value = 0, 105
persistent = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3601 && time = 62
value = 3604

[State 0, AngleDraw]
type = AngleDraw
trigger1 = anim = 3604
value = -3*(time-58)


;
;[State 0, PlayerPush]
;type = PlayerPush
;trigger1 = anim = 3604
;value = 0

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3601
trigger2 = anim = 3604
trigger3 = anim = 3607
x = ifelse(anim=3601,8,4)

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3608
trigger2 = anim = 3602 && animelem = 4
trigger3 = anim = 3606 && animelem = 1
y = 0

[State 0, VelSet]
type = PosSet
trigger1 = anim = 3608
trigger2= anim = 3607 && animelemtime(1) = 1
trigger3 = anim = 3602 && animelem = 4
trigger4 = anim = 3606 && animelem = 1
y = 0

[State 0, VelSet]
type = Velmul
trigger1 = anim = 3608
x = .88

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3604 && pos y >= 0 && time>22
trigger2 = anim = 3607 && pos y >= 0 && animelemtime(1)>2
value = ifelse((anim=3607),3608,3607)


[State 4000, Dust]
type = explod
trigger1 = !(time % 6)
trigger1 = anim = 3601
anim = 7103
sprpriority = 3
scale = 0.5, 0.5
postype = p1
pos = floor(50 * const(size.xscale))
vel = -2, 0
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
triggerall = animelemtime(1)=0
trigger1 = anim = 3608
trigger2 = anim = 3607
trigger3 = anim = 3606 && animelem = 1
value = S0,40;+((anim=3608)*65)
channel = 2
ignorehitpause = 1
persistent = 1

[State 1260, ExFX]
type = explod
triggerall = animelemtime(1)=0
trigger1 = anim = 3608
trigger2 = anim = 3607
trigger3 = anim = 3602 && animelem = 4
trigger4 = anim = 3606 && animelem = 1
anim = 8102
sprpriority = -1
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1100, Dust]
type = helper
trigger1 = animelem = 1 && anim = 3602
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 3602
value = 0, 41

;[State 3500, Snd]
;type = playsnd
;trigger1 = animelem = 2 && anim = 3602
;value = 5, 17

;[State 0, VelSet]
;type = VelSet
;trigger1 = animelem = 1 && anim = 3602
;y = -5

;[State 3500, Snd]
;type = playsnd
;triggerall = anim = 3603
;trigger1 = animelem = 5 || animelem = 21 || animelem = 34
;trigger2 = animelem = 11 || animelem = 15 || animelem = 26
;value = 4, ifelse((animelem = 5),49,ifelse((animelem = 11),50,ifelse((animelem = 15),49,ifelse((animelem = 21),49,ifelse((animelem = 26),50,51)))))
;channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3603 && animelem = 1
value = 3, 10
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3603 && animelem = 1
value = 3, 10
channel = 2


;[State 3500, Snd]
;type = playsnd
;trigger1 = anim = 3603 && animelem = 41
;value = 6, 0
;[State 3300, flashsnd]
;type = playsnd
;trigger1 = anim = 3603 && animelemtime(41) >= 0 && !(time % 6)
;value = 6, 2 + (random % 3)
;[State 3300, flashes]
;type = explod
;trigger1 = anim = 3603 && animelemtime(41) >= 0 && !(time % 2)
;anim = 4110
;ID = 4105
;sprpriority = -5
;postype = left
;pos = 160, 120
;facing = -1 + (random < 500) * 2
;random = 320, 240
;scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
;ownpal = 1
;pausemovetime = 20
;supermovetime = 20
;[State 3300, flashpalfx]
;type = bgpalfx
;trigger1 = anim = 3603 && animelemtime(41) >= 0 && !(time % 9)
;time = 6
;add = 128, 128, 128
;sinadd = -128, -128, -128, 24




[State 3500, Snd]
type = playsnd
trigger1 = anim = 3602 && animelem = 2
value = 3, 0
channel = 0
;[State 3500, Snd]
;type = playsnd
;trigger1 = anim = 3603 && animelem = 32
;value = 4, 51
;channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3603 && animelem = 40
value = 4, 75
channel = 0
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3603 && animelem = 40
value = 4, 75
channel = 2
[State 3500, Snd]
type = playsnd
trigger1 = anim = 3603 && animelem = 40
value = 5, 18

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3606 && teammode != simul
statetype = A       ;S,A,C,L
movetype = H

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3606
movetype = I

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 3608
statetype = L       ;S,A,C,L


[State 3500, Snd]
type = playsnd
trigger1 = anim = 3606 && animelem = 4
value = 5, 3
;
;[State 3500, Snd]
;type = playsnd
;trigger1 = anim = 3606 && animelem = 4
;value = 4, 32
;
;[State 3500, Snd]
;type = playsnd
;trigger1 = anim = 3606 && animelem = 4
;value = 6, 0

[State 182, teeth]
type = explod
trigger1 = anim = 3606 && animelem = 4
anim = 4105
ID = 4105
sprpriority = 2
postype = p1
pos = floor(-9 * const(size.xscale)), floor(-172 * const(size.yscale))
ownpal = 1
scale = 0.5, 0.5

[State 3500, First hit]
type = hitdef
trigger1 = animelem = 2 && anim = 3602
persistent = 0
attr = A, HA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 1, 30
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -75
hitsound = s2, 8
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1, 0
air.velocity = -1, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
kill = 0


[State 3200, hitlow]
type = hitdef
trigger1 = anim = 3603
trigger1 = animelem = 11 || animelem = 15 || animelem = 26
attr = S, HA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 1, 3
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkxy = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 11), -59, ifelse((animelem = 15), -50, -55))
hitsound = s2, ifelse((animelem = 15), 6, 3)
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = -2, -7
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
kill = 0

[State 3200, hithigh]
type = hitdef
trigger1 = anim = 3603
trigger1 = animelem = 5 || animelem = 21 || animelem = 34
attr = S, HA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 1, 3
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkxy = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 5), -76, ifelse((animelem = 21), -75, -86))
hitsound = s2, ifelse((animelem = 21), 3, 6)
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 20, 2, 0), 0
ground.cornerpush.veloff = 0
air.velocity = -2, -7
air.fall = 1
fall.recover = 0
forcestand = 1
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
kill = 0


[State 3500, hitfinal]
type = hitdef
trigger1 = animelem = 41 && anim = 3603
persistent = 0
attr = A, HA
damage = 50, 7
animtype = diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 30, 30
sparkNo = -1 + 0 * (var(43) := 8014)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -97
hitsound = s2, 8
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -16
air.velocity = -3, -16
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
yaccel = 0.5
forcestand = 1


;
;[State -2, Hit Sparks]
;type = Helper
;triggerAll = MoveContact = 1 && var(40) = HitPauseTime && !numtarget(3600)
;trigger1 = (MoveHit = 1) && NumEnemy
;helperType = Normal
;stateNo = 4050
;ID = 8000
;name = "Spark"
;postype = P1
;pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(45), ceil(P2Dist x), var(45))) * (const(size.xScale)*2)), ceil(var(46) * (const(size.yScale)*2))
;facing = -1
;size.xscale = 1
;size.yscale = 1
;ownPal = 1
;pauseMoveTime = 65535
;superMoveTime = 65535
;ignoreHitPause = 1


[State 182, teeth]
type = explod
trigger1 = anim = 3606 && animelem = 4
anim = 4106
ID = 4106
sprpriority = 2
postype = p1
pos = floor(-9 * const(size.xscale)), floor(-172 * const(size.yscale))
ownpal = 1
scale = 0.5, 0.5

[State 3500, Snd]
type = playsnd
trigger1 = anim = 3607 && animelemtime(1)=0
;value = 5000, ifelse(anim=3601,5,4)
value = 5000, ifelse(anim=3601,5,3)
channel = 0

[State Idle]
type = statetypeset
trigger1 = anim = 3604
trigger2 = anim = 1101
movetype = I

[State 0, ChangeState]
type = ChangeState
triggerall = !animtime
trigger1 = anim = 3608
trigger2 = anim = 3606
value = 0
ctrl = 1

;(Buraiken air target)
[Statedef 58743]
type = S
movetype= H
physics = N
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0
ignorehitpause = 1
persistent = 1

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030
;
;[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
;type = ChangeAnim
;trigger1 = Time = 0
;trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim
[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = Anim = 5000
trigger2 = Anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = Anim = 5001
trigger2 = Anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = Anim =  5012
trigger2 = Anim = 5002
trigger3 = Anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 6]
type = selfstate
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;Stand get-hit (knocked back)

[State 5000, 7]
type = selfstate
trigger1 = HitShakeOver
value = 5030


;==< OYAJI BLAST >=
; Oyaji Blast
[Statedef 3700]
type = S
physics = S
movetype = A
anim = 105
ctrl = 0
velset = 0, 0
poweradd = -2000 + ((prevstateno=3300)*1000)
sprpriority = -1
facep2 = 1


[State 3500, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 4001, nothitby]
type = nothitby
trigger1 = time < 64
value = SCA
time = 1
[State 4001, nothitby]
type = nothitby
triggerall = AIlevel && time >= 64
trigger1 = numhelper(3750) && helper(3750), anim = 3750
trigger2 = numhelper(3750) && helper(3750), anim = 3751 && helper(3750), animelemtime(2)<0
value = , AP
time = 1

[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
triggerall = anim = 105
trigger1 = animelem = 2
x = -3
y = -4
[State 105, Type]
type = statetypeset
triggerall = anim = 105
trigger1 = animelemtime(2) = 0
statetype = A
physics = A

[State 105, Snd]
type = playsnd
triggerall = anim = 105
trigger1 = animelem = 2
value = 0, 105

[State 105, Type]
type = statetypeset
triggerall = anim = 105
trigger1 = vel y > 0 && pos y >= -4
statetype = S
physics = S
[State 105, End]
type = changeanim
triggerall = anim = 105
trigger1 = vel y > 0 && pos y >= -4
value = 3700

[State 52, Snd]
type = playsnd
trigger1 = anim = 3700 && animelemtime(1)=0
value = 0, 52
[State 52, Snd]
type = playsnd
trigger1 = anim = 3700 && animelemtime(1)=0
value = 4, 82
channel = 0
[State 52, Snd]
type = playsnd
trigger1 = anim = 3700 && animelemtime(1)=0
value = 4, 82
channel = 7
[State 52, Dust]
type = explod
trigger1 = anim = 3700 && animelemtime(1)=0
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
facing = 0
pos = 60,0
ignorehitpause = 1
persistent = 1

[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3700 && animelemtime(1)=0
helpertype = normal
stateno = 8510
ID = 8510
name = "Super Charge"
postype = p1
pos = floor(-44 * const(size.xscale)), floor(-185 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3000, Super Pause]
type = superpause
trigger1 = !time
time = 60
movetime = 60
anim = -1
p2defmul = 1
darken = 0
[State Corner Push]
type = varset
trigger1 = anim = 3700 && animelemtime(1)=0
fvar(5) = 0
[State 3000, width]
type = width
trigger1 = anim = 3700 && animelemtime(1)=0
value = floor(40 * const(size.xscale))

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1
ignorehitpause = 1
persistent = 1

[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3700 && animelemtime(1)=0
helpertype = normal
stateno = 3750
ID = 3750
name = "Gou ''Oyaji'' Hibiki"
postype = p1
pos = 60,0
ownpal = 1
persistent = 0
supermovetime = 43

[State 1500, pusher]
type = helper
trigger1 = anim = 3700 && animelemtime(1)=0
trigger2 = helper(3750), anim = 3751
trigger2 = numhelper(3750) && !numhelper(1505)
helpertype = normal
stateno = 1505
ID = 1505
name = "Pusher"
postype = p1
size.xscale = 1
supermovetime = 43
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
ownpal = 1


[State 52, Snd]
type = playsnd
trigger1 = anim = 3700 && animelemtime(4)=0
value = 4, 83
channel = 0
[State 52, Snd]
type = playsnd
trigger1 = anim = 3700 && animelemtime(4)=0
value = 4, 83
channel = 7


[State 105, Type]
type = velset
trigger1 = anim = 3700 && animelemtime(1)=0
y = 0
x = 0

[State 105, Type]
type = posset
trigger1 = anim = 3700 && animelemtime(1)=0
y = 0

[State 105, End]
type = changeanim
triggerall = !numhelper(3750)
trigger1 = anim = 3700 && animelemtime(11)=0
trigger2 = anim = 3700 && animelemtime(7)=0
value = 3701

[State 3000, End]
type = changestate
trigger1 = anim = 3701
trigger1 = !animtime
value = 0
ctrl = 1


;==< METSU GADOU KEN >=
; Metsu Gadouken
[Statedef 3800]
type = S
physics = S
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
poweradd = -2000 + ((prevstateno=3300)*1000)
sprpriority = 1
facep2 = 1

[State 3400, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
[State 3400, width]
type = width
trigger1 = anim = 3401 && animelemtime(6) = -1
value = floor(40 * const(size.xscale))

[State 3400, Snd]
type = playsnd
trigger1 = !time
;value = 3, 7
value = 3, 7
channel = 0
volume = 200
[State 3400, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3400, Super Pause FX]
type = helper
trigger1 = time = 8
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(-26 * const(size.xscale)), floor(-110 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3400, Super Pause]
type = superpause
trigger1 = !time
time = 51
movetime = 51
anim = -1
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3400, NHB]
type = nothitby
trigger1 = anim = 3400
trigger2 = anim = 3401 && animelemtime(6) < 1
time = 1
value = SCA

[State 3400, Anim]
type = changeanim
trigger1 = anim = 3400 && time >= 43
value = 3401

[State 3400, gadouken]
type = helper
trigger1 = anim = 3401 && animelem = 6
helpertype = normal
stateno = 3805
ID = 3805
name = "Metsu Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = anim = 3401 && animelem = 6
anim = 6028
ID = 6028
pos = 60,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3


[State 3400, Snd]
type = playsnd
trigger1 = anim = 3401 && animelem = 6
value = 4, 45
channel = 0
[State 3400, Snd]
type = playsnd
trigger1 = anim = 3401 && animelem = 6
value = 5, 0

[State 3400, End]
type = changestate
trigger1 = anim = 3401 && !animtime
value = 0
ctrl = 1



;==< OTOKO MICHI >=
; Otoko Michi
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
juggle = 15
poweradd = (-3000 + ((prevstateno=3300)*1000)) * !var(33)
facep2 = 1
sprpriority = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4300, Strength]
type = varset
trigger1 = !time
var(11) = ifelse(var(33)!=0,2,1)

[State 415, snd]
type = stopsnd
trigger1 = animelem = 23
channel = 7
[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 4, 27
channel = 0
volume = 255
[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(7 * const(size.xscale)), floor(-132 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0


[State Corner Push]
type = varset
trigger1 = animelem = 3
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA
[State 4000, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
physics = N
[State 4000, Vel]
type = velset
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
x = 4
[State 4000, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
physics = S

[State 4000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0
[State 4000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 105
channel = 1

[State 4000, tears]
type = explod
trigger1 = (time % 4) = 0
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
anim = 4009
ID = 4009
sprpriority = 2
postype = p1
pos = floor(101 * const(size.xscale)), floor(-155 * const(size.yscale))
random = 4, 4
vel = -1 -(random / 1000.0), -(random / 1000.0)
accel = 0, 0.1 + (random / 10000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.125 + (random / 8000.0), 0.125 + (random / 8000.0)
ownpal = 1
[State 4000, tears]
type = explod
trigger1 = (time % 4) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
anim = 4009
ID = 4009
sprpriority = 2
postype = p1
pos = floor(101 * const(size.xscale)), floor(-155 * const(size.yscale))
random = 4, 4
vel = -1 -(random / 1000.0), -(random / 1000.0)
accel = 0, 0.1 + (random / 10000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.1 + (random / 10000.0), 0.1 + (random / 10000.0)
ownpal = 1

[State 4000, Dust]
type = explod
trigger1 = !(time % 6)
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
anim = 7103
sprpriority = 3
scale = 0.5, 0.5
postype = p1
pos = floor(50 * const(size.xscale))
vel = -2, 0
ownpal = 1

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= 36
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4001
animtype = Up
ground.velocity = -1.5, -32
yaccel = 0.75
sprpriority = 1
fall = 1
fall.recover = 0

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
physics = S
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1


[State Throw]
type = targetstate
trigger1 = !time
value = 4002

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 28
channel = 0
[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 6, 6
channel = 8
[State -2, (Stopping Dan's Mythical Taunt music)]
type = stopsnd
trigger1 = !time
channel = 5
ignorehitpause = 1
[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 5, 11;0, 800
channel = 9

[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4001, nomusic]
type = assertspecial
trigger1 = animelemtime(6) < 0
flag = nomusic

[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(4) >= 0
time = 0
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = -1

[State 4001, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = floor(120 * const(size.xscale)), 0
[State 4001, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = floor(90 * const(size.xscale)), 0
[State 4001, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = floor(60 * const(size.xscale)), 0
[State 4001, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
pos = floor(30 * const(size.xscale)), 0

[State 4001, exclamation]
type = explod
trigger1 = !time
anim = 4007
ID = 4007
sprpriority = 2
postype = p2
pos = (target, const(size.head.pos.x)) -5, (target, const(size.head.pos.y)) -10
facing = -1
scale = 0.5, 0.5
ownpal = 1

[State 4001, charge]
type = helper
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0 && !numhelper(4006)
helpertype = normal
stateno = 4006
ID = 4006
name = "Otoko Charge"
postype = p1
pos = floor(15 * const(size.xscale)), floor(-95 * const(size.yscale))
ownpal = 1
persistent = 0
size.xscale = 1
size.yscale = 1
[State 4001, charge]
type = helper
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0 && !numhelper(4007)
helpertype = normal
stateno = 4007
ID = 4007
name = "Otoko Charge"
postype = p1
pos = floor(15 * const(size.xscale)), floor(-95 * const(size.yscale))
ownpal = 1
persistent = 0
size.xscale = 1
size.yscale = 1
[State 4001, palfx]
type = palfx
trigger1 = animelem = 5
time = 120
sinadd = 64, 64, 192, 480

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 6
value = 1
[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 6
value = -ceil(535 * fvar(12))
[State 4001, hitdamage]
type = targetpoweradd
trigger1 = animelem = 6
value = 36
[State 4001, throw]
type = targetstate
trigger1 = animelem = 6
value = 4004

[State -2, Allahu Akbar!]; lel, it's just a joke. Take it easy m8
type = varset
triggerall = animelemtime(4) = 20 && target, life <= 480
trigger1 = !AIlevel && command = "holdstart"
trigger2 = AIlevel && ceil(random<50)
var(10)=1
ignorehitpause = 1
[State -2, ALLAHU AKBARRR!!!]; Just a prank bro
type = playsnd
triggerall = animelemtime(4) = 20
trigger1 = var(10) = 1
channel = 8
value = 6, 7
ignorehitpause = 1
[State -2, ALLAHU AKBAR!]; I'm aware if you're muslim and found this easter egg you might just MIGHT be mad, but c'mon.
type = playsnd;			It's not racism if I'm half arab :^)
triggerall = animelemtime(4) = 20
trigger1 = var(10) = 1
channel = 9
value = 6, 7;					And jew.
ignorehitpause = 1

;
;[State 4101, flashes]
;type = explod
;triggerall = var(11) = 2
;trigger1 = animelemtime(6) = [0,61]
;anim = 4110
;ID = 4105
;sprpriority = -5
;postype = left
;pos = 160, 120
;facing = -1 + (random < 500) * 2
;random = 320, 240
;scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
;ownpal = 1
;pausemovetime = 20
;supermovetime = 20
;[State 4101, flashsnd]
;type = playsnd
;triggerall = var(11) = 2
;trigger1 = animelemtime(6) = [0,61]
;trigger1 = !(gametime % 6)
;value = 6, 2 + (random % 3)
;[State 4101, flashpalfx]
;type = allpalfx
;triggerall = var(11) = 2
;trigger1 = animelemtime(6) = [0,61]
;trigger1 = !(gametime % 9)
;time = 3
;add = 128, 128, 128
;sinadd = -128, -128, -128, 12




[State 4001, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 7
[State 4001, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 9
[State 4001, Shake]
type = envshake
trigger1 = animelem = 6
time = 18
fre = 120
ampl = 12
[State 4001, explosion]
type = explod
trigger1 = animelemtime(6) = -3
anim = 4005
ID = 4005
sprpriority = 4
postype = p1
removetime = -2
ownpal = 1

[State 4001, ohnoes]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 4008
ID = 4008
name = "Otoko Portrait"
postype = back
ownpal = 1
persistent = 0
size.xscale = 0.5
size.yscale = 0.5 * (1.3333333 * gameheight / gamewidth)

[State 4001, palfx]
type = palfx
trigger1 = animelem = 6
time = 100
color = 32
sinadd = 80, 25, 0, 8
mul = 512, 256, 128

[State -2, boo!]
type = playsnd
triggerall = var(11) = 2
triggerall = var(10) != 1
trigger1 = animelem = 6
value = 6, 0
channel = 5
ignorehitpause = 1
[State 4300, Snd]
type = varset
trigger1 = animelem = 6
var(33)= 0

[State 4001, flames]
type = helper
trigger1 = animelem = 6 && !numhelper(7181)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p1
ownpal = 1
facing = -1
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
persistent = 0
[State 4001, flames]
type = helper
trigger1 = animelem = 6 && numtarget && !numhelper(7180)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1
persistent = 0

[State 4001, reducelife]
type = lifeset;add
trigger1 = animelem = 6
value = 1;-260
kill = 0
[State 4001, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 23
channel = 0

[State 4001, Vel]
type = velset
trigger1 = animelem = 6
x = -1.5
y = -32

[State 4001, fix]
type = velset
trigger1 = winko
trigger1 = vel y > 0 && screenpos y < 0
x = 0
[State 4001, fix]
type = posset
trigger1 = winko
trigger1 = vel y > 0 && screenpos y < 0
x = -80 * facing

[State 4001, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A
physics = N
movetype = H
[State 4001, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.75
[State 4001, Shake]
type = envshake
trigger1 = animelemtime(6) >= 0 && vel y > 0 && pos y >= 5
time = 18
fre = 120
ampl = 6
[State 4001, End]
type = changestate
trigger1 = animelemtime(6) >= 0 && vel y > 0 && pos y >= 5
value = 5100


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
trigger1 = time = 76
time = 120
sinadd = 64, 64, 192, 480

[Statedef 4004]
type = S
physics = N
movetype = H
ctrl = 0
[State 4004, palfx]
type = palfx
trigger1 = !time
time = 100
color = 32
sinadd = 80, 25, 0, 8
mul = 512, 256, 128
[State 4004, End]
type = selfstate
trigger1 = 1
value = 5020


;=< CHOUHATSU SHINWA >===
; Chouhatsu Shinwa
[Statedef 4100]
type = S
physics = S
movetype = I
anim = 4100
ctrl = 0
velset = 0, 0
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 4100, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4100, Snd]
type = playsnd
trigger1 = !time
value = 4, 5
channel = 0
volume = 200
[State 4100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4100, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(-52 * const(size.xscale)), floor(-160 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 4100, Super Pause]
type = superpause
trigger1 = !time
time = 43
movetime = 43
anim = -1
p2defmul = 1
darken = 0
[State 4100, theme]
type = playsnd
trigger1 = time = 44
value = 6, 5
channel = 5
volume = 255
loop = 1


[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4100, Var]
type = varset
trigger1 = time
var(33) = 901

[State 4100, End]
type = changestate
trigger1 = time >= 44
value = 0
ctrl = 1


;--- < RESET > ---
[Statedef 4101]
type = S
physics = S
movetype = I
anim = 4101
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 415, snd]
type = stopsnd
trigger1 = animelem = 2 
channel = 7
[State 4101, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(win,5,32)
channel = 0
[State 4101, Snd]
type = playsnd
trigger1 = !time
value = 6, 0
channel = 5
[State 4101, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 10
[State 4101, teeth]
type = explod
trigger1 = animelem = 2
anim = 4105
ID = 4105
sprpriority = 2
postype = p1
pos = floor(-9 * const(size.xscale)), floor(-172 * const(size.yscale))
ownpal = 1
scale = 0.5, 0.5
[State 4101, flashes]
type = explod
trigger1 = 1
anim = 4110
ID = 4105
sprpriority = -5
postype = left
pos = 160, 120
facing = -1 + (random < 500) * 2
random = 320, 240
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
ownpal = 1
pausemovetime = 20
supermovetime = 20
[State 4101, flashsnd]
type = playsnd
trigger1 = !(gametime % 6)
value = 6, 2 + (random % 3)
[State 4101, flashpalfx]
type = allpalfx
trigger1 = !(gametime % 9)
time = 3
add = 128, 128, 128
sinadd = -128, -128, -128, 12
[State 4101, imageoff]
type = afterimagetime
trigger1 = animelemtime(2) >= 0
time = 0
[State 4101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;==< JUN KOKU SATSU >=
; Jun Koku Satsu
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 105
ctrl = 0
velset = 0, 0
poweradd = (-3000 + ((prevstateno=3300)*1000)) * !var(33)
sprpriority = -1
facep2 = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4300, Strength]
type = varset
trigger1 = !time
var(11) = ifelse(var(33)!=0,2,1)

[State 4001, nothitby]
type = nothitby
trigger1 = time < 66
trigger1 = numhelper(4250) && helper(4250), stateno != 3751
value = SCA
time = 1

[State 4001, nothitby]
type = nothitby
trigger1 = time >= 66
trigger1 = numhelper(4250) && helper(4250), stateno != 3751
value = , AP
time = 1

[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
triggerall = anim = 105
trigger1 = animelem = 2
x = -3
y = -4
[State 105, Type]
type = statetypeset
triggerall = anim = 105
trigger1 = animelemtime(2) = 0
statetype = A
physics = A

[State 105, Snd]
type = playsnd
triggerall = anim = 105
trigger1 = animelem = 2
value = 0, 105

[State 105, Type]
type = statetypeset
triggerall = anim = 105
trigger1 = vel y > 0 && pos y >= -4
statetype = S
physics = S
[State 105, End]
type = changeanim
triggerall = anim = 105
trigger1 = vel y > 0 && pos y >= -4
value = 4200

[State 52, Snd]
type = playsnd
trigger1 = anim = 4200 && animelemtime(1)=0
value = 0, 52
[State 52, Snd]
type = playsnd
trigger1 = anim = 4200 && animelemtime(1)=0
value = 4, 85
channel = 0
[State 52, Snd]
type = playsnd
trigger1 = anim = 4200 && animelemtime(1)=0
value = 4, 85
channel = 7
[State 52, Dust]
type = explod
trigger1 = anim = 4200 && animelemtime(1)=0
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
facing = 0
pos = 60,0
ignorehitpause = 1
persistent = 1

[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 4200 && animelemtime(1)=0
helpertype = normal
stateno = 8520
ID = 8520
name = "Super Charge"
postype = p1
pos = floor(-44 * const(size.xscale)), floor(-185 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 3000, Super Pause]
type = superpause
trigger1 = !time
time = 60
movetime = 60
anim = -1
p2defmul = 1
darken = 0
[State Corner Push]
type = varset
trigger1 = anim = 4200 && animelemtime(1)=0
fvar(5) = 0
[State 3000, width]
type = width
trigger1 = anim = 4200 && animelemtime(1)=0
value = floor(40 * const(size.xscale))


[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1
ignorehitpause = 1
persistent = 1

[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 4200 && animelemtime(1)=0
helpertype = normal
stateno = 4250
ID = 4250
name = "Gou ''Oyaji'' Hibiki"
postype = p1
pos = 60,0
ownpal = 1
persistent = 0
supermovetime = 43

[State 1500, pusher]
type = helper
trigger1 = anim = 4200 && animelemtime(1)=0
helpertype = normal
stateno = 1505
ID = 1505
name = "Pusher"
postype = p1
size.xscale = 1
supermovetime = 43
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
ownpal = 1

[State -2, boo!]
type = playsnd
triggerall = var(11) = 2
trigger1 = helper(4250), stateno = 4251
trigger1 = helper(4250), time = 93
persistent = 0
value = 6, 0
channel = 5
ignorehitpause = 1

[State 4101, flashes]
type = explod
triggerall = var(11) = 2
trigger1 = helper(4250), stateno = 4251
trigger1 = helper(4250), time = [93,154]
anim = 4110
ID = 4105
sprpriority = -5
postype = left
pos = 160, 120
facing = -1 + (random < 500) * 2
random = 320, 240
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
ownpal = 1
pausemovetime = 20
supermovetime = 20
[State 4101, flashsnd]
type = playsnd
triggerall = var(11) = 2
trigger1 = helper(4250), stateno = 4251
trigger1 = helper(4250), time = [93,154]
trigger1 = !(gametime % 6)
value = 6, 2 + (random % 3)
[State 4101, flashpalfx]
type = allpalfx
triggerall = var(11) = 2
trigger1 = helper(4250), stateno = 4251
trigger1 = helper(4250), time = [93,154]
trigger1 = !(gametime % 9)
time = 3
add = 128, 128, 128
sinadd = -128, -128, -128, 12
[State -2, Reset]
type = varset
trigger1 = helper(4250), stateno = 4251
trigger1 = helper(4250), time = 93
var(33) = 0
ignorehitpause = 1

[State 52, Snd]
type = playsnd
trigger1 = anim = 4200 && animelemtime(4)=0
value = 4, 86
channel = 0
[State 52, Snd]
type = playsnd
trigger1 = anim = 4200 && animelemtime(4)=0
value = 4, 86
channel = 7


[State 105, Type]
type = velset
trigger1 = anim = 4200 && animelemtime(1)=0
y = 0
x = 0

[State 105, Type]
type = posset
trigger1 = anim = 4200 && animelemtime(1)=0
y = 0

[State 105, End]
type = changeanim
triggerall = !numhelper(4250)
trigger1 = anim = 4200 && animelemtime(11)=0
trigger2 = anim = 4200 && animelemtime(7)=0
value = 3701

[State 3000, End]
type = changestate
trigger1 = anim = 3701
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
value = 4202

[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 4203
[State 1114002, Anim]
type = turn
trigger1 = !time
[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150
[State 1114003, End]
type = selfstate
trigger1 = time >= 76 && alive
value = 5120


;==< HAOH GADOU KEN >=
; Haoh Gadouken
[Statedef 4300]
type = S
physics = S
movetype = A
anim = 4300
ctrl = 0
velset = 0, 0
poweradd = (-3000 + ((prevstateno=3300)*1000)) * !var(33)
sprpriority = 1
facep2 = 1
[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 8150,0
dest = 8150,0+var(1)=2
ignorehitpause = 1
persistent = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4300, Strength]
type = varset
trigger1 = !time
var(11) = ifelse(var(33)!=0,2,1)

[State 4300, width]
type = width
trigger1 = anim = 3401 && animelemtime(6) = -1
value = floor(40 * const(size.xscale))

[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelemtime(1) = 3
;value = 3, 7
value = 4, 41
channel = 0
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelemtime(1) = 3
;value = 3, 7
value = 4, 41
channel = 7
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelemtime(3) = 0
;value = 3, 7
value = 3, 9
channel = 0
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelemtime(3) = 0
;value = 3, 7
value = 3, 9
volume = 255
[State 4300, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4300, Super Pause FX]
type = helper
trigger1 = anim = 4300 && time = 60
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = floor(-26 * const(size.xscale)), floor(-110 * const(size.yscale))
ownpal = 1
persistent = 0
supermovetime = 9999
size.xscale = 1
size.yscale = 1
[State 4300, Super Pause]
type = superpause
trigger1 = !time
time = 126
movetime = 126
anim = -1
p2defmul = 1
darken = 0


[State 1260, Burning fists 1]
type = explod
triggerall = anim = 4300
trigger1 = time >=60
anim = ifelse(!time%3,8151,8150)
sprpriority = 2
postype = p1
pos = -12, -53
random = 10, 10
facing = ifelse(random<500,-1,1)
vfacing = ifelse(random<500,-1,1)
vel = 0, -0.5
accel = 0, -0.075
scale = ifelse(!time%2,0.25,0.125), ifelse(!time%2,0.25,0.125)
pauseMoveTime = 65535
superMoveTime = 65535
ownpal = 1

[State 1260, Burning fists 2]
type = explod
triggerall = anim = 4300
trigger1 = time >=60
anim = ifelse(!time%3,8151,8150)
sprpriority = 2
postype = p1
pos = 19, -57
random = 10, 10
vel = 0, -0.5
facing = ifelse(random<500,-1,1)
vfacing = ifelse(random<500,-1,1)
accel = 0, -0.075
scale = ifelse(!time%2,0.25,0.125), ifelse(!time%2,0.25,0.125)
pauseMoveTime = 65535
superMoveTime = 65535
ownpal = 1


[State Corner Push]
type = varset
trigger1 = anim = 4300 && animelemtime(1) = 3
fvar(5) = 0

[State 4300, NHB]
type = nothitby
trigger1 = anim = 4300
trigger2 = anim = 4301 && animelemtime(2) < 1
time = 1
value = SCA

[State 4300, Anim]
type = changeanim
trigger1 = anim = 4300 && time >= 127
value = 4301

[State 0, Explod]
type = Explod
trigger1 = anim = 4301 && animelem = 2
anim = 6028
ID = 6028
pos = 60, 0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.25,0.1875
sprpriority = 5

[State 4300, gadouken]
type = helper
trigger1 = anim = 4301 && animelem = 2
helpertype = normal
stateno = 4305
ID = 4305
name = "Haoh Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 0.25
size.yscale = 0.25
ownpal = 1

[State -2, boo!]
type = playsnd
triggerall = var(11) = 2
trigger1 = anim = 4301 && animelem = 2
value = 6, 0
channel = 5
ignorehitpause = 1


[State 4101, flashes]
type = explod
triggerall = var(11) = 2
trigger1 = anim = 4301 && animelemtime(2) = [0,61]
anim = 4110
ID = 4105
sprpriority = -5
postype = left
pos = 160, 120
facing = -1 + (random < 500) * 2
random = 320, 240
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
ownpal = 1
pausemovetime = 20
supermovetime = 20
[State 4101, flashsnd]
type = playsnd
triggerall = var(11) = 2
trigger1 = anim = 4301 && animelemtime(2) = [0,61]
trigger1 = !(gametime % 6)
value = 6, 2 + (random % 3)
[State 4101, flashpalfx]
type = allpalfx
triggerall = var(11) = 2
trigger1 = anim = 4301 && animelemtime(2) = [0,61]
trigger1 = !(gametime % 9)
time = 3
add = 128, 128, 128
sinadd = -128, -128, -128, 12


[State 4300, Snd]
type = varset
trigger1 = anim = 4301 && animelem = 2
var(33)= 0
;[State 1260, Dust]
;type = explod
;trigger1 = anim = 4301 && animelem = 2
;anim = 7106
;sprpriority = 2
;postype = p1
;pos = 25, 0
;random = 0, 0
;vel = 0, -0
;accel = 0, 0
;scale = 0.375, 0.1875
;pauseMoveTime = 65535
;superMoveTime = 65535
;ownpal = 1

[State 3010, EnvShake]
type = EnvShake
trigger1 = anim = 4301 && animelem = 2
time = 12
ampl = 6

;[State 4300, Snd]
;type = playsnd
;trigger1 = time = 100
;value = 5, 16
;volume = 255
;[State 4300, Snd]
;type = playsnd
;trigger1 = time = 100
;value = 5, 16
;volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = time = 24
value = 5, 16
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 4, 42
channel = 0
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 4, 58
volume = 255
[State 4300, Snd]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 5, 0

[State 0, VarSet]
type = velset
trigger1 = anim = 4301 && animelemtime(6)=0
y = -6

[State 0, VarSet]
type = velset
trigger1 = anim = 4301 && animelemtime(6)>=0
x = -3

[State 0, VarSet]
type = velset
trigger1 = anim = 4303 && animelemtime(1)=1
y = -7

[State 0, VarSet]
type = velset
trigger1 = anim = 4303 && animelemtime(1)>=1
x = -3

[State 0, VarSet]
type = veladd
trigger1 = anim = 4301 && animelemtime(6)>=0
trigger2 = anim = 4303
y = 0.5

[State 4300, End]
type = changeanim
trigger1 = anim = 4301 && animelemtime(6)>=10 && pos y >=0
value = 4303

[State 4300, End]
type = changeanim
trigger1 = anim = 4303 && animelemtime(2)>=4 && pos y >=0
value = 4302

[State 0, VarSet]
type = velset
trigger1 = anim = 4302
y = 0
[State 0, VarSet]
type = posset
trigger1 = anim = 4302
y = 0
[State 0, VarSet]
type = velmul
trigger1 = anim = 4302
x = 0.8
[State 0, PlaySnd]
type = PlaySnd
triggerall = animelemtime(1)=0
trigger1 = anim = 4302
trigger2 = anim = 4303
value = S0,40;+((anim=4302)*65)
channel = 2
ignorehitpause = 1
persistent = 1

[State 1260, ExFX]
type = explod
triggerall = animelemtime(1)=0
trigger1 = anim = 4302
trigger2 = anim = 4303
anim = 8102
sprpriority = -1
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

;[State 0, LifeAdd]
;type = LifeAdd
;triggerall = animelemtime(1)=0
;trigger1 = anim = 4303
;value = -15
;kill = 0

[State 3010, EnvShake]
type = EnvShake
triggerall = animelemtime(1)=0
trigger1 = anim = 4303
time = 4
ampl = 4

[State 0, AngleDraw]
type = AngleDraw
trigger1 = anim = 4301 && animelemtime(6)>=0
value = 32*animelemtime(6)
scale = 1,1
ignorehitpause = 1
persistent = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 4301 && animelemtime(6)=0
movetype = H        ;I,A,H
statetype = A

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 4302
statetype = L        ;I,A,H

[State 4300, End]
type = changestate
trigger1 = winko && numhelper(4305)=0
trigger1 = roundstate = 3
trigger1 = anim = 4302 && animelemtime(4)>=68
value = 4003
ctrl = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = winko && anim = 4302
trigger1 = animelemtime(4)>= 68
value = 4302
elem = 4
ignorehitpause = 1
persistent = 1

[State 4300, End]
type = changestate
trigger1 = anim = 4302 && !animtime
value = 0
ctrl = 1

;==< SHUN GOKU SATSU >=
; Shun Goku Satsu
[Statedef 4400]
type = S
physics = S
movetype = A
anim = 4400
ctrl = 0
velset = 0, 0
poweradd = (-3000 + ((prevstateno=3300)*1000)) * !var(33)
sprpriority = 1
facep2 = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
