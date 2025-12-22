; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SPECIAL MOVES >===
;====

;==< GUREN KEN >=
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
var(10) = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))

[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1002, ifelse(var(10) = 1, 1001, 1000))

[State 1000, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33

[State 1000, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1000, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 7
channel = 0

[State 1000, Snd]
type = playsnd
trigger1 = !time
value = 0, 100

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 1000, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1000, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.39, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-17.2
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -30 + 0 * (var(35) := 155), var(36):= -65
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1000, Guren Chouchuu]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holddown" && command = "holdfwd" && (command = "x" || command = "y" || command = "z")
var(30) = 1300

[State 1000, Guren Hou Shou]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && (command = "x" || command = "y" || command = "z")
var(30) = 1010

[State 1000, Guren Yasha Joudan]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdback" && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel
trigger2 = inguarddist && p2statetype != C
var(30) = 1020

[State 1000, Guren Ressen Ha]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdup" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = (enemynear, stateno = 131 || enemynear, stateno = 152 || enemynear, stateno = 153)
var(30) = 1400

[State 1000, Guren Kusabi]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holddown" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = (enemynear, stateno = 130 || enemynear, stateno = 150 || enemynear, stateno = 151)
var(30) = 1015

[State 1000, Guren Yasha Gedan]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdback" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = inguarddist && p2statetype = C
var(30) = 1025

[State 1000, Guren Ken]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel && !var(30)
trigger2 = random < 200
var(30) = 1005

[State 1000, Guren Mujin Kyaku]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
var(30) = 1200

[State 1000, follow -up strength]
type = varset
trigger1 = !AIlevel
trigger1 = !var(11) && animelemtime(9) < 0
trigger1 = var(30) = 1005 || var(30) = 1010 || var(30) = 1020 || var(30) = 1300
var(11) = ifelse(command = "z", 2, ifelse(command = "y", 1, 0))

[State 1000, follow -up strength]
type = varset
trigger1 = !AIlevel
trigger1 = !var(11) && animelemtime(9) < 0
trigger1 = var(30) = 1015 || var(30) = 1025 || var(30) = 1200 || var(30) = 1400
var(11) = ifelse(command = "c", 2, ifelse(command = "b", 1, 0))

[State 1000, follow -up strength]
type = varset
trigger1 = AIlevel
trigger1 = animelemtime(9) < 0
var(11) = (random % 3)

[State 1000, follow -up type]
type = varset
trigger1 = time <= 1
var(30) = 0

[State 1000, follow -up strength]
type = varset
trigger1 = time <= 1
var(11) = 0

[State 1000, follow -up]
type = changestate
trigger1 = var(30) = [1000, 2999]
trigger1 = animelemtime(6) >= 0 && animelemtime(9) < 0
value = var(30)

[State 1000, statetype]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Second ---
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1005, Button]
type = varset
trigger1 = !time
var(10) = var(11)

[State 1005, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1007, ifelse(var(10) = 1, 1006, 1005))

[State 1005, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33

[State 1005, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1005, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1005, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0

[State 1005, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 1005, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1005, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.39, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-17.2
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 85), var(36) := -65
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1005, Guren Chouchuu]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holddown" && command = "holdfwd" && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && !var(30)
trigger2 = random < 50
var(30) = 1300

[State 1005, Guren Yasha Joudan]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdback" && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel
trigger2 = inguarddist && p2statetype != C
var(30) = 1020

[State 1005, Guren Ressen Ha]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdup" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = (enemynear, stateno = 131 || enemynear, stateno = 152 || enemynear, stateno = 153)
var(30) = 1400

[State 1005, Guren Kusabi]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holddown" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = (enemynear, stateno = 130 || enemynear, stateno = 150 || enemynear, stateno = 151)
var(30) = 1015

[State 1005, Guren Yasha Gedan]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "holdback" && (command = "a" || command = "b" || command = "c")
trigger2 = AIlevel
trigger2 = inguarddist && p2statetype = C
var(30) = 1025

[State 1005, Guren Hou Shou]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = random < 100 && !var(30)
var(30) = 1010

[State 1005, Guren Mujin Kyaku]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = random < 200 && !var(30)
var(30) = 1200

[State 1005, follow -up strength]
type = varset
trigger1 = !AIlevel
trigger1 = !var(11) && animelemtime(9) < 0
trigger1 = var(30) = 1010 || var(30) = 1020 || var(30) = 1300
var(11) = ifelse(command = "z", 2, ifelse(command = "y", 1, 0))

[State 1005, follow -up strength]
type = varset
trigger1 = !AIlevel
trigger1 = !var(11) && animelemtime(9) < 0
trigger1 = var(30) = 1015 || var(30) = 1025 || var(30) = 1200 || var(30) = 1400
var(11) = ifelse(command = "c", 2, ifelse(command = "b", 1, 0))

[State 1005, follow -up strength]
type = varset
trigger1 = AIlevel
trigger1 = animelemtime(9) < 0
var(11) = (random % 3)

[State 1005, follow -up type]
type = varset
trigger1 = time <= 1
var(30) = 0

[State 1005, follow -up strength]
type = varset
trigger1 = time <= 1
var(11) = 0

[State 1005, follow -up]
type = changestate
trigger1 = var(30) = [1000, 2999]
trigger1 = animelemtime(6) >= 0 && animelemtime(9) < 0
value = var(30)

[State 1005, statetype]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 1005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Guren Hou Shou ---
[Statedef 1010]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1010, Button]
type = varset
trigger1 = !time
var(10) = var(11)

