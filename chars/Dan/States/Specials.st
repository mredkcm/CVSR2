; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< SPECIAL STATES >===
;====
	
;==< GADOU KEN >=
; Gadouken
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
trigger1 = animelemtime(4) = 0
value = floor(40 * const(size.xscale))

[State 1000, Gadouken]
type = helper
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 1
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(random>500,19,52)
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(4) = 1
value = 5, 14

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SHAKUNETSU GADOU KEN >=
; Shakunetsu Gadouken
[Statedef 1020]
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
var(10) = ifelse(command = "hcfz", 3, ifelse(command = "hcfy", 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1000, width]
type = width
trigger1 = animelemtime(4) = 0
value = floor(40 * const(size.xscale))

[State 1000, Gadouken]
type = helper
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Gadouken"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-126 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(random>500,19,52)
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(4) = 1
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KOURYUU KEN >=
; Koryuuken
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(prevstateno=1251133,3,ifelse(command = "dfz", 3, ifelse(command = "dfy", 2, 1)))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(prevstateno=1251133,3,ifelse(random < 500, 3, ifelse(random < 666, 2, 1)))

[State 1100, kouryukenvar]
type = varset
trigger1 = !time
var(40) = ifelse(random < 66, 1, 0)
[State 1100, nothitby]
type = nothitby
trigger1 = anim = 1100 && animelemtime(3) < 0 && var(40) = 1
value = SCA
time = 1
ignorehitpause = 1
[State 1100, blink]
type = palfx
trigger1 = anim = 1100 && animelemtime(3) < -1 && var(40) = 1
add = 255, 255, 255
time = 1
ignorehitpause = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 3
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))
[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 3
value = 0, 41
[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 4, ifelse(random>500,8,53)
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 1100
attr = S, SA
damage = ifelse(var(1)>1,ifelse(var(20), 50 + var(10) * 7, 80 + var(10) * 7),ifelse(var(20), 60 + var(10) * 7, 90 + var(10) * 7)), 13
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 22
ground.hittime = 22	
ground.velocity = -1.5 -(var(10) / 2), -6.5 -var(10)
air.type = Low
air.velocity = -1.5 -(var(10) / 2), -6.5 -var(10)
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
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -68

[State 1100, hit2]
type = hitdef
trigger1 = animelem = 3 && anim = 1100 && (!movecontact && !movereversed || var(1)>1)
attr = A, SA
damage = ifelse(var(1)>1,20,14), 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -82
hitsound = s2, 3
p2facing = 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -1.5 -(var(10) / 2), -6 -var(10)
air.type = Low
air.velocity = -1.5 -(var(10) / 2), -6 -var(10)
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

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(3) >= 0
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(3) > 0 && vel y > -3
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim != 1100
movetype = I


;==< DANRETSU KEN >=
; Danretsuken
[Statedef 1130]
type = S
physics = S
movetype = A
anim = 1130
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcbz", 3, ifelse(command = "qcby", 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 3, 1))
[State 1300, Anim]
type = changeanim
trigger1 = !time
value = 1129 + var(10)



;==< COUNTER >=
; Zero-Counter Taunt
[Statedef 1160]
type = S
physics = S
movetype = A
anim = 1160
ctrl = 0
velset = 0, 0
poweradd = 0
sprpriority = 1
facep2 = 1

[State 1160, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1160, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, ifelse(random < 500, 1, 11)
channel = 0
[State 1160, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1160, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
damage = 60, 0
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -78
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -6.2
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -6.2
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-12.74
guard.velocity = -10.52
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.ampl = 2
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1160, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< DANKUU KYAKU >=
; Dankuu Kyaku
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(prevstateno=1251133,3,ifelse(command = "qcbc", 3, ifelse(command = "qcbb", 2, 1)))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(prevstateno=1251133,3,ifelse(random < 500, 3, ifelse(random < 666, 2, 1)))
[State 1200, Anim]
type = changeanim
trigger1 = !time
value = 1199 + var(10)

[State 1200, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3))
y = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -5, -6))
[State 1200, statetype]
type = statetypeset
triggerall = animelemtime(2) >= 0
trigger1 = anim = 1200 && animelemtime(5) < 0
trigger2 = anim = 1201 && animelemtime(9) < 0
trigger3 = anim = 1202 && animelemtime(13) < 0
statetype = A
physics = N
[State 1200, Accel]
type = veladd
triggerall = animelemtime(3) >= 0
trigger1 = anim = 1200 && animelemtime(5) < 0
trigger2 = anim = 1201 && animelemtime(9) < 0
trigger3 = anim = 1202 && animelemtime(13) < 0
y = ifelse(var(10) = 3, 0.2, ifelse(var(10) = 2, 0.3, 0.4))
[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(5) >= 0
trigger2 = anim = 1201 && animelemtime(9) >= 0
trigger3 = anim = 1202 && animelemtime(13) >= 0
statetype = A
physics = A

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40
[State 1200, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Snd]
type = playsnd
triggerall = anim = 1200
trigger1 = animelem = 3
value = 4, 51
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim != 1200
trigger1 = animelem = 3
value = 4, 49
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim != 1200
trigger1 = animelem = 7
value = 4, 50
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = 1200
trigger1 = animelem = 3
value = 4, 51
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim != 1200
trigger1 = animelem = 3
value = 4, 49
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim != 1200
trigger1 = animelem = 7
value = 4, 50
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 11
value = 3, 2
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, ifelse((anim = 1200), 6, 5)
channel = 1
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, ifelse((anim = 1201), 6, 5)
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 10
value = 1, 6
channel = 1

[State 1200, Hit]
type = hitdef
trigger1 = (anim = [1201, 1202]) && animelem = 4
trigger2 = anim = 1202 && animelem = 7
attr = A, SA
damage = ifelse(anim = 1201, 63, 42), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 4), -65, -49)
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -10, 0
air.type = Low
air.velocity = -4, -4
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type = hitdef
trigger1 = anim = 1200 && animelem = 4
trigger2 = anim = 1201 && animelem = 7
trigger3 = anim = 1202 && animelem = 11
attr = A, SA
damage = ifelse(anim = 1200, 104, ifelse(anim = 1201, 48, 35)), 8
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 4), -65, ifelse((animelem = 7), -49, -54))
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -5, -5
air.type = Low
air.velocity = -5, -5
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

