; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< NORMAL STATES >====
;====

;=< Stand Light Punch >==
[Statedef 200]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 200;ifelse(p2bodydist x <= (const(size.xscale) * 25), 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 200 && animelem = 2
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -94
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 200, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 201 && animelem = 2
attr = S, NA
damage = 18, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -78
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 200, End]
type = changestate
triggerall = movecontact = [1, 4]
trigger1 = !AIlevel && command = "y"
trigger2 = AIlevel && random < 250
value = 290

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Stand Medium Punch >==
[Statedef 205]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 206, 205)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 205, Snd]
type = playsnd
trigger1 = anim = 205 && animelem = 4
trigger2 = anim = 206 && animelem = 3
value = 1, 2
channel = 1

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 205
attr = S, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 206
attr = S, NA
damage = 43, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -53
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = anim = 205 && animelemtime(5) >= 0
trigger2 = anim = 206 && animelemtime(4) >= 0
movetype = I

[State 205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Kubi Kudaki >==
[Statedef 207]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 207
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 207, width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
player = 40, 0

[State 207, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 5
value = 3, ifelse((animelem = 5), 6, 3)
channel = 0
[State 207, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1

[State 207, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = 25, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -62
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 207, hit2]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6
attr = S, NA
damage = 25, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -50
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 207, Pos]
type = posadd
trigger1 = animelem = 7 || animelem = 8 || animelem = 9
x = ceil(ifelse((animelem = 9), 11, ifelse((animelem = 8), 20, 9))) * const(size.xscale)

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 207, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Stand Hard Punch >==
[Statedef 210]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 48), 211, 210)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = anim = 210 && animelem = 3
trigger2 = anim = 211 && animelem = 4
value = 1, 3
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 210
attr = S, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -72
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 211
attr = S, NA
damage = 63, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -76
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5 && anim = 211
trigger1 = !movecontact && !movereversed
attr = S, NA
damage = 57, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = anim = 210 && animelemtime(5) >= 0
trigger2 = anim = 211 && animelemtime(6) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Stand Light Kick >==
[Statedef 215]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 216, 215)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 215, Snd]
type = playsnd
trigger1 = anim = 215 && animelem = 4
trigger2 = anim = 216 && animelem = 3
value = 1, 4
channel = 1

[State 215, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 215
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -86
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 215, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 216
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -13
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = anim = 215 && animelemtime(5) >= 0
trigger2 = anim = 216 && animelemtime(4) >= 0
movetype = I

[State 215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Stand Medium Kick >==
[Statedef 220]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 221, 220)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 220
attr = S, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 221
attr = S, NA
damage = 43, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Stand Hard Kick >==
[Statedef 225]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 60), 226, 225)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = anim = 225 && animelem = 3 && random < 500
trigger2 = anim = 226 && animelem = 5 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = anim = 225 && animelem = 3
trigger2 = anim = 226 && animelem = 6
value = 1, 6
channel = 1

[State 225, Vel]
type = posadd
trigger1 = anim = 226 && (animelem = 3 || animelem = 4)
x = ceil(24 * const(size.xscale))

[State 225, spr]
type = sprpriority
trigger1 = anim = 226
value = ifelse(animelemtime(7) >= 0, 1, -1)

