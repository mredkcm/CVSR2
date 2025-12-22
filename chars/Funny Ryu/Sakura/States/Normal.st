; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< NORMAL STATES >====
;====

;=< Stand Light Punch >==
[Statedef 200]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 200
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -71
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

[State 205, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0
[State 205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 205
attr = S, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -69
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
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
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -66
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
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
trigger1 = animelemtime(4) >= 0
movetype = I

[State 205, End]
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
anim = ifelse((prevstateno = 710 || p2bodydist x <= (const(size.xscale) * 25)), 211, 210)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -65
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
trigger1 = animelem = 3 && anim = 211
attr = S, NA
damage = 64, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -58
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
trigger1 = animelem = 4 && anim = 211 && !movecontact && !movereversed
attr = S, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -101
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
trigger1 = anim = 210 && animelemtime(4) >= 0
trigger2 = anim = 211 && animelemtime(5) >= 0
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

[State 215, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 215, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 215, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, ifelse((anim = 216), -39, -54)
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

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
anim = 220
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -64
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
trigger1 = animelem = 4 && prevstateno = 710
attr = S, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -64
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.hittime = 15 + 3 * var(29)
ground.slidetime = 15 + 3 * var(29)
ground.velocity = -6, -3
air.type = Low
air.velocity = -6, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=< Flower Kick >==
[Statedef 222]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 222
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 222, Vel]
type = velset
trigger1 = animelem = 4
x = 3

[State 222, Snd]
type = playsnd
trigger1 = animelem = 5 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0
[State 222, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
channel = 1

[State 222, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = HAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -84
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

[State 222, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 6 && !movecontact && !movereversed
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -34
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
trigger1 = anim = 222 && animelemtime(7) >= 0
movetype = I

[State 222, End]
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
anim = ifelse((prevstateno = 710 || p2bodydist x <= (const(size.xscale) * 25)), 226, 225)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = ifelse(p2bodydist x <= (const(size.xscale) * 25), 1, -1)
ctrl = 0
facep2 = 1

[State 225, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -72
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
sprpriority = -1
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 225, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 226
attr = S, NA
damage = 64, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -90
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
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


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

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -36
hitsound = s2, 1
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

[State 235, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 6)
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
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -56
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

[State 235, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && !movecontact && !movereversed
attr = C, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -5
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
down.velocity = -3, -3
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
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -35
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

[State 240, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && !movecontact && !movereversed
attr = C, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -86
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

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -5
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

[State 250, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
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
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -38
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
trigger1 = animelemtime(3) >= 0
movetype = I

[State 250, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=< Crouch Hard Kick >==
[Statedef 255]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 255
velset = 0, 0
poweradd = 18 * (!var(20) && prevstateno != 750)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0
[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(3) < 0
value = SCA
time = 1

[State 255, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -10
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
yaccel = 0.67
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 255, Hit]
type = hitdef
trigger1 = animelem = 3 && prevstateno = 750
attr = C, SA
damage = 60, 0
animtype = Back
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -10
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
trigger1 = animelemtime(4) >= 0
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

[State 260, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -42
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -3.12, -5.62)
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
trigger1 = animelemtime(5) >= 0
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

[State 265, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -85
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -5.05, -9.22)
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

[State 270, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -64
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -6.83, -12.65)
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

[State 270, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && !movecontact && !movereversed
attr = A, NA
damage = 60, 0 
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -32
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -6.83, -12.65)
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

[State 270, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I


;=< Air Light Kick >==
[Statedef 275]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 275
poweradd = 0
sprpriority = 1
ctrl = 0

[State 275, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 275, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 275, Hit]
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -52
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -3.12, -5.62)
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
trigger1 = animelemtime(5) >= 0
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

[State 280, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0
[State 280, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 280, Hit]
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
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -34
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -5.05, -9.22)
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
anim = 285
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0

[State 285, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0
[State 285, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 285, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = A, NA
damage = 60, 0 
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -20
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -3.12, -5.62), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.44, -9.83)
guard.velocity = ifelse(var(20), -6.83, -12.65)
guard.cornerpush.veloff = 0;ifelse(var(20), -8.83, -17.2)
air.type = Low
air.velocity = -5, 0
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

[State 285, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I


;=
;===< THROWS >==
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
var(10) = ifelse(command = "2p", 2, 1)
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 2, 1)

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
trigger1 = animelem = 2 && var(10) = 1
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss 
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdback") || (AIlevel && frontedgedist > backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdback") || (AIlevel && frontedgedist > backedgedist), 803, 801) 
animtype = Back
ground.velocity = -6, -3
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10) = 2
trigger1 = !var(38)
attr = S, NT
hitflag = M-
priority = 1, Miss 
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdback") || (AIlevel && frontedgedist > backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdback") || (AIlevel && frontedgedist > backedgedist), 803, 801) 
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 800, misssnd]
type = playsnd
trigger1 = animelem = 4
value = 5000, ifelse(random < 500, 1, 4)
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

[State 801, End]
type = changestate
trigger1 = numtarget
trigger1 = (target, const(size.head.pos.y)) > -65
value = 830
ctrl = 0
[State 801, End]
type = changestate
trigger1 = 1
value = ifelse(var(10) = 1, 810, 820)
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
pos = -40, 0
[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -10, 0
[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 10, 0

[State 801, End]
type = changestate
trigger1 = animelemtime(4) >= 0 && var(10) = 2 && numtarget
trigger1 = (target, const(size.head.pos.y)) > -65
value = 830
ctrl = 0
[State 803, End]
type = changestate
trigger1 = animelemtime(4) >= 0
value = ifelse(var(10) = 1, 810, 820)
ctrl = 0
[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
pos = 40, 0


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


;====< SAILOR SHOOT >==
;--- PLAYER ---
[Statedef 810]
type = A
movetype = A
physics = N
anim = 810
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 810, throw]
type = targetstate
trigger1 = !time
value = 811
[State 810, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

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

[State 810, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 810, width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
edge = 45, 0
[State 810, width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = 75, 0

[State 810, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 25, 0, foot
[State 810, Bind 2]
type = bindtotarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 32, 50 + floor(0.5 * (target, const(size.head.pos.y) + target, const(size.mid.pos.y)))
[State 810, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
pos = 43, 50 + floor(0.5 * (target, const(size.head.pos.y) + target, const(size.mid.pos.y)))

[State 810, Power]
type = poweradd
trigger1 = animelem = 5 && !var(20)
value = 72
[State 810, hurt]
type = targetlifeadd
trigger1 = animelem = 5
value = -ceil(125 * fvar(12))
[State 810, hurt]
type = targetpoweradd
trigger1 = animelem = 5
value = 36
[State 810, throw]
type = targetstate
trigger1 = animelem = 6
value = 812

[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0
[State 810, HitSound]
type = playsnd
trigger1 = animelem = 5
value = 2, 6
[State 810, Sparks]
type = explod
trigger1 = animelem = 5
anim = 7010 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = 70, -48
removetime = -2
ownpal = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 810, Vel]
type = velset
trigger1 = animelem = 6
x = -4
y = -6
[State 810, Turn]
type = turn
trigger1 = animelem = 9
[State 810, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A
physics = N
[State 810, Accel]
type = gravity
trigger1 = animelemtime(6) >= 0

[State 810, End]
type = changestate
trigger1 = animelemtime(6) >= 0 && vel y > 0 && pos y > 0
value = 52


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

[Statedef 812]
type = A
movetype = H
physics = N
[State 812, Accel]
type = gravity
trigger1 = 1
[State 812, End]
type = selfstate
trigger1 = 1
value = 5020


;====< SAKURA JIME >==
;--- PLAYER ---
[Statedef 820]
type = A
movetype = A
physics = S
anim = 820
sprpriority = 1
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

[State 820, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 820, throw]
type = targetstate
trigger1 = !time
value = 825
[State 820, throw]
type = targetfacing
trigger1 = time <= 1
value = -1
[State 820, Anim]
type = changeanim
trigger1 = !animtime && anim = 820
value = 821

[State 820, End]
type = changestate
triggerall = !animtime && anim = 821
trigger1 = time >= (181 + var(15))
trigger2 = hitcount >= 11
trigger3 = numtarget
trigger3 = !(target, alive)
value = 823 

[State 820, Anim]
type = changeanim
triggerall = anim = 821 && animelemtime(6) < 0 && var(15) > 0
triggerall = animelemtime(animelemno(0)) > 1
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
value = 821
elem = animelemno(0) + 1
[State 820, throw]
type = targetstate
trigger1 = anim = 821
value = ifelse(animelemtime(5) < 0, 826, ifelse(animelemtime(6) < 6, 827, 826))

[State 820, Pos]
type = posset
trigger1 = anim = 820 && animelemtime(5) >= 0 && pos y >= 0
y = 0
[State 820, Pos]
type = posset
trigger1 = anim = 820 && animelemtime(4) >= 0 && animelemtime(5) < 0 && pos y >= 1
trigger2 = anim = 821 && animelemtime(5) >= 0 && animelemtime(6) < 0 && pos y >= 1
y = 1
[State 820, Pos]
type = posset
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0 && pos y >= 2
y = 2
[State 820, Pos]
type = posset
trigger1 = anim = 821 && animelemtime(1) >= 0 && animelemtime(2) < 0 && pos y >= 7
trigger2 = anim = 821 && animelemtime(3) >= 0 && animelemtime(4) < 0 && pos y >= 7
y = 7
[State 820, Pos]
type = posset
trigger1 = anim = 821 && animelemtime(2) >= 0 && animelemtime(3) < 0 && pos y >= 9
trigger2 = anim = 821 && animelemtime(4) >= 0 && animelemtime(5) < 0 && pos y >= 9
y = 9

[State 820, mashvar]
type = varset
trigger1 = !time
var(15) = 0
[State 820, mashvar]
type = varadd
triggerall = anim = 821
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
var(15) = 4
[State 820, mashvar]
type = varadd
triggerall = anim = 821 && numtarget
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger2 = target, command = "a" || target, command = "b" || target, command = "c" || target, command = "start"
trigger3 = target, command = "up" || target, command = "down" || target, command = "back" || target, command = "fwd"
var(15) = -4
[State 820, mashvar]
type = varadd
trigger1 = var(15)
var(15) = ifelse(var(15) > 0, -1, ifelse(var(15) < 0, 1, 0))

[State 820, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger4 = AIlevel && !(time % 3)
time = 1
add = 50, 50, 50

[State 820, throwsnd]
type = playsnd
trigger1 = anim = 821 && animelem = 2
value = 3, 6
channel = 0

[State 820, hurt]
type = targetlifeadd
trigger1 = anim = 821 && animelem = 2
value = -ceil(14 * fvar(12))

[State 820, HitSound]
type = playsnd
trigger1 = anim = 821 && animelem = 2
value = 2, 8
[State 820, Spark]
type = explod
trigger1 = anim = 821 && animelem = 2
anim = 7010 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
removetime = -2
ownpal = 1
pausemovetime = 100
supermovetime = 100

[State 820, Hit]
type = hitadd
trigger1 = anim = 821 && animelem = 2
value = 1
[State 820, Shake]
type = envshake
trigger1 = anim = 821 && animelem = 2
time = 10
freq = 60
ampl = 2

[State 820, width]
type = width
trigger1 = anim = 820 && animelemtime(5) >= 0
edge = 20, 0

[State 820, Bind Others];5000, 0 axis at neck
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
pos = -ceil(0.5 * target, const(size.ground.back)), 10, head
[State 820];5000, 10
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
pos = -ceil(1 * target, const(size.ground.back)), 10, head
[State 820];5000, 20
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
pos = -ceil(1.5 * target, const(size.ground.back)), 10, head

[State 820, Bind Sakura]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = -11, -75
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = -24, -75
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = -38, -76

[State 820, Bind Cammy]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = -12, -76
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = -26, -79
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = -36, -75

[State 820, Bind Chun -Li]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Chun -Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli" && target, authorname = "Warusaki3"
pos = -2, -78
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Chun -Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli" && target, authorname = "Warusaki3"
pos = -21, -77
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Chun -Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli" && target, authorname = "Warusaki3"
pos = -36, -71

[State 820, Bind Dan]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-10 * target, const(size.xscale)), ceil(-151 * target, const(size.yscale))
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-38 * target, const(size.xscale)), ceil(-158 * target, const(size.yscale))
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-59 * target, const(size.xscale)), ceil(-158 * target, const(size.yscale))

[State 820, Bind Geese]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese" && target, authorname = "Warusaki3"
pos = -7, -93
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese" && target, authorname = "Warusaki3"
pos = -17, -94
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese" && target, authorname = "Warusaki3"
pos = -37, -89

[State 820, Bind Guy]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = -3, -81
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = -16, -81
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = -24, -82

[State 820, Bind Honda]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-6 * target, const(size.xscale)), ceil(-76 * target, const(size.yscale))
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-24 * target, const(size.xscale)), ceil(-83 * target, const(size.yscale))
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
pos = ceil(-42 * target, const(size.xscale)), ceil(-82 * target, const(size.yscale))

[State 820, Bind Karin]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = -11, -67
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = -33, -68
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = -46, -66

[State 820, Bind Lei -Lei]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Lei -Lei" && target, authorname = "Phantom.of.the.Server"
pos = -15, -60
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Lei -Lei" && target, authorname = "Phantom.of.the.Server"
pos = -17, -59
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Lei -Lei" && target, authorname = "Phantom.of.the.Server"
pos = -40, -50

[State 820, Bind Morrigan]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = -1, -76
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = -11, -71
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = -41, -63

[State 820, Bind Nakoruru]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = -5, -69
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = -16, -68
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = -26, -64

[State 820, Bind Nash]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = -15, -82
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = -35, -81
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = -50, -74

[State 820, Bind Vega]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -6, -87
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -24, -90
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -34, -92

[State 820, Bind Yuri]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri" && target, authorname = "Warusaki3"
pos = -5, -73
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri" && target, authorname = "Warusaki3"
pos = -19, -76
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri" && target, authorname = "Warusaki3"
pos = -31, -76

[State 820, Bind CvSShotos]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = (target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki") && target, authorname = "Warusaki3"
pos = 0, -85
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = (target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki") && target, authorname = "Warusaki3"
pos = -20, -86
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = (target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki") && target, authorname = "Warusaki3"
pos = -36, -83

[State 820, Bind KFM]
type = bindtotarget
trigger1 = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -10, -82
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -19, -79
[State 820]
type = bindtotarget
trigger1 = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -36, -80

[State 820, Bind SFZ Shotos]
type = bindtotarget
triggerall = numtarget && (anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0)
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Funny Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
pos = -6, -74
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0))
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Funny Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
pos = -20, -75
[State 820]
type = bindtotarget
triggerall = numtarget && ((anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6))
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Funny Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
pos = -32, -75


;--- FINISH ---
[Statedef 823]
type = A
movetype = A
physics = S
anim = 823
sprpriority = 1
ctrl = 0

[State 823, Camera]
type = screenbound
trigger1 = animelemtime(4) < 0
value = 1
movecamera = 0, 0
[State 823, throw]
type = targetstate
trigger1 = !time
value = 828
[State 823, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 823, mashvar]
type = varset
trigger1 = var(15)
var(15) = 0

[State 823, fixpos]
type = posadd
trigger1 = animelem = 4
x = -2
y = 79

[State 823, hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -ceil(68 * fvar(12))
[State 823, hurt]
type = targetpoweradd
trigger1 = animelem = 4
value = 36
[State 820, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 72

[State 810, throw]
type = targetstate
trigger1 = animelem = 4
value = 829

[State 823, throwsnd]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0
[State 823, HitSound]
type = playsnd
trigger1 = animelem = 4
value = 2, 3
[State 823, Spark]
type = explod
trigger1 = animelem = 4
anim = 7010 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = -27, -66
removetime = -2
ownpal = 1
pausemovetime = 100
supermovetime = 100

[State 823, Hit]
type = hitadd
trigger1 = animelem = 4
value = 1
[State 823, Shake]
type = envshake
trigger1 = animelem = 4
time = 10
freq = 60
ampl = 3

[State 823, Accel]
type = gravity
trigger1 = animelemtime(5) >= 0

[State 823, End]
type = changestate
trigger1 = animelemtime(5) >= 0 && vel y > 0 && pos y > 0
value = 52


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
[State 825, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0
[State 825, freeze]
type = posfreeze
trigger1 = 1
value = 1

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
[State 826, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0
[State 826, freeze]
type = posfreeze
trigger1 = 1
value = 1

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
[State 827, Flash]
type = palfx
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c" || command = "start"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 100, 0, 0
[State 827, freeze]
type = posfreeze
trigger1 = 1
value = 1

[Statedef 828]
type = A
movetype = H
physics = N
velset = 0, 0
[State 828, Anim]
type = changeanim2
trigger1 = !time
value = 828
[State 828, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[Statedef 829]
type = A
movetype = H
physics = N
velset = 4, 6
[State 829, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0
[State 829, Accel]
type = gravity
trigger1 = 1
[State 829, hitground]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5100


;====< RIVAL SCHOOLS THROW >==
;--- PLAYER ---
[Statedef 830]
type = S
movetype = A
physics = S
anim = 830
ctrl = 0
sprpriority = 1

[State 830, throw]
type = targetstate
trigger1 = !time
value = 835

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

[State 830, width]
type = width
trigger1 = animtime
edge = 50, 0

[State 830, width]
type = width
trigger1 = animelemtime(16) < 0
edge = 65, 0
[State 830, width]
type = width
trigger1 = animelemtime(16) >= 0 && animelemtime(17) < 0
edge = 65, 0

[State 830, throw snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 1
channel = 0
[State 830, throw snd]
type = playsnd
trigger1 = animelem = 14
value = 3, 6
channel = 0

[State 830, Bind 1]
type = targetbind
trigger1 = animelemtime(5) < 0
pos = 60, 0

[State 830, hurt]
type = targetlifeadd
trigger1 = animelem = 5
value = -ceil(63 * fvar(12))
kill = 0
[State 830, throw]
type = targetstate
trigger1 = animelem = 5
value = 836

[State 830, hurt]
type = targetlifeadd
trigger1 = animelem = 16
value = -ceil(63 * fvar(12))
kill = 1
[State 830, Power]
type = poweradd
trigger1 = animelem = 16 && !var(20)
value = 72
[State 830, hurt]
type = targetpoweradd
trigger1 = animelem = 16
value = 36
[State 830, throw]
type = targetstate
trigger1 = animelem = 16
value = 837

[State 830, HitSound]
type = playsnd
trigger1 = animelem = 5 || animelem = 16
value = 2, ifelse((animelem = 5), 3, 6)
[State 830, Sparks]
type = explod
trigger1 = animelem = 5 || animelem = 16
anim = 7010 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = ifelse((animelem = 5), 49, 60), ifelse((animelem = 5), -80, -86)
ownpal = 1
facing = -1
pausemovetime = 100
supermovetime = 100
[State 830, Hit]
type = hitadd
trigger1 = animelem = 5 || animelem = 16
value = 1
[State 830, Shake]
type = envshake
trigger1 = animelem = 5 || animelem = 16
time = 10
freq = 60
ampl = 2

[State 830, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 835]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 835, Anim]
type = changeanim2
trigger1 = !time
value = 835
[State 835, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 836]
type = A
movetype = H
physics = N
velset = 0, -10
sprpriority = 0
[State 836, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 836, Anim]
type = changeanim2
trigger1 = !time
value = 836
[State 836, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 836, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100

[Statedef 837]
type = A
movetype = H
physics = N
velset = -4, -8
sprpriority = 0
[State 837, Accel]
type = gravity
trigger1 = 1
[State 837, Anim]
type = changeanim2
trigger1 = !time
value = 837

[State 837, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 837, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;====< SAILOR FLY >==
;--- ATTEMPT ---
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
p1facing = ifelse((!AIlevel && command = "holdback") || (AIlevel && frontedgedist > backedgedist), -1, 1)
p2facing = 1
p1stateno = 860
animtype = Back
air.velocity = -6, 3
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 850, misssnd]
type = playsnd
trigger1 = animelem = 3
value = 5000, ifelse(random < 500, 1, 4)
channel = 0
[State 850, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I


;--- PLAYER ---
[Statedef 860]
type = A
movetype = A
physics = N
anim = 810
sprpriority = 1
ctrl = 0

[State Throw]
type = targetstate
trigger1 = !time
value = 861

[State 860, throw]
type = targetstate
trigger1 = !time
value = 861
[State 860, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, Vel]
type = velset
trigger1 = animelemtime(6) < 0 && pos y >= -60
x = 0
y = 0
[State 860, Pos]
type = posset
trigger1 = animelemtime(6) < 0 && pos y >= -60
y = -60
[State 860, Vel]
type = velmul
trigger1 = animelemtime(6) < 0
x = 0.9
[State 860, Vel]
type = veladd
trigger1 = animelemtime(6) < 0 && pos y < -60
y = ifelse(vel y <= 0, 0.5, 0.25)

[State 860, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 25, 0, foot
[State 860, Bind 2]
type = bindtotarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 32, 50 + floor(0.5 * (target, const(size.head.pos.y) + target, const(size.mid.pos.y)))
[State 860, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
pos = 43, 50 + floor(0.5 * (target, const(size.head.pos.y) + target, const(size.mid.pos.y)))

[State 860, Power]
type = poweradd
trigger1 = animelem = 5 && !var(20)
value = 72
[State 860, hurt]
type = targetlifeadd
trigger1 = animelem = 5
value = -ceil(125 * fvar(12))
[State 860, hurt]
type = targetpoweradd
trigger1 = animelem = 5
value = 36
[State 860, throw]
type = targetstate
trigger1 = animelem = 6
value = 862

[State 860, throwsnd]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0
[State 860, HitSound]
type = playsnd
trigger1 = animelem = 5
value = 2, 6
[State 860, Sparks]
type = explod
trigger1 = animelem = 5
anim = 7010 + (random % 8)
ID = 7000
sprpriority = 5
postype = p1
pos = 70, -48
removetime = -2
ownpal = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 810, Vel]
type = veladd
trigger1 = animelem = 6
x = -4
y = -6
[State 860, Turn]
type = turn
trigger1 = animelem = 9
[State 860, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A
physics = N
[State 860, Accel]
type = gravity
trigger1 = animelemtime(6) >= 0

[State 860, End]
type = changestate
trigger1 = animelemtime(6) >= 0 && vel y > 0 && pos y > 0
value = 52


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
value = 811

[Statedef 862]
type = A
movetype = H
physics = N
[State 862, Accel]
type = gravity
trigger1 = 1
[State 862, End]
type = selfstate
trigger1 = 1
value = 5020


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
