; ADD004 BASIC PIEs ReBuilded CNS (27/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _________________________________________
;| Ryo Sakazaki by CrazyKoopa & Jmorphman  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===<SYSTEM STATES>====
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
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Skywalker]
type = ChangeState
triggerall = pos y < 0
trigger1 = !NumEnemy
trigger2 = NumEnemy = 1
trigger2 = (Enemy, Name = "M -NES Game 1" + Enemy, Name = "M -NES Game 2" + Enemy, Name = "M -GB Game 1" + Enemy, AuthorName = "Bane84") < 2
trigger3 = Numenemy >= 2
trigger3 = (Enemy(0), Name = "M -NES Game 1" + Enemy(0), Name = "M -NES Game 2" + Enemy(0), Name = "M -GB Game 1" + Enemy(0), AuthorName = "Bane84") < 2
trigger3 = (Enemy(1), Name = "M -NES Game 1" + Enemy(1), Name = "M -NES Game 2" + Enemy(1), Name = "M -GB Game 1" + Enemy(1), AuthorName = "Bane84") < 2
value = 50

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050


;====<CROUCHING>====
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = 11
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && !AnimTime
value = 11


;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 12
value = 12

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
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

[State 40, Direction]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, High Jump]
type = varset
trigger1 = !time && !AIlevel
var(3) = ifelse(command = "highjump", 3, 0)
[State 40, High Jump]
type = varset
trigger1 = !time && AIlevel
var(3) = ifelse((p2bodydist x >= 160 || random < (125 * (AIlevel ** 2 / 64.0))), 3, 0)
[State 40, High Jump]
type = varset
trigger1 = !time && prevstateno = 100
var(3) = 3

[State 40, Low Jump]
type = varset
trigger1 = !AIlevel && command != "holdup" && (var(3) != [1, 2])
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)
[State 40, Low Jump]
type = varset
trigger1 = AIlevel && (var(3) != [1, 2])
trigger1 = (enemynear, statetype = C) && random < 500
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = ifElse((var(3) = [2,3]), 41, 40), 0
[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Velocity: Normal Jump]
type = VelSet
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

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
ignoreHitPause = 1

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

[State 52, No walking]
type = assertspecial
trigger1 = anim != 5
flag = nowalk
ignoreHitPause = 1

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
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

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 7)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x <= 90
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
value = 101,0