[State 225, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 225
attr = S, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -84
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 225, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 7 && anim = 226
attr = S, NA
damage = 65, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -90
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = anim = 225 && animelemtime(4) >= 0
trigger2 = anim = 226 && animelemtime(8) >= 0
movetype = I

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< KAMAITACHI >==
[Statedef 227]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 227
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 227, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(8) < 0
player = 30

[State 227, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0
[State 227, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 5
value = 1, ifelse((animelem = 3), 5, 6)
channel = 1

[State 227, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = S, NA
damage = 35, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0, -2
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 227, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = 40, 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = -3, -8
guard.velocity = ifelse(var(20), -6.83, -12.65)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = -3, -8
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 227, Vel]
type = velset
trigger1 = animelem = 6
x = -3
y = -6

[State 227, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
statetype = A
[State 227, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 1
statetype = A
physics = A

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I


;=< Crouch Light Punch >==
[Statedef 230]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -61
hitsound = s2, 1
guardsound = s2, 0
ground.type = Low
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 230, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Medium Punch >==
[Statedef 235]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 235
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 235, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 235, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -49
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 235, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Hard Punch >==
[Statedef 240]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 240
velset = 0, 0
poweradd = 18 * (!var(20) && prevstateno != 750)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(3) < 0
value = SCA
time = 1

[State 240, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -77
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 240, Hit]
type = hitdef
trigger1 = animelem = 3 && prevstateno = 750
attr = C, SA
damage = 70, 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 8, 16), ifelse(var(20), 8, 16)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -77
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = -5, -6.2
air.type = Low
air.velocity = -5, -6.2
air.hittime = 18
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = 0, 0
givepower = 36, 36
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 240, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Light Kick >==
[Statedef 245]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 245
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 245, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 245, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -9
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.hittime = 12 + 2 * var(29)
ground.slidetime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 245, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Medium Kick >==
[Statedef 250]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 250
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA
damage = 25, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -15 + 0 * (var(35) := 155), var(36):= -28
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 250, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA 
damage = 20, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -22
hitsound = s2, 5
guardsound = s2, 0
ground.type = Trip
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = -1, -8.24
air.type = Trip
air.velocity = -1, -8.24
down.velocity = -3, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.677
fall = 1
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 250, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Hard Kick >==
[Statedef 255]
type = C
physics = N
movetype = A
juggle = ifelse(numtarget, 15, 8)
anim = 255
velset = 0, 0
poweradd = 18 * (!var(20) && prevstateno != 750)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 255, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(vel x > 0.70, -0.70, -vel x);71.25
[State 255, Vel]
type = velset
trigger1 = animelem = 2
x = 9.975

[State 255, Width]
type = width
trigger1 = 1
edge = -4, 0
ignorehitpause = 1

[State 255, Push]
type = playerpush
trigger1 = p2statetype = A && p2dist y < -20
value = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 255, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 0

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(2) < 0
value = SCA
time = 1

[State 255, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelemtime(2) = 0 && prevstateno != 750 
attr = C, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -5
hitsound = s2, 6
guardsound = s2, 0
ground.type = Trip
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = -1, -8.24
air.type = Trip
air.velocity = -1, -8.24
down.velocity = -4, -4
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.677
persistent = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 255, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelemtime(2) >= 1 && animelemtime(3) < 0
trigger1 = !movecontact && !movereversed && prevstateno != 750 
attr = C, NA
damage = 50, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -5
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -6.83, -12.65), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
down.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120

[State 255, Hit]
type = hitdef
trigger1 = animelem = 2 && prevstateno = 750
attr = C, SA
damage = 60, 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF
priority = 4, Hit 
pausetime = ifelse(var(20), 8, 16), ifelse(var(20), 8, 16)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -5
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = -5, -6.2
air.type = Low
air.velocity = -5, -6.2
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = 0, 0
givepower = 36, 36
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 255, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Air Light Punch >==
[Statedef 260]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 260
poweradd = 0 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 260, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 260, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = 25, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -40
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 260, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I


;=< Air Medium Punch >==
[Statedef 265]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 265
poweradd = 18 * !var(20) 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 265, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 265, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = 40, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -40
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 265, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I


;=< HIJI OTOSHI >==
[Statedef 267]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 267
velset = 0.5 * vel x, vel y
poweradd = 18 * !var(20) 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 267, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 267, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = 45, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -56
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)


;=< Air Hard Punch >==
[Statedef 270]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 270
poweradd = 18 * !var(20) 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 270, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 270, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = A, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -88
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 265, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I


;=< Air Light Kick >==
[Statedef 275]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(vel x, 275, 276)
poweradd = 0 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 275, Snd]
type = playsnd
trigger1 = anim = 275 && animelem = 3
trigger2 = anim = 276 && animelem = 2
value = 1, 4
channel = 1

[State 275, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 275
attr = A, NA 
damage = 25, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 275, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 && anim = 276
attr = A, NA 
damage = 25, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -89
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -3.12, -5.62)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 275, Type]
type = statetypeset
trigger1 = anim = 275 && animelemtime(4) >= 0
trigger2 = anim = 276 && animelemtime(3) >= 0
movetype = I


;=< Air Medium Kick >==
[Statedef 280]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 280
poweradd = 18 * !var(20) 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 3, 5)
channel = 0
[State 280, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 280, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = A, NA 
damage = 40, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -5.05, -9.22)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -7.15, -13.38)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 280, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I