[State 1200, End]
type = changestate
trigger1 = animelemtime(3) > 0 && vel y > 0 && pos y >= 0
value = 52

[State Idle]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(5) >= 0
trigger2 = anim = 1201 && animelemtime(8) >= 0
trigger3 = anim = 1202 && animelemtime(12) >= 0
movetype = I


;==< KUUCHUU DANKUU KYAKU >=
; Kuuchuu Dankuu Kyaku
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
poweradd = 72 * !var(20)
sprpriority = 1
juggle = 8

[State 1250, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcbc", 3, ifelse(command = "qcbb", 2, 1))
[State 1250, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
[State 1250, Anim]
type = changeanim
trigger1 = !time
value = 1199 + var(10)
elem = 2
	
[State 1250, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 0, 6, ifelse(vel x < 0, -4.5, 3))
y = -3.5
[State 1250, Accel]
type = veladd
trigger1 = anim != 41
y = ifelse(var(10) = 3, 0.167, ifelse(var(10) = 2, 0.417, 0.71))

[State 1200, Snd]
type = playsnd
triggerall = anim = 1200
trigger1 = animelem = 3
value = 4, 51
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 3
value = 4, 49
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 7
value = 4, 50
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = 1200
trigger1 = animelem = 3
value = 4, 51
channel = 7
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 3
value = 4, 49
channel = 7
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 7
value = 4, 50
channel = 7
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 11
value = 4, 51
channel = 0
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1201,1202]
trigger1 = animelem = 11
value = 4, 51
channel = 7
ignorehitpause = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1200,1202]
trigger1 = animelem = 3
value = 1, ifelse((anim = 1200), 6, 5)
channel = 1
[State 1200, Snd]
type = playsnd
triggerall = anim = [1200,1202]
trigger1 = animelem = 6
value = 1, ifelse((anim = 1201), 6, 5)
[State 1200, Snd]
type = playsnd
triggerall = anim = [1200,1202]
trigger1 = animelem = 10
value = 1, 6
channel = 1

