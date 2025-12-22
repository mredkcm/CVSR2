; _______________________________________
;| Edmond Honda by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;SUPER STATES


;ONI MUSOU
[Statedef 3000]
type = S
physics = N
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000
facep2 = 1

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
time = 1
value = SCA

[State 3000, Snd]
type = playsnd
trigger1 = time = 3
value = 5, 4
channel = 0

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 3000, Variable Height]
type = playerpush
trigger1 = statetype = A && numenemy
trigger1 = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = L && p2stateno != 5120
trigger1 = p2dist y >= -16
value = 0
ignorehitpause = 1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 41
[State 3000, Dust]
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

[State 3000, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 3000, Vel]
type = velset
trigger1 = animelem = 5
x = 10.64 * const(size.xscale)
y = 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 3000, Shield]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3005
ID = 3005
name = "Shield"
postype = p1
ownpal = 1
[State 3000, Shield]
type = hitby
trigger1 = numhelper(3005)
value = SCA, AA, AT
time = 1
ignorehitpause = 1

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !var(16) && var(15) < 2
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
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
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 21), var(36) := -87
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !movecontact && !movereversed
trigger1 = !var(16) && var(15) < 2
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && var(15) < 2
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -47
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3000, End]
type = changestate
trigger1 = animelemtime(5) >= 17
trigger2 = animelemtime(5) > 0
trigger2 = movecontact = 1 || movereversed = 1
trigger3 = animelemtime(5) >= 3
trigger3 = frontedgebodydist <= 0
value = 3001


;--- Second ---
[Statedef 3001]
type = S
physics = N
movetype = A
anim = 3001
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3001, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 52
[State 3001, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3001, Variable Height]
type = playerpush
trigger1 = statetype = A && numenemy
trigger1 = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = L && p2stateno != 5120
trigger1 = p2dist y >= -16
value = 0
ignorehitpause = 1

[State 3001, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 41
[State 3001, Dust]
type = helper
trigger1 = animelem = 11
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3001, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
statetype = A
physics = N

[State 3001, Vel]
type = velset
trigger1 = animelem = 11
x = 10.64 * const(size.xscale)
y = 0

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = !var(16) && var(15) < 2
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
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
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 21), var(36) := -87
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 10
trigger1 = movecontact < 4 && movereversed < 4
trigger1 = !var(16) && var(15) < 2
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 11
trigger1 = !var(16) && var(15) < 2
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 104 < 7, 7, fvar(11) * 104)), 13
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32, -7.49
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -47
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3001, End]
type = changestate
trigger1 = animelemtime(11) > 0
trigger1 = movecontact = 1 || movereversed = 1
value = 3002

[State 3001, End]
type = changestate
trigger1 = animelemtime(11) >= 17
trigger2 = animelemtime(11) > 0
trigger2 = movecontact = 1 || movereversed = 1
trigger3 = animelemtime(11) >= 3
trigger3 = frontedgebodydist <= 0
value = 3002


;--- Recover ---
[Statedef 3002]
type = S
physics = N
movetype = I
anim = 3002
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3002, Pos]
type = posset
trigger1 = animelem = 5
y = 0

[State 3002, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 52
[State 3002, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;MAX ONI MUSOU
[Statedef 3050]
type = S
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000
facep2 = 1

[State 3050, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3050, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3050, 4999]) && var(8)
[State 3050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3050, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 45

[State 3050, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3050, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(5) < 2
time = 1
value = SCA

[State 3050, Snd]
type = playsnd
trigger1 = time = 3
value = 5, 4
channel = 0

[State 3050, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3050, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 3050, Variable Height]
type = playerpush
trigger1 = statetype = A && numenemy
trigger1 = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = L && p2stateno != 5120
trigger1 = p2dist y >= -16
value = 0
ignorehitpause = 1

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 41
[State 3050, Dust]
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

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 3050, Vel]
type = velset
trigger1 = animelem = 5
x = 10.64 * const(size.xscale)
y = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 3050, Shield]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3055
ID = 3055
name = "Shield"
postype = p1
ownpal = 1
[State 3050, Shield]
type = hitby
trigger1 = numhelper(3055)
value = SCA, AA, AT
time = 1
ignorehitpause = 1

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !var(16) && var(15) < 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 21), var(36) := -87
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && var(15) < 4
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -47
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3050, End]
type = changestate
trigger1 = animelemtime(5) >= 32
trigger2 = animelemtime(5) > 0
trigger2 = movecontact = 1 || movereversed = 1
trigger3 = animelemtime(5) >= 3
trigger3 = frontedgebodydist <= 0
value = 3051


