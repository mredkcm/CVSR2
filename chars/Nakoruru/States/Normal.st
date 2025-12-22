; ___________________________________
;| Nakoruru by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< NORMAL MOVES >====
;====

;=< Standing Far Light Punch >==
[Statedef 200]
type = S
physics = S
movetype = A
anim = 200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 62), var(33) := -60
hitsound = -1 * (var(34) := 0) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 7)
value = 200
elem = 3
ignorehitpause = 1

[State 200, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 1, 5)
value = 200
elem = 4
ignorehitpause = 1

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Light Punch >==
[Statedef 201]
type = S
physics = S
movetype = A
anim = 201
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 201, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 201, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 201, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 50), var(33) := -73
hitsound = -1 * (var(34) := 0) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 201, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 201
elem = 3
ignorehitpause = 1

[State 201, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Far Medium Punch >==
[Statedef 210]
type = S
physics = S
movetype = A
anim = 210
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
channel = 1

[State 210, FX]
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

[State 210, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.17, -6.33), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 84), var(33) := -46
hitsound = -1 * (var(34) := 7) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 210, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 4, 9)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8051
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 210
elem = 5
ignorehitpause = 1

[State 210, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 210, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Medium Punch >==
[Statedef 211]
type = S
physics = S
movetype = A
anim = 211
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 211, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 211, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
channel = 1

[State 211, FX]
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

[State 211, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.17, -6.33), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 76), var(33) := -50
hitsound = -1 * (var(34) := 7) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 211, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 4, 9)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8051
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 211, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 211
elem = 4
ignorehitpause = 1
[State 211, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 7)
value = 211
elem = 5
ignorehitpause = 1

[State 211, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 211, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 211, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Far Hard Punch >==
[Statedef 220]
type = S
physics = S
movetype = A
anim = 220
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 5 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 7
value = 1, 8
channel = 1

[State 220, FX]
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

[State 220, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 8
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.17, -6.33), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 80), var(33) := -22
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(8) >= 0 && animelemtime(9) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 220
elem = 9
ignorehitpause = 1
[State 220, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(9) >= 0 && animelemtime(10) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 8)
value = 220
elem = 10
ignorehitpause = 1

[State 220, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 220, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I
[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Hard Punch >==
[Statedef 221]
type = S
physics = S
movetype = A
anim = 221
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 221, Snd]
type = playsnd
trigger1 = (animelem = 2 || animelem = 6) && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 221, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 6
value = 1, 8
channel = 1

[State 221, FX]
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

[State 221, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.17, -6.33), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 52), var(33) := -81
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 221, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 7
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.17, -6.33), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 90), var(33) := -60
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 221, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = ifelse(animelemtime(7) >= 0, 1, -1)
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 221, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 221
elem = 4
ignorehitpause = 1
[State 221, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 8)
value = 221
elem = 5
ignorehitpause = 1

[State 221, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 9)
value = 221
elem = 8
ignorehitpause = 1
[State 221, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(8) >= 0 && animelemtime(9) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 1, 7)
value = 221
elem = 9
ignorehitpause = 1

[State 221, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 221, Type]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I
[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Far Light Kick >==
[Statedef 230]
type = S
physics = S
movetype = A
anim = 230
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 58), var(33) := -66
hitsound = -1 * (var(34) := 3) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 230, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Light Kick >==
[Statedef 231]
type = S
physics = S
movetype = A
anim = 231
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 231, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 231
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 231, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 231, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 65), var(33) := -56
hitsound = -1 * (var(34) := 3) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 231, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 7)
value = 231
elem = 3
ignorehitpause = 1

[State 231, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 231, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Far Medium Kick >==
[Statedef 240]
type = S
physics = S
movetype = A
anim = 240
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 4
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8011) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 70), var(33) := -64
hitsound = -1 * (var(34) := 4) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 240, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 240
elem = 6
ignorehitpause = 1

[State 240, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Medium Kick >==
[Statedef 241]
type = S
physics = S
movetype = A
anim = 241
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 241, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 241, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 241, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8011) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 68), var(33) := -56
hitsound = -1 * (var(34) := 4) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 241, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 7)
value = 241
elem = 3
ignorehitpause = 1