[State 1250, Hit]
type = hitdef
trigger1 = (anim = [1201, 1202]) && animelem = 4
trigger2 = anim = 1202 && animelem = 7
attr = A, SA
damage = ifelse(anim = 1201, 63, 42), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), ifelse((animelem = 4), var(46) := -65, var(46) := -49)
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -10, 0
air.type = Low
air.velocity = -4, -4.5
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, Hit]
type = hitdef
trigger1 = anim = 1200 && animelem = 4
trigger2 = anim = 1201 && animelem = 7
trigger3 = anim = 1202 && animelem = 11
attr = A, SA
damage = ifelse(anim = 1200, 104, ifelse(anim = 1201, 48, 35)), 8
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := ifelse((animelem = 4), -65, ifelse((animelem = 7), -49, -54))
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -5, -8
air.type = Low
air.velocity = -5, -8
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

[State 1250, End]
type = changeanim
trigger1 = anim = 1200 && animelemtime(5) >= 5
trigger2 = anim = 1201 && animelemtime(9) >= 5
trigger3 = anim = 1202 && animelemtime(13) >= 5
value = 41
elem = 6
[State 1250, statetype]
type = statetypeset
trigger1 = anim = 41
physics = A
[State 1250, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 52

[State Idle]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(5) >= 0
trigger2 = anim = 1201 && animelemtime(8) >= 0
trigger3 = anim = 1202 && animelemtime(12) >= 0
trigger4 = anim = 41
movetype = I


;==< PREMIUM SIGN >=
; Premium Sign
[Statedef 1300]
type = S
physics = S
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfc", 3, ifelse(command = "qcfb", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 1, ifelse(random < 500, 2, 3))
[State 1300, Anim]
type = changeanim
trigger1 = !time
value = 1299 + var(10)

[State 1300, width]
type = width
trigger1 = anim = 1300 && animelemtime(11) = -1
trigger2 = anim = 1301 && animelemtime(17) = -1
trigger3 = anim = 1302 && animelemtime(25) = -1	
value = floor(40 * const(size.xscale))

[State 1300, Hit]
type = hitdef
trigger1 = !time
attr = S, HA
damage = 40, 15
animtype = Medium
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 1, ifelse(var(20), 5, 10)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -85
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 14
ground.hittime = 14
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -3
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.ampl = 2
yaccel = 0.5
forcestand = 1


[State 1300, Aura]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1315
ID = 1315
name = "Projectile-Nulifying Aura"
postype = p1
pos = 0,0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(1315)
value = , AP
time = 1
ignorehitpause = 1
persistent = 1

[State 1300, autograph]
type = helper
trigger1 = anim = 1300 && animelem = 11
trigger2 = anim = 1301 && animelem = 17
trigger3 = anim = 1302 && animelem = 25
helpertype = normal
stateno = 1305
ID = 1305
name = "Autograph"
postype = p1
pos = floor(120 * const(size.xscale)), floor(-132 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 1300, Snd]
type = playsnd
trigger1 = (anim = [1300, 1302]) && animelem = 3
value = 5, 12
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 6
trigger2 = anim = 1301 && animelem = 12
trigger3 = anim = 1302 && animelem = 20
value = 4, 30
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 11
trigger2 = anim = 1301 && animelem = 17
trigger3 = anim = 1302 && animelem = 25
value = 4, 31
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 11
trigger2 = anim = 1301 && animelem = 17
trigger3 = anim = 1302 && animelem = 25
value = 1, 2
channel = 1

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< GADOU SHOUKOU KEN >=
; Gadou Shoukouken
[Statedef 1400]
type = S
physics = S
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "fhcfz", 3, ifelse(command = "fhcfy", 2, 1))
[State 1400, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 1, ifelse(random < 500, 2, 3))
[State 1400, Anim]
type = changeanim
trigger1 = !time
value = 1399 + var(10)