;--- Second ---
[Statedef 3051]
type = S
physics = N
movetype = A
anim = 3051
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3051, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 52
[State 3051, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3051, Variable Height]
type = playerpush
trigger1 = statetype = A && numenemy
trigger1 = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = L && p2stateno != 5120
trigger1 = p2dist y >= -16
value = 0
ignorehitpause = 1

[State 3051, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 41
[State 3051, Dust]
type = helper
trigger1 = animelem = 11
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3051, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0
statetype = A
physics = N

[State 3051, Vel]
type = velset
trigger1 = animelem = 11
x = 10.64 * const(size.xscale)
y = 0

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = !var(16) && var(15) < 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
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
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 21), var(36) := -87
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 10
trigger1 = !var(16) && var(15) < 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -66
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 11
trigger1 = !var(16) && var(15) < 4
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 59), var(36) := -47
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3051, End]
type = changestate
trigger1 = animelemtime(11) > 0
trigger1 = movecontact = 1 || movereversed = 1
value = 3052

[State 3051, End]
type = changestate
trigger1 = animelemtime(11) >= 32
trigger2 = animelemtime(11) > 0
trigger2 = movecontact = 1 || movereversed = 1
trigger3 = animelemtime(11) >= 3
trigger3 = frontedgebodydist <= 0
value = 3052


;--- Slaps ---
[Statedef 3052]
type = S
physics = N
movetype = A
anim = 3052
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 52
[State 3052, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 9
value = 0, 102
[State 3052, Dust]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3052, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.9880965
[State 3052, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3052, Vel]
type = velset
trigger1 = animelem = 8
x = 11.40;71.5;85, 8125

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 9
value = 4, 4
channel = 0

[State 1030, Snd]
type = playsnd
trigger1 = animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17 || animelem = 19
value = 1, 2
channel = 1

[State 3052, Spark XY]
type = null
trigger1 = animelem = 9 || animelem = 15
trigger1 = var(35) := 120 || var(36) := -55
trigger2 = animelem = 11 || animelem = 17
trigger2 = var(35) := 113 || var(36) := -26
trigger3 = animelem = 13 || animelem = 19
trigger3 = var(35) := 111 || var(36) := -84

[State 3052, Hit High]
type = hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 13
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.88
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3052, Hit Low]
type = hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 9 || animelem = 11 || animelem = 15 || animelem = 17
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
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
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.88
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3052, Hit Final]
type = hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 19
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32, -6.88
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.88
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3052, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;OROCHI KUDAKI
;--- Startup ---
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -3000
facep2 = 1

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3100, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 47

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3100, Snd]
type = playsnd
trigger1 = time = 2
value = 4, 7
channel = 0

[State 3100, Superpause FX]
type = helper
trigger1 = time = 2
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(72 * const(size.xscale)), ceil(-60 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3100, Superpause]
type = superpause
trigger1 = time = 2
time = 47
movetime = 47
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 3100, Guard Dist]
type = attackdist
trigger1 = 1
value = 0

[State 3100, Safety]
type = superpause
trigger1 = animelem = 4 && numenemy
trigger1 = p2dist x >= 0 && p2bodydist x <= ceil(32 * const(size.xscale))
trigger1 = (enemynear, hitover || !(enemynear, movetype = H) || var(21)) && !(enemynear, stateno = [150, 155]) && enemynear, anim != 5040
trigger1 = !(enemynear, stateno = 40 && enemynear, time >= 1) && !(enemynear, stateno = 52 && !(enemynear, ctrl) && enemynear, prevstateno = [5020, 5040])
time = 0
p2defmul = 1
anim = -1
sound = -1
darken = 0

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 4 && !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= ceil(32 * const(size.xscale))
attr = S, HT
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -60
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
numhits = 0
p1stateno = 3110

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 800
channel = 0
[State 3100, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 0
channel = 1

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 3100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Throw ---
[Statedef 3110]
type = A
physics = N
movetype = A
anim = 3110
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3110, Safety]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 3110, Throw]
type = targetstate
trigger1 = !time && numtarget
value = 3120
[State 3110, Throw]
type = targetfacing
trigger1 = time <= 3
value = 1