[State 241, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 241, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Far Hard Kick >==
[Statedef 250]
type = S
physics = S
movetype = A
anim = 250
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 82), var(33) := -62
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6 && prevstateno = 700
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3, -6), -5
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3, -6), -5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 82), var(33) := -62
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Close Hard Kick >==
[Statedef 251]
type = S
physics = S
movetype = A
anim = 251
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 251, Snd]
type = playsnd
trigger1 = (animelem = 3 || animelem = 6) && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 251, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 1, 5
channel = 1

[State 251, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 92), var(33) := -58
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 251, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 94), var(33) := -78
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 251, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Crouching Light Punch >==
[Statedef 400]
type = C
physics = C
movetype = A
anim = 400
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 400, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 400, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 54), var(33) := -40
hitsound = -1 * (var(34) := 0) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 400, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 7)
value = 400
elem = 3
ignorehitpause = 1

[State 400, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouching Medium Punch >==
[Statedef 410]
type = C
physics = C
movetype = A
anim = 410
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 410, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
channel = 1

[State 410, FX]
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

[State 410, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 74), var(33) := -34
hitsound = -1 * (var(34) := 7) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 410, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 4, 9)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8051
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 410, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 9)
value = 410
elem = 4
ignorehitpause = 1
[State 410, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 7)
value = 410
elem = 5
ignorehitpause = 1

[State 410, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 410, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouching Hard Punch >==
[Statedef 420]
type = C
physics = C
movetype = A
anim = 420
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 420, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 8
channel = 1

[State 420, FX]
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

[State 420, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 56), var(33) := -58
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 420, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4 && !movecontact && !movereversed
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 30), var(33) := -106
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 420, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 420, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 420
elem = 4
ignorehitpause = 1
[State 420, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 0, 6)
value = 420
elem = 5
ignorehitpause = 1

[State 420, Snd]
type = playsnd
trigger1 = animelem = 8
value = 7, 0
channel = 1

[State 420, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Rolling Hard Punch >==
[Statedef 425]
type = C
physics = N
movetype = A
anim = 425
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 425, Vel];77.5
type = velset
trigger1 = animelem = 2
x = 3.875
[State 425, Vel]
type = velset
trigger1 = animelem = 10
x = 0

[State 425, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 425, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 8
channel = 1

[State 425, FX]
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

[State 425, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 36), var(33) := -38
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 425, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 425, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 9)
value = 425
elem = 5
ignorehitpause = 1
[State 425, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 1, 7)
value = 425
elem = 6
ignorehitpause = 1
[State 425, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 0, 5)
value = 425
elem = 7
ignorehitpause = 1
[State 425, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 0, 2)
value = 425
elem = 8
ignorehitpause = 1

[State 425, Snd]
type = playsnd
trigger1 = !animtime
value = 7, 0
channel = 1

[State 425, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 425, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouching Light Kick >==
[Statedef 430]
type = C
physics = C
movetype = A
anim = 430
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 430, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 430, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 430, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 56), var(33) := -6
hitsound = -1 * (var(34) := 3) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 430, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 430
elem = 3
ignorehitpause = 1

[State 430, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouching Medium Kick >==
[Statedef 440]
type = C
physics = C
movetype = A
anim = 440
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 440, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8011) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -14
hitsound = -1 * (var(34) := 4) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 440, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 440
elem = 3
ignorehitpause = 1

[State 440, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouching Hard Kick >==
[Statedef 450]
type = C
physics = C
movetype = A
anim = 450
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 450, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -8
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = -1.33, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
yaccel = 0.65
fall = 1
fall.recover = 1
fall.recovertime = 120;33
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 86), var(33) := -28
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 450, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 450
elem = 5
ignorehitpause = 1

[State 450, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Jumping Light Punch >==
[Statedef 600]
type = A
physics = N
movetype = A
anim = 600
ctrl = 0
sprpriority = 1
poweradd = 0

[State 600, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 600, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 36), var(33) := -48
hitsound = -1 * (var(34) := 0) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 600, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 600
elem = 3
ignorehitpause = 1

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Jumping Medium Punch >==
[Statedef 610]
type = A
physics = N
movetype = A
anim = 610
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 610, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
channel = 1

[State 610, FX]
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

[State 610, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -68
hitsound = -1 * (var(34) := 7) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 610, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 4, 9)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8051
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 610, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 9)
value = 610
elem = 4
ignorehitpause = 1
[State 610, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 7)
value = 610
elem = 5
ignorehitpause = 1

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 610, Accel]
type = gravity
trigger1 = time >= 0
[State 610, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Jumping Hard Punch >==
[Statedef 620]
type = A
physics = N
movetype = A
anim = 620
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 620, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 8
channel = 1

[State 620, FX]
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

[State 620, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 56), var(33) := -82
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4 && !movecontact && !movereversed
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 30), var(33) := -122
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 620, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 620
elem = 4
ignorehitpause = 1
[State 620, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 1, 7)
value = 620
elem = 5
ignorehitpause = 1

