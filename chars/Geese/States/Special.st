; _______________________________________
;| Geese Howard by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====< SPECIAL MOVES >===
;==

;====< REPPUKEN >=
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1000, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "x" || command = "rlsx"), 0, 1)
[State 1000, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 1, 0)
[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 0, 1001, 1000)

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 7, 0

[State 1000, Reppuken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1005
ID = 1005
name = "Reppuken"
postype = p1
pos = 20, 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = anim + 3
name = "Reppuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Double Reppuken ---
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1010
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1010, Button]
type = varset
trigger1 = !time
var(10) = 2

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 1
channel = 0
[State 1010, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 9
value = 7, 0
channel = 4

[State 1010, Reppuken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1015
ID = 1015
name = "Double Reppuken"
postype = p1
pos = 64, 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1010, Reppuken]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 1020
ID = 1020
name = "Double Reppuken"
postype = p1
pos = 64, 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, FX]
type = helper
trigger1 = animelem = 3 || animelem = 8
helpertype = normal
stateno = ifelse((animelem = 8), 1004, 1003)
name = "Reppuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Fake ---
[Statedef 1090]
type = S
physics = S
movetype = A
anim = 1090
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 1090, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 6
channel = 0
[State 1090, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 1090, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< EX REPPUKEN >=
[Statedef 1030]
type = S
physics = N
movetype = A
anim = 1030
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1030, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -4, -126
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 0
channel = 0
[State 1030, Snd]
type = playsnd
trigger1 = animelem = 4
value = 7, 0
channel = 4

[State 1030, Reppuken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1035
ID = 1035
name = "EX Reppuken"
postype = p1
pos = 42, 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1030, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1003
name = "Reppuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1030, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< JAEIKEN >=
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1100, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))
[State 1100, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x > 170, 2, ifelse(p2bodydist x > 140, 1, 0))
[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1102, ifelse(var(10) = 1, 1101, 1100))

[State 1100, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 1
[State 1100, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Vel]
type = velset
trigger1 = animelemtime(5) >= 0
x = ifelse(var(10) = 2, 7.8333, ifelse(var(10) = 1, 7.675, 7.4375))
y = 0

[State 1100, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 2
channel = 0

[State 1100, FX]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1105
ID = 1105
name = "Jaeiken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1100, Attack]
type = changestate
trigger1 = animelemtime(5) > 0
trigger1 = p2dist x >= 0 && p2bodydist x <= 24
value = 1110
[State 1100, End];16 -20 -24
type = changestate
triggerall = animelemtime(5) >= 0
trigger1 = var(10) = 0 && time >= 21
trigger2 = var(10) = 1 && time >= 29
trigger3 = time >= 37
value = 1103


;--- Miss ---
[Statedef 1103]
type = S
physics = N
movetype = I
anim = 1103
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1103, Snd]
type = playsnd
trigger1 = !time
value = 0, 103
[State 1103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Attack ---
[Statedef 1110]
type = S
physics = N
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1110, Vel]
type = velset
trigger1 = animelem = 1
x = ifelse(var(10) = 2, 4.31, ifelse(var(10) = 1, 4.01, 3.77))
[State 1110, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 1110, Snd]
type = playsnd
trigger1 = animelem = 9
value = 4, 3
channel = 0
[State 1110, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 3
value = 1, 2
channel = 1
[State 1110, Snd]
type = playsnd
trigger1 = animelem = 9
value = 7, 3

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 35, ifelse(var(10) = 1, 31, 28)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 35, ifelse(var(10) = 1, 31, 28)))), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.24
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;37
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 38), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 35, ifelse(var(10) = 1, 31, 28)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 35, ifelse(var(10) = 1, 31, 28)))), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.24
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;37
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 48), var(36) := -77
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 83, ifelse(var(10) = 1, 76, 69)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 83, ifelse(var(10) = 1, 76, 69)))), ifelse(var(10) = 2, 10, 9)
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, -7.24
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.24
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;37
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -61
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1110, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(9) >= 0 && animelemtime(10) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 8)
value = 1110
elem = 10
ignorehitpause = 1