[State 3110, Pos]
type = posadd
trigger1 = animelem = 10
x = ceil(68 * const(size.xscale))

[State 3110, Width]
type = width
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
edge = ceil(18 * const(size.xscale)), 0
[State 3110, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
edge = ceil(79 * const(size.xscale)), 0
[State 3110, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(12) >= 0
edge = ceil(87 * const(size.xscale)), 0
[State 3110, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(10) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 3110, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = ceil(21 * const(size.xscale)), ceil(-115 * const(size.yscale))
[State 3110, Bind 2]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = ceil(56 * const(size.xscale)), ceil(-112 * const(size.yscale))
[State 3110, Bind 3]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = ceil(90 * const(size.xscale)), ceil(-98 * const(size.yscale))
[State 3110, Bind 4]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(12) >= 0
pos = ceil(87 * const(size.xscale)), ceil(-8 * const(size.yscale))
[State 3110, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = ceil(47 * const(size.xscale)), ceil(-22 * const(size.yscale))
[State 3110, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = ceil(44 * const(size.xscale)), ceil(-76 * const(size.yscale))
[State 3110, Bind 9]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = ceil(40 * const(size.xscale)), ceil(-110 * const(size.yscale))

[State 3110, Damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 4
value = floor(ifelse(fvar(11) * 125 < 7, -7, -125))
kill = 0
[State 3110, Power]
type = targetpoweradd
trigger1 = numtarget && animelem = 4
value = 36

[State 3110, Hit]
type = hitadd
trigger1 = numtarget && animelem = 4
value = 1
[State 3110, Hitcount]
type = varadd
trigger1 = numtarget && animelem = 4
var(13) = 1

[State 3110, Juggle]
type = varadd
trigger1 = numtarget && animelem = 4
var(15) = 1
ignorehitpause = 1
[State 3110, Juggle]
type = varset
trigger1 = numtarget && animelem = 4
var(16) = 1
ignorehitpause = 1

[State 3110, Vel]
type = veladd
trigger1 = animelemtime(7) >= 2
x = 0
y = 0.88445
[State 3110, Vel]
type = velset
trigger1 = animelemtime(7) = 2
x = 1.33 * const(size.xscale)
y = -10.54;68

[State 3110, Snd Randomizer]
type = varset
trigger1 = !time
var(0) = (random % 3)

[State 3110, Snd]
type = playsnd
trigger1 = animelem = 4 && var(0) = 0
value = 5, 6
channel = 0
[State 3110, Snd]
type = playsnd
trigger1 = animelem = 4 && var(0) = 1
value = 5, 8
channel = 0
[State 3110, Snd]
type = playsnd
trigger1 = animelem = 4 && var(0) = 2
value = 5, 3
channel = 0

[State 3110, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 3110, Snd]
type = playsnd
trigger1 = animelemtime(7) = 2
value = 0, 40
[State 3110, Dust]
type = helper
trigger1 = animelemtime(7) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3110, Sound]
type = playsnd
trigger1 = numtarget && animelem = 4
value = 0, 5100
[State 3110, Shake]
type = envshake
trigger1 = numtarget && animelem = 4
time = 18
ampl = -6
freq = 120
[State 3110, Dust]
type = helper
trigger1 = numtarget && animelem = 4
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = ceil(84 * const(size.xscale)), 0
ownpal = 1

[State 3110, End]
type = changestate
trigger1 = animelemtime(7) >= 2
trigger1 = pos y > -vel y
value = 3111


;--- Slam ---
[Statedef 3111]
type = A
physics = N
movetype = A
anim = 3111
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3111, Throw]
type = targetstate
trigger1 = numtarget && !time
value = 3121
[State 3111, Throw]
type = targetstate
trigger1 = numtarget && animelem = 4
value = 3122

[State 3111, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(87 * const(size.xscale)), 0
[State 3111, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = ceil(56 * const(size.xscale)), 0

[State 3111, Pos]
type = posset
trigger1 = animelemtime(4) < 0
y = 0

[State 3111, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) < 0
pos = ceil(87 * const(size.xscale)), ceil(-8 * const(size.yscale))
;[State 3111, Bind 4]
;type = targetbind
;trigger1 = numtarget
;trigger1 = animelemtime(4) = 0
;pos = ceil(112 * const(size.xscale)), ceil(0 * const(size.yscale))

[State 3111, Damage]
type = targetlifeadd
trigger1 = numtarget && !time
value = floor(ifelse(fvar(11) * 139 < 7, -7, -139))
kill = 0
[State 3111, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 36

[State 3111, Hit]
type = hitadd
trigger1 = numtarget && !time
value = 1
[State 3111, Hitcount]
type = varadd
trigger1 = numtarget && !time
var(13) = 1

[State 3111, Juggle]
type = varadd
trigger1 = numtarget && !time
var(15) = 1
ignorehitpause = 1
[State 3111, Juggle]
type = varset
trigger1 = numtarget && !time
var(16) = 1
ignorehitpause = 1

[State 3111, Vel]
type = veladd
trigger1 = animelemtime(4) >= 2
x = 0
y = 1.326675
[State 3111, Vel]
type = velset
trigger1 = animelemtime(4) = 2
x = 2.72
y = -14.09

[State 3111, Snd]
type = playsnd
trigger1 = animelem = 1 && var(0) = 2
value = 5, 1
channel = 0

[State 3111, Snd]
type = playsnd
trigger1 = animelem = 7 && var(0) = 0
value = 5, 7
channel = 0
[State 3111, Snd]
type = playsnd
trigger1 = animelem = 7 && var(0) = 1
value = 5, 9
channel = 0

[State 3111, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 3111, Snd]
type = playsnd
trigger1 = animelemtime(4) = 2
value = 0, 40
[State 3111, Dust]
type = helper
trigger1 = animelemtime(4) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3111, Sound]
type = playsnd
trigger1 = numtarget && !time
value = 0, 5100
[State 3111, Shake]
type = envshake
trigger1 = numtarget && !time
time = 18
ampl = -6
freq = 120
[State 3111, Dust]
type = helper
trigger1 = numtarget && !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = ceil(84 * const(size.xscale)), 0
ownpal = 1

[State 3111, End]
type = changestate
trigger1 = animelemtime(4) >= 2
trigger1 = vel y > 0 && pos y > (24 - vel y)
value = 3112


;--- Butt Slam ---
[Statedef 3112]
type = A
physics = N
movetype = A
anim = 1311
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3112, Pos]
type = posset
trigger1 = animelemtime(4) < 0
y = -16
[State 3112, Pos]
type = posadd
trigger1 = animelem = 4
x = ceil(80 * const(size.xscale))

[State 3112, Damage]
type = targetlifeadd
trigger1 = numtarget && !time
value = floor(ifelse(fvar(11) * 194 < 7, -7, fvar(11) * -194))
kill = 1
[State 3112, Power]
type = targetpoweradd
trigger1 = numtarget && !time
value = 36

[State 3112, Hit]
type = hitadd
trigger1 = numtarget && !time
value = 1
[State 3112, Hitcount]
type = varadd
trigger1 = numtarget && !time
var(13) = 1

[State 3112, Juggle]
type = varadd
trigger1 = numtarget && !time
var(15) = 1
ignorehitpause = 1
[State 3112, Juggle]
type = varset
trigger1 = numtarget && !time
var(16) = 1
ignorehitpause = 1

[State 3112, Throw]
type = targetstate
trigger1 = numtarget && !time
value = 3124

[State 3112, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 3112, Snd]
type = playsnd
trigger1 = animelem = 1 && var(0) = 2
value = 5, 0
channel = 0

[State 3112, Sound]
type = playsnd
trigger1 = numtarget && !time
value = 2, 5
channel = 2
[State 3112, Spark]
type = helper
trigger1 = numtarget && !time
helpertype = normal
stateno = 8014
ID = 8000
name = "Spark"
postype = p1
pos = ceil(64 * const(size.xscale)), ceil(6 * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3112, Sound]
type = playsnd
trigger1 = numtarget && !time
value = 0, 5100
[State 3112, Shake]
type = envshake
trigger1 = numtarget && !time
time = 18
ampl = -6
freq = 120
[State 3112, Dust]
type = helper
trigger1 = numtarget && !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-pos y)
ownpal = 1

[State 3112, Vel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.88445
[State 3112, Vel]
type = velset
trigger1 = animelem = 4
x = 2.68
y = -10.53

[State 3112, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = pos y > -vel y
value = 3113


;--- Land ---
[Statedef 3113]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1312
velset = 0, 0
sprpriority = 1

[State 3113, Pos]
type = posset
trigger1 = 1
y = 0

[State 3113, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3113, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3113, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 3120]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 3120, Anim]
type = changeanim2
trigger1 = !time
value = 3120
[State 3120, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 3121]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 3121, Anim]
type = changeanim2
trigger1 = !time
value = 3121
[State 3121, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 3122]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3122, Anim]
type = changeanim2
trigger1 = !time
value = 3122
[State 3122, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3122, Pos]
type = posadd
trigger1 = !time
x = 21
[State 3122, Pos]
type = posset
trigger1 = !time
y = 0

[State 3122, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x >= 1.326675, -1.326675, -vel x)
[State 3122, Accel]
type = veladd
trigger1 = 1
y = 1.326675

[State 3122, Vel]
type = velset
trigger1 = !time
x = 6.02; 16.8; 20, 125
y = -5.3067

[State 3122, End]
type = changestate
trigger1 = time >= 8
value = 3123


[Statedef 3123]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3123, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 3123, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3123, Pos]
type = posset
trigger1 = 1
y = 0

[State 3123, Anim]
type = changeanim
trigger1 = !time
value = 5170
[State 3123, Anim]
type = changeanim
trigger1 = anim != 5110 && !animtime
value = 5110

[State 3123, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3123, End]
type = selfstate
trigger1 = time >= 60
value = ifelse(alive, 5120, 5150)


[Statedef 3124]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3124, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 3124, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3124, Pos]
type = posset
trigger1 = 1
y = 0

[State 3124, Anim]
type = changeanim
trigger1 = !time
value = 5080
[State 3124, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3124, End]
type = changestate
trigger1 = time >= 45
value = 3125


[Statedef 3125]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3125, Pos]
type = posset
trigger1 = 1
y = 0

