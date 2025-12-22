; _______________________________________
;| Geese Howard by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -89
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 200
elem = 3
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
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
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
air.velocity = -3.24, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 70), var(36) := -72
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
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 211, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 211, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
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
air.velocity = -3.24, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 46), var(36) := -99
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

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
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
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
air.velocity = -5.39, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 103), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 220, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 220
elem = 5
ignorehitpause = 1

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

[State 221, Pos]
type = posadd
trigger1 = animelem = 3
x = 13

[State 221, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 0
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
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -3.24, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 24), var(36) := -64
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 221, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 221
elem = 4
ignorehitpause = 1

[State 221, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Fudou Sakkatsu Uraken >==
[Statedef 225]
type = S
physics = S
movetype = A
anim = 225
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 225, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 225, Pos]
type = posadd
trigger1 = animelem = 4 || animelem = 9
x = 16

[State 225, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 111 < 7, 7, fvar(11) * 111)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3.17, -6.33), -5.27
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -5.39, -5.65
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120;30
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 58), var(36) := -70
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 225, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 225
elem = 6
ignorehitpause = 1

[State 225, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Comboed ---
[Statedef 226]
type = S
physics = S
movetype = A
anim = 226
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 226, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 226, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 226, Pos]
type = posadd
trigger1 = animelem = 4 || animelem = 9
x = 16

[State 226, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 39 < 7, 7, fvar(11) * 39)), 0
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
air.velocity = -3.24, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 58), var(36) := -70
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 226, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 226
elem = 6
ignorehitpause = 1

[State 226, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 226, End]
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
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -34
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
trigger1 = animelem = 1 && random < 231
value = 4, ifelse(random < 500, 0, 1)
channel = 0
[State 231, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 231, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = S, NA
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 39), var(36) := -69
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 231, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
value = 231
elem = 4
ignorehitpause = 1

[State 231, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
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
trigger1 = animelem = 3 && random < 350
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 4
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 70), var(36) := -66
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
ground.velocity = -6.46, -5.25
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.66, -7.51)
guard.cornerpush.veloff = 0
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;ifelse(var(20), 19, 24)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 70), var(36) := -66
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 241, Snd]
type = playsnd
trigger1 = animelem = 2
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
damage = ceil(ifelse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 97), var(36) := -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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
trigger1 = animelem = 5 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 7
value = 1, 5
channel = 1

[State 250, Pos]
type = posadd
trigger1 = animelem = 5
x = 12
[State 250, Pos]
type = posadd
trigger1 = animelem = 6
x = 16
[State 250, Pos]
type = posadd
trigger1 = animelem = 7
x = 20
[State 250, Pos]
type = posadd
trigger1 = animelem = 8
x = 8