[State 1110, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I
[State 1110, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< EX JAEIKEN >=
[Statedef 1130]
type = S
physics = N
movetype = A
anim = 1130
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1130, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1130, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1130, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1130, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1130, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -11, -83
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 1
[State 1130, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1130, Vel]
type = velset
trigger1 = 0;animelemtime(5) >= 0
x = 10
y = 0

[State 1140, Vel]
type = velmul
trigger1 = animelemtime(5) >= 0
x = 0.9
[State 1140, Vel]
type = velset
trigger1 = animelem = 5
x = 24

[State 1130, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 2
channel = 0

[State 1130, FX]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1135
ID = 1135
name = "EX Jaeiken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1130, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < 1
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 23 < 7, 7, fvar(11) * 23)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.31, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;37
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -58
palfx.time = 32
palfx.mul = 128, 128, 128
palfx.sinadd = 96, 96, 96, 4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1130, Attack]
type = changestate
trigger1 = movecontact = 1
value = 1140
[State 1130, End]
type = changestate
trigger1 = time >= 33
value = 1131


;--- Miss ---
[Statedef 1131]
type = S
physics = N
movetype = I
anim = 1103
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1131, Snd]
type = playsnd
trigger1 = !time
value = 0, 103
[State 1131, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1131, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Attack ---
[Statedef 1140]
type = S
physics = N
movetype = A
anim = 1140
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1140, Vel]
type = velset
trigger1 = animelem = 1
x = 5
[State 1140, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 1140, Snd]
type = playsnd
trigger1 = animelem = 8
value = 7, 3

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 4 || animelem = 6
trigger1 = !var(16) && var(15) < 1
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 23 < 7, 7, fvar(11) * 23)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.31, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;37
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -58
palfx.time = 32
palfx.mul = 128, 128, 128
palfx.sinadd = 96, 96, 96, 4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 8
trigger1 = !var(16) && var(15) < 2
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -8.62, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -8.62, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -62
palfx.time = 32
palfx.mul = 128, 128, 128
palfx.sinadd = 96, 96, 96, 4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1140, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 1140, Type]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I
[State 1140, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< JOUDAN ATEMI NAGE >=
[Statedef 1200]
type = S
physics = S
movetype = I
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 1200, Reversal]
type = reversaldef
trigger1 = !movehit && var(26) <= 0
trigger1 = animelemtime(2) < 0
attr = S, ST
reversal.attr = SCA, SA, HA
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1210
p2stateno = 1213
fall = 1
fall.recover = 1
numhits = 0

[State 1200, Safety]
type = superpause
trigger1 = !time
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 1200, Reversal]
type = reversaldef
trigger1 = !movehit && var(26) <= 0
trigger1 = animelemtime(2) < 0 && p2statetype = A
attr = S, ST
reversal.attr = A, NA, SA, HA
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1210
p2stateno = 1213
fall = 1
fall.recover = 1
numhits = 0

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Success ---
[Statedef 1210]
type = S
physics = S
movetype = A
anim = 1210
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 36 * !var(20)

