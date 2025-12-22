; ADD004 BASIC PIEs ReBuilded CNS (6/12/2015)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; use assist tool, or delete this file, then remove ".a4bk" from the neme of backup to Restore.
;==

; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< COMMON STATES >====
;==

;==< PARRY >==
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 700, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 700, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 29, -75
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 700, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 701, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 701, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 4, -40
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 701, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- AERIAL ---
[Statedef 702]
type = A
physics = A
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = time < 15
value = SCA, AT
time = 1

[State 702, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 702, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 702, Type]
type = statetypeset
trigger1 = time < 15
physics = N
[State 702, Stop]
type = posfreeze
trigger1 = time < 15
value = 1

[State 702, Vel]
type = velset
trigger1 = time = 15
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 702, Type]
type = statetypeset
trigger1 = time >= 15
physics = A
[State 702, Ctrl]
type = ctrlset
trigger1 = time >= 15
value = 1

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 5, -78
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

;==< DODGE >==
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 3
channel = 0

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0

[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 210, 220)

[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 210, 220)

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==< FORWARD ROLL >==
[Statedef 720]
type = C
physics = C
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 720, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
x = 6
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< BACKWARD ROLL >==
[Statedef 725]
type = C
physics = C
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 725, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 725, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
x = -6
[State 725, Push]
type = playerpush
trigger1 = 1
value = 0
[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1
[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< POWER CHARGE >==
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 10)

[State 740, Snd]
type = playsnd
trigger1 = anim = 740 && time = 8
value = 3, 1
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(8331)
helpertype = normal
stateno = 8331
ID = 8331
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim != 741
trigger1 = !AIlevel && (command != "holdb" || command != "holdy")
trigger2 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger3 = AIlevel && (inguarddist || p2movetype = A || p2dist x < 160)
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
value = 4, 0
channel = 0
persistent = 0

[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1


;==< ZERO COUNTER >==
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 2
facep2 = 1

[State 750, ECreset]
type = palfx
trigger1 = var(20) > 0
trigger1 = var(20) := -1
time = 1
[State 750, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "Counter_P"), 1, 2)
ignorehitpause = 1
[State 750, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 1, ifelse((p2statetype = C), 2, ifelse(random < 500, 1, 2)))
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0
[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 29, -76
ownpal = 1
persistent = 0
supermovetime = 999
[State 750, superchargepause]
type = superpause
trigger1 = !time
time = 20
anim = -1
sound = s7, 1
darken = 0
movetime = 20
[State 750, End]
type = changestate
trigger1 = time >= 20
value = ifelse(var(10) = 1, 240, 255)


;===< CUSTOM COMBO >===
[Statedef 760]
type = U
physics = U
movetype = A
anim = 760 + (statetype = A)
ctrl = (statetype = A)
poweradd = -1000
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)

[State 760, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8400
ID = 8400
postype = p1
pos = -10 + 13 * (anim = 761), -56 -8 * (anim = 761)
ownpal = 1
size.xscale = 1
size.yscale = 1
persistent = 0
supermovetime = 9999
[State 760, superchargepause]
type = superpause
trigger1 = !time
time = 30
movetime = 30 * (anim = 760)
anim = -1
sound = s900, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 760, Var]
type = varset
trigger1 = anim = 760
trigger2 = anim = 761 && !time
var(20) = 180

[State 760, NHB]
type = nothitby
trigger1 = (anim = [760, 761])
time = 8
value = SCA

[State 760, Shadows]
type = afterimage
trigger1 = anim = 760 && !animtime
trigger2 = anim = 761 && !time
time = 2
timegap = 1
framegap = 4
length = 13
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
trans = add1

[State 760, End]
type = changeanim
trigger1 = anim = 761 && !animtime
value = ifelse(vel x > 0, 42, 43)
elem = 2 + (!vel x) * 4
persistent = 0
[State 760, Type]
type = statetypeset
trigger1 = anim = 42 || anim = 43
statetype = A
physics = A

[State 760, End]
type = changestate
trigger1 = anim = 760 && !animtime
value = 0
ctrl = 1


;====< STANDING >====
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050

[State 0, Skywalker]
type = changestate
triggerall = pos y < 0
trigger1 = !numenemy
trigger2 = numenemy = 1
trigger2 = (enemy, name = "M -NES Game 1" + enemy, name = "M -NES Game 2" + enemy, name = "M -GB Game 1" + enemy, authorname = "Bane84") < 2
trigger3 = numenemy >= 2
trigger3 = (enemy(0), name = "M -NES Game 1" + enemy(0), name = "M -NES Game 2" + enemy(0), name = "M -GB Game 1" + enemy(0), authorname = "Bane84") < 2
trigger3 = (enemy(1), name = "M -NES Game 1" + enemy(1), name = "M -NES Game 2" + enemy(1), name = "M -GB Game 1" + enemy(1), authorname = "Bane84") < 2
value = 50


;====< CROUCHING >====
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
trigger1 = !time && anim = 12
value = 10
elem = 3 -animelemno(0)
[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = changestate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6 && !animtime
value = 11

[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time && anim = 10
value = 12
elem = 3 -animelemno(0)
[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = changestate
trigger1 = command = "holddown" && command != "holdup"
value = 10
[State 12, End]
type = changestate
trigger1 = !animtime
value = 0


;====< WALKING >====
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21


;===< JUMPING >====
[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 40, Var]
type = varset
trigger1 = !time && AIlevel
var(9) = ifelse((p2dist x > 240 || p2dist y > 180 || random < 100), 3, 1)
[State 40, Var]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))
[State 40, Var]
type = varset
trigger1 = !time && !AIlevel
var(9) = ifelse(command = "highjump", 3, 1)
[State 40, Var]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, Var]
type = varset
trigger1 = !AIlevel && var(9) != 3 && command != "holdup"
trigger2 = AIlevel && var(9) != 3 && random < 100
var(9) = 2

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) != 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = ifelse(var(9) = 2, 0.75, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3
x = ifelse(sysvar(1) = 0, const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = ifelse(!sysvar(1), 1.1, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && prevstateno = 100 && sysvar(1) = 1
trigger1 = var(9) := 3
x = const(velocity.runjump.fwd.x)
[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1

[Statedef 50]
type = A
physics = A

[State 50, Snd]
type = playsnd
trigger1 = !time
value = 0, ifelse(var(9) = 3, 41, 40)

[State 50, Anim]
type = changeanim
trigger1 = var(9) != 2
value = ifelse(!(vel x), 41, ifelse((vel x) > 0, 42, 43))
persistent = 0
[State 50, Anim]
type = changeanim
trigger1 = var(9) = 2
value = ifelse(!(vel x), 51, ifelse((vel x) > 0, 52, 53))
elem = animelemno(0)
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(9) = 2
flag = noairguard


[Statedef 51]
type = A
physics = A
[State 51, null]
type = null
trigger1 = 1


[Statedef 52]
type = S
physics = S
ctrl = 0
anim = ifelse(vel y > 12, 48, 47)
movehitpersist = 1

[State 52, Vel]
type = velset
trigger1 = 1
x = 0
y = 0
[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, anim48]
type = changeanim
trigger1 = !time && (prevstateno = 227 || prevstateno = 1120 || prevstateno = 3050)
value = 48
[State 52, anim1117]
type = changeanim
trigger1 = !time && (prevstateno = 1115 || prevstateno = 1400)
value = 1117
[State 52, anim1301]
type = changeanim
trigger1 = !time && (prevstateno = 1300 || prevstateno = 3100)
value = 1301

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
persistent = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, Ctrl]
type = ctrlset
trigger1 = !time
trigger1 = prevstateno != [200, 4999]
value = 1
[State 52, Ctrl]
type = ctrlset
trigger1 = time >= 1
trigger1 = prevstateno < 1000
value = 1
[State 52, guard]
type = changestate
trigger1 = command = "holdback"
trigger1 = inguarddist && (prevstateno != [200, 4999])
value = 120

[State 52, No walking]
type = assertspecial
trigger1 = time <= 2 || (prevstateno = [200, 4999])
flag = nowalk
[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< SANKAKU TOBI >===
;--- < FORWARD > ---
[Statedef 60]
type = A
movetype = I
physics = A
anim = 60
ctrl = 0
[State 60, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 60, Dust]
type = explod
trigger1 = !time
anim = 7101
ID = 7101
sprpriority = 3
postype = p1
pos = -22, -33
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 60, Pos]
type = posset
trigger1 = animelemtime(2) < 0
x = -134 * facing
[State 60, Stop]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0
[State 60, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)
[State 60, Ctrl]
type = ctrlset
trigger1 = animelemtime(2) >= 0
value = 1


;--- < BACKWARD > ---
[Statedef 61]
type = A
movetype = I
physics = A
anim = 61
ctrl = 0
[State 61, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 61, Dust]
type = explod
trigger1 = !time
anim = 7101
ID = 7101
sprpriority = 3
postype = p1
pos = 22, -33
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 61, Pos]
type = posset
trigger1 = animelemtime(2) < 0
x = 134 * facing
[State 61, Stop]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0
[State 60, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.jump.back.x)
y = const(velocity.jump.y)
[State 61, Ctrl]
type = ctrlset
trigger1 = animelemtime(3) >= 0
value = 1


;==< RUN >===
[Statedef 100]
type = S
physics = S
anim = 100
ctrl = 1
sprpriority = 1


[State 100, Dust Helper]
type = Helper
trigger1 = !time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 100, as]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn
[State 100, Vel]
type = velset
trigger1 = anim = 100
x = const(velocity.run.fwd.x)
[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 2 || animelem = 5)
value = 0, 100
[State 100, change]
type = changeanim
triggerall = time >= 8 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && p2dist x < 80
value = 101
persistent = 0
[State 100, steps]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0
[State 100, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1


;====< BACK DASH >==
[Statedef 105]
type = A
movetype = I
physics = N
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Pos]
type = posadd
trigger1 = animelem = 2
x = -26

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Accel]
type = gravity
trigger1 = animelemtime(2) >= 0
[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 105, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -4
value = 52


;==< GUARD >==
;--- START ---
[Statedef 120]
type = U
physics = U
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 120, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2
[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S
[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype = C)
value = 131
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140

[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

;--- CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C
[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype != C)
value = 130
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- AIR GUARD (guarding) ---
[Statedef 132]
type = A
physics = N
[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132
[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 132, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52
[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- GUARD (end) ---
[Statedef 140]
type = U
physics = U
ctrl = 1
[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 140, 5]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

;--- SGUARDHIT (shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0
[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150
[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 150, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S

;--- SGUARDHIT2 (knocked back) ---
[Statedef 151]
type = S
movetype = H
physics = S
anim = 150
[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 151, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1

;--- CGUARDHIT (shaking) ---
[Statedef 152]
type = C
movetype = H
physics = N
velset = 0, 0
[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151
[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 152, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S

;--- CGUARDHIT2 (knocked back) ---
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151
[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 153, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1

;--- AGUARDHIT (shaking) ---
[Statedef 154]
type = A
movetype = H
physics = N
velset = 0, 0
[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152
[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

;--- AGUARDHIT2 (knocked away) ---
[Statedef 155]
type = A
movetype = H
physics = N
anim = 152
[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 155, Vel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)
[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 155, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;==< TAUNT >==
[Statedef 195]
type = S
movetype = I
physics = S
juggle = 0 
anim = 195
velset = 0, 0
sprpriority = -1
ctrl = 0

[State 195, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = A
[State 195, Type]
type = statetypeset
trigger1 = animelem = 7
movetype = I

[State 195, Hit]
type = hitdef
trigger1 = animelem = 6
attr = S, NA
damage = 7, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(12) := 8010)
guard.sparkno = -1 + 0 * (var(13) := 8000)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -64
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -4, 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
sprpriority = -1

[State 195, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 1
channel = 1
[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< LOSE (Time over) >==
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==< DRAWGAME (Time over) >==
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0
[State 175, switch]
type = changestate
trigger1 = !time && !selfanimexist(175)
value = 170
[State 175, Anim]
type = changeanim
trigger1 = !time
value = 175
[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==< INITIALIZE >==
[Statedef 5900]
type = S

[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
value = 0
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, turnsintro]
type = changestate
trigger1 = !time && teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = ifelse(random < 500, 182, 188)
[State 5900, End]
type = changestate
trigger1 = !time
value = ifelse(roundno = 1, 190, 0)


;==< PREINTRO >==
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0


;vs Cody
[State 191, 1]
type = ChangeState
triggerAll = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = P2Name = "Cody"
trigger2 = P4Name = "Cody"
trigger3 = P2Name = "Cody Travers"
trigger4 = P4Name = "Cody Travers"
trigger5 = P2Name = "CvS Cody"
trigger6 = P4Name = "CvS Cody"
value = 193


[State 190, intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 181, ifelse(random < 500, 182, 188))


;==< INTRO 1 >==
[Statedef 181]
type = S
anim = 181
[State 181, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 181, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO 2 >==
[Statedef 182]
type = S
physics = N
anim = 182

[State 182, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 182, Camera]
type = helper
trigger1 = !time && !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 182, bound]
type = screenbound
trigger1 = 1
value = 0

[State 182, Pos]
type = posadd
trigger1 = !time
x = -320

[State 182, Vel]
type = velset
trigger1 = anim = 182
x = 1.2 * const(velocity.run.fwd.x)

[State 182, Shadows]
type = afterimage
trigger1 = !time
time = 2
timegap = 1
framegap = 3
length = 10
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.8, 0.8, 0.8
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1
[State 182, moveshadowoff]
type = afterimagetime
trigger1 = anim != 182
time = 0
[State 182, steps]
type = playsnd
trigger1 = anim = 182 && (animelem = 2 || animelem = 5)
value = 0, 100
[State 182, Dust]
type = explod
trigger1 = anim = 182 && (animelem = 2 || animelem = 5)
anim = 7101
ID = 7101
sprpriority = 3
postype = p1
pos = -55, 0
scale = 0.5, 0.5
removetime = -2
ownpal = 1
[State 182, Anim]
type = changeanim
trigger1 = time && anim = 182 && numhelper(7650)
trigger1 = (helper(7650), rootdist x) > -5
value = 12
[State 182, Snd]
type = playsnd
trigger1 = anim = 12 && animelem = 1
value = 4, 0
channel = 0
[State 182, Vel]
type = velset
trigger1 = anim = 12 && animelem = 1
x = (helper(7650), rootdist x) / -5
[State 182, Pos]
type = posset
trigger1 = anim = 12 && !animtime && numhelper(7650)
x = ceil(helper(7650), pos x)
[State 182, End]
type = changestate
trigger1 = anim = 12 && !animtime
value = 0


;==< INTRO 3 >==
[Statedef 188]
type = A
physics = N
anim = 188
[State 188, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 188, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 188, bound]
type = screenbound
trigger1 = 1
value = 0

[State 188, Pos]
type = posadd
trigger1 = !time
x = -260
y = -40
[State 188, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -52.0
y = -1
[State 188, Accel]
type = veladd
trigger1 = time >= 25
trigger1 = (anim = 188 || anim = 189 && animelemtime(2) < 0)
y = 0.25

[State 188, Snd]
type = playsnd
trigger1 = time = 5
value = 3, 7
channel = 0

[State 188, barrel]
type = helper
trigger1 = time = 5
helpertype = normal
stateno = 6000
ID = 6000
name = "Barrel"
postype = p1
pos = 88, -60
[State 188, barrel]
type = helper
trigger1 = time = 5
helpertype = normal
stateno = 6001
ID = 6000
name = "Barrel"
postype = p1
pos = 88, -50

[State 188, Snd]
type = playsnd
trigger1 = time = 5
value = 5, 4

[State 188, Anim]
type = changeanim
trigger1 = time && anim = 188 && pos y >= -15
value = 189
[State 188, Anim]
type = changeanim
trigger1 = time && anim = 189 && animelemtime(2) < 0 && pos y >= 0
value = 189
elem = 2
[State 188, Pos]
type = posset
trigger1 = anim = 189 && animelemtime(2) >= 0
x = ceil(helper(7650), pos x)
y = 0
[State 188, Vel]
type = velset
trigger1 = anim = 189 && animelemtime(2) >= 0
x = 0
y = 0
[State 188, Snd]
type = playsnd
trigger1 = anim = 189 && animelem = 2
value = 0, 52
[State 188, Dust]
type = explod
trigger1 = anim = 189 && animelem = 2
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
[State 188, End]
type = changestate
trigger1 = anim = 189 && !animtime
value = 0

;---------------------------------------------------------------------
; Intro 3 (vs Cody)
[Statedef 193]
type = S
movetype = I
physics = S
anim = 193
velset = 0,0
ctrl = 0

[State 194, 0]
type = PosAdd
trigger1 = Time = 0
X = -59.5

[State 194, 0]
type = Explod
trigger1 = Time = 0
anim = 19330+(random%5)
postype = p1
pos = 60,0
removetime = 256

[State 194, 1]
type = AssertSpecial
trigger1 = 1
flag = intro

; Explods golpes en barril
[State 193]
type = Helper
trigger1 = Time = 135
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(31 * const(size.xscale)), ceil(-67 * const(size.yscale))
ownPal = 1
sprpriority = 20
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

; Explods golpes en barril
[State 193]
type = Helper
trigger1 = Time = 135
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(50 * const(size.xscale)), ceil(-55 * const(size.yscale))
ownPal = 1
sprpriority = 20
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 193]
type = Helper
trigger1 = Time = 151
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(36 * const(size.xscale)), ceil(-81 * const(size.yscale))
ownPal = 1
sprpriority = 20
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 193]
type = Helper
trigger1 = Time = 151
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(50 * const(size.xscale)), ceil(-60 * const(size.yscale))
ownPal = 1
sprpriority = 20
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 194, 8]
type = PlaySnd
trigger1 = Time = 167
value = s400,20

[State 194, 8]
type = PlaySnd
trigger1 = Time = 135
trigger2 = Time = 151
value = s2,0

[State 194, 8]
type = PlaySnd
trigger1 = AnimTime = 0
value = s193,0

; Helper: Senpuukyaku
[State 194, Helper senpuukyaku]
type = Helper
trigger1 = AnimElem = 5
postype = p1
pos = 0,0
stateno = 19301
helpertype = normal
ownpal = -1
keyctrl = 0

[State 194, 3]
type = PosAdd
trigger1 = Time > 238
X = const(velocity.walk.fwd.x)

[State 194, 4]
type = RemoveExplod
trigger1 = AnimTime = 0
ID = 19330

; Helper: Barriles
[State 194, 6]
type = Helper
trigger1 = Time = 0
postype = p1
pos = -20,-200
stateno = 19320
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 8
postype = p1
pos = 36,-205
stateno = 19321
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 15
postype = p1
pos = -58,-201
stateno = 19322
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 23
postype = p1
pos = -3,-195
stateno = 19323
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 25
postype = p1
pos = 16,-269
stateno = 19324
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 32
postype = p1
pos = -40,-272
stateno = 19325
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 6]
type = Helper
trigger1 = Time = 38
postype = p1
pos = -5,-279
stateno = 19326
helpertype = normal
ownpal = 1
keyctrl = 0

; Helper: Barriles parte 3
[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = 38,-45
stateno = 19350
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = -11,-55
stateno = 19351
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = -48,-112
stateno = 19351
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = 14,-78
stateno = 19352
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = -7,-88
stateno = 19353
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = -22,-9
stateno = 19353
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 167
postype = p1
pos = -61,-18
stateno = 19353
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = 11,-113
stateno = 19354
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = -13,-124
stateno = 19355
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = -29,-41
stateno = 19355
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = -73,-51
stateno = 19355
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = 41,-14
stateno = 19356
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = -2,-25
stateno = 19357
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 7]
type = Helper
trigger1 = Time = 168
postype = p1
pos = -45,-82
stateno = 19357
helpertype = normal
ownpal = 1
keyctrl = 0

[State 194, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------
; Helper: Senpuukyaku
;---------------------
[Statedef 19301]
type = A
movetype = I
physics = N
anim = 19301
velset = 0,0

[State 10020, 0]
type = VelSet
trigger1 = Time = 0
Y = -3.9

[State 10020, 1]
type = VelAdd
trigger1 = Time < 26
Y = 0.15

[State 10020, 2]
type = VelAdd
trigger1 = Time >= 56
Y = 0.3 

[State 10020, 3]
type = VelSet
trigger1 = Time = [24,55]
Y = 0

[State 10020, 4]
type = PlaySnd
trigger1 = AnimElem = 1
value = s3,7

[State 10020, 4]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 5
trigger3 = AnimElem = 9
trigger4 = AnimElem = 13
trigger5 = AnimElem = 17
trigger6 = AnimElem = 21
value = s1,4

[State 10020, 9]
type = DestroySelf
trigger1 = Time > 0 && Pos Y >= 0
trigger2 = RoundState = 2

;----------------------------
; Helpers: Barriles, parte 1
;----------------------------
[Statedef 19320]
type = A
movetype = I
physics = N
anim = 19310
velset = 0,0

[State 10040, 1]
type = SprPriority
trigger1 = 1
value = 6

[State 10040, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10040, 9]
type = ChangeState
trigger1 = Time = 36
value = 19340

[Statedef 19321]
type = A
movetype = I
physics = N
anim = 19310
velset = 0,0

[State 10041, 1]
type = SprPriority
trigger1 = 1
value = 5

[State 10041, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10041, 9]
type = ChangeState
trigger1 = Time = 36
value = 19341

[Statedef 19322]
type = A
movetype = I
physics = N
anim = 19311
velset = 0,0

[State 10042, 1]
type = SprPriority
trigger1 = 1
value = 5

[State 10042, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10042, 9]
type = ChangeState
trigger1 = Time = 36
value = 19342

[Statedef 19323]
type = A
movetype = I
physics = N
anim = 19311
velset = 0,0

[State 10043, 1]
type = SprPriority
trigger1 = 1
value = -1

[State 10043, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10043, 9]
type = ChangeState
trigger1 = Time = 36
value = 19343

[Statedef 19324]
type = A
movetype = I
physics = N
anim = 19310
velset = 0,0

[State 10044, 1]
type = SprPriority
trigger1 = 1
value = 8

[State 10044, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10044, 9]
type = ChangeState
trigger1 = Time = 36
value = 19344

[Statedef 19325]
type = A
movetype = I
physics = N
anim = 19311
velset = 0,0

[State 10045, 1]
type = SprPriority
trigger1 = 1
value = 8

[State 10045, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10045, 9]
type = ChangeState
trigger1 = Time = 36
value = 19345

[Statedef 19326]
type = A
movetype = I
physics = N
anim = 19311
velset = 0,0

[State 10046, 1]
type = SprPriority
trigger1 = 1
value = -1

[State 10046, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10046, 9]
type = ChangeState
trigger1 = Time = 36
value = 19346

;----------------------------
; Helpers: Barriles, parte 2
;----------------------------
[Statedef 19340]
type = A
movetype = I
physics = N
anim = 19320
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10050, 1]
type = PosSet
trigger1 = Time = 0
Y = 10

[State 10050, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10050, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19341]
type = A
movetype = I
physics = N
anim = 19321
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10051, 1]
type = PosSet
trigger1 = Time = 0
Y = 5

[State 10051, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10051, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19342]
type = A
movetype = I
physics = N
anim = 19322
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10052, 1]
type = PosSet
trigger1 = Time = 0
Y = 5

[State 10052, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10052, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19343]
type = A
movetype = I
physics = N
anim = 19323
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10053, 1]
type = PosSet
trigger1 = Time = 0
Y = -1

[State 10053, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10053, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19344]
type = A
movetype = I
physics = N
anim = 19324
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10054, 1]
type = PosSet
trigger1 = Time = 0
Y = -59

[State 10054, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10054, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19345]
type = A
movetype = I
physics = N
anim = 19325
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10055, 1]
type = PosSet
trigger1 = Time = 0
Y = -62

[State 10055, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10055, 3]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 19346]
type = A
movetype = I
physics = N
anim = 19326
velset = 0,0

[State 10050, 0]
type = PlaySnd
trigger1 = Time = 0
value = s600,0

[State 10056, 1]
type = PosSet
trigger1 = Time = 0
Y = -69

[State 10056, 2]
type = EnvShake
trigger1 = Time = 0
time = 10

[State 10056, 3]
type = DestroySelf
trigger1 = AnimTime = 0

;----------------------------
; Helpers: Barriles, parte 3
;----------------------------
[Statedef 19350]
type = A
movetype = I
physics = N
anim = 19327
velset = 2,-6

[State 10060, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10060, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10060, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19351]
type = A
movetype = I
physics = N
anim = 19327
velset = -2,-6

[State 10061, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10061, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10061, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19352]
type = A
movetype = I
physics = N
anim = 19328
velset = 2,-6

[State 10062, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10062, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10062, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19353]
type = A
movetype = I
physics = N
anim = 19328
velset = -2,-6

[State 10063, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10063, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10063, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19354]
type = A
movetype = I
physics = N
anim = 19327
velset = 3,-6

[State 10064, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10064, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10064, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19355]
type = A
movetype = I
physics = N
anim = 19327
velset = -3,-6

[State 10065, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10065, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10065, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19356]
type = A
movetype = I
physics = N
anim = 19328
velset = 3,-6

[State 10066, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10066, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10066, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2

[Statedef 19357]
type = A
movetype = I
physics = N
anim = 19328
velset = -3,-6

[State 10067, 1]
type = SprPriority
trigger1 = 1
value = 7

[State 10067, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 10067, 9]
type = DestroySelf
trigger1 = Pos Y >= 0
trigger2 = RoundState = 2
;==< WIN POSE DECIDER >==
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = 1 + (random % 8)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Cody" || enemy, name = "Cody Travers"
trigger2 = enemy, name = "cvscody"
value = 50

[State 180, winBMR]
type = changestate
trigger1 = prevstateno = 186
value = 186

[State 180, winspecial]
type = changestate
trigger1 = matchover
trigger1 = command = "holdstart" || random < (250 * (AIlevel ** 2 / 64.0))
value = 187

[State 180, winxa]
type = changestate
trigger1 = (command = "holda" || command = "holdx")
value = 183

[State 180, winyb]
type = changestate
trigger1 = (command = "holdb" || command = "holdy")
value = 184

[State 180, winzc]
type = changestate
trigger1 = (command = "holdc" || command = "holdz")
value = 185

[State 180, win1]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 183, ifelse(random < 500, 184, 185))


;==< WIN 1 >==
[Statedef 183]
type = S
anim = 183

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6009
pos = 0,0
postype = p1
stateno = 6009
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, Voice]
type = null ;playsnd
trigger1 = time = 0 && MatchOver
value = 182,0
channel = 8

[State 187, Assert]
type = null ;assertspecial
trigger1 = 1 && MatchOver
flag = roundnotover
flag2 = nomusic
ignorehitpause =1

[State 183, Pos]
type = posset
trigger1 = pos y
y = 0


;==< WIN 2 >==
[Statedef 184]
type = S
anim = 184

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6009
pos = 0,0
postype = p1
stateno = 6009
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, Voice]
type = null ;playsnd
trigger1 = time = 0 && MatchOver
value = 182,0
channel = 8

[State 187, Assert]
type = null ;assertspecial
trigger1 = 1 && MatchOver
flag = roundnotover
flag2 = nomusic
ignorehitpause =1

[State 184, Pos]
type = posset
trigger1 = pos y
y = 0

[State 184, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 184, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 3
channel = 0
persistent = 0


;==< WIN 3 >==
[Statedef 185]
type = S
anim = 185

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6009
pos = 0,0
postype = p1
stateno = 6009
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, Voice]
type = null ;playsnd
trigger1 = time = 0 && MatchOver
value = 182,0
channel = 8

[State 187, Assert]
type = null ;assertspecial
trigger1 = 1 && MatchOver
flag = roundnotover
flag2 = nomusic
ignorehitpause =1

[State 185, Pos]
type = posset
trigger1 = pos y
y = 0

[State 185, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 2
channel = 0
persistent = 0


;==< WIN 4 >==
[Statedef 187]
type = S

[State 182, Voice]
type = null ;playsnd
trigger1 = time = 0 && MatchOver
value = 182,0
channel = 8

[State 187, Assert]
type = null ;assertspecial
trigger1 = 1 || frontedgedist > -40 && MatchOver
flag = roundnotover
flag2 = nomusic
ignorehitpause =1

[State 187, Anim]
type = changeanim
trigger1 = time < 60 && anim
value = 0

[State 187, Anim]
type = changeanim
trigger1 = time >= 60 && anim != 187
value = 187

[State 187, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 187, bound]
type = screenbound
trigger1 = anim = 187
value = 0

[State 187, Pos]
type = posset
trigger1 = pos y
y = 0

[State 187, Vel]
type = velset
trigger1 = anim = 187
x = 0.75 * const(velocity.walk.fwd.x)

[State 187, bound]
type = screenbound
trigger1 = anim = 187
value = 0

[State 187, pointer]
type = helper
trigger1 = time = 5
helpertype = normal
stateno = 6005
ID = 6005
name = "GO!"
postype = p1
facing = 1
size.xscale = 1
size.yscale = 1


;==< WIN by B.M.R. >==
[Statedef 186]
type = S
sprpriority = -1
velset = 0, 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6009
pos = 0,0
postype = p1
stateno = 6009
helpertype = normal
ownpal = 1
keyctrl = 1

[State 187, Assert]
type = null ;assertspecial
trigger1 = 1 && MatchOver
flag = roundnotover
flag2 = nomusic
ignorehitpause =1

[State 182, Voice]
type = null ;playsnd
trigger1 = time = 0 && MatchOver
value = 182,0
channel = 8

[State 186, Pos]
type = posset
trigger1 = pos y
y = 0

[State 186, Anim]
type = changeanim
trigger1 = !time && prevstateno = 4001
value = 186

[State 184, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 351, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 3
channel = 0

[State 186, win]
type = changestate
trigger1 = time >= 30 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

;==< CONTINUE? >==
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==< FALL RECOVERY >==
[Statedef 5200]
type = A
movetype = H
physics = N
[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050
[State 5200, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5201

[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0
[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0
[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 2
channel = 0
[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5201, Dust]
type = playsnd
trigger1 = !time
value = 0, 101
[State 5201, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 1, 0
scale = 1, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;==< RECOVERY ROLL >==
[Statedef 5220]
type = A
movetype = H
physics = N
[State 5220, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050
[State 5220, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 5220, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5221

[Statedef 5221]
type = C
movetype = I
physics = N
anim = 5220
velset = 6
facep2 = 1
[State 5221, Pos]
type = posset
trigger1 = 1
y = 0
[State 5221, Vel]
type = velset
trigger1 = 1
y = 0
[State 5221, Push]
type = playerpush
trigger1 = 1
value = 0
[State 5221, Anim]
type = changeanim
trigger1 = animelem = 9 && command != "holdfwd"
value = 5220
elem = 17
[State 5221, Dust]
type = explod
trigger1 = !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = -1, 0
removetime = -2
ownpal = 1
[State 5221, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;==< TARGET SAFE FALL >==
[Statedef 5205]
type = A
physics = N
movetype = H

[State 5205, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 5205, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5205, Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 5205, Air]
type = selfstate
trigger1 = time >= 60
value = 5210


;===
;===< -2 STATES >=
;===
[Statedef -2]

;#ADD004BASIC PIEs#
;//==
;// add004-sctrls-start
;//==
;sys::-2::partners_standby ; ???????
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(??)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(??)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(??????)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(??)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; ??????
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ?????
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id) && partner,numhelper(90900)=0
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=1
	size.air.front=1702252 ;; <<-version
	size.height=0
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)
;sys::-2::get_players_id2
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;sys::-2::bk/jd_system ; ?????/????D
[state 0]
	type=hitoverride
	trigger1=(numprojid(195502)||numprojid(195503)) && !ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1

;//==
;;>>@Config.Face>>
;sys::-2::face_d ; portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	scale=playerid(floor(sysfvar(0))),fvar(32-(id=playerid(floor(sysfvar(0))),var(15))*10), playerid(floor(sysfvar(0))),fvar(33-(id=playerid(floor(sysfvar(0))),var(15))*10)
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(30-(id=playerid(floor(sysfvar(0))),var(15))*10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(31-(id=playerid(floor(sysfvar(0))),var(15))*10)))
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(36-(id=playerid(floor(sysfvar(0))),var(15))*10))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(34-(id=playerid(floor(sysfvar(0))),var(15))*10)), floor(playerid(floor(sysfvar(0))),fvar(35-(id=playerid(floor(sysfvar(0))),var(15))*10))
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1
;sys::-2::face_d_mod
[state 0]
	type=removeexplod
	trigger1=sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900)
	trigger1=(playerid(floor(sysfvar(0))),var(9)&262144) || !(playerid(floor(sysfvar(0))),var(9)&4)
	trigger2=roundstate!=2 || (stateno=5150 && time=5 && !alive)
	id=490600
	ignorehitpause=1

;//==
;;>>@Config.Camera>>
;sys::-2::camera_nc ; ????
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
;sys::-2::camera_np
[state 0]
	type=playerpush
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
;sys::-2::camera_nc2
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==
;sys::-2::add.option2-noko
[state 0] ;; opt-noko
	type=assertspecial
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && (playerid(floor(sysfvar(0))),var(9)&65536) ;; opt-noko
	flag=noko
	ignorehitpause=1
;sys::-2::add.option3-life-mod
[state 0] ;; opt-life-mod
	type=lifeadd
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && playerid(floor(sysfvar(0))),var(23)!=0 ;; opt-mod-life
	value=playerid(floor(sysfvar(0))),var(23)
	kill=0
	ignorehitpause=1

;//==
;// optional settings
;sys::-2::guard_crush_fx ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=40
	time=2
	add=200,0,0
;sys::-2::guard_crush_cs
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=50
	value=190010
	ignorehitpause=1
;;--- dizzy
;sys::-2::goto-dizzy_s/c
[state 0] ;[.03-2d1]
	type=selfstate
	trigger1=(stateno=5001 || stateno=5011) && hitover     && alive && !ishelper && life>1 && roundstate=2 && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195201 ;; (goto-dizzy:190116)
;sys::-2::goto-dizzy_a/l
[state 0] ;[.03-2d2]
	type=selfstate
	trigger1=(stateno=5030 || stateno=5071) && hitshakeover && alive && !ishelper && life>1 && roundstate=2 && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195050
;;--- fadeout when KOed ; KO????
;sys::-2::st5150-1
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
;sys::-2::st5150-2
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
;;--- intro-pos-reset
;sys::-2::st5900-p3
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
;sys::-2::st5900-p4
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
;sys::-2::st5900-p5
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(144)*ifelse(teamside=1,-1,1)

;//==
;// add004-sctrls-end
;//==

;---------------------------------------------------
;VVVVVVV Electro -2 Interactive stage codes VVVVVVVV
;---------------------------------------------------

;---------------------------------------
;VVVVV - Extra Fun Stuff Remove - VVVVV

;Fire React (Remove this code if you have custom Fire animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88912) = 1
time = 45
add = 255,155,2
mul = 255,155,1
sinadd = 110,55,85,10
invertall = 0
color = 0

;---------------------------------------
;Electric react   (Remove this code if you have custom Electric animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88920) = 1
time = 45
add = 48,48,48
mul = 256,256,256
sinadd = 64,64,64,4
invertall = 1
color = 0
;--------------------------------------------

;^^^^^^ - Extra Fun Stuff Remove - ^^^^^^
;---------------------------------------------

;---------------------------------------
;Assert Specials Finishers Stuff
[State -2, NoShadowFinishers]
type = AssertSpecial
trigger1 = stateno = 5150
trigger1 = prevstateno = 889668
trigger2 = stateno = 5150
trigger2 = prevstateno = 889674
trigger3 = stateno = 5150
trigger3 = prevstateno = 889756
trigger4 = stateno = 5150 && prevstateno = 889310
flag = noshadow

[State -2, nokoslow]
type = assertspecial
trigger1 = roundno != 1
trigger1 = stagevar(info.name) = "Howard Arena"
trigger2 = roundno != 1
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger3 = roundno != 1
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger4 = roundno != 1
trigger4 = stagevar(info.name) = "The Dead Pool"
trigger5 = roundno != 1
trigger5 = stagevar(info.name) = "Green Hell"
trigger6 = roundno != 1
trigger6 = stagevar(info.name) = "Vagnad Stage"
trigger7 = roundno != 1
trigger7 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger8 = roundno != 1
trigger8 =stagevar(info.name) = "Ultimate_USSR" 
flag = nokoslow

[State -2, NoForeground]
type = AssertSpecial
trigger1 = stateno = 5150
trigger1 = prevstateno = 889764
flag = noFG

[State -2, Invisble]
type = ChangeAnim
trigger1 = stateno = 181
trigger1 = prevstateno = 889769
trigger2 = stateno = 5150 && prevstateno = 889310
value = 9800 ;invisible
ignorehitpause = 1

[State -2, PosSet]
type = PosSet
trigger1 = stateno = 181
trigger1 = prevstateno = 889769
trigger1 = stateno = 5150 && prevstateno = 889310
x = 0
y = 300
ignorehitpause = 1

;---------------------------------------
;Fire React (Remove this code if you have custom Fire animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88912) = 1
time = 45
add = 255,155,2
mul = 255,155,1
sinadd = 110,55,85,10
invertall = 0
color = 0

;---------------------------------------
;Electric react   (Remove this code if you have custom Electric animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88920) = 1
time = 45
add = 48,48,48
mul = 256,256,256
sinadd = 64,64,64,4
invertall = 1
color = 0

;---------------------------------
;Fire Ropes for J. Carn's World Heroes Death Match 1 stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "Death Match"
trigger1 = Numhelper(88910) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match"
trigger2 = Numhelper(88910) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Firerope"
stateno = 88910
helpertype = normal
ownpal = 1
ID = 88910   ;Numhelper and ID have to be the same

;---------------------------------
;Electric Ropes for Hanzo's World heroes Death Match 2 stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "Death Match 2"
trigger1 = Numhelper(88920) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match 2"
trigger2 = Numhelper(88920) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Electricrope"
stateno = 88920
helpertype = normal
ownpal = 1
ID = 88920    ;Numhelper and ID have to be the same

;------------------------------------------
;Spiked Wall for Fumma's World Heroes Death Match 3 stage
[State -2, deathmatchspikes]
type = Helper
trigger1 = stagevar(info.name) = "Death Match 3"
trigger1 = Numhelper(88926) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match 3"
trigger2 = Numhelper(88926) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -500,0
name = "SpikedWall"
stateno = 88926
helpertype = normal
ownpal = 1
ID = 88926   ;Numhelper and ID have to be the same

;----------------------------------------
; Water Splash KoF Garou stage
[State -2, watersplashfall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "KoF95_Garou"
trigger1 = stateno = 5100 || stateno = 5110
anim = F89059
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = 1
removetime = 17
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplashjump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "KoF95_Garou"
trigger1 = stateno = 40 || stateno = 52
anim = F89056
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 14
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplashIdle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "KoF95_Garou"
anim = F89228
ID = 77446
pos = 0,-8
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, RemoveWater]
type = RemoveExplod
trigger1 = Pos Y <= -1 
trigger1 = time >=0
id = 77446

;-----------------------------------------------------
; Water Splash for Northern Country Canyon stages
[State -2, watersplash2fall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger1 = stateno = 5100 || stateno = 5110
trigger2 = time = 1
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring"
trigger2 = stateno = 5100 || stateno = 5110
anim = F89104
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 27
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2jump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger1 = stateno = 40 || stateno = 52
trigger2 = time = 1
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring"
trigger2 = stateno = 40 || stateno = 52
anim = F89103
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 21
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2idle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger2 = NumExplod(77446) = 0 
trigger2 = Pos Y = 0
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring" 
anim = F89102
ID = 77446
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

;------------------------------------
;  Totem for "Green Hell" Stage Behind/Lower
[State -2, Totem]
type = Helper
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 = Numhelper(889360) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Green Hell"
trigger2 = Numhelper(889360) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,17
name = "Totem"
stateno = 889360
helpertype = normal
ownpal = 1
ID = 889360   ;Numhelper and ID have to be the same

;  Totem for "Green Hell" Stage Front/Higher
[State -2, Totem]
type = Helper
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 = Numhelper(889365) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Green Hell"
trigger2 = Numhelper(889365) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 266,-2
name = "Totem"
stateno = 889365
helpertype = normal
ownpal = 1
ID = 889365   ;Numhelper and ID have to be the same

;--------------------------------
;Howard Arena stuff
[State -2, Andy FF3 stage finisher floor]
type = Helper
trigger1 = stagevar(info.name) = "Howard Arena"
trigger1 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = roundno != 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger2 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = roundno != 1
trigger2 = TeamMode != Simul
trigger2 = Pos Y = 0
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger3 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger3 = teamside = 1
trigger3 = roundno != 1
trigger3 = TeamMode != Simul
trigger3 = Pos Y = 0
trigger4 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger4 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger4 = teamside = 1
trigger4 = roundno != 1
trigger4 = TeamMode != Simul
trigger4 = Pos Y = 0
trigger5 = stagevar(info.name) = "Howard Arena"
trigger5 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger5 = teamside = 1
trigger5 = roundno != 1
trigger5 = TeamMode = Simul
trigger5 = numpartner = 1 && id<partner,id
trigger5 = Pos Y = 0
trigger6 = stagevar(info.name) = "Howard Arena Storm"
trigger6 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger6 = teamside = 1
trigger6 = roundno != 1
trigger6 = TeamMode = Simul
trigger6 = numpartner = 1 && id<partner,id
trigger6 = Pos Y = 0
trigger7 = stagevar(info.name) = "Howard Arena Thunder"
trigger7 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger7 = teamside = 1
trigger7 = roundno != 1
trigger7 = TeamMode = Simul
trigger7 = numpartner = 1 && id<partner,id
trigger7 = Pos Y = 0
trigger8 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger8 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger8 = teamside = 1
trigger8 = roundno != 1
trigger8 = TeamMode = Simul
trigger8 = numpartner = 1 && id<partner,id
trigger8 = Pos Y = 0
helpertype = normal ;player
name = "ff3stagefinisher"
ID = 889323       ;Numhelper and ID have to be the same
stateno = 889323
pos = 0,0
postype = left
facing = 1
ownpal = 1
supermove = 999999999
pausemove = 999999999

;-----------------------------------------
; FF subway stuff
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889120) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889120) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,17
name = "Barrel 2"
stateno = 889120
helpertype = normal
ownpal = 1
ID = 889120   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;FF subway barrel Energy #1
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889140) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889140) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,-3
name = "Barrel 2"
stateno = 889140
helpertype = normal
ownpal = 1
ID = 889140   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;FF subway barrel Energy #2
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889150) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889150) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,21
name = "Barrel 2"
stateno = 889150
helpertype = normal
ownpal = 1
ID = 889150   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;FF Sodom's Back Alley barrel rolling
[State -2, barrel rolling SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889475) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamSide = 1
trigger1 = RoundNo = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889475) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamSide = 1
trigger2 = RoundNo = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 259,22
name = "BarrelRoll"
stateno = 889475
helpertype = normal
ownpal = 1
ID = 889475   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley barrel Health
[State -2, barrel SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 96,-19
name = "Barrel6"
stateno = 889440
helpertype = normal
ownpal = 1
ID = 889440   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley trash can #1
[State -2, trashcan#1 SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889458) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889458) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 29,-19
name = "SBAtrashcan1"
stateno = 889458
helpertype = normal
ownpal = 1
ID = 889458   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley trash can #2 empty
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889467) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889467) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -27,-19
name = "SBAtrashcan1"
stateno = 889467
helpertype = normal
ownpal = 1
ID = 889467   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------
;Barrels for SS2 Galford stage
[State -2, GalfordBarrel1]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = Numhelper(889109) = 0  ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = Numhelper(889109) = 0  ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -123,12
name = "GalfordBarrel1"
stateno = 889109
helpertype = normal
ownpal = 1
ID = 889109   ;Numhelper and ID have to be the same

[State -2, GalfordBarrel2]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = Numhelper(889113) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = Numhelper(889113) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 260,12
name = "GalfordBarrel2"
stateno = 889113
helpertype = normal
ownpal = 1
ID = 889113   ;Numhelper and ID have to be the same

;-----------------------------------------------
;Samurai Monger Life & Bomb toss for player 1
[State -2, LifeandBomb]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = (GameTime % 1600) = random%27
trigger1 = time >=1
trigger1 = teamside = 1
trigger1 = Numhelper(889160) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = (GameTime % 1600) = random%27
trigger2 = time >=1
trigger2 = teamside = 1
trigger2 = Numhelper(889160) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -385,-5
name = "LifeMonger"
stateno = 889160
helpertype = normal
postype = back;p1    ;p2,front,back,left,right
ownpal = 1
ID = 889160

;-----------------------------------------------
;Samurai Monger Life & Bomb toss for player 2
[State -2, LifeandBomb2]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = (GameTime % 1600) = random%27
trigger1 = time >=1
trigger1 = teamside = 2
trigger1 = Numhelper(889170) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = (GameTime % 1600) = random%27
trigger2 = time >=1
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -400,-5
name = "LifeMonger"
stateno = 889170
helpertype = normal
postype = back;p1    ;p2,front,back,left,right
ownpal = 1
ID = 889170

;------------------------
;FF subway station telephone booth Health
[State -2, telephonebooth subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889180) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889180) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,14
name = "telephone1"
stateno = 889180
helpertype = normal
ownpal = 1
ID = 889180   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF subway station trash can #1
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889195) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889195) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,-3
name = "telephone1"
stateno = 889195
helpertype = normal
ownpal = 1
ID = 889195   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF subway station trash can #2 empty
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889205) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889205) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,16
name = "telephone1"
stateno = 889205
helpertype = normal
ownpal = 1
ID = 889205   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Ryu Signs
[State -2, Ryu Sign]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ryu"
trigger1 = Numhelper(889211) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ryu"
trigger2 = Numhelper(889211) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,-5
name = "Ryusign"
stateno = 889211
helpertype = normal
ownpal = 1
ID = 889211   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Ryu Sign2]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ryu"
trigger1 = Numhelper(889221) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ryu"
trigger2 = Numhelper(889221) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-5
name = "Ryusign2"
stateno = 889221
helpertype = normal
ownpal = 1
ID = 889221   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Guile Crate
[State -2, Guile Crate]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Guile" 
trigger1 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Guile" 
trigger2 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 360,-3
name = "GuileCrate"
stateno = 889240
helpertype = normal
ownpal = 1
ID = 889240   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Ken Barrels/Crates
[State -2, Ken Barrels/Crates]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ken"
trigger1 = Numhelper(889248) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ken"
trigger2 = Numhelper(889248) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 390,20
name = "KenBarrelsCrates"
stateno = 889248
helpertype = normal
ownpal = 1
ID = 889248   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;M.Bison Statues
[State -2, M.Bison Statue]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) M.Bison"
trigger1 = Numhelper(889400) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) M.Bison"
trigger2 = Numhelper(889400) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,-5
name = "MBisonStatue1"
stateno = 889400
helpertype = normal
ownpal = 1
ID = 889400   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, M.Bison Statue2]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) M.Bison"
trigger1 = Numhelper(889430) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) M.Bison"
trigger2 = Numhelper(889430) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-5
name = "MBisonStatue2"
stateno = 889430
helpertype = normal
ownpal = 1
ID = 889430   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------------------------------
;^^^^^^^ ELECTR0's IM Code #1 ^^^^^^^^^
;------------------------------------------------------------