[State 620, Snd]
type = playsnd
trigger1 = animelem = 8
value = 7, 0
channel = 1

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 620, Accel]
type = gravity
trigger1 = time >= 0
[State 620, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Jumping Light Kick >==
[Statedef 630]
type = A
physics = N
movetype = A
anim = 630
ctrl = 0
sprpriority = 1
poweradd = 0

[State 630, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 630, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 66), var(33) := -44
hitsound = -1 * (var(34) := 3) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 630, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 630
elem = 3
ignorehitpause = 1

[State 630, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 630, Accel]
type = gravity
trigger1 = time >= 0
[State 630, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Jumping Medium Kick >==
[Statedef 640]
type = A
physics = N
movetype = A
anim = 640
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 640, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -1.62, -3.23), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8011) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 66), var(33) := -44
hitsound = -1 * (var(34) := 4) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 640, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 640
elem = 3
ignorehitpause = 1

[State 640, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 640, Accel]
type = gravity
trigger1 = time >= 0
[State 640, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Jumping Hard Kick >==
[Statedef 650]
type = A
physics = N
movetype = A
anim = 650
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 650, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 52), var(33) := -36
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 650, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 5, 11)
value = 650
elem = 3
ignorehitpause = 1

[State 650, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 650, Accel]
type = gravity
trigger1 = time >= 0
[State 650, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Kamui Fumu Kesupu >==
[Statedef 655]
type = A
physics = N
movetype = A
anim = 655
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 655, Vel]
type = velset
trigger1 = !time && vel y > 0
y = 0

[State 655, Snd]
type = playsnd
trigger1 = animelem = 6 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 655, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
channel = 1

[State 655, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 7
ID = 655
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 10 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 25
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = -4, 8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + (var(30) := 8012) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 48), var(33) := -58
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 655, p2state]
type = targetstate
trigger1 = movehit && numtarget(655)
trigger1 = !(target(655), time)
trigger1 = (target(655), stateno = 5000) || (target(655), stateno = 5010)
value = 5980
ID = 655
ignorehitpause = 1

[State 655, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 655, Accel]
type = gravity
trigger1 = time >= 0
[State 655, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;--- Target Slammed Against Ground ---
[Statedef 5980]
type = A
movetype = H
physics = N
velset = 0, 0
[State 5980, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5980), 5980, 5012)
[State 5980, End]
type = selfstate
trigger1 = hitshakeover && pos y < 0
value = 5030
[State 5980, End]
type = changestate
trigger1 = hitshakeover && pos y >= 0
value = 5981

[Statedef 5981]
type = L
movetype = H
physics = N
velset = 0, 0
[State 5981, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)
[State 5981, Pos]
type = posset
trigger1 = 1
y = 0
[State 5981, hurt]
type = hitfalldamage
trigger1 = !time
[State 5981, Shake]
type = envshake
trigger1 = !time
time = 14
ampl = -4
[State 5981, Snd]
type = playsnd
trigger1 = !time
value = f7, 1
[State 5981, FX]
type = explod
trigger1 = !time
anim = f61
postype = p1
pos = 0, 0
sprpriority = -3
[State 5981, End]
type = changestate
trigger1 = !animtime
value = 5982