[State 1010, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1102, ifelse(var(10) = 1, 1101, 1100))

[State 1010, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33

[State 1010, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1010, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 1010, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 9
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 15
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.23, -6.5
guard.velocity = -12.65
air.velocity = -5.23, -6.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 93), var(36) := -75
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1010, statetype]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Guren Kusabi ---
[Statedef 1015]
type = C
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1015, Button]
type = varset
trigger1 = !time
var(10) = var(11)

[State 1015, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33
[State 1015, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1015, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1015, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 6
channel = 0
[State 1015, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 103

[State 1015, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(32 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1015, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = C, SA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 10
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Trip
air.type = Trip
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -1.33, -8.07
guard.velocity = -12.65
air.velocity = -1.33, -8.07
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.65
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -5
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1015, statetype]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 1015, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- Guren Yasha Joudan ---
[Statedef 1020]
type = S
physics = N
movetype = I
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1020, Vel]
type = veladd
trigger1 = vel x > 0
x = -.083125

[State 1020, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1020, Vel]
type = velset
trigger1 = !time
x = 2

[State 1020, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-38 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
volume = -128
channel = 1

[State 1020, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = SA, NA, SA, HA
pausetime = 0, 20 
sparkno = -1 + 0*(var(13):=8001)
sparkxy = 0,0
hitsound = s3, 0
p1stateno = 1510

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Guren Yasha Gedan ---
[Statedef 1025]
type = S
physics = N
movetype = I
anim = 1505
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1025, Vel]
type = veladd
trigger1 = vel x > 0
x = -.083125

[State 1025, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1025, Vel]
type = velset
trigger1 = !time
x = 2

[State 1025, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-38 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1025, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
volume = -128
channel = 1

[State 1025, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = C, NA, SA, HA
pausetime = 0, 20
sparkno = -1 + 0*(var(13):=8001)
sparkxy = 0,0
hitsound = s3, 0
p1stateno = 1510

[State 1025, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< HOU SHOU >=
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
var(10) = ifelse((p2movetype = H || random < 333), 0, ifelse(random < 500, 1, 2))
[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1102, ifelse(var(10) = 1, 1101, 1100))

[State 1100, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0
[State 1100, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 1100, Snd]
type = playsnd
trigger1 = animelem = 6
value = 0, 5100
volume = -128
[State 1100, Shake]
type = envshake
trigger1 = animelem = 6
time = 12
ampl = -4
freq = 120
[State 1100, Dust]
type = explod
trigger1 = animelem = 6
anim = 8105
sprpriority = -3
postype = p1
pos = ceil(57 * const(size.xscale)), 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1100, autoguard]
type = reversaldef
trigger1 = animelem = 3
reversal.attr = SCA, NA, SA
pausetime = 12, 12
sparkno = -1 + 0*(var(13):=8001)
hitsound = s3, 0
numhits = 0
[State 1100, mhr]
type = movehitreset
trigger1 = animelemtime(6) < 0

[State 1100, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (110 + var(10) * 4) < 7, 7, fvar(11) * (110 + var(10) * 4))), 14
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 15
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.23, -6.5
guard.velocity = -12.65
air.velocity = -5.23, -6.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1100, statetype]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 1100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX HOU SHOU >=
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

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 1120, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1120, ECreset]
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
pos = ceil(-15 * const(size.xscale)), ceil(-59 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, Vel]
type = velset
trigger1 = animelem = 5
x = 8
[State 1120, Vel]
type = velset
trigger1 = animelem = 7
x = 0

[State 1120, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0
[State 1120, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 1120, Snd]
type = playsnd
trigger1 = animelem = 6
value = 0, 5100
volume = -128
[State 1120, Shake]
type = envshake
trigger1 = animelem = 6
time = 12
ampl = -4
freq = 120
[State 1120, Dust]
type = explod
trigger1 = animelem = 6
anim = 8105
sprpriority = -3
postype = p1
pos = ceil(57 * const(size.xscale)), 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, autoguard]
type = reversaldef
trigger1 = animelem = 3
reversal.attr = SCA, NA, SA
pausetime = 12, 12
sparkno = -1 + 0*(var(13):=8001)
hitsound = s3, 0
numhits = 0
[State 1120, mhr]
type = movehitreset
trigger1 = animelemtime(6) < 0

[State 1120, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 2 || var(20))
trigger1 = animelem = 6
ID = 1120
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 92 < 7, 7, fvar(11) * 92)), 12
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 15
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12, -3
guard.velocity = -12.65
air.velocity = -12, -3
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.3
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -58
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1120, p2state]
type = targetstate
trigger1 = movehit && numtarget(1120)
trigger1 = (target(1120), stateno = 5000) || (target(1120), stateno = 5010) || (target(1120), stateno = 5020)
value = 1125
ID = 1120
ignorehitpause = 1

[State 1120, juggle]
type = varset
trigger1 = movehit = 1
var(14) = 0

[State 1120, statetype]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 1120, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< MUJIN KYAKU >=
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20) * (prevstateno != [1000, 1005])
facep2 = (prevstateno != [1000, 1005])

