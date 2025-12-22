;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = S				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 1				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 200				;Change animation (Def: no change)
poweradd = 0			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 0
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
sparkxy = -10 + 0 * (var(35) := 79), var(36) := -75
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 200, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type = S
movetype= A
physics = S
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 210

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
trigger2 = animelem = 5
value = 1, 1
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
damage = ceil(ifelse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 35), var(36) := -67
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
trigger2 = animelem = 6 && !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
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
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -90
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Punch
[Statedef 220]
type = S
movetype= A
physics = S
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 220

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 6
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 95 < 7, 7, fvar(11) * 95)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
[State 220, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Punch
[Statedef 225]
type = S
movetype= A
physics = S
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 225

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 0, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 95 < 7, 7, fvar(11) * 95)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
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
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 220, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type = S
movetype= A
physics = S
juggle = 0 ; 4
poweradd = 0
ctrl = 0
velset = 0,0
anim = 230

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 0
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
sparkxy = -10 + 0 * (var(35) := 74), var(36) := -43
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 230, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type = S
movetype= A
physics = S
juggle = 0 ; 5
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 240

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
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
damage = ceil(ifelse(fvar(11) * 66 < 7, 7, fvar(11) * 66)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 71), var(36) := -31
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 240, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
movetype= A
physics = S
juggle = 0 ; 5
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 250

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 95 < 7, 7, fvar(11) * 95)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
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
sparkxy = -10 + 0 * (var(35) := 102), var(36) := -34
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 250, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 255]
type = S
movetype= A
physics = S
juggle = 0 ; 5
poweradd = 18 * !var(20)
ctrl = 0
velset = 0,0
anim = 255

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 102 < 7, 7, fvar(11) * 102)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
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
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 250, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
movetype= A
physics = C
juggle = 0 ; 5
poweradd= 0
ctrl = 0
anim = 400

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 0
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
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -41
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 400, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
movetype= A
physics = C
juggle = 0 ; 6
poweradd = 18 * !var(20)
ctrl = 0
anim = 410

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
trigger2 = animelem = 5
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 91), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 102), var(36) := -44
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 410, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
movetype= A
physics = C
juggle = 0 ; 6
poweradd = 18 * !var(20)
ctrl = 0
anim = 420

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 && !movecontact && !movereversed
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -155
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 420, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
movetype= A
physics = C
juggle = 0 ; 5
poweradd= 0
ctrl = 0
anim = 430

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 29 < 7, 7, fvar(11) * 29)), 0
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
sparkxy = -10 + 0 * (var(35) := 71), var(36) := -1
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 430, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
movetype= A
physics = C
juggle = 0 ; 5
poweradd = 18 * !var(20)
ctrl = 0
anim = 440


[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -1
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48


[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
[State 440, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
movetype= A
physics = C
juggle = 0 ; 7
poweradd = 18 * !var(20)
ctrl = 0
anim = 450

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
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
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 135), var(36) := -3
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 450, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
movetype = A
juggle = 0 ; 0
poweradd= 0
ctrl = 0
anim = 600

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 0
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
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -80
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics = N
movetype = A
juggle = 0 ; 0
poweradd = 18 * !var(20)
ctrl = 0
anim = 610

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 73 < 7, 7, fvar(11) * 73)), 0
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
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -80
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52
;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
movetype= A
physics = N
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
anim = 620

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 95 < 7, 7, fvar(11) * 95)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -104
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
movetype= A
physics = N
juggle = 0 ; 3
poweradd= 0
ctrl = 0
anim = 630

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
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 2
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 0
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
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -18
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
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

;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
movetype= A
physics = N
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
anim = 640

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 0
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 66 < 7, 7, fvar(11) * 66)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Medium
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
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -18
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
movetype= A
physics = N
juggle = 0 ; 4
poweradd = 18 * !var(20)
ctrl = 0
anim = 650

[State 200, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 4, ifelse(random < 500, 1, 2)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 5
forcenofall = !var(20)
attr = A, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 0
getpower = 72 * !var(20), 36 * !var(20)
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
sparkxy = -10 + 0 * (var(35) := 39), var(36) := -26
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 600, Accel]
type = gravity
trigger1 = time >= 0
[State 600, End]
type = changestate
trigger1 = pos y > -vel y
value = 52

;---------------------------------------------------------------------------
; Throw - Attempt
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
trigger1 = !time
var(10) = (command = "kk")

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
trigger1 = animelem = 4
value = 4, 8
channel = 0

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


;---------------------------------------------------------------------------
; Throwing the opponent
[Statedef 810]
type = S
movetype= A
physics = N
anim = 810
poweradd = 0
sprpriority = -1

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

