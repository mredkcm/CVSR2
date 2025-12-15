; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================< SPECIAL STATES >=======================================
;============================================================================================

;======================< HADOU KEN >=============================
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

[State 1000, hadouvar]
type = varset
trigger1 = animelemtime(4) < 0
var(32) = 1
[State 1000, hadouvar]
type = varadd
trigger1 = animelemtime(2) >= 0 && animelemtime(10) < 0 && var(32) < 3
trigger1 = (var(10) = 1 && command = "x") || (var(10) = 2 && command = "y") || (var(10) = 3 && command = "z")
var(32) = 1

[State 1000, hadouvar]
type = varset
trigger1 = var(1) = 2
var(32) = 3
[State 1000, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
value = 1000
elem = 10

[State 1000, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0 && var(32) = 2
value = 1000
elem = 4
[State 1000, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) = 3
value = 1000
elem = 7
[State 1000, Anim]
type = changeanim
triggerall = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) != 2
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0 && var(32) != 3
trigger3 = AIlevel && animelemtime(2) >= 0 && animelemtime(10) < 0 && p2movetype = A
value = 1000
elem = 10

[State 1000, width]
type = width
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger2 = animelemtime(18) >= 0 && animelemtime(19) < 0
value = 13
[State 1000, width]
type = width
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
value = 26

[State 1000, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0 && !numhelper(1002)
helpertype = normal
stateno = 1002
ID = 1002
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1000, Hadouken]
type = helper
trigger1 = animelemtime(11) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 86, -55
size.xscale = 0.5
size.yscale = ifelse(var(32) = 3, 1, ifelse(var(32) = 2, 0.75, 0.4))
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 10
value = 4, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(11) = 1
value = 5, 6

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< TENGYOU HADOU KEN >=============================
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
var(10) = ifelse(command = "qcbz", 3, ifelse(command = "qcby", 2, 1))
[State 1020, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1020, hadouvar]
type = varset
trigger1 = animelemtime(4) < 0
var(32) = 1
[State 1020, hadouvar]
type = varadd
trigger1 = animelemtime(2) >= 0 && animelemtime(10) < 0 && var(32) < 3
trigger1 = (var(10) = 1 && command = "x") || (var(10) = 2 && command = "y") || (var(10) = 3 && command = "z")
var(32) = 1

[State 1020, hadouvar]
type = varset
trigger1 = var(1) = 2
var(32) = 3
[State 1020, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
value = 1020
elem = 10

[State 1000, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0 && var(32) = 2
value = 1020
elem = 4
[State 1020, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) = 3
value = 1020
elem = 7
[State 1020, Anim]
type = changeanim
triggerall = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) != 2
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0 && var(32) != 3
trigger3 = AIlevel && animelemtime(2) >= 0 && animelemtime(10) < 0 && p2movetype = A
value = 1020
elem = 10

[State 1020, width]
type = width
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger2 = animelemtime(18) >= 0 && animelemtime(19) < 0
value = 9
[State 1020, width]
type = width
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
value = 18

[State 1020, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0 && !numhelper(1024)
helpertype = normal
stateno = 1024
ID = 1024
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelemtime(11) = 1
helpertype = normal
stateno = 1005
ID = 1025
name = "Hadouken"
postype = p1
pos = 58, -105
size.xscale = 0.5
size.yscale = ifelse(var(32) = 3, 1, ifelse(var(32) = 2, 0.75, 0.4))
ownpal = 1

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 10
value = 4, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelemtime(11) = 1
value = 5, 6

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHOUOU KEN >=============================
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = 1099 + var(10)

[State 1100, Vel]
type = velset
trigger1 = (anim = [1100, 1102]) && animelem = 2
x = ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 6, 4))

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1101]) && animelem = 6
trigger2 = anim = 1102 && animelem = 8
value = 0, 40
[State 1100, Dust]
type = helper
trigger1 = (anim = [1100, 1101]) && animelem = 6
trigger2 = anim = 1102 && animelem = 8
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Vel]
type = velset
trigger1 = (anim = [1100, 1101]) && animelem = 6
trigger2 = anim = 1102 && animelem = 8
x = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2))
y = ifelse(var(10) = 3, -8, ifelse(var(10) = 2, -7, -6))
[State 1100, Vel]
type = velmul
trigger1 = (anim = [1100, 1101]) && animelemtime(6) > 0
trigger2 = anim = 1102 && animelemtime(8) > 0
x = 0.95

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 2
value = 4, 14
channel = 0
ignorehitpause = 1
persistent = 0

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 0
value = SCA
time = 1

