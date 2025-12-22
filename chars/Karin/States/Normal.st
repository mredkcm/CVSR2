; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< NORMAL MOVES >====
;====

;=< Standing Light Punch >==
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
value = 4, ifelse(random < 500, 5, 6)
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
damage = ceil(ifelse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.24 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -71
hitsound = s2, 0
guardsound = s3, 0
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


;=< Standing Medium Punch >==
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.23
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -55
hitsound = s2, 1
guardsound = s3, 0
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


;=< Standing Hard Punch >==
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

[State 220, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 3
x = ceil(16 * const(size.yscale))
[State 220, Pos]
type = posadd
trigger1 = animelemtime(9) = 0 || animelemtime(9) = 1 || animelemtime(9) = 2
trigger2 = animelem = 10
x = floor(-8 * const(size.yscale))

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
air.velocity = -5.39 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -77
hitsound = s2, 2
guardsound = s3, 0
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


;=< Standing Light Kick >==
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
value = 4, ifelse(random < 500, 5, 6)
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
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.24 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -65
hitsound = s2, 3
guardsound = s3, 0
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


;=< Standing Medium Kick >==
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 61 < 7, 7, fvar(11) * 61)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -62
hitsound = s2, 4
guardsound = s3, 0
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


;=< Tsumuji -gari >==
[Statedef 245]
type = S
physics = S
movetype = A
anim = 245
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 18 * !var(20)
facep2 = 1

[State 245, Pos]
type = posadd
trigger1 = animelemtime(1) = 0 || animelemtime(2) = 0 || animelemtime(7) = 0
x = ceil(2 * const(size.yscale))
[State 245, Pos]
type = posadd
trigger1 = animelemtime(3) = 0 || animelemtime(4) = 0 || animelemtime(5) = 0 || animelemtime(6) = 0
x = ceil(8 * const(size.yscale))
[State 245, Pos]
type = posadd
trigger1 = animelemtime(11) = 0 || animelemtime(11) = 2 || animelemtime(12) = 0 || animelemtime(12) = 1
x = floor(-8 * const(size.yscale))

[State 245, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0
[State 245, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 4
channel = 1

[State 245, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 7
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 61 < 7, 7, fvar(11) * 61)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -47
hitsound = s2, 4
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 245, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 245, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Standing Hard Kick >==
[Statedef 250]
type = S
physics = S
movetype = A
anim = 250
ctrl = 0
velset = 0, 0
sprpriority = -1
poweradd = 18 * !var(20)
facep2 = 1

[State 250, Pos]
type = posadd
trigger1 = animelemtime(2) = 0 || animelemtime(2) = 1 || animelemtime(3) = 0 || animelemtime(3) = 1
x = ceil(8 * const(size.yscale))
[State 250, Pos]
type = posadd
trigger1 = animelemtime(9) = 0 || animelemtime(9) = 2 || animelemtime(10) = 0 || animelemtime(10) = 1
x = floor(-8 * const(size.yscale))

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 3
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
air.velocity = -5.24 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -39
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
p1sprpriority = -1

[State 250, spr]
type = sprpriority
trigger1 = animelem = 5
value = 1

[State 250, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 250, End]
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
value = 4, ifelse(random < 500, 5, 6)
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
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.24 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -43
hitsound = s2, 0
guardsound = s3, 0
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 410, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 61 < 7, 7, fvar(11) * 61)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -12
hitsound = s2, 1
guardsound = s3, 0
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
trigger1 = animelem = 3 && random < 500
value = 4, ifelse(random < 500, 4, 8)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 420, Hit]
type = hitdef
triggerall = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
trigger2 = animelem = 5 && !movecontact && !movereversed
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 81 < 7, 7, fvar(11) * 81)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
air.velocity = -2.5 / ((var(20) > 0) + 1.0), -8.45
ground.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -68
hitsound = s2, 2
guardsound = s3, 0
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
value = 4, ifelse(random < 500, 5, 6)
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
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.24 / ((var(20) > 0) + 1.0), -7
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -8
hitsound = s2, 3
guardsound = s3, 0
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
trigger1 = animelem = 1 && random < 350
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -11
hitsound = s2, 4
guardsound = s3, 0
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
value = 4, ifelse(random < 500, 4, 8)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 74 < 7, 7, fvar(11) * 74)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -8.24
guard.velocity = ifelse(var(20), -6.83, -12.65)
air.velocity = -1, -8.24
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -8
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

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
value = 4, ifelse(random < 500, 5, 6)
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
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
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
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.25 / ((var(20) > 0) + 1.0), -7
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 13
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -90
hitsound = s2, 0
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, Land]
type = changestate
trigger1 = pos y >= -vel y
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
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 610, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 74 < 7, 7, fvar(11) * 74)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = -10.1 / ((var(20) > 0) + 1.0)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -72
hitsound = s2, 1
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 610, Accel]
type = gravity
trigger1 = time >= 0
[State 610, Land]
type = changestate
trigger1 = pos y >= -vel y
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
trigger1 = animelem = 1 && random < 500
value = 4, ifelse(random < 500, 4, 8)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 620, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = -14.58 / ((var(20) > 0) + 1.0)
air.velocity = -6.5 / ((var(20) > 0) + 1.0), -6.32
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 620, Accel]
type = gravity
trigger1 = time >= 0
[State 620, Land]
type = changestate
trigger1 = pos y >= -vel y
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
value = 4, ifelse(random < 500, 5, 6)
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
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(8 / ((var(20) > 0) + 1.0)), ceil(8 / ((var(20) > 0) + 1.0))
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
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
air.velocity = -5.25 / ((var(20) > 0) + 1.0), -7
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 13
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -20
hitsound = s2, 3
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 630, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 630, Accel]
type = gravity
trigger1 = time >= 0
[State 630, Land]
type = changestate
trigger1 = pos y >= -vel y
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
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = -10.1 / ((var(20) > 0) + 1.0)
air.velocity = -7.8 / ((var(20) > 0) + 1.0), -5.35
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -47
hitsound = s2, 4
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 640, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 640, Accel]
type = gravity
trigger1 = time >= 0
[State 640, Land]
type = changestate
trigger1 = pos y >= -vel y
value = 52