[Statedef 5982]
type = L
movetype = H
physics = N
[State 5982, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)
[State 5982, Pos]
type = posset
trigger1 = !time
y = 0
[State 5982, Vel]
type = velset
trigger1 = !time
y = -2.4
[State 5982, accel]
type = veladd
trigger1 = 1
y = 0.6
[State 5982, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 12
value = 5110


;=< Mamahaha Light Punch >==
[Statedef 670]
type = A
physics = N
movetype = A
anim = 670
ctrl = 0
velset = 0, 0
sprpriority = -2
poweradd = 18 * !var(20)

[State 670, timer]
type = varadd
trigger1 = 1
var(46) = -1
[State 670, Vel]
type = velset
trigger1 = 1
x = 0
y = sin(gametime / 16.0 * pi) * 0.5

[State 670, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 670, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 670, FX]
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

[State 670, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
air.velocity = ifelse(var(20), -2.16, -4.31), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 64), var(33) := -68
hitsound = -1 * (var(34) := 6) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 670, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 3, 7)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8050
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 670, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 670
elem = 4
ignorehitpause = 1
[State 670, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 7)
value = 670
elem = 5
ignorehitpause = 1

[State 670, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 670, End]
type = changestate
trigger1 = !animtime
value = 1510


;=< Mamahaha Medium Punch >==
[Statedef 675]
type = A
physics = N
movetype = A
anim = 675
ctrl = 0
velset = 0, 0
sprpriority = -2
poweradd = 18 * !var(20)

[State 675, timer]
type = varadd
trigger1 = 1
var(46) = -1
[State 675, Vel]
type = velset
trigger1 = 1
x = 0
y = sin(gametime / 16.0 * pi) * 0.5

[State 675, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 675, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 8
channel = 1

[State 675, FX]
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

[State 675, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 50), var(33) := -68
hitsound = -1 * (var(34) := 7) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 675, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 4, 9)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8051
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 675, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 675
elem = 4
ignorehitpause = 1
[State 675, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 1, 6)
value = 675
elem = 5
ignorehitpause = 1

[State 675, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 675, End]
type = changestate
trigger1 = !animtime
value = 1510


;=< Mamahaha Hard Punch >==
[Statedef 660]
type = A
physics = N
movetype = A
anim = 660
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 660, Snd]
type = playsnd
trigger1 = time = 2 && random < 500
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 660, Snd]
type = playsnd
trigger1 = !((time -2) % 9)
value = 1, 8
channel = 1

[State 660, Pos]
type = posadd
trigger1 = !time
y = -32

[State 660, FX]
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

[State 660, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = time = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -10.47, -20.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
sparkno = -1 + (var(30) := 8015) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -26
hitsound = -1 * (var(34) := 8) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 660, Blood]
type = helper
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 660, Anim]
type = changeanim
triggerall = movecontact = 1 && hitpausetime
triggerall = animelemtime(3) >= 0
trigger1 = hitpausetime = ifelse(var(20), 5, 11)
trigger2 = hitpausetime = ifelse(var(20), 3, 9)
trigger3 = hitpausetime = ifelse(var(20), 2, 8)
trigger4 = hitpausetime = ifelse(var(20), 0, 6)
trigger5 = hitpausetime = ifelse(var(20), 0, 5)
trigger6 = hitpausetime = ifelse(var(20), 0, 3)
trigger7 = hitpausetime = ifelse(var(20), 0, 1)
value = 660
elem = ifelse(animelemtime(10) >= 0, 3, animelemno(0) + 1)
ignorehitpause = 1

[State 660, Accel]
type = veladd
trigger1 = 1
y = 0.64
[State 660, End]
type = changestate
trigger1 = pos y > -vel y
value = 1591


;=< Mamahaha Light Kick >==
[Statedef 680]
type = A
physics = N
movetype = A
anim = 680
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 680, timer]
type = varadd
trigger1 = 1
var(46) = -1
[State 680, Vel]
type = velset
trigger1 = 1
x = 0
y = sin(gametime / 16.0 * pi) * 0.5

[State 680, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 680, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 680, FX]
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

[State 680, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8010) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 66), var(33) := -43
hitsound = -1 * (var(34) := 4) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 680, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 680, End]
type = changestate
trigger1 = !animtime
value = 1510


;=< Mamahaha Medium Kick >==
[Statedef 685]
type = A
physics = N
movetype = A
anim = 685
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 685, timer]
type = varadd
trigger1 = 1
var(46) = -1
[State 685, Vel]
type = velset
trigger1 = 1
x = 0
y = sin(gametime / 16.0 * pi) * 0.5

[State 685, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 685, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 685, FX]
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

[State 685, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -4.30, -7.51)
air.velocity = ifelse(var(20), -3.23, -6.46), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.49, -14.01)
air.cornerpush.veloff = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
sparkno = -1 + (var(30) := 8011) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 52), var(33) := -28
hitsound = -1 * (var(34) := 5) * 0
guardsound = -1 * (var(35) := 0) * 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 685, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 685, End]
type = changestate
trigger1 = !animtime
value = 1510


