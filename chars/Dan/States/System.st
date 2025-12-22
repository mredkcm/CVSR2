; ADD004 BASIC PIEs ReBuilded CNS (25/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
pos = ceil(44 * const(size.xscale)), ceil(-160 * const(size.yscale))
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
pos = ceil(39 * const(size.xscale)), ceil(-111 * const(size.yscale))
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
pos = ceil(53 * const(size.xscale)), ceil(-185 * const(size.yscale))
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
value = 4, 3
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
value = ifelse((command = "x" || command = "y" || command = "z"), 210, 225)
[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 210, 225)
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
value = 4, ifelse(random < 500, 1, 17)
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(10) < 0
x = 4
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(10) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 11, 12)
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
value = 4, ifelse(random < 500, 1, 17)
channel = 0
[State 725, Vel]
type = velset
trigger1 = animelemtime(3) >= 0
x = -4
[State 725, Push]
type = playerpush
trigger1 = 1
value = 0
[State 725, HB]
type = hitby
trigger1 = animelemtime(9) < 0
value = SCA, AT
time = 1
[State 725, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 11, 12)
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
trigger1 = command = "holdb" && command = "holdy"
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 10)

[State 740, Snd]
type = playsnd
trigger1 = anim = 740 && time = 8
value = 3, 7
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
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
trigger3 = AIlevel && p2movetype = A
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
value = 4, 13
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
poweradd = -750
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
value = 3, 5
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
stateno = 8350
ID = 8350
postype = p1
pos = ceil(45 * const(size.xscale)), ceil(-160 * const(size.yscale))
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
value = ifelse(AIlevel,1150,ifelse(var(10) = 1, 1160, 255))


;===< CUSTOM COMBO >===
[Statedef 760]
type = U
physics = U
movetype = A
anim = 760 + (statetype = A)
ctrl = 0
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)
poweradd = -1000
[State 760, Stop]
type = posfreeze
trigger1 = anim = 761
value = 1

[State 760, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8400
ID = 8400
postype = p1
pos = ceil((-30 + (anim = 761) * 2) * const(size.xscale)), ceil((-130 -(anim = 761) * 28) * const(size.yscale))
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
movetime = 6

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

[State 900, AfterImage]
type = AfterImage
trigger1= time = 7
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 760, End]
type = changeanim
trigger1 = anim = 761 && !animtime
value = 41
elem = 6

[State 760, Type]
type = statetypeset
trigger1 = anim = 41
physics = A
[State 760, Ctrl]
type = ctrlset
trigger1 = anim = 41
value = 1

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

[State 191, intro]
type = assertspecial
triggerall = (roundstate = 1) && roundno = 1
trigger1 = ifelse(teammode=simul,(enemy(1), stateno != 0) && (enemy(2), stateno != 0),enemy, stateno!=0)
flag = nobardisplay

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5 && anim != 1
trigger2 = anim = 5 && !animtime
value = ifelse(var(1)=2,1,0)

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050

[State 0, Skywalker]
type = changestate
triggerall = pos y < 0
trigger1 = !numenemy
trigger2 = numenemy = 1
trigger2 = (enemy, name = "M-NES Game 1" + enemy, name = "M-NES Game 2" + enemy, name = "M-GB Game 1" + enemy, authorname = "Bane84") < 2
trigger3 = numenemy >= 2
trigger3 = (enemy(0), name = "M-NES Game 1" + enemy(0), name = "M-NES Game 2" + enemy(0), name = "M-GB Game 1" + enemy(0), authorname = "Bane84") < 2
trigger3 = (enemy(1), name = "M-NES Game 1" + enemy(1), name = "M-NES Game 2" + enemy(1), name = "M-GB Game 1" + enemy(1), authorname = "Bane84") < 2
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
trigger1 = var(39) <= 0
x = ifelse(command = "holdfwd", const(velocity.walk.fwd.x), ifelse(command = "holdback", const(velocity.walk.back.x), vel x))
[State 20, Vel]
type = velset
trigger1 = var(39) > 0
x = ifelse(command = "holdfwd", 1.2 * const(velocity.walk.fwd.x), ifelse(command = "holdback", 1.2 * const(velocity.walk.back.x), vel x))
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
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x))) * ifelse(var(39) <= 0, 1, 1.5)
y = ifelse(var(9) = 2, 0.75, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3
x = ifelse(sysvar(1) = 0, const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x))) * ifelse(var(39) <= 0, 1, 1.5)
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
facep2 = var(39)
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
trigger1 = !time && (prevstateno = 105 || prevstateno = 855 || (prevstateno = [1450, 1460]) || prevstateno = 1700)
value = 48
[State 52, anim1102]
type = changeanim
trigger1 = !time && (prevstateno = 1100 || prevstateno = 3100 || prevstateno = 3200)
value = 1102
[State 52, anim1203]
type = changeanim
trigger1 = !time && (prevstateno = 1200 || prevstateno = 1210 || prevstateno = 1250 || prevstateno = 1260)
value = 1203

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
triggerall = !time
trigger1 = prevstateno != [200, 4999]
trigger2 = var(39)
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


