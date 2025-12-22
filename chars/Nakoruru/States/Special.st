; ___________________________________
;| Nakoruru by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SPECIAL MOVES >===
;====

;==< ANNU MUTSUBE >=
[Statedef 1000]
type = S
physics = N
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
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1000, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x >= 170, 2, ifelse(p2bodydist x >= 115, 1, 0))
[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1002, ifelse(var(10) = 1, 1001, 1000))

[State 1000, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(var(10) = 2, 9.696, ifelse(var(10) = 1, 8.895, 7.667))
[State 1000, Vel]
type = velset
trigger1 = animelem = 4
x = 0

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 1

[State 1000, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1000, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 56, -16
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (76 + var(10) * 7) < 7, 7, fvar(11) * (76 + var(10) * 7))), 10
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
ground.velocity = -4.31, -7.27
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -8
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1000, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
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

[State 1000, Sparkles]
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

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 101
[State 1000, Dust]
type = explod
trigger1 = animelem = 4
anim = 8103
sprpriority = 3
postype = p1
vel = 1, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 0
channel = 1

[State 1000, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1000, End]
type = changestate
trigger1 = !animtime
value = 12
ctrl = 1


;==< EX ANNU MUTSUBE >=
[Statedef 1020]
type = S
physics = N
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1020, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1020, OC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1020, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1020, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1020, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -15, -26
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Vel]
type = velset
trigger1 = animelem = 3
x = 11.737

[State 1020, Anim]
type = changeanim
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
value = 1020
elem = 4
[State 1020, Vel]
type = velset
trigger1 = animelem = 4
x = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 1

[State 1020, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1020, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 56, -16
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1020, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 10
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
ground.velocity = -2.75, -9
guard.velocity = -4.49
air.velocity = -2.75, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -8
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1020, Blood]
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

[State 1020, Sparkles]
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

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 101
[State 1020, Dust]
type = explod
trigger1 = animelem = 4
anim = 8103
sprpriority = 3
postype = p1
vel = 1, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 0
channel = 1

[State 1020, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1020, End]
type = changestate
trigger1 = !animtime
value = 12
ctrl = 1


;==< FAKE ANNU MUTSUBE >=
[Statedef 1090]
type = S
physics = N
movetype = I
anim = 1090
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 1090, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 4
x = 16

[State 1090, Pos]
type = velset
trigger1 = animelem = 2
x = 2
[State 1090, Pos]
type = velset
trigger1 = animelem = 4
x = 0

[State 1090, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 2
channel = 0

[State 1090, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< LELA MUTSUBE >=
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
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1100, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2movetype = H, 2, 0)
[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1102, ifelse(var(10) = 1, 1101, 1100))

[State 1100, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, statetype]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
physics = N

[State 1100, Accel]
type = veladd
trigger1 = animelemtime(4) > 0
y = 0.71

[State 1100, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(anim = 1102, 10.23, ifelse(anim = 1101, 8.62, 7))
y = -7
[State 1100, Vel]
type = velset
trigger1 = animelem = 4
y = -9.81

[State 1100, Vel]
type = veladd
trigger1 = animelemtime(4) >= 0
x = -.25
[State 1100, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 1
channel = 0
[State 1100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 1

[State 1100, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1100, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 60, -60
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1100, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (83 + var(10) * 7) < 7, 7, fvar(11) * (83 + var(10) * 7))), 11
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.31, -7.27
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 70), var(33) := -60
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1100, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
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

[State 1100, Sparkles]
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

[State 1100, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;--- Land ---
[Statedef 1103]
type = S
physics = N
movetype = I
anim = 1103
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1103, Pos]
type = posset
trigger1 = 1
y = 0

[State 1103, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1103, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1103, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< EX LELA MUTSUBE >=
[Statedef 1120]
type = S
physics = N
movetype = A
anim = 1120
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1120, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1120, OC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1120, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1120, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1120, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -20, -27
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, NHB]
type = nothitby
trigger1 = animelemtime(3) < 1
value = SCA
time = 1

[State 1120, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1120, statetype]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
physics = N

[State 1120, Accel]
type = veladd
trigger1 = animelemtime(4) > 0
y = 0.71

[State 1120, Vel]
type = velset
trigger1 = animelem = 3
x = 10.23
y = -7
[State 1120, Vel]
type = velset
trigger1 = animelem = 4
y = -9.81

[State 1120, Vel]
type = veladd
trigger1 = animelemtime(4) >= 0
x = -.25
[State 1120, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1120, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 1
channel = 0
[State 1120, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 1

[State 1120, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1120, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 60, -60
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1120, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
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
ground.velocity = -4.31, -7.27
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -24
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1120, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(20))
trigger1 = animelem = 3
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 12
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.31, -7.27
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 70), var(33) := -60
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1120, Blood]
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

[State 1120, Sparkles]
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

[State 1120, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1120, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;==< KAMUI RIMSE >=
[Statedef 1200]
type = S
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1200, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1200, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 2
[State 1200, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1202, ifelse(var(10) = 1, 1201, 1200))

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 8
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 4
value = 7, 2
channel = 1

[State 1200, Reflector]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1250
ID = 1250
name = "Reflector"
postype = p1
ownpal = 1

[State 1200, Sparkles]
type = explod
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 1200, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 5
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (56 + var(10) * 7) < 7, 7, fvar(11) * (56 + var(10) * 7))), 8
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
guard.pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5, -6
ground.cornerpush.veloff = 0;-20.01
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 80), var(33) := -48
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1200, Sparkles]
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