[State 3125, Anim]
type = changeanim
trigger1 = !time
value = 5110
[State 3125, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3125, End]
type = selfstate
trigger1 = time >= 12
value = ifelse(alive, 5120, 5150)


;FUJI OROSHI
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000
facep2 = 1

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3200, 4999]) && var(8)
[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3200, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3200, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
[State 3200, Variable Height]
type = playerpush
trigger1 = 1
value = 1
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = time = 3
value = 5, 3
channel = 0

[State 3200, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 40
[State 3200, Dust]
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

[State 3200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 3200, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 1.326675

[State 3200, Vel]
type = velset
trigger1 = animelem = 5
x = 4.0 * const(size.xscale);109
y = -12

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 2
channel = 0

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < (2 + hitcount)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && var(15) < (2 + hitcount)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 106), var(36) := -54
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3200, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = pos y > -vel y
value = 3201


;--- Lift ---
[Statedef 3201]
type = S
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3201, Pos]
type = posset
trigger1 = 1
y = 0

[State 3201, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3201, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 1
channel = 0
[State 3201, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 3201, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < (2 + hitcount)
ID = 3201
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 2, 2
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -1.08, -16.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -1.08, -16.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 66), var(36) := -46
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3201, Juggle]
type = varset
trigger1 = movehit = 1
trigger1 = numtarget(3201)
var(15) = 0

[State 3201, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 3201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;MAX FUJI OROSHI
[Statedef 3250]
type = S
physics = N
movetype = A
anim = 3250
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000
facep2 = 1

[State 3250, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3250, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3250, 4999]) && var(8)
[State 3250, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3250, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 45

[State 3250, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3250, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3250, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA
[State 3250, Variable Height]
type = playerpush
trigger1 = 1
value = 1
ignorehitpause = 1

[State 3250, Snd]
type = playsnd
trigger1 = time = 3
value = 5, 3
channel = 0

[State 3250, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3250, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 3250, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 40
[State 3250, Dust]
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

[State 3250, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 3250, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 1.326675

[State 3250, Vel]
type = velset
trigger1 = animelem = 5
x = 6.0 * const(size.xscale);109
y = -12

[State 3250, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 2
channel = 0

[State 3250, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < (2 + hitcount)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3250, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !var(16) && var(15) < (2 + hitcount)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 9
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 32
guard.hittime = 32
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -5.65
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 106), var(36) := -54
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3250, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = pos y > -vel y
value = 3251


;--- Lift ---
[Statedef 3251]
type = S
physics = N
movetype = A
anim = 3251
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3251, Pos]
type = posset
trigger1 = 1
y = 0

[State 3251, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3251, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3251, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 1
channel = 0
[State 3251, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 3251, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !var(16) && var(15) < (2 + hitcount)
ID = 3251
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 2, 2
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -36.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -36.00
air.cornerpush.veloff = 0
yaccel = 1.16
fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 66), var(36) := -46
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3251, Juggle]
type = varset
trigger1 = movehit = 1
trigger1 = numtarget(3251)
var(15) = 0

[State 3251, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 3251, End]
type = changestate
trigger1 = !animtime
trigger1 = movehit && numtarget(3251)
value = 3252

[State 3251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Prepare ---
[Statedef 3252]
type = S
physics = N
movetype = A
anim = 3252
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3252, Snd]
type = playsnd
trigger1 = animelem = 4
value = 7, 5

[State 3252, End]
type = changestate
trigger1 = !animtime
value = 3253


;--- Slaps ---
[Statedef 3253]
type = S
physics = N
movetype = A
anim = 3253
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3253, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3253, Loop]
type = changeanim
trigger1 = !animtime
value = 3253
elem = 1

[State 3253, Mashing]
type = varset
trigger1 = !time
var(42) = 0
[State 3253, Mashing]
type = varset
trigger1 = !time
var(12) = 0
[State 3253, Mashing]
type = varset
triggerall = var(42) = 0
trigger1 = !AIlevel && (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = !AIlevel && (command = "up" || command = "down" || command = "back" || command = "fwd")
trigger3 = AIlevel && random < 800
var(42) = 2
[State 3253, Mashing]
type = varadd
trigger1 = var(42) = 2
var(12) = 1
[State 3253, Mashing]
type = varadd
trigger1 = var(42) > 0
var(42) = -1

[State 3253, Anim Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(6) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 3253
elem = animelemno(0) + 1
[State 3253, Anim Skip]
type = changeanim
trigger1 = animelemtime(6) > 0
trigger1 = animelemtime(6) >= (2 -var(12))
trigger1 = 1 || var(12) := (var(12) + 2 - animelemtime(6))
value = 3253
elem = 1
[State 3253, Mashing]
type = varset
trigger1 = var(12) < 0
var(12) = 0

[State 3253, Snd]
type = playsnd
trigger1 = !time
value = 4, 6
channel = 0
[State 3253, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 5
value = 1, 2
channel = 1

[State 3253, Spark XY]
type = null
trigger1 = animelem = 1 || animelem = 7
trigger1 = var(35) := 120 || var(36) := -55
trigger2 = animelem = 3 || animelem = 9
trigger2 = var(35) := 113 || var(36) := -26
trigger3 = animelem = 5 || animelem = 11
trigger3 = var(35) := 111 || var(36) := -84

[State 3253, Hit Low]
type = hitdef
trigger1 = !var(16) && var(15) < (2 + hitcount)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5
ID = 3253
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 12
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -8.96
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -8.96
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
kill = 0

[State 3253, Hit High]
type = hitdef
trigger1 = !var(16) && var(15) < (2 + hitcount)
trigger1 = animelem = 5
ID = 3253
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 12
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, -8.96
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -8.96
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
kill = 0

[State 3253, Bind]
type = targetbind
trigger1 = numtarget(3253)
pos = ceil(90 * const(size.xscale)), ceil(-16 * const(size.yscale))
ignorehitpause = 1
[State 3253, Width]
type = width
trigger1 = numtarget(3253)
edge = ceil(90 * const(size.xscale)), 0

[State 3253, End]
type = changestate
trigger1 = time >= 36
value = 3254


;--- Final ---
[Statedef 3254]
type = S
physics = N
movetype = A
anim = 3254
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3254, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0
[State 1030, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 3254, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < (2 + hitcount)
trigger1 = animelem = 3
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
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -9.73, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -9.73, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 94), var(36) := -64
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3254, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 3254, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
