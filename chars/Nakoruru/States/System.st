; ADD004 BASIC PIEs ReBuilded CNS (27/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

;___________________________________
;| Nakoruru by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< SYSTEM STATES >====
;==

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
trigger1 = (anim != [0, 1]) && anim != 5
trigger2 = anim = 5 && !animtime
value = ifelse((palno = 5 || palno = 10 || palno = 11), 1, 0)

[State 0, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
trigger1 = prevstateno = 0 || (prevstateno = [190, 194]) || prevstateno = 5900 || (prevstateno = [6900, 6901])
helpertype = normal
stateno = 10000
ID = 10000
name = "Mamahaha"
postype = p1
pos = 0, -144
ownpal = 1

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


;====< JUMPING >====
[Statedef 40]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 40, direction]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, highjump]
type = varset
trigger1 = !time && !AIlevel
var(3) = ifelse(command = "highjump", 3, 0)
[State 40, highjump]
type = varset
trigger1 = !time && AIlevel
var(3) = ifelse((p2bodydist x >= 160 || random < (125 * (AIlevel ** 2 / 64.0))), 3, 0)
[State 40, highjump]
type = varset
trigger1 = !time && prevstateno = 100
var(3) = 3

[State 40, lowjump]
type = varset
trigger1 = !AIlevel && command != "holdup" && (var(3) != [1, 2])
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)
[State 40, lowjump]
type = varset
trigger1 = AIlevel && (var(3) != [1, 2])
trigger1 = (enemynear, statetype = C) && random < 500
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = 0, ifelse((var(3) = [2, 3]), 41, 40)
[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, vel normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, vel short]
type = velset
trigger1 = !animtime && var(3) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, vel medium]
type = velset
trigger1 = !animtime && var(3) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, vel long]
type = velset
trigger1 = !animtime && var(3) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1


[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x, 41, ifelse(vel x > 0, 42, 43)) + 10 * (var(3) = [1, 2])
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(3) = [1, 2]
flag = noairguard

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1
[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1
[State 51, Accel]
type = gravity
trigger1 = 1
[State 51, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 52, anim 57]
type = changeanim
trigger1 = !time && (var(3) = 1 || var(3) = 2)
trigger1 = (prevstateno = [600, 699])
value = 57

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Ctrl]
type = ctrlset
trigger1 = !time && (prevstateno != [600, 699])
trigger2 = time = 1 && anim != 57
value = 1
[State 52, Guard]
type = changestate
trigger1 = ctrl && command = "holdback"
trigger1 = inguarddist && (prevstateno != [600, 699])
value = 120

[State 52, No Walk]
type = assertspecial
trigger1 = anim != 5
flag = nowalk

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 52, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, Turn]
type = changeanim
trigger1 = ctrl && p2dist x < 0
trigger1 = anim != 5
value = 5
[State 52, Turn]
type = turn
trigger1 = anim = 5 && animelem = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< WALL JUMP >====
[Statedef 60]
type = A
physics = N
movetype = I
anim = 60
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 60, Turn]
type = turn
trigger1 = !time
trigger1 = frontedgebodydist < backedgebodydist
[State 60, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 60, direction]
type = varset
trigger1 = 1
sysvar(1) = 1
[State 60, highjump]
type = varset
trigger1 = 1
var(3) = 0

[State 60, Snd]
type = playsnd
trigger1 = !animtime
value = 0, 40

[State 60, vel normal]
type = velset
trigger1 = !animtime
x = 4.625
y = const(velocity.jump.y)

[State 60, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1


;====< HIGH JUMP CANCEL >====
[Statedef 70]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 70, direction]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 70, direction]
type = varset
trigger1 = AIlevel
sysvar(1) = 1

[State 70, juggle]
type = varset
trigger1 = 1
var(14) = 0
[State 70, highjump]
type = varset
trigger1 = 1
var(3) = 3

[State 70, Snd]
type = playsnd
trigger1 = !animtime
value = 0, 41
[State 70, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 70, vel long]
type = velset
trigger1 = !animtime && var(3) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 70, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1


;==< RUN >===
[Statedef 100]
type = S
physics = N
movetype = I
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, step]
type = playsnd
trigger1 = (animelem = 2 || animelem = 4)
value = 0, ifelse((animelem = 2), 103, 106)