[State 101, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40

[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
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
value = 105,0

[State 105, Dust]
type = helper
trigger1 = animelem = 2
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

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.75

[State 110, Type]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 105, Land]
type = changestate
trigger1 = animelemtime(2) >= 0
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
value = 100,1

[State 106, Dust]
type = explod
trigger1 = !time
anim = 8102
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
trigger1 = !time
value = 4,0
channel = 0

[State 700, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 3
channel = 1

[State 700, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 221, 250)

[State 700, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && numenemy
trigger1 = (enemynear, movetype != A) && (p2bodydist x = [ -60, 60]) && (p2dist y >= -60)
value = ifelse(random < 666, 221, 250)

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
ignoreHitPause = 1

[State 710, HB]
type = hitby
trigger1 = animelemtime(9) < 0
value = SCA, AT
time = 1

[State 710, Snd]
type = playsnd
trigger1 = !time
value = ifElse(random < 500, 4, 710),1
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
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
ignoreHitPause = 1

[State 715, HB]
type = hitby
trigger1 = animelemtime(9) < 0
value = SCA, AT
time = 1

[State 715, Snd]
type = playsnd
trigger1 = !time
value = ifElse(random < 500, 4, 710),1
channel = 0

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
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
value = 730,1
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
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, FX]
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

[State 731, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 730, Snd]
type = playsnd
trigger1 = !time && power >= const(data.power)
value = 730,2
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
var(10) = (command = "412k")
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
value = 4,0
channel = 0

[State 750, SuperPause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = 35, -83
supermovetime = 255
ownpal = 1

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 15
movetime = 15
p2defmul = 1
anim = -1
sound = s750,0
darken = 0

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 2910, 2900)



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
value = 4,0
channel = 0

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

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
pos = 35, -83
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
value = 4,0
channel = 0

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

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
pos = 16,-57
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
value = 4, 0
channel = 0

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

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
pos = 11,-93
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
trigger1 = (root, stateno != 5120) || !(root, animtime)
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

[State 900, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 900, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

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

[State 900, Snd]
type = playsnd
trigger1 = time = 4
value = 181,0
channel = 0

[State 900, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 5,-65
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
sound = s900,0
p2defmul = 1
darken = 0

[State 900, AfterImage]
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

[State 905, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 905, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

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

[State 905, Snd]
type = playsnd
trigger1 = time = 4
value = 181,0
channel = 0

[State 905, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 5,-91
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
sound = s900,0
p2defmul = 1
darken = 0

[State 905, AfterImage]
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
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
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
value = 52,0
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 8102
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
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = Time < 200
flag = roundnotover


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



;====<INITIALIZE>====
[StateDef 5900]
type = S

[state 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
value = 0

[State 5900, Float VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
fvalue = 0

[State 5900, Intro vs King]
type = ChangeState
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "King" || Enemy, Name = "cvsking"
value = 191

[State 5900, Intro vs Yuri Sakazaki]
type = ChangeState
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName != "Juke Kisaragi" && Enemy, AuthorName != "KoopaKoot"
trigger1 = Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "Yuri" || Enemy, Name = "cvsyuri"
value = 192

[State 5900, Intro vs Kyokugenryu practitioners/Ryo Sakazaki]
type = ChangeState
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "Robert Garcia" || Enemy, Name = "Robert_WLS" || Enemy, Name = "cvsrobert"
trigger2 = Enemy, Name = "Takuma Sakazaki" || Enemy, Name = "Takuma" || Enemy, Name = "cvstakuma"
trigger3 = Enemy, AuthorName = "Juke Kisaragi" || Enemy, AuthorName = "KoopaKoot"
trigger3 = Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "Yuri"
trigger4 = Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "Ryo" || Enemy, Name = "cvsryo"
value = 193

[State 5900, Intro vs Gai Tendo]
type = ChangeState
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "Gai Tendo" || Enemy, Name = "Gai"
value = 194

[State 5900, Intro vs Ryu]
type = ChangeState
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 196

[State 5900, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190

[State 5900, End]
type = ChangeState
trigger1 = 1
value = 0


;Intro 1
[Statedef 190]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 190, Snd]
type=playsnd
trigger1= animelem = 17
value=190,0
channel=0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;Intro vs king
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;Intro vs yuri
[Statedef 192]
type = S
ctrl = 0
anim = 192
velset = 0,0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;Intro vs Kyokugenryu practitioners/Ryo Sakazaki
[Statedef 193]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 1 && Anim = 0
trigger2 = Enemy, Name = "Robert Garcia" && Enemy, AuthorName = "DGO&DivineWolf" && Anim = 0
value = 193

[State 190, Snd]
type=playsnd
trigger1= animelem = 4 && anim = 193
value=181,2
channel=0

[State 183, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 && anim = 193
value = 1,2
channel = 1

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0 && anim = 193
value = 0


;Intro vs Gai Tendo
[Statedef 194]
type = S
ctrl = 0
anim = 194
velset = 0,0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 0, Voice]
type = PlaySnd
trigger1 = animelem = 2
value = 194,0
channel = 0

[State 0, woosh]
type = PlaySnd
trigger1 = animelem = 18
value = 1,2
channel = 2

[State 190, 4]
type = ChangeState
trigger1 = !AnimTime
value = 0


;Intro vs Ryu
[Statedef 196]
type = S
ctrl = 0
anim = 196
velset = 0,0

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 193, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 194, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0,0

[State 194, VarSet]
type = VarSet
trigger1 = !Time
var(10) = ceil(pos x)

[State 901,1]
type = PosSet
trigger1 = !Time
x = -20 * Facing

[State 105, 1]
type = VelSet
triggerAll = Anim = 196
trigger1 = AnimElem = 4
x = abs(Pos x - var(10)) / -50
y = -8

[State 194, Jumping Sound]
type = PlaySnd
triggerAll = Anim = 196
trigger1 = AnimElem = 4
value = 40,0

[State 105, 1]
type = VelAdd
triggerAll = Anim = 196
trigger1 = AnimElemTime(4) >= 0
y = .35

[State 40, Dust]
type = helper
triggerAll = Anim = 196
trigger1 = AnimElem = 4
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 194, Landing Dust Explod]
type = Explod
triggerAll = Anim = 196
trigger1 = vel y > 0 && pos y >= -5
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 194, Landing Sound]
type = PlaySnd
triggerAll = Anim = 196
trigger1 = vel y > 0 && pos y >= -5
value = 52,0

[State 194, Change]
type = ChangeAnim
triggerAll = Anim = 196
trigger1 = vel y > 0 && pos y >= -5
value = 197

[State 194, PosSet]
type = PosSet
triggerAll = Anim = 197
trigger1 = vel y > 0 && pos y >= -5
x = var(10)
y = 0

[State 194, VelSet]
type = VelSet
triggerAll = Anim = 197
trigger1 = vel y > 0 && pos y >= -5
x = 0
y = 0

[State 190, 4]
type = ChangeState
triggerAll = Anim = 197
trigger1 = !AnimTime
value = 0


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
value = 52,0
channel = 1

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 190, Snd]
type=playsnd
trigger1= animelem = 4
value=190,0
channel=0

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0


;====<WIN POSE DECIDER>====
[StateDef 180]
type = S

[State 180, Generic Victory Quote]
type = VictoryQuote
trigger1 = 1
value = (Random % 37)

[State 180, Victory Quote vs. Ryo Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "Ryo" || Enemy, Name = "cvsryo"
value = 37 + (Random % 2)

[State 180, Victory Quote vs. King]
type = VictoryQuote
trigger1 = Enemy, Name = "cvsking" || Enemy, Name = "King"
value = 39 + (Random % 3)

[State 180, Victory Quote vs. Robert Garcia]
type = VictoryQuote
trigger1 = Enemy, Name = "Robert Garcia" || Enemy, Name = "Robert_WLS" || Enemy, Name = "cvsrobert"
value = 42 + (Random % 4)

[State 180, Victory Quote vs. Takuma Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Takuma Sakazaki" || Enemy, Name = "Takuma" || Enemy, Name = "cvstakuma"
value = 46 + (Random % 2)

[State 180, Victory Quote vs. (Serious) Mr. Karate]
type = VictoryQuote
trigger1 = Enemy, Name = "Mr. Karate" || Enemy, Name = "Serious Mr. Karate" || Enemy, Name = "Honki ni Natta Mr. Karate"
trigger2 = Enemy, Name = "Mr.Karate" || Enemy, Name = "Serious Mr.Karate" || Enemy, Name = "Honki ni Natta Mr.Karate"
value = 48 + (Random % 2)

[State 180, Victory Quote vs. Yuri Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "Yuri" || Enemy, Name = "cvsyuri"
value = 50 + (Random % 3)

[State 180, Victory Quote vs. Terry Bogard]
type = VictoryQuote
trigger1 = Enemy, Name = "Terry Bogard" || Enemy, Name = "Terry" || Enemy, Name = "cvsterry"
value = 53 + (Random % 5)

[State 180, Victory Quote vs. Dan]
type = VictoryQuote
trigger1 = Enemy, Name = "Dan" || Enemy, Name = "cvsdan" || Enemy, Name = "Dan Hibiki"
value = 58 + (Random % 2)

[State 180, Victory Quote vs. Mr. Big]
type = VictoryQuote
trigger1 = Enemy, Name = "Mr. Big" || Enemy, Name = "Mr.Big" || Enemy, Name = "Mister Big" || Enemy, Name = "Mr Big" || Enemy, Name = "Big"
value = 60

[State 180, Victory Quote vs. Demitri/Mars People]
type = VictoryQuote
trigger1 = Enemy, Name = "Demitri" || Enemy, Name = "Demitri Maximoff" || Enemy, Name = "Demitri Maximov" || Enemy, Name = "Demitri(DS)"
trigger2 = Enemy, Name = "Mars People" || Enemy, Name = "MarsPeople"
value = 61

[State 180, Victory Quote vs. Jyazu/Shion]
type = VictoryQuote
trigger1 = Enemy, Name = "Jazu" || Enemy, Name = "Jyazu"
trigger2 = Enemy, Name = "Shion"
value = 62

[State 180, Victory Quote vs. Andy Bogard]
type = VictoryQuote
trigger1 = Enemy, Name = "Andy Bogard" || Enemy, Name = "Andy" || Enemy, Name = "cvsandy"
value = 63

[State 180, Victory Quote vs. Athena Asamiya]
type = VictoryQuote
trigger1 = Enemy, Name = "Athena Asamiya" || Enemy, Name = "Athena" || Enemy, Name = "cvsathena"
value = 64

[State 180, Victory Quote vs. Ash Crimson]
type = VictoryQuote
trigger1 = Enemy, Name = "Ash" || Enemy, Name = "Ash Crimson" || Enemy, Name = "cvsash"
value = 65 + (Random % 2)

[State 180, Victory Quote vs. Benimaru Nikaido]
type = VictoryQuote
trigger1 = Enemy, Name = "Benimaru" || Enemy, Name = "Benimaru Nikaido" || Enemy, Name = "cvsbenimaru"
value = 67 + (Random % 2)

[State 180, Victory Quote vs. Billy Kane]
type = VictoryQuote
trigger1 = Enemy, Name = "Billy Kane" || Enemy, Name = "Billy Karn" || Enemy, Name = "ffsp_billy"
value = 69

[State 180, Victory Quote vs. Chin Gentsai]
type = VictoryQuote
trigger1 = Enemy, Name = "Chin" || Enemy, Name = "Chin Gentsai"
value = 70 + (Random % 2)

[State 180, Victory Quote vs. Goro Daimon]
type = VictoryQuote
trigger1 = Enemy, Name = "Daimon" || Enemy, Name = "Goro Daimon"
value = 72

[State 180, Victory Quote vs. Dark Ash]
type = VictoryQuote
trigger1 = Enemy, Name = "Evil Ash" || Enemy, Name = "Dark Ash" || Enemy, Name = "Ash crazed by the Spiral of Blood" || Enemy, Name = "Blood Spiraling into Insanity Ash" || Enemy, Name = "Evil Ash Diabolosis"
trigger2 = Enemy, Name = "Ash Crimson" && Enemy, AuthorName = "Chazzanova & Quickfist" && (Enemy, var(28))
value = 73

[State 180, Victory Quote vs. Duo Lon]
type = VictoryQuote
trigger1 = Enemy, Name = "Duo Lon" || Enemy, Name = "DuoLon" || Enemy, Name = "Duo-Lon"
value = 74

[State 180, Victory Quote vs. Elisabeth Blanctorche]
type = VictoryQuote
trigger1 = Enemy, Name = "Elisabeth" || Enemy, Name = "Elisabeth Blanctorche"
value = 75

[State 180, Victory Quote vs. Hwa Jai]
type = VictoryQuote
trigger1 = Enemy, Name = "Hwa" || Enemy, Name = "Hwa Jai"
value = 76

[State 180, Victory Quote vs. Iori Yagami]
type = VictoryQuote
trigger1 = Enemy, Name = "Iori" || Enemy, Name = "IoriMG" || (Enemy, Name = "cvsiori" && Enemy, PalNo <= 6) || Enemy, Name = "cvsiori_normal" || Enemy, Name = "N.Iori_WLS" || (Enemy, Name = "Iori_WLS" && Enemy, PalNo <= 6) || (Enemy, Name = "Iori Yagami" && Enemy, AuthorName != "Anjel") || (Enemy, Name = "Iori Yagami" && Enemy, AuthorName = "Anjel" && Enemy, PalNo <= 6)
value = 77 + (Random % 3)

[State 180, Victory Quote vs. Joe Higashi]
type = VictoryQuote
trigger1 = Enemy, Name = "Joe Higashi" || Enemy, Name = "Joe" || Enemy, Name = "cvsjoe"
value = 80

[State 180, Victory Quote vs. K']
type = VictoryQuote
trigger1 = Enemy, Name = "Ultimate K'" || Enemy, Name = "K'"
value = 81

[State 180, Victory Quote vs. Kim Kaphwan]
type = VictoryQuote
trigger1 = Enemy, Name = "Kim Kaphwan" || Enemy, Name = "Kim" || Enemy, Name = "cvskim"
value = 82

[State 180, Victory Quote vs. Kula Diamond]
type = VictoryQuote
trigger1 = Enemy, Name = "Kula Diamond" || Enemy, Name = "Kula"
value = 83

[State 180, Victory Quote vs. Kyo Kusanagi]
type = VictoryQuote
trigger1 = (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman") || (Enemy, Name = "cvskyo" && Enemy, PalNo <= 6) || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 84 + (Random % 3)

[State 180, Victory Quote vs. Mai Shiranui]
type = VictoryQuote
trigger1 = Enemy, Name = "Mai Shiranui" || Enemy, Name = "Mai" || Enemy, Name = "cvsmai"
value = 87

[State 180, Victory Quote vs. Mature]
type = VictoryQuote
trigger1 = Enemy, Name = "Mature" || Enemy, Name = "cvsmature"
value = 88

[State 180, Victory Quote vs. Maxima]
type = VictoryQuote
trigger1 = Enemy, Name = "Maxima"
value = 89

[State 180, Victory Quote vs. Leona Heidern]
type = VictoryQuote
trigger1 = Enemy, Name = "Leona" || Enemy, Name = "Leona Heidern"
value = 90

[State 180, Victory Quote vs. Raiden]
type = VictoryQuote
trigger1 = Enemy, Name = "Raiden" || Enemy, Name = "Big Bear" || Enemy, Name = "cvsraiden"
value = 91

[State 180, Victory Quote vs. Ralf Jones]
type = VictoryQuote
trigger1 = Enemy, Name = "Ralf" || Enemy, Name = "Ralf Jones"
value = 92 + (Random % 2)

[State 180, Victory Quote vs. Clark Still]
type = VictoryQuote
trigger1 = Enemy, Name = "Clark" || Enemy, Name = "Clark Still"
value = 93 + (Random % 2)

[State 180, Victory Quote vs. Saiki]
type = VictoryQuote
trigger1 = Enemy, Name = "Saiki"
value = 95

[State 180, Victory Quote vs. Shen Woo]
type = VictoryQuote
trigger1 = Enemy, Name = "Shen" || Enemy, Name = "Shen Woo" || Enemy, Name = "Shen_WLS"
value = 96

[State 180, Victory Quote vs. Sie Kensou]
type = VictoryQuote
trigger1 = Enemy, Name = "Sie Kensou" || Enemy, Name = "Kensou"
value = 97

[State 180, Victory Quote vs. Vice]
type = VictoryQuote
trigger1 = Enemy, Name = "Vice" || Enemy, Name = "cvsvice"
value = 98

[State 180, Win vs. Kyokugenryu practitioners]
type = ChangeState
triggerAll = RoundState = 2 || MatchOver || Enemy, TeamMode = Turns
trigger1 = Enemy, Name = "Robert Garcia" || Enemy, Name = "Robert_WLS" || Enemy, Name = "cvsrobert"
trigger2 = Enemy, Name = "Takuma Sakazaki" || Enemy, Name = "Takuma" || Enemy, Name = "cvstakuma"
trigger3 = Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "Yuri" || Enemy, Name = "cvsyuri"
trigger4 = Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "Ryo" || Enemy, Name = "cvsryo"
trigger5 = Enemy, Name = "Mr. Karate" || Enemy, Name = "Serious Mr. Karate" || Enemy, Name = "Honki ni Natta Mr. Karate"
trigger6 = Enemy, Name = "Mr.Karate" || Enemy, Name = "Serious Mr.Karate" || Enemy, Name = "Honki ni Natta Mr.Karate"
value = 184

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart"
value = 181

[State 180, Win 2]
type = ChangeState
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = 182

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = 183

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = 181 + (Random % 3)



;====<WIN 1>====
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,1

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = ifElse(Random < 250, 730, 181),2
channel = 0


;====<WIN 2>====
[StateDef 182]
type = S
physics = S
anim = 182
ctrl = 0

[State 182, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 182, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 182,0
channel = 0



;====<WIN 3>====
[StateDef 183]
type = S
physics = S
anim = 183
ctrl = 0

[State 183, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 183, Woosh]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,5
channel = 1

[State 183, Woosh]
type = PlaySnd
trigger1 = AnimElem = 15
trigger2 = AnimElem = 23
value = 1,2
channel = 1

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 24
value = 181,0
channel = 0


;====<WIN VS KYOKUGEN PRACTITIONERS>====
[StateDef 184]
type = S
physics = S
anim = 184
ctrl = 0

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 183, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,1
channel = 1

[State 183, Woosh]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 16
value = 1,2
channel = 1

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 17
value = 181,0
channel = 0


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
trigger1 = animelem = 3
value = 195,ifelse(random<500,0,1)
channel = 0

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;====< CHEAP K.O. >====
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

[State 5950, KO Snd]
type = assertspecial
trigger1 = 1
flag = nokosnd

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0

[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 5950,0

[State 5981, Snd]
type = playsnd
trigger1 = animelem = 10
value = f7, 0

[State 5981, FX]
type = explod
trigger1 = animelem = 10
anim = f60
postype = p1
pos = 0, 0
sprpriority = -3

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

[State 5201, VelSet]
type = VelSet
trigger1 = Time = 0
x = -6

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, VelSet]
type = VelSet
trigger1 = vel X > -0.1
x = 0

[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 820,0
channel = 0

[State 5201, Snd]
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
facep2 = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 820,0
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

[State 5210, NHB]
type = nothitby
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = AnimElemTime(5) < 0
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
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = moveguarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignorehitpause = 1

[State -2, Sparks]
type = helper
triggerall = StateNo != 1301 && StateNo != 1331
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && numenemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(34) = 8000 || var(34) = 8001
trigger3 = MoveHit = 1 && NumEnemy
trigger3 = var(33) = 8015 || var(33) = 8016 || var(33) = 8017
helpertype = normal
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Zanretsuken Sparks]
type = helper
triggerall = StateNo = 1301 || StateNo = 1331
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && numenemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(34) = 8000 || var(34) = 8001
trigger3 = MoveHit = 1 && NumEnemy
trigger3 = var(33) = 8015 || var(33) = 8016 || var(33) = 8017
helpertype = normal
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
pos = var(35), var(36)
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Counter FX]
type = helper
triggerAll = movehit = 1 && var(30) = hitpausetime
triggerAll = numenemy && var(9)
trigger1 = !(hitdefattr = SCA, AT) && (enemynear, movereversed != 1)
trigger2 = (EnemyNear, MoveReversed != 1) && StateNo = [1100,1299]
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
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
var(30) = -1

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
trigger1 = !IsHelper
trigger1 = movehit = 1
trigger1 = !HitPauseTime
trigger1 = !(hitdefattr = SCA, AT)
var(13) = 1

[State -2, Hitcount Reset]
type = varset
trigger1 = numenemy && var(13)
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)
var(13) = 0
ignorehitpause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100, 5109]) && (Enemy, Time >= 1)
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
var(15) = 0
ignoreHitPause = 1

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

[State -2, Throws Allowed]
type = varset
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Throws Disallowed]
type = varset
triggerall = numenemy && !numtarget(3200)
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20) && !var(21) && !var(22)
trigger4 = (enemynear, stateno = [5020, 5040]) && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, Special/Super Throws Allowed]
type = VarSet
trigger1 = var(43) != 2
trigger2 = var(43) = 2 && MoveType != A
var(43) = 0

[State -2, Special/Super Throws Disallowed]
type = VarSet
triggerall = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = (EnemyNear, StateNo = [5020,5040]) && !(EnemyNear, HitFall)
trigger4 = ((EnemyNear, StateNo = 0) || (EnemyNear, StateNo = 52)) && (EnemyNear, PrevStateNo = [5000,5040]) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger5 = (EnemyNear, StateNo = 0) && (EnemyNear, PrevStateNo = 52) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger6 = (EnemyNear, StateNo = 40) && (EnemyNear, Time >= 1 || EnemyNear, PrevStateNo = 0 || EnemyNear, PrevStateNo = 52)
trigger7 = EnemyNear, StateNo = 5110
trigger8 = MoveReversed
var(43) = ifElse(MoveReversed, 2, 1)
ignoreHitPause = 1

[State -2, Dampener]
type = varset
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignorehitpause = 1

[State -2, Dampener (EX Hien Shippukyaku/EX Kyokugen Renbuken)]
type = VarSet
trigger1 = var(11) || var(12)
fvar(10) = ifElse(var(13) >= 23, 1, 28 - var(13)) / 24.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo]
type = varset
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignorehitpause = 1

[State -2, Dampener - Custom Combo Limiter]
type = varset
trigger1 = var(20)
trigger1 = StateNo = 250
fvar(10) = ifElse(var(13), 0, 0.72)
ignorehitpause = 1

[State -2, Dampener - Supers]
type = varset
trigger1 = (stateno = [3000, 4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21), 0.8, 1.0))
ignorehitpause = 1

[State -2, Dampener (EX Hien Shippukyaku/EX Kyokugen Renbuken)]
type = VarSet
trigger1 = (stateno = [3000, 4999])
trigger1 = var(11) || var(12)
fvar(10) = ifelse(var(22), 0.4, ifelse(var(21), 0.6, 1.0))
ignoreHitPause = 1

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

[State -2, Back Charge Increment]
type = VarAdd
trigger1 = !AILevel
trigger1 = P2Dist x >= 0 && command = "holdback"
trigger2 = !AILevel
trigger2 = P2Dist x < 0 && command = "holdfwd"
trigger3 = AILevel
var(47) = 1

[State -2, Back Charge Reset]
type = VarSet
trigger1 = !AILevel
trigger1 = P2Dist x >= 0 && command != "holdback"
trigger2 = !AILevel
trigger2 = P2Dist x < 0 && command != "holdfwd"
trigger3 = AILevel
trigger3 = StateNo = 0 || (StateNo = 20 && vel x > 0) || (StateNo = [760,762])
trigger4 = AILevel
trigger4 = (StateNo = 40 && sysvar(1) != -1)
trigger5 = AILevel
trigger5 = (StateNo = [1000, 4999]) && Time = 1
var(47) = 0

[State -2, Back Charge Buffer Activation]
type = VarSet
trigger1 = var(47) >= 35
var(48) = 32

[State -2, Back Charge Buffer Decrement]
type = VarAdd
trigger1 = var(47) < 35 && var(48) > 0
var(48) = -1

[State -2, Down Charge Increment]
type = VarAdd
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
var(49) = 1

[State -2, Down Charge Reset]
type = VarSet
trigger1 = !AILevel
trigger1 = command != "holddown"
trigger3 = AILevel
trigger3 = StateNo = 0 || StateNo = 20 || (StateNo = 40 && Time = 1) || StateNo = 760
trigger4 = AILevel
trigger4 = (StateNo = [1000,4999]) && Time = 1
trigger5 = AILevel
trigger5 = (StateNo = [120,155]) && StateType != C
var(49) = 0

[State -2, Down Charge Buffer Activation]
type = VarSet
trigger1 = var(49) >= 35
var(50) = 32

[State -2, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(49) < 35 && var(50) > 0
var(50) = -1

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, collapse/cheese kill snd]
type = playsnd
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = animelem = 10
value = f7, 0

[State -2, collapse/cheese kill FX]
type = explod
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = animelem = 10
anim = f60
postype = p1
pos = 0, 0
sprpriority = -3

[State -2, guard crush/throw escape voice]
type = playsnd
trigger1 = Anim = 5910 || Anim = 5920 || Anim = 5930
trigger1 = animelemtime(1) = 1
trigger2 = Anim = 5940 || Anim = 5945
trigger2 = AnimElem = 2 && StateNo != 890
value = 5940,0
channel = 0
ignoreHitPause = 1

[State -2, EX Hien Shippukyaku Hit Count Reset]
type = VarSet
trigger1 = !var(13)
trigger2 = numtarget(3200)
var(11) = 0
ignoreHitPause = 1

[State -2, EX Kyokugen Renbuken Hit Count Reset]
type = VarSet
trigger1 = !var(13)
trigger2 = numtarget(3200)
var(12) = 0
ignoreHitPause = 1

[State -2, Tenchi Haohken TargetState]
type = TargetState
trigger1 = NumTarget(3200)
trigger1 = movehit = 1 && var(30) = hitpausetime
value = 3205
ID = 3200
ignoreHitPause = 1

[State -2, Dizzy Sound]
type = PlaySnd
triggerAll = numtarget(3200)
trigger1 = target(3200), stateno = 3213 && target(3200),time = 1
trigger2 = target(3200), stateno = 3213 && target(3200),time = 38
trigger3 = target(3200), stateno = 3213 && target(3200),time = 75
value = 5300,0
channel = 10
ignorehitpause = 1

[State -2, StopSnd]
type = StopSnd
trigger1 = !numtarget(3200)
trigger2 = stateno = 3200 && movehit
channel = 10
ignoreHitPause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, fvar(11), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy CrazyKoopa + Jmorphman"
ignoreHitPause = 1



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
trigger1 = (StateNo != [1000,1030])
trigger1 = StateNo != 1050 && StateNo != 1080
trigger1 = (StateNo != [3000,3050])
trigger2 = (StateNo = [1000,1030]) && AnimElemTime(4) < 0
trigger3 = (StateNo = 1050 || StateNo = 1080) && AnimElemTime(4) < 0
trigger4 = (StateNo = [3000,3050]) && AnimElemTime(17) < 1
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = !NumHelper(1005)
trigger1 = !NumHelper(1055)
trigger1 = !NumHelper(3005)
trigger1 = !NumHelper(3055)
var(39) = 0
ignoreHitPause = 1

[State -3, Chain Reset]
type = varset
trigger1 = 1
var(4) = 0
ignorehitpause = 1

[State -3, Chain Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
trigger2 = StateNo != [1300,1331]
trigger3 = var(20) && (StateNo = 1301 || StateNo = 1331) && StateType != A && (MoveContact || var(18))
trigger3 = (AnimElemTime(42) > 0 && StateNo = 1301) || (AnimElemTime(63) > 0 && StateNo = 1301)
var(4) = 1
ignorehitpause = 1

[State -3, Command Cancel Reset]
type = varset
trigger1 = 1
var(5) = 0
ignorehitpause = 1

[State -3, Command Cancel Check]
type = varset
triggerAll = !var(20)
trigger1 = (StateNo = [200,201]) && MoveContact
trigger2 = StateNo = 210 && MoveContact && AnimElemTime(6) < 0
trigger3 = StateNo = 221 && MoveContact && AnimElemTime(5) < 0
trigger4 = StateNo = 231 && MoveContact
trigger5 = StateNo = 251 && MoveContact && AnimElemTime(7) < 0
trigger6 = StateNo = 400 && MoveContact
trigger7 = StateNo = 410 && MoveContact && AnimElemTime(4) < 0
trigger8 = StateNo = 420 && MoveContact && AnimElemTime(4) < 0
trigger9 = StateNo = 430 && MoveContact
trigger10 = StateNo = 440 && MoveContact && AnimElemTime(5) < 0
trigger11 = StateNo = 450 && MoveContact && AnimElemTime(5) < 0
var(5) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = varset
trigger1 = 1
var(6) = 0
ignorehitpause = 1

[State -3, Cancel Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger2 = StateNo != [1300,1331]
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = [200,201]
trigger5 = StateNo = 210 && AnimElemTime(6) < 0
trigger6 = StateNo = 221 && AnimElemTime(5) < 0
trigger7 = StateNo = 231
trigger8 = StateNo = 251 && AnimElemTime(7) < 0
trigger9 = StateNo = 400
trigger10 = StateNo = 410 && AnimElemTime(4) < 0
trigger11 = StateNo = 420 && AnimElemTime(4) < 0
trigger12 = StateNo = 430
trigger13 = StateNo = 440 && AnimElemTime(5) < 0
trigger14 = StateNo = 600
trigger15 = StateNo = 630
trigger16 = var(20) && (StateNo = 1301 || StateNo = 1331) && StateType != A && (MoveContact || var(18))
trigger16 = (AnimElemTime(42) > 0 && StateNo = 1301) || (AnimElemTime(63) > 0 && StateNo = 1301)
var(6) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = 1
var(7) = 0
ignorehitpause = 1
[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = [200,201]
trigger5 = StateNo = 210 && (AnimElemTime(6) < 0 || (movecontact = [1, 8]))
trigger6 = StateNo = 219 && (AnimElemTime(7) < 0 || (movecontact = [1, 8]))
trigger7 = StateNo = 220 && (AnimElemTime(5) < 0 || (movecontact = [1, 8]))
trigger8 = StateNo = 221 && (AnimElemTime(5) < 0 || (movecontact = [1, 8]))
trigger9 = StateNo = [230,231]
trigger10 = StateNo = 251 && (AnimElemTime(7) < 0 || (movecontact = [1, 8]))
trigger11 = StateNo = 400
trigger12 = StateNo = 410 && (AnimElemTime(4) < 0 || (movecontact = [1, 8]))
trigger13 = StateNo = 420 && (AnimElemTime(5) < 0 || (movecontact = [1, 8]))
trigger14 = StateNo = 430
trigger15 = StateNo = 440 && (AnimElemTime(5) < 0 || (movecontact = [1, 8]))
trigger16 = StateNo = 450 && (AnimElemTime(5) < 0 || (movecontact = [1, 8]))
trigger17 = (StateNo = [1000,1030]) && (AnimElemTime(4) = [1,8])
trigger18 = Stateno = 1100 && AnimElemTime(4) < 0 && MoveContact
trigger19 = Stateno = 1130 && AnimElemTime(4) < 0 && MoveContact
trigger20 = Stateno = 1301 && AnimElemTime(41) >= 0 && AnimElemTime(42) < 1 && MoveContact
trigger21 = Stateno = 1331 && AnimElemTime(62) >= 0 && AnimElemTime(63) < 1 && MoveContact
var(7) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = varset
trigger1 = 1
var(8) = 0
ignorehitpause = 1
[State -3, Hyper Cancel Reset]
type = varset
trigger1 = stateno = 3110 && AnimElemTime(87) < 0 && MoveContact
var(8) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Flag Reset]
type = varset
trigger1 = var(22)
trigger1 = (stateno != [3000, 4999]) || movetype = H
var(22) = 0
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
trigger1 = var(26) := (var(26) -1)
flag = nowalk
ignoreHitPause = 1

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = varset
triggerAll = MoveType != H
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

[State -3, Movement Afterimage]
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

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3000 && time = 43
trigger2 = stateno = 3100 && time = 43
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
trigger1 = stateno = 3050 && time = 43
trigger2 = stateno = 3150 && time = 43
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
trigger1 = stateno = 3200 && time = 43
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
trigger1 = stateno = 50 || (stateno = [600, 699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = stateno = [700, 715]
trigger4 = (StateNo = [3000,4999])
time = 2

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
triggerall = statetype = A && movetype != H && numenemy
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)), 0]
trigger1 = p2statetype = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
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

[State -3, Stop Guarding Voice]
type = StopSnd
trigger1 = StateNo = [120,155]
channel = 0

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
trigger2 = NumHelper(3005)
trigger2 = (Helper(3005), StateNo = [3005,3007]) && Helper(3005), var(18)
trigger2 = var(23) := 3000
trigger3 = NumHelper(3055)
trigger3 = (Helper(3055), StateNo = [3007,3056]) && Helper(3055), var(18)
trigger3 = var(23) := 3050
trigger4 = StateNo = 3110
trigger4 = var(23) := 3110
trigger5 = StateNo = 3161
trigger5 = var(23) := 3161
trigger6 = StateNo = 3200 && movecontact
trigger6 = var(23) := 3200
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