;------------------------------------------------------------
;vvvvvv ELECTR0's IM Code #2 vvvvvvvv
;------------------------------------------------------------

;----------------------------------------------
; Belgrave Square Labs Finishers
[State -2, Death Chamber]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889480) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889480) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 69,0
name = "DeathChamber1"
stateno = 889480
helpertype = normal
ownpal = 1
ID = 889480   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Death Chamber2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889481) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889481) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 69,0
name = "DeathChamber2"
stateno = 889481
helpertype = normal
ownpal = 1
ID = 889481   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889482) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889482) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -85,0
name = "VaporChamber1"
stateno = 889482
helpertype = normal
ownpal = 1
ID = 889482   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889483) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889483) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 228,0
name = "VaporChamber2"
stateno = 889483
helpertype = normal
ownpal = 1
ID = 889483   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber Camera Marker]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889478) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889478) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 184,0
name = "VaporChamber3"
stateno = 889478
helpertype = normal
ownpal = 1
ID = 889478   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber Camera Marker2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889479) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889479) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -41,0
name = "VaporChamber4"
stateno = 889479
helpertype = normal
ownpal = 1
ID = 889479   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Belgrave Square Labs] ;send opponent to Death Chamber
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889480)
trigger1=abs(Rootdist X-Helper(889480),Rootdist X)=[-60,60]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889481)
trigger2=abs(Rootdist X-Helper(889481),Rootdist X)=[-60,60]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889485
persistent = 0