[State 1200, follow -up]
type = varset
triggerall = !AIlevel
triggerall = animelemtime(5) >= 0 && animelemtime(7) < 0 && movecontact
trigger1 = var(10) = 0 && command = "x"
trigger2 = var(10) = 1 && command = "y"
trigger3 = var(10) = 2 && command = "z"
var(45) = 1
ignorehitpause = 1
[State 1200, follow -up]
type = varset
trigger1 = AIlevel
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0 && movecontact
var(45) = 1
ignorehitpause = 1
[State 1200, follow -up]
type = varset
trigger1 = time <= 1
var(45) = 0
[State 1200, follow -up]
type = changestate
trigger1 = var(45) && !animelemtime(8)
value = 1210

[State 1200, Pos]
type = posadd
trigger1 = animelem = 8
x = 28
[State 1200, Pos]
type = posadd
trigger1 = animelem = 9 || animelem = 10
x = 14

[State 1200, statetype]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 1200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Follow -up ---
[Statedef 1210]
type = S
physics = N
movetype = A
anim = 1210
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 1210, Vel]
type = veladd
trigger1 = animelemtime(4) >= 0
x = -.3
[State 1210, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1210, Vel]
type = velset
trigger1 = animelem = 4
x = 6

[State 1210, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 4
channel = 0
[State 1210, Snd]
type = playsnd
trigger1 = animelem = 5
value = 7, 2
channel = 1
freqmul = 1.1

[State 1210, Sparkles]
type = explod
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 1210, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5, -6.2
guard.velocity = -10.52
air.velocity = -5, -6.2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 94), var(33) := -64
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1210, Sparkles]
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

[State 1210, statetype]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 1210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX KAMUI RIMSE >=
[Statedef 1220]
type = S
physics = N
movetype = A
anim = 1220
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1220, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1220, OC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1220, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1220, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1220, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -18, -73
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Vel]
type = veladd
trigger1 = vel x > 0
x = -.0315
[State 1220, Vel]
type = velset
trigger1 = vel x < 0
x = 0
[State 1220, Vel]
type = velset
trigger1 = animelem = 4 || animelem = 12 || animelem = 18
x = 1.4

[State 1220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 8
channel = 0
[State 1220, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 11 || animelem = 18
value = 7, 2
channel = 1

[State 1220, Reflector]
type = helper
trigger1 = animelem = 5 || animelem = 12 || animelem = 19
helpertype = normal
stateno = 1250
ID = 1250
name = "Reflector"
postype = p1
ownpal = 1

[State 1220, Sparkles]
type = explod
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(14) < 0
trigger3 = animelemtime(19) >= 0 && animelemtime(21) < 0
anim = 8160
sprpriority = 3
postype = p1
pos = 59, -66
random = 50, 100
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 1220, Hit]
type = hitdef
trigger1 = !var(27) && var(14) < 1
trigger1 = animelem = 5 || animelem = 12
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 6, 6
guard.pausetime = 6, 6
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
air.velocity = -5, -6
ground.cornerpush.veloff = 0;-8.17
guard.cornerpush.veloff = 0;-8.17
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 82), var(33) := -48
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1220, Hit]
type = hitdef
trigger1 = !var(27) && var(14) < 1
trigger1 = animelem = 19
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5, -6.2
guard.velocity = -10.52
air.velocity = -5, -6.2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
sparkno = -1 + (var(30) := 8013) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 82), var(33) := -48
hitsound = -1 * (var(34) := 2) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1220, Sparkles]
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