[State 250, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 8
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 0
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 250, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(8) >= 0 && animelemtime(9) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 250
elem = 9
ignorehitpause = 1

[State 250, Type]
type = statetypeset
trigger1 = animelemtime(10) >= 0
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
trigger1 = (animelem = 2 || animelem = 6) && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 251, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 1, 5
channel = 1

[State 251, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
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
air.velocity = -5.39, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -110
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 251, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 251, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 251
elem = 8
ignorehitpause = 1

[State 251, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Raikou Mawashi Geri >==
[Statedef 255]
type = S
physics = N
movetype = A
anim = 255
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 255, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
channel = 1

[State 255, Vel]
type = veladd
trigger1 = animelemtime(3) >= 0
x = ifelse(vel x > 0.2211, -.2211, -vel x)
[State 255, Vel]
type = velset
trigger1 = animelem = 3
x = 6.78
[State 255, Vel]
type = velset
trigger1 = animelem = 11
x = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 41
[State 255, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 52
[State 255, Dust]
type = explod
trigger1 = animelem = 11
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 255, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 7
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
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
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -81
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 255, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 255, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Comboed ---
[Statedef 256]
type = S
physics = N
movetype = A
anim = 256
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 256, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 256, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
channel = 1

[State 256, Vel]
type = veladd
trigger1 = animelemtime(3) >= 0
x = ifelse(vel x > 0.11, -.11, -vel x)
[State 256, Vel]
type = velset
trigger1 = animelem = 3
x = 3.39
[State 256, Vel]
type = velset
trigger1 = animelem = 11
x = 0

[State 256, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 41
[State 256, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 256
supermovetime = 256
ownpal = 1

[State 256, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 52
[State 256, Dust]
type = explod
trigger1 = animelem = 11
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 256, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
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
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.31, -7.36
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;35
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -81
palfx.time = 12 * var(9)
palfx.add = 256, 256, 256
palfx.sinadd = -256, -256, -256, 48

[State 256, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 256, End]
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 69), var(36) := -71
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 400, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 6)
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
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 410, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = C, NA
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 75), var(36) := -21
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 410, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
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
trigger1 = animelem = 1 && random < 500
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
trigger1 = animelem = 3
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
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
air.velocity = -3.23, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 42), var(36) := -90
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
forcestand = 1

[State 420, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 && !movecontact && !movereversed
forcenofall = !var(20)
attr = C, NA
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
ground.velocity = ifelse(var(20), -4.86, -10.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.86, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -3.23, -7.73
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 29), var(36) := -139
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 420, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 420
elem = 5
ignorehitpause = 1

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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 68), var(36) := -8
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 3
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;-animtime + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 76), var(36) := -8
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 440, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 440
elem = 4
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
trigger1 = animelem = 1 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 3
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
fall.recovertime = 120;33
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -29
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
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 51), var(36) := -51
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
trigger1 = animelemtime(9) >= 0
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
trigger1 = animelem = 1 && random < 350
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -93
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 610, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 8)
value = 610
elem = 3
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
trigger1 = (animelem = 1 || animelem = 4) && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 6
value = 1, 2
channel = 1

