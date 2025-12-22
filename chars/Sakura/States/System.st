; ADD004 BASIC PIEs ReBuilded CNS (25/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==


;_________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
value = 3, 1
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
pos = 37, -64
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

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 700, Stop]
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
value = 3, 1
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
pos = 37, -41
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
value = 3, 1
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
pos = 44, -77
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
value = 3, 7
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
value = 3, 7
channel = 0
[State 720, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = 4, 9
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
x = 6
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(7) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = 11
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
value = 3, 7
channel = 0
[State 725, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = 4, 9
channel = 0
[State 725, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
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
value = 11
ctrl = 1


;==< POWER CHARGE >==
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
velset = 0, 0
ctrl = 0

[State 740, Power]
type = poweradd
triggerall = power < const(data.power) && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 12)

[State 740, Snd]
type = playsnd
trigger1 = !time
value = 3,0
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

[State 740, End]
type = changestate
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel && (command != "holdb" || command != "holdy")
trigger3 = AIlevel && (inguarddist || p2bodydist x <= 120)
value = 741
ctrl = 1


;--- END ---
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 1

[State 741, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 740, Snd]
type = playsnd
trigger1 = !time && power >= const(data.power)
value = 4,5
channel = 0
persistent = 0

[State 740, End]
type = changestate
trigger1 = !animtime
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
value = 3, 1
channel = 0

[State 750, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 37, -64
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 20
movetime = 20
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0
[State 750, End]
type = changestate
trigger1 = time >= 20
value = ifelse(var(10) = 1, 1100, 255)


;===< CUSTOM COMBO >===
[Statedef 760]
type = U
physics = U
movetype = A
anim = 760 + (statetype = A)
ctrl = (statetype = A)
poweradd = -1000
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4, 5
channel = 0
volume = 200

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

[State 760, NHB]
type = nothitby
trigger1 = anim = 760
trigger2 = anim = 761 && animelemtime(2) < 0
time = 8
value = SCA

[State 760, Var]
type = varset
trigger1 = anim = 760
trigger2 = anim = 761 && !time
var(20) = 180

[State 760, Shadows]
type = afterimage
trigger1 = anim = 760 && time = 30
trigger2 = anim = 761 && time = 1
time = 2
timegap = 1
framegap = 4
length = 13
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
trans = add1

[State 760, Type]
type = statetypeset
trigger1 = statetype = A
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
trigger1 = (var(1) != 2 && anim != 0) || (var(1) = 2 && anim != 1)
trigger1 = anim != 5
trigger2 = anim = 5 && !animtime
value = ifelse(var(1) = 2, 1, 0)

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


;==< WALKING >==
[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = ifelse(var(1) != 1, 1.2, 1) * const(velocity.walk.fwd.x)
[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = ifelse(var(1) != 1, 1.2, 1) * const(velocity.walk.back.x)

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
stateno = 8100
ID = 8100
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
y = ifelse(!sysvar(1), 1.15, 1) * const(velocity.jump.y)

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
anim = ifelse(vel y > 11, 48, 47)
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
trigger1 = !time && (prevstateno = 1113 || (prevstateno = [1300, 1305]) || prevstateno = 1250)
value = 48

[State 52, anim813]
type = changeanim
trigger1 = !time && (prevstateno = 810 || prevstateno = 4200)
value = 813

[State 52, anim824]
type = changeanim
trigger1 = !time && prevstateno = 820
value = 824

[State 52, anim1102]
type = changeanim
trigger1 = !time && (prevstateno = 1100 || prevstateno = 3100)
value = 1104

[State 52, anim1205]
type = changeanim
trigger1 = !time && (prevstateno = 1200 || prevstateno = 1210)
value = ifelse(var(1) = 2, 1206, 1205)

[State 52, anim1405]
type = changeanim
trigger1 = !time && (prevstateno = [1400, 1410])
value = 1405

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 52, Ctrl]
type = ctrlset
trigger1 = !time
trigger1 = prevstateno != [200, 4999]
value = 1

[State 52, Ctrl]
type = ctrlset
trigger1 = time >= 1
trigger1 = prevstateno < 1000 || (prevstateno = [1400, 1410])
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


;==< RUN >===
[Statedef 100]
type = S
physics = S
anim = 100
ctrl = 1
sprpriority = 1
[State 100, as]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn
[State 100, Vel]
type = velSet
trigger1 = anim = 100
x = const(velocity.run.fwd.x)
[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 2 || animelem = 5)
value = 0, 100
[State 100, change]
type = changeanim
triggerall = time > 7 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && p2dist x < 60
value = 101
persistent = 0
[State 100, Snd]
type = playsnd
trigger1 = anim = 101
value = 3, 7
channel = 0
persistent = 0
[State 100, Snd]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0

[State 102, Dust]
type = helper
trigger1 = anim = 100 && animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Dust]
type = explod
trigger1 = anim = 101 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 18, 0
vel = 2, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 100, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1

[Statedef 102]
type = S
physics = N
movetype = I
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 110,0

[State 102, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = AnimElemTime(2) <= 0
trigger1 = !AIlevel && command != "holdfwd"
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 102, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 6.75
y = -4

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 102, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 103


;--- LAND ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 100,0

[State 103, Dust]
type = explod
trigger1 = !time
anim = 8102
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
movetype = I
physics = N
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

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
value = 0, 40

[State 105, Dust]
type = helper
trigger1 = animelem = 2
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -4
value = 52


;====< OFF SCREEN >==
[Statedef 110]
type = S
physics = S
anim = 100
ctrl = 0
sprpriority = 1
[State 110, bound]
type = screenbound
trigger1 = anim = 100
value = 0
movecamera = 0, 1
[State 110, NHB]
type = nothitby
trigger1 = 1
value = SCA
[State 110, width]
type = width
trigger1 = 1
value = 8
[State 110, as]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn
[State 110, Turn]
type = turn
trigger1 = anim = 100 && (pos x != [ -240, 240]) && (frontedgedist < backedgedist)
[State 110, Vel]
type = velset
trigger1 = anim = 100
x = ifelse(backedgedist < -160, 1.5, 1) * const(velocity.run.fwd.x)
[State 110, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 2 || animelem = 5)
value = 0, 100
[State 110, change]
type = changeanim
trigger1 = anim = 100 && (pos x = [ -120, 120])
value = 101
persistent = 0
[State 110, Snd]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0
[State 110, Dust]
type = explod
trigger1 = anim = 101 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 18, 0
vel = 2, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 110, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1


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
anim = 8102
ID = 8102
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
[State AI fix]
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
movetype = A
physics = S
juggle = 5 
anim = ifelse(var(1) = 2, 198, ifelse((command = "holdfwd"), 196, 195))
velset = 0, 0
poweradd = 20 * (var(1) = 2)
sprpriority = 1
ctrl = 0

[State 195, Type]
type = statetypeset
trigger1 = anim = 195
trigger1 = animelemtime(6) >= 0
movetype = I

[State 195, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20)) && p2stateno != 5040
trigger1 = anim = 195 && animelem = 4
attr = S, SA
damage = 7, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 2, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = -1 + 0 * (var(12) := 8013)
guard.sparkno = -1 + 0*(var(13):=8001)
sparkxy = -10 + 0 * (var(35) := 89), var(36):= -79
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -5.62, 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = -4, -8
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1

[State 195, Snd]
type = playsnd
trigger1 = anim = 195 && animelem = 4
value = 4, 3;ifelse(random < 500, 3, 19)
channel = 0
[State 195, Snd]
type = playsnd
trigger1 = anim = 196 && animelem = 3
value = 4, 20
channel = 0
[State 195, Snd]
type = playsnd
trigger1 = anim = 198 && animelem = 4
value = 3, 1
channel = 0

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< HUMILIATE >==
[Statedef 197]
type = S
movetype = I
physics = S
juggle = 5 
anim = 197
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 197, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 4
channel = 0
[State 197, Snd]
type = playsnd
triggerall = time >= 30
trigger1 = animelemtime(6) >= 0 && animelemtime(10) < 0 && (command = "holdfwd" || command != "holdback")
trigger2 = animelemtime(14) >= 0 && animelemtime(2) < 0 && (command != "holdfwd" || command = "holdback")
trigger3 = animelemtime(10) >= 0 && animelemtime(14) < 0 && (command != "holdfwd" && command != "holdback")
trigger4 = animelemtime(2) >= 0 && animelemtime(6) < 0 && (command != "holdfwd" && command != "holdback")
value = 3, 7
channel = 0
persistent = 0
[State 197, End]
type = changestate
triggerall = time >= 30
trigger1 = animelemtime(6) >= 0 && animelemtime(10) < 0 && (command = "holdfwd" || command != "holdback")
trigger2 = animelemtime(14) >= 0 && animelemtime(2) < 0 && (command != "holdfwd" || command = "holdback")
trigger3 = animelemtime(10) >= 0 && animelemtime(14) < 0 && (command != "holdfwd" && command != "holdback")
trigger4 = animelemtime(2) >= 0 && animelemtime(6) < 0 && (command != "holdfwd" && command != "holdback")
value = 0
ctrl = 1


;==< CHEAP K.O. >==
[Statedef 5130]
type = S
movetype = H
physics = S
anim = 5130
[State 5130, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5130, Pos]
type = posset
trigger1 = 1
y = 0

[State 5130, KO snd]
type = assertspecial
trigger1 = 1
flag = nokosnd
[State 5130, KO snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0
[State 5130, KO snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 11, 1

[State 5130, End]
type = changestate
trigger1 = !animtime
value = 5131

[Statedef 5131]
type = L
movetype = H
physics = C
anim = 5131
[State 5131, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5131, Pos]
type = posset
trigger1 = 1
y = 0
[State 5131, posfix]
type = posadd
trigger1 = animelem = 7
x = -25
[State 5131, Snd]
type = playsnd
trigger1 = !time
trigger1 = animelem = 8
value = 0, 52
[State 5131, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = 15, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, Dust]
type = explod
trigger1 = animelem = 8
anim = 8102
ID = 8102
sprpriority = -5
postype = p1
pos = 16, 0
scale = 0.66, 0.66
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


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

[State 5900, modevar]
type = varset
trigger1 = 1
var(1) = ifelse((palno = [7, 12]) && palno != 9, 2, 1)

[State 5900, replayintro]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, name = "Dan Hibiki" || enemy, name = "Karin Kanzuki" || enemy, name = "Athena Asamiya"
trigger2 = enemy, name = "Dan" || enemy, name = "Karin" || enemy, name = "Athena"
trigger3 = (enemy, name = "cvsdan" || enemy, name = "cvsathena") && enemy, authorname = "Warusaki3"
trigger4 = (enemy, name = "Dan_TLE" || enemy, name = "Dan_Violent") && enemy, authorname = "Mr.X -file"
trigger5 = enemy, name = "Evil Dan" && enemy, authorname = "ilcane87"
trigger6 = enemy, name = "darkkarin" && enemy, authorname = "Drowin"
trigger7 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
trigger8 = enemy, authorname = "QuickFist" && enemy, name = "Yuri Sakazaki"
trigger9 = enemy, authorname = "Warusaki3" && enemy, name = "cvsryu" && enemy, palno <= 6
trigger10 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Pocket Shin Gouki"
trigger11 = enemy, authorname = "Helios" && enemy, name = "Pocket Ryu"
trigger12 = enemy, authorname = "Renzoku" && enemy, name = "Ken3rd"
trigger13 = enemy, authorname = "BDI_Pocket_Chun -li" && enemy, name = "Black_Dahlia_Isis"
trigger14 = enemy, authorname = "Cybaster" && enemy, name = "NxC Ryu"
trigger15 = enemy, authorname = "Kung Fu Man" && (enemy, name = "T.A.C." || enemy, name = "King DeDeDe")
trigger16 = enemy, authorname = "XeX" && enemy, name = "KIRBYXeX"
trigger17 = enemy, authorname = "Toma" && enemy, name = "Neco -Arc"
trigger18 = enemy, authorname = "Patrick Ching(Pneophen)" && enemy, name = "Pneophen's pissed off Sakura"
value = 190

[State 5900, turnsintro]
type = changestate
trigger1 = !time && teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 358
[State 5900, End]
type = changestate
trigger1 = !time
value = ifelse(roundno = 1, 190, 0)


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
[State 170, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000, 170
[State 170, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 3
[State 170, Dust]
type = explod
trigger1 = animelem = 3
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -20, 0
ownpal = 1
scale = 0.5, 0.5


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


;==< PREINTRO >==
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, specialintrounavailable]
type = varset
trigger1 = !time
var(0) = 0

[State 190, scratch head]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, name = "Dan Hibiki" || enemy, name = "Karin Kanzuki" || enemy, name = "Athena Asamiya"
trigger2 = enemy, name = "Dan" || enemy, name = "Karin" || enemy, name = "Athena"
trigger3 = (enemy, name = "cvsdan" || enemy, name = "cvsathena") && enemy, authorname = "Warusaki3"
trigger4 = (enemy, name = "Dan_TLE" || enemy, name = "Dan_Violent") && enemy, authorname = "Mr.X -file"
trigger5 = enemy, name = "Evil Dan" && enemy, authorname = "ilcane87"
trigger6 = enemy, name = "darkkarin" && enemy, authorname = "Drowin"
value = 350

[State 190, vs CvS Yuri]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "QuickFist" && enemy, name = "Yuri Sakazaki"
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
trigger3 = enemy, authorname = "David Demianoff" && enemy, name = "Yuri Sakazaki"
value = 351

[State 190, intro vs Ryu]
type = changestate
trigger1 = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = var(0) := 2
trigger1 = (enemy, var(1) = 1 || enemy, var(1) = 3)
value = 352

[State 190, intro vs other Ryus]
type = changestate
trigger1 = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "Warusaki3" && enemy, name = "cvsryu" && enemy, palno <= 6
value = 353

[State 190, intro vs cute chars ^_^]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Pocket Shin Gouki"
trigger2 = enemy, authorname = "Helios" && enemy, name = "Pocket Ryu"
trigger3 = enemy, authorname = "Renzoku" && enemy, name = "Ken3rd"
trigger4 = enemy, authorname = "BDI_Pocket_Chun -li" && enemy, name = "Black_Dahlia_Isis"
trigger5 = enemy, authorname = "Cybaster" && enemy, name = "NxC Ryu"
trigger6 = enemy, authorname = "Kung Fu Man" && (enemy, name = "T.A.C." || enemy, name = "King DeDeDe")
trigger7 = enemy, authorname = "XeX" && enemy, name = "KIRBYXeX"
trigger8 = enemy, authorname = "Toma" && enemy, name = "Neco -Arc"
value = 356

[State 190, intro vs P.O. Sakura]
type = changestate
trigger1 = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "Patrick Ching(Pneophen)" && enemy, name = "Pneophen's pissed off Sakura"
value = 357

[State 190, intro]
type = changestate
trigger1 = ifelse(var(0) = 2, time >= 1, 1)
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 354))


;==< INTRO 1 >==
[Statedef 191]
type = S
physics = N
anim = 191
[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 191, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 2
channel = 0
[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO 2 >==
[Statedef 192]
type = S
physics = N
anim = 192
sprpriority = 1
[State 192, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 192, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 192, bound]
type = screenbound
trigger1 = 1
value = 0
[State 192, Pos]
type = posset
trigger1 = !time
x = 450 * facing
[State 192, Vel]
type = velset
trigger1 = anim = 192
x = -1.25 * const(velocity.run.fwd.x)

[State 192, Snd]
type = playsnd
trigger1 = time = 10
value = 4, 6
channel = 0
[State 192, steps]
type = playsnd
trigger1 = anim = 192 && (animelem = 3 || animelem = 6)
value = 0, 100

[State 192, Anim]
type = changeanim
trigger1 = anim = 192 && time && numhelper(7650) && animelemtime(11) >= 0
trigger1 = (helper(7650), rootdist x) < 90
value = 193
[State 192, Snd]
type = playsnd
trigger1 = anim = 193 && animelem = 2
value = 0, 101
persistent = 0
[State 192, Dust]
type = explod
trigger1 = anim = 193 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -18, 0
vel = -2, 0
removetime = -2
ownpal = 1

[State 192, Vel]
type = velset
trigger1 = anim = 193 && animelem = 1
x = (helper(7650), rootdist x) / -15
[State 192, Pos]
type = posset
trigger1 = anim = 193 && numhelper(7650) && animelemtime(5) >= 0
x = ceil(helper(7650), pos x)
[State 192, Vel]
type = velset
trigger1 = anim = 193 && numhelper(7650) && animelemtime(5) >= 0
x = 0
[State 192, End]
type = changestate
trigger1 = anim = 193 && !animtime
value = 0


;==< INTRO with KEI >==
[Statedef 354]
type = S
physics = N
anim = 354
sprpriority = -1
[State 354, bound]
type = screenbound
trigger1 = 1
value = 0
[State 354, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 354, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 354, Pos]
type = posset
trigger1 = !time
x = 10 * facing
[State 354, kei]
type = helper
trigger1 = animelemtime(2) < 0 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Kei"
postype = p1
pos = -10, 0
facing = 1
size.shadowoffset = -5
ownpal = 1
[State 354, Snd]
type = playsnd
trigger1 = anim = 354 && animelem = 2
value = 4, 18
channel = 0

[State 354, Vel]
type = velset
trigger1 = anim = 354 && animelem = 6
x = (helper(7650), rootdist x) / -17
[State 354, Snd]
type = playsnd
trigger1 = anim = 354 && animelem = 6
value = 0, 105
[State 354, Dust]
type = explod
trigger1 = anim = 354 && animelem = 6
anim = 8100
ID = 8100
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1
scale = 0.5, 0.5

[State 354, Anim]
type = changeanim
trigger1 = anim = 354 && !animtime
value = 355
[State 354, Pos]
type = posset
trigger1 = anim = 355 && numhelper(7650)
x = ceil(helper(7650), pos x)
[State 354, Vel]
type = velset
trigger1 = anim = 355 && numhelper(7650)
x = 0
[State 354, End]
type = changestate
trigger1 = anim = 355 && !animtime
value = 0


;==< SCRATCH HEAD INTRO >==
[Statedef 350]
type = S
physics = N
anim = 350
[State 350, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 350, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 23
channel = 0
[State 350, End]
type = changestate
trigger1 = !animtime
value = 0


;==< CvS YURI INTRO >==
[Statedef 351]
type = S
physics = N
anim = 351
[State 351, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 351, Snd]
type = playsnd
trigger1 = animelem = 9
value = 4, 23
channel = 0
[State 351, Snd]
type = playsnd
trigger1 = animelem = 21
value = 4, 8
channel = 0
[State 351, Snd]
type = playsnd
trigger1 = animelem = 27
value = 4, 16
channel = 0
[State 351, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs RYU >==
[Statedef 352]
type = S
physics = N
anim = 352
[State 352, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 352, Hadouken]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 1003
ID = 1003
name = "Hadouken Intro"
postype = p1
ownpal = 1

[State 352, Snd]
type = playsnd
trigger1 = animelem = 9
value = 4, 5
channel = 0
[State 352, Snd]
type = playsnd
trigger1 = animelem = 28
value = 4, 0
channel = 0
[State 352, Snd]
type = playsnd
trigger1 = animelem = 29
value = 5, 6

[State 352, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs other RYUs >==
[Statedef 353]
type = S
physics = N
anim = 353
[State 353, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 353, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs CUTE CHARS >==
[Statedef 356]
type = S
physics = N
anim = 356
[State 356, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 356, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 22
channel = 0
[State 356, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs P.O. SAKURA >==
[Statedef 357]
type = S
physics = N
anim = 357
[State 357, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 357, Anim]
type = changeanim
trigger1 = !roundstate
value = 357
[State 357, Snd]
type = playsnd
trigger1 = animelem = 8
value = 3, 1
channel = 0
[State 357, End]
type = changestate
trigger1 = !animtime
value = 0


;==< TURNS INTRO >==
[Statedef 358]
type = A
physics = N
anim = 358
[State 358, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 358, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 358, bound]
type = screenbound
trigger1 = 1
value = 0
[State 358, Pos]
type = posset
trigger1 = !time
x = (-240 * facing)
y = -80
[State 358, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -33
y = -6
[State 358, Accel]
type = gravity
trigger1 = anim = 358
[State 358, Anim]
type = changeanim
trigger1 = time && anim = 358 && vel y > 0 && pos y >= -5
value = 359
[State 358, Pos]
type = posset
trigger1 = anim = 359
x = ceil(helper(7650), pos x)
y = 0
[State 358, Vel]
type = velset
trigger1 = anim = 359
x = 0
y = 0
[State 358, Snd]
type = playsnd
trigger1 = anim = 359 && animelem = 1
value = 0, 52
[State 358, Dust]
type = explod
trigger1 = anim = 359 && animelem = 1
anim = 8102
ID = 8102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
[State 358, Snd]
type = playsnd
trigger1 = anim = 359 && animelem = 8
value = 4, 2
channel = 0
[State 358, End]
type = changestate
trigger1 = anim = 359 && !animtime
value = 0


;==< WIN POSE DECIDER >==
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = !time
value = 1 + (random % 11)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Ryu"
trigger2 = enemy, name = "cvsryu" || enemy, name = "svcryu"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Dan Hibiki"
trigger2 = enemy, name = "cvsdan" || enemy, name = "svcdan"
value = 51

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Karin Kanzuki"
trigger2 = enemy, name = "cvskarin"
value = 52

[State 180, winSGS]
type = changestate
trigger1 = prevstateno = 4002
value = 4002

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = ifelse((command = "holdx"), 181, ifelse((command = "holdy"), 182, 183))

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = ifelse((command = "holda"), 186, ifelse((command = "holdb"), 184, 185))

[State 180, win]
type = changestate
triggerall = !numhelper(6000)
trigger1 = command = "holdstart"
trigger2 = !winperfect && random < (250 * (AIlevel ** 2 / 64.0))
value = 187

[State 180, Perfect]
type = changestate
trigger1 = winperfect
value = 188

[State 180, win]
type = changestate
trigger1 = 1
value = 181 + (random % 6)


;==< WIN 1 >==
[Statedef 181]
type = S
anim = 181
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 181, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 4
channel = 0

[State 181, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN 2 >==
[Statedef 182]
type = S
anim = 182
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN 3 >==
[Statedef 183]
type = S
anim = 183
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 183, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0

[State 183, Snd]
type = playsnd
trigger1 = animelem = 9
value = 3, 2
channel = 0

[State 183, shoe]
type = helper
trigger1 = animelem = 9 && !numhelper(6091)
helpertype = normal
stateno = 6091
ID = 6091
name = "Shoe"
postype = p1
pos = 59, -103

[State 183, Snd]
type = playsnd
trigger1 = animelem = 18
value = 3, 3
channel = 0

[State 183, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN 4 >==
[Statedef 184]
type = S
anim = 184
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 184, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 7
channel = 0

[State 184, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN 5 >==
[Statedef 185]
type = S
anim = 185
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 185, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN 6 >==
[Statedef 186]
type = S
anim = 186
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 186, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0

[State 186, Snd]
type = playsnd
trigger1 = animelem = 9
value = 3, 2
channel = 0

[State 186, Snd]
type = playsnd
trigger1 = animelem = 18
value = 3, 3
channel = 0

[State 186, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN by PERFECT >==
[Statedef 188]
type = S
anim = 188
ctrl = 0

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 188, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 20
channel = 0

[State 188, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==< WIN KEI >==
[Statedef 187]
type = S
ctrl = 0

[State 187,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 187, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 187, Push]
type = playerpush
trigger1 = 1
value = 0

[State 187, Turn]
type = turn
trigger1 = !time && frontedgedist < 120

[State 187, Assert]
type = assertspecial
triggerall = time < 180
trigger1 = anim != 187
trigger2 = anim = 187 && animelemtime(13) < 60
flag = roundnotover

[State 187, Anim]
type = changeanim
trigger1 = !time && anim
value = 0

[State 187, kei]
type = helper
trigger1 = !time && !numhelper(6000) && random < 500
helpertype = normal
stateno = 6004
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1
ownpal = 1

[State 187, kei]
type = helper
trigger1 = !time && !numhelper(6000)
helpertype = normal
stateno = 6002
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1
size.shadowoffset = 5
ownpal = 1

[State 187, Anim]
type = changeanim
trigger1 = numhelper(6000) && anim != 187
trigger1 = helper(6000), anim = 6003
value = 187

[State 187, Anim]
type = changestate
trigger1 = numhelper(6000)
trigger1 = helper(6000), anim = 6004
value = 182


;==< WIN by S.G.S. >==
[Statedef 4002]
type = S
sprpriority = -4
anim = 4002

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 4002, Snd]
type = playsnd
trigger1 = time = 10 && prevstateno = 4001
value = 4, 7
channel = 0

[State 4002, flowers]
type = explod
trigger1 = prevstateno = 4001 && numexplod(6090) < 12
vel = -(random / 2000.0), 0.5
accel = -.0075, 0
anim = 6090
ID = 6090
sprpriority = 4
postype = p1
pos = 25, -110
random = 100, 50
removetime = 210
facing = ifelse(random < 500, -1, 1)
scale = 0.25, 0.25
ownpal = 1

[State 4002, win]
type = changestate
trigger1 = time >= 60 && roundstate = 3
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
value = 8100

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
value = 4, 9
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 5200,0
channel = 1

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
value = 3, 7
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 5200,0
channel = 1

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
velset = 0, 0
facep2 = 1

[State 5221, Pos]
type = posset
trigger1 = 1
y = 0
[State 5221, Vel]
type = velset
trigger1 = 1
x = 5
y = 0
[State 5221, Push]
type = playerpush
trigger1 = 1
value = 0
[State 5221, Anim]
type = changeanim
trigger1 = animelem = 13 && command != "holdfwd"
value = 5220
elem = 21
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
pausemovetime = -1
supermovetime = -1

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


[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard

[State -2, Finish]
type = ScreenBound
triggerall = (Life <= 0) || (!Alive) || (Lose)
trigger1 = (StateNo = 5150) && (RoundState = 4)
value = 0
MoveCamera = 0,0
IgnoreHitPause = 1

[State -2, Mode]
type = varset
trigger1 = !var(1)
var(1) = ifelse((palno = [7, 12]) && palno != 9, 2, 1)

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

[State -2, slap]
type = playsnd
trigger1 = anim = 5300 && animelem = 3
value = 5, 4

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Mode = %d Damage = %f"
params = AIlevel, var(1), fvar(12)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause = 1

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

[State -3, Chain Combo Reset]
type = VarSet
trigger1 = 1
var(4) = 0
ignoreHitPause = 1

[State -3, Chain Combo Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
var(4) = 1
ignoreHitPause = 1

[State -3, Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 205
trigger6 = StateNo = 215 && AnimElemTime(6) < 0
trigger7 = StateNo = 225 && AnimElemTime(7) < 0
trigger8 = StateNo = 230
trigger9 = StateNo = 245 && AnimElemTime(5) < 0
trigger10 = StateNo = 255 && AnimElemTime(6) < 0
trigger11 = StateNo = 400
trigger12 = StateNo = 410 && AnimElemTime(5) < 0
trigger13 = StateNo = 420 && AnimElemTime(7) < 0 && AnimElemTime(3) >= 0
trigger14 = StateNo = 430
trigger15 = StateNo = 440 && AnimElemTime(6) < 0
trigger16 = StateNo = 450 && AnimElemTime(5) < 0
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 205
trigger6 = StateNo = 215 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger7 = StateNo = 225 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger8 = StateNo = 230
trigger9 = StateNo = 245 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger10 = StateNo = 255 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger11 = StateNo = 400
trigger12 = StateNo = 410 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger13 = StateNo = 420 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger14 = StateNo = 430
trigger15 = StateNo = 440 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger16 = StateNo = 450 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger17 = (StateNo = [1000,1030]) && (AnimElemTime(5) = [1,8])
trigger18 = (StateNo = [1100, 1130]) && AnimElemTime(4) < 0
trigger19 = StateNo = 1400 && AnimElemTime(8) < 0
trigger20 = StateNo = 1405 && AnimElemTime(6) < 0
trigger21 = StateNo = 1410 && AnimElemTime(6) < 0
trigger22 = StateNo = 1420 && AnimElemTime(7) < 0
trigger23 = StateNo = 1430 && AnimElemTime(15) < 0
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3000 && AnimElemTime(13) >= 0 && AnimElemTime(15) < 0 && MoveContact
trigger2 = StateNo = 3200 && AnimElemTime(3) >= 0 && AnimElemTime(44) < 0 && MoveContact
var(8) = 1
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && var(9) = 3
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
trigger1 = stateno = 3000 && anim = 3000 && animelem = 2
trigger2 = stateno = 3020 && anim = 3020 && animelem = 2
trigger3 = stateno = 3100 && animelem = 2
trigger4 = stateno = 3200 && animelem = 3
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
trigger1 = stateno = 4100 && anim = 4100 && animelem = 2
trigger2 = stateno = 4200 && anim = 4200 && animelem = 3
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
trigger1 = stateno = 4000 && time = 1
trigger2 = stateno = 4300 && anim = 4300 && animelem = 2
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
trigger1 = stateno = 50 && var(9) = 3 && vel y < -1
trigger2 = var(20)
trigger3 = (stateno = [1000, 2999]) && var(10) = 4
trigger3 = (anim != [1103, 1104]) && (anim != [40, 48])
trigger4 = (stateno = [3000, 4999]) && anim != 1103 && stateno != 4002
trigger5 = (stateno = [710, 725]) || stateno = 1500
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

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5130
ignorehitpause = 1

[State -3, Cheap KO]
type = assertspecial
trigger1 = (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
flag = nokosnd
ignorehitpause = 1

[State -3, CC Finish]
type = helper
triggerall = winKO && var(20)
triggerall = roundstate = 3 && !numhelper(8600)
trigger1 = movehit = [1, 4]
trigger2 = StateNo = 810 && (AnimElemTime(6) = [0, 1])
trigger3 = StateNo = 820 && (AnimElemTime(6) = [0, 1])
trigger4 = numhelper(1005)
trigger4 = (helper(1005), stateno = [1005, 1007]) && (helper(1005), var(18))
trigger5 = numhelper(1055)
trigger5 = (helper(1055), stateno = [1055, 1057]) && (helper(1055), var(18))
helpertype = normal
stateno = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
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
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := stateno
trigger2 = StateNo = 3000
trigger2 = var(23) := 3000
trigger3 = StateNo = 3020
trigger3 = var(23) := 3020
trigger4 = StateNo = 3200
trigger4 = var(23) := 3200
trigger5 = StateNo = 4300
trigger5 = var(23) := 4300
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(7600)
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = 1195 || (stateno = [4000, 4099]))
trigger2 = numhelper(4305)
trigger2 = helper(4305), var(3)
trigger3 = stateno = 4001 && animelemtime(23) >= 0
helpertype = normal
stateno = 7600
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999



