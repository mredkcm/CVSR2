; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMON STATES >========================================
;==============================================================================================

;==========< PARRY >==========
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


;==========< DODGE >==========
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


;==========< FORWARD ROLL >==========
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


;==========< BACKWARD ROLL >==========
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


;==========< POWER CHARGE >==========
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
value = 3, 0
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7243)
helpertype = normal
stateno = 7243
ID = 7243
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
value = 4, 5
channel = 0
persistent = 0
[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1


;==========< ZERO COUNTER >==========
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


;===================< CUSTOM COMBO >===================
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
stateno = 7260
ID = 7260
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
sound = s7, 2
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


;====================< STANDING >====================
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


;====================< CROUCHING >====================
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


;==========< WALKING >==========
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


;===================< JUMPING >================
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
anim = 7102
ID = 7102
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


;======================< RUN >===========================
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


;========================< BACK DASH >==========================
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
type = explod
trigger1 = animelem = 2
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 26, 0
vel = -1, -.5
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 105, End]
type = changestate
trigger1 = vel y > 0 && pos y >= -4
value = 52


;========================< OFF SCREEN >==========================
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


;==========< GUARD >==========
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


;==========< TAUNT >==========
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
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
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


;==========< HUMILIATE >==========
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


;==========< CHEAP K.O. >==========
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
anim = 7102
ID = 7102
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


;==========< INITIALIZE >==========
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
triggerall = !(teammode = simul) && !(enemy, teammode = simul) && !(enemynear, roundsexisted)
trigger1 = enemy, name = "Dan Hibiki" || enemy, name = "Karin Kanzuki" || enemy, name = "Athena Asamiya"
trigger2 = enemy, name = "Dan" || enemy, name = "Karin" || enemy, name = "Athena"
trigger3 = (enemy, name = "cvsdan" || enemy, name = "cvsathena") && enemy, authorname = "Warusaki3"
trigger4 = (enemy, name = "Dan_TLE" || enemy, name = "Dan_Violent") && enemy, authorname = "Mr.X -file"
trigger5 = enemy, name = "Evil Dan" && enemy, authorname = "ilcane87"
trigger6 = enemy, name = "darkkarin" && enemy, authorname = "Drowin"
trigger7 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
trigger8 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Yuri Sakazaki"
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


;==========< LOSE (Time over) >==========
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


;==========< DRAWGAME (Time over) >==========
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


;==========< PREINTRO >==========
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
triggerall = !(teammode = simul) && !(enemy, teammode = simul)
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
triggerall = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Yuri Sakazaki"
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
trigger3 = enemy, authorname = "David Demianoff" && enemy, name = "Yuri Sakazaki"
value = 351

[State 190, intro vs Ryu]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = var(0) := 2
trigger1 = (enemy, var(1) = 1 || enemy, var(1) = 3)
value = 352

[State 190, intro vs other Ryus]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Warusaki3" && enemy, name = "cvsryu" && enemy, palno <= 6
value = 353

[State 190, intro vs cute chars ^_^]
type = changestate
triggerall = numenemy
triggerall = !(teammode = simul) && !(enemy, teammode = simul)
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
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Patrick Ching(Pneophen)" && enemy, name = "Pneophen's pissed off Sakura"
value = 357

[State 190, intro]
type = changestate
trigger1 = ifelse(var(0) = 2, time >= 1, 1)
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 354))


;==========< INTRO 1 >==========
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


;==========< INTRO 2 >==========
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


;==========< INTRO with KEI >==========
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
anim = 7100
ID = 7100
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


;==========< SCRATCH HEAD INTRO >==========
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


;==========< CvS YURI INTRO >==========
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


;==========< INTRO vs RYU >==========
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


;==========< INTRO vs other RYUs >==========
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


;==========< INTRO vs CUTE CHARS >==========
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


;==========< INTRO vs P.O. SAKURA >==========
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