;=< Air Hard Kick >==
[Statedef 285]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(vel x, 285, 286)
poweradd = 18 * !var(20) 
sprpriority = 1
ctrl = 0

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 5, 6)
channel = 0
[State 285, Snd]
type = playsnd
trigger1 = anim = 285 && animelem = 3
trigger2 = anim = 286 && animelem = 5
value = 1, 6
channel = 1
[State 285, Snd]
type = playsnd
trigger1 = anim = 286 && animelem = 3
value = 1, 5
channel = 1

[State 285, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 285 && animelem = 3
attr = A, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -45
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 285, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 286 && animelem = 3
attr = A, NA
damage = 35, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 285, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = anim = 286 && animelem = 5
attr = A, NA
damage = 40, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 285, Anim]
type = changeanim
trigger1 = anim = 286
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 2, 8)
value = 286
elem = 4
ignorehitpause = 1

[State 285, Type]
type = statetypeset
trigger1 = anim = 285 && animelemtime(4) >= 0
trigger2 = anim = 286 && animelemtime(6) >= 0
movetype = I


;=< BUSHIN GOKUSA KEN >==
;--- < 2nd > ---
[Statedef 290]
type = S
movetype = A
physics = S
juggle = 0
anim = 205
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0

[State 290, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
player = 15, 0
[State 290, Vel]
type = velset
trigger1 = animelem = 2
x = 6
[State 290, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
channel = 1

[State 290, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA 
damage = 25, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10) 
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = -5, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 290, End]
type = changestate
triggerall = movecontact = [1, 4]
trigger1 = !AIlevel && command = "z"
trigger2 = AIlevel
value = 291

[State 290, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- < 3rd > ---
[Statedef 291]
type = S
movetype = A
physics = S
juggle = 0
anim = 212
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0

[State 291, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
player = 15, 0
[State 291, Vel]
type = velset
trigger1 = animelem = 2
x = 6
[State 291, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse((anim = 211), 6, 3)
channel = 0
[State 291, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 291, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = 25, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.05, -9.22), 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -6
air.type = Low
air.hittime = 18
air.velocity = -5, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 291, End]
type = changestate
triggerall = movecontact = [1, 4]
trigger1 = !AIlevel && command != "holddown" && command = "c"
trigger2 = AIlevel
value = 292

[State 291, End]
type = changestate
triggerall = movecontact = [1, 4]
trigger1 = !AIlevel && command = "holddown" && command = "c"
trigger2 = AIlevel
value = 805

[State 291, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- < 4th > ---
[Statedef 292]
type = S
movetype = A
physics = S
juggle = 0
anim = 292
velset = 0, 0
poweradd = 0
sprpriority = -1
ctrl = 0

[State 292, Vel]
type = posadd
trigger1 = animelem = 1
x = ceil(24 * const(size.xscale))

[State 292, Vel]
type = velset
trigger1 = animelem = 2
x = ceil(9 * const(size.xscale))

[State 292, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 8
channel = 0
[State 292, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 292, spr]
type = sprpriority
trigger1 = 1
value = ifelse(animelemtime(4) >= 0, 1, -1)

[State 292, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA
damage = 25, 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -90
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 18 + 4 * var(29)
ground.slidetime = 18 + 4 * var(29)
ground.velocity = ifelse(var(20), -2, -4), -8.45
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2, -4), -8.45
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.6
sprpriority = -1
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 292, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=
;===< THROWS >====
;=
;====< GROUND THROW CONTROLLER >==
[Statedef 800]
type = S
movetype = A
physics = S
juggle = 15
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1
poweradd = 18 * !var(20)

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "2k", 2, 1)
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 650, 2, 1)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0
[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = ifelse(var(10) = 2, 11, 7)

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10) = 1
trigger1 = !var(38)
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801) 
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10) = 2
trigger1 = !var(38)
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 1, -1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 801, 803) 
animtype = Diagup
ground.velocity = -3.5, -7
air.velocity = -3.5, -7
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 300
numhits = 0