[State 100, jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40
[State 100, jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = changestate
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && p2bodydist x <= 90
value = 101


;--- STOP ---
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 0, 101
[State 101, Dust]
type = explod
trigger1 = !time
anim = 8103
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40
[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


;==< DASH >===
[Statedef 102]
type = S
physics = N
movetype = I
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = 8.25

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 0, 102
[State 102, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 102, run]
type = varset
trigger1 = !time
sysvar(1) = 1
[State 102, run]
type = varset
triggerall = time <= 7
trigger1 = !AIlevel && command != "holdfwd"
sysvar(1) = 0
[State 102, run]
type = changestate
trigger1 = time = 7 && sysvar(1)
value = 100

[State 102, End]
type = changestate
trigger1 = time >= 14
value = 103


;--- STOP ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 0, 103
[State 103, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< BACK DASH >==
[Statedef 105]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 105, Dust]
type = explod
trigger1 = animelemtime(2) = -1
anim = 8102
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
facing = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 105, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 1.25
[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Land]
type = changestate
trigger1 = pos y > -vel y
value = 106


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Snd]
type = playsnd
trigger1 = !time
value = 0, 106
[State 106, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1
[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< DODGE >====
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 700, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 2
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 3

[State 700, Push]
type = playerpush
trigger1 = 1
value = 0
[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 211, 250)
[State 700, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && numenemy
trigger1 = (enemynear, movetype != A) && (p2bodydist x = [ -60, 60]) && (p2dist y >= -60)
value = ifelse(random < 666, 211, 250)

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< ROLL >====
;--- Forward ---
[Statedef 710]
type = S
physics = N
movetype = I
anim = 710
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
[State 710, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 2, 4)
channel = 0
[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 102

[State 710, Vel]
type = velset
trigger1 = animelem = 2
x = 5.37
[State 710, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Backward ---
[Statedef 715]
type = S
physics = N
movetype = I
anim = 715
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 715, Push]
type = playerpush
trigger1 = 1
value = 0
[State 715, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 715, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, ifelse(random < 500, 2, 4)
channel = 0
[State 715, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 102

[State 715, Vel]
type = velset
trigger1 = animelem = 2
x = -5.37
[State 715, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 715, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< POWER CHARGE >==
[Statedef 730]
type = S
physics = S
movetype = I
anim = 730
velset = 0, 0
ctrl = 0

[State 730, Power]
type = poweradd
triggerall = power < const(data.power) && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 12)

[State 730, Snd]
type = playsnd
trigger1 = !time
value = 4, 3
channel = 0
[State 730, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 730, FX]
type = helper
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 730, FX]
type = helper
trigger1 = !numhelper(8332)
helpertype = normal
stateno = 8332
ID = 8332
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, End]
type = changestate
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel && (command != "holdb" || command != "holdy")
trigger3 = AIlevel && (inguarddist || p2bodydist x <= 120)
value = 731
ctrl = 1


;--- END ---
[Statedef 731]
type = S
physics = S
movetype = I
anim = 731
velset = 0, 0
ctrl = 1
[State 731, Snd]
type = stopsnd
trigger1 = !time
channel = 0
[State 730, Snd]
type = playsnd
trigger1 = !time && power >= const(data.power)
value = 6, 1
channel = 0
persistent = 0
[State 730, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< ZERO COUNTER >====
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000
facep2 = 1

[State 750, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "counter_k")
ignorehitpause = 1
[State 750, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 0, ifelse((p2statetype = C), 1, ifelse(random < 500, 0, 1)))
ignorehitpause = 1

[State 750, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 750, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = ceil(42 * const(size.xscale)), ceil(-71 * const(size.yscale))
supermovetime = 255
ownpal = 1
[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 15
movetime = 15
p2defmul = 1
anim = -1
sound = s0, 750
darken = 0

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 2950, 2900)


;====< PARRY >====
;--- STANDING ---
[Statedef 760]
type = S
physics = S
movetype = I
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 760, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 760, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 760, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 760, No walking]
type = varset
trigger1 = 1
var(26) = 7

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0
[State 760, Snd]
type = playsnd
trigger1 = !time
value = 0, 760

[State 760, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 760, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = ceil(42 * const(size.xscale)), ceil(-71 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1
[State 760, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 761]
type = C
physics = C
movetype = I
anim = 761
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 761, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 761, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 761, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 761, No walking]
type = varset
trigger1 = 1
var(26) = 7

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0
[State 761, Snd]
type = playsnd
trigger1 = !time
value = 0, 760

[State 761, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 761, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-48 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1
[State 761, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- JUMPING ---
[Statedef 762]
type = A
physics = N
movetype = I
anim = 762
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 762, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 762, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 762, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0
[State 762, Snd]
type = playsnd
trigger1 = !time
value = 0, 760

[State 762, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 762, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = ceil(21 * const(size.xscale)), ceil(-84 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1
[State 762, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 762, End]
type = changestate
trigger1 = !animtime
value = 763
ctrl = 1

[Statedef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1
[State 763, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 763, Accel]
type = gravity
trigger1 = 1
[State 763, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


;--- HELPER ---
[Statedef 765]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 766, ifelse(root, statetype = A, 767, 765))
velset = 0, 0
ctrl = 0
[State 765, NHB]
type = nothitby
trigger1 = 1
value = SCA
[State 765, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 765, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel) && root, command = "down"
trigger2 = root, AIlevel && (root, statetype != A) && p2statetype = C
value = 766
[State 765, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel) && root, command = "fwd"
trigger2 = root, AIlevel && anim != 766
value = ifelse((root, statetype = A), 767, 765)
[State 765, Anim]
type = changeanim
trigger1 = anim = 765 || anim = 767
value = ifelse((root, statetype = A), 767, 765)

[State 765, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 7, 8)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = (root, stateno != [760, 762]) && (root, stateno != 5120)
var(0) = 1
[State 765, Disable]
type = varset
triggerall = !(root, AIlevel)
trigger1 = (root, command = "holdback")
trigger2 = time < 4 && (root, command = "holdfwd" + root, command = "holddown") > 1
trigger3 = time >= 4 && (root, command = "holdfwd" || root, command = "holddown")
trigger4 = time >= 1 && (((anim = 765 || anim = 767) && root, command = "fwd") || (anim = 766 && root, command = "down"))
var(0) = 1
[State 765, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9741

[State 765, Standing /air]
type = reversaldef
trigger1 = !var(0) && (anim = 765 || anim = 767)
reversal.attr = SCA, AA
p1stateno = 766
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, Crouching]
type = reversaldef
trigger1 = !var(0) && anim = 766
reversal.attr = SC, AA
p1stateno = 766
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr = 
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, End]
type = destroyself
trigger1 = time >= 18
trigger2 = (root, movetype != I)
trigger3 = !(root, ctrl) && (root, stateno != [760, 762]) && (root, stateno != 5120)
trigger4 = (root, stateno = [760, 762]) && (root, time <= 1)


;--- Success ---
[Statedef 766]
movetype = I
ctrl = 0
[State 766, Disable]
type = varset
trigger1 = 1
var(0) = 1
[State 766, End]
type = destroyself
trigger1 = root, stateno = [760, 762]
trigger2 = time >= 2


;====< CUSTOM COMBO >====
;--- GROUND ---
[Statedef 900]
type = S
physics = S
movetype = A
anim = 900
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 900, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38
[State 900, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 900, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 900, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 900, Snd]
type = playsnd
trigger1 = time = 4
value = 6, 1
channel = 0

[State 900, Super Pause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Original Combo Startup"
postype = p1
pos = 19, -44
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 900, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s0, 900
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 900, Shadows]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- AIR ---
[Statedef 905]
type = A
physics = N
movetype = A
anim = 905
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 905, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38
[State 905, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 905, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 905, unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 905, Snd]
type = playsnd
trigger1 = time = 4
value = 6, 1
channel = 0

[State 905, Super Pause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Original Combo Startup"
postype = p1
pos = -17, -71
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 905, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s0, 900
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 905, Shadows]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 905, End]
type = changestate
trigger1 = !animtime
value = 906
ctrl = 1


[Statedef 906]
type = A
physics = N
movetype = I
anim = 906
ctrl = 1
[State 906, Accel]
type = gravity
trigger1 = 1
[State 906, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


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
trigger1 = vel y > 0 && pos y >= 10
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
trigger1 = !time
value = 4, 2
channel = 0
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10
[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
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


;--- AIR ---
[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

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

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-66 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

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


;===< GUARD >====
;--- START ---
[Statedef 120]
type = U
physics = U
anim = 120 + (statetype = C) + (statetype = A) * 2
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
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
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
[State 120, AI fix]
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
[State 130, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype = C)
value = 131
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
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1


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
[State 131, AI fix]
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
sysvar(0) = (pos y >= 0 && vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 132, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 132, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
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
[State 140, End]
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
sysvar(0) = (pos y >= 0 && vel y > 0)
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


;====< LOSE >====
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 170, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5000, 0
channel = 0


;====< DRAW GAME >====
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0
[State 175, switch]
type = changestate
trigger1 = !time
value = 170


;====< CONTINUE? >====
[Statedef 5500]
type = S
anim = 5300
velset = 0, 0
ctrl = 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;====< INITIALIZE >====
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

[State 5900, Power]
type = powerset
trigger1 = var(47)
trigger1 = power < 3000
value = 3000
[State 5900, Power]
type = varset
trigger1 = 1
var(47) = 0

[State 5900, Intro VS Morrigan]
type = changestate
triggerall = numenemy
triggerall = roundno = 1 || (!(enemy, roundsexisted) && !(teammode = simul) && !(enemy, teammode = simul))
trigger1 = enemy, name = "Morrigan Aensland" || enemy, name = "Morrigan" || enemy, name = "cvsmorrigan"
trigger2 = enemy, name = "Gustavo" && enemy, authorname = "Andres Borghi"
trigger3 = enemy, name = "Rera"
value = 6910

[State 5900, Intro VS Evil Chars]
type = changestate
triggerall = numenemy
triggerall = roundno = 1 || (!(enemy, roundsexisted) && !(teammode = simul) && !(enemy, teammode = simul))
trigger1 = enemy, name = "Apocalypse"
trigger2 = enemy, name = "Broli" || enemy, name = "[Necromancer's] Broli"
trigger3 = enemy, name = "Buu" || enemy, name = "Super Boo"
trigger4 = enemy, name = "Cell"
trigger5 = enemy, name = "Dr. Doom"
trigger6 = enemy, name = "Frieza"
trigger7 = enemy, name = "Gill"
trigger8 = enemy, name = "Igniz" || enemy, name = "Igniz By Third"
trigger9 = enemy, name = "Jedah"
trigger10 = enemy, name = "Justice"
trigger11 = enemy, name = "Kouryu" || enemy, name = "Kouryu By Third"
trigger12 = enemy, name = "Magneto" || enemy, name = "Magneto(MC2)"
trigger13 = (enemy, name = "M.Bison" && enemy, authorname = "N -Mario") || enemy, name = "[Necromancer's] M. Bison" || (enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous")
trigger14 = enemy, name = "Onslaught"
trigger15 = enemy, name = "Orochi"
trigger16 = enemy, name = "Pyron"
trigger17 = enemy, name = "Thanos"
trigger18 = (enemy, name = "Vega" && enemy, authorname = "Froz") || enemy, name = "cvsvega" || enemy, name = "svcvega"
value = 6911

[State 5900, turnsintro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5900, intro]
type = changestate
trigger1 = roundno = 1
value = 190 + (random % 4)
[State 5900, End]
type = changestate
trigger1 = 1
value = 0


;====< INTRO 1 >====
[Statedef 190]
type = S
physics = S
anim = 190
[State 190, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 190, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10030
ID = 10000
name = "Mamahaha"
postype = p1
ownpal = 1

[State 190, Snd]
type = playsnd
trigger1 = animelem = 3
value = 6, 3
channel = 0
[State 190, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO 2 >====
[Statedef 191]
type = S
physics = S
anim = 191
[State 190, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10000
ID = 10000
name = "Mamahaha"
postype = p1
pos = 0, -144
ownpal = 1

[State 191, Manari]
type = helper
trigger1 = !time
trigger1 = !numhelper(6100)
helpertype = normal
stateno = 6100
ID = 6100
name = "Manari"
postype = p1
pos = -30, 0
ownpal = 1

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO 3 >====
[Statedef 192]
type = S
physics = S
anim = 192
[State 192, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10035
ID = 10000
name = "Mamahaha"
postype = p1
ownpal = 1

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO 4 >====
[Statedef 193]
type = S
physics = S
anim = 193
[State 193, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 193, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10005
ID = 10000
name = "Mamahaha"
postype = back
pos = -320, -304
ownpal = 1

[State 193, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5000, 0
channel = 0
[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;====< TURNS INTRO >====
[Statedef 6900]
type = A
anim = 6900
velset = 0, 0
ctrl = 0
[State 6900, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, bound]
type = screenbound
trigger1 = 1
value = 0
[State 6900, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6900, Pos]
type = posset
trigger1 = !time
x = (-320 + abs(pos x)) * facing

[State 6900, Vel]
type = velset
trigger1 = !time
x = (helper(8999), rootdist x) / -40.0
y = -10.25
[State 6900, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 6900, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10005
ID = 10000
name = "Mamahaha"
postype = back
pos = -320, -304
ownpal = 1

[State 6900, End]
type = changestate
trigger1 = time
trigger1 = pos y > -vel y
value = 6901


;--- LAND ---
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0, 0
[State 6901, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6901, Pos]
type = posset
trigger1 = !time && numhelper(8999)
x = ceil(helper(8999), pos x)

[State 6901, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 6901, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO vs MORRIGAN >====
[Statedef 6910]
type = S
physics = S
anim = 6910
[State 6910, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6910, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10005
ID = 10000
name = "Mamahaha"
postype = p1
pos = 0, -144
ownpal = 1

[State 6910, Snd]
type = playsnd
trigger1 = animelem = 15
value = 5000, 0
channel = 0

[State 6910, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO vs EVIL CHARS >====
[Statedef 6911]
type = S
physics = S
anim = 6911
[State 6911, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6911, Mamahaha]
type = helper
trigger1 = !numhelper(10000)
helpertype = normal
stateno = 10005
ID = 10000
name = "Mamahaha"
postype = p1
pos = -200, -244
ownpal = 1

[State 6911, Snd]
type = playsnd
trigger1 = animelem = 5
value = 6, 4
channel = 0

[State 6911, End]
type = changestate
trigger1 = !animtime
value = 0


;====< WIN POSE DECIDER >====
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = 1 + (random % 6)

[State 180, Win]
type = changestate
trigger1 = prevstateno = 4131
value = 4131

[State 180, win]
type = changestate
trigger1 = command = "holdy" || command = "holdz"
value = ifelse(command = "holdz", 182, 183)
[State 180, win]
type = changestate
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = ifelse(command = "holdc", 184, ifelse(command = "holdc", 185, 186))

[State 180, win]
type = changestate
trigger1 = random < 167 || command = "holdx"
trigger1 = numhelper(10000)
trigger1 = helper(10000), stateno = 10000 && helper(10000), pos y <= -120
value = 181

[State 180, win]
type = changestate
trigger1 = 1
value = 182 + (random % 5)


;====< WIN 1 >====
[Statedef 181]
type = S
physics = S
anim = 181
ctrl = 0
[State 181, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 181, Snd]
type = playsnd
trigger1 = animelem = 8
value = 6, 0
channel = 0


;====< WIN 2 >====
[Statedef 182]
type = S
physics = S
anim = 182
ctrl = 0
[State 182, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 182, Snd]
type = playsnd
trigger1 = animelem = 4
value = 6, 1
channel = 0


;====< WIN 3 >====
[Statedef 183]
type = S
physics = S
anim = 183
ctrl = 0
[State 183, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Snd]
type = playsnd
trigger1 = animelem = 4
value = 7, 2
channel = 0


;====< WIN 4 >====
[Statedef 184]
type = S
physics = S
anim = 184
ctrl = 0
[State 184, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 184, Turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 184, Manari]
type = helper
trigger1 = !time
trigger1 = !numhelper(6100)
helpertype = normal
stateno = 6110
ID = 6100
name = "Manari"
postype = front
pos = 60, 0
ownpal = 1

[State 184, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0
value = 184
elem = 1
[State 184, Anim]
type = changeanim
trigger1 = numhelper(6100)
trigger1 = animelemtime(2) < 0
trigger1 = helper(6100), stateno = 6111
value = 184
elem = 2


;====< WIN 5 >====
[Statedef 185]
type = S
physics = S
anim = 185
ctrl = 0
[State 185, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 185, Blade]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6090
ID = 6090
name = "Blade"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 185, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 7
channel = 1
[State 185, Snd]
type = playsnd
trigger1 = animelem = 19
value = 4, 0
channel = 0


;====< WIN 6 >====
[Statedef 186]
type = S
physics = S
anim = 186
ctrl = 0
[State 186, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 186, Snd]
type = playsnd
trigger1 = animelem = 7
value = 7, 3

[State 186, particles]
type = explod
trigger1 = !(animelemtime(7) % 2)
trigger1 = animelemtime(7) >= 0 && animelemtime(7) < 16
anim = 8161
ID = 8161
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
pos = ceil(11 + (1.6875 * animelemtime(7))), ceil(-83 + (0.8125 * animelemtime(7)))
random = 16, 16
vel = (random / 1000.0), -2 -(random / 500.0)
accel = 0, 0.25
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1


;====< TAUNT >====
[Statedef 195]
type = S
physics = S
movetype = I
anim = 195
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 195, Snd]
type = playsnd
trigger1 = animelem = 2
value = 6, 2
channel = 0
[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< TAUNT >====
[Statedef 196]
type = S
physics = S
movetype = I
anim = 196
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 196, Snd]
type = playsnd
trigger1 = animelem = 5
value = 6, 4
channel = 0
[State 196, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< S.D. TAUNT >====
[Statedef 197]
type = S
physics = S
movetype = I
anim = 197
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 197, Snd]
type = playsnd
trigger1 = !time || time = 72
value = 7, 9
channel = 1
[State 197, Dust]
type = explod
trigger1 = !time || time = 72
anim = 6200
sprpriority = 2
postype = p1
scale = 1, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 197, End]
type = changestate
trigger1 = time >= 72
value = 0
ctrl = 1


;==< CHEAP K.O. >==
[Statedef 5950]
type = S
movetype = H
physics = S
anim = 5950
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA
[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, KO snd]
type = assertspecial
trigger1 = 1
flag = nokosnd
[State 5950, KO snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0
[State 5950, KO snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 11, 1

[State 5950, Snd]
type = playsnd
trigger1 = animelem = 7
value = 0, 5100
[State 5950, Dust]
type = explod
trigger1 = animelem = 7
anim = 8105
sprpriority = -3
postype = p1
pos = -8, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;====< AIR HIT TRANSITION >====
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5035)
trigger1 = anim = [5000, 5029]
value = 5035

[State 5035, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5035, Recover]
type = changestate
triggerall = !hitfall
trigger1 = hitover
trigger2 = !animtime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !time
trigger4 = anim != 5035
value = 5040

[State 5035, fall]
type = changestate
triggerall = hitfall
trigger1 = hitover
trigger2 = !animtime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !time
trigger4 = anim != 5035
value = 5050


;====< LIE DEAD >====
[Statedef 5150]
type = L
physics = N
movetype = H
sprpriority = -3

[State 5150, Anim]
type = changeanim
triggerall = !time
triggerall = selfanimexist(5140)
trigger1 = (anim != [5111, 5119]) && (anim != [5171, 5179])
trigger2 = !selfanimexist(5140 + (anim % 10))
value = 5140

[State 5150, Anim]
type = changeanim
triggerall = !time
trigger1 = (anim = [5111, 5119]) || (anim = [5171, 5179])
trigger1 = selfanimexist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = matchover
trigger1 = anim = [5140, 5149]
trigger1 = selfanimexist(anim + 10)
value = anim + 10

[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != [5140, 5159]
trigger1 = anim != [5110, 5119]
value = 5110

[State 5150, suicide]
type = changeanim
trigger1 = !time
trigger1 = prevstateno = 4000 && var(47)
value = 9741

[State 5150, Vel]
type = velmul
trigger1 = 1
x = 0.85
[State 5150, Vel]
type = velset
trigger1 = abs(vel x) < 0.05
x = 0

[State 5150, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA


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



[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(36) < 0
var(36) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(36) = hitpausetime
trigger1 = movehit = 1 && var(34) >= 0
value = 2, var(34)
channel = 2
ignorehitpause = 1
[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(36) = hitpausetime
trigger1 = movehit = 1 && var(34) = 800
value = 0, 800
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = movecontact = 1 && var(36) = hitpausetime
trigger1 = moveguarded = 1 && var(35) >= 0
value = 3, var(35)
channel = 2
ignorehitpause = 1
[State -2, GuardSound]
type = playsnd
triggerall = movecontact = 1 && var(36) = hitpausetime
triggerall = moveguarded = 1 && var(35) >= 0
trigger1 = stateno = 210 || stateno = 211 || stateno = 220 || stateno = 221
trigger2 = stateno = 410 || stateno = 420 || stateno = 425
trigger3 = stateno = 610 || stateno = 620 || stateno = 660 || stateno = 670 || stateno = 680
trigger4 = stateno = 1000 || stateno = 1020 || stateno = 1100 || stateno = 1120 || stateno = 1550 || stateno = 1560
trigger5 = stateno = 3010
value = 7, 4
freqmul = 0.9 + (random / 5000.0)
ignorehitpause = 1

[State -2, Sparks]
type = helper
triggerall = movecontact = 1 && var(36) = hitpausetime
trigger1 = movehit = 1 && numenemy
trigger1 = var(30) = 8010 || var(30) = 8011 || var(30) = 8012 || var(30) = 8013 || var(30) = 8014 || var(30) = 8001
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(31) = 8000 || var(31) = 8001
stateno = ifelse(moveguarded, var(31), var(30))
ID = 8000
name = "Spark"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
facing = -1
ownpal = 1
;size.xscale = 0.5
;size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Sparks]
type = helper
triggerall = movecontact = 1 && var(36) = hitpausetime ;&& !fvar(25)
trigger1 = movehit = 1 && numenemy
trigger1 = var(30) = 8015 || var(30) = 8016 || var(30) = 8017 || var(30) = 8018 || var(30) = 8019
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(31) = 8000 || var(31) = 8001
helpertype = normal
stateno = ifelse(moveguarded, var(31), var(30))
ID = 8000
name = "Spark"
postype = p1
pos = ifelse(p2dist x < 0, 0, ifelse(p2dist x < var(32), ceil(p2dist x), var(32))), var(33)
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Counter FX]
type = Helper
triggerAll = MoveHit = 1 && var(36) = HitPauseTime
triggerAll = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(32), ceil(P2Dist x), var(32))) * const(size.xScale)), ceil(var(33) * const(size.yScale))
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(9) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Hit Detection]
type = varset
trigger1 = 1
var(36) = -1
[State -2, Hit Detection]
type = varrangeset
trigger1 = movetype = I 
trigger2 = movetype = H && time
first = 30
last = 36
value = -1
ignorehitpause = 1

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

[State -2, Prevent Guard]
type = assertspecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) -1)
flag = unguardable
ignorehitpause = 1

[State -2, Hitcount]
type = varadd
trigger1 = movehit = 1
trigger1 = !(hitdefattr = SCA, AT)
var(13) = 1
[State -2, Hitcount Reset]
type = varset
trigger1 = numenemy && var(13)
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)
var(13) = 0
ignorehitpause = 1

[State -2, Juggle Count]
type = varadd
trigger1 = movehit = 1
trigger1 = !(hitdefattr = SCA, AT)
var(14) = 1
[State -2, Juggle Reset Single]
type = varset
triggerall = numenemy = 1 && var(14)
trigger1 = (enemy, statetype != A) && (enemy, stateno != [5100, 5109]) && (enemy, time >= 1)
trigger2 = (enemy, movetype != H) || (enemy, stateno = [120, 155]) || (enemy, ctrl)
var(14) = 0
ignorehitpause = 1
[State -2, Juggle Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(14)
trigger1 = (enemynear(0), statetype != A) && (enemynear(0), time >= 1)
trigger2 = (enemynear(0), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl)
trigger3 = (enemynear(1), statetype != A) && (enemynear(0), time >= 1)
trigger4 = (enemynear(1), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl)
var(14) = 0
ignorehitpause = 1
[State -2, Free Juggling]
type = varset
trigger1 = roundstate != 2
var(14) = 0
ignorehitpause = 1

[State -2, Juggle Flag]
type = varset
trigger1 = numenemy && !var(27)
trigger1 = (enemynear, stateno = 5040) && !(enemynear, ctrl)
var(27) = 1
ignorehitpause = 1
[State -2, Juggle Flag Reset Single]
type = varset
triggerall = numenemy = 1 && var(27)
trigger1 = (enemy, movetype != H) && (enemy, stateno != 5040)
trigger2 = !(enemy, hitshakeover) || (enemy, ctrl)
var(27) = 0
ignorehitpause = 1
[State -2, Juggle Flag Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(27)
trigger1 = (enemynear(0), movetype != H) && (enemynear(0), stateno != 5040)
trigger2 = !(enemynear(0), hitshakeover) || (enemynear(0), ctrl)
trigger3 = (enemynear(1), movetype != H) && (enemynear(1), stateno != 5040)
trigger4 = !(enemynear(1), hitshakeover) || (enemynear(1), ctrl)
var(27) = 0
ignorehitpause = 1

[State -2, Free Super Juggling]
type = varset
trigger1 = var(28)
trigger1 = (stateno != [3000, 4999]) || movetype = H
var(28) = 0
ignorehitpause = 1

[State -2, Super Level Reset]
type = varset
triggerall = var(15)
triggerall = (stateno != [3000, 4999]) || movetype = H
trigger1 = !numhelper(10000)
trigger2 = numhelper(10000)
trigger2 = (helper(10000), stateno != [10400, 10411]) && (helper(10000), stateno != [10600, 10699])
var(15) = 0
ignorehitpause = 1
[State -2, Super Count Reset]
type = varset
triggerall = var(16) && numenemy
triggerall = (stateno != [3000, 4999]) || movetype = H
triggerall = (enemynear, movetype != H || enemynear, statetype = L) && (enemynear, stateno != [120, 155])
trigger1 = !numhelper(10000)
trigger2 = numhelper(10000)
trigger2 = (helper(10000), stateno != [10400, 10411]) && (helper(10000), stateno != [10600, 10699])
var(16) = 0
ignorehitpause = 1

[State -2, Custom Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
trigger4 = (stateno = [3000, 4999])
var(20) = 0
ignorehitpause = 1

[State -2, Custom Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Custom Combo Asserts]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

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

[State -2, Dampener]
type = varset
trigger1 = 1
fvar(10) = ifelse(var(13) < 6, 24, ifelse(var(13) >= 23, 1, 29 -var(13))) / 24.0 
ignorehitpause = 1
[State -2, Dampener - Custom Combo]
type = varset
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifelse(var(13) >= 10, 10, var(13))) / 10.0
ignorehitpause = 1
[State -2, Dampener - Custom Combo Limiter]
type = varset
trigger1 = var(20) 
trigger1 = stateno = 425
fvar(10) = ifelse(var(13), 0, 0.72)
ignorehitpause = 1
[State -2, Dampener Supers]
type = varset
trigger1 = (stateno = [3000, 4999]) && var(16)
fvar(10) = ifelse(var(28), 0.8, 1.0 / var(16))
ignorehitpause = 1
[State -2, Dampener Limit]
type = varset
trigger1 = fvar(10) < 0
fvar(10) = 0
ignorehitpause = 1
[State -2, Root Dampener]
type = varset
trigger1 = 1
fvar(11) = fvar(10) * ifelse(var(9), 1.2, 1)
ignorehitpause = 1

[State -2, Mamahaha X]
type = varset
trigger1 = numhelper(10000)
fvar(1) = helper(10000), pos x
ignorehitpause = 1
[State -2, Mamahaha Y]
type = varset
trigger1 = numhelper(10000)
fvar(2) = helper(10000), pos y
ignorehitpause = 1

[State -2, Mamahaha]
type = helper
trigger1 = roundstate >= 2
trigger1 = !numhelper(10000)
trigger1 = stateno || time
helpertype = normal
stateno = 10000
ID = 10000
name = "Mamahaha"
postype = back
pos = -80, -240
ownpal = 1

[State -2, SD snd]
type = playsnd
trigger1 = time = 1
trigger1 = movetype = H && prevstateno = 197
value = 7, 9
channel = 1
[State -2, SD dust]
type = explod
trigger1 = time = 1
trigger1 = movetype = H && prevstateno = 197
anim = 6200
sprpriority = 2
postype = p1
pos = 0, -ceil(pos y)
scale = 1, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Juggle = %d"
params = AIlevel, fvar(11), var(13), var(14)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause = 1


;===
;===< -3 STATES >=
;===
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, ProjContact Reset]
type = varset
triggerall = var(18)
trigger1 = (stateno != [1300, 1320]) && (stateno != [1400, 1420]) && stateno != [3100, 3150]
trigger2 = (stateno = 1300 || stateno = 1320) && animelemtime(5) < 0
var(18) = 0

[State -3, Chain Reset]
type = varset
trigger1 = 1
var(6) = 0
ignorehitpause = 1
[State -3, Chain Check]
type = varset
trigger1 = var(20) && (stateno = [200, 659]) && movecontact
trigger2 = var(20) && (stateno = [1000, 2999]) && statetype != A && (movecontact || var(18))
var(6) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = varset
trigger1 = 1
var(7) = 0
ignorehitpause = 1
[State -3, Cancel Check]
type = varset
trigger1 = var(20) && (stateno = [200, 659])
trigger2 = var(20) && (stateno = [1000, 2999]) && (movecontact || var(18))
trigger3 = (stateno = [200, 659]) && time <= 2
trigger4 = stateno = 200
trigger5 = stateno = 201
trigger6 = stateno = 210 && (animelemtime(6) < 0 || (animelemtime(7) < 0 && movecontact = 1))
trigger7 = stateno = 211 && (animelemtime(5) < 0 || (animelemtime(6) < 0 && movecontact = 1))
trigger8 = stateno = 221 && (animelemtime(5) < 0 || (animelemtime(7) < 0 && movecontact = 1))
trigger9 = stateno = 230 && animelemtime(4) < 0
trigger10 = stateno = 231 && animelemtime(4) < 0
trigger11 = stateno = 241 && animelemtime(4) < 0
trigger12 = stateno = 400
trigger13 = stateno = 410 && (animelemtime(5) < 0 || (animelemtime(6) < 0 && movecontact = 1))
trigger14 = stateno = 420 && (animelemtime(4) < 0 || (animelemtime(6) < 0 && movecontact = 1))
trigger15 = stateno = 430
var(7) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = 1
var(8) = 0
ignorehitpause = 1
[State -3, Super Cancel Check]
type = varset
trigger1 = var(20) && (stateno = [200, 699])
trigger2 = var(20) && (stateno = [1000, 2999]) && (movecontact || var(18))
trigger3 = (stateno = [200, 699]) && time <= 2
trigger4 = stateno = 200
trigger5 = stateno = 201
trigger6 = stateno = 210 && (animelemtime(6) < 0 || (movecontact = [1, 8]))
trigger7 = stateno = 211 && (animelemtime(5) < 0 || (movecontact = [1, 8]))
trigger8 = stateno = 221 && (animelemtime(5) < 0 || (animelemtime(7) < 0 && (movecontact = [1, 8])))
trigger9 = stateno = 230 && (animelemtime(4) < 0 || (movecontact = [1, 8]))
trigger10 = stateno = 231 && (animelemtime(4) < 0 || (movecontact = [1, 8]))
trigger11 = stateno = 241 && (animelemtime(4) < 0 || (movecontact = [1, 8]))
trigger12 = stateno = 251 && (animelemtime(3) < 0 || (animelemtime(6) < 0 && (movecontact = [1, 8])))
trigger13 = stateno = 400
trigger14 = stateno = 410 && (animelemtime(5) < 0 || (movecontact = [1, 8]))
trigger15 = stateno = 420 && (animelemtime(4) < 0 || (movecontact = [1, 8]))
trigger16 = stateno = 430
trigger17 = stateno = 440 && (animelemtime(2) < 0 || (movecontact = [1, 8]))
trigger18 = stateno = 450 && (animelemtime(4) < 0 || (movecontact = [1, 8]))
trigger19 = (stateno = [1000, 1020]) && (movecontact = [1, 8])
trigger20 = stateno = 1200 && animelemtime(8) < 0 && movecontact
trigger21 = stateno = 1220 && animelemtime(22) < 0 && movecontact
trigger22 = stateno = 3020 && animelemtime(35) > 0 && animelemtime(38) < 0 && movecontact
trigger23 = stateno = 3500 && animelemtime(26) < 0 && movecontact
var(8) = 1
ignorehitpause = 1

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2 && !numhelper(765) && !var(20)
triggerall = (movetype = I && ctrl) || (stateno = [760, 762]) || stateno = 5120
triggerall = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AIlevel
trigger1 = !AIlevel && (statetype = S || statetype = C || stateno = 5120) && (command = "fwd" || command = "down")
trigger2 = !AIlevel && statetype = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AIlevel && (stateno != [760, 762]) && inguarddist && random < 50
trigger4 = AIlevel && (stateno = [760, 762]) && time = 14 && random < 667
helpertype = normal
stateno = 765
ID = 765
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535
[State -3, Parry Attacks]
type = changestate
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = helper(765), stateno = 766
value = ifelse((helper(765), anim = 767), 762, ifelse((helper(765), anim = 766), 761, 760))
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 765)
attr = SA, AP
stateno = 760
slot = 0
time = 1
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 766)
attr = C, AP
stateno = 761
slot = 0
time = 1
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 767)
attr = SCA, AP
stateno = 762
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = var(26) > 0
flag = nowalk
[State -3, NoWalk after Parry]
type = varadd
trigger1 = var(26) > 0
var(26) = -1

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

[State -3, Afterimage]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (stateno = [700, 715])
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
trans = add1

[State -3, ExFX]
type = varadd
trigger1 = var(25) > 0
var(25) = -1
[State -3, ExFX]
type = varset
trigger1 = (stateno != [1000, 2999]) || movetype = H
var(25) = 0

[State -3, Ex Afterimage]
type = afterimage
trigger1 = time = 1
trigger1 = (stateno = [1000, 2999]) && var(25)
time = 2
timegap = 1
framegap = 5
length = 6
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add
ignorehitpause = 1
[State -3, Ex Flash]
type = palfx
trigger1 = !(gametime % 3)
trigger1 = (stateno = [1000, 2999]) && var(25)
time = 1
color = 0
mul = 128, 128, 0
add = 255, 255, 255
ignorehitpause = 1

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3100 && time = 4
trigger2 = stateno = 3400 && time = 4
trigger3 = stateno = 3500 && time = 4
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3001 && time = 3
trigger2 = stateno = 3300 && time = 4
trigger3 = stateno = 3550 && time = 4
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 3200 && time = 4
trigger2 = stateno = 4100 && time = 4
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || (stateno = [600, 659])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = (stateno = [700, 715]) || var(20)
trigger3 = (stateno = [1000, 2999]) && var(25)
trigger4 = (stateno = [3000, 4999])
time = 2
[State -3, Afterimage Off]
type = afterimagetime
trigger1 = time <= 1
trigger1 = (stateno = 3000 || stateno = 3100 || stateno = 3200 || stateno = 3300)
trigger2 = stateno = 4131
time = 0

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
trigger1 = p2dist y >= (enemynear, const(size.height) - 35)
trigger2 = p2statetype = C
trigger2 = p2dist y >= (enemynear, const(size.height) - 61)
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
value = 5000, (random % 3)
channel = 0
ignorehitpause = 1
[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, (random % 3)
channel = 0
ignorehitpause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5950
ignorehitpause = 1
[State -3, Cheap KO]
type = assertspecial
trigger1 = (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
flag = nokosnd
ignorehitpause = 1

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO && var(20)
triggerall = roundstate = 3 && !numhelper(8600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(10000)
trigger2 = helper(10000), var(18)
trigger3 = numhelper(1260)
trigger3 = helper(1260), var(18)
trigger4 = stateno = 810 && (animelemtime(3) = [0, 1])
trigger5 = stateno = 820 && (animelemtime(11) = [0, 1])
trigger6 = stateno = 830 && (animelemtime(8) = [0, 1])
trigger6 = stateno = 840 && (animelemtime(4) = [0, 1])
trigger7 = stateno = 861 && time <= 1
helpertype = normal
stateno = 8650
ID = 8600
name = "Excel Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(8600)
trigger1 = movehit = 1 && (stateno = [3000, 4999])
trigger1 = var(23) := stateno
trigger2 = numhelper(10000)
trigger2 = (helper(10000), stateno = [10410, 10411]) && (helper(10000), var(18))
trigger2 = var(23) := 3100
trigger3 = numhelper(10000)
trigger3 = (helper(10000), stateno = [10610, 10621]) && (helper(10000), var(18))
trigger3 = var(23) := 3300
trigger4 = (stateno = [4100, 4199])
trigger4 = var(23) := 4100
trigger5 = numhelper(10000)
trigger5 = (helper(10000), stateno = [11410, 11411]) && (helper(10000), var(18))
trigger5 = var(23) := 3150
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


