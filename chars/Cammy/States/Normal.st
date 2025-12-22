; ________________________________
;| Cammy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====< NORMAL MOVES >====
;==

;===< Standing Far Light Punch >==
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
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 79), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Light Punch >==
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
trigger1 = animelem = 2 && random < 200
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 201, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 201, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -85
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 201, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Far Medium Punch >==
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
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 92), var(36) := -72
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 210, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 210
elem = 4
ignorehitpause = 1

[State 210, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Medium Punch >==
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 211, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 211, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 52), var(36) := -54
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 211, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3 && !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 42), var(36) := -112
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 211, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 211, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Far Hard Punch >==
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
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 62), var(36) := -52
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 && !movecontact && !movereversed
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -64
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Hard Punch >==
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
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 221, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 221, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 78), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 221, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Far Light Kick >==
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
trigger1 = animelem = 2 && random < 200
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 67), var(36) := -78
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 230, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Light Kick >==
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
trigger1 = animelem = 2 && random < 200
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 231, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 231, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -68
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 231, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 231, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Far Medium Kick >==
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
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -74
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 240, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 && prevstateno = 700
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
ground.velocity = -6.48, -5.25
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;ifelse(var(20), 19, 24)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -74
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 240, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 240
elem = 5
ignorehitpause = 1

[State 240, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Medium Kick >==
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 241, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 241, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 36), var(36) := -68
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 241, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
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


;===< Standing Far Hard Kick >==
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
trigger1 = animelem = 3 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
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
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -58
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5 && !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 110), var(36) := -58
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 250
elem = 6
ignorehitpause = 1

[State 250, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Standing Close Hard Kick >==
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
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 251, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
channel = 1

[State 251, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 251, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 6 && !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 58), var(36) := -120
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 251, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(6) > 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 251
elem = 7
ignorehitpause = 1

[State 251, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Crouching Light Punch >==
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
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 400, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 71), var(36) := -35
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 400, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Crouching Medium Punch >==
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
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 410, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = C, NA
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -32
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 410, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 410
elem = 4
ignorehitpause = 1

[State 410, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Crouching Hard Punch >==
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 420, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 92), var(36) := -83
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 420, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Crouching Light Kick >==
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
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 430, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 430, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -3
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 430, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Crouching Medium Kick >==
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
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
ground.velocity = ifelse(var(20), -5.05, -9.03), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 118), var(36) := -4
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 440, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Crouching Hard Kick >==
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
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -8.24
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
fall.recover = 1
fall.recovertime = 120;33
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 106), var(36) := -14
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 450, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Jumping Light Punch >==
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
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 600, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 49), var(36) := -43
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Jumping Medium Punch >==
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
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 610, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
air.type = High
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 12 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 44), var(36) := -38
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 610, Accel]
type = gravity
trigger1 = time >= 0
[State 610, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Jumping Hard Punch >==
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 620, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (1 + hitcount) || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
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
ground.hittime = 12 + 4 * var(9)
ground.slidetime = 12 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 76), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 620, Accel]
type = gravity
trigger1 = time >= 0
[State 620, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Jumping Light Kick >==
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
value = 4, ifelse(random < 500, 0, 3)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 3
channel = 1

[State 630, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.12, -5.41)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 91), var(36) := -49
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 630, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 630, Accel]
type = gravity
trigger1 = time >= 0
[State 630, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Jumping Medium Kick >==
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
value = 4, ifelse(random < 500, 4, 5)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 12 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.05, -9.03)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 66), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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


;===< Jumping Hard Kick >==
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.hittime = 12 + 4 * var(9)
ground.slidetime = 12 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.41), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 74), var(36) := -46
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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


;===< Throw Attempt >==
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

[State 800, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "kk")
[State 800, Button AI]
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

[State 800, Guard Dist]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 810

[State 800, Hit]
type = hitdef
trigger1 = animelem = 3 && var(10)
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
fall.xvelocity = 3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = ifelse(command = "holdback", 820, 805)