[State -2, Time Warp] ;player 1 go to time warp
type = ChangeState
triggerall = movehit
trigger1=numhelper(889480)
trigger1=abs(Rootdist X-Helper(889480),Rootdist X)=[-60,60]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889481)
trigger2=abs(Rootdist X-Helper(889481),Rootdist X)=[-60,60]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889493
ctrl = 0

[State -2, Belgrave Square Labs2] ;send opponent to Vapor Chamber
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889482)
trigger1=abs(Rootdist X-Helper(889482),Rootdist X)=[-50,50]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889483)
trigger2=abs(Rootdist X-Helper(889483),Rootdist X)=[-50,50]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889494
persistent = 0

[State -2, Time Warp2] ;player 1 go to Time Warp
type = ChangeState
triggerall = movehit
trigger1=numhelper(889482)
trigger1=abs(Rootdist X-Helper(889482),Rootdist X)=[-50,50]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889483)
trigger2=abs(Rootdist X-Helper(889483),Rootdist X)=[-50,50]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889498
ctrl = 0

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = roundno != 1
flag = nokoslow

;-----------------------------------------------------
;SurfJet
[State -2, SurfJetidle]
type = Explod
trigger1 = NumExplod(77447) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89156
ID = 77447
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = -10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetidle]
type = Explod
trigger1 = NumExplod(77447) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89156
ID = 77447
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = -10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, JetRemover]
type = RemoveExplod
trigger1 = Pos Y < 0 
trigger1 = time >=0
id = 77447