[State 1200, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))
[State 1200, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))

[State 1200, strength if follow -up]
type = varset
trigger1 = !time && (prevstateno = [1000, 1005])
var(10) = var(11)

[State 1200, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33
[State 1200, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1200, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 1, 5
channel = 1

[State 1200, Dust]
type = explod
trigger1 = !(time % 6) && vel x >= 1
trigger1 = animelemtime(8) >= 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1200, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (56 -var(10) * 7) < 7, 7, fvar(11) * (56 -var(10) * 7))), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(5 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.23, -6.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -34
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1200, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < (1 + hitcount) || var(20))
trigger1 = animelem = 8
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 8
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(5 / ((var(20) > 0) + 1.0))
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -1.35, 0
guard.velocity = -9.22
air.velocity = -1.35, -10.1
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1200, statetype]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1200, End]
type = changestate
triggerall = movecontact = [5, 10]
trigger1 = !AIlevel && command = "b"
trigger2 = AIlevel
value = 245

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX MUJIN KYAKU >=
[Statedef 1220]
type = A
physics = N
movetype = A
anim = 1220
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1220, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1220, ECreset]
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
pos = ceil(-1 * const(size.xscale)), ceil(-33 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Vel]
type = veladd
trigger1 = vel x > 0
x = -.2
[State 1220, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1220, Vel]
type = velset
trigger1 = !time
x = 7

[State 1220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0
[State 1220, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 1, 5
channel = 1

[State 1220, Dust]
type = explod
trigger1 = !(time % 6) && vel x >= 1
trigger1 = animelemtime(8) >= 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 5
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.62, 0
guard.velocity = -5.62
air.velocity = -5.23, -6.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -34
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1220, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 8
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 4, 4
guard.pausetime = 4, 5
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -1.35, -10.1
guard.velocity = -9.22
air.velocity = -1.35, -10.1
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1220, juggle]
type = varset
trigger1 = movehit = 1
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
var(14) = 0

[State 1220, statetype]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I
[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< RESSEN CHOU >=
[Statedef 1300]
type = S
physics = N
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20) * (prevstateno != [1000, 1005])
facep2 = (prevstateno != [1000, 1005])

[State 1300, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))
[State 1300, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))

[State 1300, strength if follow -up]
type = varset
trigger1 = !time && (prevstateno = [1000, 1005])
var(10) = var(11)

[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1302, ifelse(var(10) = 1, 1301, 1300))

[State 1300, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33
[State 1300, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1300, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 6
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 0, 130

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 1300, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1300, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 6
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (70 -var(10) * 7) < 7, 7, fvar(11) * (70 -var(10) * 7))), 8
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -12.65, 0
guard.velocity = -12.65
air.velocity = -5.39, -7
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-17.2
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55), var(36):= -64
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1300, follow -up type]
type = varset
triggerall = (!var(30) || AIlevel) && animelemtime(11) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
var(30) = 1305

[State 1300, follow -up strength]
type = varset
trigger1 = !AIlevel
trigger1 = !var(11) && animelemtime(11) < 0
var(11) = ifelse(command = "c", 2, ifelse(command = "b", 1, 0))
[State 1300, follow -up strength]
type = varset
trigger1 = AIlevel
trigger1 = animelemtime(11) < 0
var(11) = (random % 3)