[State 1400, GadouShoukouKen]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1405
ID = 1405
name = "Gadou Shoukou Ken"
postype = p1
pos = floor(140 * const(size.xscale)), floor(-130 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 6
anim = 6028
ID = 6028
pos = 70,0
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.1875,0.125
sprpriority = 3

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 25
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 26
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SAIKYOU -RYUU BOUGYO >=
;--- STANDING ---
[Statedef 1500]
type = S
physics = S
movetype = I
anim = 1500
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 1500, Strength]
type = varset
trigger1 = var(10) != 2
var(10) = 2
[State 1500, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
time = 1
value = SCA
[State 1500, Snd]
type = playsnd
trigger1 = !time
value = 3, 5
channel = 0
[State 1500, pusher]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1505
ID = 1505
name = "Pusher"
postype = p1
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
ownpal = 1
[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 1501]
type = C
physics = C
movetype = I
anim = 1501
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 1500, Strength]
type = varset
trigger1 = var(10) != 2
var(10) = 2
[State 1501, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
time = 1
value = SCA
[State 1501, Snd]
type = playsnd
trigger1 = !time
value = 3, 5
channel = 0
[State 1501, pusher]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1505
ID = 1505
name = "Pusher"
postype = p1
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
ownpal = 1
[State 1501, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;--- AERIAL ---
[Statedef 1502]
type = A
physics = A
movetype = I
anim = 1502
ctrl = 0
sprpriority = 1
[State 1500, Strength]
type = varset
trigger1 = var(10) != 2
var(10) = 2
[State 1502, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
time = 1
value = SCA
[State 1502, Stop]
type = posfreeze
trigger1 = animelemtime(3) < 0
value = 1
[State 1502, Snd]
type = playsnd
trigger1 = !time
value = 3, 5
channel = 0
[State 1502, pusher]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1505
ID = 1505
name = "Pusher"
postype = p1
pos = 0, floor(-158 * const(size.yscale))
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
ownpal = 1


;==< KYUUKYOKU TENCHI GADOU ZUKI >=
; Kyuuk. Ten. Gadou Zuki
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0	
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1600, Strength]
type = varset
trigger1 = !time
var(10) = ifelse((!AIlevel && (command = "holdstart" && ceil(random<200) || ceil(random<100))) || (AIlevel && (ceil(random<333) || life<=100)),4,3)
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1600 + (var(10)=4)*10

[State 1600, Reversal]
type = reversaldef
triggerall = var(10) = 3
trigger1 = animelem = 2
reversal.attr = SA, AA
pausetime = 0, 12
hitsound = s2, 0
sparkNo = -1 + 0*(var(43) := 8001)
sparkXY = -10 + 0 * (var(45) := 30), var(46) := -60
numhits = 0
[State 1600, Reversal]
type = reversaldef
triggerall = var(10) = 4
trigger1 = animelemtime(3) < 0
reversal.attr = SA, AA
pausetime = 0, 12
hitsound = s2, 0
sparkNo = -1 + 0*(var(43) := 8001)
sparkXY = -10 + 0 * (var(45) := 30), var(46) := -60
numhits = 0
persistent = 1
[State 0, NotHitBy]
type = NotHitBy
trigger1 = AIlevel && var(10)=4
trigger1 = animelemtime(2)>=0 && animelemtime(3)<0
value = , AT, AP
time = 1
[State 0, NotHitBy]
type = NotHitBy
trigger1 = AIlevel && var(10)=4 && movehit
trigger1 = animelemtime(3)>=0 && animelemtime(5)<1
trigger2 = AIlevel && var(10)=4
trigger2 = animelemtime(2) < 0
value = SCA
time = 1

[State 1600, dist]
type = attackdist
trigger1 = animelemtime(3) < 0
value = 0
[State 1600, Reset]
type = movehitreset
trigger1 = animelem = 3 && (!AIlevel || var(1)=3)
[State 1600, dist]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 2

[State 1600, Vel]
type = velset
trigger1 = animelem = 3
x = 12
[State 1600, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 34
channel = 0
[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, ifelse(var(10)=4,38,35)
channel = 0

[State 1600, FX]
type = explod
trigger1 = animelem = 2
anim = 8521;ifelse(var(10)=4,8521,8501)
ID = 1605
sprpriority = 5
postype = p1
pos = ceil(-31 * const(size.xscale)), ceil(-121 * const(size.xscale))
facing = 1
vfacing = 1
ownpal = 1
removetime = 20
removeongethit = 1
[State 1600, FX]
type = explod
trigger1 = animelem = 2
anim = 7621;ifelse(var(10)=4,8521,8501)
ID = 1606
sprpriority = 5
postype = p1
pos = ceil(-31 * const(size.xscale)), ceil(-121 * const(size.xscale))
facing = -1
vfacing = -1
removetime = 20
ownpal = 1
removeongethit = 1

[State 1600, FX]
type = modifyexplod
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
ID = 1605
scale = 0.5 -(0.025 * animelemtime(2)), 0.5 -(0.025 * animelemtime(2))
trans = addalpha
alpha = 256, 256
[State 1600, FX]
type = modifyexplod
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
ID = 1606
scale = 0.25 -(0.0125 * animelemtime(2)), 0.25 -(0.0125 * animelemtime(2))
trans = addalpha
alpha = 256, 256

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 6
[State 1600, Dust]
type = explod
trigger1 = animelem = 4
anim = 1604
sprpriority = 3
postype = p1
pos = ceil(50 * const(size.xscale))
ownpal = 1
scale = 0.5, 0.5
[State 1600, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
freq = 120
ampl = 6
[State 1600, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 1600, Hit]
type = hitdef
trigger1 = var(10) != 4
trigger1 = animelem = 5
attr = S, SA
damage = 145, 18
animtype = Diagup
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(10)=4,ifelse(AIlevel,12,50),ifelse(var(20), 12, 24)), ifelse(var(20), 12, 24)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -68
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = -8, -ifelse(var(10)=4,10,4)
air.type = Low
air.velocity = -8, -ifelse(var(10)=4,10,4)
ID = ifelse(var(10)=4,1611,1612)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 1600, Hit]
type = hitdef
trigger1 = var(10) = 4
trigger1 = animelem = 5
attr = S, HA
damage = 160, 18
animtype = Diagup
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(10)=4,ifelse(AIlevel,12,50),ifelse(var(20), 12, 24)), ifelse(var(20), 12, 24)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := 60), var(46) := -68
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = -8, -ifelse(var(10)=4,10,4)
air.type = Low
air.velocity = -8, -ifelse(var(10)=4,10,4)
ID = ifelse(var(10)=4,1611,1612)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 1600, Snd]
type = playsnd
trigger1 = movehit = 1 && numtarget(1611)
value = 5, 4
ignorehitpause = 1
persistent = 0