[State -2, SurfJetJump]
type = Explod
trigger1 = NumExplod(77448) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89157
ID = 77448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetJump]
type = Explod
trigger1 = NumExplod(77448) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89157
ID = 77448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, JetJumpRemover]
type = RemoveExplod
trigger1 = Pos Y = 0 
trigger1 = time >=0
trigger2 = NumExplod(77447) = 1
id = 77448

[State -2, SurfJetSplash]
type = Explod
trigger1 = Pos Y = 0
trigger1 = (GameTime % 10) = 0
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89158
ID = 77449
pos = -16,21
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 32
supermove = 99999
pausemove = 99999
scale = 2,2
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetSplash]
type = Explod
trigger1 = Pos Y = 0
trigger1 = (GameTime % 10) = 0
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89158
ID = 77449
pos = 16,21
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = 1
removetime = 32
supermove = 99999
pausemove = 99999
scale = 2,2
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, AiroJetSpawner]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = Numhelper(889500) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger2 = Numhelper(889500) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -350,0
name = "FarAiroJetSpawn"
stateno = 889500
helpertype = normal
ownpal = 1
ID = 889500   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;Shin Forest Stuff
[State -2, Shin TimeBox]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889520) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889520) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1500,0
name = "ShinTimebox1"
stateno = 889520
helpertype = normal
ownpal = 1
ID = 889520   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin TimeBox2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889525) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889525) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1205,0
name = "ShinTimebox2"
stateno = 889525
helpertype = normal
ownpal = 1
ID = 889525   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin TimeBox3]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889530) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889530) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 494,0
name = "ShinTimebox3"
stateno = 889530
helpertype = normal
ownpal = 1
ID = 889530   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Knife]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889535) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889535) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 860,0
name = "ShinKnife1"
stateno = 889535
helpertype = normal
ownpal = 1
ID = 889535   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Knife2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889546) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889546) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -550,0
name = "ShinKnife2"
stateno = 889546
helpertype = normal
ownpal = 1
ID = 889546   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Pow1]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889556) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889556) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1790,0
name = "ShinPow1"
stateno = 889556
helpertype = normal
ownpal = 1
ID = 889556   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Pow2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889563) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889563) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1970,0
name = "ShinPow2"
stateno = 889563
helpertype = normal
ownpal = 1
ID = 889563   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, KnifeTossHelper]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = NumHelper(889542) >= 1
trigger1 = movetype != H
trigger1 = movetype != A
trigger1 = StateType != C
trigger1 = StateType != L
trigger1 = P2BodyDist X > 70
trigger1 = command = "x"
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = NumHelper(889553) >= 1
trigger2 = movetype != H
trigger2 = movetype != A
trigger2 = StateType != C
trigger2 = StateType != L
trigger2 = P2BodyDist X > 70
trigger2 = command = "x"
helpertype = normal ;player
name = "shinknifeToss1"
ID = 889545
stateno = 889545
pos = -5,-75
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ignorehitpause = 1