[State 620, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < (1 + hitcount) || var(20))
trigger1 = animelem = 2 || animelem = 6
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse((animelem = 2), 56, 63) < 7, 7, fvar(11) * ifelse((animelem = 2), 56, 63))), 0
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 58), var(36) := -57
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 620
elem = 3
ignorehitpause = 1
[State 620, Anim]
type = changeanim
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 4, 10)
value = 620
elem = 7
ignorehitpause = 1

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
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
air.velocity = -3.23, -7.73
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 4, 8)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 60), var(36) := -24
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
trigger1 = animelemtime(8) >= 0
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
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
air.velocity = -3.23, -7.73
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 5, 10)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 56), var(36) := -28
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
trigger1 = animelemtime(5) >= 0
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
damage = ceil(ifelse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
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
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -63
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 650, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 650, Accel]
type = gravity
trigger1 = time >= 0
[State 650, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;===< Neutral Jump Hard Kick >==
[Statedef 651]
type = A
physics = N
movetype = A
anim = 651
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 651, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 651, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
channel = 1

[State 651, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 0
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
air.velocity = -6.46, -7
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120;16 + ifelse(var(20), 6, 12)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -81
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 651, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 651, Accel]
type = gravity
trigger1 = time >= 0
[State 651, End]
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
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
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
numhits = 0
p1stateno = ifelse(command = "holdback", 820, 805)

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
sprpriority = 0

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

[State 805, Spr]
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
[State 806, Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;===< Face Grab >==
[Statedef 810]
type = A
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

[State 810, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 815

[State 810, Turn]
type = turn
trigger1 = animelem = 10
[State 810, Throw]
type = targetfacing
trigger1 = numtarget && animelemtime(13) < 0
value = -1

[State 810, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
edge = 40, 0
[State 810, Width]
type = width
trigger1 = animelemtime(13) >= 0 && animelemtime(16) < 0
edge = 64, 0

[State 810, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = 40, 0
[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 29, -104
[State 810, Bind 4]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger3 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 36, -130
[State 810, Bind 5]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger3 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = 38, -130
[State 810, Bind 10]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = -13, -126
[State 810, Bind 11]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = -9, -124
[State 810, Bind 12]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = -7, -32
[State 810, Bind 13]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 13
pos = 64, -8

[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 5 || animelem = 7 || animelem = 9
value = floor(ifelse(28 * fvar(11) < 7, -7, -28 * fvar(11)))
kill = 0
[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 13
value = floor(ifelse(55 * fvar(11) < 7, -7, -55 * fvar(11)))
kill = 1

[State 810, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 13
value = 36
[State 810, Power]
type = poweradd
trigger1 = numtarget && animelem = 13 && !var(20)
value = 72

[State 810, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 5 || animelem = 7 || animelem = 9
value = 1
[State 810, Hitcount]
type = varadd
trigger1 = numtarget
trigger1 = animelem = 5 || animelem = 7 || animelem = 9
var(13) = 1

[State 810, Juggle]
type = varadd
trigger1 = numtarget && animelem = 13
var(15) = 1
ignorehitpause = 1
[State 810, Juggle]
type = varset
trigger1 = numtarget && animelem = 13
var(16) = 1
ignorehitpause = 1

[State 810, Throw]
type = targetstate
trigger1 = numtarget && animelem = 13
value = 816

[State 810, Sound]
type = playsnd
trigger1 = animelem = 2
value = 6, 10
channel = 0
[State 810, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 5 || animelem = 7 || animelem = 9
value = 7, 10
channel = 2
[State 810, Sound]
type = playsnd
trigger1 = animelem = 12
value = 1, 2
channel = 1

[State 810, Sparks]
type = helper
trigger1 = numtarget
trigger1 = animelem = 5 || animelem = 7 || animelem = 9
helpertype = normal
stateno = 8010
ID = 8000
name = "Spark"
postype = p1
pos = 42, -132
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535

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

[State 815, Spr]
type = sprpriority
trigger1 = 1
value = 0
[State 815, Spr]
type = sprpriority
trigger1 = animelemtime(7) >= 0
value = 2

[Statedef 816]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 816, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5035)
value = 5035
[State 816, Anim]
type = changeanim
trigger1 = anim != 5050 && !animtime
trigger2 = !time && !selfanimexist(5035)
value = 5050

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
x = -6
y = -4.5

[State 816, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 816, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5100


;===< Shinkuu Nage >==
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
[State 820, Turn]
type = turn
trigger1 = !time

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
value = 1

[State 820, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 32, 0
[State 820, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(9) < 0
edge = 64, 0

[State 820, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = -39, -77
[State 820, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -32, -110
[State 820, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 6, -122
[State 820, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 44, -103
[State 820, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 5
pos = 66, -100

[State 820, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 5
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))

[State 820, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 5
value = 36
[State 820, Power]
type = poweradd
trigger1 = numtarget && animelem = 5 && !var(20)
value = 72

[State 820, Hit]
type = hitadd
trigger1 = numtarget && animelem = 5
value = 1
[State 820, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 5
var(13) = 1

[State 820, Juggle]
type = varadd
trigger1 = numtarget && animelem = 5
var(15) = 1
ignorehitpause = 1
[State 820, Juggle]
type = varset
trigger1 = numtarget && animelem = 5
var(16) = 1
ignorehitpause = 1

[State 820, Throw]
type = targetstate
trigger1 = numtarget && animelem = 5
value = 826

[State 820, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 5
channel = 0
[State 820, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 3
channel = 0

[State 820, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1
[State 820, Sound]
type = playsnd
trigger1 = animelem = 9
value = 1, 0
channel = 1

[State 820, End]
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
[State 825, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 2

[Statedef 826]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 826, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 826, Vel]
type = veladd
trigger1 = 1
y = 0.58
[State 826, Vel]
type = velset
trigger1 = !time
x = 5.39
y = -5.5

[State 826, Shake]
type = envshake
trigger1 = vel y > 0 && pos y >= -24
time = 14
ampl = -4
freq = 120

[State 826, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 826, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -24
value = 5100


;===< Floor Throw Attempt >==
[Statedef 830]
type = S
physics = S
movetype = A
anim = 830
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 830, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 830, Hit]
type = hitdef
trigger1 = animelem = 2 && p2bodydist x <= 24
attr = S, NT
hitflag = FD
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 16), var(36) := -8
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 0
numhits = 0
p1stateno = 840

[State 830, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 830, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 830, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Success ---
[Statedef 840]
type = S
physics = S
movetype = A
anim = 840
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 36 * !var(20)

[State 840, Turn]
type = turn
trigger1 = animelem = 4

[State 840, Throw]
type = targetstate
trigger1 = numtarget && animelem = 1
value = 845
[State 840, Throw]
type = targetfacing
trigger1 = numtarget
value = 1

[State 840, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
edge = 32, 0
[State 840, Width]
type = width
trigger1 = animelemtime(9) >= 0 && animelemtime(12) < 0
edge = 64, 0

[State 840, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 24, 0
[State 840, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 29, -104
[State 840, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 36, -130
[State 840, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -40, 0
[State 840, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = -36, -124
[State 840, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 31, -115
[State 840, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 35, -95
[State 840, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 40, -75
[State 840, Bind 9]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 9
pos = 45, 0

[State 840, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 9
value = 36
[State 840, Power]
type = poweradd
trigger1 = numtarget && animelem = 9 && !var(20)
value = 72
[State 840, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 9
value = floor(ifelse(69 * fvar(11) < 7, -7, -69 * fvar(11)))

[State 840, Hit]
type = hitadd
trigger1 = numtarget && animelem = 9
value = 1
[State 840, HitCount]
type = varadd
trigger1 = numtarget && animelem = 9
var(13) = 1
[State 840, Juggle]
type = varadd
trigger1 = numtarget && animelem = 9
var(15) = 1

[State 840, Throw]
type = targetstate
trigger1 = numtarget && animelem = 9
value = 846

[State 840, Sound]
type = playsnd
trigger1 = animelem = 3
value = 6, 15
channel = 0
[State 840, Sound]
type = playsnd
trigger1 = animelem = 12
value = 6, 16
channel = 0

[State 840, Shake]
type = envshake
trigger1 = numtarget && animelem = 9
time = 14
ampl = -4
freq = 120
[State 840, Sound]
type = playsnd
trigger1 = numtarget && animelem = 9
value = 7, 8
[State 840, FX]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 841
name = "FX"
postype = p1
pos = 45, 0
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 840, Shock Particles]
type = helper
trigger1 = !numhelper(8155)
trigger1 = numtarget && animelem = 9
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8155
ID = 8155
name = "Shock Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 840, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 845]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = -1
[State 845, Anim]
type = changeanim2
trigger1 = !time
value = 845
[State 845, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 846]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = -1
[State 846, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 846, Anim]
type = changeanim
trigger1 = !time
value = 5100
[State 3267, PalFX]
type = palfx
trigger1 = !time
time = 32
mul = 192, 192, 192
sinadd = 128, 128, 128, 4
[State 846, End]
type = changestate
trigger1 = time >= 6
value = 847


[Statedef 847]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 847, Pos]
type = posset
trigger1 = !time
y = 0
[State 847, Vel]
type = veladd
trigger1 = time
y = 0.58
[State 847, Vel]
type = velset
trigger1 = time = 1
x = 3
y = -6

[State 847, Anim]
type = changeanim2
trigger1 = !time
value = 847

[State 847, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 847, End]
type = selfstate
trigger1 = time > 10 && vel y > 0 && pos y >= 25
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
pos = 0, -64
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