[State 1600, Snd]
type = playsnd
trigger1 = movehit = 1 && numtarget(1611)
value = 5, 4
ignorehitpause = 1
persistent = 0

[State 1600, Snd]
type = playsnd
trigger1 = movehit = 1 && numtarget(1611)
value = 5, 18
ignorehitpause = 1
persistent = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 1600, End]
type = changestate
trigger1 = movehit = 1 && numtarget && (!AIlevel  || AIlevel && var(10) !=4)
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
value = 1601
[State 1600, End]
type = changestate
trigger1 = !animtime
value = ifelse(AIlevel && var(10)=4 && p2dist x >= 120,400,0)
ctrl = ifelse(AIlevel && var(10)=4 && p2dist x >= 120,0,1)


;--- HURT ---
[Statedef 1601]
type = S
physics = S
movetype = I
anim = 1601
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
[State 1601, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5000, 5
channel = 0
[State 1601, Snd]
type = playsnd
trigger1 = animelem = 11
value = 4, 11
channel = 0
[State 1601, Snd]
type = playsnd
trigger1 = !time
value = 5, 13
[State 1601, Anim]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< ROLLING ATTACK >=
; Rolling Attack
[Statedef 1700]
type = S
physics = S
movetype = A
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
juggle = 8

[State 1700, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "dfc", 3, ifelse(command = "dfb", 2, 1))
[State 1700, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2dist x > 160, 3, ifelse(p2dist x > 120, 2, 1))

[State 0, NotHitBy]
type = NotHitBy
trigger1 = !movecontact
value = ,NP,SP
time = 1

[State 1700, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 40
persistent = 0
[State 1700, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1700, Vel]
type = velset
trigger1 = anim = 40 && !animtime
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4, 2))
y = -9
[State 1700, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1700
[State 1700, Type]
type = statetypeset
trigger1 = anim = 1700
statetype = A
physics = A

[State 1700, Snd]
type = playsnd
trigger1 = anim = 1700 && animelem = 2
value = 3, 3
channel = 0

[State 1700, posfix]
type = posadd
trigger1 = anim = 1700 && animelem = 4
y = floor(-90 * const(size.yscale))
persistent = 0

[State 1700, hitstomp]
type = hitdef
trigger1 = anim = 1700 && vel y > 0
trigger1 = !movecontact && !movereversed
attr = A, SA
damage = 80, 10
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 1, 2), ifelse(var(20), 6, 12)
sparkNo = -1 + 0 * (var(43) := 8013)
guard.sparkNo = -1 + 0*(var(44) := 8001)
sparkXY = -10 + 0 * (var(45) := -10), var(46) := 0
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.hittime = 16
ground.slidetime = 16
ground.velocity = 0, 0
air.hittime = 8
air.type = Low
air.velocity = 0, -1
air.cornerpush.veloff = 0
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1200
nochainID = 1200
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1700, Snd]
type = playsnd
trigger1 = movehit = 1
;value = 3, (random % 6)
value = 4, ifelse(random < 200, 1, ifelse(random < 250, 3, ifelse(random < 333, 11, ifelse(random < 500, 13, 14))))
channel = 0
ignorehitpause = 1
persistent = 0