[State 801, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 0
pos = 64, 0

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(4)>=0 && AnimElemTime(5)<0
pos = 49, 0

[State 801, Bind 3]
type = TargetBind
trigger1 = AnimElem=5
pos = 30, 0

[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 13
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
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
trigger1 = numtarget && animelem = 13
value = 1
[State 810, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 13
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

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = S2,2
[State -2, Sparks]
type = helper
trigger1 = animelemtime(13)=0
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 30,0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Sparks]
type = helper
trigger1 = animelemtime(13)=0
helpertype = normal
stateno = 8110
ID = 8110
name = "Spark"
postype = p1
pos = 30,0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S1,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S4,0

[State 105, Snd]
type = playsnd
trigger1 = animelem = 17
value = 0, 105
[State 105, Dust]
type = helper
trigger1 = animelem = 17
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 810, Arm Overlay]
type = Explod
trigger1 = AnimElem = 12
anim = 10850
sprPriority = 3
bindTime = -1
posType = P1
removeOnGetHit = 1
ignoreHitPause = 0

[State 105, Vel]
type = velset
trigger1 = animelem = 17
x = -5.738
y = -5.132

[State 102, Accel]
type = veladd
trigger1 = animelemtime(17) >= 0
y = 0.665

[State 810, State End]
type = ChangeState
trigger1 = pos y > -vel y
value = 106


;---------------------------------------------------------------------------
; Opponent Thrown
; (a custom gethit state)
; Description: This is the state that the opponent changes to after being
;     hit by the throw HitDef. The important thing here is to use a
;     ChangeAnim2 controller. The difference between ChangeAnim2 and
;     ChangeAnim is that ChangeAnim2 changes the player's animation to
;     an action in the AIR file of the attacker (in this case, kfm.air),
;     whereas ChangeAnim always changes the player to an action in his
;     own AIR file. Look at Action 820 in kfm.air for some extra
;     comments.
[Statedef 815]
type = A
movetype= H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 815

[State 803, 2]
type = StateTypeSet
Trigger1 = Anim=815 &&AnimElem=5
statetype = L

[State 802, 1]
type = ChangeAnim
Trigger1 = Anim=815 && AnimTime = 0
value = 5080

[State 5421, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 6 && Anim = 815
value = F7,1

[State 5421, Hitting the Floor FX]
type = Explod
trigger1 = AnimElem = 6 && Anim = 815
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 803, 2]
type = SelfState
Trigger1 = Time>=136
value = 5120+(!alive)*30

;---------------------------------------------------------------------------
; Throwing the opponent
[Statedef 820]
type = A
physics = N
movetype = A
anim = 820
ctrl = 0
velset = 0, 0
sprpriority = -1

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
trigger1 = command = "holdback"
var(0) = 1

[State 810, Turn]
type = turn
trigger1 = !time && var(0)

[State 810, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 825
[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Arm]
type = Explod
trigger1 = AnimElem = 9
anim = 822
id = 822
sprpriority = 2
postype = P1
pos = 0,0
removeongethit = 1
ignorehitpause = 1
bindtime = -1
ownpal = 0

[State 810, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 18
value = floor(ifelse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill = 1

[State 810, Hit]
type = hitadd
trigger1 = numtarget && animelem = 18
value = 1
[State 810, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 18
var(13) = 1

[State 810, Juggle]
type = varadd
trigger1 = numtarget && animelem = 18
var(15) = 1
ignorehitpause = 1
[State 810, Juggle]
type = varset
trigger1 = numtarget && animelem = 18
var(16) = 1
ignorehitpause = 1

[State 820, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 37,0

[State 820, Bind 2]
type = targetbind
trigger1 = AnimElemTime(2)>=0 && AnimElemTime(3)<0
pos = 57,0

[State 820, Bind 3]
type = targetbind
trigger1 = AnimElemTime(3)>=0 && AnimElemTime(5)<0
pos = 62, 0

[State 820, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7)<0
pos = 33,-88

[State 820, Bind 5]
type = TargetBind
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(18)<0
pos = 30,-69

[State 820, Bind 6]
type = TargetBind
trigger1 = AnimElem= 18
pos = 52,0

[State 820, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,0
channel = 0

[State 820, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 9
value = 2,820
channel = 0

[State 832, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = 4,10
channel = 0

[State 820, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = S2,2

[State 820, Sparks]
type = helper
trigger1 = animelemtime(18)=0
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 28,-70
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 0, Pause]
type = Pause
trigger1 = animelemtime(18)=0
time = 12

[State 801, Voice]
type = TargetState
trigger1 = AnimElem = 18
value = 826

[State 820, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Target
[Statedef 825]
type = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 827, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 825

[Statedef 826]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 826, 1]
type = ChangeAnim2
Trigger1 = !time
value = 826
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
x = -5.32
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



;===<THROW ESCAPED>==
[StateDef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State 890, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 895

[State 890, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 890, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 890, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5940,0
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 0,760

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -68
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1


;Target Escape
[StateDef 895]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5945), 5945, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1