[State -2, KnifeTossHelper]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = NumHelper(889542) >= 1
trigger1 = movetype != H
trigger1 = movetype != A
trigger1 = StateType = C
trigger1 = StateType != L
trigger1 = P2BodyDist X > 70
trigger1 = command = "x"
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = NumHelper(889553) >= 1
trigger2 = movetype != H
trigger2 = movetype != A
trigger2 = StateType = C
trigger2 = StateType != L
trigger2 = P2BodyDist X > 70
trigger2 = command = "x"
helpertype = normal ;player
name = "shinknifeToss1Low"
ID = 889555
stateno = 889555
pos = -5,-40
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ignorehitpause = 1

[State -2, ShinHatGuy]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = (GameTime % 600) = random%27
trigger1 = teamside = 2
trigger1 = Numhelper(889571) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = (GameTime % 600) = random%27
trigger2 = teamside = 2
trigger2 = Numhelper(889571) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -800,0
postype = p1
name = "ShinHatGuy"
stateno = 889571 + random%2
helpertype = normal
ownpal = 1
ID = 889571

[State -2, ShinGirl]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = (GameTime % 1300) = random%27
trigger1 = teamside = 2
trigger1 = Numhelper(889582) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = (GameTime % 1300) = random%27
trigger2 = teamside = 2
trigger2 = Numhelper(889582) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
Pos = 0,-450
postype = p1 ;left
name = "ShinGirl"
stateno = 889582 + random%2
helpertype = normal
ownpal = 1
ID = 889582