[State 1100, hitlow]
type = hitdef
trigger1 = animelem = 4 && (anim = 1101 || anim = 1102)
trigger2 = animelem = 6 && anim = 1102
attr = S, SA
damage = ifelse(anim = 1101, 65, 39), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 6), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
fall.recover = 1
fall.recovertime = 120
air.fall = 1
yaccel = 0.5
forcestand = 1

[State 1100, hithigh]
type = hitdef
trigger1 = (animelem = 5 && anim = 1101) || (animelem = 7 && anim = 1102)
trigger2 = animelem = 5 && anim = 1102
attr = S, SA
damage = ifelse(anim = 1101, 65, 39), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 7), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
fall.recover = 1
fall.recovertime = 120
air.fall = 1
yaccel = 0.5
forcestand = 1

[State 1100, hitlowfinal]
type = hitdef
trigger1 = animelem = 5 && anim = 1100
attr = S, SA
damage = 118, 9
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -72
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
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

[State 1100, hitmidair]
type = hitdef
trigger1 = (animelem = 6 && anim = 1100) && !movecontact && !movereversed
trigger2 = (animelem = 6 && anim = 1101) || (animelem = 8 && anim = 1102)
attr = S, SA
damage = 14, 7
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
air.type = High
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
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

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(6) >= 0
trigger2 = anim = 1101 && animelemtime(6) >= 0
trigger3 = anim = 1102 && animelemtime(8) >= 0
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(6) > 0 && vel y > -2
trigger2 = anim = 1101 && animelemtime(6) > 0 && vel y > -3
trigger3 = anim = 1102 && animelemtime(8) > 0 && vel y > -4
value = 1103

[State Idle]
type = statetypeset
trigger1 = anim = 1103
movetype = I


;======================< DARK SHOUOU KEN >=============================
[Statedef 1150]
type = S
physics = N
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = ifelse((p2movetype = H && p2statetype = A), 7, 9)
facep2 = 1
sprpriority = 1

[State 1150, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))
[State 1150, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1150, Vel]
type = velset
trigger1 = anim = 1110 && animelem = 2
x = 1.25 * const(velocity.run.fwd.x)
[State 1150, steps]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 3 || animelem = 6
value = 0, 100

[State 1150, Snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 4, 14
channel = 0
ignorehitpause = 1
persistent = 0

[State 1150, hitrunning]
type = hitdef
trigger1 = animelem = 2 && anim = 1110
attr = S, SA
damage = 25, 4
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -55
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
forcestand = 1

[State 1150, Anim]
type = changeanim
triggerall = anim = 1110 && animelemtime(2) >= 0
trigger1 = time >= ifelse(var(10) = 3, 32, ifelse(var(10) = 2, 20, 8))
trigger2 = movecontact || movereversed
value = 1151

[State 1150, Snd]
type = playsnd
trigger1 = anim = 1151 && animelem = 6
value = 0, 40
[State 1150, Dust]
type = helper
trigger1 = anim = 1151 && animelem = 6
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1150, Vel]
type = velset
trigger1 = anim = 1151 && animelem = 6
x = 4
y = -9
[State 1150, Vel]
type = velmul
trigger1 = anim = 1151 && animelemtime(6) > 0
x = 0.95

[State 1150, hitlow]
type = hitdef
trigger1 = anim = 1151 && (animelem = 2 || animelem = 4)
attr = S, SA
damage = 25, 4
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 4), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1150, hithigh]
type = hitdef
trigger1 = anim = 1151 && (animelem = 3 || animelem = 5)
attr = S, SA
damage = 25, 4
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 5), -61, -30)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1150, hitmidair]
type = hitdef
trigger1 = anim = 1151 && (animelem = 6 || animelem = 7)
attr = S, SA
damage = 25, 4
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -92
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -8
air.type = High
air.velocity = -4, -8
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
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

[State 1150, statetype]
type = statetypeset
trigger1 = anim = 1151 && animelemtime(6) < 0
statetype = S
physics = S
[State 1150, statetype]
type = statetypeset
trigger1 = anim = 1151 && animelemtime(6) >= 0
statetype = A
physics = A