[State 1220, Pos]
type = posadd
trigger1 = animelem = 22
x = 28
[State 1220, Pos]
type = posadd
trigger1 = animelem = 23 || animelem = 24
x = 14

[State 1220, statetype]
type = statetypeset
trigger1 = animelemtime(21) >= 0
movetype = I
[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< AMUBE YATORO >=
[Statedef 1300]
type = S
physics = S
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1300, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1300, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x >= 160, 2, ifelse(p2bodydist x >= 120, 1, 0))

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 0
channel = 1

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX AMUBE YATORO >=
[Statedef 1350]
type = S
physics = S
movetype = A
anim = 1350
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1350, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1350, OC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1350, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1350, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1350, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 20, -63
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1350, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 3
channel = 0
[State 1350, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 0
channel = 1

[State 1350, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< MAMAHAHA NI TSUKAMARU >=
[Statedef 1500]
type = A
physics = N
movetype = I
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 1500, Snd]
type = playsnd
trigger1 = !time
value = 0, 40
[State 1500, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1500, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1500, Vel]
type = velset
trigger1 = !time
y = -8

[State 1500, ok]
type = changestate
trigger1 = time >= 10 && pos y <= -52
trigger1 = numhelper(10000)
trigger1 = pos y <= (helper(10000), pos y + 94)
value = 1509

[State 1500, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1591


;--- Caught ---
[Statedef 1509]
type = A
physics = N
movetype = I
anim = 1509
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 1509, timer]
type = varset
trigger1 = 1
var(46) = 300

[State 1509, Snd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 1509, End]
type = changestate
trigger1 = time >= 3
value = 1510


;--- Being Carried ---
[Statedef 1510]
type = A
physics = N
movetype = I
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 1510, timer]
type = varadd
trigger1 = 1
var(46) = -1
[State 1510, fall]
type = changestate
trigger1 = var(46) <= 0
trigger2 = roundstate != 2
value = 1590

[State 1510, Turn]
type = turn
trigger1 = p2dist x < 0

[State 1510, Pos]
type = posset
trigger1 = pos y > -1
y = -1
[State 1510, Pos]
type = posset
trigger1 = pos y < -128
y = -128

[State 1510, Vel]
type = velset
trigger1 = 1
x = 0
y = sin(gametime / 16.0 * pi) * 0.5

[State 1510, Vel]
type = velset
trigger1 = command = "holdfwd"
x = 2
[State 1510, Vel]
type = velset
trigger1 = command = "holdback"
x = -2
[State 1510, Vel]
type = velset
trigger1 = command = "holdup" && pos y > -125
y = -2 + sin(gametime / 16.0 * pi) * 0.5
[State 1510, Vel]
type = velset
trigger1 = command = "holddown" && pos y < -3
y = 2 + sin(gametime / 16.0 * pi) * 0.5


;--- Let Go ---
[Statedef 1590]
type = A
physics = N
movetype = A
anim = 1590
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 1590, Vel]
type = veladd
trigger1 = 1
y = 0.72

[State 1590, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1591


;--- Land ---
[Statedef 1591]
type = S
physics = N
movetype = I
anim = 1591
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1591, Pos]
type = posset
trigger1 = 1
y = 0

[State 1591, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1591, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1591, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< SHICHIKAPU AI >=
[Statedef 1530]
type = A
physics = N
movetype = A
anim = 1530
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1530, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1530, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x >= 180, 2, ifelse(p2bodydist x >= 125, 1, 0))