[State -2, ShinNinjaSpawner]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889600) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889600) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,0
name = "ShinNinjaSpawner"
stateno = 889600
helpertype = normal
ownpal = 1
ID = 889600   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------------------
;Sheeps
[State -2, Sheep]
type = Helper
trigger1 = stagevar(info.name) = "Mareep"
trigger1 = Numhelper(889632) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = Pos Y = 0
;trigger1 = TeamMode != simul
Pos = 0,0
name = "sheep"
stateno = 889632
helpertype = normal
ownpal = 1
ID = 889632   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;Pit 1 Fatality
[State -2, Pit1Fatality] ;send opponent to Death Chamber
type = TargetState
triggerall = movehit
trigger1 = stagevar(info.name) = "The Pit"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger1 = StateType != A
trigger2 = stagevar(info.name) = "SF1 China"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
trigger2 = StateType != A
trigger3 = stagevar(info.name) = "The Pit I"
trigger3 =p2life=0
trigger3=MatchOver
trigger3=P2Dist Y =0
trigger3 = StateType != A
value = 889660
persistent = 0

[State -2, Pit1Fatality] ;player 1 go to time warp
type = ChangeState
triggerall = movehit
trigger1 = stagevar(info.name) = "The Pit"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger1 = StateType != A
trigger2 = stagevar(info.name) = "SF1 China"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
trigger2 = StateType != A
trigger3 = stagevar(info.name) = "The Pit I"
trigger3 =p2life=0
trigger3=MatchOver
trigger3=P2Dist Y =0
trigger3 = StateType != A
value = 889658
ctrl = 0

[State -2, Pit1nokoslow]
type = assertspecial
trigger1 = roundno != 1
trigger1 = stagevar(info.name) = "The Pit"
trigger2 = roundno != 1
trigger2 = stagevar(info.name) = "SF1 China"
trigger3 = roundno != 1
trigger3 = stagevar(info.name) = "The Pit I"
flag = nokoslow
flag2 = nokosnd

;----------------------------------------------
;Real Bout Fatal Fury Subway 3
[State -2, RBFFTrain1]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889665) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889665) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -446,21
name = "RBFFTrain1"
stateno = 889665
helpertype = normal
ownpal = 1
ID = 889665   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFTrain2] ;Position marker player 1
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889671) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889671) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 648,0
name = "RBFFTrainMarker1"
stateno = 889671
helpertype = normal
ownpal = 1
ID = 889671   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFTrain2] ;Position marker player 2
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889676) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889676) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -508,0
name = "RBFFTrainMarker2"
stateno = 889676
helpertype = normal
ownpal = 1
ID = 889676   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFSubway3Finisher] ;send opponent to train death
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889671)
trigger1=abs(Rootdist X-Helper(889671),Rootdist X)=[1,300]
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889676)
trigger2=abs(Rootdist X-Helper(889676),Rootdist X)=[1,300]
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 =p2life=0
trigger2=MatchOver
value = 889672
persistent = 0
ignorehitpause = 1

[State -2, RBFFSubway3Finisher] ;player walk away from train path
type = ChangeState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889671)
trigger1=abs(Rootdist X-Helper(889671),Rootdist X)=[1,300]
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889676)
trigger2=abs(Rootdist X-Helper(889676),Rootdist X)=[1,300]
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 =p2life=0
trigger2=MatchOver
value = 889675
ctrl = 0
ignorehitpause = 1