[State 1300, follow -up type]
type = varset
trigger1 = time <= 1
var(30) = 0
[State 1300, follow -up strength]
type = varset
trigger1 = time <= 1
var(11) = 0

[State 1300, follow -up]
type = changestate
trigger1 = var(30) = 1305
trigger1 = animelemtime(8) >= 0 && animelemtime(11) < 0
value = 1305

[State 1300, statetype]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Ressen Chuu ---
[Statedef 1305]
type = S
physics = N
movetype = A
anim = 1305
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 1305, Button]
type = varset
trigger1 = !time
var(10) = var(11)
[State 1305, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1307, ifelse(var(10) = 1, 1306, 1305))

[State 1305, Vel]
type = veladd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -.125, ifelse(var(10) = 1, -.09375, -.0625)) * 1.33
[State 1305, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1305, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 2, 5.75, ifelse(var(10) = 1, 4.65, 3.5))

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0
[State 1305, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 1305, Dust]
type = explod
trigger1 = !(time % 6) && time && vel x >= 1
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1305, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (76 -var(10) * 7) < 7, 7, fvar(11) * (76 -var(10) * 7))), 8
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(4 / ((var(20) > 0) + 1.0)), ceil(4 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.32, -7.62
guard.velocity = -12.65
air.velocity = -5.32, -7.62
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0;-17.2
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 55), var(36):= -64
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1305, statetype]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 1305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< RESSEN HA >=
[Statedef 1400]
type = S
physics = N
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20) * (prevstateno != [1000, 1005])
facep2 = (prevstateno != [1000, 1005])

[State 1400, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2dist x >= 160, 2, ifelse(p2dist x >= 80, 1, 0))

[State 1400, strength if follow -up]
type = varset
trigger1 = !time && (prevstateno = [1000, 1005])
var(10) = var(11)

[State 1400, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1402, ifelse(var(10) = 1, 1401, 1400))