[State 1150, Anim]
type = changeanim
trigger1 = anim = 1151 && animelemtime(7) > 0 && vel y > -4
value = 1153

[State Idle]
type = statetypeset
trigger1 = anim = 1153
movetype = I


;======================< SHUNPUU KYAKU >=============================
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1200, shunpuuvar]
type = varset
triggerall = (anim = [1201, 1203]) && var(1) = 1
trigger1 = !AIlevel && (command = "qcba" || command = "qcbb" || command = "qcbc")
trigger2 = AIlevel && random < 100
var(30) = 1
ignorehitpause = 1
[State 1200, shunpuuvar]
type = varset
triggerall = (anim = [1201, 1203]) && var(1) = 1
trigger1 = !AIlevel && command = "qcb2k"
trigger2 = AIlevel && random < 50
var(30) = 2
ignorehitpause = 1
[State 1200, shunpuuvar]
type = varset
trigger1 = (anim != [1201, 1203])
trigger2 = AIlevel && (p2dist x < 0 || p2dist y <= -120)
var(30) = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 5
value = 4, 15
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && !animtime
value = 0, 40
persistent = 0
[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = ifelse((var(10) = [1, 3]), 1200 + var(10), 1203)
[State 1200, Vel]
type = velset
trigger1 = (anim = [1201, 1203]) && animelem = 1
x = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3.5, 3))
y = ifelse(var(10) = 3, -8, ifelse(var(10) = 2, -6, -4))

[State 1200, statetype]
type = statetypeset
trigger1 = (anim = [1201, 1203])
statetype = A
physics = N
[State 1200, Accel]
type = veladd
trigger1 = (anim = [1201, 1203])
y = 0.6

[State 1200, spin]
type = playsnd
trigger1 = (anim = [1201, 1203])
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
value = 1, 5
channel = 1