[State 1700, Vel]
type = velset
trigger1 = movecontact = 1 || movereversed = 1
x = ifelse((AIlevel && random<400) || (!AIlevel && command = "holdback"), -4, 4)
y = -6
ignorehitpause = 1
[State 1700, taunt]
type = changestate
trigger1 = !AIlevel
trigger1 = movehit && vel y >= -2
trigger1 = command = "start"
trigger2 = AIlevel
trigger2 = movehit = 10 && (random<400 || winko)
value = 402

[State 1700, End]
type = changestate
trigger1 = anim = 1700 && vel y > 0 && (pos y >= -90 * const(size.yscale))
value = 52


;==< SAIKYO TENJINSAI >=
; Sakikyo Tenjinsai
[Statedef 1800]
type = S
physics = S
movetype = A
anim = 1800
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "hcfc", 3, ifelse(command = "hcfb", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 3))
[State 1300, Anim]
type = changeanim
trigger1 = !time
value = 1799 + var(10)


;==< DANSHURA SENKUU >=
; Danshura Senkuu
[Statedef 1900]
type = S
physics = N
movetype = I
anim = 1900
velset = 0, 0
ctrl = 0
poweradd = 72 * !var(20) * (AIlevel!=0)
sprpriority = -1
facep2 = 1

[State 1900, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

[State 1900, afterimage]
type = changeanim
trigger1 = !time
value = 1900
elem = ifelse(prevstateno = 1600,5,1)

[State 1900, afterimage]
type = afterimage
trigger1 = anim = 1900
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

[State 1900, Vel]
type = velset
trigger1 = anim = 1900
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)
[State 1900, Vel]
type = velset
trigger1 = anim = 1900
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 9.5, ifelse(var(10) = 2, 7, ifelse(var(10) = -3, -9.5, -7)))
;x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))
[State 1900, Vel]
type = velmul
trigger1 = anim = 1900
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1900, Snd]
type = playsnd
trigger1 = anim = 1900
trigger1 = animelem = 2
value = 3, 5
channel = 0
[State 1900, Snd]
type = playsnd
trigger1 = anim = 1900
trigger1 = animelem = 6
value = 5, 20
persistent = 0
;
;[State 1020, Aura]
;type = helper
;trigger1 = anim = 1900
;trigger1 = animelem = 3
;helpertype = normal
;stateno = 6005
;ID = 6005
;postype = p1
;ownpal = 1
;persistent = 0
;;size.xscale = 1
;;size.yscale = .95

[State 1900, Push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0
[State 1900, nothitby]
type = nothitby
triggerall = anim = 1900 && var(1) = 2
triggerall = animelemtime(6) <= ifelse((var(10) = 3 || var(10) = -3), 35, 20)
trigger1 = animelemtime(6) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
trigger3 = vel x > 0 && frontedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1900, nothitby]
type = nothitby
trigger1 = var(1)=3
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1900, Turn]
type = turn
trigger1 = anim = 1900
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1900, End]
type = changeanim
triggerall = anim = 1900
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 1905

[State 0, ChangeState]
type = ChangeState
trigger1 = 1905 && !animtime
value = 0
ctrl = 1