;=< Throw Attempt >==
[Statedef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "2k")
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = (random < 500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0
[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + (var(30) := 0) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -50
hitsound = -1 * (var(34) := 800) * 0
guardsound = -1 * (var(35) := 0) * 0
yaccel = 0.5
fall = 1
fall.recover = 1
numhits = 0
p1stateno = ifelse(command = "holdback", 805, 810)

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10)
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + (var(30) := 0) * 0
guard.sparkno = -1 + (var(31) := 8000) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -50
hitsound = -1 * (var(34) := 800) * 0
guardsound = -1 * (var(35) := 0) * 0
yaccel = 0.5
fall = 1
fall.recover = 1
numhits = 0
p1stateno = ifelse(command = "holdback", 805, 820)

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 800, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER TURNS ---
[Statedef 805]
type = S
movetype = A
physics = S
anim = 805
ctrl = 0
sprpriority = 0
[State 805, throw]
type = targetstate
trigger1 = !time && numtarget
value = 806
[State 805, throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1
[State 805, width]
type = width
trigger1 = 1
edge = 24, 24

[State 805, Turn]
type = turn
trigger1 = animelem = 3
[State 805, facing]
type = targetfacing
trigger1 = 1
value = -1

[State 805, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 805, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 805, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0 || animelemtime(4) >= 0
pos = ceil(42 * const(size.xscale)), 0
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
pos = ceil(21 * const(size.xscale)), 0

[State 805, spr]
type = sprpriority
trigger1 = animelemtime(2) < 0 || animelemtime(4) >= 0
value = 1
[State 805, spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
value = -1

[State 805, End]
type = changestate
trigger1 = !numtarget
value = 0
ctrl = 1
[State 805, End]
type = changestate
trigger1 = animelemtime(4) >= 0
value = ifelse(var(10), 820, 810)


;--- TARGET ---
[Statedef 806]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 806, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806
[State 806, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 806, PalFX Off]
type = palfx
trigger1 = !time
time = 1
[State 806, Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;=< Guard Destroyer >==
[Statedef 810]
type = S
physics = S
movetype = A
anim = 810
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 820, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 810, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 810, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 810, throw]
type = targetstate
trigger1 = !time && numtarget
value = 815
[State 810, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 810, width]
type = width
trigger1 = animelemtime(3) < 0
edge = 34, 0
[State 810, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
edge = 56, 0

[State 810, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 40, 0
[State 810, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 8, 0
[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 3
pos = 52, 0

[State 810, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 3
value = 36
[State 810, getpower]
type = poweradd
trigger1 = numtarget && animelem = 3 && !var(20)
value = 72

[State 810, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 3
value = ceil(ifelse(35 * fvar(11) < 7, -7, -35 * fvar(11)))
kill = 0

[State 810, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 3
value = 1
[State 810, hitcount]
type = varadd
trigger1 = numtarget
trigger1 = animelem = 3
var(13) = 1

[State 810, throw]
type = targetstate
trigger1 = animelem = 3
value = 816

[State 810, sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0
[State 810, sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 810, hitsound]
type = playsnd
trigger1 = numtarget && animelem = 3
value = 2, 3
channel = 2
[State 810, Sparks]
type = helper
trigger1 = numtarget && animelem = 3
helpertype = normal
stateno = 8011
ID = 8000
name = "Spark"
postype = p1
pos = 51, -48
facing = -1
ownpal = 1
size.xscale = 1 ;0.5
size.yscale = 1 ;0.5
pausemovetime = 65535
supermovetime = 65535

[State 810, slash]
type = changestate
trigger1 = numtarget
trigger1 = animelemtime(3) > 0 && animelemtime(6) < 0
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
value = 830
[State 810, sweep]
type = changestate
trigger1 = numtarget
trigger1 = animelemtime(3) > 0 && animelemtime(6) < 0
trigger1 = !AIlevel && (command = "a" || command = "b" || command = "c")
value = 840
[State 810, AI]
type = changestate
trigger1 = numtarget
trigger1 = animelem = 5 && AIlevel
value = ifelse(random < 333, 840, 830)

[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 815]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 815, Anim]
type = changeanim2
trigger1 = !time
value = 815
[State 815, spr]
type = sprpriority
trigger1 = 1
value = ifelse(animelemtime(2) >= 0, 2, 0)
[State 815, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1
[State 815, PalFX Off]
type = palfx
trigger1 = !time
time = 1
[State 815, End]
type = selfstate
trigger1 = time >= 120
value = 0
ctrl = 1


[Statedef 816]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2
[State 815, Anim]
type = changeanim2
trigger1 = !time
value = 816
[State 816, Vel]
type = velmul
trigger1 = 1
x = 0.95
[State 816, Vel]
type = velset
trigger1 = !time
x = -2
[State 816, End]
type = selfstate
trigger1 = time >= 30
value = 0
ctrl = 1


;=< kick throw >==
[Statedef 820]
type = A
physics = N
movetype = A
anim = 820
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 820, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 820, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 820, throw]
type = targetstate
trigger1 = !time && numtarget
value = 825
[State 820, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 820, juggle]
type = varadd
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1
[State 820, juggle]
type = varset
trigger1 = !time && numtarget
var(27) = 1
ignorehitpause = 1

[State 820, width]
type = width
trigger1 = animelemtime(7) < 0
edge = 48, 0
[State 820, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 820, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) < 0
pos = 42 + target, const(size.ground.front), 0

[State 820, Bind 7]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 0, target, const(size.mid.pos.y)
[State 820, Bind 8]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(11) < 0
pos = 0, ceil((target, const(size.mid.pos.y) + target, const(size.head.pos.y)) / 2)
;pos = target, const(size.ground.front), y

[State 820, damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
value = ceil(ifelse(39 * fvar(11) < 7, -7, -39 * fvar(11)))
kill = (animelem = 11)

[State 820, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 11
value = 36
[State 820, getpower]
type = poweradd
trigger1 = numtarget && animelem = 11 && !var(20)
value = 72

[State 820, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
value = 1
[State 820, hitcount]
type = varadd
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
var(13) = 1

[State 820, throw]
type = targetstate
trigger1 = animelem = 11
value = 826

[State 820, whiffsound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
value = 1, 5
channel = 1
[State 820, hitsound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
value = 2, 5
channel = 2
[State 820, Sparks]
type = helper
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 11
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = ceil(p2dist x), ifelse((animelem = 2), -52, ifelse((animelem = 4), -58, 8))
;pos = ifelse((animelem = 2), 64, ifelse((animelem = 4), 88, 12)), ifelse((animelem = 2), -56, ifelse((animelem = 4), -59, -4))
facing = -1
ownpal = 1
size.xscale = 1 ;0.5
size.yscale = 1 ;0.5
pausemovetime = 65535
supermovetime = 65535

[State 820, End]
type = changestate
trigger1 = animelemtime(11) = 1
value = 821


;--- Jump back ---
[Statedef 821]
type = A
movetype = A
physics = N
sprpriority = 1

[State 821, Vel]
type = veladd
trigger1 = 1
y = 0.5
[State 821, Vel]
type = velset
trigger1 = !time
x = -1
y = -8

[State 821, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 822


;--- Land ---
[Statedef 822]
type = S
physics = N
movetype = I
anim = 0
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 822, Pos]
type = posset
trigger1 = 1
y = 0

[State 822, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 822, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 822, End]
type = changestate
trigger1 = 1
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 825]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 825, Anim]
type = changeanim2
trigger1 = !time
value = 825
[State 825, PalFX Off]
type = palfx
trigger1 = !time
time = 1
[State 825, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1


[Statedef 826]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 826, Anim]
type = changeanim
trigger1 = !time
value = 5030
[State 826, Anim]
type = changeanim
trigger1 = selfanimexist(5035)
trigger1 = anim = 5030 && !animtime
value = 5035
[State 826, Anim]
type = changeanim
trigger1 = !selfanimexist(5035)
trigger1 = anim = 5030 && !animtime
trigger2 = anim = 5035 && !animtime
value = 5050

[State 826, Vel]
type = veladd
trigger1 = 1
y = 0.5
[State 826, Vel]
type = velset
trigger1 = !time
x = -2.66
y = -6

[State 826, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 826, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;=< Slash >==
[Statedef 830]
type = S
physics = N
movetype = A
anim = 830
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 830, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 830, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 830, juggle]
type = varadd
trigger1 = animelem = 8 && numtarget
var(14) = 1
ignorehitpause = 1
[State 830, juggle]
type = varset
trigger1 = animelem = 8 && numtarget
var(27) = 1
ignorehitpause = 1

[State 830, width]
type = width
trigger1 = animelemtime(8) >= 0 && animelemtime(11) < 0
edge = 64, 0

[State 830, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 8
value = ceil(ifelse(76 * fvar(11) < 7, -7, -76 * fvar(11)))
kill = 1

[State 830, Hit]
type = hitadd
trigger1 = numtarget && animelem = 8
value = 1
[State 830, hitcount]
type = varadd
trigger1 = numtarget && animelem = 8
var(13) = 1

[State 830, throw]
type = targetstate
trigger1 = animelem = 8
value = 835

[State 830, FX]
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

[State 830, whiffsound]
type = playsnd
trigger1 = numtarget && animelem = 7
value = 1, 8
channel = 1
[State 830, hitsound]
type = playsnd
trigger1 = numtarget && animelem = 8
value = 2, 8
channel = 2

[State 830, Sparks]
type = helper
trigger1 = numtarget && animelem = 8
helpertype = normal
stateno = 8015
ID = 8000
name = "Spark"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < 80, ceil(p2dist x), 72)), -22
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535
[State 830, Blood]
type = helper
trigger1 = numtarget && animelem = 8
helpertype = normal
stateno = 8052
ID = 8050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < 72, ceil(p2dist x), 72)), -42
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 830, Pause]
type = changeanim
trigger1 = numtarget
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger1 = time < 60 && target, stateno = 835
value = 830
elem = 10

[State 830, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 835]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 835, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 835, Anim]
type = changeanim
trigger1 = 1
value = 5012
[State 835, End]
type = changestate
trigger1 = time >= 12
value = 836


[Statedef 836]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 836, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5035), 5035, 5050)
[State 836, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 836, Vel]
type = veladd
trigger1 = 1
y = 0.6
[State 836, Vel]
type = velset
trigger1 = !time
x = -6
y = -4

[State 836, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 836, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5100


;=< Sweep >==
[Statedef 840]
type = S
physics = N
movetype = A
anim = 840
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 840, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 840, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 840, juggle]
type = varadd
trigger1 = animelem = 4 && numtarget
var(14) = 1
ignorehitpause = 1
[State 840, juggle]
type = varset
trigger1 = animelem = 4 && numtarget
var(27) = 1
ignorehitpause = 1

[State 840, width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
edge = 84, 0

[State 840, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 4
value = ceil(ifelse(76 * fvar(11) < 7, -7, -76 * fvar(11)))
kill = 1

[State 840, Hit]
type = hitadd
trigger1 = numtarget && animelem = 4
value = 1
[State 840, hitcount]
type = varadd
trigger1 = numtarget && animelem = 4
var(13) = 1

[State 840, throw]
type = targetstate
trigger1 = animelem = 4
value = 845

[State 840, whiffsound]
type = playsnd
trigger1 = numtarget && animelem = 2
value = 1, 5
channel = 1
[State 840, hitsound]
type = playsnd
trigger1 = numtarget && animelem = 4
value = 2, 5
channel = 2

[State 840, Sparks]
type = helper
trigger1 = numtarget && animelem = 4
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < 84, ceil(p2dist x), 84)), -30
facing = -1
ownpal = 1
size.xscale = 1 ;0.5
size.yscale = 1 ;0.5
pausemovetime = 65535
supermovetime = 65535

[State 840, Pause]
type = changeanim
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger1 = time < 60 && target, stateno = 845
value = 840
elem = 5

[State 840, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 845]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 845, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 845, Anim]
type = changeanim
trigger1 = 1
value = 5070
[State 845, End]
type = changestate
trigger1 = time >= 12
value = 846


[Statedef 846]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 846, Vel]
type = veladd
trigger1 = 1
y = 0.6

[State 846, Vel]
type = velset
trigger1 = !time
x = -1
y = -8

[State 846, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 846, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5110


;=< Air Throw Attempt >==
[Statedef 850]
type = A
physics = N
movetype = A
anim = 850
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 850, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 1
trigger1 = !var(38)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + (var(30) := 0) * 0
guard.sparkno = -1 + (var(31) := 8500) * 0
sparkxy = -10 + 0 * (var(32) := 40), var(33) := -50
hitsound = -1 * (var(34) := 800) * 0
guardsound = -1 * (var(35) := 0) * 0
yaccel = 0.5
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 860

[State 850, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 850, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 850, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 850, Accel]
type = gravity
trigger1 = time >= 0
[State 850, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;=< Rera Kishima Tek >==
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 860, throw]
type = targetstate
trigger1 = !time && numtarget
value = 865
[State 860, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, juggle]
type = varadd
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1
[State 860, juggle]
type = varset
trigger1 = !time && numtarget
var(27) = 1
ignorehitpause = 1

[State 860, width]
type = width
trigger1 = 1
edge = 48, 0

[State 860, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 40, -64
[State 860, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -2, -38
[State 860, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -28, -50
[State 860, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -2, -86
[State 860, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 40, -64
[State 860, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 12, -20
[State 860, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0
pos = 6, -16

[State 860, sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 0
channel = 0
[State 860, sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 7
value = 1, 5
channel = 1

[State 860, Vel]
type = veladd
trigger1 = animelemtime(7) >= 0
y = 0.5
[State 860, Vel]
type = velset
trigger1 = animelem = 7
y = 8

[State 860, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 861


;--- Hit Ground ---
[Statedef 861]
type = A
physics = N
movetype = A
anim = 861
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 861, throw]
type = targetstate
trigger1 = !time && numtarget
value = 866
[State 861, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 861, width]
type = width
trigger1 = 1
edge = 48, 0

[State 861, Pos]
type = posset
trigger1 = !time
y = 0

[State 861, Bind 1]
type = targetbind
trigger1 = !time && numtarget
pos = 6, 0

[State 861, damage]
type = targetlifeadd
trigger1 = !time && numtarget
value = ceil(ifelse(111 * fvar(11) < 7, -7, -111 * fvar(11)))

[State 861, givepower]
type = targetpoweradd
trigger1 = !time && numtarget
value = 36
[State 861, getpower]
type = poweradd
trigger1 = !time && numtarget && !var(20)
value = 72

[State 861, hitcount]
type = varadd
trigger1 = !time && numtarget
var(13) = 1

[State 861, FX]
type = playsnd
trigger1 = !time
value = 0, 5100
[State 861, FX]
type = explod
trigger1 = !time
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
ownpal = 1

[State 861, throw]
type = targetstate
trigger1 = animelem = 2
value = 867

[State 861, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.375
[State 861, Vel]
type = velset
trigger1 = animelem = 2
x = -5
y = -4.4375

[State 861, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0 && pos y > -vel y
value = 862


;--- Land ---
[Statedef 862]
type = S
physics = N
movetype = I
anim = 47
ctrl = 1
velset = 0, 0
sprpriority = 1

[State 862, Pos]
type = posset
trigger1 = 1
y = 0

[State 862, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 862, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 862, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 865]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 865, Anim]
type = changeanim2
trigger1 = !time
value = 865
[State 865, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 865, PalFX Off]
type = palfx
trigger1 = !time
time = 1

[Statedef 866]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 866, Anim]
type = changeanim2
trigger1 = !time
value = 866
[State 866, End]
type = selfstate
trigger1 = time >= 30
value = 5110


[Statedef 867]
type = L
physics = N
movetype = H
ctrl = 0
anim = 5160
velset = 0, 0
sprpriority = 0

[State 867, Vel]
type = veladd
trigger1 = 1
y = 0.5
[State 867, Vel]
type = velset
trigger1 = !time
x = -2
y = -3.25

[State 867, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 867, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5110


;===< Target Escaped >==
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0
[State 890, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 895
[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, Pos]
type = posadd
trigger1 = !time
x = 24

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0
[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000, 0
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 0, 760

[State 890, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p1
pos = 0, -48
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5945), 5945, 130)
[State 895, Anim]
type = changeanim
trigger1 = !time && !selfanimexist(5945) && selfanimexist(5910)
value = 5910
[State 895, Anim]
type = changeanim
trigger1 = time >= 20 && anim = 130
value = 140

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 895, Push]
type = playerpush
trigger1 = 1
value = 0

[State 895, Pos]
type = posset
trigger1 = !time
y = 0
[State 895, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 27
value = 0
ctrl = 1
