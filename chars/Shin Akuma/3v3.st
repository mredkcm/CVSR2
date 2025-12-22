; ADD004 BASIC PIEs ReBuilded CNS (20/01/2016)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; ________________________________________
;| Gouki by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
value = 7, 3

[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 31, -69
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
value = 7, 3

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 25, -22
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
value = 7, 3

[State 702, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 40, -66
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 702, asserts]
type = assertspecial
trigger1 = 1
flag = noairguard
[State 702, Ctrl]
type = ctrlset
trigger1 = time > 10
value = 1


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
value = 4, 13
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
value = ifelse((command = "x" || command = "y" || command = "z"), ifelse(var(1), 213, 210), 220)
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
value = 3, ifelse(random < (250 * (AIlevel ** 2 / 64.0)), 0, ifelse(random < 333, 1, ifelse(random < (250 * (AIlevel ** 2 / 64.0)), 3, 4)))
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
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
value = 3, 5
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

[State 740, Aura]
type = helper
trigger1 = anim = 740 && animelemtime(5) >= 0 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
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
value = 4, 10
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
poweradd = -1000
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
value = 4, 10
channel = 0
[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 16, -79
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
anim = ifelse(statetype = A, 762, 760)
ctrl = 0
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)
poweradd = -1000
[State 760, Stop]
type = posfreeze
trigger1 = anim = 762
value = 1

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4, 11
channel = 0
[State 760, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7260
ID = 7260
postype = p1
pos = ifelse((anim = 760), -2, ifelse((anim = 762), -5, -8)), ifelse((anim = 760), -62, ifelse((anim = 762), -77, -43))
ownpal = 1
size.xscale = 1
size.yscale = 1
persistent = 0
supermovetime = 9999
[State 760, superchargepause]
type = superpause
trigger1 = !time
time = 30
anim = -1
sound = s7, 2
darken = 0
movetime = 30 * (anim != 762)

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 760, Var]
type = varset
trigger1 = (anim = [760, 761]) && !animtime
trigger2 = anim = 762 && !time
var(20) = 180

[State 760, NHB]
type = nothitby
trigger1 = (anim = [760, 761])
trigger2 = anim = 762 && time <= 1
time = 8
value = SCA

[State 760, Shadows]
type = afterimage
trigger1 = (anim = [760, 761]) && time = 30
trigger2 = anim = 762 && time = 1
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
trigger1 = anim = 762 && !animtime
value = 41
elem = 6

[State 760, Type]
type = statetypeset
trigger1 = anim = 41
statetype = A
physics = A
[State 760, Ctrl]
type = ctrlset
trigger1 = anim = 41
value = 1

[State 760, End]
type = changestate
trigger1 = (anim = [760, 761]) && !animtime
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
trigger1 = anim != var(1) && anim != 5
trigger2 = anim = 5 && !animtime
value = var(1)

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
x = const(velocity.walk.fwd.x) * ifElse(var(1) = 1, 1.2, 1)
[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x) * ifElse(var(1) = 1, 1.25, 1)

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
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = ifelse(!sysvar(1), 1.15, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3 && sysvar(1)
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel]
type = velset
trigger1 = !animtime && prevstateno = 100 && sysvar(1) = 1
trigger1 = var(9) := 3
x = const(velocity.runjump.fwd.x)

[State 40, VelMul]
type = VelMul
trigger1 = !AnimTime && var(1)
x = ifElse(var(1) = 1, 1.010665,1)
y = ifElse(var(1) = 1, 1.010665,1)

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

[State 52, Stop]
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
trigger1 = !time && (prevstateno = 222 || prevstateno = 1301)
value = 48
[State 52, anim283]
type = changeanim
trigger1 = !time && prevstateno = 282
value = 283
[State 52, anim1051]
type = changeanim
trigger1 = !time && (prevstateno = [1050, 1060])
value = 1051
[State 52, anim1102]
type = changeanim
trigger1 = !time && (prevstateno = [1100, 1110]) ;|| prevstateno = 3100 || prevstateno = 3140)
value = ifelse(var(10)>2,1104,ifelse(var(10)=2, 1103,1102))
[State 52, anim1103]
type = changeanim
trigger1 = !time && prevstateno = 3100
value = 3101
[State 52, anim1207]
type = changeanim
trigger1 = !time && (prevstateno = 1200 || prevstateno = 1250)
value = 1207
[State 52, anim1208]
type = changeanim
trigger1 = !time && (prevstateno = 1302)
value = 1208
[State 52, anim1215]
type = changeanim
trigger1 = !time && (prevstateno = 1210 ||prevstateno = 1260)
value = 1215
[State 52, anim3051]
type = changeanim
trigger1 = !time && (prevstateno = 3050 || prevstateno = 3070)
value = 3051
[State 52, anim3206]
type = changeanim
trigger1 = !time && (prevstateno = [3200,3250])
value = 3210

[State 52, VarSet]
type = VarSet
trigger1 = !time
var(23) = (prevstateno = [1000, 2999])
ignorehitpause = 1

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 52, Dust]
type = explod
trigger1 = !time
anim = 7104
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
trigger1 = prevstateno < 1000
trigger2 = (time>=6 && var(10)<2); || (time>=6 && var(10)=4))
trigger2 = prevstateno = [1200,1250]
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
movetype = I
physics = S
velset = 0, 0
anim = 100
ctrl = 0
sprpriority = 1
[State 100, Assert]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 100, Vel]
type = velset
trigger1 = anim = 100
x = const(velocity.run.fwd.x) + var(1)

[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 3 || animelem = 6)
value = 0, 100
[State 100, change]
type = changeanim
triggerall = time > 7 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && (p2movetype = A || p2dist x < 80)
value = 101
persistent = 0
[State 100, Snd]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0
[State 100, Jump]
type = changestate
trigger1 = !AILevel && command = "holdup"
value = 40
[State 100, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1


;====< FORWARD DASH >==
[Statedef 102]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1
[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = -1.33 * const(velocity.run.back.x) * ifelse(var(1) = 1, 1.3111, 1)
y = const(velocity.run.back.y)
[State 102, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 102, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 102, End]
type = changestate
triggerall = (animelemtime(2) > 4) && (animelemtime(3) < 0)
trigger1 = !AIlevel && command = "holdfwd"
trigger2 = AIlevel && p2dist x >= 80
value = 100
[State 102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< BACK DASH >==
[Statedef 105]
type = A
movetype = I
physics = S
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)* ifElse(var(1) = 1, 1.205, 1)
y = const(velocity.run.back.y)* ifElse(var(1) = 1, 1.205, 1)

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 105, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 105, End]
type = changestate
trigger1 = !animtime
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
[State AI fix]
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
anim = 7104
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
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype != C)
value = 130
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
;===
;[State 150, ChangeState]
;type = ChangeState
;trigger1 = (HitShakeOver) && (Command = "holdback")
;value = 151 + 2*(Command = "holddown")