[State 800, misssnd]
type = playsnd
trigger1 = animelem = 3
value = 3, 0
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
ctrl = 0
sprpriority = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 802

[State Width]
type = width
trigger1 = 1
edge = 30, 0

[State 801, Bind 1]
type = targetbind
trigger1 = 1
pos = 45, 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 1, 805, 810)
ctrl = 0


;--- PLAYER TURNS ---
[Statedef 803]
type = S
movetype = A
physics = S
anim = 803
ctrl = 0
sprpriority = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 804

[State Width]
type = width
trigger1 = 1
edge = 30, 30

[State 803, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -45, 0
[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -6, 0
[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 19, 0
[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
pos = 45, 0

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 1, 805, 810)
ctrl = 0


;--- TARGET ---
[Statedef 802]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


[Statedef 804]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;====< SEOI NAGE >==
;--- PLAYER ---
[Statedef 805]
type = S
movetype = A
physics = S
anim = 805
sprpriority = -1
ctrl = 0

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 805, Turn]
type = turn
trigger1 = !time && command = "holdfwd" && prevstateno = 810
[State 805, throw]
type = targetstate
trigger1 = !time
value = 806
[State 805, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 805, width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = 0, 22
[State 805, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = 0, 45

[State 805, throwsnd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0

[State 805, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 14, -92
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -5, -99
[State 805, Bind 3]
type = targetbind
trigger1 = animelem = 3
pos = -40, -60

[State 805, hurt]
type = targetlifeadd
trigger1 = animelem = 3
value = -ceil(ifelse(prevstateno = 810, 35, 111) * fvar(12))
[State 805, hurt]
type = targetpoweradd
trigger1 = animelem = 3
value = 36
[State 805, hurt]
type = poweradd
trigger1 = animelem = 3 && !var(20)
value = 72
[State 805, throw]
type = targetstate
trigger1 = animelem = 3
value = 807

[State 805, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2
x = ceil(2 * const(size.xscale))
[State 805, Turn]
type = turn
trigger1 = !animtime
[State 805, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 806]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806
[State 806, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 807]
type = A
movetype = H
physics = N
velset = 6, -5

[State 807, Accel]
type = gravity
trigger1 = 1

[State 807, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 807, hitground]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;====< TSUKAMI NAGE >==
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
sprpriority = -1
ctrl = 0

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 810, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 810, throw]
type = targetstate
trigger1 = !time
value = 815
[State 810, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 810, width]
type = width
trigger1 = 1
edge = 50, 0

[State 810, throwvar]
type = varset
trigger1 = !AIlevel && numtarget
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "x" || command = "y" || command = "z")
var(10) = 1
[State 810, End]
type = changestate
trigger1 = !animtime && var(10) = 1
value = 805

[State 810, End]
type = changestate
triggerall = !animtime
trigger1 = time >= (82 + var(15))
trigger2 = hitcount >= 8
trigger3 = numtarget
trigger3 = !(target, alive)
value = 811 

[State 810, Anim]
type = changeanim
triggerall = var(15) > 0 && animelemtime(4) < 0 && animelemtime(animelemno(0)) > -animelemtime(animelemno(0) + 1)
;animelemtime(animelemno(0)) > 2
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
value = 810
elem = animelemno(0) + 1
[State 810, throw]
type = targetstate
trigger1 = 1
value = ifelse(animelemtime(2) < 0, 815, ifelse(animelemtime(3) < 0, 816, ifelse(animelemtime(4) < 0, 815, 817)))

[State 810, mashvar]
type = varset
trigger1 = !time
var(15) = 0
[State 810, mashvar]
type = varadd
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
var(15) = 4
[State 810, mashvar]
type = varadd
triggerall = numtarget
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger2 = target, command = "a" || target, command = "b" || target, command = "c" || target, command = "start"
trigger3 = target, command = "up" || target, command = "down" || target, command = "back" || target, command = "fwd"
var(15) = -4
[State 810, mashvar]
type = varadd
trigger1 = var(15)
var(15) = ifelse(var(15) > 0, -1, ifelse(var(15) < 0, 1, 0))

[State 810, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
time = 1
add = 50, 50, 50

[State 810, hurt]
type = targetlifeadd
trigger1 = animelem = 2
value = -ceil(14 * fvar(12))

[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 3
channel = 0
[State 810, HitSound]
type = playsnd
trigger1 = animelem = 2
value = 2, 5

[State 821, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
pos = 30, -67
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 810, Hit]
type = hitadd
trigger1 = animelem = 2
value = 1
[State 810, Shake]
type = envshake
trigger1 = animelem = 2
time = 10
freq = 60
ampl = 3

[State 810, Bind 1]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger2 = animelemtime(3) >= 0
pos = 45, 0
[State 810, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 30, -67


;--- FINISH ---
[Statedef 811]
type = S
movetype = A
physics = S
anim = 811
sprpriority = -1
ctrl = 0

[State 811, throw]
type = targetstate
trigger1 = !time
value = 818
[State 811, throw]
type = targetfacing
trigger1 = time <= 1
value = -1
[State 810, width]
type = width
trigger1 = 1
edge = 20, 0

[State 811, mashvar]
type = varset
trigger1 = var(15)
var(15) = 0

[State 811, hurt]
type = targetlifeadd
trigger1 = animelem = 2
value = -ceil(21 * fvar(12))
[State 811, hurt]
type = targetpoweradd
trigger1 = animelem = 2
value = 36
[State 811, Power]
type = poweradd
trigger1 = animelem = 2 && !var(20)
value = 72

[State 811, throwsnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 6
channel = 0
[State 811, HitSound]
type = playsnd
trigger1 = animelem = 2
value = 2, 6

[State 821, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
pos = 30, -67
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 811, Hit]
type = hitadd
trigger1 = animelem = 2
value = 1
[State 811, Shake]
type = envshake
trigger1 = animelem = 2
time = 10
freq = 60
ampl = 4

[State 811, Bind 1]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger2 = animelem = 3
pos = 45, 0
[State 811, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 30, -67
[State 811, throw]
type = targetstate
trigger1 = animelem = 3
value = 819

[State 811, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 815]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 815, Anim]
type = changeanim2
trigger1 = 1
value = 815
[State 815, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 815, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0

[Statedef 816]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 816, Anim]
type = changeanim2
trigger1 = 1
value = 816
[State 816, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 816, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0

[Statedef 817]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 817, Anim]
type = changeanim2
trigger1 = 1
value = 817
[State 817, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 817, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0

[Statedef 818]
type = A
movetype = H
physics = N
velset = 0, 0
[State 818, Anim]
type = changeanim2
trigger1 = !time
value = 818
[State 818, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[Statedef 819]
type = A
movetype = H
physics = N
velset = 4, 6
[State 819, self]
type = selfstate
trigger1 = 1
value = 5020


;====< IZUNA OTOSHI >==
[Statedef 850]
type = A
movetype = A
physics = A
juggle = 8
ctrl = 0
anim = 850
sprpriority = 1
poweradd = 18 * !var(20)

[State 850, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = !var(38)
trigger1 = !time
attr = A, NT 
hitflag = AF
priority = 1, Miss
sparkno = -1
hitsound = s0, 800
p1facing = ifelse(vel x >= 0, -1, 1)
p2facing = -1
p1stateno = 855 
p2stateno = 856 
guard.dist = 0
fall = 1

[State 850, misssnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 0
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I


;--- PLAYER ---
[Statedef 855]
type = A
physics = N
movetype = A
anim = 855
ctrl = 0
sprpriority = 1
[State 855, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn
[State 855, width]
type = width
trigger1 = 1
edge = 50

[State 855, throw]
type = targetstate
trigger1 = !time
value = 857
[State 855, throw]
type = targetfacing
trigger1 = time <= 1
value = 1

[State 855, Snd]
type = playsnd
trigger1 = !time
value = 3, 8
channel = 0

[State 855, Vel]
type = velset
trigger1 = animelemtime(2) < 0 && !vel x
y = 0
[State 855, Accel]
type = gravity
trigger1 = 1
[State 855, accel]
type = velmul
trigger1 = animelemtime(2) > 0 && vel y > 1
y = 1.1
[State 855, accel]
type = velmul
trigger1 = animelemtime(2) > 0 && vel x
x = 0.95

[State 855, Vel]
type = velset
trigger1 = animelemtime(5) < 0 && pos y >= 0
y = 0
[State 855, Pos]
type = posset
trigger1 = animelemtime(5) < 0 && pos y >= 0
y = 0

[State 855, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 23, -77
[State 855, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 5, -75
[State 855, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -43, -65
[State 855, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -46, -47
[State 855, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0
pos = -29, -17

[State 855, End]
type = changestate
trigger1 = animelemtime(2) > 0 && vel y > 0 && pos y >= -5
value = 856


;--- HIT FLOOR ---
[Statedef 856]
type = A
physics = N
movetype = A
anim = 856
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 856, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn
[State 856, throw]
type = targetstate
trigger1 = !time
value = 858

[State 856, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0
[State 856, Vel]
type = velset
trigger1 = animelem = 2
x = 2
y = -4

[State 856, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
[State 856, Dust]
type = explod
trigger1 = !time
anim = 7120
ID = 7120
sprpriority = -2
postype = p1
pos = -36, 0
scale = 0.5, 0.5
ownpal = 1
[State 856, Shake]
type = envshake
trigger1 = !time
time = 12
freq = 120
ampl = 6

[State 856, Bind 1]
type = targetbind
trigger1 = animelem = 1
pos = -36, 0
[State 856, hurt]
type = targetlifeadd
trigger1 = animelem = 1
value = -ceil(125 * fvar(12))
[State 856, hurt]
type = targetpoweradd
trigger1 = animelem = 1
value = 36
[State 856, hurt]
type = poweradd
trigger1 = animelem = 1 && !var(20)
value = 72
[State 856, Snd]
type = playsnd
trigger1 = !time
value = 3, 6
channel = 0

[State 856, Type]
type = statetypeset
trigger1 = animelemtime(2) > 0
value = A
physics = A


;--- TARGET ---
[Statedef 857]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
[State 857, Anim]
type = changeanim2
trigger1 = !time
value = 857
[State 857, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0


;--- TARGET HIT FLOOR ---
[Statedef 858]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
[State 858, Anim]
type = changeanim2
trigger1 = !time
value = 858
[State 858, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -6
[State 858, Accel]
type = gravity
trigger1 = animelemtime(2) > 0

[State 858, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 858, End]
type = selfstate
trigger1 = animelemtime(2) > 0 && vel y > 0 && pos y >= -5
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
trigger1 = time = 2
value = 5000, 1
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 7, 3

[State 890, FX]
type = explod
trigger1 = !time
anim = 7000
ID = 7000
sprpriority = 5
postype = p1
pos = 0, -55
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