[State 1400, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = ifelse(anim = 1402, 0.76, ifelse(anim = 1401, 0.71, 0.635))
[State 1400, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(anim = 1402, 6.92, ifelse(anim = 1401, 4.22, 2.6))
y = ifelse(anim = 1402, -6.77, ifelse(anim = 1401, -6.82, -5.67))

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40
[State 1400, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1400, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 5
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(10 / ((var(20) > 0) + 1.0)), ceil(10 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -9.22, 0
guard.velocity = -9.22
air.velocity = -5.33, -6.46
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1400, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1405


;--- Land ---
[Statedef 1405]
type = S
physics = N
movetype = A
anim = 1405
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1405, Pos]
type = posset
trigger1 = 1
y = 0

[State 1405, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0
[State 1405, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 2
channel = 1

[State 1405, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1405, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 14, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1405, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 1
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 69 < 7, 7, fvar(11) * 69)), 9
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.33, 0
guard.velocity = -9.22
air.velocity = -5.33, -6.45
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -30
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1405, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I

[State 1405, End]
type = changestate
triggerall = movecontact = [1, 4]
trigger1 = !AIlevel && command = "holddown" && command = "c"
trigger2 = AIlevel
value = 1015

[State 1405, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX RESSEN HA >=
[Statedef 1420]
type = S
physics = N
movetype = A
anim = 1420
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 1420, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1420, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1420, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1420, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1420, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(9 * const(size.xscale)), ceil(-52 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1420, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N
[State 1420, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.76

[State 1420, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(p2bodydist x >= 240, 9.6, ifelse(p2bodydist x <= 0, 0, p2bodydist x / 25.0))
y = -8.77

[State 1420, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0
[State 1420, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
channel = 1

[State 1420, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40
[State 1420, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1420, Hit]
type = hitdef
trigger1 = !var(27) && var(14) < (1 + hitcount)
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 6, 6
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -5.33, -6.46
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -80
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1420, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1425


;--- Land ---
[Statedef 1425]
type = S
physics = N
movetype = A
anim = 1425
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1

[State 1425, Pos]
type = posset
trigger1 = 1
y = 0

[State 1425, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0
[State 1425, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 2
channel = 1

[State 1425, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1425, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 14, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1425, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 1
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 80 < 7, 7, fvar(11) * 80)), 9
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 13
ground.slidetime = 13
guard.hittime = 13
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.33, -6.45
guard.velocity = -9.22
air.velocity = -5.33, -6.45
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-17.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -30
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4

[State 1425, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I
[State 1425, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< YASHA GAESHI >=
;--- Joudan ---
[Statedef 1500]
type = S
physics = S
movetype = I
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1500, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
volume = -128
channel = 1

[State 1500, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = SA, NA, SA, HA
pausetime = 0, 20
sparkno = -1 + 0*(var(13):=8001)
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1510

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Gedan ---
[Statedef 1505]
type = S
physics = S
movetype = I
anim = 1505
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
volume = -128
channel = 1

[State 1505, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = C, NA, SA, HA
pausetime = 0, 20
sparkno = -1 + 0*(var(13):=8001)
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1510

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Counter ---
[Statedef 1510]
type = S
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1510, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 6 + (random % 3)
channel = 0
[State 1510, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 1510, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 111 < 7, 7, fvar(11) * 111)), 14
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 15
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -5.23, -6.5
guard.velocity = -12.65
air.velocity = -5.23, -6.5
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -55
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
p1sprpriority = 2

[State 1510, statetype]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< EX YASHA GAESHI >=
[Statedef 1520]
type = S
physics = S
movetype = I
anim = 1520
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1520, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 1520, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1520, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1520, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1520, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(-15 * const(size.xscale)), ceil(-59 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1520, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
volume = -128
channel = 1

[State 1520, Reversal]
type = reversaldef
trigger1 = animelem = 2
reversal.attr = SCA, NA, SA, HA
pausetime = 0, 20
sparkno = -1 + 0*(var(13):=8001)
sparkxy = 0, 0
hitsound = s3, 0
p1stateno = 1530

[State 1520, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Counter ---
[Statedef 1530]
type = S
physics = N
movetype = A
anim = 1530
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1530, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 6 + (random % 3)
channel = 0
[State 1530, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 1530, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 8
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 15
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = -1.25, -11
guard.velocity = -12.65
air.velocity = -1.25, -11
airguard.velocity = -8, -1.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -20 + 0 * (var(35) := 155), var(36):= -60
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
p1sprpriority = 2

[State 1530, juggle]
type = varset
trigger1 = movehit = 1
var(14) = 0

[State 1530, Hi -Jump Cancel]
type = changestate
value = 60
triggerall = !AIlevel && roundstate = 2
triggerall = command = "highjump"
trigger1 = movecontact

[State 1530, statetype]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
[State 1530, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< ARAKUMA INASHI >=
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 72 * !var(20)
facep2 = 1

[State 1600, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))
[State 1600, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2bodydist x <= 31, 2, ifelse(p2bodydist x <= 33, 1, 0))

[State 1600, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 1600, Hit]
type = hitdef
triggerall = animelem = 3 && numenemy
triggerall = !var(38)
trigger1 = var(10) = 0 && p2dist x >= 0 && p2bodydist x <= 35
trigger2 = var(10) = 1 && p2dist x >= 0 && p2bodydist x <= 33
trigger3 = var(10) = 2 && p2dist x >= 0 && p2bodydist x <= 31
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 0, 0
sparkno = -1
guard.sparkno = s8000
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -50
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 1610
ID = 1600

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 9
channel = 0
[State 1600, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
channel = 1

[State 1600, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Player ---
[Statedef 1610]
type = S
physics = S
movetype = A
anim = 1610
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1610, throw]
type = targetstate
trigger1 = !time && numtarget
value = 1615
[State 1610, throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 1610, Bind 1]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(5) >= 0 && animelemtime(8) < 0
trigger3 = animelemtime(10) >= 0
pos = ceil(35 * const(size.xscale)), 0
[State 1610, Bind 2]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(10) < 0
pos = ceil(50 * const(size.xscale)), ceil(-68 * const(size.xscale))

[State 1610, damage]
type = targetlifeadd
trigger1 = numtarget && (animelem = 3 || animelem = 8)
value = ceil(ifelse(35 * fvar(11) < 7, -7, -35 * fvar(11)))
kill = 0

[State 1610, Hit]
type = hitadd
trigger1 = numtarget && (animelem = 3 || animelem = 8)
value = 1
[State 1610, hitcount]
type = varadd
trigger1 = numtarget && (animelem = 3 || animelem = 8)
var(13) = 1

[State 1610, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 7
value = 4, 6
channel = 0
[State 1610, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 7
value = 1, 5
channel = 1

[State 1610, Snd]
type = playsnd
trigger1 = numtarget && (animelem = 3 || animelem = 8)
value = 2, 5

[State 1610, Hit Spark]
type = Helper
trigger1 = numtarget && (animelem = 3 || animelem = 8)
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(50 * const(size.xscale)), ceil(-68 * const(size.yscale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1610, Shake]
type = envshake
trigger1 = numtarget && (animelem = 3 || animelem = 8)
time = 14
ampl = 4
freq = 120

[State 1610, End]
type = changestate
trigger1 = !animtime
value = 1611


;--- --Flip -----
[Statedef 1611]
type = S
physics = S
movetype = A
anim = 1611
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1611, throw]
type = targetstate
trigger1 = !time && numtarget
value = 1616

[State 1611, juggle]
type = varset
trigger1 = !time && numtarget
var(14) = 1
ignorehitpause = 1

[State 1611, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4 || animelem = 6
x = ceil(16 * const(size.xscale))
[State 1611, Pos]
type = posadd
trigger1 = animelem = 5
x = ceil(6 * const(size.xscale))

[State 1611, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = ceil(35 * const(size.xscale)), 0
[State 1611, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(19 * const(size.xscale)), 0
[State 1611, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(13 * const(size.xscale)), 0
[State 1611, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(12 * const(size.xscale)), ceil(-60 * const(size.yscale))
[State 1611, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = ceil(12 * const(size.xscale)), ceil(-60 * const(size.yscale))
[State 1611, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 0, ceil(-70 * const(size.yscale))
[State 1611, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 8
pos = ceil(-12 * const(size.xscale)), ceil(-60 * const(size.yscale))

[State 1611, damage]
type = targetlifeadd
trigger1 = numtarget && animelem = 8
value = floor(ifelse(fvar(11) * ifelse(var(10) = 2, 111, ifelse(var(10) = 1, 104, 97)) < 7, -7, fvar(11) * ifelse(var(10) = 2, -111, ifelse(var(10) = 1, -104, -97))))
[State 1611, givepower]
type = targetpoweradd
trigger1 = numtarget && animelem = 8
value = 36
[State 1611, getpower]
type = poweradd
trigger1 = animelem = 8 && !var(20)
value = 72

[State 1611, throw]
type = targetstate
trigger1 = numtarget && animelem = 8
value = 1617

[State 1611, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 9
channel = 0
[State 1611, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
channel = 1

[State 1611, Turn]
type = turn
trigger1 = !animtime
[State 1611, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 1615]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0
[State 1615, Anim]
type = changeanim2
trigger1 = !time
value = 1615
[State 1615, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[Statedef 1616]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 1616, Anim]
type = changeanim2
trigger1 = !time
value = 1616
[State 1616, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[Statedef 1617]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0
[State 1617, Anim]
type = changeanim2
trigger1 = !time
value = 1617
[State 1617, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1617, Accel]
type = veladd
trigger1 = 1
y = 0.75
[State 1617, Vel]
type = velset
trigger1 = !time
x = 3.33
y = -5

[State Safe Fall]
type = selfstate
trigger1 = command = "recovery"
trigger1 = vel y > 0 && alive
trigger1 = pos y >= (-20 - const(size.ground.back))
value = 5200
ignorehitpause = 1

[State 1617, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= -const(size.ground.back)
value = 5100

;==< EX ARAKUMA INASHI >=
[Statedef 1630]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
facep2 = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1220, ECreset]
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
pos = ceil(-1 * const(size.xscale)), ceil(-33 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1630, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 1630, Hit]
type = hitdef
triggerall = animelem = 3 && numenemy
triggerall = !var(38)
trigger1 = var(10) = 0 && p2dist x >= 0 && p2bodydist x <= 35
trigger2 = var(10) = 1 && p2dist x >= 0 && p2bodydist x <= 33
trigger3 = var(10) = 2 && p2dist x >= 0 && p2bodydist x <= 31
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = ifelse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givepower = 0, 0
sparkno = -1
guard.sparkno = s8000
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -50
hitsound = s0, 800
guardsound = s3, 0
yaccel = 0.5
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 1610
ID = 1600

[State 1630, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 9
channel = 0
[State 1630, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
channel = 1

[State 1630, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
[State 1630, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< HADOU KEN >=
[Statedef 1700]
type = S
physics = S
movetype = A
anim = 1700
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1700, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))

[State 1700, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1700, hadouvar]
type = varset
trigger1 = animelemtime(4) < 0
var(32) = 1

[State 1700, hadouvar]
type = varadd
trigger1 = animelemtime(2) >= 0 && animelemtime(10) < 0 && var(32) < 3
trigger1 = (var(10) = 1 && command = "x") || (var(10) = 2 && command = "y") || (var(10) = 3 && command = "z")
var(32) = 1

[State 1700, hadouvar]
type = varset
trigger1 = var(1) = 2
var(32) = 3

[State 1700, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
value = 1700
elem = 10

[State 1700, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0 && var(32) = 2
value = 1700
elem = 4

[State 1700, Anim]
type = changeanim
trigger1 = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) = 3
value = 1700
elem = 7

[State 1700, Anim]
type = changeanim
triggerall = var(1) != 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0 && var(32) != 2
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0 && var(32) != 3
trigger3 = AIlevel && animelemtime(2) >= 0 && animelemtime(10) < 0 && p2movetype = A
value = 1700
elem = 10

[State 1700, width]
type = width
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger2 = animelemtime(18) >= 0 && animelemtime(19) < 0
value = 13

[State 1700, width]
type = width
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
value = 26

[State 1700, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0 && !numhelper(1702)
helpertype = normal
stateno = 1702
ID = 1702
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1700, Hadouken]
type = helper
trigger1 = animelemtime(11) = 1
helpertype = normal
stateno = 1705
ID = 1705
name = "Hadouken"
postype = p1
pos = 86, -55
size.xscale = 0.5
size.yscale = ifelse(var(32) = 3, 1, ifelse(var(32) = 2, 0.75, 0.4))
ownpal = 1

[State 1700, Snd]
type = playsnd
trigger1 = animelem = 10
value = 9, 6
channel = 0

[State 1700, Snd]
type = playsnd
trigger1 = animelemtime(11) = 1
value = 6, 10

[State 1700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< SHOUOU KEN >=
[Statedef 1800]
type = S
physics = N
movetype = A
anim = 1800
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = 8
facep2 = 1
sprpriority = 1

[State 1800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))

[State 1800, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1800, Anim]
type = changeanim
trigger1 = !time
value = 1799 + var(10)

[State 1800, Vel]
type = velset
trigger1 = (anim = [1800, 1802]) && animelem = 2
x = ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 6, 4))

[State 1800, Snd]
type = playsnd
trigger1 = (anim = [1800, 1801]) && animelem = 6
trigger2 = anim = 1802 && animelem = 8
value = 0, 40

[State 1800, Dust]
type = helper
trigger1 = (anim = [1800, 1801]) && animelem = 6
trigger2 = anim = 1802 && animelem = 8
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 1800, Vel]
type = velset
trigger1 = (anim = [1800, 1801]) && animelem = 6
trigger2 = anim = 1802 && animelem = 8
x = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2))
y = ifelse(var(10) = 3, -8, ifelse(var(10) = 2, -7, -6))

[State 1800, Vel]
type = velmul
trigger1 = (anim = [1800, 1801]) && animelemtime(6) > 0
trigger2 = anim = 1802 && animelemtime(8) > 0
x = 0.95

[State 1800, Snd]
type = playsnd
trigger1 = (anim = [1800, 1802]) && animelem = 2
value = 9, 5
channel = 0
ignorehitpause = 1
persistent = 0

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 0
value = SCA
time = 1

[State 1800, hitlow]
type = hitdef
trigger1 = animelem = 4 && (anim = 1801 || anim = 1802)
trigger2 = animelem = 6 && anim = 1802
attr = S, SA
damage = ifelse(anim = 1801, 65, 39), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -61
hitsound = s2, 0
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
fall.recover = 1
fall.recovertime = 120
air.fall = 1
yaccel = 0.5
forcestand = 1

[State 1800, hithigh]
type = hitdef
trigger1 = (animelem = 5 && anim = 1801) || (animelem = 7 && anim = 1802)
trigger2 = animelem = 5 && anim = 1802
attr = S, SA
damage = ifelse(anim = 1801, 65, 39), 9
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -61
hitsound = s2, 1
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.type = Low
air.velocity = -2, 0.5
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
forcestand = 1
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 0
fall.recover = 1
fall.recovertime = 120
air.fall = 1
yaccel = 0.5
forcestand = 1

[State 1800, hitlowfinal]
type = hitdef
trigger1 = animelem = 5 && anim = 1800
attr = S, SA
damage = 118, 9
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -72
hitsound = s2, 2
guardsound = s3, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

[State 1800, hitmidair]
type = hitdef
trigger1 = (animelem = 6 && anim = 1800) && !movecontact && !movereversed
trigger2 = (animelem = 6 && anim = 1801) || (animelem = 8 && anim = 1802)
attr = S, SA
damage = 14, 7
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), (5 -var(10)), (10 -var(10) * 2)), ifelse(var(20), (6 -var(10)), (12 -var(10) * 2))
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -92
hitsound = s2, 1
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
air.type = High
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -10, ifelse(var(10) = 2, -9, -8))
ground.cornerpush.veloff = 0
guard.velocity = -12.65
guard.cornerpush.veloff = 0;-17.2
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1800, statetype]
type = statetypeset
trigger1 = anim = 1800 && animelemtime(6) >= 0
trigger2 = anim = 1801 && animelemtime(6) >= 0
trigger3 = anim = 1802 && animelemtime(8) >= 0
statetype = A
physics = A

[State 1800, Anim]
type = changeanim
trigger1 = anim = 1800 && animelemtime(6) > 0 && vel y > -2
trigger2 = anim = 1801 && animelemtime(6) > 0 && vel y > -3
trigger3 = anim = 1802 && animelemtime(8) > 0 && vel y > -4
value = 1803

[State Idle]
type = statetypeset
trigger1 = anim = 1803
movetype = I

;==< KARIN SENKUU >=
[Statedef 1900]
type = S
physics = N
movetype = I
anim = 1900
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1900, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "db2p", -3, ifelse(command = "df2k", 2, -2)))

[State 1900, afterimage]
type = afterimage
trigger1 = anim = 1900 && animelem = 2
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 3 || var(10) = -3), 24, 18)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1900, Anim]
type = changeanim
trigger1 = anim = 1900 && !animtime
value = ifelse(var(10) < 0, 1902, 1901)

[State 1900, Vel]
type = velset
trigger1 = anim = 1900 && animelemtime(2) >= 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -4) / 9.0 * pi)
[State 1900, Vel]
type = velset
trigger1 = (anim = [1901, 1902])
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))
persistent = 0
[State 1900, Vel]
type = velmul
trigger1 = (anim = [1901, 1902]) && time > ifelse((var(10) = 3 || var(10) = -3), 37, 32)
x = 0.9

[State 1900, Snd]
type = playsnd
trigger1 = anim = 1900 && animelem = 2
value = 9, 7
channel = 0
[State 1900, Snd]
type = playsnd
trigger1 = (anim = [1901, 1902])
value = 9, 17
persistent = 0

[State 1900, Push]
type = playerpush
trigger1 = anim = 1900
trigger2 = (anim = [1901, 1902])
value = 0

[State 1900, nothitby]
type = nothitby
trigger1 = anim = 1900
trigger2 = (anim = [1901, 1902])
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1

[State 1900, Turn]
type = turn
trigger1 = (anim = [1901, 1902]) && p2dist x < 0

[State 1900, End]
type = changeanim
trigger1 = (anim = [1901, 1902]) && time >= ifelse((var(10) = 3 || var(10) = -3), 52, 42)
trigger2 = (anim = [1901, 1902]) && vel x < 0 && backedgebodydist <= const(size.ground.back)
trigger3 = (anim = [1901, 1902]) && vel x > 0 && frontedgebodydist <= const(size.ground.front)
value = 1905

[State 1900, statetype]
type = statetypeset
trigger1 = anim = 1905
statetype = S
physics = S

[State 1900, End]
type = changestate
trigger1 = anim = 1905 && !animtime
value = 0
ctrl = 1
;==< PUNCH ZERO COUNTER >=
[Statedef 2900]
type = S
physics = S
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2900, nothitby]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 3
x = ceil(16 * const(size.yscale))
[State 2900, Pos]
type = posadd
trigger1 = animelemtime(9) = 0 || animelemtime(9) = 1 || animelemtime(9) = 2
trigger2 = animelem = 10
x = floor(-8 * const(size.yscale))

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 2900, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 2900, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 4
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 17 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 17
air.hittime = 120
ground.velocity = -6.5, -5.85
guard.velocity = -12.65
air.velocity = -6.5, -5.85
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -77
hitsound = s2, 2
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< KICK ZERO COUNTER >=
[Statedef 2950]
type = C
physics = C
movetype = A
anim = 2950
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2950, nothitby]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2950, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0
[State 2950, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 2950, Hit]
type = hitdef
trigger1 = !var(27) && (var(14) < 1 || var(20))
trigger1 = animelem = 5
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
guard.pausetime = ceil(12 / ((var(20) > 0) + 1.0)), ceil(12 / ((var(20) > 0) + 1.0))
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 17 + 4 * var(9)
ground.slidetime = 17 + 4 * var(9)
guard.hittime = 17
air.hittime = 120
ground.velocity = -6.5, -5.85
guard.velocity = -12.65
air.velocity = -6.5, -5.85
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;-24.4
air.cornerpush.veloff = 0
yaccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 155), var(36):= -8
hitsound = s2, 5
guardsound = s3, 0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 2950, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 2950, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