;------------------------
; FF West Side barrel Health
[State -2, barrel1 WestSide Health]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 602,-15
name = "Barrel1"
stateno = 889440
helpertype = normal
ownpal = 1
ID = 889440   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, barrel2 WestSide Energy]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889680) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 545,-15
name = "Barrel2"
stateno = 889680
helpertype = normal
ownpal = 1
ID = 889680   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan WestSide Energy]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889690) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1267,-14
name = "trashcanWSEnergy"
stateno = 889690
helpertype = normal
ownpal = 1
ID = 889690   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan WestSide Empty]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889700) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1315,-14
name = "trashcanWSEmpty"
stateno = 889700
helpertype = normal
ownpal = 1
ID = 889700   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan2 WestSide Empty]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889706) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 330,23
name = "trashcan2WSEmpty"
stateno = 889706
helpertype = normal
ownpal = 1
ID = 889706   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 1 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889712) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -255,0
name = "Wall1"
stateno = 889712
helpertype = normal
ownpal = 1
ID = 889712  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 2 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889713) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 208,0
name = "Wall2"
stateno = 889713
helpertype = normal
ownpal = 1
ID = 889713  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 3 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889714) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 943,0
name = "Wall3"
stateno = 889714
helpertype = normal
ownpal = 1
ID = 889714  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 1 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889715) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889715) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0 
Pos = -255,0
name = "WSDoor1"
stateno = 889715
helpertype = normal
ownpal = 1
ID = 889715  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 2 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889717) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889717) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id 
trigger2 = Pos Y = 0
Pos = 208,0
name = "WSDoor2"
stateno = 889717
helpertype = normal
ownpal = 1
ID = 889717  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 3 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 943,0
name = "WSDoor3"
stateno = 889719
helpertype = normal
ownpal = 1
ID = 889719  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Edi E WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889724) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1000,0
name = "WSEdiE"
stateno = 889724
helpertype = normal
ownpal = 1
ID = 889724  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Surf Sign1]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889743) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -970,-9
name = "Surfsign1"
stateno = 889743
helpertype = normal
ownpal = 1
ID = 889743   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Surf Sign2]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889749) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 662,-7
name = "Surfsign2"
stateno = 889749
helpertype = normal
ownpal = 1
ID = 889749   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------------------
; Water Splash for YDA_Forest-of_Desolation stage by Yoda & Elk
[State -2, Desolationplash2fall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
trigger1 = stateno = 5100 || stateno = 5110
anim = F89226
ID = 7448
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 27
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 52
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, Desolationplash2jump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
trigger1 = stateno = 40 || stateno = 52
anim = F89225
ID = 7448
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 21
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 52
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2idle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
anim = F89224
ID = 77446
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 51
ontop = 0
ownpal = 1
removeongethit = 0

;--------------------------------------
;Train Floor for Vagnad Stage
[State -2, Vagnad Stage finisher floor]
type = Helper
trigger1 = stagevar(info.name) = "Vagnad Stage"
trigger1 = Numhelper(889315) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Vagnad Stage"
trigger2 = Numhelper(889315) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
helpertype = normal ;player
name = "Vagnadstagefinisher"
ID = 889315       ;Numhelper and ID have to be the same
stateno = 889315
pos = 0,0
postype = left
facing = 1
ownpal = 1
supermove = 999999999
pausemove = 999999999

;--------------------------------------------
;Railing for Capcom Building Stage
[State -2, Capcom Builing Stage finisher Railing]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger1 = Numhelper(889758) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = roundno != 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger2 = Numhelper(889758) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = roundno != 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
helpertype = normal ;player
name = "CBRailstagefinisher"
ID = 889758       ;Numhelper and ID have to be the same
stateno = 889758
pos = 0,0
postype = left
facing = 1
;keyctrl = 0
ownpal = 1
supermove = 999999999
pausemove = 999999999

;------------------------------------------
;Spiked Wall for Death Match Needle stage
[State -2, deathmatchspikes]
type = Helper
trigger1 = stagevar(info.name) = "DEATH MATCH NEEDLE"
trigger1 = Numhelper(889759) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "DEATH MATCH NEEDLE"
trigger2 = Numhelper(889759) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -500,0
name = "SpikedWall"
stateno = 889759
helpertype = normal
ownpal = 1
ID = 889759   ;Numhelper and ID have to be the same

;--------------------------------------------------
;USSR stage finisher stuff
[State -2, USSRstagefinisher] ;Position marker player 1
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 = Numhelper(889761) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 = Numhelper(889761) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 70,0
name = "USSRMarker1"
stateno = 889761
helpertype = normal
ownpal = 1
ID = 889761   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, USSRstagefinisher] ;Position marker player 2
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 = Numhelper(889762) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 = Numhelper(889762) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 70,0
name = "USSRMarker2"
stateno = 889762
helpertype = normal
ownpal = 1
ID = 889762   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RSSRFinisherReact] ;send opponent to train death
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889761)
trigger1=abs(Rootdist X-Helper(889761),Rootdist X)=[-100,100]
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889762)
trigger2=abs(Rootdist X-Helper(889762),Rootdist X)=[-100,100]
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 =p2life=0
trigger2=MatchOver
value = 889763
persistent = 0
ignorehitpause = 1

[State -2, USSR3Finisher] ;player walk away from train path
type = ChangeState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889761)
trigger1=abs(Rootdist X-Helper(889761),Rootdist X)=[-100,100]
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889762)
trigger2=abs(Rootdist X-Helper(889762),Rootdist X)=[-100,100]
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 =p2life=0
trigger2=MatchOver
value = 889769
ctrl = 0
ignorehitpause = 1

;---------------------------------
;Electric Ropes for Axel's Fatal Fury 2 stage
[State -2, ElectricRing]
type = Helper
trigger1 = stagevar(info.name) = "Axel Hawk FFS Night"
trigger1 = Numhelper(889770) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Axel Hawk FFS Night"
trigger2 = Numhelper(889770) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Electricrope2"
stateno = 889770
helpertype = normal
ownpal = 1
ID = 889770    ;Numhelper and ID have to be the same

;---------------------------------
;Explode Ropes for Neo Deo World Heroes Death Match stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "DIO DEATH MATCH"
trigger1 = Numhelper(889772) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "DIO DEATH MATCH"
trigger2 = Numhelper(889772) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Firerope"
stateno = 889772
helpertype = normal
ownpal = 1
ID = 889772  ;Numhelper and ID have to be the same

;------------------------
;Andy Barrel
[State -2, Andy Barrel]
type = Helper
trigger1 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger1 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger2 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-3
name = "AndyBarrel"
stateno = 889240
helpertype = normal
ownpal = 1
ID = 889240   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;----------------------------------------------
;VFGowcaizer Fire Flair
[State -2, VFGowcaizer Fire Flair]
type = Helper
trigger1 = stagevar(info.name) = "VFGowcaizer Stage"
trigger1 = Numhelper(889780) = 0 
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger2 = stagevar(info.name) = "VFGowcaizer Stage"
trigger1 = Numhelper(889780) = 0 
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
Pos = 52,15
name = "FireFlair"
stateno = 889780
helpertype = normal
ownpal = 1
ID = 889780   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;----------------------------------------
;VVVVVV stage finishers VVVVVV
;----------------------------------------
[State -2, Stage Finisher Andy FF3]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Howard Arena"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889320
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger2 =p2life=0
trigger2=MatchOver
trigger2 = P2stateno !=889320
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger3 =p2life=0
trigger3=MatchOver
trigger3 = P2stateno !=889320
trigger4 = stagevar(info.name) = "VFGowcaizer Stage"
trigger4 =p2life=0
trigger4=MatchOver
trigger4 = P2stateno !=889320
value = 889320
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Green Hell]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889370
trigger2 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger2 =p2life=0
trigger2=MatchOver
trigger2 = P2stateno !=889370
value = 889370
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Deadpool MK]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "The Dead Pool"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889629
value = 889629
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Vagnad]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Vagnad Stage"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889310
value = 889310
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Capcom Building]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889755
value = 889755
ignorehitpause = 1
persistent = 0

;--------------------------------------
;Remove Explod from Slam Masters Intros
[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = stateno = 0
trigger1 = stagevar(info.name) = "Slam Masters LA" || stagevar(info.name) = "Slam Masters LA Ringout"
ID = 889775
ignorehitpause = 1


;---------------------------------------
;^^^^^^ stage finishers^^^^^^
;---------------------------------------

;-------------------------------------------------------------
;^^^^^^^ ELECTR0's IM Code ^^^^^^^^
;-------------------------------------------------------------

;#ADD004BASIC PIEs#
;//==
;// add004 supplementary sctrls v1.103
;//==

;// partner jump-out
;// ???????
[state 0]
	type=selfstate
	triggerall=!ishelper && numpartner && roundstate=2
	triggerall=(stateno!=[190190,190199]) && (alive) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	triggerall=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(22)=4)
	;;---// change ;(??)
	trigger1=(sysfvar(4)<1) && (movetype!=h) && (gethitvar(isbound)=0) && (pos y>=0) && (ctrl||(stateno<600&&time<2)) && (partner,stateno=[190191,190192]) && (playerid(floor(sysfvar(0))),var(48)=11)
	;;---// as partner-asist ;(??)
	trigger2=(sysfvar(4)>0) && (movetype!=h||(stateno=[120,149])) && (ctrl||(stateno<600&&stateno!=playerid(floor(sysfvar(0))),var(56-numhelper(90900))))
	;;---// player priority ;(??)
	trigger3=(sysfvar(4)<1) && (partner,sysfvar(4)<1) && (partner,alive) && (playerid(floor(sysfvar(0))),var(15)!=id)
	value=190190
	ctrl=0
	ignorehitpause=1

;// edited life & power bar
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id)
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=0
	size.height=0 ;; 1;; <<-powerbar off mode
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	;---
	pos=0,88888

;//---
;// input players id
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=helper(90900),id
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=partner,sysfvar(0))
	sysfvar(0)=partner,sysfvar(0)

;// bk/jd system helper set
[state 0]
	type=helper
	triggerall=!ishelper && numhelper(90900) && !numhelper(99997)
	triggerall=(helper(90900),var(0)=90900) && (helper(90900),var(22)=[2,3])
	triggerall=((stateno=0)||(stateno=[10,12])||(stateno=[20,21])||(stateno=40)||(stateno=50)||(stateno=120)||(stateno=140)) && ctrl
	trigger1=((helper(90900),var(22)=2)&&(command="holdfwd")) || ((helper(90900),var(22)=3)&&(command="holdback"))
	trigger2=(helper(90900),var(51)>0) && random<(roundno+matchno+(helper(90900),var(51)))*10
	id=99997
	stateno=99997
	helpertype=normal
	keyctrl=0
	ownpal=0
	size.ground.front=8888
	size.height=2+(helper(90900),var(22)=3) ;;<-type
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
;//--- bk/jd succeeded!
[state 0]
	type=changestate
	trigger1=!ishelper && numhelper(99997) && stateno!=195500 && ctrl
	trigger1=(helper(99997),stateno=99996) && (helper(99997),time=0)
	value=195500
	ctrl=0
	ignorehitpause=1