;==< RUN >===
[Statedef 100]
type = S
physics = S
anim = 100
ctrl = 1
sprpriority = 1
[State 100, steps]
type = playsnd
trigger1 = !time
value = 0, 105
persistent = 0
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

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
type=playsnd
trigger1= anim=100 && (animelem=2 || animelem=5)
value= 0,ifelse((animelem=2),50,51)

[State 100, steps]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0
[State 100, change]
type = changeanim
triggerall = time >= 8 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && p2dist x < 80
value = 101
persistent = 0
[State 101, Dust]
type = explod
trigger1 = anim = 101 && animelem = 1
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 100, Ctrl]
type = ctrlset
trigger1 = anim = 101 && animelem = 3
value = 1
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

[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)
[State 105, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = A

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
[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
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
value = (enemy, time >= 120 || time >= 120)
[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52
[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
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
type = A
movetype = H
physics = N
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
trigger1 = !time
x = -30
[State 5131, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
statetype = L
physics = C
[State 5131, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 52
[State 5131, Dust]
type = explod
trigger1 = animelem = 4
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
pos = 16, 0
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


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
[State 170, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
facing = 1
[State 170, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
[State 170, Snd]
type = playsnd
trigger1 = !time
value = 5000, 5
channel = 0
[State 170, Vel]
type = velset
trigger1 = animelemtime(6) >= 0
x = -2
[State 170, Dust]
type = explod
trigger1 = animelemtime(6) >= 0 && !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
removetime = -2
scale = 0.5, 0.5
ownpal = 1


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


;==< PALETTE MODE SELECTION >==
[Statedef 5900]
type = S
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted && matchno = 1
value = 0
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted && matchno = 1
fvalue = 0

[State 5900, Mode Change]
type = varset
trigger1 = !roundsexisted
trigger1 = palno = [7,12]
fvar(1) = 1


[State 5900, Character Palette 1 (LP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 1
fvar(0) = 1	;CHANGE THIS LINE
[State 5900, Character Palette 2 (MP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 2
fvar(0) = 2	;CHANGE THIS LINE
[State 5900, Character Palette 3 (HP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 3
fvar(0) = 3	;CHANGE THIS LINE
[State 5900, Character Palette 4 (LK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 4
fvar(0) = 4	;CHANGE THIS LINE
[State 5900, Character Palette 5 (MK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 5
fvar(0) = 5	;CHANGE THIS LINE
[State 5900, Character Palette 6 (HK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 6
fvar(0) = 6	;CHANGE THIS LINE
[State 5900, Character Palette 7 (start + LP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 7
fvar(0) = 7	;CHANGE THIS LINE
[State 5900, Character Palette 8 (start + MP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 8
fvar(0) = 8	;CHANGE THIS LINE
[State 5900, Character Palette 9 (start + HP)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 9
fvar(0) = 9	;CHANGE THIS LINE
[State 5900, Character Palette 10 (start + LK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 10
fvar(0) = 10	;CHANGE THIS LINE
[State 5900, Character Palette 11 (start + MK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 11
fvar(0) = 11	;CHANGE THIS LINE
[State 5900, Character Palette 12 (start + HK)]
type = VarSet
triggerall = !roundsexisted && matchno = 1
trigger1 = PalNo = 12
fvar(0) = 12	;CHANGE THIS LINE

[State 5900, modevar]
type = varset
trigger1 = !roundsexisted
var(1) = 1
[State 5900, End]
type = changestate
trigger1 = !time
value = 5901

;==< INITIALIZE >==
[Statedef 5901]
type = S

[State 5900, Palette]
type = remappal
trigger1 = !roundsexisted && matchno = 1
source = 1, 1
dest = 1, fvar(0)
[State 5900, End]
type = changestate
trigger1 = !time
value = 5902


;==< PREINTRO >==
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, oyaji!!!]
type = changestate
trigger1 = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, name = "Oyaji" && enemy, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = enemy, name = "Sagat"
value = 194
[State 190, vsEvilDan];Evil Dan by ilcane87
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, name = "Evil Dan" && enemy, authorname = "ilcane87"
trigger2 = enemy, name = "Dan" && enemy, authorname = "Phantom.of.the.Server" && enemy, selfanimexist(4201533)
trigger2 = (var(1) = 2 && enemy, var(1) != 2) || (var(1) != 2 && enemy, var(1) = 2)
value = 196
[State 190, Intro vs Joe Higashi]
type = changestate
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "Jmorphman" && enemy, name = "Joe Higashi"
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsjoe"
value = 199
[State 190, vs CvS Yuri]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, authorname = "QuickFist" && enemy, name = "Yuri Sakazaki"
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
value = 198
[State 5900, replayintro]
type = changestate
triggerall = numenemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = enemy, name = "Oyaji" && enemy, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = enemy, name = "Sagat"
trigger3 = enemy, name = "Evil Dan" && enemy, authorname = "ilcane87"
trigger4 = enemy, authorname = "QuickFist" && enemy, name = "Yuri Sakazaki"
trigger5 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
value = 190

[State 5900, turnsintro]
type = changestate
trigger1 = !time && teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 193

[State 190, intro]
type = changestate
trigger1 = (command = "holdfwd" && command = "holdback") || random < 100
value = 350
[State 190, intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 191, ifelse(random < 500, 193, 197))


;==< INTRO 1 >==
[Statedef 191]
type = S
physics = N
anim = 191
[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 191, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 191, bound]
type = screenbound
trigger1 = 1
value = 0
[State 191, Pos]
type = posadd
trigger1 = !time
x = -320/Camerazoom
[State 191, Vel]
type = velset
trigger1 = anim = 191
x = 6/camerazoom
[State 191, Dust]
type = explod
trigger1 = anim = 191 && !(time % 5)
anim = 7103
sprpriority = 3
postype = p1
vel = -1, 0
scale = 0.5, 0.5
ownpal = 1
[State 191, Anim]
type = changeanim
trigger1 = time && anim = 191
trigger1 = (helper(7650), rootdist x) > -24.0
value = 192
[State 191, Vel]
type = velset
trigger1 = anim = 192 && animelem = 1
x = (helper(7650), rootdist x) / -4.0
[State 191, Pos]
type = posset
trigger1 = anim = 192 && animelemtime(3) >= 0
x = ceil(helper(7650), pos x)
[State 191, Vel]
type = velset
trigger1 = anim = 192 && animelemtime(3) >= 0
x = 0
[State 191, Snd]
type = playsnd
trigger1 = anim = 192 && animelem = 6
value = 4, ifelse(random < 500, 2, 13)
channel = 0
[State 191, End]
type = changestate
trigger1 = anim = 192 && !animtime
value = 0


;==< INTRO 2 >==
[Statedef 193]
type = A
physics = N
anim = 193
[State 193, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 193, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 193, bound]
type = screenbound
trigger1 = 1
value = 0
[State 193, Pos]
type = posadd
trigger1 = !time
x = -160/camerazoom
[State 193, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -50.0
y = -9
[State 193, Accel]
type = veladd
trigger1 = anim = 193
y = 0.35
[State 193, Snd]
type = playsnd
trigger1 = time = 5
value = 4, 17
channel = 0
[State 193, Anim]
type = changeanim
trigger1 = time && anim = 193 && vel y > 0 && pos y >= -5
value = 48
[State 193, Pos]
type = posset
trigger1 = anim = 48
x = ceil(helper(7650), pos x)
y = 0
[State 193, Vel]
type = velset
trigger1 = anim = 48
x = 0
y = 0
[State 193, Snd]
type = playsnd
trigger1 = anim = 48 && animelem = 1
value = 0, 52
[State 193, Dust]
type = explod
trigger1 = anim = 48 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 193, End]
type = changestate
trigger1 = anim = 48 && !animtime
value = 0


;==< INTRO 3 >==
[Statedef 197]
type = S
physics = N
anim = 197
[State 197, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 197, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 5
channel = 0
[State 197, Snd]
type = playsnd
trigger1 = animelem = 14
value = 4, 22
channel = 0
[State 197, End]
type = changestate
trigger1 = !animtime
value = 0



;==< INTRO X >==
[Statedef 350]
type = A
physics = N
anim = 350
[State 350, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 350, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 350, bound]
type = screenbound
trigger1 = 1
value = 0

[State 350, Pos]
type = posset
trigger1 = !time
x = 180 * facing
[State 350, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -47.0
y = -12
[State 350, Accel]
type = veladd
trigger1 = anim = 350
y = 0.5
[State 350, Snd]
type = playsnd
trigger1 = time = 5
value = 4, 37

[State 350, Anim]
type = changeanim
trigger1 = time && anim = 350 && vel y > 0 && pos y >= -5
value = 351
[State 350, Pos]
type = posset
trigger1 = anim = 351
x = ceil(helper(7650), pos x)
y = 0
[State 350, Vel]
type = velset
trigger1 = anim = 351
x = 0
y = 0

[State 350, sandal]
type = helper
trigger1 = anim = 351 && animelem = 1
helpertype = normal
stateno = 6005
ID = 6005
name = "Sandal"
postype = p1
pos = ceil(114 * const(size.xscale)), ceil(-44 * const(size.yscale))
ownpal = 1
[State 350, sandal]
type = helper
trigger1 = anim = 351 && animelem = 1
helpertype = normal
stateno = 6005
ID = 6005
name = "Sandal"
postype = p1
pos = ceil(79 * const(size.xscale)), ceil(-88 * const(size.yscale))
ownpal = 1

[State 351, Snd]
type = playsnd
trigger1 = anim = 351 && animelem = 1
value = 5, 6
[State 351, Dust]
type = explod
trigger1 = anim = 351 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 351, Shake]
type = envshake
trigger1 = anim = 351 && animelem = 1
time = 18
freq = 60
ampl = 8

;[State 350, Snd]
;type = playsnd
;trigger1 = anim = 351 && animelem = 1
;value = 5, 7
;[State 350, explosion]
;type = explod
;trigger1 = anim = 351 && animelem = 1
;anim = 4005
;ID = 4005
;sprpriority = 4
;postype = p1
;ownpal = 1
;scale = 0.75, 0.75
;[State 350, explosion]
;type = explod
;trigger1 = anim = 351 && animelem = 1
;anim = 7104
;ID = 7104
;sprpriority = -2
;postype = p1
;ownpal = 1
;scale = 2, 1

[State 350, End]
type = changestate
trigger1 = anim = 351 && !animtime
value = 0


;==< "OYAJI!" INTRO >==
[Statedef 194]
type = A
physics = N
anim = 194
[State 194, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 194, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 21
channel = 0
[State 194, End]
type = changestate
trigger1 = !animtime
value = 0



;==< INTRO vs EVIL DAN >==
[Statedef 196]
type = A
physics = N
anim = 196
[State 196, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 196, Snd]
type = playsnd
trigger1 = time = 5
value = 4, 12
channel = 0
[State 196, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 2
channel = 0
[State 196, End]
type = changestate
trigger1 = !animtime
value = 0


;==< CvS YURI INTRO >==
[Statedef 198]
type = S
physics = N
anim = 198
[State 198, intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay
[State 198, Snd]
type = playsnd
trigger1 = animelem = 24
value = 4, 11
channel = 0
[State 198, Snd]
type = playsnd
trigger1 = animelem = 46
value = 4, 5
channel = 0
[State 198, Snd]
type = playsnd
trigger1 = animelem = 46
value = 5, 10
[State 198, teeth]
type = explod
trigger1 = animelem = 46
anim = 4105
ID = 4105
sprpriority = 2
postype = p1
pos = floor(-9 * const(size.xscale)), floor(-172 * const(size.yscale))
ownpal = 1
scale = 0.5, 0.5
[State 198, End]
type = changestate
trigger1 = !animtime
value = 0

;====<INTRO VS JOE HIGASHI>====
[StateDef 199]
type = S
physics = N
anim = 199

[State 199, Snd]
type = playsnd
trigger1 = animelem = 39
value = 4, 2
channel = 0

[State 199, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 199, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;==< WIN POSE DECIDER >==
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = ceil(random/20)-1

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Sagat"
trigger2 = enemy, name = "cvssagat" || enemy, name = "svcsagat"
value = ifelse(random<500,50,51)

[State 180, winOM]
type = changestate
trigger1 = prevstateno = 4003
value = 4003

[State 180, oyaji!!!]
type = changestate
trigger1 = numenemy
trigger1 = enemy, name = "Sagat"
trigger2 = numhelper(8600)
trigger2 = helper(8600), var(0) = 6 || helper(8600), var(0) = [15,16]
value = 184

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holdstart"
value = 186

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = ifelse((command = "holdx" || command = "holdy"), 181, 184)

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = 182

[State 180, win]
type = changestate
trigger1 = !time && (random < 333 || command = "holdstart") && matchover
value = 186

[State 180, win]
type = changestate
trigger1 = !time
value = ifelse(random < 400, 184, ifelse(random < 500, 181, 182))


;==< WIN 1 >==
[Statedef 181]
type = S
anim = ifelse(random < 500, 181, 183)
ctrl = 0


[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time<=10
scale = 1 + (0.04*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time>10
scale = 1.4
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 181, Anim]
type = changeanim
trigger1 = !time && command = "holdx" || command = "holdy"
value = ifelse((command = "holdx"), 181, 183)
persistent = 0
[State 181, wait]
type = assertspecial
trigger1 = time < 120
flag = roundnotover
[State 181, Pos]
type = posset
trigger1 = pos y
y = 0
[State 181, Snd]
type = playsnd
trigger1 = anim = 181 && time = 7
value = 4, ifelse(random < 500, 13, 14)
channel = 0
[State 181, Snd]
type = playsnd
trigger1 = anim = 183 && time = 7
value = 4, ifelse(random < 500, 7, 11)
channel = 0


;==< WIN 2 >==
[Statedef 182]
type = S
anim = ifelse(random < 666, 182, 185)
ctrl = 0

[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time<=10
scale = 1 + (0.04*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time>10
scale = 1.4
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 182, Anim]
type = changeanim
trigger1 = !time && command = "holdc"
value = 185
persistent = 0
[State 182, wait]
type = assertspecial
trigger1 = time < 180
flag = roundnotover
[State 182, Pos]
type = posset
trigger1 = pos y
y = 0
[State 182, Snd]
type = playsnd
trigger1 = anim = 182 && time = 5
value = 4, ifelse(command = "holdb", 3, ifelse(command = "holda", 6, ifelse(random < 500, 3, 6)))
channel = 0

[State 182, Snd]
type = playsnd
trigger1 = anim = 185 && time = 5
value = 4, 5
channel = 0
[State 182, Snd]
type = playsnd
trigger1 = anim = 185 && animelem = 2
value = 5, 10
[State 182, teeth]
type = explod
trigger1 = anim = 185 && animelem = 2
anim = 4105
ID = 4105
sprpriority = 2
postype = p1
pos = floor(-9 * const(size.xscale)), floor(-172 * const(size.yscale))
ownpal = 1
scale = 0.5, 0.5


;==< WIN by OTOKO MICHI / HAOH GADOUKEN >==
[Statedef 4003]
type = S
movetype = I
sprpriority = -2
anim = 4003
velset = 0, 0

[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover && win
trigger1 = time<=10 && prevstateno != 180
scale = 1 + (0.04*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover && win
trigger1 = time>10
trigger2 = prevstateno = 180
scale = 1.4
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 4003, Snd]
type = playsnd
trigger1 = !time && prevstateno != 180 && !numhelper(7600)
value = 4, ifelse(prevstateno =4300,73,33)
channel = 0

[State 4003, Snd]
type = playsnd
trigger1 = !time && numhelper(7600) && helper(7600), var(0) = 10
trigger1 = var(10) != 1 && prevstateno != 180
value = 4, ifelse(prevstateno =4300,73,33)
channel = 0

[State 4003, Snd]
type = playsnd
trigger1 = !time && prevstateno = 4300
value = 4, ifelse(prevstateno =4300,73,33)
channel = 7

[State 4003, Pos]
type = posset
trigger1 = pos y
y = 0

[State 4003, width]
type = width
trigger1 = 0
value = 2, 2

[State 4003, win]
type = changestate
trigger1 = time >= 20 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;==< WIN OYAJI >==
[Statedef 184]
type = S
anim = 184

[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time<=10
scale = 1 + (0.04*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time>10
scale = 1.4
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 184, wait]
type = assertspecial
trigger1 = time < 180
flag = roundnotover
[State 184, Pos]
type = posset
trigger1 = pos y
y = 0
[State 184, Snd]
type = playsnd
trigger1 = time = 7
value = 4, 18;ifelse(random>500,56,18)
channel = 0


;==< WIN UDON >==
[Statedef 186]
type = A
physics = N
anim = 186
[State 186, wait]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time<=10
scale = 1 + (0.04*time)
pos = pos x, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = var(57)
triggerall = !partner, alive && matchover
trigger1 = time>10
scale = 1.4
pos = pos x, pos y;zoom
ignorehitpause = 1

[State 186, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 186, bound]
type = screenbound
trigger1 = 1
value = 0

[State 186, Snd]
type = playsnd
trigger1 = anim = 186 && animelem = 3
value = 0, 40
[State 186, Dust]
type = helper
trigger1 = anim = 186 && animelem = 3
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 186, Accel]
type = veladd
trigger1 = anim = 186 && animelemtime(3) >= 0
y = 0.3
[State 186, Vel]
type = velset
trigger1 = anim = 186 && animelem = 3
x = 2
y = -5

[State 186, Snd]
type = playsnd
trigger1 = anim = 186 && animelem = 3
value = 4, 17
channel = 0

[State 186, Anim]
type = changeanim
trigger1 = anim = 186 && animelemtime(3) > 0
trigger1 = pos y > -vel y
value = 187

[State 186, Pos]
type = posset
trigger1 = anim = 187
y = 0
[State 186, Vel]
type = velset
trigger1 = anim = 187
x = 4/camerazoom
y = 0

[State 186, Snd]
type = playsnd
trigger1 = anim = 187 && animelem = 1
value = 0, 52
[State 186, Dust]
type = explod
trigger1 = anim = 187 && !(time % 5)
anim = 7103
scale = 0.5, 0.5
sprpriority = 3
postype = p1
vel = -1, 0
ownpal = 1


;==< GET UP >==
[Statedef 5120]
type = L
movetype = I
physics = N
velset = 0, 0

[State 5120, winbyOM]
type = changestate
trigger1 = alive && winko
trigger1 = var(0) = 4001
value = 4003

[State 5120, Anim]
type = changeanim
trigger1 = !time
value = 5120
[State 5120, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 5120, fall]
type = hitfallset
trigger1 = !animtime
value = 1
[State 5120, NHB]
type = nothitby
trigger1 = !animtime
value = , NT, ST, HT
time = 12
[State 5120, NHB]
type = nothitby
trigger1 = !animtime
value2 = SCA
time = 3
[State 5120, 7]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< LIE DEAD >==
[Statedef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, Anim]
type = changeanim
triggerall = !time && selfanimexist(5140)
trigger1 = (anim != [5111, 5119]) && (anim != [5171, 5179])
trigger2 = !selfanimexist(5140 + (anim % 10))
value = 5140

[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = (anim = [5111, 5119]) || (anim = [5171, 5179])
trigger1 = selfanimexist(5140 + (anim % 10))
value = 5140 + (anim % 10)
[State 5150, Anim]
type = changeanim
persistent = 0
trigger1 = matchover = 1
trigger1 = anim = [5140, 5149]
trigger1 = selfanimexist(anim + 10)
value = anim + 10
[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != [5140, 5159]
trigger1 = anim != [5110, 5119]
value = 5110

[State 5150, (lenny_face.png)]
type = changeanim
triggerall = anim != 4003
trigger1 = enemynear, name = "Morrigan Aensland" && enemynear, authorname = "Phantom.of.the.Server"
trigger1 = prevstateno = 1114102
trigger2 = (enemy, name = "RajaaLen" && enemy, authorname = "Rajaaboy") || (enemy(1), name = "RajaaLen" && enemy(1), authorname = "Rajaaboy") || (enemy(3), name = "RajaaLen" && enemy(3), authorname = "Rajaaboy")
trigger2 = enemy, anim = 183 || enemy(1), anim = 183 || enemy(2), anim = 183
trigger3 = enemynear, name = "Morrigan_Aensland" && enemynear, authorname = "Beterhans"
trigger3 = prevstateno = 1114102
trigger4 = enemynear, name = "Morrigan_Aensland" && enemynear, authorname = "Beterhans"
trigger4 = enemynear, stateno = 4309
trigger5 = enemynear, name = "Konata Izumi" && enemynear, authorname = "Sennou-Room"
trigger5 = enemynear, prevstateno = 3404
value = 4003

[State 5150, Snd]
type = playsnd
trigger1 = anim = 4003
value = 4, 33
channel = 0
persistent = 0

[State 5150, Vel]
type = velmul
trigger1 = 1
x = 0.85
[State 5150, Vel]
type = velset
trigger1 = vel x < 0.05
persistent = 0
x = 0
[State 5150, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


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
value = 4, 11
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 7,11
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * (const(size.yScale)*2))
size.xScale = 1
size.yScale = 1
ownpal = 1


[State 5201, Dust]
type = playsnd
trigger1 = !time
value = 0, 101
[State 5201, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
scale = 0.5, 0.5
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
value = 4, 11
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 7,11
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * (const(size.yScale)*2))
size.xScale = 1
size.yScale = 1
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
value = 7100
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
trigger1 = animelem = 12 && command != "holdfwd"
value = 5220
elem = 20

[State 5221, Dust]
type = explod
trigger1 = !(time % 5)
anim = 7103
scale = 0.5, 0.5
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


[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(40) < 0
var(40) = HitPauseTime
ignoreHitPause = 1

;[State -2, Hit Sound]
;type = PlaySnd
;trigger1 = MoveContact = 1 && var(40) = HitPauseTime && hitdefattr != SCA,AT
;trigger1 = MoveHit = 1 && var(41) >= 0
;value = 2, var(41)
;channel = 2
;ignoreHitPause = 1
;
;[State -2, Guard Sound]
;type = PlaySnd
;trigger1 = MoveContact = 1 && var(40) = HitPauseTime
;trigger1 = MoveGuarded = 1 && var(42) >= 0
;value = 2, var(42)
;channel = 2
;ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(40) = HitPauseTime && hitdefattr != SCA,AT
trigger1 = (MoveHit = 1 || movereversed = 1) && NumEnemy
trigger1 = var(43) = 8010 || var(43) = 8011 || var(43) = 8012 || var(43) = 8013 || var(43) = 8014 || var(43) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(44) = 8000 || var(44) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(44), var(43))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(45), ceil(P2Dist x), var(45))) * (const(size.xScale)*2)), ceil(var(46) * (const(size.yScale)*2))
facing = -1
size.xscale = 1
size.yscale = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(40) = HitPauseTime
trigger1 = NumEnemy && var(59)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(45), ceil(P2Dist x), var(45))) * (const(size.xScale)*2)), ceil(var(46) * (const(size.yScale)*2))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(40) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 40
last = 46
value = -1
ignoreHitPause = 1

[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(59) = (enemynear, movetype = A)
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
trigger1 = var(20) > 0 || numtarget(1150)
trigger2 = numhelper(3405)
trigger2 = helper(3405), var(3)
trigger3 = roundstate != 2
flag = nojugglecheck
ignorehitpause = 1
[State -2, Original Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) = [1,60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignoreHitPause = 1

[State -2, boo!]
type = playsnd
trigger1 = movetype = H && var(31) > 0
trigger1 = var(31) := -1
trigger2 = movetype = H && var(33) > 0
value = 6, 1 - ifelse((stateno = [4001, 4300]),1,0)
channel = 5
ignorehitpause = 1
[State -2, Reset]
type = varset
trigger1 = stateno != 3300 || var(31) <= 0
var(31) = 0
ignorehitpause = 1

[State -2, turnoffCS]
type = varset
trigger1 = movetype = H || stateno = 4101 || (var(33) && win) || roundstate != 2
var(33) = ifelse(stateno=4101,0,ifelse(var(33) && win,-1,0))
ignorehitpause = 1
[State -2, varCS]
type = varadd
trigger1 = var(33) > 0 && stateno != 3300
var(33) = ifelse(var(33) = 1, -2, -1)
ignorehitpause = 1
[State -2, stopmusic]
type = assertspecial
trigger1 = var(33)
flag = nomusic
ignorehitpause = 1
[State -2, assertsCS]
type = assertspecial
trigger1 = var(33)
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

;[State -2, ghost]
;type = trans
;trigger1 = palno = 8
;trans = addalpha
;alpha = 192, 64
;ignorehitpause = 1

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
value = 11, ifelse(stateno = 5130, 3, ifelse(random < 500, 1, 2))
ignorehitpause = 1
	
[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1


[state -2, No Clones]
type = remappal
triggerall=numenemy && (fvar(0)=[1,40])
trigger1=fvar(0)&&!numhelper(256)&&matchno=1&&roundno=1
trigger1=enemy,authorname="Phantom.of.the.Server"&&enemy,name="Dan Hibiki"&&enemy,fvar(0)=fvar(0)
source = 1, 1
dest = 1, Ifelse(teamside!=1 && enemynear,Numhelper(256)=0,enemy,fvar(0)+teamside,fvar(0))
ignorehitpause = 1
[state -2, Palette]
type = varset
trigger1 = numhelper(256)
trigger1=helper(256),fvar(0)=[1,40]
fvar(0)= helper(256),fvar(0)
ignorehitpause = 1
[state -2, Palette Selection]
type = remappal
trigger1 = numhelper(256)
trigger1=helper(256),fvar(0)=[1,40]
source = 1, 1
dest = 1, fvar(0)
ignorehitpause = 1
[state -2, Continue Palette]
type = remappal
trigger1= var(27)&&!AILevel&&matchno>1
source = 1, 1
dest = 1, fvar(0)
ignorehitpause = 1


[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Damage = %f Shinwa = %d"
params = AIlevel, fvar(12), var(33)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS and Mr.Ansatsuken \nhttp://www.mugenguild.com/pots/ \nhttp://www.ansatsukenmugen.webs.com"
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
triggerall = time = 1 && !var(20) && !var(33)
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


[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1


[State -3, Lv1 Shadows]
type = afterimage
trigger1 = stateno = 3000 && animelemtime(1) = 2
trigger2 = stateno = 3100 && anim = 3100 && animelemtime(1) = 3
trigger3 = stateno = 3300 && anim = 3300 && animelem = 3 && !var(33)
trigger4 = stateno = 3200 && anim = 3200 && animelem = 3
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
trigger1 = stateno = 3500 && anim = 3500 && animelem = 3
trigger2 = stateno = 3400 && anim = 3400 && animelemtime(1) = 3
trigger3 = (stateno = 3600 || stateno = 3700 || stateno = 3800) && time = 1
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
trigger2 = stateno = 4100 && time = 43
trigger3 = (stateno = 4200 || stateno = 4300 || stateno = 4400) && time = 1
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
trigger1 = var(20) || var(33)
trigger2 = stateno = 50 && var(9) = 3 && vel y < -1
trigger3 = (stateno = [710, 725]) || stateno = 1900
trigger4 = (stateno = [3000, 4999]) && stateno != 3504 && anim != 4302
time = 2


[State -3, flashsnd]
type = playsnd
triggerall = var(33) && !numhelper(7500)
trigger1 = (stateno = [410, 415]) && !(gametime % 6)
trigger2 = (stateno != [410, 415]) && !(gametime % 36)
value = 6, 2 + (random % 3)
[State -3, flashes]
type = explod
triggerall = var(33) && !numhelper(7500)
trigger1 = (stateno = [410, 415]) && !(gametime % 2)
trigger2 = (stateno != [410, 415]) && !(gametime % 12)
anim = 4110
ID = 4105
sprpriority = -5
postype = left
pos = 160, 120
facing = -1 + (random < 500) * 2
random = 320, 240
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
ownpal = 1
pausemovetime = 20
supermovetime = 20

[State -3, flashpalfx]
type = allpalfx
triggerall = var(33) && !numhelper(7500) && stateno != 4200
trigger1 = (stateno = [410, 415]) && !(gametime % 9)
trigger2 = (stateno != [410, 415]) && !(gametime % 54)
time = 3
add = 128, 128, 128
sinadd = -128, -128, -128, 12
[State -3, flashpalfx]
type = bgpalfx
trigger1 = var(33) && !numhelper(7500)
trigger1 = (gametime % 36) = [0, 11]
time = 1
color = 0
mul = ceil(128+ cos(gametime / 12.0 * pi) * 128), 0, 0
[State -3, flashpalfx]
type = bgpalfx
trigger1 = var(33) && !numhelper(7500)
trigger1 = (gametime % 36) = [12, 23]
time = 1
color = 0
mul = 0, ceil(128+ cos(gametime / 12.0 * pi) * 128), 0
[State -3, flashpalfx]
type = bgpalfx
trigger1 = var(33) && !numhelper(7500)
trigger1 = (gametime % 36) = [24, 35]
time = 1
color = 0
mul = 0, 0, ceil(128+ cos(gametime / 12.0 * pi) * 128)
[State -3, flashpalfx]
type = bgpalfx
triggerall = var(33) && stateno != 4100
trigger1 = (stateno = [410, 415]) && !(gametime % 9)
trigger2 = (stateno != [410, 415]) && !(gametime % 54)
time = 1
add = 128, 128, 128

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
triggerall = statetype = A && movetype != H && numenemy = 1 && stateno != 1220
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
trigger3 = gethitvar(animtype) = 0 && random < (250 * (AIlevel ** 2 / 64.0))
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, 1 + (random % 5)
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

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO && roundstate = 3
triggerall = var(20) && !numhelper(7600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(3)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(3)
trigger4 = numhelper(1405)
trigger4 = helper(1405), var(3)
trigger5 = stateno = 810 && (animelemtime(4) = [0, 1])
trigger6 = stateno = 820 && (animelemtime(8) = [0, 1])
trigger7 = stateno = 855 && (animelemtime(5) = [0, 1])
helpertype = normal
stateno = 8600
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
trigger1 = ((movehit = [1, 4]) && numtarget||var(33)||stateno=3300) && (stateno = 1300 || (stateno = 1600&&var(10)=4) || (stateno = [3000, 4999])||var(33))
trigger2 = stateno = 4001 && animelemtime(5) >= 0
trigger3 = numhelper(1305)
trigger3 = helper(1305), var(3)
trigger4 = numhelper(3005)
trigger4 = helper(3005), var(3)
trigger5 = numhelper(3405)
trigger5 = helper(3405), var(3)
trigger6 = numhelper(4305)
trigger6 = helper(4305), var(3)
trigger7 = numhelper(3755)
trigger7 = helper(3755), var(3)
helpertype = normal
stateno = 8600 + 0 * (var(0) := stateno)
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