[State 800, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 8
channel = 0
[State 800, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
channel = 1

[State 800, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
sprpriority = 1

[State 805, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 806
[State 805, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 805, Width]
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
pos = ceil(34 * const(size.xscale)), 0
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
pos = ceil(11 * const(size.xscale)), 0

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
sprpriority = 2

[State 806, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 806, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806

[State 806, Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;===< Hooligan Suplex >==
[Statedef 810]
type = S
physics = N
movetype = A
anim = 810
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 810, Safety]
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

[State 810, Turn Var]
type = varset
trigger1 = !time
var(0) = 0
[State 810, Turn Var]
type = varset
trigger1 = !time
trigger1 = !AIlevel && command = "holdback"
var(0) = 1

[State 810, Turn]
type = turn
trigger1 = !time && var(0)

[State 810, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 815
[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 810, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
edge = 47, 0
[State 810, Width]
type = width
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
edge = 81, 0

[State 810, Bind 1]
type = bindtotarget
trigger1 = !var(0)
trigger1 = numtarget && animelemtime(2) < 0
pos = -35, 0
[State 810, Bind 1]
type = targetbind
trigger1 = var(0)
trigger1 = numtarget && animelemtime(2) < 0
pos = ceil(-35 * const(size.xscale)), 0

[State 810, Bind 2]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -52, 0
[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(-62 * const(size.xscale)), 0
[State 810, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(-48 * const(size.xscale)), ceil(-2 * const(size.yscale))
[State 810, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(-46 * const(size.xscale)), ceil(-4 * const(size.yscale))
[State 810, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = ceil(-20 * const(size.xscale)), ceil(-64 * const(size.yscale))
[State 810, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = ceil(42 * const(size.xscale)), ceil(-56 * const(size.yscale))
[State 810, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
pos = ceil(81 * const(size.xscale)), 0

[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 8
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1

[State 810, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 8
value = 36
[State 810, Power]
type = poweradd
trigger1 = numtarget && animelem = 8 && !var(20)
value = 72

[State 810, Hit]
type = hitadd
trigger1 = numtarget && animelem = 8
value = 1
[State 810, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 8
var(13) = 1

[State 810, Juggle]
type = varadd
trigger1 = numtarget && animelem = 8
var(15) = 1
ignorehitpause = 1
[State 810, Juggle]
type = varset
trigger1 = numtarget && animelem = 8
var(16) = 1
ignorehitpause = 1

[State 810, Throw]
type = targetstate
trigger1 = numtarget && animelem = 10
value = 816

[State 810, Sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 1
channel = 0
[State 810, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
channel = 1

[State 810, Sound]
type = playsnd
trigger1 = numtarget && animelem = 8
value = 0, 5100
[State 810, Shake]
type = envshake
trigger1 = numtarget && animelem = 8
time = 14
ampl = -4
freq = 120
[State 810, Dust]
type = helper
trigger1 = numtarget && animelem = 8
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = ceil(48 * const(size.xscale)), 0
ownpal = 1

[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 815]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 815, Anim]
type = changeanim2
trigger1 = !time
value = 815
[State 815, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 815, Pos]
type = posset
trigger1 = !time
y = 0


[Statedef 816]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 816, Anim]
type = changeanim2
trigger1 = !time
value = 816
[State 816, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 816, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 816, Vel]
type = velset
trigger1 = !time
x = -5.32
y = -6.91

[State 816, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 816, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = pos y > -vel y
trigger1 = selfanimexist(5051)
value = 5051
[State 816, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;===< Frankensteiner >==
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

[State 820, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 825
[State 820, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Width]
type = width
trigger1 = animelemtime(6) >= 0
edge = 33, 0

[State 820, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = ceil(28 * const(size.xscale)), 0
[State 820, Bind 3]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 24, 86, Head
[State 820, Bind 4]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 18, 90, Head
[State 820, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(24 * const(size.xscale)), ceil(-68 * const(size.yscale))
[State 820, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0
pos = ceil(-32 * const(size.xscale)), 0

[State 820, Bind Fix]
type = posset
trigger1 = pos y > 65
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
y = 65
[State 820, Bind Fix]
type = posset
trigger1 = pos y > 0
trigger1 = animelemtime(5) = 0
y = 0

[State 820, Vel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 0.77389375
[State 820, Vel]
type = velset
trigger1 = animelem = 5
x = -1.579375
y = -5.25

[State 820, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 6
channel = 0

[State 820, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = pos y > -vel y
value = 821


;--- Slam ---
[Statedef 821]
type = A
physics = N
movetype = A
anim = 821
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 821, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = 33, 0
[State 821, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 821, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = ceil(-32 * const(size.xscale)), 0

[State 821, Damage]
type = targetlifeadd
trigger1 = numtarget && !time
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1

[State 821, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 36
[State 821, Power]
type = poweradd
trigger1 = numtarget && !time && !var(20)
value = 72

[State 821, Hit]
type = hitadd
trigger1 = numtarget && !time
value = 1
[State 821, Hitcount]
type = varadd
trigger1 = numtarget && !time
var(13) = 1

[State 821, Juggle]
type = varadd
trigger1 = numtarget && !time
var(15) = 1
ignorehitpause = 1
[State 821, Juggle]
type = varset
trigger1 = numtarget && !time
var(16) = 1
ignorehitpause = 1

[State 821, Throw]
type = targetstate
trigger1 = numtarget && !time
value = 826
[State 821, Throw]
type = targetstate
trigger1 = numtarget && animelem = 2
value = 827

[State 821, Sound]
type = playsnd
trigger1 = numtarget && !time
value = 0, 5100
[State 821, Shake]
type = envshake
trigger1 = numtarget && !time
time = 14
ampl = -4
freq = 120
[State 821, Dust]
type = helper
trigger1 = numtarget && !time
helpertype = normal
stateno = 8110
ID = 8210
name = "Impact Dust"
postype = p1
pos = ceil(-40 * const(size.xscale)), 0
ownpal = 1

[State 821, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 1.21611875
[State 821, Vel]
type = velset
trigger1 = animelem = 2
x = 1.579375
y = -6.91

[State 821, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 822


;--- Land ---
[Statedef 822]
type = S
physics = N
movetype = I
ctrl = 0
anim = 822
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
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 822, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
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
[State 825, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 825, Pos]
type = posset
trigger1 = !time
y = 0


[Statedef 826]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 826, Anim]
type = changeanim2
trigger1 = !time
value = 826
[State 826, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 826, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 827]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 827, Anim]
type = changeanim2
trigger1 = !time
value = 827
[State 827, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 827, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 827, Vel]
type = velset
trigger1 = !time
x = 5.32
y = -6.91

[State 827, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 827, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;===< Air Throw Attempt >==
[Statedef 850]
type = A
physics = N
movetype = A
anim = 850
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 850, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "kk")
[State 850, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = (random < 500)

[State 850, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 1, 851, 850)

[State 850, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0
[State 850, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype = A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 850, Guard Dist]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 1
trigger1 = !var(38)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 860

[State 850, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 1 && var(10)
trigger1 = !var(38)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
fall.xvelocity = 3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 870

[State 850, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 8
channel = 0
[State 850, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
channel = 1

[State 850, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I
[State 850, Accel]
type = gravity
trigger1 = time >= 0
[State 850, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Flying Neck Hunt >==
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 860, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 860, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 892
[State 860, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 860, Turn]
type = turn
triggerall = !time
trigger1 = !AIlevel && command = "holdback"
trigger2 = var(58) <= 1 && backedgedist < frontedgedist

[State 860, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 865
[State 860, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
edge = 26, 0
[State 860, Width]
type = width
trigger1 = animelemtime(5) >= 0
edge = 44, 0

[State 860, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = ceil(-6 * const(size.xscale)), ceil(-122 * const(size.yscale))
[State 860, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(40 * const(size.xscale)), ceil(-90 * const(size.yscale))
[State 860, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(26 * const(size.xscale)), ceil(-16 * const(size.yscale))

[State 860, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 4 && !var(13)
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1
[State 860, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 4 && var(13)
value = floor(ifelse(69 * fvar(11) < 7, -7, -69 * fvar(11)))
kill = 1

[State 860, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 4
value = 36
[State 860, Power]
type = poweradd
trigger1 = numtarget && animelem = 4 && !var(20)
value = 72

[State 860, Hit]
type = hitadd
trigger1 = numtarget && animelem = 4
value = 1
[State 860, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 4
var(13) = 1

[State 860, Juggle]
type = varadd
trigger1 = numtarget && animelem = 4
var(15) = 1
ignorehitpause = 1
[State 860, Juggle]
type = varset
trigger1 = numtarget && animelem = 4
var(16) = 1
ignorehitpause = 1

[State 860, Throw]
type = targetstate
trigger1 = numtarget && animelem = 4
value = 866

[State 860, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0
[State 860, Sound]
type = playsnd
trigger1 = animelem = 2
value = 7, 4

[State 860, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = numtarget && animelem = 4
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 860, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.55278125
[State 860, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = pos y > -vel y
value = 861


;--- Land ---
[Statedef 861]
type = S
physics = N
movetype = I
ctrl = 0
anim = 861
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 861, Pos]
type = posset
trigger1 = 1
y = 0

[State 861, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 861, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 861, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
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


[Statedef 866]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 866, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 866, Vel]
type = veladd
trigger1 = 1
y = 0.88445
[State 866, Vel]
type = velset
trigger1 = !time
x = -9.975;-6.65
y = 6.65

[State 866, PalFX]
type = palfx
trigger1 = !time
time = 60
mul = 128, 128, 128
sinadd = 96, 96, 96, 4
[State 866, PalFX]
type = palfx
trigger1 = vel y > 0 && pos y >= 25
trigger2 = command = "recovery"
trigger2 = alive && canrecover
trigger2 = vel y > -1 && pos y >= -20
time = 0

[State 866, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 866, Shake]
type = envshake
trigger1 = vel y > 0 && pos y >= 25
time = 14
ampl = -4
freq = 120

[State 866, Anim]
type = changeanim
trigger1 = vel y > 0 && pos y >= 25
trigger1 = selfanimexist(5051)
value = 5051
[State 866, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5100


;===< Air Frankensteiner >==
[Statedef 870]
type = A
physics = N
movetype = A
anim = 870
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 870, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 51
ctrl = 1

[State 870, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 892
[State 870, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 870, Turn]
type = turn
triggerall = !time
trigger1 = !AIlevel && command = "holdfwd"
trigger2 = var(58) <= 1 && backedgedist < frontedgedist

[State 870, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 875
[State 870, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 870, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 33, 0

[State 870, Bind 3]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 8, 86, Head
[State 870, Bind 4]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 2, 90, Head
[State 870, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(8 * const(size.xscale)), ceil(-68 * const(size.yscale))
[State 870, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0
pos = ceil(-32 * const(size.xscale)), 0

[State 870, Bind Fix]
type = posset
trigger1 = pos y > 65
trigger1 = animelemtime(3) < 0
y = 65

[State 870, Vel]
type = veladd
trigger1 = time >= 9
y = 0.442225

[State 870, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 871


;--- Slam ---
[Statedef 871]
type = A
physics = N
movetype = A
anim = 871
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 871, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = 33, 0
[State 871, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 871, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = ceil(-32 * const(size.xscale)), 0

[State 871, Damage]
type = targetlifeadd
trigger1 = numtarget && !time && !var(13)
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1
[State 871, Damage]
type = targetlifeadd
trigger1 = numtarget && !time && var(13)
value = floor(ifelse(69 * fvar(11) < 7, -7, -69 * fvar(11)))
kill = 1

[State 871, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 36
[State 871, Power]
type = poweradd
trigger1 = numtarget && !time && !var(20)
value = 72

[State 871, Hit]
type = hitadd
trigger1 = numtarget && !time
value = 1
[State 871, Hitcount]
type = varadd
trigger1 = numtarget && !time
var(13) = 1

[State 871, Juggle]
type = varadd
trigger1 = numtarget && !time
var(15) = 1
ignorehitpause = 1
[State 871, Juggle]
type = varset
trigger1 = numtarget && !time
var(16) = 1
ignorehitpause = 1

[State 871, Throw]
type = targetstate
trigger1 = numtarget && !time
value = 876
[State 871, Throw]
type = targetstate
trigger1 = numtarget && animelem = 2
value = 877

[State 871, Sound]
type = playsnd
trigger1 = !time
value = 4, 1
channel = 0

[State 871, Sound]
type = playsnd
trigger1 = numtarget && !time
value = 0, 5100
[State 871, Shake]
type = envshake
trigger1 = numtarget && !time
time = 14
ampl = -4
freq = 120
[State 871, Dust]
type = helper
trigger1 = numtarget && !time
helpertype = normal
stateno = 8110
ID = 8710
name = "Impact Dust"
postype = p1
pos = ceil(-40 * const(size.xscale)), 0
ownpal = 1

[State 871, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.6633375
[State 871, Vel]
type = velset
trigger1 = animelem = 2
x = 2.66
y = -10.09

[State 871, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 872


;--- Land ---
[Statedef 872]
type = S
physics = N
movetype = I
ctrl = 0
anim = 872
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 872, Pos]
type = posset
trigger1 = 1
y = 0

[State 872, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 872, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 872, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 875]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 875, Anim]
type = changeanim2
trigger1 = !time
value = 875
[State 875, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0



[Statedef 876]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 876, Anim]
type = changeanim2
trigger1 = !time
value = 876
[State 876, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 876, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 877]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 877, Anim]
type = changeanim2
trigger1 = !time
value = 877
[State 877, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 877, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 877, Vel]
type = velset
trigger1 = !time
x = 5.32
y = -6.91

[State 877, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 877, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


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
value = 5000, 2
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 0, 760

[State 890, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8000
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


;===< Target Escaped Midair >==
[Statedef 892]
type = A
physics = N
movetype = I
anim = 892
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 892, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 48, 0
[State 892, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 897
[State 892, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 892, Pos]
type = posadd
trigger1 = !time
x = 24

[State 892, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 892, Push]
type = playerpush
trigger1 = 1
value = 0

[State 892, Freeze]
type = posfreeze
trigger1 = time < 18
value = 1

[State 892, Vel]
type = velset
trigger1 = time = 18
x = -2
y = -4
[State 892, Vel]
type = veladd
trigger1 = time > 18
y = 0.5

[State 892, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000, 2
channel = 0

[State 892, FX]
type = playsnd
trigger1 = !time
value = 3, 0
[State 892, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8000
ID = 8000
name = "Spark"
postype = p1
pos = 24, -64
facing = -1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535

[State 892, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;--- TARGET ---
[Statedef 897]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 897, Anim]
type = changeanim
trigger1 = !time
value = 152
[State 897, Anim]
type = changeanim
trigger1 = time = 18
value = 142

[State 897, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 897, Push]
type = playerpush
trigger1 = 1
value = 0

[State 897, Freeze]
type = posfreeze
trigger1 = time < 18
value = 1

[State 897, Vel]
type = velset
trigger1 = time = 18
x = -2
y = -4
[State 897, Vel]
type = veladd
trigger1 = time >= 18
y = 0.5

[State 897, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