;//--- muteki
[state 0]
	type=hitby
	trigger1=!ishelper && numhelper(99997)
	trigger1=(helper(99997),stateno=[99996,99997])
	value=sca,nt,st,ht
	time=1
	ignorehitpause=1


;//==
;;>>@Config.Camera>>
;; change camera / ????
[state 0]
	type=screenbound
	trigger1=(!ishelper) && (sysfvar(0)>id) && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==
;;--- optional settings
;;--- guard crush ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(36)>=40)
	time=2
	add=200,0,0
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(36)>=50)
	value=190010
	ignorehitpause=1
;;--- dizzy ; ??
[state 0]
	type=changestate
	trigger1=(stateno=5120) && (animtime=0) && !ishelper && numhelper(403000) ;;<-dizzy_birds
	value=190116 ;;<- goto dizzy/stun state
;;--- fadeout when KOed ; KO????
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && (((time=[80,150]) && time%10<5) || time>150)
	trigger1=partner,stateno!=stateno || (partner,stateno=stateno && partner,time<time)
	flag=invisible
	flag2=noshadow
[state 0]
	type=posset
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner
	trigger1=partner,stateno!=stateno || (partner,stateno=stateno && partner,time<time)
	y=(800-partner,pos y) *(((time=[80,150]) && time%10<5) || time>150)


;//==
;//==

[State -2, Finish]
type = ScreenBound
triggerall = (Life <= 0) || (!Alive) || (Lose)
trigger1 = (StateNo = 5150) && (RoundState = 4)
value = 0
MoveCamera = 0,0
IgnoreHitPause = 1

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(11) < 0
var(11) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(11) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(12) = 8010 || var(12) = 8011 || var(12) = 8012 || var(12) = 8013 || var(12) = 8014 || var(12) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(13) = 8000 || var(13) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(13), var(12))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(19)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(19) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(11) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 11
last = 15
value = -1
ignoreHitPause = 1

[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
var(38) = 0
[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20)
trigger4 = (enemynear, stateno = [5020, 5040]) && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, Original Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1
[State -2, Original Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy
fvar(10) = ifelse(enemynear, gethitvar(hitcount) < 3, 24, ifelse(enemynear, gethitvar(hitcount) >= 24, 2, 26 - enemynear, gethitvar(hitcount))) / 24.0
ignorehitpause = 1
[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy && var(20)
fvar(10) = 0.72 * (10 -ifelse(enemynear, gethitvar(hitcount) >= 9, 9, enemynear, gethitvar(hitcount))) / 10.0
ignorehitpause = 1
[State -2, CC Limiter]
type = varset
trigger1 = numenemy && var(20)
trigger1 = (stateno = 225 && anim = 226)
fvar(10) = ifelse((enemynear, gethitvar(hitcount) >= 1), 0.072, 0.72)
ignorehitpause = 1
[State -2, attackvarbyhitsreset]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H)
trigger2 = !numenemy
fvar(10) = ifelse(var(20), 0.72, 1)
ignorehitpause = 1

[State -2, dampenervar]
type = varset
trigger1 = 1
fvar(12) = fvar(10) + (var(29) * 0.2)
ignorehitpause = 1
[State -2, dampener]
type = attackmulset
trigger1 = 1
value = fvar(12)
ignorehitpause = 1

[State -2, Free Juggling]
type = assertspecial
trigger1 = var(20) > 0
trigger2 = roundstate != 2
flag = nojugglecheck
ignorehitpause = 1
[State -2, Original Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1
[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

[State -2, Dizzy sound]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5300, 0
channel = 0

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Damage = %f "
params = AIlevel, fvar(12)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause = 1

;==
;FACING SETTING ; -------------------------------------------------------------
;varset for P1 and P2
[State -2, Var0 set]
type = VarSet
trigger1 = RoundState < 2
trigger1 = facing = 1
v = 38
value = 1

[State -2, Var0 set]
type = VarSet
trigger1 = RoundState < 2
trigger1 = facing = -1
v = 38
value = 2

;varset for LEFT and RIGHT
[State -2, var]
type = VarSet
trigger1 = facing = 1
var(39) = 1
;varset
[State -2, var]
type = VarSet
trigger1 = facing = -1
var(39) = 2

;Light
[State -2]
type = Helper
triggerall = !NumHelper(23680) 
trigger1 = StageVar(info.author) = "light"
pos = 0,0
stateno = 23680
id = 23680
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = p1

[State -2]
type = Helper
triggerall = !NumHelper(23681) 
trigger1 = StageVar(info.author) = "light"
pos = 134,0
stateno = 23681
id = 23681
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = left

[State -2]
type = Helper
triggerall = !NumHelper(23682)
trigger1 = StageVar(info.author) = "light"
pos = -134,0
stateno = 23682
id = 23682
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = right
;--------------------------------------------------------------
;1aD§3oE?I?OA
;--------------------------------------------------------------
[Statedef 23680]
type = S
movetype= H
physics = N
velset = 0,0
sprpriority = -10

[State 3680, 4]
type = changeanim
trigger1 = time%2 = 0
value = 9741

[State 3680, 4]
type = ChangeAnim
triggerall = time%2 = 1
trigger1 = ((root,anim = [0,9741]) && root,movetype != H) 
trigger2 = (root,anim = [5000,9999])
value = root,anim
elem = root,animelemno(0)
ignorehitpause = 1
persistent = 1

[State 3680, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 224,88,0
sinadd = 48,50,32,16
;add = 248,232,192

[State 3680,0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3680, 4]
type=BindToParent
trigger1 = 1
time = -1
facing = 1
pos = (1+ifelse(Parent,fvar(36) = 1,-1,0)+ifelse(Parent,fvar(36) = 2,-2,0))*ifelse(Facing = -1,-1,1),0
;--------------------------------------------------------------
;1aD§×o
;--------------------------------------------------------------
[Statedef 23681]
type = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0 && RootDist X < 52
fvar(40) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0
fvar(40) = 0

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA
;--------------------------------------------------------------
;1aD§OO
;--------------------------------------------------------------
[Statedef 23682]
type = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0 && RootDist X > 52
fvar(40) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0
fvar(40) = 2

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA
;===
;===< -3 STATES >=
;===
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = (stateno = 50 || stateno = 1106) && var(9) = 3
trigger2 = stateno = [710, 725]
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, ExFX]
type = varadd
trigger1 = var(25) > 0
var(25) = -1

[State -3, ExFX]
type = varset
trigger1 = (stateno != [1000, 2999]) || movetype = H
var(25) = 0

[State -3, Ex Flash]
type = palfx
trigger1 = !(gametime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignorehitpause = 1

[State -3, Lv1 Shadows]
type = afterimage
trigger1 = stateno = 3000 && anim = 3000 && animelemtime(1) = 3
trigger2 = stateno = 3050 && animelemtime(1) = 1
time = 2
timegap = 1
framegap = 10
length = 21
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv2 Shadows]
type = afterimage
trigger1 = stateno = 3100 && animelem = 2
trigger2 = stateno = 3010 && anim = 3010 && animelemtime(1) = 3
trigger3 = stateno = 3060 && animelemtime(1) = 1
time = 2
timegap = 1
framegap = 10
length = 21
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv3 Shadows]
type = afterimage
trigger1 = stateno = 4000 && animelem = 3
trigger2 = stateno = 3200 && animelem = 3
trigger3 = stateno = 3300 && animelem = 3
time = 2
timegap = 1
framegap = 10
length = 21
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = (stateno = 50 || stateno = 1106) && var(9) = 3 && vel y < -1
trigger2 = var(20)
trigger3 = (stateno = [1000, 2999]) && var(10) = 4
trigger4 = (stateno = [3000, 4999])
trigger5 = (stateno = [710, 725])
trigger6 = stateno = 182 && anim = 182
time = 2

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = (statetype = S || statetype = C) && numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, Prevent Crossup]
type = width
trigger1 = movetype != H
edge = 8, 0
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A && movetype != H && numenemy = 1
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)) , 0]
trigger1 = p2statetype = S
trigger1 = p2dist y >= (enemynear, const(size.height) - 36)
trigger2 = p2statetype = C
trigger2 = p2dist y >= (enemynear, const(size.height) - 56)
trigger3 = p2statetype = L
trigger3 = p2dist y >= 12
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < (250 * (AIlevel ** 2 / 64.0))
value = 5000, 1 + (random % 4)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, 1 + (random % 4)
channel = 0
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = prevstateno = 700
trigger1 = stateno = 0 && time < 7
flag = nowalk

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = var(20) && !numhelper(7600)
trigger1 = movehit = [1, 4]
trigger2 = stateno = 805 && (animelemtime(3) = [0, 1])
trigger3 = stateno = 810
trigger4 = stateno = 811 && (animelemtime(2) = [0, 1])
trigger5 = stateno = 856 && time <= 1
trigger6 = stateno = 1321 && time <= 1
helpertype = normal
stateno = 8600
ID = 8600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := stateno
trigger2 = StateNo = [3000,3049]
trigger2 = var(23) := 3000
trigger3 = StateNo = [3050,3060]
trigger3 = var(23) := 3050
trigger4 = StateNo = [3100,3199]
trigger4 = var(23) := 3100
trigger5 = StateNo = [3200,3299]
trigger5 = var(23) := 3200
trigger6 = StateNo = [3300,3399]
trigger6 = var(23) := 3300
trigger7 = stateno = 4001 && numtarget && animelemtime(12) >= 0
trigger7 = var(23) := 4000
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