;=< Jumping Strong - > Forward >==
[Statedef 645]
type = A
physics = N
movetype = A
anim = 645
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 645, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 4, ifelse(random < 500, 3, 7)
channel = 0
[State 645, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 645, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 0
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3 * var(9)
ground.slidetime = 10 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = -14.58 / ((var(20) > 0) + 1.0)
air.velocity = -6.5 / ((var(20) > 0) + 1.0), -6.32
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
fall.recover = 1
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -47
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 645, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 645, Accel]
type = gravity
trigger1 = time >= 0
[State 645, Land]
type = changestate
trigger1 = pos y >= -vel y
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
trigger1 = animelem = 1 && random < 500
value = 4, ifelse(random < 500, 4, 8)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = ifelse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4 * var(9)
ground.slidetime = 10 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = -14.58 / ((var(20) > 0) + 1.0)
air.velocity = -6.5 / ((var(20) > 0) + 1.0), -6.32
airguard.velocity = -8 / ((var(20) > 0) + 1.0), -1.5
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -12.42, -24.4)
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 12
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -36
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 650, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 650, Accel]
type = gravity
trigger1 = time >= 0
[State 650, Land]
type = changestate
trigger1 = pos y >= -vel y
value = 52


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
var(10) = ifelse(var(20), 0, (random < 666))

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
guard.sparkno = -1
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
p1stateno = 810

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
guard.sparkno = -1
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
p1stateno = ifelse(command = "holdback", 805, 820)

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 9
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
[State 806, Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;=< Yashiro Kuzushi >==
[Statedef 810]
type = S
physics = S
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

[State 810, throw]
type = targetstate
trigger1 = !time && numtarget
value = 811

[State 810, Turn]
type = varset
trigger1 = !time
var(0) = command = "holdback"
[State 810, Turn]
type = turn
trigger1 = var(0) && animelem = 3

[State 810, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 810, width]
type = width
trigger1 = 1
edge = 48, 48

[State 810, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = ceil(42 * const(size.xscale)), 0
[State 810, Bind 2]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(4 * const(size.xscale)), 0
[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(19 * const(size.xscale)), ceil(-72 * const(size.yscale))
[State 810, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(39 * const(size.xscale)), ceil(-60 * const(size.yscale))
[State 810, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0
pos = ceil(30 * const(size.xscale)), ceil(-42 * const(size.yscale))

[State 810, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 810, End]
type = changestate
trigger1 = !animtime
value = 815 


;--- --Hit Floor -----
[Statedef 815]
type = S
physics = S
movetype = A
anim = 815
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 815, juggle]
type = varadd
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1

[State 815, juggle]
type = varset
trigger1 = !time && numtarget
var(27) = 1
ignorehitpause = 1

[State 815, Pos]
type = posset
trigger1 = !time
y = 0

[State 815, throw]
type = targetstate
trigger1 = !time && numtarget
value = 816

[State 815, Bind 1]
type = targetbind
trigger1 = numtarget && animelemtime(3) < 0
pos = ceil(19 * const(size.xscale)), 0

[State 815, damage]
type = targetlifeadd
trigger1 = !time
trigger1 = numtarget && prevstateno = 810
value = ceil(ifelse(135 * fvar(11) < 7, -7, -135 * fvar(11)))

[State 815, damage]
type = targetlifeadd
trigger1 = !time
trigger1 = numtarget && prevstateno = 860
value = ceil(ifelse(149 * fvar(11) < 7, -7, -149 * fvar(11)))

[State 815, Hit]
type = hitadd
trigger1 = numtarget && !time
value = 1

[State 815, hitcount]
type = varadd
trigger1 = numtarget && !time
var(13) = 1

[State 815, givepower]
type = targetpoweradd
trigger1 = numtarget && !time
value = 36

[State 815, getpower]
type = poweradd
trigger1 = !time && !var(20)
value = 72

[State 815, Snd]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0

[State 815, Snd]
type = playsnd
trigger1 = !time
value = 0, 5100

[State 815, Shake]
type = envshake
trigger1 = !time
time = 18
ampl = -6

[State 815, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 815, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811
[State 811, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[Statedef 816]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 816, Anim]
type = changeanim2
trigger1 = !time
value = 816
[State 816, End]
type = changestate
trigger1 = !animtime
value = 817

[Statedef 817]
type = L
physics = N
movetype = H
anim = 5110
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 817, Pos]
type = posset
trigger1 = !time
y = 0
[State 817, End]
type = selfstate
trigger1 = time >= 30
value = ifelse(!alive, 5150, 5120)


;=< Homura -geri >==
[Statedef 820]
type = S
physics = S
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
type = varadd
trigger1 = var(19) > 0
var(19) = -1
[State 820, Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890

[State 820, width]
type = width
trigger1 = 1
edge = 48, 0

[State 820, timer]
type = varset
trigger1 = !time
var(44) = 135
[State 820, timer]
type = varadd
trigger1 = hitcount
var(44) = -1
[State 820, timer]
type = varadd
triggerall = numtarget && hitcount
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger2 = target, command = "a" || target, command = "b" || target, command = "c"
trigger3 = target, command = "up" || target, command = "down" || target, command = "back" || target, command = "fwd"
var(44) = -1

[State 820, End]
type = changestate
triggerall = hitcount
triggerall = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger1 = var(44) <= 0
trigger2 = numtarget
trigger2 = !(target, alive)
value = 821

[State 820, p1 mashing]
type = varset
trigger1 = !time
var(43) = 0
[State 820, p1 mashing]
type = varadd
triggerall = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
var(43) = 1
[State 820, p1 mashing]
type = varadd
trigger1 = AIlevel
trigger1 = random < 333
var(43) = 1

[State 820, anim skip]
type = changeanim
triggerall = var(44) > 0
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(5) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(43)
trigger1 = 1 || var(43) := (var(43)+ animelemtime(animelemno(0) + 1))
value = 820
elem = animelemno(0) + 1
[State 820, anim skip]
type = changeanim
triggerall = var(44) > 0
trigger1 = animelemtime(5) > 0
trigger1 = animelemtime(5) >= (5 -var(43))
trigger1 = 1 || var(43) := (var(43) + 5 -animelemtime(5))
value = 820
elem = 1

[State 820, p1 mashing]
type = varset
trigger1 = var(43) < 0
var(43) = 0

[State 820, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 820, throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
value = 825
[State 820, throw]
type = targetstate
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(5) >= 0
value = 826
[State 820, throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
value = 827

[State 820, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 820, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0 || animelemtime(5) >= 0
pos = ceil(45 * const(size.xscale)), 0
[State 820, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(50 * const(size.xscale)), ceil(-66 * const(size.yscale))

[State 820, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 3 && !hitcount
value = ceil(ifelse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
[State 820, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 3 && hitcount
value = ceil(ifelse(14 * fvar(11) < 7, -7, -14 * fvar(11)))

[State 820, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 6
channel = 0
[State 820, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 820, Hit]
type = hitadd
trigger1 = numtarget && animelem = 3
value = 1
[State 820, hitcount]
type = varadd
trigger1 = numtarget && animelem = 3
var(13) = 1

[State 820, Snd]
type = playsnd
trigger1 = numtarget && animelem = 3
value = 2, 4


[State 821, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(58 * const(size.xscale)), ceil(-58 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, Shake]
type = envshake
trigger1 = numtarget && animelem = 3
time = 14
ampl = 4


;--- FINISH ---
[Statedef 821]
type = S
physics = S
movetype = A
anim = 821
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 821, juggle]
type = varadd
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1
[State 821, juggle]
type = varset
trigger1 = !time && numtarget
var(27) = 1
ignorehitpause = 1

[State 821, throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
value = 825
[State 821, throw]
type = targetstate
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
value = 826

[State 821, throw]
type = targetstate
trigger1 = animelem = 3
value = 829
[State 821, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 821, width]
type = width
trigger1 = 1
edge = 48, 0

[State 821, Bind 1]
type = targetbind
trigger1 = numtarget && animelemtime(3) < 0
pos = ceil(45 * const(size.xscale)), 0

[State 821, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 3
value = ceil(ifelse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
[State 821, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 3
value = 36
[State 821, getpower]
type = poweradd
trigger1 = numtarget && animelem = 3 && !var(20)
value = 72

[State 821, Hit]
type = hitadd
trigger1 = numtarget && animelem = 3
value = 1
[State 821, hitcount]
type = varadd
trigger1 = numtarget && animelem = 3
var(13) = 1

[State 820, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 6
channel = 0
[State 820, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 821, Snd]
type = playsnd
trigger1 = numtarget && animelem = 3
value = 2, 5

[State 821, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(58 * const(size.xscale)), ceil(-58 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 821, Shake]
type = envshake
trigger1 = numtarget && animelem = 3
time = 14
ampl = 4

[State 821, End]
type = changestate
trigger1 = !animtime
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
[State 825, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 825, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

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

[Statedef 829]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 829, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5035), 5035, 5030)
[State 829, Anim]
type = changeanim
trigger1 = (anim = [5030, 5035]) && !animtime
value = 5050

[State 829, Accel]
type = veladd
trigger1 = 1
y = 0.57
[State 829, Vel]
type = velset
trigger1 = !time
x = -4
y = -8.26

[State 829, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 829, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;=< Air Throw Attempt >==
[Statedef 850]
type = A
physics = N
movetype = A
anim = 850
ctrl = 0
sprpriority = 1
poweradd = 18 * !var(20)

[State 850, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "2k")
[State 850, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = (random < 500)

[State 850, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = animelem = 1
trigger1 = !var(38)
attr = A, NT
hitflag = A-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -88
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
p1stateno = 860 

[State 850, Hit]
type = hitdef
trigger1 = !var(27) && var(20)
trigger1 = animelem = 1
trigger1 = !var(38)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 82 * !var(20), 0
givepower = 0, 0
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -88
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
p1stateno = 860 

[State 850, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 9
channel = 0
[State 850, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
channel = 1

[State 850, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I
[State 850, Accel]
type = gravity
trigger1 = time >= 0
[State 850, Land]
type = changestate
trigger1 = pos y >= -vel y
value = 52


;=< Abise Yashiro Kuzushi >==
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
ctrl = 0
sprpriority = 1

[State 860, throw]
type = targetstate
trigger1 = !time && numtarget
value = 861

[State 860, Turn]
type = turn
trigger1 = var(10) && animelem = 3
[State 860, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 860, width]
type = width
trigger1 = 1
edge = 48, 48

[State 860, Pos]
type = posset
trigger1 = pos y > 0 && animelemtime(3) < 0
y = 0
[State 860, Pos]
type = posfreeze
trigger1 = animelemtime(3) < 0
value = 1

[State 860, Vel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.5
[State 860, Vel]
type = velset
trigger1 = animelem = 3
y = -4

[State 860, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = ceil(29 * const(size.xscale)), ceil(-64 * const(size.yscale))
[State 860, Bind 2]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 0, floor(64 * const(size.yscale))
[State 860, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(19 * const(size.xscale)), ceil(-72 * const(size.yscale))
[State 860, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(39 * const(size.xscale)), ceil(-60 * const(size.yscale))
[State 860, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0
pos = ceil(30 * const(size.xscale)), ceil(-42 * const(size.yscale))

[State 860, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 860, End]
type = changestate
trigger1 = pos y >= -vel y
value = 815 


;--- TARGET ---
[Statedef 861]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 861, Anim]
type = changeanim2
trigger1 = !time
value = 861
[State 861, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


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
value = 5000, 1
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 0, 760

[State 890, FX]
type = explod
trigger1 = !time
anim = 8000
ID = 8000
sprpriority = 5
postype = p1
pos = 0, -48
ownpal = 1
pausemovetime = -1
supermovetime = -1

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