[State 1200, Hit]
type = hitdef
trigger1 = (anim = [1201, 1203]) && (animelem = 3 || animelem = 7 || animelem = 11) && (hitcount < var(10))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(var(1) = 2, -3.5, -7), ifelse(var(1) = 2, -5, 0)
air.type = Low
air.velocity = ifelse(var(1) = 2, -3.5, -5), ifelse(var(1) = 2, -5, -5)
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = (var(1) = 2)
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1200
nochainID = 1201
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type = hitdef
trigger1 = (anim = [1201, 1203]) && (animelem = 5 || animelem = 9) && (hitcount < var(10))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -44
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(1) = 2, 3.5, 7), ifelse(var(1) = 2, -5, 0)
air.type = Low
air.velocity = ifelse(var(1) = 2, 3.5, 5), ifelse(var(1) = 2, -5, -5)
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = (var(1) = 2)
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1201
nochainID = 1200
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, End]
type = changestate
trigger1 = (anim = [1201, 1203]) && vel y > 0 && pos y >= 0 && var(30)
value = ifelse((var(30) = 2 && power >= 500 && !var(20)), 1230, 1220)
[State 1200, End]
type = changeanim
trigger1 = (anim = [1201, 1203]) && vel y > 0 && pos y >= 0
value = ifelse(var(1) = 2, 1206, 1205)
[State 1200, Vel]
type = velset
trigger1 = anim = 1205 || anim = 1206
x = 0
y = 0
[State 1200, Pos]
type = posset
trigger1 = anim = 1205 || anim = 1206
y = 0
[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1205 || anim = 1206
statetype = S
physics = S
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1205 || anim = 1206
value = 0, 52
persistent = 0
[State 1200, Dust]
type = explod
trigger1 = anim = 1205 || anim = 1206
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = (anim = 1205 || anim = 1206)
movetype = I

[State 1200, End]
type = changestate
trigger1 = (anim = 1205 || anim = 1206) && !animtime
value = 0
ctrl = 1


;======================< SHUNPUU REN KYAKU >=============================
[Statedef 1220]
type = S
physics = S
movetype = A
anim = 1220
ctrl = 0
velset = 0, 0
poweradd = 0
juggle = 0
sprpriority = 1

[State 1220, Strength]
type = varset
trigger1 = var(10) != 3
var(10) = 3
[State 1220, shunpuuvar]
type = varset
trigger1 = var(30)
var(30) = 0
[State 1220, width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
value = 25, 0

[State 1220, Snd]
type = playsnd
trigger1 = time = 1
value = 0, 52
[State 1220, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 15, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 1220, Stop]
type = velset
trigger1 = 1
y = 0
[State 1220, Pos]
type = posset
trigger1 = 1
y = 0

[State 1220, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 6
channel = 0
[State 1220, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 1220, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
damage = 40, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -20, -57
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -3
air.type = Low
air.velocity = -6, -3
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 1210 && prevstateno != 1260), 36 * (!var(20) && prevstateno != 1210 && prevstateno != 1260)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 5
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< KUUCHUU SHUNPUU KYAKU >=============================
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1250, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1250, shunpuuvar]
type = varset
triggerall = animelemtime(3) >= 0 && var(1) = 1
trigger1 = !AIlevel && (command = "qcba" || command = "qcbb" || command = "qcbc")
trigger2 = AIlevel && random < 100
var(30) = 1
ignorehitpause = 1
[State 1250, shunpuuvar]
type = varset
triggerall = animelemtime(3) >= 0 && var(1) = 1
trigger1 = !AIlevel && command = "qcb2k" && !var(20)
trigger2 = AIlevel && random < 50
var(30) = 2
ignorehitpause = 1
[State 1260, shunpuuvar]
type = varset
trigger1 = animelemtime(11) >= 0 && var(30)
var(30) = -1
ignorehitpause = 1
[State 1250, shunpuuvar]
type = varset
trigger1 = animelemtime(3) < 0
trigger2 = AIlevel && (p2dist x < 0 || p2dist y <= -120)
var(30) = 0

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 5
channel = 0

[State 1250, Accel]
type = veladd
trigger1 = animelemtime(11) < 0
y = const(movement.yaccel) * 0.66
[State 1250, Accel]
type = gravity
trigger1 = animelemtime(11) >= 0

[State 1250, spin]
type = playsnd
trigger1 = animelem = 3 || animelem = 7
value = 1, 5
channel = 1

[State 1250, Hit]
type = hitdef
trigger1 = (animelem = 4 || animelem = 8) && !movecontact && !movereversed
attr = A, SA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -44
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

[State 1250, Hit]
type = hitdef
trigger1 = animelem = 6 && !movecontact && !movereversed
attr = A, SA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -44
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

[State 1250, posfix]
type = posadd
trigger1 = animelem = 11
x = 10
y = -5
[State 1250, statetype]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I

[State 1250, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = ifelse(var(30) = -1, 1252, ifelse(var(30) = 2, 1230, ifelse(var(30) = 1, 1220, 52)))


;--- TRIP ---
[Statedef 1252]
type = S
physics = S
movetype = I
anim = 1252
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1252, Pos]
type = posset
trigger1 = 1
y = 0

[State 1252, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
statetype = A
physics = S
[State 1252, statetype]
type = statetypeset
trigger1 = animelemtime(7) >= 0 && animelemtime(12) < 0
statetype = L
physics = C
[State 1252, statetype]
type = statetypeset
trigger1 = animelemtime(12) >= 0 && animelemtime(15) < 0
statetype = C
physics = C
[State 1252, statetype]
type = statetypeset
trigger1 = animelemtime(15) >= 0
statetype = S
physics = S

[State 1252, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0
[State 1252, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 3
[State 1252, Dust]
type = explod
trigger1 = animelem = 7
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -20, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1252, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SAKURA OTOSHI >=============================
[Statedef 1300]
type = U
physics = U
movetype = A
anim = 40
ctrl = 0
velset = vel x * (prevstateno = 1305), vel y * (prevstateno = 1305)
poweradd = 72 * !var(20)
facep2 = (prevstateno != [1300, 1399])
sprpriority = 1

[State 1300, Anim]
type = changeanim
trigger1 = !time && prevstateno = 1305
value = 1300
elem = 3

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfc"), 3, ifelse(command = "dfb", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))

[State 1300, otoshivar]
type = varset
trigger1 = !time && (prevstateno != [1300, 1305])
var(31) = 0

[State 1300, Vel]
type = velset
trigger1 = anim = 40 && !animtime
x = ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2.5, 2))
y = ifelse(var(10) = 3, -9, ifelse(var(10) = 2, -7, -5))
[State 1300, Snd]
type = playsnd
trigger1 = anim = 40 && !animtime
value = 0, 41
persistent = 0
[State 1300, Dust]
type = helper
trigger1 = anim = 40 && !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0
[State 1300, Anim]
type = changeanim
trigger1 = anim = 40 && !animtime
value = 1300

[State 1300, statetype]
type = statetypeset
trigger1 = anim = 1300
statetype = A
physics = N
[State 1300, Accel]
type = veladd
trigger1 = anim = 1300
y = 0.4

[State 1300, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 1
value = 4, 5
channel = 0

[State 1300, punch]
type = changestate
triggerall = anim = 1300 && animelemtime(3) > 0 && var(31) < 3
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && (p2bodydist x = [0, 75]) && (p2bodydist y = [ -75, 75]) && (p2statetype != L)
trigger3 = AIlevel && vel y >= 0 && (enemy, numproj)
value = 1305
[State 1300, cancel]
type = changestate
triggerall = anim = 1300 && animelemtime(3) > 0 && var(31) < 3
trigger1 = !AIlevel && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel && !var(31) && random < 50
value = 1302

[State 1300, End]
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
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
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
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
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
anim = 7102
ID = 7102
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


;======================< OUKA KYAKU >=============================
[Statedef 1400]
type = A
physics = A
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8

[State 1400, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcfc"), 3, ifelse(command = "qcfb", 2, 1))
[State 1400, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 1400, freeze]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0
[State 1400, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3))
y = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3))

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 3
attr = A, SA 
damage = 70, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 7, 14) 
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -16
hitsound = s2, 6 
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10, 0
air.type = Low
air.velocity = -4, 2
down.velocity = 0, 0
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


;======================< TAUNT >=============================
[Statedef 1470]
type = A
physics = A
movetype = A
anim = 1470
ctrl = 0
sprpriority = 1

[State 1470, Strength]
type = varset
trigger1 = var(10) != 1
var(10) = 1
[State 1470, Vel]
type = velset
trigger1 = animelemtime(5) < 0
x = 0
y = ifelse(pos y >= -20, 0, 0.5)

[State 1470, Shoe]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1475
ID = 1475
name = "Shoe"
postype = p1
pos = 78, -35
ownpal = 1

[State 1470, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(random < 500, 3, 4)
channel = 0
[State 1470, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
volume = -100
channel = 1


;======================< SAKURA SENKUU >=============================
[Statedef 1500]
type = S
physics = N
movetype = I
anim = 1500
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1500, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "db2p", -3, ifelse(command = "df2k", 2, -2)))

[State 1500, afterimage]
type = afterimage
trigger1 = anim = 1500 && animelem = 2
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

[State 1500, Anim]
type = changeanim
trigger1 = anim = 1500 && !animtime
value = ifelse(var(10) < 0, 1502, 1501)

[State 1500, Vel]
type = velset
trigger1 = anim = 1500 && animelemtime(2) >= 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -4) / 9.0 * pi)
[State 1500, Vel]
type = velset
trigger1 = (anim = [1501, 1502])
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))
persistent = 0
[State 1500, Vel]
type = velmul
trigger1 = (anim = [1501, 1502]) && time > ifelse((var(10) = 3 || var(10) = -3), 37, 32)
x = 0.9