;==========< TURNS INTRO >==========
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
anim = 7102
ID = 7102
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


;==========< WIN POSE DECIDER >==========
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


;==========< WIN 1 >==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
[State 181, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 4
channel = 0
[State 181, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN 2 >==========
[Statedef 182]
type = S
anim = 182
ctrl = 0
[State 182, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN 3 >==========
[Statedef 183]
type = S
anim = 183
ctrl = 0
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


;==========< WIN 4 >==========
[Statedef 184]
type = S
anim = 184
ctrl = 0
[State 184, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 7
channel = 0
[State 184, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN 5 >==========
[Statedef 185]
type = S
anim = 185
ctrl = 0
[State 185, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN 6 >==========
[Statedef 186]
type = S
anim = 186
ctrl = 0
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


;==========< WIN by PERFECT >==========
[Statedef 188]
type = S
anim = 188
ctrl = 0
[State 188, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 20
channel = 0
[State 188, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN KEI >==========
[Statedef 187]
type = S
ctrl = 0
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


;==========< WIN by S.G.S. >==========
[Statedef 4002]
type = S
sprpriority = -4
anim = 4002

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


;==========< CONTINUE? >==========
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==========< FALL RECOVERY >==========
[Statedef 5200]
type = A
movetype = H
physics = N
[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 7100
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
value = 3, 7
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


;==========< RECOVERY ROLL >==========
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


;==========< TARGET SAFE FALL >==========
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


;===========================================================================
;===============================< -2 STATES >=================================
;===========================================================================
[Statedef -2]

[State -2, Mode]
type = varset
trigger1 = !var(1)
var(1) = ifelse((palno = [7, 12]) && palno != 9, 2, 1)

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

[State -2, Counter FX]
type = helper
trigger1 = !numhelper(7400) && var(29)
trigger1 = movehit = 1 && numtarget && !(hitdefattr = SCA, AT)
helpertype = normal
stateno = 7400
ID = 7400
name = "Counter"
postype = left
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
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


;===========================================================================
;===============================< -3 STATES >=================================
;===========================================================================
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

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

[State -3, ExSnd]
type = playsnd
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
value = 7, 5
ignorehitpause = 1
[State -3, ExShadow]
type = afterimage
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
time = 2
timegap = 1
framegap = 1
length = 8
palbright = 32, 32, 0
palcontrast = 128, 128, 128
paladd = -10, -10, -10
palmul = 1.1, 1, 0.5
trans = add
ignorehitpause = 1
[State -3, ExFlash]
type = palfx
trigger1 = (stateno = [1000, 2999]) && movetype = A && var(10) = 4
trigger1 = (anim != [1103, 1104]) && (anim != [43, 48])
time = 1
add = 32 + ceil(sin(gametime / 1.5) * 32), 32 + ceil(sin(gametime / 1.5) * 32), 0
mul = 300, 300, 200
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

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = var(20) && !numhelper(7600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(3)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(3)
trigger4 = numhelper(1025)
trigger4 = helper(1025), var(3)
trigger5 = numhelper(1035)
trigger5 = helper(1035), var(3)
trigger6 = numhelper(1475)
trigger6 = helper(1475), var(3)
trigger7 = stateno = 810 && (animelemtime(5) = [0, 1])
trigger8 = stateno = 820 && (animelemtime(2) = [0, 1])
trigger9 = stateno = 823 && (animelemtime(4) = [0, 1])
trigger10 = stateno = 830 && (animelemtime(16) = [0, 1])
trigger11 = stateno = 860 && (animelemtime(5) = [0, 1])
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

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(7600)
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = 1195 || (stateno = [3000, 4999]))
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(3)
trigger3 = numhelper(3025)
trigger3 = helper(3025), var(3)
trigger4 = numhelper(4305)
trigger4 = helper(4305), var(3)
trigger5 = stateno = 4001 && animelemtime(23) >= 0
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