[State 1530, Pos]
type = posadd
trigger1 = animelem = 2
y = -16
[State 1590, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.72

[State 1530, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0

[State 1530, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1591


;==< KAMUI MUTSUBE >=
[Statedef 1550]
type = A
physics = N
movetype = A
anim = 1550
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1550, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1550, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x >= 110, 2, ifelse(p2bodydist x >= 80, 1, 0))

[State 1550, Pos]
type = posadd
trigger1 = animelem = 2
y = -16
[State 1550, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(var(10) = 2, 12.635, ifelse(var(10) = 1, 10.64, 8.645))
y = ifelse(var(10) = 2, 5.985, ifelse(var(10) = 1, 6.3175, 6.65))

[State 1550, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 2
channel = 0
[State 1550, Snd]
type = playsnd
trigger1 = animelem = 2
value = 7, 1

[State 1550, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1550, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 27, -4
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1550, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (76 + var(10) * 7) < 7, 7, fvar(11) * (76 + var(10) * 7))), 10
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
ground.velocity = -4.31, -7.27
guard.velocity = -10.52
air.velocity = -4.31, -7.27
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 38), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1550, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
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

[State 1550, Sparkles]
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

[State 1550, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1553


;--- Land ---
[Statedef 1553]
type = S
physics = N
movetype = I
anim = 1553
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1553, Pos]
type = posset
trigger1 = 1
y = 0

[State 1553, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1553, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1553, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< EX KAMUI MUTSUBE >=
[Statedef 1560]
type = A
physics = N
movetype = A
anim = 1550
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1560, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1560, OC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1560, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1560, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1560, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -17, -72
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1560, Pos]
type = posadd
trigger1 = animelem = 2
y = -16
[State 1560, Vel]
type = velset
trigger1 = animelem = 2
x = 10.64
y = 6.3175

[State 1560, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 2
channel = 0
[State 1560, Snd]
type = playsnd
trigger1 = animelem = 2
value = 7, 1

[State 1560, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1005
ID = 1005
name = "Mutsube FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
[State 1560, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1006
ID = 1005
name = "Mutsube FX"
postype = p1
pos = 27, -4
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1560, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = !(movecontact % 3)
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
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
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 38), var(33) := -10
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1560, Blood]
type = helper
trigger1 = hitpausetime = 7
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

[State 1560, Sparkles]
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

[State 1560, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1563


;--- Land ---
[Statedef 1563]
type = S
physics = N
movetype = I
anim = 1563
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1563, Pos]
type = posset
trigger1 = 1
y = 0

[State 1563, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1563, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1563, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< PUNCH ZERO COUNTER >=
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2900, nothitby]
type = nothitby
trigger1 = animelemtime(6) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Vel]
type = veladd
trigger1 = vel x > 0
x = -.2
[State 2900, Vel]
type = velset
trigger1 = animelem = 4
x = 6
[State 2900, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 0
channel = 0

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 8
channel = 1
[State 2900, FX]
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

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 102
[State 2900, Dust]
type = explod
trigger1 = animelem = 4
anim = 8102
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 2900, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
ID = 2900
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 0, 0
guard.pausetime = 12, 12
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5, -6.2
guard.velocity = -10.52
air.velocity = -5, -6.2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 88), var(33) := -46
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2900, p2state]
type = targetstate
trigger1 = movehit = 1 && numtarget(2900)
ID = 2900
value = 2910
ignorehitpause = 1

[State 2900, Blood]
type = helper
trigger1 = movehit = 1 && numtarget(2900)
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

[State 2900, End]
type = changeanim
trigger1 = movehit && numtarget(2900)
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger1 = target(2900), stateno = 2910
value = 2900
elem = 8

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 13
value = 7, 0
channel = 1

[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- --TARGET -----
[Statedef 2910]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 2910, Pos]
type = posset
trigger1 = 1
y = 0
[State 2910, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 2910, Anim]
type = changeanim2
trigger1 = !time && !selfanimexist(5950)
value = 2910
[State 2910, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5950)
value = 5950

[State 2910, Anim]
type = changeanim
trigger1 = time >= 90
trigger2 = (anim = 2910 || anim = 5950) && !animtime
value = ifelse(selfanimexist(5111), 5111, 5110)
[State 2910, End]
type = selfstate
trigger1 = anim = 5110 || anim = 5111
value = 5110


;==< KICK ZERO COUNTER >=
[Statedef 2950]
type = C
physics = N
movetype = A
anim = 2950
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2950, nothitby]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2950, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 4
channel = 0
[State 2950, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 2950, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
ID = 2950
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5, -6.2
guard.velocity = -10.52
air.velocity = -5, -6.2
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-20.01
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8001) * 0
sparkxy = -10 + 0 * (var(32) := 86), var(33) := -28
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2950, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 2950, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
