; _______________________________________
;| Edmond Honda by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====< NORMAL MOVES==
;==

;Standing Light Punch
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
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 86), var(36) := -58
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Medium Punch
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 94), var(36) := -64
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 210, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3 && prevstateno = 700
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
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
ground.velocity = -6.48, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 94), var(36) := -64
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 210, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Hard Punch
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
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 111 < 7, 7, fvar(11) * 111)), 0
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
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -3.25, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 53), var(36) := -98
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 104 < 7, 7, fvar(11) * 104)), 0
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
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -3.25, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 104), var(36) := -54
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Light Kick
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
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
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
sparkxy = -10 + 0 * (var(35) := 86), var(36) := -8
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 230, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Far Medium Kick
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 46), var(36) := -39
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 240, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 87), var(36) := -62
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 240, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Close Medium Kick
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 241, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 241, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 50), var(36) := -69
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 241, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 50), var(36) := -86
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 241, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 241, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Standing Hard Kick
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
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
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
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -49
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
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
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -3.25, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 87), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Harai -geri
[Statedef 255]
type = S
physics = S
movetype = A
anim = 255
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
attr = S, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
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
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 140), var(36) := -12
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 255, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 255, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;Crouching Light Punch
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
value = 4, ifelse(random < 500, 0, 1)
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
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 99), var(36) := -41
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 400, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Crouching Medium Punch
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 2
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
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 104), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 410, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Crouching Hard Punch
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
trigger1 = animelem = 1 && random < 500
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 420, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 104 < 7, 7, fvar(11) * 104)), 0
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
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 126), var(36) := -18
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 420, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Crouching Light Kick
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
value = 4, ifelse(random < 500, 0, 1)
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
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
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
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -6
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 430, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Crouching Medium Kick
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 53), var(36) := -29
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 440, Hit]
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
ground.velocity = ifelse(var(20), -3.66, -7.51), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
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
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -54
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 440, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Crouching Hard Kick
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
trigger1 = animelem = 1 && random < 500
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 0
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
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 89), var(36) := -7
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 450, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;Jumping Light Punch
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
value = 4, ifelse(random < 500, 0, 1)
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
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 81), var(36) := -55
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


;Jumping Medium Punch
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 610, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 53), var(36) := -123
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 610, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = High
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 12 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 95), var(36) := -86
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


;Angled Jumping Hard Punch
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
value = 4, ifelse(random < 500, 2, 3)
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
damage = ceil(ifelse(fvar(11) * 111 < 7, 7, fvar(11) * 111)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -56
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


;Neutral Jumping Hard Punch
[Statedef 621]
type = A
physics = N
movetype = A
anim = 620
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 621, Steer]
type = veladd
trigger1 = vel x > 0
x = ifelse(vel x > 0.125, -.125, -vel x)
[State 621, Steer]
type = velset
trigger1 = animelem = 2
x = 2.5

[State 621, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 4, ifelse(random < 500, 2, 3)
channel = 0
[State 621, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 621, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (1 + hitcount) || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 111 < 7, 7, fvar(11) * 111)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 621, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 621, Accel]
type = gravity
trigger1 = time >= 0
[State 621, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;Jumping Light Kick
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
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = animelem = 2
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
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 31), var(36) := -55
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


;Jumping Medium Kick
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 3
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
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.65
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 31), var(36) := -41
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


;Jumping Hard Kick
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
value = 4, ifelse(random < 500, 2, 3)
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
damage = ceil(ifelse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 0
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -6.48, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -8, -1
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 97), var(36) := -38
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


;Throw Attempt
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
trigger1 = animelem = 2
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
p1stateno = ifelse(command = "holdback", 810, 805)

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10)
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
p1stateno = ifelse(command = "holdback", 805, 820)

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 800
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
pos = ceil(52 * const(size.xscale)), 0
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
pos = ceil(18 * const(size.xscale)), 0

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


;Tawara Nage
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