[State 1210, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1
[State 1210, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8020
ID = 8000
name = "Spark"
postype = p1
pos = 32, -116
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1210, Turn]
type = turn
trigger1 = animelem = 2

[State 1210, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1215
[State 1210, Throw]
type = targetfacing
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0
value = 1

[State 1210, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
edge = 32, 0
[State 1210, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(10) < 0
edge = 64, 0

[State 1210, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -40, 0
[State 1210, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -36, -124
[State 1210, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 31, -115
[State 1210, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 35, -95
[State 1210, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 40, -75
[State 1210, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 7
pos = 45, 0

[State 1210, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 72
[State 1210, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 7
value = 36
[State 1210, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 7
value = ceil(ifelse(132 * fvar(11) < 7, -7, -132 * fvar(11)))

[State 1210, Hit]
type = hitadd
trigger1 = numtarget && animelem = 7
value = 1
[State 1210, HitCount]
type = varadd
trigger1 = numtarget && animelem = 7
var(13) = 1
[State 1210, Juggle]
type = varadd
trigger1 = numtarget && animelem = 7
var(15) = 1

[State 1210, Throw]
type = targetstate
trigger1 = numtarget && animelem = 7
value = 1216

[State 1210, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 7 + (random % 3)
channel = 0

[State 1210, Sound]
type = playsnd
trigger1 = numtarget && animelem = 7
value = 7, 8
[State 1210, Shake]
type = envshake
trigger1 = numtarget && animelem = 7
time = 14
ampl = -4
freq = 120
[State 1210, Dust]
type = helper
trigger1 = numtarget && animelem = 7
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = 45, 0
ownpal = 1

[State 1210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target Paused ---
[Statedef 1213]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 2

[State 1213, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 1213, Push
type = playerpush
trigger1 = 1
value = 0
[State 1213, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1213, Anim]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 1213, End]
type = selfstate
trigger1 = time >= 24
value = 5040


;--- Target ---
[Statedef 1215]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = -1
[State 1215, Anim]
type = changeanim2
trigger1 = !time
value = 1215
[State 1215, Sound]
type = stopsnd
trigger1 = !time
channel = 0
[State 1215, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 1216]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = -1
[State 1216, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 1216, Anim]
type = changeanim
trigger1 = !time
value = 5100
[State 1216, End]
type = changestate
trigger1 = time >= 6
value = 1217


[Statedef 1217]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1217, Pos]
type = posset
trigger1 = !time
y = 0
[State 1217, Vel]
type = veladd
trigger1 = time
y = 0.58
[State 1217, Vel]
type = velset
trigger1 = time = 1
x = 3
y = -8

[State 1217, Anim]
type = changeanim
trigger1 = !time
value = 5050

[State 1217, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1217, End]
type = selfstate
trigger1 = time >= 8 && vel y > 0 && pos y >= 25
value = 5110


;====< CHUUDAN ATEMI NAGE >=
[Statedef 1220]
type = S
physics = S
movetype = I
anim = 1220
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1220, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 1220, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 1220, Safety]
type = superpause
trigger1 = !time
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 1220, Reversal]
type = reversaldef
trigger1 = !movehit && var(26) <= 0
trigger1 = animelemtime(2) < 0
attr = S, ST
reversal.attr = SC, NA
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1230
p2stateno = 1213
fall = 1
fall.recover = 1
numhits = 0

[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Success ---
[Statedef 1230]
type = S
physics = S
movetype = A
anim = 1230
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 36 * !var(20)

[State 1230, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1
[State 1230, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8020
ID = 8000
name = "Spark"
postype = p1
pos = 22, -75
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1230, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1235
[State 1230, Throw]
type = targetfacing
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0
value = -1

[State 1230, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
edge = 32, 0
[State 1230, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(10) < 0
edge = 64, 0

[State 1230, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 42, 0
[State 1230, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 22, 0
[State 1230, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 12, 0
[State 1230, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 6, 0
[State 1230, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 0, -76
[State 1230, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 56, -160
[State 1230, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 38, -150
[State 1230, Bind 9]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = 42, -140
[State 1230, Bind 10]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = 56, -122
[State 1230, Bind 11]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 11
pos = 50, 0

[State 1230, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 72
[State 1230, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 11
value = 36
[State 1230, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 11
value = ceil(ifelse(146 * fvar(11) < 7, -7, -146 * fvar(11)))

[State 1230, Hit]
type = hitadd
trigger1 = numtarget && animelem = 11
value = 1
[State 1230, HitCount]
type = varadd
trigger1 = numtarget && animelem = 11
var(13) = 1
[State 1230, Juggle]
type = varadd
trigger1 = numtarget && animelem = 11
var(15) = 1

[State 1230, Throw]
type = targetstate
trigger1 = numtarget && animelem = 11
value = 1236

[State 1230, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 7 + (random % 3)
channel = 0

[State 1230, Sound]
type = playsnd
trigger1 = numtarget && animelem = 11
value = 7, 8
[State 1230, Shake]
type = envshake
trigger1 = numtarget && animelem = 11
time = 14
ampl = -4
freq = 120
[State 1230, Dust]
type = helper
trigger1 = numtarget && animelem = 11
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = 45, 0
ownpal = 1

[State 1230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 1235]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = -1
[State 1235, Anim]
type = changeanim2
trigger1 = !time
value = 1235
[State 1235, Sound]
type = stopsnd
trigger1 = !time
channel = 0
[State 1235, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 1236]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = -1
[State 1236, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 1236, Anim]
type = changeanim
trigger1 = !time
value = 5100
[State 1236, End]
type = changestate
trigger1 = time >= 6
value = 1237


[Statedef 1237]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1237, Pos]
type = posset
trigger1 = !time
y = 0
[State 1237, Vel]
type = veladd
trigger1 = time
y = 0.58
[State 1237, Vel]
type = velset
trigger1 = time = 1
x = -3
y = -8

[State 1237, Anim]
type = changeanim
trigger1 = !time
value = 5050

[State 1237, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1237, End]
type = selfstate
trigger1 = time >= 8 && vel y > 0 && pos y >= 25
value = 5110


;====< GEDAN ATEMI NAGE >=
[Statedef 1240]
type = S
physics = S
movetype = I
anim = 1240
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1240, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 1240, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 1240, Safety]
type = superpause
trigger1 = !time
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 1240, Reversal]
type = reversaldef
trigger1 = !movehit && var(26) <= 0
trigger1 = animelemtime(3) < 0
attr = S, ST
reversal.attr = SC, NA
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1250
p2stateno = 1213
fall = 1
fall.recover = 1
numhits = 0

[State 1240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Success ---
[Statedef 1250]
type = S
physics = S
movetype = A
anim = 1250
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 36 * !var(20)

[State 1250, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1
[State 1250, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8020
ID = 8000
name = "Spark"
postype = p1
pos = 26, -33
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1250, Throw]
type = targetstate
trigger1 = numtarget && animelem = 2
value = 1255
[State 1250, Throw]
type = targetstate
trigger1 = numtarget && animelem = 3
value = 1256
[State 1250, Throw]
type = targetfacing
trigger1 = numtarget && animelem = 2
value = -1

[State 1250, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
edge = 24, 0
[State 1250, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(11) < 0
edge = 48, 0

[State 1250, Bind 2]
type = targetbind
trigger1 = numtarget && animelem = 2
pos = 40, 0
[State 1250, Bind 2]
type = targetbind
trigger1 = numtarget && animelem = 8
pos = 40, -27

[State 1250, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 72
[State 1250, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 8
value = 36
[State 1250, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 8
value = ceil(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))

[State 1250, Hit]
type = hitadd
trigger1 = numtarget && animelem = 8
value = 1
[State 1250, HitCount]
type = varadd
trigger1 = numtarget && animelem = 8
var(13) = 1
[State 1250, Juggle]
type = varadd
trigger1 = numtarget && animelem = 8
var(15) = 1

[State 1250, Throw]
type = targetstate
trigger1 = numtarget && animelem = 8
value = 1257

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 7 + (random % 3)
channel = 0

[State 1250, Sound]
type = playsnd
trigger1 = numtarget && animelem = 8
value = 2, 2
channel = 2
[State 1250, Shake]
type = envshake
trigger1 = numtarget && animelem = 8
time = 14
ampl = -4
freq = 120
[State 1250, Spark]
type = helper
trigger1 = numtarget && animelem = 8
helpertype = normal
stateno = 8013
ID = 8000
name = "Spark"
postype = p1
pos = 22, -58
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 1255]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = -1
[State 1255, Anim]
type = changeanim2
trigger1 = !time
value = 1255
[State 1255, Sound]
type = stopsnd
trigger1 = !time
channel = 0
[State 1255, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 1256]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = -1

[State 1256, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 1256, Push
type = playerpush
trigger1 = 1
value = 0

[State 1256, Anim]
type = changeanim
trigger1 = !time
value = 5070

[State 1256, Vel]
type = veladd
trigger1 = time
y = 1
[State 1256, Vel]
type = velset
trigger1 = time = 1
x = 0
y = -10

[State 1256, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


[Statedef 1257]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 2

[State 1257, Push
type = playerpush
trigger1 = 1
value = 0
[State 1257, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1257, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 1257, End]
type = changestate
trigger1 = time >= 12
value = 1258


[Statedef 1258]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1258, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 1258, Vel]
type = velset
trigger1 = !time
x = -7.54
y = -3

[State 1258, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5035), 5035, 5050)
[State 1258, Anim]
type = changeanim
trigger1 = anim != 5050 && !animtime
value = 5050

[State 1258, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1258, End]
type = selfstate
trigger1 = time >= 8 && vel y > 0 && pos y >= 25
value = 5100


;====< EX ATEMI NAGE >=
[Statedef 1260]
type = S
physics = S
movetype = I
anim = 1260
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1160, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1260, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1260, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1260, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 22, -76
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1260, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 1260, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 1260, Safety]
type = superpause
trigger1 = !time
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 1260, Reversal]
type = reversaldef
trigger1 = !movehit && var(26) <= 0
trigger1 = animelemtime(2) < 0
attr = S, ST
reversal.attr = SC, NA, SA, HA
pausetime = 0, 0
sparkno = -1
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1270
p2stateno = 1213
fall = 0
numhits = 0

[State 1260, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Success ---
[Statedef 1270]
type = S
physics = S
movetype = A
anim = 1270
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1270, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1
[State 1270, Spark]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8020
ID = 8000
name = "Spark"
postype = p1
pos = 22, -75
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1270, Turn]
type = turn
trigger1 = animelem = 2

[State 1270, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1275
[State 1270, Throw]
type = targetfacing
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0
value = -1

[State 1270, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 32, 0

[State 1270, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -28, 4
[State 1270, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 0, 8
[State 1270, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 4
pos = 26, 0

[State 1270, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 72
[State 1270, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 4
value = 36

[State 1270, Hit]
type = hitadd
trigger1 = numtarget && animelem = 4
value = 1
[State 1270, HitCount]
type = varadd
trigger1 = numtarget && animelem = 4
var(13) = 1

[State 1270, Throw]
type = targetstate
trigger1 = numtarget && animelem = 4
value = 1276

[State 1270, Sound]
type = playsnd
trigger1 = animelem = 2
value = 6, 17
channel = 0
[State 1270, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1
[State 1270, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 101

[State 1270, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 1275]
type = S
physics = N
movetype = H
velset = 0, 0
sprpriority = 2
[State 1275, Anim]
type = changeanim2
trigger1 = !time
value = 1275
[State 1275, Sound]
type = stopsnd
trigger1 = !time
channel = 0
[State 1275, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 1276]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1276, Anim]
type = changeanim
trigger1 = !time
value = 5012
[State 1276, Anim]
type = changeanim
trigger1 = anim = 5012 && !animtime
value = 5017

[State 1276, Vel]
type = velmul
trigger1 = 1
x = 0.85
[State 1276, Vel]
type = velset
trigger1 = !time
x = -8

[State 1276, End]
type = selfstate
trigger1 = time >= 32
value = 0
ctrl = 1


;====< SHIPPUKEN >=
[Statedef 1300]
type = A
physics = N
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)

[State 1300, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1300, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 333, 2, ifelse(random < 500, 1, 0))

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 3
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 3

[State 1300, Shippuken]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1305
ID = 1305
name = "Shippuken"
postype = p1
pos = 71, -42
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1300, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1304
name = "Shippuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1300, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 1300, Vel]
type = veladd
trigger1 = animelemtime(5) >= 1 && vel x <= -.0553
x = ifelse(var(10) = 2, 0.0553, ifelse(var(10) = 1, 0.04837, 0.0415))
[State 1300, Vel]
type = veladd
trigger1 = animelemtime(5) >= 1
y = 0.5528
[State 1300, Vel]
type = velset
trigger1 = animelemtime(5) = 1
x = ifelse(var(10) = 2, -3.43, ifelse(var(10) = 1, -2.88, -2.34))
y = ifelse(var(10) = 2, -7.91, ifelse(var(10) = 1, -6.58, -5.25))

[State 1300, End]
type = changestate
trigger1 = pos y > -vel y
value = 1301


;--- Land ---
[Statedef 1301]
type = S
physics = S
movetype = A
anim = 1301
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1301, Pos]
type = posset
trigger1 = 1
y = 0

[State 1301, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< EX SHIPPUKEN >=
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500

[State 1320, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1320, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1320, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1320, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1320, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 25, -76
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1320, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 3
channel = 0
[State 1320, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8
value = 7, 3

[State 1320, Shippuken]
type = helper
trigger1 = animelem = 3 || animelem = 8
helpertype = normal
stateno = 1325
ID = 1325
name = "EX Shippuken"
postype = p1
pos = ifelse((animelem = 3), 69, 71), ifelse((animelem = 3), -50, -42)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1320, FX]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1304
name = "Shippuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1320, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I

[State 1320, Vel]
type = veladd
trigger1 = animelemtime(8) >= 1 && vel x <= -.0553
x = 0.0553
[State 1320, Vel]
type = veladd
trigger1 = animelemtime(8) >= 1
y = 0.5528
[State 1320, Vel]
type = velset
trigger1 = animelemtime(8) = 1
x = -3.43
y = -7.91

[State 1320, Follow -up]
type = changestate
triggerall = animelemtime(11) >= 0
trigger1 = !AIlevel && command = "214p"
trigger2 = AIlevel
value = 1321
[State 1320, Follow -up]
type = changestate
trigger1 = animelemtime(11) >= 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = 1322

[State 1320, End]
type = changestate
trigger1 = pos y > -vel y
value = 1301


;--- Repeat ---
[Statedef 1321]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
sprpriority = 1

[State 1321, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 3
channel = 0
[State 1321, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8
value = 7, 3

[State 1321, Shippuken]
type = helper
trigger1 = animelem = 3 || animelem = 8
helpertype = normal
stateno = 1325
ID = 1325
name = "EX Shippuken"
postype = p1
pos = ifelse((animelem = 3), 69, 71), ifelse((animelem = 3), -50, -42)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1321, FX]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1304
name = "Shippuken FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1321, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I

[State 1321, Vel]
type = veladd
trigger1 = vel x <= -.0553
x = 0.0553
[State 1321, Vel]
type = veladd
trigger1 = 1
y = 0.5528

[State 1321, End]
type = changestate
trigger1 = pos y > -vel y
value = 1323


;--- --Kick -----
[Statedef 1322]
type = A
physics = N
movetype = A
anim = 1322
ctrl = 0
sprpriority = 1

[State 1322, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 1322, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 1322, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
ID = 200 * !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4 * var(9)
ground.slidetime = 12 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;28
forcestand = 1
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 1322, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 1322, Vel]
type = veladd
trigger1 = 1
y = 0.5528
[State 1322, End]
type = changestate
trigger1 = pos y > -vel y
value = 1323


;--- Land ---
[Statedef 1323]
type = S
physics = S
movetype = A
anim = 1323
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1323, Pos]
type = posset
trigger1 = 1
y = 0

[State 1323, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1323, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1323, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< HISHOU NICHIRIN ZAN >=
[Statedef 1400]
type = S
physics = N
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1400, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))
[State 1400, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x > 66, 2, ifelse(p2bodydist x > 48, 1, 0))
[State 1400, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1402, ifelse(var(10) = 1, 1401, 1400))

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 0, 40
[State 1400, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1400, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(anim = 1402, 6, ifelse(anim = 1401, 5, 4))
[State 1400, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 1400, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A
physics = N
[State 1400, Vel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.55
[State 1400, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(anim = 1402, 4, ifelse(anim = 1401, 3.5, 3))
y = ifelse(anim = 1402, -9, ifelse(anim = 1401, -8, -7))

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 2
channel = 0

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 7
value = 7, 3
[State 1400, FX]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 1405
ID = 1405
name = "Zan FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 42, ifelse(var(10) = 1, 33, 21)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 42, ifelse(var(10) = 1, 35, 28)))), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4, -10
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4, -10
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;45
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 36), var(36) := -62
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 8
trigger1 = !var(16) && (var(15) < (1 + hitcount) || var(20))
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 8
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1400, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 1400, End]
type = changestate
trigger1 = animelemtime(6) > 0
trigger1 = pos y > -vel y
value = 1403


;--- Land ---
[Statedef 1403]
type = S
physics = S
movetype = A
anim = 103
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1403, Pos]
type = posset
trigger1 = 1
y = 0

[State 1403, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1403, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1403, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< EX HISHOU NICHIRIN ZAN >=
[Statedef 1420]
type = S
physics = N
movetype = A
anim = 1420
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1420, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1420, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1420, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1420, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1420, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 15, -70
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1420, Snd]
type = playsnd
trigger1 = animelem = 6
value = 0, 40
[State 1420, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1420, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
time = 1
value = SCA

[State 1420, Vel]
type = velset
trigger1 = animelem = 2
x = 4
[State 1420, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 1420, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A
physics = N
[State 1420, Vel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.55
[State 1420, Vel]
type = velset
trigger1 = animelem = 6
x = 4
y = -9

[State 1420, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0
[State 1420, Snd]
type = playsnd
trigger1 = animelem = 8
value = 4, 2
channel = 0

[State 1420, Snd]
type = playsnd
trigger1 = animelem = 8
value = 7, 3
[State 1420, FX]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 1405
ID = 1405
name = "Zan FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1420, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && var(15) < 1
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4, -10
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120;45
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 36), var(36) := -62
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1420, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = !var(16) && var(15) < 1
attr = A, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4, -10
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4, -10
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;45
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 36), var(36) := -62
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1420, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = !var(16) && var(15) < 2
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4, -10
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1420, Juggle]
type = varset
trigger1 = movehit = 1
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 1 && hitcount = 3
var(15) = 0
ignorehitpause = 1

[State 1420, Type]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I
[State 1420, End]
type = changestate
trigger1 = animelemtime(6) > 0
trigger1 = pos y > -vel y
value = 1403


;====< PUNCH ZERO COUNTER >=
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 2
channel = 0
[State 2900, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 2900, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 46), var(36) := -99
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< KICK ZERO COUNTER >=
[Statedef 2910]
type = S
physics = N
movetype = A
anim = 2910
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 2
channel = 0
[State 2910, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 2910, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -29
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