[State 1500, Snd]
type = playsnd
trigger1 = anim = 1500 && animelem = 2
value = 3, 1
channel = 0
[State 1500, Snd]
type = playsnd
trigger1 = (anim = [1501, 1502])
value = 5, 8
persistent = 0

[State 1500, Push]
type = playerpush
trigger1 = anim = 1500
trigger2 = (anim = [1501, 1502])
value = 0
[State 1500, nothitby]
type = nothitby
trigger1 = anim = 1500
trigger2 = (anim = [1501, 1502])
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1500, Turn]
type = turn
trigger1 = (anim = [1501, 1502]) && p2dist x < 0

[State 1500, End]
type = changeanim
trigger1 = (anim = [1501, 1502]) && time >= ifelse((var(10) = 3 || var(10) = -3), 52, 42)
trigger2 = (anim = [1501, 1502]) && vel x < 0 && backedgebodydist <= const(size.ground.back)
trigger3 = (anim = [1501, 1502]) && vel x > 0 && frontedgebodydist <= const(size.ground.front)
value = 1505

[State 1500, statetype]
type = statetypeset
trigger1 = anim = 1505
statetype = S
physics = S
[State 1500, End]
type = changestate
trigger1 = anim = 1505 && !animtime
value = 0
ctrl = 1