[State 810, Turn]
type = turn
trigger1 = !time

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
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = ceil(32 * const(size.xscale)), 0
[State 810, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = ceil(48 * const(size.xscale)), 0
[State 810, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
edge = ceil(121 * const(size.xscale)), 0

[State 810, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = ceil(-32 * const(size.xscale)), ceil(-68 * const(size.yscale))
[State 810, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(10 * const(size.xscale)), ceil(-80 * const(size.yscale))
[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(36 * const(size.xscale)), ceil(-88 * const(size.yscale))
[State 810, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 4
;pos = ceil(121 * const(size.xscale)), ceil(-3 * const(size.yscale))
pos = ceil(96 * const(size.xscale)), ceil(-3 * const(size.yscale))

[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 4
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1

[State 810, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 4
value = 36
[State 810, Power]
type = poweradd
trigger1 = numtarget && animelem = 4 && !var(20)
value = 72

[State 810, Hit]
type = hitadd
trigger1 = numtarget && animelem = 4
value = 1
[State 810, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 4
var(13) = 1

[State 810, Juggle]
type = varadd
trigger1 = numtarget && animelem = 4
var(15) = 1
ignorehitpause = 1
[State 810, Juggle]
type = varset
trigger1 = numtarget && animelem = 4
var(16) = 1
ignorehitpause = 1

[State 810, Throw]
type = targetstate
trigger1 = numtarget && animelem = 4
value = 816

[State 810, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0
[State 810, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

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


[Statedef 816]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 816, Anim]
type = changeanim
trigger1 = !time
value = 5050
[State 816, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 816, Vel]
type = veladd
trigger1 = 1
y = 0.6633375
[State 816, Vel]
type = velset
trigger1 = !time
x = -9.31
y = 0

[State 816, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 816, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = selfanimexist(5051)
value = 5051
[State 816, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;Saba Ori
[Statedef 820]
type = S
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
value = 827
[State 820, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Width]
type = width
trigger1 = 1
edge = ceil(29 * const(size.xscale)), 0

[State 820, Bind 1]
type = targetbind
trigger1 = numtarget
pos = ceil(64 * const(size.xscale)) - target, const(size.ground.back), ceil(-62 * const(size.yscale))

[State 820, End]
type = changestate
trigger1 = !animtime
value = 821


 ---Mashing ---
[Statedef 821]
type = S
physics = N
movetype = A
anim = 821
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 821, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 821, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State 821, Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 821, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 826
[State 821, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 821, Width]
type = width
trigger1 = 1
edge = ceil(29 * const(size.xscale)), 0

[State 821, Timer]
type = varset
trigger1 = !time
var(44) = 135
[State 821, Timer]
type = varset
trigger1 = roundstate != 2
var(44) = 0
[State 821, Timer]
type = varadd
trigger1 = hitcount
var(44) = -1

[State 821, Timer]
type = varadd
triggerall = numtarget && hitcount
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger2 = target, command = "a" || target, command = "b" || target, command = "c"
trigger3 = target, command = "up" || target, command = "down" || target, command = "back" || target, command = "fwd"
var(44) = -1

[State 821, Mashing]
type = varset
trigger1 = !time
var(42) = 0
[State 821, Mashing]
type = varset
trigger1 = !time
var(12) = 0
[State 821, Mashing]
type = varset
triggerall = var(42) = 0
trigger1 = !AIlevel && (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = !AIlevel && (command = "up" || command = "down" || command = "back" || command = "fwd")
trigger3 = AIlevel && random < 800
var(42) = 2
[State 821, Mashing]
type = varadd
trigger1 = var(42) = 2
var(12) = 1
[State 821, Mashing]
type = varadd
trigger1 = var(42) > 0
var(42) = -1

[State 821, Anim Skip]
type = changeanim
triggerall = var(44) > 0
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(3) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 821
elem = animelemno(0) + 1
[State 821, Anim Skip]
type = changeanim
triggerall = var(44) > 0
trigger1 = animelemtime(3) > 0
trigger1 = animelemtime(3) >= (8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - animelemtime(3))
;trigger2 = !animtime
value = 821
elem = 1

[State 821, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 821, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(2) < 0 || animelemtime(3) >= 0
value = 826
[State 821, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
value = 827

[State 821, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0 || animelemtime(3) >= 0
;pos = ceil(32 * const(size.xscale)), ceil(-72 * const(size.yscale))
pos = ceil(50 * const(size.xscale)) - target, const(size.ground.back), ceil(-72 * const(size.yscale))
[State 821, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
;pos = ceil(24 * const(size.xscale)), ceil(-84 * const(size.yscale))
pos = ceil(42 * const(size.xscale)) - target, const(size.ground.back), ceil(-84 * const(size.yscale))

[State 821, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 2 && !hitcount
value = floor(ifelse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 1
[State 821, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 2 && hitcount
value = floor(ifelse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 1

[State 821, Power]
type = targetpoweradd
trigger1 = hitcount = 1
trigger1 = numtarget && animelem = 2
value = 36
[State 821, Power]
type = poweradd
trigger1 = hitcount = 1
trigger1 = numtarget && animelem = 2 && !var(20)
value = 72

[State 821, Hit]
type = hitadd
trigger1 = numtarget && animelem = 2
value = 1
[State 821, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 2
var(13) = 1

[State 821, Juggle]
type = varadd
trigger1 = numtarget && animelem = 2
var(15) = 1
ignorehitpause = 1
[State 821, Juggle]
type = varset
trigger1 = numtarget && animelem = 2
var(16) = 1
ignorehitpause = 1

[State 821, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0

[State 821, Sound]
type = playsnd
trigger1 = numtarget && animelem = 2
value = 7, 3
channel = 2
[State 821, Spark]
type = helper
trigger1 = numtarget && animelem = 2
helpertype = normal
stateno = 8013
ID = 8000
name = "Spark"
postype = p1
pos = ceil(28 * const(size.xscale)), ceil(-86 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 821, End]
type = changestate
trigger1 = var(44) <= 0
trigger1 = !animtime
trigger2 = numtarget
trigger2 = !(target, alive)
trigger3 = time >= 180
value = 822


;--- Release ---
[Statedef 822]
type = S
physics = N
movetype = A
anim = 822
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 822, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
value = 826

[State 822, Width]
type = width
trigger1 = 1
edge = ceil(29 * const(size.xscale)), 0

[State 821, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = ceil(50 * const(size.xscale)) - target, const(size.ground.back), ceil(-72 * const(size.yscale))
[State 822, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 2
pos = ceil(16 * const(size.xscale)), ceil(-32 * const(size.yscale))

[State 822, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 2
value = floor(ifelse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 1

[State 822, Hit]
type = hitadd
trigger1 = numtarget && animelem = 2
value = 1
[State 822, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 2
var(13) = 1

[State 822, Juggle]
type = varadd
trigger1 = numtarget && animelem = 2
var(15) = 1
ignorehitpause = 1
[State 822, Juggle]
type = varset
trigger1 = numtarget && animelem = 2
var(16) = 1
ignorehitpause = 1

[State 822, Throw]
type = targetstate
trigger1 = numtarget && animelem = 2
value = 828

[State 822, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0

[State 822, Sound]
type = playsnd
trigger1 = numtarget && animelem = 2
value = 7, 3
channel = 2
[State 822, Spark]
type = helper
trigger1 = numtarget && animelem = 2
helpertype = normal
stateno = 8013
ID = 8000
name = "Spark"
postype = p1
pos = ceil(28 * const(size.xscale)), ceil(-86 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

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


[Statedef 826]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 826, Anim]
type = changeanim2
trigger1 = !time
value = 826
[State 826, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 826, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32


[Statedef 827]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 827, Anim]
type = changeanim2
trigger1 = !time
value = 827
[State 827, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 827, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32


[Statedef 828]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 828, Anim]
type = changeanim
trigger1 = !time
value = 5030
[State 828, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
trigger1 = selfanimexist(5035)
value = 5035
[State 828, Anim]
type = changeanim
trigger1 = anim != 5050 && !animtime
value = 5050

[State 828, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 828, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 828, Vel]
type = velset
trigger1 = !time
x = -2.17
y = -5.25;84

[State 828, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 828, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = selfanimexist(5051)
value = 5051
[State 828, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;Target Escaped
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
value = 5000, 3
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


;Target Escaped Midair
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