;[State 150, ChangeState]
;type = ChangeState
;trigger1 = (HitShakeOver) && (Command != "holdback")
;value = 10161 + 2*(Command = "holddown")

;[State 150, ChangeState]
;type = ChangeState
;trigger1 = (Command != "holdback")
;value = 10160
;==
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
;=
;[State 150, VarSet]
;type = VarSet
;trigger1 = Time = 0
;var(23) = 20

;[State 150, ForceFeedBack]
;type = ForceFeedback
;trigger1 = (!Time)
;waveform = Square
;time = 3
;===
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
;====
;[State 151, ChangeState]
;type = ChangeState
;trigger1 = Time >= GetHitVar(hittime)
;value = 130
;ctrl = 1
;====
[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1
;====
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

;---SF3 GUARD SYSTEM---
[Statedef 10160]
type = S
movetype = H
physics = N
velset = 0,0

[State 10160, NotHitBy]
type= NotHitBy
trigger1 = (!Time)
value= SCA
time= 1

[State 10160, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = (IfElse((EnemyNear, Pos Y < 0),160,150))
persistent = (IfElse((EnemyNear, Pos Y < 0),0,1))

[State 10160, ChangeState]
type = ChangeState
trigger1 = (HitShakeOver) && (Command = "holdback")
value = 151 + 2*(Command = "holddown")

[State 10160, ChangeState]
type = ChangeState
trigger1 = (HitShakeOver) && (Command != "holdback")
value = 10161 + 2*(Command = "holddown")

[State 10160, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = S) && (Command = "holddown")
statetype = C
physics = C

[State 10160, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = C) && (Command != "holddown")
statetype = S
physics = S

[State 10160, ForceFeedBack]
type = ForceFeedback
trigger1 = (!Time)
waveform = Square
time = 3
;---------------------------------------------------------------------------
;Stand GuardHit (Knocked Back)
[Statedef 10161]
type = S
movetype = H
physics = S

[State 10161, NotHitBy]
type= NotHitBy
trigger1 = (!Time)
value= SCA
time= 1

[State 10161, ChangeAnim]
type= ChangeAnim
trigger1 = (!Time) && (Anim != 160)
value= 150

[State 10161, HitVelSet]
type = HitVelSet
trigger1 = (!Time)
x = 1

[State 10161, VelSet]
type = VelSet
trigger1 = (Time = GetHitVar(SlideTime)) || (Time >= GetHitVar(HitTime))
x = 0

[State 10161, CtrlSet]
type = CtrlSet
trigger1 = (Time = GetHitVar(CtrlTime))
value = 1

[State 10161, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = S) && (Command = "holddown")
statetype = C
physics = C

[State 10161, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = C) && (Command != "holddown")
statetype = S
physics = S

[State 10161, ChangeState]
type = ChangeState
trigger1 = Time >= GetHitVar(hittime)
value = 130
ctrl = 1

;---------------------------------------------------------------------------
;Crouch GuardHit (Shaking)
[Statedef 10162]
type = C
movetype = H
physics = N
velset = 0,0

[State 10162, NotHitBy]
type= NotHitBy
trigger1 = (!Time)
value= SCA
time= 1

[State 10162, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 151

[State 10162, ChangeState]
type = ChangeState
trigger1 = (HitShakeOver) && (Command = "holdback")
value = 151 + 2*(Command = "holddown")

[State 10162, ChangeState]
type = ChangeState
trigger1 = (HitShakeOver) && (Command != "holdback")
value = 10161 + 2*(Command = "holddown")

[State 10162, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = S) && (Command = "holddown")
statetype = C
physics = C

[State 10162, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = C) && (Command != "holddown")
statetype = S
physics = S

[State 10162, ForceFeedBack]
type = ForceFeedback
trigger1 = (!Time)
waveform = Square
time = 4

;---------------------------------------------------------------------------
;Crouch GuardHit2 (Knocked Back)
[Statedef 10163]
type = C
movetype = H
physics = C
anim = 151

[State 10163, NotHitBy]
type = NotHitBy
trigger1 = (!Time)
value= SCA
time = 1

[State 10163, HitVelSet]
type = HitVelSet
trigger1 = (!Time)
x = 1

[State 10163, VelSet]
type = VelSet
trigger1 = (Time = GetHitVar(SlideTime)) || (Time >= GetHitVar(HitTime))
x = 0

[State 10163, CtrlSet]
type = CtrlSet
trigger1 = (Time = GetHitVar(CtrlTime))
value = 1

[State 10163, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = S) && (Command = "holddown")
statetype = C
physics = C

[State 10163, StateTypeSet]
type = StateTypeSet
trigger1 = (StateType = C) && (Command != "holddown")
statetype = S
physics = S

[State 10163, ChangeState]
type = ChangeState
trigger1 = (Time >= GetHitVar(HitTime))
value = 131
ctrl = 1

;---------------------------------------------------------------------------
;Air Guard Hit
[Statedef 10164]
type = A
movetype = H
physics = N
velset = 0,0

[State 10164, NotHitBy]
type = NotHitBy
trigger1 = (!Time)
value = SCA
time = 1

[State 10164, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 152

[State 10164, ChangeState]
type = ChangeState
trigger1 = (HitShakeOver)
value = (IfElse((Command = "holdback"),155,165))

[State 10164ForceFeedBack]
type = ForceFeedback
trigger1 = (!Time)
waveform = Square
time = 4

;---------------------------------------------------------------------------
;Air Guard Hit
[Statedef 10165]
type = A
movetype = H
physics = N
anim = 152

[State 10165, NotHitBy]
type = NotHitBy
trigger1 = (!Time)
value = SCA
time = 1

[State 10165, HitVelSet]
type = HitVelSet
trigger1 = (!Time)
x = 1
y = 1

[State 10165, VelAdd]
type = VelAdd
trigger1 = 1
y = Const(Movement.yaccel)

[State 10165, CtrlSet]
type = CtrlSet
trigger1 = (Time = GetHitVar(CtrlTime))
value = 1

[State 10165, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (Pos Y >= 0) && (Vel Y > 0)

[State 10165, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 10165 ,PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 10165, ChangeState]
type = ChangeState
trigger1 = sysvar(0)
trigger1 = (Command != "holdback") && (InGuardDist)
value = 52

[State 10165, ChangeState]
type = ChangeState
trigger1 = sysvar(0)
value = 130

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
trigger1 = animelem = 4 || animelem = 5
x = ifelse((animelem = 4), -12, -24)
[State 5131, Snd]
type = playsnd
trigger1 = !time
trigger2 = animelem = 5
value = 0, 52
[State 5131, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7102
sprpriority = -5
postype = p1
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)



;==< TAUNT >==
[Statedef 195]
type = S
movetype = A
physics = S
anim = ifelse(var(1), 197, 195)
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 195, Hit]
type = hitdef
trigger1 = var(1)
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 5
ID = 195
attr = S, SA
damage = ceil(ifelse(fvar(12) * 10 < 7, 7, fvar(12) * 10)), 0
animtype = Back
fall.animtype = Back
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
;sparkno = s7020 + (random % 8)
;guard.sparkno = s7001
;sparkxy = -10, -70
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -60
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 18
ground.hittime = 18
air.hittime = 18
down.hittime = 18
ground.velocity = -6, -12
guard.velocity = -10.52
air.type = Low
air.velocity = -6, -12
down.velocity = -6, -12
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 9
envshake.freq = 60
envshake.ampl = 2
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
yaccel = 0.6
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
forcenofall = !var(20)

[State 195, flames]
type = helper
triggerall = var(1)
triggerall = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 195, Aura]
type = helper
trigger1 = var(1)
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1
[State 195, Kanji]
type = helper
trigger1 = var(1)
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = !var(1)
trigger1 = animelem = 3
value = 3, 3
channel = 0
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = var(1)
trigger1 = animelem = 5
value = 4, 10
channel = 0
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1
[State 195, Dust]
type = explod
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 195, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 195, Shake]
type = envshake
trigger1 = animelemtime(5) >= 0 && animelemtime(5) <= 20
trigger1 = !(animelemtime(5) % 5)
time = 5
freq = 120
ampl = 6 -ceil(animelemtime(5) * 0.25)

[State 195, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
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
[State 170, Dust]
type = explod
trigger1 = animelem = 2
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -6, 0
ownpal = 1
scale = 0.5, 0.5
[State 170, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52


;==< DRAWGAME (Time over) >==
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0
[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 175, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -5, 6
ownpal = 1
[State 175, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4


;=<PRE INTRO>===
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0
[State 190, specialintrounavailable]
type = varset
trigger1 = !time
var(0) = 0

[State 190, intro vs Vega]
type = changestate
triggerall = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = name = "Shin Gouki"
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Vega"
trigger2 = enemy, authorname = "Froz" && enemy, name = "Vega"
trigger2 = enemy, var(40) != 1
value = 350

[State 190, vs Evil Ryu]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = var(0) := 2
trigger1 = (enemy, var(1) = [2, 3])
value = 192
[State 190, vsHaohmaru]
type = changestate
triggerall = numenemy
triggerall = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, name = "Cvshaohmaru" && enemy, authorname = "Z Sabre User"
trigger2 = enemy, name = "HaohmaruMG" && enemy, authorname = "Master Gouken"
trigger3 = enemy, name = "cvshaohmaru" && enemy, authorname = "Warusaki3"
value = 191
[State 190, vs Adon]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Sepp" && enemy, name = "Adon"
value = 193

[State 190, vegaexists]
type = varset
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "cvsgouki" && enemy, authorname = "Warusaki3"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname = "Gargoyle")
trigger4 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger5 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger8 = enemy, name = "Cammy" && enemy, authorname = "Phantom.of.the.Server"
trigger9 = enemy, name = "Sky Chase" && enemy, authorname = "Phantom.of.the.Server"
trigger10 = enemy, authorname = "Froz" && enemy, name = "Vega"
var(0) = 5

[State 5900, Shin vs Nash]
type = changestate
trigger1 = numenemy && var(0) != 5 && var(1)
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, name = "Nash" && enemy, authorname = "Phantom.of.the.Server"
value = 188

[State 5900, Normal vs Nash]
type = changestate
trigger1 = numenemy && var(0) != 5 && !var(1)
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, name = "Nash" && enemy, authorname = "Phantom.of.the.Server"
value = 178

[State 190, killvega]
type = changestate
trigger1 = !time
trigger1 = !var(1)
trigger1 = var(0) != 2 && var(0) != 5 && !numpartner && numenemy && random < (500 * (AIlevel ** 2 / 64.0))
value = 178

[State 190, shinkillvega]
type = changestate
trigger1 = !time
trigger1 = var(1)
trigger1 = var(0) != 2 && var(0) != 5 && !numpartner && numenemy && random < (250 * (AIlevel ** 2 / 64.0))
value = 188

[State 190, intro]
type = changestate
trigger1 = var(1) = 0
trigger1 = ifelse(var(0) = 2, time >= 1, 1)
value = ifelse(random < 500, 182, 181)

[State 190, intro]
type = changestate
trigger1 = var(1) = 1
trigger1 = ifelse(var(0) = 2, time >= 1, 1)
value = ifelse(random < 500, 187, 181)

;==< INTRO 1 >==
[Statedef 182]
type = S
anim = 182
sprpriority = -1
[State 182, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 182, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 182, Aura]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 182, Kanji]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
[State 182, Snd]
type = playsnd
trigger1 = animelem = 7
value = 3, 5
channel = 0
[State 182, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 4

[State 182, Dust]
type = explod
trigger1 = animelem = 7
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
[State 182, Dust]
type = explod
trigger1 = animelem = 7
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1

[State 182, Shake]
type = envshake
trigger1 = animelemtime(7) >= 0 && animelemtime(26) < 0 && !(animelemtime(7) % 12)
time = 12
freq = 120
ampl = 4
[State 182, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO SHIN GOUKI >==
[Statedef 187]
type = S
anim = 187
sprpriority = -1
[State 187, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 187, Spr]
type = sprpriority
trigger1 = animelemtime(8) >= 0
value = 0

[State 187, Kanji]
type = explod
trigger1 = !time
anim = 6015 + (facing = -1)
ID = 6015
sprpriority = 0
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1

[State 187, Snd]
type = playsnd
trigger1 = !time
value = 5, 11
[State 187, hadou]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 0
postype = p1
pos = 14, -72
removetime = 260
removeongethit = 1
ownpal = 1
[State 187, grow]
type = modifyexplod
trigger1 = time < 40
ID = 6020
scale = (0.025 * time), (0.025 * time)
[State 187, normal]
type = modifyexplod
trigger1 = time >= 40 && time <= 120
ID = 6020
scale = 1, 1
[State 187, Shrink]
type = modifyexplod
trigger1 = time > 120 && time <= 280
ID = 6020
scale = 1 -(0.0063 * (time -120)), 1 -(0.0063 * (time -120))
[State 187, FX]
type = helper
trigger1 = time > 120 && time <= 220
trigger1 = !(time % 4) && numhelper(6021) < 12
helpertype = normal
stateno = 6021
ID = 6021
name = "Red Particle"
postype = p1
;pos = ifelse(random < (250 * (AIlevel ** 2 / 64.0)), -160, ifelse(random < 333, -80, ifelse(random < 500, 80, 160))), -75 -(random % 200)
pos = 160 -(random % 320), -75 -(random % 200)
size.xscale = ifelse(random < 500, 0.5, -.5)
size.yscale = ifelse(random < 500, 0.5, -.5)
ownpal = 1

[State 187, Dust]
type = explod
trigger1 = time > 120 && time <= 240
trigger1 = ifelse(animelemtime(4) >= 0, !(time % 12), !(time % 9))
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = ifelse(animelemtime(4) >= 0, 16, 20), 0
ownpal = 1
scale = 0.75, 0.75

[State 187, Snd]
type = playsnd
trigger1 = time = 100
value = 5, 12
channel = 4
loop = 1
[State 187, Snd]
type = stopsnd
trigger1 = time >= 260
channel = 4

[State 187, Snd]
type = playsnd
trigger1 = time = 200
value = 4, 7
channel = 0
[State 187, Snd]
type = playsnd
trigger1 = animelem = 11
value = 5, 4
[State 182, Dust]
type = explod
trigger1 = animelem = 11
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
[State 182, Dust]
type = explod
trigger1 = animelem = 11
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1
[State 187, Shake]
type = envshake
trigger1 = animelem = 11
time = 8
freq = 120
ampl = 4
[State 187, Shake]
type = envshake
trigger1 = time > 120 && time <= 210 && !(time % 12)
time = 12
freq = 120
ampl = ifelse(animelemtime(4) >= 0, 3, 4)
[State 187, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO 3 >==
[Statedef 181]
type = S
anim = 181
sprpriority = -1
[State 181, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 181, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0
[State 4001, Kanji]
type = explod
trigger1 = var(1)!= 1
trigger1 = !time
anim = 7700
ID = 7700
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 3, 30),-19
bindtime = -1
removeongethit = 1
ownpal = 1
scale = 0.75,0.8
[State 181, Kanji]
type = explod
trigger1 = var(1) = 1
trigger1 = !time
anim = 6010
ID = 6010
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
[State 181, Snd]
type = playsnd
trigger1 = time = 15
value = 4, 3
channel = 0
[State 181, End]
type = changestate
trigger1 = !animtime
value = 0


;====< SGS INTRO >=
[Statedef 178]
type = A
physics = N
movetype = I
anim = 178
ctrl = 0
sprpriority = 0
[State 188, intro]
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
[State 192, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 188, vega]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6150
ID = 6150
name = "Vega"
postype = p1
pos = 20, -ceil(pos y)
;pos = 15, -ceil(pos y)
size.shadowoffset = 6
ownpal = 1

[State 188, palfx]
type = palfx
trigger1 = time <= 151
add = -255, -255, -255
time = 1
[State 188, palfx]
type = palfx
trigger1 = time <= 151
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7
[State 192, Vel]
type = posset
trigger1 = !time
x = 240 * facing
[State 192, Vel]
type = velset
trigger1 = time = 151
x = -6
[State 192, Snd]
type = playsnd
trigger1 = time = 151
value = 5, 6
[State 4001, grabsound]
type = playsnd
trigger1 = time = 194
value = 0, 800
channel = 1
[State 4001, Snd]
type = playsnd
trigger1 = time = 194
value = 5, 8
channel = 2
[State 192, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && (helper(6150), rootdist x <= 25);time = 190
value = 178
elem = 2
[State 192, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 10
channel = 0
[State 192, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0
[State 192, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -26 * facing

[State 192, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80
[State 192, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0
[State 192, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay

[State 192, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 89 && animelemtime(3) < 0
value = 178
elem = 3

[State 192, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 7) = 1
value = 2, 3
channel = 2
[State 192, HitSound]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 2, 10
channel = 2
[State 192, HitSound]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 7, 7
channel = 3
[State 368, Hit Sparks]
type = Helper
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
helperType = Normal
stateNo = 8015
ID = 8001
name = "Spark"
sprPriority = 5
posType = p1
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300
[State 192, Shake]
type = envshake
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
time = 2
freq = 120
ampl = -3

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(3) = 20
value =  4, 9
channel = 0

[State 4001, Kanji]
type = explod
trigger1 = animelem = 3
anim = 7750
ID = 7750
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 3, 30),-19
bindtime = -1
removeongethit = 1
ownpal = 1
scale = 0.75,0.8

[State 192, Vel]
type = posset
trigger1 = animelemtime(3) >= 0
x = ceil(helper(7650), pos x);-70 * facing

[State 188, End]
type = changestate
trigger1 = !animtime
value = 0

;====< MISOGI INTRO >=
[Statedef 188]
type = A
physics = N
movetype = I
anim = 188
ctrl = 0
sprpriority = -1
[State 188, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 188, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0
[State 188, vega]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6100
ID = 6100
name = "Vega"
postype = p1
pos = 20, -ceil(pos y)
;pos = 15, -ceil(pos y)
size.shadowoffset = 6
ownpal = 1
[State 188, palfx]
type = palfx
trigger1 = animelemtime(2) < 0
add = -255, -255, -255
time = 1
[State 188, palfx]
type = palfx
trigger1 = animelem = 2
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7
[State 188, Pos]
type = posadd
trigger1 = !time
y = -240
[State 188, Vel]
type = velset
trigger1 = animelem = 2
y = 20
[State 188, Accel]
type = gravity
trigger1 = animelemtime(2) > 0
[State 188, Anim]
type = changeanim
trigger1 = time && animelemtime(5) < 0 && pos y >= -5
value = 188
elem = 5
persistent = 0
[State 188, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0
[State 188, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0
[State 188, Shake]
type = envshake
trigger1 = animelem = 5
time = 30
ampl = 12
freq = 120
[State 188, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 10
[State 188, Dust]
type = explod
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
ownpal = 1
[State 188, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1
[State 188, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 10
channel = 0
[State 188, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs EVIL RYU >==
[Statedef 192]
type = S
physics = N
anim = 192
sprpriority = 0
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
[State 192, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 192, Vel]
type = posset
trigger1 = !time
x = -240 * facing
[State 192, Vel]
type = velset
trigger1 = !time
x = 6
[State 192, Snd]
type = playsnd
trigger1 = !time
value = 5, 6

[State 192, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && p2dist x <= 72
value = 192
elem = 2
[State 192, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 10
channel = 0
[State 192, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0
[State 192, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -36 * facing

[State 192, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80
[State 192, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0
[State 192, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay

[State 192, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
value = 2, 0
;[State 368, Sparks]
;type = explod
;trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
;trigger1 = (animelemtime(2) % 8) = 1
;anim = 7001
;ID = 7000
;sprpriority = 5
;postype = p2
;pos = 0, -70
;random = 60, 60
;facing = -1
;ownpal = 1
;ontop = 1
;pausemovetime = 300
;supermovetime = 300
[State 368, Hit Sparks]
type = Helper
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
helperType = Normal
stateNo = 8001
ID = 8001
name = "Spark"
sprPriority = 5
posType = p2
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300
[State 192, Shake]
type = envshake
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
time = 2
freq = 120
ampl = -3

[State 192, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 72 && animelemtime(3) < 0
value = 192
elem = 3
[State 192, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5000, 4
channel = 0

[State 192, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 1
[State 192, lightning]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 7250
ID = 7250
postype = left
pos = 160, -60
ownpal = 1
supermovetime = 999

[State 192, Vel]
type = velset
trigger1 = animelem = 3
x = -6
[State 192, Pos]
type = posset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = ceil(helper(7650), pos x)
[State 192, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = 0
[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs HAOHMARU >==
[Statedef 191]
type = S
anim = 191
sprpriority = -1
[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 191, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0
[State 191, Kanji]
type = explod
trigger1 = !time
anim = 6014
ID = 6014
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
[State 191, Snd]
type = playsnd
trigger1 = time = 180
value = 4, 15
channel = 0
[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==< INTRO vs ADON by Sepp >==
[Statedef 193]
type = S
anim = 193
sprpriority = -1
[State 193, intro]
type = assertspecial
trigger1 = 1
flag = intro
ignorehitpause = 1
[State 193, Kanji]
type = explod
trigger1 = !time
anim = 6010
ID = 6010
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
persistent = 0
[State 193, Snd]
type = playsnd
trigger1 = animelemtime(2) < 0 && time = 15
value = 4, 3
channel = 0
persistent = 0
[State 193, Anim]
type = changeanim
trigger1 = animelemtime(5) > 0 && animelemtime(6) < 0
value = 193
elem = 5
[State 193, Anim]
type = changeanim
trigger1 = animelemtime(6) < 0 && (enemynear, anim = 1220) && (enemynear, vel x > 0) && p2dist x <= 102
value = 193
elem = 6

[State 193, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 14
[State 193, Dust]
type = explod
trigger1 = animelem = 6
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -35
vel = -.5, 0
ownpal = 1

[State 193, Snd]
type = playsnd
trigger1 = animelem = 11
value = 4, 10
channel = 0
[State 193, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
movetype = A
[State 193, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, NA
animtype = Up
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -20, -76
hitsound = s2, 3
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -1, -6
air.type = High
air.velocity = -1, -6
getpower = 0
givepower = 0
envshake.time = 16
envshake.ampl = 4
sprpriority = 1

[State 193, Aura]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 193, Kanji]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
[State 193, Snd]
type = playsnd
trigger1 = animelem = 24
value = 4, 13
channel = 0
[State 193, Snd]
type = playsnd
trigger1 = animelem = 24
value = 5, 4
[State 193, Dust]
type = explod
trigger1 = animelem = 24
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
[State 193, Dust]
type = explod
trigger1 = animelem = 24
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1
[State 193, Shake]
type = envshake
trigger1 = animelem = 24
time = 18
freq = 120
ampl = 4

[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;====< INTRO vs VEGA >=
[Statedef 350]
type = A
physics = N
movetype = I
anim = 350
ctrl = 0
sprpriority = -1
[State 350, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 350, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0
[State 350, palfx]
type = palfx
trigger1 = animelemtime(2) < 0
add = -255, -255, -255
time = 1
[State 350, palfx]
type = palfx
trigger1 = animelem = 2
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7
[State 350, Pos]
type = posadd
trigger1 = !time
y = -240
[State 350, Snd]
type = playsnd
trigger1 = time = 5
value = 4, 7
channel = 0
[State 350, Vel]
type = velset
trigger1 = animelem = 2
y = 20
[State 350, Accel]
type = gravity
trigger1 = animelemtime(2) > 0
[State 350, Anim]
type = changeanim
trigger1 = time && animelemtime(5) < 0 && pos y >= -5
value = 350
elem = 5
persistent = 0
[State 350, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0
[State 350, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0
[State 350, Shake]
type = envshake
trigger1 = animelem = 5
time = 30
ampl = 12
freq = 120
[State 350, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 10
[State 350, Dust]
type = explod
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
ownpal = 1
[State 350, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1
[State 350, End]
type = changestate
trigger1 = !animtime
value = 0


;==< WIN POSE DECIDER >==
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = 1 + (random % 14)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Ryu"
trigger2 = enemy, name = "cvsryu" || enemy, name = "svcryu"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Gen"
trigger2 = enemy, name = "cvsgen" || enemy, name = "MasterGen"
value = 51

[State 180, winSGS / misogi]
type = changestate
trigger1 = prevstateno = 362 || prevstateno = 184
value = prevstateno

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holdx" || command = "holdy" || command = "holdz" || command = "holda" || command = "holdb" || command = "holdc"
value = ifelse((command = "holdz" || command = "holdc"), 189, ifelse((command = "holdy" || command = "holdb"), 185, 186))

[State 180, win]
type = changestate
trigger1 = !time
value = ifelse(random < 333, 185, ifelse(random < 500, 186, 189))


;==< WIN 1 >==
[Statedef 185]
type = S
anim = 185
ctrl = 0
[State 185, Spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = -1
[State 185, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(random < 500, 2, 8)
channel = 0
[State 185, Kanji]
type = explod
trigger1 = var(1)!= 1
trigger1 = animelem = 4
anim = 7710
ID = 7710
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 3, 30),-19
bindtime = -1
removeongethit = 1
ownpal = 1
scale = 0.75,0.8
[State 185, Kanji]
type = explod
trigger1 = var(1) = 1
trigger1 = animelem = 4
anim = 6011
ID = 6011
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

;==< WIN 2 >==
[Statedef 186]
type = S
anim = 186
ctrl = 0
[State 186, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0


;==< WIN 3 >==
[Statedef 189]
type = S
anim = 189
ctrl = 0

[State 189, Aura]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 189, Kanji]
type = helper
trigger1 = var(1)
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 189, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 189, Snd]
type = playsnd
trigger1 = !var(1)
trigger1 = animelem = 4
value = 3, 5
channel = 0

[State 189, Snd]
type = playsnd
trigger1 = var(1)
trigger1 = animelem = 5
value = 4, 13
channel = 0

[State 189, Dust]
type = explod
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1

[State 189, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1

[State 195, Shake]
type = envshake
trigger1 = var(1)
trigger1 = animelemtime(5) >= 0 && animelemtime(5) <= 20
trigger1 = !(animelemtime(5) % 5)
time = 5
freq = 120
ampl = 6 -ceil(animelemtime(5) * 0.25)

[State 365, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
ampl = 4

[State 189, Snd]
type = playsnd
trigger1 = var(1)
trigger1 = animelem = 5
value = 5, 12
loop = 1
persistent = 0


;==< WIN by MISOGI >==
[Statedef 184]
type = S
sprpriority = -5

[State 184, Anim]
type = changeanim
trigger1 = anim != 184
value = 184

[State 184, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 8
channel = 0

[State 184, Kanji]
type = explod
trigger1 = animelem = 6
anim = 6011
ID = 6011
sprpriority = -3
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 184, win]
type = changestate
trigger1 = time >= 30 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

;==< WIN by S.G.S. >==
[Statedef 362]
type = S
sprpriority = -1

[State 183, Safety]
type = removeexplod
trigger1 = 1
ID = 7700

[State 183, Safety]
type = removeexplod
trigger1 = 1
ID = 6013

[State 362, Anim]
type = changeanim
trigger1 = !time && prevstateno = 4001
trigger2 = !time && prevstateno = 4004
value = 183;362

[State 183, Kanji]
type = helper
trigger1 = !time && prevstateno = 4004
helpertype = normal
stateno = 6012
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 27)
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4001, Kanji]
type = explod
trigger1 = !time && prevstateno = 4001
anim = 7701
ID = 7701
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 3, 29),-16
bindtime = -1
removeongethit = 1
ownpal = 1
scale = 0.75,0.8

[State 362, Kanji]
type = helper
trigger1 = !time && prevstateno = 4001 && !numhelper(7610)
trigger2 = !time && prevstateno = 4004 && !numhelper(7610)
helpertype = normal
stateno = 7610
ID = 7610
postype = left
ownpal = 1
persistent = 0

[State 183, Snd]
type = playsnd
trigger1 = time = 10 && prevstateno = 4001
trigger2 = time = 10 && prevstateno = 4004
value = 4, 12
channel = 0

[State 362, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

;====<TURNS INTRO>====
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y > -vel y
value = 6901

;Landing
[StateDef 6901]
type = S
physics = S
anim = 6901
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)

[State 6901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 0, 52
channel = 2

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 7104
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 195, Dust]
type = explod
trigger1 = animelem = 11
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 195, Dust]
type = explod
trigger1 = animelem = 11
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 6901, Voice]
type = PlaySnd
triggerAll = Anim = 6901
trigger1 = AnimElem = 11
value = 3, 3
channel = 0

[State 6901, Stomp]
type = PlaySnd
triggerAll = Anim = 6901
trigger1 = AnimElem = 11
value = 5, 4
channel = 1

[State 182, Aura]
type = helper
trigger1 = var(1)
trigger1 = animelem = 11
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 182, Kanji]
type = helper
trigger1 = var(1)
trigger1 = animelem = 11
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0

[State 6901, Shake]
type = envshake
triggerAll = Anim = 6901
trigger1 = animelemtime(11) >= 0 && animelemtime(11) <= 20
trigger1 = !(animelemtime(10) % 5)
time = 5
freq = 120
ampl = 6 -ceil(animelemtime(11) * 0.25)

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

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
value = 3 + (var(1) = 2) * 10, 0
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
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 3 * (var(1) = 2)
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

;====<K.O.>====
[StateDef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5150

[State 5150, Anim]
type = ChangeAnim
trigger1 = Anim != 171
trigger1 = Enemy, Anim = 184
trigger1 = (Roundstate = 2 || MatchOver) && !(TeamMode = Turns)
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters" && (Enemy, var(40) != 1)
value = 171

[State 5150, SprPriority]
type = SprPriority
trigger1= Anim = 171
value = 3

[State 5150, VelMul]
type = VelMul
trigger1 = 1
x= 0.85

[State 5150, VelSet]
type = VelSet
trigger1 = abs(vel x) < 0.05
x = 0

[State 5150, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;====<AIR HIT TRANSITION>====
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim = [5000,5029]
value = 5035

[State 5035, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5035, Recover]
type = ChangeState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5040

[State 5035, Fall]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050

;===
;===< -2 STATES >=
;===
[Statedef -2]

;#ADD004BASIC PIEs#
;//==
;// add004 supplementary sctrls v1.103
;//==

;// partner jump-out ; ???????
[state 0]
	type=selfstate
	triggerall=!ishelper && numpartner && roundstate=2
	triggerall=(stateno!=[190190,190199]) && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// change ;(??)
	trigger1=sysfvar(4)<1 && movetype!=h && gethitvar(isbound)=0 && (pos y>=0) && (ctrl||(stateno<600&&time<2)) && (playerid(floor(sysfvar(0))),var(48)=11)
	;;---// as partner-asist ;(??)
	trigger2=sysfvar(4)>0 && (movetype!=h||(stateno=[120,149])) && (ctrl||stateno<600)
	;;---// player priority ;(??)
	trigger3=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	value=190190
	ignorehitpause=1

;// edited life & power bar ; ?????
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
	size.air.front=1602150 ;; <<-version
	size.height=0 ;; 1;; <<-powerbar off mode
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	pos=0,88888

;// input players id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;// bk/jd system ; ?????/????D
[state 0]
	type=hitoverride
	trigger1=(numprojid(195502)||numprojid(195503)) && !ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1

;//==
;;>>@Config.Face>>
;; face / portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && roundstate=2 && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	scale=0,0 ;; <- default
	ownpal=1
	bindtime=-1
	removetime=-1
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

[state 0] ;; player is NOT in a custom state 
	type=modifyexplod
	trigger1=numexplod(490600) && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	scale=playerid(floor(sysfvar(0))),fvar(32-(id=playerid(floor(sysfvar(0))),var(15))*10), playerid(floor(sysfvar(0))),fvar(33-(id=playerid(floor(sysfvar(0))),var(15))*10)
	ignorehitpause=1

[state 0]
	type=modifyexplod
	trigger1=numexplod(490600) && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	id=490600
	space=screen
	postype=left
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(30-(id=playerid(floor(sysfvar(0))),var(15))*10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(31-(id=playerid(floor(sysfvar(0))),var(15))*10) -(roundstate!=2||(!alive&&stateno=5150))*88888))
;;(* if the player has been placed in a custom state, the result of "scale" is affected" by the different player's local coordinate space
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(36-(id=playerid(floor(sysfvar(0))),var(15))*10))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(34-(id=playerid(floor(sysfvar(0))),var(15))*10)), floor(playerid(floor(sysfvar(0))),fvar(35-(id=playerid(floor(sysfvar(0))),var(15))*10))
	ignorehitpause=1

;//==
;;>>@Config.Camera>>
;; change camera / ????
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
[state 0]
	type=playerpush
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==
;; optional settings
;//==
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
;;--- dizzy
[state 0]
	type=changestate
	trigger1=stateno=5120 && (animtime=0) && !ishelper && numhelper(403000) ;;<-dizzy birds
	value=190116 ;;<- goto dizzy/stun state
;;--- fadeout when KOed ; KO????
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
[state 0]
	type=posset
	trigger1=stateno=5150 && time>=80 && alive=0 && !ishelper && numpartner && sysvar(1)
	y=(800-partner,pos y) *(((time=[80,150]) && time%10<5) || time>150)

;;--- pos reset debug (for mugen only) ---
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(144)*ifelse(teamside=1,-1,1)

;//==
;//==



[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
trigger1 = (stateno!=[4000,4001])
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
trigger1 = (stateno!=[4000,4001])
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 2, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = ((StateNo != [1200,1260]) && (StateNo != [3200,3250])) || ((StateNo = [1200,1260]) && P2Dist x >= 0) || ((StateNo = [3200,3250]) && P2Dist x >= 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo != [4000,4004])
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Tatsumaki's, Opponent Behind)]
type = Helper
triggerAll = ((StateNo = [1200,1260]) && P2Dist x < 0) || ((StateNo = [3200,3250]) && P2Dist x < 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo != [4000,4004])
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifelse(stateno = 3250, -43,ifElse(P2Dist x >= 0, 0, ifElse(P2Dist x >= var(35), ceil(P2Dist x), var(35)))), var(36)
facing = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(29)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

;[State -2, Counter FX]
;type = helper
;trigger1 = !numhelper(7400) && var(29)
;trigger1 = movehit = 1 && numtarget && !(hitdefattr = SCA, AT)
;helpertype = normal
;stateno = 7400
;ID = 7400
;name = "Counter"
;postype = left
;;pausemovetime = 255
;supermovetime = 255
;ignorehitpause = 1

[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = 3120
var(11) = 1
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

[State -2, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
trigger2 = var(20)>0
var(15) = 0
ignoreHitPause = 1

[State -2, Normal Atk Juggle Count]
type = VarAdd
triggerall = !var(20)
trigger1 = var(27)
trigger1 = (Stateno = [200, 285])
trigger1 = Stateno!= 265
trigger1 = MoveHit = 1
var(15) = 9

[State -2, Tatsumaki Juggle Reset]
type = VarSet
triggerall = NumEnemy = 1 && var(27)
triggerall = !(Enemy, Stateno = [1111310,1111315])
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(27) = 0

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

;[State -2, Modified Juggle Count]
;type = VarAdd
;triggerall = MoveHit = 1 && Numtarget
;trigger1 = stateno = 1100 && var(10) = 1
;var(17) = 1
;
;[State -2, Modified Juggle Count]
;type = VarAdd
;triggerall = MoveHit = 1 && Numtarget
;trigger1 = stateno = 1210 && (anim = 1210 && animelemtime(13)>0)
;var(17) = 2

[State -2, Modified Juggle Count Reset]
type = VarSet
trigger1 = NumEnemy && var(17)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(17) = 0
ignoreHitPause = 1

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
fvar(10) = 0.72 * (10 -ifelse(enemynear, gethitvar(hitcount) >= 10, 10, enemynear, gethitvar(hitcount))) / 10.0
ignorehitpause = 1
[State -2, attackvarbyhitsreset]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H)
trigger2 = !numenemy
fvar(10) = ifelse(var(20), 0.72, 1)
ignorehitpause = 1
[State -2, attackvarbyhits]
type = VarSet
trigger1 = (stateNo = [3000,4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21) || var(23), 0.8, 1.0))
ignoreHitPause = 1
[State -2, dampenervar]
type = varset
trigger1 = 1
fvar(12) = (fvar(10) + (var(29) * 0.2)) * ifelse(!var(1), 1.02, 1.1)
ignorehitpause = 1
;[State -2, dampener]
;type = attackmulset
;trigger1 = 1
;value = fvar(12)
;ignorehitpause = 1

[State -2, Defence Levels]
type = lifeadd
trigger1 = !AIlevel
trigger1 = var(1) = 1
trigger1 = gethitvar(hitcount) = 1 && gethitvar(damage)
value = -ceil(0.125 * gethitvar(damage))
kill = 0
ignorehitpause = 1
[State -2, Defence Levels]
type = defencemulset
trigger1 = !AIlevel
trigger1 = var(1) = 1
value = 1.125 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1

[State -2, VarSet]
type = VarSet
trigger1 = stateno!= 52
trigger1 = !(stateno = [3000,4999])
var(23) = 0
ignorehitpause = 1

[State -2, Assert: nostandguard]
type = AssertSpecial
triggerall = stateno = 52
trigger1 = anim = 1051
trigger2 = (anim = [1102,1104])
trigger3 = (anim = [1207,1208])
trigger4 = anim = 1215
trigger5 = anim = 3051
trigger6 = anim = 3210
flag = nostandguard
flag2 = nocrouchguard
ignoreHitPause = 1

[State -2, Free Juggling]
type = assertspecial
trigger1 = var(20) > 0 || numtarget(3120) || numtarget(3180)
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

[State -2, No Dizzy > : )]
type = selfstate
trigger1 = var(1)
trigger1 = anim = 5300
trigger1 = numenemy && !pos y
trigger1 = enemynear, movetype != A
trigger1 = ((enemy, name = "Catwalk") + (enemy, authorname = "Phantom.of.the.Server")) != 2
value = 0
ctrl = 1

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

[State -2, stopsnd4]
type = stopsnd
trigger1 = prevstateno = 187
trigger2 = roundstate!= 1
channel = 4

[State -2, Dust]
type = explod
trigger1 = enemy, stateno = 1111315 && !numexplod(7107)
vel = 0, 0
anim = 8160;7107
ID = 7107
sprpriority = 5
postype = p2
scale = 0.5, 0.5
pos = 0, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State -2, Dust]
type = explod
trigger1 = enemy, stateno = 1111315 && !numexplod(8150)
vel = 0, 0
anim = 8150
ID = 8150
sprpriority = 5
postype = p2
scale = 0.5, 0.5
pos = 0, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

;[State 805, Impact Dust]
;type = Helper
;trigger1 = var(10) = 2 && numtarget
;trigger1 = target, stateno = 5110 && target, time = 1
;trigger1 = !numhelper(8110)
;trigger1 = movehit && numtarget(1310)
;trigger1 = (target, stateno = 1111310) ;
;trigger1 = (target, movetype = H) && !(target, time); && (target, pos y = 0)
;trigger1 = (enemy, stateno = 1111315) && !numhelper(8110)
;helperType = Normal
;stateNo = 8110
;ID = 8110
;name = "Impact Dust"
;posType = P2
;facing = -1
;pos = 0 ,0
;ownPal = 1

[State -2, KO snd]
type = varset
trigger1 = alive && var(8) > 0
trigger2 = !alive && var(8) < 2
var(8) = ifelse(alive, 0, var(8) + 1)
ignorehitpause = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2), 2, 1) + 2 * (stateno = 5130)
ignorehitpause = 1

[State -2, VelMul]
type = VelMul
trigger1 = prevstateno = 1310
trigger1 = (stateno = 1060  || stateno = 1301)
trigger1 = time = 1
x = ifelse(var(42) && stateno = 1060, 0.40, 0.80)

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Mode = %d Damage = %f Hits = %d Juggle = %d Juggle = %d"
params = AIlevel, var(1), fvar(12), var(13), var(15), var(42)
ignorehitpause = 1
        ; SC = %d HC = %d LC = %d
        ;, var(21), var(22), var(23)
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

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && var(9) = 3
trigger2 = stateno = 710 || stateno = 720
time = 2
timegap = 1
framegap = 3
length = 12
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, ExSnd]
type = playsnd
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4 && stateno!=[1301,1350]
trigger2 = stateno = 1310 && time = 1 && movetype = I && var(10) = 4
value = 7, 8
ignorehitpause = 1
[State -3, ExShadow]
type = afterimage
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4 && stateno!=1310
trigger2 = stateno = 1310 && time = 1 && movetype = I && var(10) = 4
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
trigger2 = stateno = 1310 && movetype = I && var(10) = 4
triggerall = (anim != [1101, 1103]) && anim != 1207
time = 1
add = 32 + ceil(sin(gametime / 1.5) * 32), 32 + ceil(sin(gametime / 1.5) * 32), 0
mul = 300, 300, 200
ignorehitpause = 1

[State -3, Lv1 Shadows]
type = afterimage
trigger1 = stateno = 3000 && anim = 3000 && animelem = 3
trigger2 = stateno = 3050 && animelem = 2
trigger3 = stateno = 3100 && anim = 3100 && animelemtime(1) = 2
trigger4 = stateno = 3200 && anim = 3200 && animelem = 2
trigger5 = stateno = 3250 && anim = 3250 && animelem = 2
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
trigger1 = stateno = 3070 && anim = 3070 && animelem = 2
trigger2 = stateno = 3020 && anim = 3000 && animelem = 3
trigger3 = stateno = 3300 && anim = 3300 && animelem = 2
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv3 Shadows]
type = afterimage
trigger1 = stateno = 192 && time = 1
trigger2 = stateno = 4000 && time = 1
trigger3 = stateno = 4100 && anim = 4100 && time = 63
trigger4 = stateno = 4200 && animelem = 2
trigger5 = stateno = 178 && time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 && var(9) = 3 && vel y < -1
trigger2 = var(20) > 0
trigger3 = stateno = 710 || stateno = 720 || stateno = 1400
trigger4 = (stateno = [1000, 2999]) && var(10) = 4 && (anim != [1101, 1103]) && anim != 1207
trigger5 = (stateno = [3000, 4999]) && (anim != [1101, 1102]) && (anim != [1111, 1112])
trigger6 = stateno = 192 && animelemtime(2) < 0
trigger7 = stateno = 178 && animelemtime(2) < 0
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
trigger1 = p2dist y >= (enemynear, const(size.height) - 30)
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
trigger3 = gethitvar(animtype) = 0 && random < 250
value = 5000 + (var(1) = 2) * 10, ceil(random / 200)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000 + (var(1) = 2) * 10, ceil(random / 200)
channel = 0
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = prevstateno = 700
trigger1 = stateno = 0 && time < 7
flag = nowalk

[State -3, Cancel Reset]
type = varset
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Restriction]
type = VarSet
triggerall = !var(20)
trigger1 = (stateno = 210 && anim = 210)
trigger2 =  stateno = 210 && (anim = 212 && animelemtime(4)>= 0)
trigger3 = (stateno = 220 && (anim = 220 || anim = 223))
trigger4 = stateno = 225 && ((anim = 225 && animelemtime(9)>= 0) || (anim = 226 && animelemtime(5)>= 0) || anim = 227)
trigger5 = stateno = 240 && (anim = 240 && animelemtime(5)>= 0)
trigger6 = stateno = 255 && anim = 255
trigger7 = (stateno = [260,286])
trigger8 = (stateno = [1200,1260])
trigger9 = !var(1) && (stateno = [1300,1330]) && stateno!= 1310
trigger10 = var(1) && (stateno = [1301,1330])
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
triggerall = !var(20)
trigger1 = (StateNo = [1000,1010]) && (AnimElemTime(5) = [1,12])
trigger2 = StateNo = 1020 && (AnimElemTime(10) = [1,8])
trigger3 = StateNo = 1030 && (AnimElemTime(8) = [1,8])
trigger4 = StateNo = 1050 && (AnimElemTime(5) = [1,8])
trigger5 = StateNo = 1060 && (AnimElemTime(6) = [1,8])
var(7) = 1
ignoreHitPause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5130
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
trigger4 = stateno = 805 && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger5 = stateno = 810 && (animelemtime(4) = [0, 1])
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
triggerall = roundstate = 3 && !numhelper(7600) && !numhelper(7610)
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = [3000, 4999]) && stateno != 3701
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(3)
trigger3 = numhelper(3025)
trigger3 = helper(3025), var(3)
trigger4 = numhelper(3045)
trigger4 = helper(3045), var(3)
trigger5 = numhelper(3055)
trigger5 = helper(3055), var(3)
trigger6 = numhelper(3075)
trigger6 = helper(3075), var(3)
trigger7 = numhelper(4205)
trigger8 = numhelper(4206)
helpertype = normal
stateno = 7600 + 0 * (var(0) := stateno)
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

