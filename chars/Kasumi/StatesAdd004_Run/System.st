; ADD004 BASIC PIEs ReBuilded CNS (18/06/2017)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _________________________________________
;| Kasumi Todoh by Falcon Rapper              |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===<SYSTEM STATES>====
;==

;---------------------------------------------------------------------------
;STANDING
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && !AnimTime
value = 0

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
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

;WALKING
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


;JUMPING
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


;RUN
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
trigger1 = (AnimElem = 3 || AnimElem = 6)
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

;EVADE
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
value = 700,0
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


;ROLL Forward 
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
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 710,0
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[state 70]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
x = 5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;ROLL Backward 
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
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 710,0
channel = 0

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[state 75]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
x = -5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 715, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;POWER CHARGE
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


;POWER CHARGE END
[Statedef 731]
type = S
physics = S
movetype = I
anim = 731
velset = 0, 0
ctrl = 1

[State 730, Full Power Voice]
type = PlaySnd
trigger1 = Time = 1 && Power >= const(data.power)
value = 182,0
channel = 0

[State 5336, 1]
type=removeexplod
trigger1= anim=731
ID=6058

[State 731, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 730, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;ZERO COUNTER 
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
value = ifElse(var(10) = 1, 450, 221)

;---------------------------------------------------------------------------
;Standing Parry
[StateDef 6080]
type = S
movetype = I
physics = S
anim = 760
velset = 0,0
ctrl = 0
sprpriority = 2
poweradd = 72

[State 760, EnvShake]
type = EnvShake
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 10
ampl = 5

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 12
movetime = 12

[State 760, HitBy]
type = NotHitBy
trigger1 =1
time = 1
value = SCA

[State 760, Voice]
type = PlaySnd
trigger1 = Time=0
value = S0,0
channel=0
[State 760, Parry Sound]
type = PlaySnd
trigger1 = Time=0
value = S760,0

[State 6080, blueflash]
type=palfx
trigger1=!time
add=0,50,255
sinadd=0,-50,-255,60
time=15
[State 6080, Spark]
type=explod
trigger1= !time
anim=8360
sprpriority=5
postype=p1
pos=ceil(12*const(size.xscale)),ceil(-71*const(size.yscale))
pausemovetime=-1
supermovetime=-1
scale=.5,.5
ownpal=1

[State 6080, RemoveExplod]
type = RemoveExplod
trigger1 =animelem!=2
id =8065

[State 6080, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nowalk
flag2 = nostandguard
flag3 = nocrouchguard
[State 6080, sprpriority]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = 0
[State 6080, CtrlSet]
type = CtrlSet
trigger1 = Time > 10
value = 1

[State 6080, ChangeState]
type = ChangeState
trigger1 = AnimTime=0
value = 0
ctrl = 1
;----------------------------------------------------------------------
;Crouching Parry
[StateDef 6081]
type = C
movetype = I
physics = C
anim = 761
velset = 0,0
ctrl = 0
sprpriority = 2
poweradd = 72

[State 6081, Pause]
type = Pause
trigger1 = !Time
time = 10
movetime = 10
[State 6081, EnvShake]
type = EnvShake
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 10
ampl = 5
[State 6081, HitBy]
type = NotHitBy
trigger1=1
time=1
value=SCA
[State 6081, blueflash]
type=palfx
trigger1=!time
add=0,50,255
sinadd=0,-50,-255,60
time=15
[State 6081, Voice]
type = PlaySnd
trigger1 = Time=0
value = S0,0
channel=0
[State 6081, Parry Sound]
type = PlaySnd
trigger1= Time=0
value=S760,0

[State 6081, Spark]
type=explod
trigger1= !time
anim=8360
sprpriority=5
postype=p1
pos=ceil(7*const(size.xscale)),ceil(-48*const(size.yscale))
pausemovetime=-1
supermovetime=-1
scale=.5,.5
ownpal=1

[State 6081, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nowalk
flag2 = nostandguard
flag3 = nocrouchguard
[State 6081, sprpriority]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = 0
[State 6081, CtrlSet]
type = CtrlSet
trigger1 = Time > 10
value = 1

[State 6081, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;--------------------------------------------------------------
;Aerial Parry
[Statedef 6082]
type = A
movetype = I
physics = A
anim = 762
ctrl = 0
sprpriority = 2
poweradd = 72

[State 6080, Pause]
type = Pause
trigger1 = !Time
time = 10
movetime = 10
[State 6082, EnvShake]
type = EnvShake
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 10
ampl = 5
[State 6082, HitBy]
type = HitBy
trigger1 = Time <=10
time = 1
value = SCA,AT
[State 6082, blueflash]
type=palfx
trigger1=!time
add=0,50,255
sinadd=0,-50,-255,60
time=15
[State 6082, StateTypeSet]
type = StateTypeSet
trigger1 = Time <= 10
physics = N

[State 6082, sts]
type = StateTypeSet
trigger1 = time > 10
physics = A

[State 6082, PosFreeze]
type = PosFreeze
trigger1 = Time <= 10
value = 1
[State 6082, Voice]
type = PlaySnd
trigger1 = Time=0
value = S0,0
channel=0
[State 6082, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = S760,0

[State 880, Spark]
type=explod
trigger1= !time
anim=8360
sprpriority=5
postype=p1
pos=ceil(21*const(size.xscale)),ceil(-84*const(size.yscale))
pausemovetime=-1
supermovetime=-1
scale=.5,.5
ownpal=1

[State 6082, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noairguard
[State 6082, sprpriority]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = 0
[State 6082, CtrlSet]
type = CtrlSet
trigger1 = time > 10
value = 1

;MAX MODE
[Statedef 770]
type = S
movetype = I
physics = S
anim = 770
ctrl = 0
velset = 0,0

[State 770, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0, 22
channel = 0

[State 770, MAX Snd]
type = PlaySnd
trigger1 = !Time
value = 770, 0

[State 770, Power Up! Text]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8291
ID = 8291
name = "Power Up FX"
posType = P1
pos = ceil(4 * const(size.xScale)), ceil(-62 * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State 770, PowerAdd]
type = PowerAdd
trigger1 = AnimElem = 1
value = -1000

[State 770, PowerSet Var]
type = Varset
trigger1 = Animelem = 1
var(24) = Power

[State 770, MAX Mode Timer]
type = VarSet
trigger1 = AnimElem = 1
var(53) = 1000

[State 770, Max Meter V2]
type = Helper
helpertype = Normal
trigger1 = Animelem = 1 && !NumHelper(780)
id = 780
pos = 0,0
postype = left
name = "Max Meter"
stateno = 780
ignorehitpause = 1
ownpal = 1

[State 770, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;MAX MODE BAR HELPER
[Statedef 780]
type = S
movetype = I
physics = N
anim = 1
sprpriority = 0
ignorehitpause = 1

[State 780, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1
pos = 0,-15

[State 780, Meter BG]
type = Explod
trigger1 = !Time
anim = 780
id = 780
pos = 2,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = -1
ontop = 1
ownpal = 1
removeongethit = 0

[State 780, Meter Fill]
type = Explod
trigger1 = Time = 2
anim = 781
id = 781
pos = 24,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 2
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, Meter Container]
type = Explod
trigger1 = Time = 2
anim = 782
id = 782
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, ModifyExplod]
type = ModifyExplod
trigger1 = root, Var(53) > 0
id = 781
scale = (5 + root, Var(53)) / 2000.0,.5
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 780
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 781
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(53) <= 0
id = 782
ignorehitpause = 1

[State 780, DestroySelf]
type = DestroySelf
trigger1 = root, Var(53) <= 0
ignorehitpause = 1

;CUSTOM COMBO GROUND 
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
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 5,-80
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


;CUSTOM COMBO AIR 
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
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 2,-90
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

;CUSTOM COMBO AIR FINISH
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



;GUARD START 
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


;STAND GUARD (guarding) ---
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

;CROUCH GUARD (guarding) ---
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


;AIR GUARD (guarding) ---
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


;GUARD (end) ---
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

;SGUARDHIT (shaking) ---
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
;SGUARDHIT2 (knocked back) ---
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


;CGUARDHIT (shaking) ---
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


;CGUARDHIT2 (knocked back) ---
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


;AGUARDHIT (shaking) ---
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


;AGUARDHIT2 (knocked away) ---
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

;LOSE 
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, Assert]
type = assertspecial
trigger1 = Time < 200
flag = roundnotover


;DRAW GAME
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0
[State 175, switch]
type = changestate
trigger1 = !time
value = 170

;---------------------------------------------------------------------------
; Win state decider
[Statedef 180]
type = S

[State 180, Victory Quotes(non-specific)]
type=VictoryQuote
trigger1=1
value=random%15

[State 180, Victory Quote]
type=VictoryQuote
trigger1 = Enemy, Name = "Ryo" || Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "cvsryo"
trigger2 = Enemy, Name = "Robert" || Enemy, Name = "Robert Garcia"
trigger3 = Enemy, Name = "Takuma" || Enemy, Name = "Takuma Sakazaki"
trigger4 = Enemy, Name = "Marco Rodrigues" || Enemy, Name = "Khushnood Butt"
value=15

[State 180, Victory Quote]
type=VictoryQuote
trigger1 = Enemy, Name = "Yuri" || Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "cvsyuri"
value=16

[State 180, Victory Quote]
type=VictoryQuote
trigger1 = Enemy, Name = "Eiji" || Enemy, Name = "Eiji Kisaragi"
value=17

[State 180, Victory Quote]
type=VictoryQuote
trigger1 = Enemy, Name = "Kasumi Todoh"
value=18

[State 180, 1]
type = ChangeState
trigger1 = time = 0
value = 181+(random%2)
;---------------------------------------------------------------------------
;winpose1
[Statedef 181]
type = S
physics = S
ctrl = 0
velset = 0,0
anim = 180

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

[State 182]
type = PlaySnd
trigger1 = AnimElem = 2
value = s4,0
[State 182]
type = PlaySnd
trigger1 = AnimElem = 5
value = s4,0
[State 182]
type = PlaySnd
trigger1 = AnimElem = 12
value = s4,1
[State 182]
type = PlaySnd
trigger1 = AnimElem = 17
value = 4,2

[State 182]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 0
[State 182]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1, 1
[State 182]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1, 3
[State 182]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1, 2

[State 181,5]
type = PlaySnd
trigger1 = AnimElem = 24
value = 181, 0

[State 181, 1]
type = AssertSpecial
trigger1 = Time = [0, 270]
flag = RoundNotOver

;---------------------------------------------------------------------------
;winpose2
[Statedef 182]
type = S
physics = S
ctrl = 0
velset = 0,0
anim = 181

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

[State 182,2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 182, 0
;[State 182,2]
;type = PlaySnd
;trigger1 = AnimElem = 13
;value = 182, 1

[State 181, 1]
type = AssertSpecial
trigger1 = Time = [0, 270]
flag = RoundNotOver

;---------------------------------------------------------------------------
; Introduction
[Statedef 190]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 190, 1]
type = ChangeState
trigger1 = Time = 0
value = 191
;---------------------------------------------------------------------------
; Introduction
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0


[State 181, 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = s700, 0

[State 181, 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = s190, 0
channel = 11

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Introduction (Vs Ryuko)
[Statedef 192]
type = S
physics = N
ctrl = 0
anim = 191
velset = 0,0

[State 193, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192,1]
type = PlaySnd
trigger1 = AnimElem = 7
value = 191, 0
channel = 11

[State 192,2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 191, 1


[State 193, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Introduction (Vs Shingo)
[Statedef 193]
type = S
physics = N
ctrl = 0
anim = 192
velset = 0,0

[State 193, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193,1]
type = PlaySnd
trigger1 = AnimElem = 12
value = 192, 0
channel = 11

[State 193, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Taunt
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S195,0
channel = 0

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Turns Intro
[Statedef 6900]
type = A
anim = 6900
velset = 0,0
ctrl = 0

[State 6900, Intro Assert]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, Camera]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 6900, Camera]
type = Helper
trigger1 = !Numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6900, PosSet]
type=PosSet
trigger1 =!time
x=Ifelse(teamside=1,-320,320)

[State 6900, Velocity]
type = VelSet
trigger1 = !Time
x = (helper(8999),rootdist x)/-40.0
y = -10.25

[State 6900, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 191,Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 191, 1
channel=1

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = Pos y>-Vel y
value = 6901

;---Land---
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0,0

[State 6901, Intro Assert]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 6901, Position]
type = Posset
trigger1 = !time && numhelper(8999)
x = ceil(helper(8999),pos x)

[State 6901, Landing Snd]
type = Playsnd
trigger1 = !Time
value = 52,0

[State 6901, Landing Dust]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 181, 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = s700, 0

[State 181, 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = s190, 0
channel = 0

[State 6901, End]
type = ChangeState
trigger1 = !Animtime
value = 0
;---------------------------------------------------------------------------
; Continue?
[Statedef 5500]
type = S
ctrl = 0
anim = 5300
velset = 0,0

[State 5500, 1] ;Use continue animation if available
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5500)
value = 5500

;CHEAP K.O.
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
value = 11,0

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




;AIR HIT TRANSITION 
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

;==<FORCED P2 RECOVERY>==
[StateDef 5025]
type = A
moveType = H
physics = N
velSet = 0,0
faceP2 = 1

[State 5025, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0

[State 5025, End]
type = SelfState
trigger1 = 1
value = ifElse(pos y, 5020, 5000)

;==<TARGET SAFE FALL>==
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, End]
type = SelfState
trigger1 = 1
value = ifElse(pos y < -20, 5210, 5200)

;FALL RECOVERY
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

;RECOVER NEAR GROUND
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
y = 0

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
value = 4,4
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


;FALL RECOVER AIR 
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



;TARGET SAFE FALL
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

;====<OFF SCREEN STAND BY>=
;Stand by
[Statedef 7827]
type=S
movetype=I
physics=N
velset=0,0
ctrl=0
facep2=1

[State 0, ScreenBound]
type=ScreenBound
trigger1 =1
value =0
ignorehitpause =1
[State 7827]
type=PosSet
trigger1=!time
y=0
ignorehitpause=1
[State 7827]
type=ChangeState
trigger1=NumEnemy=[1,2]
trigger1=Enemy(0),statetype=L || Enemy(0),movetype != H
value=7828
[State 7827]
type=ChangeState
trigger1=NumEnemy=2
trigger1=Enemy(1),statetype=L || Enemy(1),movetype != H
value=7828
;====<OFF SCREEN RUN IN>=
;Off Screen Run In
[Statedef 7828]
type   =S
physics=S
anim=100
ctrl=0
facep2=1

[State 7828, SND]
type=playsnd
trigger1=(animelem=3 || animelem=6)
value=100,0

[State 7828]
type=PosSet
trigger1=!Time
y=0
ignorehitpause=1
[State 7828]
type=VelSet
trigger1=AnimElem=1
x=7
ignorehitpause=1
[State 7828]
type=VelSet
trigger1=AnimElemNo(0)=[1,2]
x=9
ignorehitpause=1
[State 7828]
type=AssertSpecial
trigger1=1
flag=NoWalk
ignorehitpause=1
[State 7828]
type=AssertSpecial
trigger1=1
flag=NoAutoTurn
ignorehitpause=1

[State 7828]
type=ChangeState
trigger1= time>=20
value=7829
ctrl=0
;====<OFF SCREEN RUN STOP>=
;Off Screen Run Stop
[Statedef 7829]
type   =S
physics=S
anim=101
ctrl=0

[State 7829,VelMul]
type=VelMul
trigger1 =time=2
x=.5
[State 7829,Dust]
type=MakeDust
trigger1=time%6
pos=30, 0

[State 7829, SND]
type=playsnd
trigger1 =!time
value=0, 101
persistent=0
[State 7829,END]
type=ChangeState
trigger1=!animtime
value=0
ctrl=1

;---------------------------------------------------------------------------
; Stand get-hit (shaking)
[Statedef 5000]
type = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;Stand get-hit (knocked back)

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

;---------------------------------------------------------------------------
; Stand get-hit (knocked back)
[Statedef 5001]
type = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = ChangeState
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouch get-hit (shaking)
[Statedef 5010]
type = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5011 ;Crouch get-hit (knocked back)

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Crouch get-hit (knocked back)
[Statedef 5011]
type = C
movetype= H
physics = C

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, 6]
type = ChangeState
trigger1 = HitOver
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Air get-hit (shaking)
[Statedef 5020]
type = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Air get-hit (knocked away)
[Statedef 5030]
type = A
movetype= H
physics = N
ctrl = 0

[State 5030, 1]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 5030, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 4]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 5040 ;HITA_RECOV

[State 5030, 5]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 5050 ;HITA_FALL

[State 5030, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 5035 ;Air get-hit (transition)

;---------------------------------------------------------------------------
; Air get-hit (transition)
[Statedef 5035]
type = A
movetype= H
physics = N

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;Air get-hit (recovering in air, not falling)

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5050 ;Air get-hit (falling)

;---------------------------------------------------------------------------
; Air get-hit (recovering in air, not falling)
[Statedef 5040]
type = A
movetype= H
physics = N

[State 5040, 1]
type = ChangeState
trigger1 = !Alive
value = 5050
ctrl = 0

[State 5040, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim != 5040
trigger2 = Time = 0
trigger2 = Anim != 5035
value = 5040

[State 5040, 3]
type = CtrlSet
trigger1 = HitOver
value = 1

[State 5040, 4]
type = StateTypeSet
trigger1 = HitOver
movetype = I

[State 5040, 5]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5040, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52 ;Jump land

;---------------------------------------------------------------------------
; Air get-hit (falling)
[Statedef 5050]
type = A
movetype= H
physics = N

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= Const(movement.air.gethit.groundrecover.ground.threshold)
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;Air get-hit (fall recovery on ground)

[State 5050, 5]; Recover in mid air
type = ChangeState
triggerall = Vel Y > Const(movement.air.gethit.airrecover.threshold)
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;Air get-hit (fall recovery in air)

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, Const(movement.air.gethit.groundlevel))
value = 5100 ;Downed get-hit (hit ground from fall)

;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 5070]
type = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 5071

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Tripped get-hit (knocked away)
[Statedef 5071]
type = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = ChangeState
value = 5110

;---------------------------------------------------------------------------
; Downed get-hit (shaking)
[Statedef 5080]
type = L
movetype= H
physics = N
velset = 0,0

[State 5080, 1] ;Set default anim
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3] ;If 5090 doesn't exist, default to 5030
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3] ;Freeze
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 5081 ;Downed get-hit (knocked back)

[State 5080, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) != 0
value = 5030 ;Air get-hit (knocked away)

;---------------------------------------------------------------------------
; Downed get-hit (knocked back)
[Statedef 5081]
type = L
movetype= H
physics = C

[State 5081, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5081, 2]
type = VelSet
trigger1 = HitOver
x = 0

[State 5081, 3] ;Don't show hit ground frame
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
type = ChangeState
trigger1 = HitOver
value = 5110 ;Downed get-hit (lying down)

;---------------------------------------------------------------------------
; Downed get-hit (hit ground from fall)
[Statedef 5100]
type = L
movetype= H
physics = N

[State 5100, 2004.04.14 behavior]
type = null;VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x < -1
x = -1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;Downed get-hit (lying down)

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101 ;Downed get-hit (bounce off ground)

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; Downed get-hit (bounce off ground)
[Statedef 5101]
type = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = Const(movement.down.bounce.offset.y)

[State 5101, 5]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 5101, 6] ;Acceleration
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 5101, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
type = ChangeState
value = 5110

;---------------------------------------------------------------------------
; Downed get-hit (lying down)
[Statedef 5110]
type = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5110, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5110, 15]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 16]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

;---------------------------------------------------------------------------
; Downed get-hit (getting up)
[Statedef 5120]
type = L
movetype= I
physics = N

[State 5120, 1a] ;Get up anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 5120, 1b] ;Get up anim (for hit up/diag-up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 5120, 2]
type = VelSet
trigger1 = Time = 0
x = 0

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5120, 4]
type = HitFallSet
trigger1 = AnimTime = 0
value = 1

[State 5120, 5] ;Can't be thrown right after getting up
type = NotHitBy
trigger1 = AnimTime = 0
value = , NT,ST,HT
time = 12

[State 5120, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = AnimTime = 0
value2 = SCA
time = 3

[State 5120, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====< K.O. >====
[Statedef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, Anim]
type = changeanim
trigger1 = !time
value = 5150+1*(prevstateno=5950||anim=5950)

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
value = SCA
time = 1

;---------------------------------------------------------------------------
; Air get-hit (fall recovery on ground; still falling)
[Statedef 5200]
type = A
movetype= H
physics = N

[State 5200, 1] ;Change anim if done with transition
type = ChangeAnim
trigger1 = Anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 5200, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5200, 3]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.groundrecover.groundlevel)
value = 5201

;---------------------------------------------------------------------------
; Air get-hit (fall recovery on ground)
[Statedef 5201]
type = A
movetype= H
physics = A
anim = 5200

[State 5201, 1] ;Turn if not facing opponent
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < Const720p(-20)

[State 5201, 2]
type = VelSet
trigger1 = Time = 0
x = Const(velocity.air.gethit.groundrecover.x)
y = Const(velocity.air.gethit.groundrecover.y)

[State 5201, 3]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5201, 4]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, 5] ;Blink white
type = PalFX
trigger1 = Time = 0
time = 3
add = 128,128,128 ;256,256,256

[State 5201, 6]
type = Explod
trigger1 = Time = 0
anim = F60
pos = 0, -floor(vel y)
sprpriority = -10

;---------------------------------------------------------------------------
; Air get-hit (fall recovery in air)
[Statedef 5210]
type = A
movetype= I
physics = N
anim = 5210
ctrl = 0

[State 5210, 1] ;Blink white
type = PalFX
trigger1 = Time = 0
time = 3
add = 128,128,128

[State 5210, 1]
type = PosFreeze
trigger1 = Time < 4

[State 5210, 2] ;Turn if not facing opponent
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < Const720p(-80)

[State 5210, 1.0 behavior 1]
type = VelMul
trigger1 = Time = 4
x = Const(velocity.air.gethit.airrecover.mul.x)
y = Const(velocity.air.gethit.airrecover.mul.y)

[State 5210, 1.0 behavior 2]
type = VelAdd
trigger1 = Time = 4
x = Const(velocity.air.gethit.airrecover.add.x)
y = Const(velocity.air.gethit.airrecover.add.y)

[State 5210, 2002.04.14 behavior 1]
type = null;VelMul
trigger1 = Time = 4
x = .8
y = .8

[State 5210, 2002.04.14 behavior 2]
type = null;VelAdd
trigger1 = Time = 4
x = 0 
y = -4.5

[State 5210, 2002.04.14 behavior 3]
type = null;VelMul
trigger1 = Time = 4
trigger1 = Vel Y > 0
y = .5

[State 5210, 2002.04.14 behavior 4]
type = null;VelAdd
trigger1 = Time = 4
trigger1 = Vel Y > -3
y = -2

[State 5210, 2002.04.14 behavior 5]
type = null;VelAdd
trigger1 = Time = 4
trigger1 = Vel Y > -2
y = -1

[State 5210, 2] ;Go up
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holdup"
y = Const(velocity.air.gethit.airrecover.up)

[State 5210, 2] ;Go down
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holddown"
y = Const(velocity.air.gethit.airrecover.down)

[State 5210, 2] ;Go fwd
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holdfwd"
x = Const(velocity.air.gethit.airrecover.fwd)

[State 5210, 2] ;Go back
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holdback"
x = Const(velocity.air.gethit.airrecover.back)

[State 5210, 3]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 15

[State 5210, 4]
type = CtrlSet
trigger1 = Time = 20
value = 1

[State 5210, 5]
type = VelAdd
trigger1 = Time >= 4
y = Const(movement.air.gethit.airrecover.yaccel)

[State 5210, 5] ;Land on ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52 ;Jump land
ctrl = 1

;-------------------------------------------------------------------------------
;Super Jump
[Statedef 123]
type = A
movetype = I
physics = N
anim = 40
velset = 0,0
ctrl = 0

[State 123, reset]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 123, Direction]
type = varset
trigger1 = !AILevel
sysvar(1) = Ifelse(!time, 0, Ifelse(command = "holdfwd", 1, Ifelse(command = "holdback", -1, sysvar(1))))
[State 123, Direction]
type = varset
trigger1 = AILevel
sysvar(1) = Ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, Ifelse((enemynear, movetype = A), -1, 0))

[state 123, playsnd]
type = playsnd
trigger1 = !AnimTime
value = s110,0
channel = 4
[State 123, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = Ifelse((sysvar(1) = 0), 40, 41), 0
[State 123, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 123, velset]
type = VelSet
trigger1 =!animtime
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.runjump.y)*1.1


[State 123, Change]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 1
;==
;====Syn===
;==
;DRAMATIC KO PAUSE
[Statedef 9944]
type = s
movetype = i
physics = n

[State 9944, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 9944, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 9944, Dramatic KO Helper]
type = helper
triggerall = (root,alive || enemy,alive)
trigger1 = roundstate = 3 && (root,life <= 0 || enemy,life <= 0)
helpertype = Normal
id = 9955
pos = 0,0
postype = p1
name = "K.O."
stateno = 9955
supermovetime = 9999999999
pausemovetime = 9999999999
persistent = 0
ignorehitpause = 1
;==
;===Syn====
;==
;DRAMATIC KO PAUSE HELPER
[Statedef 9955]
type = s
movetype = i
physics = n

[State 9955, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible
flag3 = nokoslow;<------------optional
ignorehitpause = 1

[State 9955,NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 9955, pause]
type = Pause
trigger1 = 1
time = 28;<---adjust to your likings
ignorehitpause = 1
persistent = 0

[State 9955, DestroySelf]
type = DestroySelf
trigger1 = time >= 28;<---make the time match the time in the pause code above

;===
;===< -2 STATES >=
;===
[Statedef -2]

;#ADD004BASIC PIEs#
;//==
;// add004-sctrls-start
;//==
;sys::-2::partners_standby ; パートナー待機
[state 0]
	type=selfstate
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(交替)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(協力)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(割り込み交替)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(順位)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	value=190190
	ctrl=0
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; 割り込み交替
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ライフバー
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
	size.air.front=1701220 ;; <<-version
	size.height=0
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID取得
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

;sys::-2::bk/jd_system ; ブロキング/ジャストD
[state 0]
	type=hitoverride
	trigger1=(numprojid(195502)||numprojid(195503)) && !ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1

;//==
;;>>@Config.Face>>
;sys::-2::face_d ; portrait (顔)
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
;sys::-2::camera_nc ; 焦点変更
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
;sys::-2::guard_crush_fx ; ガードクラッシュ
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
;;--- fadeout when KOed ; KO後消える
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
;;sys::-2::st5150-3
;[state 0]
;	type=posset
;	trigger1=stateno=5150 && time>=80 && alive=0 && !ishelper && numpartner && sysvar(1)
;	y=800 *(((time=[80,150]) && time%10<5) || time>150)
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


[State 0, StopSnd]
type = StopSnd
trigger1=stateno!=[190,194]
channel = 11

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
flag = nojugglecheck
IgnoreHitPause = 1


[state -2, No Clones]
type = remappal
triggerall=numenemy && (var(26)=[1,20])
trigger1=var(27)&&!numhelper(256)&&matchno=1&&roundno=1
trigger1=enemy,authorname="Falcon Rapper"&&enemy,name="Kasumi Todoh"&&enemy,var(26)=var(26)
source = 1, 1
dest = 1, Ifelse(teamside!=1 && enemynear,Numhelper(256)=0,enemy,var(26)+teamside,var(26))
ignorehitpause = 1
[state -2, Palette]
type = varset
trigger1 = numhelper(256)
trigger1=helper(256),var(26)=[1,60]
var(26)= helper(256),var(26)
ignorehitpause = 1
[state -2, Palette Selection]
type = remappal
trigger1 = numhelper(256)
trigger1=helper(256),var(26)=[1,60]
source = 1, 1
dest = 1, var(26)
ignorehitpause = 1
[state -2, Continue Palette]
type = remappal
trigger1=var(27)&&matchno>1
source = 1, 1
dest = 1, var(26)
ignorehitpause = 1


[State -2, Hit Detection]
type=varset
trigger1= movecontact=1 && var(30)<0
var(30)= hitpausetime
ignorehitpause=1

[State -2, Hit Detection]
type=varset
trigger1= movecontact!=1
var(14)=2

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime && var(14)=1
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = [8010,8024]
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = Ifelse(MoveGuarded, var(34), Ifelse(var(33) < 8020,8010,8020))
ID = 8000
name = "Spark"
postype = P1
pos = Ifelse(P2Dist x < 0, 0, Ifelse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
size.xscale =1.0
size.yscale =1.0
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1= movehit=1 && var(30)=hitpausetime
trigger1= numenemy && var(9)
trigger1= !(hitdefattr=SCA,AT) && (stateno!=[1005,1006])&& (stateno!=[1055,1056])&& stateno!=1100 && stateno!=1150 && stateno!=1201 && stateno!=1251 && stateno!=1310 && stateno!=1351 && stateno!=3000 && stateno!=3050 && stateno!=3200 && (stateno!=[3105,3106])&& (stateno!=[3155,3156])&& (stateno!=[3305,3306])&& stateno!=3453
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
size.xscale =1.0
size.yscale =1.0
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(9) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type=varset
trigger1= 1
var(30)=-1
[State -2, Hit Detection]
type=varrangeset
trigger1= movetype=I 
trigger2= movetype=H && time
first=30
last=36
value=-1
ignorehitpause=1

[State -2, Hit Detection]
type=varadd
trigger1= var(14)>0
var(14)=-1
ignorehitpause=1

[State -2, P2 Recovery]
type = TargetState
trigger1 = NumTarget(200)
trigger1 = (Target(200), StateNo = 5020) && (Target(200), Alive) && (Target(200), HitFall)
ID = 200
value = 5025
ignoreHitPause = 1
[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target, command = "recovery"
trigger1 = Target, pos y >= -20 && Target, vel y > 0
trigger1 = Target, Alive && Target, HitFall && Target, GetHitVar(fall.recover)
trigger1 = Target, StateNo = 5030 || Target, StateNo = 5035 || Target, StateNo = 5050 || Target, StateNo = 5071
value = 5205
ignoreHitPause = 1

[State -2, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

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
type=varadd
trigger1= movehit=1
trigger1= !(hitdefattr=SCA,AT)
var(15)=1
[State -2, Juggle Reset Single]
type=varset
triggerall= numenemy=1 && var(15)
trigger1= (enemy,statetype!=A) && ((enemy,stateno!=[5100,5109])||(enemy,statetype!=L)) && (enemy,time>=1)
trigger2= (enemy,movetype!=H) || (enemy,stateno=[120,155]) || (enemy,ctrl)
var(15)=0
ignorehitpause=1
[State -2, Juggle Reset Simul]
type=varset
triggerall= numenemy>=2 && var(15)
trigger1= (enemynear(0),statetype!=A) && (enemynear(0),time>=1)
trigger2= (enemynear(0),movetype!=H) || (enemynear(0),stateno=[120,155]) || (enemynear(0),ctrl)
trigger3= (enemynear(1),statetype!=A) && (enemynear(0),time>=1)
trigger4= (enemynear(1),movetype!=H) || (enemynear(0),stateno=[120,155]) || (enemynear(0),ctrl)
var(15)=0
ignorehitpause=1
[State -2, Free Juggling]
type=varset
trigger1= roundstate!=2
var(15)=0
ignorehitpause=1

[State -2, Juggle Flag]
type=varset
trigger1= numenemy && !var(16)
trigger1= (enemynear,stateno=5040) && !(enemynear,ctrl)
var(16)=1
ignorehitpause=1
[State -2, Juggle Flag Reset Single]
type=varset
triggerall= numenemy=1 && var(16)
trigger1= (enemy,movetype!=H) && (enemy,stateno!=5040)
trigger2= !(enemy,hitshakeover) || (enemy,statetype=L) || (enemy,ctrl)
trigger3= (enemy,movetype!=H) || (enemy,stateno=[120,155]) || (enemy,ctrl)
var(16)=0
ignorehitpause=1
[State -2, Juggle Flag Reset Simul]
type=varset
triggerall= numenemy>=2 && var(16)
trigger1= (enemynear(0),movetype!=H) && (enemynear(0),stateno!=5040)
trigger2= !(enemynear(0),hitshakeover) || (enemynear(0),statetype=L) || (enemynear(0),ctrl)
trigger3= (enemynear(1),movetype!=H) && (enemynear(1),stateno!=5040)
trigger4= !(enemynear(1),hitshakeover) || (enemynear(1),statetype=L) || (enemynear(1),ctrl)
trigger5= (enemynear,movetype!=H) || (enemynear,stateno=[120,155]) || (enemynear,ctrl)
var(16)=0
ignorehitpause=1

[State -2, Juggle Limit Single]
type=varadd
triggerall= (numenemy=1||numtarget=1) && Ifelse((stateno=[3000,4999])&&(prevstateno!=[3000,4999]),time>50,time>=1)
trigger1= ((enemy, stateno=5030)||(enemy, stateno=5071))&&(enemy, hitfall)&&(enemy,time=1)
trigger2= (enemy, stateno=5100)&&(enemy, prevstateno!=5050)&&(enemy, statetype=L)&&(enemy,time=1)
trigger4= (enemy, stateno=5110)&&(enemy, prevstateno!=5071)&&(enemy, statetype=L)&&(enemy,time=1)
trigger5= (enemy,movetype=H)&&(enemy, stateno!=[5000,5300])&&(enemy, vel y !=0)&&(enemy,time=1)
trigger6= (enemy,statetype=L)&&(enemy, stateno!=[5000,5300])&&(enemy,time=1)
fvar(8)=1
ignorehitpause=1
[State -2, Juggle Limit Simul]
type=varadd
triggerall= ((numenemy>=2)||(teammode=simul)||(enemy,teammode=simul)) && Ifelse((stateno=[3000,4999])&&(prevstateno!=[3000,4999]),time>50,time>=1)
trigger1= ((enemynear, stateno=5030)||(enemynear, stateno=5071))&&(enemynear, hitfall)&&(enemynear,time=1)
trigger2= (enemynear, stateno=5100)&&(enemynear, prevstateno!=5050)&&(enemynear, statetype=L)&&(enemynear,time=1)
trigger4= (enemynear, stateno=5110)&&(enemynear, prevstateno!=5071)&&(enemynear, statetype=L)&&(enemynear,time=1)
trigger5= (enemynear,movetype=H)&&(enemynear, stateno!=[5000,5300])&&(enemynear, vel y !=0)&&(enemynear,time=1)
trigger6= (enemynear,statetype=L)&&(enemynear, stateno!=[5000,5300])&&(enemynear,time=1)
fvar(8)=.5
ignorehitpause=1
[State -2, Juggle Limit Reset]
type=varset
triggerall= numenemy=1
trigger1= (enemynear,movetype!=H)&&(enemynear,statetype!=A||enemynear,statetype!=L) && (enemy,ctrl) && (enemy,time>=1)
trigger2= moveguarded
fvar(8)=0
ignorehitpause=1
[State -2, Juggle Limit Simul]
type=varset
triggerall= ((numenemy>=2)||(teammode=simul)||(enemy,teammode=simul))
trigger1= (enemynear,movetype!=H)&&(enemynear,statetype!=A||enemynear,statetype!=L) && (enemy,ctrl) && (enemy,time>=1)
trigger2= moveguarded
fvar(8)=0
ignorehitpause=1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause=1
[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1
[State -2, Custom Combo Asserts]
type = AssertSpecial
trigger1 = var(20) > 0
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard
ignoreHitPause = 1
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

[State -2, Throws Disallowed]
type=varset
trigger1= 1
var(38)= 0
[State -2, Throws Disallowed]
type=varset
trigger1= (enemynear,stateno=[150,155])
trigger2= (enemynear,movetype=H && enemynear,statetype!=A) && !var(20) && !var(21) && !var(22)
trigger3= (enemynear,stateno=[5020,5040]) && !(enemynear,hitfall)
trigger4= ((enemynear,stateno=0) || (enemynear,stateno=52)) && (enemynear,prevstateno=[5000,5040]) && ((enemynear,time<=0) || !(enemynear,ctrl))
trigger5= (enemynear,stateno=0) && (enemynear,prevstateno=52) && ((enemynear,time<=0) || !(enemynear,ctrl))
trigger6= (enemynear,stateno=40) && (enemynear,time>=1 || enemynear,prevstateno=0 || enemynear,prevstateno=52)
var(38)= 1

;-------------------------------------------------------------------
[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

;P2 wall hit---------------------------------------------------------------
[state -2,Bounce SND]
type = playsnd
trigger1=P2movetype=H && p2stateno=4061 && enemy,time=1
persistent = 0
ignorehitpause = 1
value = S669,0
volumescale = 100 - (5*time)
channel = 22

[State -2,SND]
type = PlaySnd
trigger1 = P2movetype=H && p2stateno = 4021 && enemynear,animelemtime(1)=1
trigger2 = P2movetype=H && p2stateno = 1321 && enemynear,animelemtime(1)=1
value =5000,11
persistent = 0
ignorehitpause = 1

[State -2, Wall Impact Dust]
type = Helper
triggerall=!numhelper(8111) && numenemy
trigger1=P2movetype=H && p2stateno=1072 && enemy,time=1
trigger2=P2movetype=H && p2stateno=4061 && enemy,time=1
helperType = Normal
stateNo = 8111
ID = 8111
name = "Wall Impact Dust"
posType = P2
facing = -1
pos= floor(-5*const(size.xscale)),ceil(-70*const(size.yscale))
ownPal = 1
ignorehitpause=1

[State -2, Ground Impact Dust];Not used, but still added just incase...
type = null;Helper
trigger1 = NumTarget(635)
trigger1 = (Target(635), StateNo = 636) && !NumHelper(8110)
helperType = Normal
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1
;=
[State -2, StopSnd]
type = StopSnd
trigger1 = Movetype=H
channel = 10
ignorehitpause = 1
;=
;Dampener
;=
[State -2, Damage based on hits]
type=varset
triggerall= numenemy
trigger1= MoveHit = 1
trigger1=!moveguarded
trigger2=enemynear,movetype=H||enemynear,Statetype=L
fvar(12)=1
ignorehitpause=1
[State -2, Reset var when the opponent recovers]
type=varset
triggerall=numenemy
trigger1=enemynear,hitover && enemynear,hitshakeover && enemynear,ctrl=1
trigger1=enemynear,movetype!=H || enemynear,Statetype!=L || (enemynear,stateno!=[5000,5120])
trigger2= moveguarded
trigger3=(stateno=[810,860]) && movetype!=H
trigger4=enemynear,stateno=0 && enemynear,movetype!=H
fvar(12)=0
ignorehitpause=1

[State -2, Control]
type = Varset
trigger1 = 1
fvar(9) = Ifelse((ctrl||stateno=[0,110]),1,0)
ignoreHitPause =1
[State -2, combo]
type=varset
trigger1 = (stateno = [200,4999])&& movehit 
fvar(13)=Ifelse(fvar(12)=0,0,Ifelse((stateno = [200,999]),1,Ifelse((stateno = [1000,2999]),2,3)))
ignorehitpause=1

[State -2, Dampener - Normals]
type=varset
trigger1=(stateno=[200,599]) && fvar(12) && (fvar(13)=[0,1])
fvar(10)= 0.9 * (Ifelse(var(13)<2,1.0,(1.00-(var(13)*.075))))
ignorehitpause=1
[State -2, Dampener - Normals]
type=varset
trigger1=(stateno=[600,999]) && fvar(12) && (fvar(13)=[0,1])
fvar(10)= 0.8 * (Ifelse(var(13)<2,1.0,(1.00-(var(13)*.075))))
ignorehitpause=1
[State -2, Dampener - Specials]
type=varset
trigger1=(stateno=[1000,2999]) && fvar(12) && (fvar(13)=[0,2])
fvar(10)= Ifelse((prevstateno=[3000,4999]),0.6,Ifelse((prevstateno=[200,999])||fvar(10)!=1,0.85,1.0)) * (Ifelse(var(13)<12,1.0,(1.00-(var(13)*.025))))
ignorehitpause=1
[State -2, Dampener for Supers]
type=VarSet
trigger1=(StateNo=[3000,4999])
fvar(10)=Ifelse(var(22),0.7,Ifelse(var(21), 0.85,Ifelse((prevstateno=[200,999]),.9, Ifelse(fvar(10)=1.0,1.0,fvar(10)))))* (Ifelse(var(13)<60,1.0,(1.00-(var(13)*.025))))
ignoreHitPause=1

[State -2, Dampener - Custom Combo]
type=varset
trigger1= var(20)
fvar(10)= .72 * (10 - ifelse(var(13)>=12, 10, var(13))) / 10.0
ignorehitpause=1

[State -2, Super Charge Reset]
type=varset
trigger1=(stateno=3000|stateno=3050) && time>=100
fvar(10)= 1
ignorehitpause=1

[State -2, Dampener - Backup reset]
type=varset
trigger1=fvar(12)=0||var(20)
fvar(11)=0
ignorehitpause=1
[State -2, Backup Dampener]
type=varset
trigger1=fvar(9) && fvar(10)=1 && fvar(12) 
fvar(11)=1
ignorehitpause=1
[State -2, Backup Dampener - supers]
type=varset
trigger1 = fvar(11)
fvar(10)=0.8 * (10 - ifelse(var(13)>60, 10, var(13))) / 10.0
ignorehitpause=1

[State -2, Dampener for Safety]
type=varset
triggerall = numenemy
trigger1=fvar(9) && fvar(12)
trigger1=(enemynear,Statetype=L||(enemynear,stateno=[5100,5120]))
fvar(10)= 0.5 * (10 - ifelse(var(13)>=6, 10, var(13))) / 10.0
ignorehitpause=1

[State -2, Dampener Reset]
type = VarSet
trigger1 = fvar(12)=0
fvar(10) = 1
ignoreHitPause = 1
[State -2, Dampener Limit]
type=varset
trigger1= fvar(10)<=0.1
fvar(10)=0.1
ignorehitpause=1
[State -2, Dampener itself]
type=attackmulset
trigger1= 1
value=fvar(10)
ignorehitpause=1
;----------------------------------------------------------
[State -2, Debug]
trigger1 = 1
type = DisplayToClipboard
ignorehitpause = 1
text = "Damp = %d Limit = %d juggle = %d hit = %d  Front =%d Back = %d"
params = fvar(10) , fvar(8), var(15) , var(13) , frontedgebodydist , backedgebodydist
ignorehitpause=1
[State -2, Debug 2]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Falcon Rapper"
ignoreHitPause = 1
;---------------------------------------------------------------------------
; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------

[Statedef -3]

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3,veladd]
type = Veladd
triggerall= !AILevel&&roundstate=2&&command = "holdfwd"&& prevstateno = 123
trigger1 = stateno = 50
x = .1
[State state-3,veladd]
type = Veladd
triggerall= !AILevel&&roundstate=2&&command = "holdback"&& prevstateno = 123
trigger1 = stateno = 50
x = -.1
[State -3,veladd]
type = Veladd
triggerall = (AILevel)&& prevstateno = 123&&(enemy,vel y < -1)&&(p2bodydist x >= 45)&& p2movetype != A
trigger1 = p2statetype = A
x = .2

[State -3, Corner Push]
type = VarSet
triggerAll = fvar(5)
trigger1 = abs(fvar(5)) <= (1 / 0.85)
trigger2 = NumTarget
trigger2 = Target, GetHitVar(HitTime) <= 0 || (Target, GetHitVar(HitShakeTime) > 0 && Target, Time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85
[State -3, Corner Push]
type = VarSet
triggerall = movetype != H
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1
[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 1
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yVel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= 0 && (Target, GetHitVar(xVel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= 0 && (Target, GetHitVar(xVel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Chain Combo Reset]
type=VarSet
trigger1=1
var(4)=0
ignoreHitPause=1
[State -3, Chain Combo Check]
type=VarSet
trigger1=var(20) && (StateNo=[200,699]) && MoveContact
trigger2=var(20) && (StateNo=[1000,2999]) && StateType != A && (MoveContact)
var(4)=1
ignoreHitPause=1

[State -3, Cheap KO]
type = ChangeState
trigger1 = !Alive && (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo = [150,153])
value = 5950
ignoreHitPause = 
[State -3, Assert: NoKOsnd (Cheap KO)]
type = AssertSpecial
trigger1 = (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo=[150,153])
flag = NoKOsnd
ignoreHitPause = 1

[State -3, Get Hit Sound]
type=PlaySnd
triggerAll=Alive && Time=1
triggerAll=StateNo=5000 || StateNo=5010
trigger1=GetHitVar(AnimType) >= 2 && Random < 500
trigger2=GetHitVar(AnimType)=1 && Random < 375
trigger3=GetHitVar(AnimType)=0 && Random < 250
value=5000,(Random % 2)
channel=0
ignoreHitPause=1
[State -3, Get Hit Sound]
type =PlaySnd
triggerAll=Alive && Time=1
trigger1=(StateNo=5000 || StateNo=5010) && NumEnemy
trigger1=GetHitVar(fall) || (EnemyNear, HitDefAttr=SCA,SA,HA)
trigger2=(StateNo=5020 || StateNo=5070 || StateNo=5080)
trigger3=(StateNo=5050 || StateNo=5100) && (PrevStateNo != [5000,5199])
value=5000,(Random % 2)
channel=0
ignoreHitPause=1

[State -3, Special Cancel Reset]
type = VarSet
trigger1 = 1
var(5) = 0
ignoreHitPause = 1
[State -3, Special Cancel Check]
type = VarSet
trigger1= (stateno = [200,699]) && Time <= 2
trigger2= (stateno = [200, 250]) && movecontact && stateno!=221 && var(55)
trigger3= (stateno = [400, 440]) && movecontact && var(55)
trigger4= var(20) && (stateno = [1000,1060]) && animelemtime(7)>1
trigger5= var(20) && (stateno = [1000,1010]) && animelemtime(7)>1
trigger6= var(20) && var(10)!=2 && stateno = 1300 && animelemtime(5)>1
trigger7= var(20) && var(10)=2 && stateno = 1300 && animelemtime(7)>1
trigger8= var(20) && (stateno = [1800,1810]) && animelemtime(7)>1
trigger9= var(20) && stateno = 1310 && movecontact
trigger10= var(20) && stateno = 1105 && animelemtime(1)>1
trigger11= var(20) && stateno = 1205 && animelemtime(1)>1
trigger12= (stateno = [200, 250]) && movecontact && stateno!=221 && !var(55)
trigger12= anim!=200 && anim!=215 && anim!=240 && anim!=250
var(5) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1
[State -3, Super Cancel Check]
type = VarSet
trigger1= (stateno = [200,699]) && Time <= 2
trigger2= (stateno = [200, 250]) && movecontact
trigger3= (stateno = [400, 450]) && movecontact
trigger4= (stateno = [1000, 1299]) && movecontact
trigger5= stateno = 1410 && animelemtime(6)>=0
trigger6= stateno = 1505 && animelemtime(10)>=1
trigger7 = NumHelper(1005)
trigger7 = (Helper(1005), StateNo = [1006,1008])
var(6) = 1
ignoreHitPause = 1

[State -3, Lv.1 Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1
[State -3, Lv.1 Cancel Check]
type = VarSet
trigger1= stateno= 3110 && animelemtime(16)>= 20
trigger2= stateno= 3210 && animelemtime(11)>= 0
var(7) = 1
ignoreHitPause = 1

[State -3, Underground Juggle Prevention]
type = TargetBind
trigger1 = MoveContact = 1
trigger1 = NumTarget && NumEnemy
trigger1 = (Target, Time = 0) && (Target, ID = EnemyNear, ID)
trigger1 = !(Target, HitShakeOver) && (Target, pos y > 0)
pos = ceil(P2Dist x), ceil(-pos y)
ignoreHitPause = 1
[State -3, Prevent Crossup]
type = Width
trigger1 = 1
edge = 8,0
ignoreHitPause = 1
[State -3, Variable Height]
type = PlayerPush
triggerAll = StateType = A && MoveType != H && NumEnemy
triggerAll = P2BodyDist x = [-(EnemyNear, const(size.ground.back) + EnemyNear, const(size.ground.front)), 0]
trigger1 = P2StateType = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignoreHitPause = 1

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

[State -3, Movement AfterImage]
type=AfterImage
triggerAll=Time=1 && !var(20)
trigger1=StateNo=50 && (var(3)=2 || var(3)=3) && PrevStateNo!=123
trigger2=(StateNo=[700,715])
trigger3=StateNo=5950
trigger4=StateNo=50 && PrevStateNo=123
time=2
timeGap=1
frameGap=4
length=9
palBright=0,0,0
palContrast=128,128,128
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.9,0.9,0.9
trans=Add1

[State -3, Level 1 Super AfterImage]
type=AfterImage
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3110 || StateNo = 3111 || StateNo = 3200 || StateNo = 3230 || StateNo = 3300) && Time = 43
time=2
timeGap=1
frameGap=10
length=21
palBright=0,0,0
palContrast=128,128,128
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.75,0.75,0.75
trans=Add1

[State -3, Level 2 Super AfterImage]
type=AfterImage
trigger1 = (StateNo = 3060 || StateNo = 3150 || StateNo = 3250 || StateNo = 3260 || StateNo = 3350 || StateNo = 3400) && Time = 43
time=2
timeGap=1
framegap=10
length=21
palBright=0,0,0
palContrast=32,32,160
palPostBright=0,0,0
palAdd=0,0,0
palMul=0.75,0.75,0.75
trans=Add1

[State -3, Level 3 Super AfterImage]
type=AfterImage
trigger1=StateNo=3500 && Time=43
time=2
timeGap=1
frameGap=10
length=21
palBright=0,0,0
palContrast=160,32,32
palPostBright=0,0,0
palAdd=0,0,0
palMul= 0.75,0.75,0.75
trans=Add1

[State -3, AfterImage Persist]
type=AfterImageTime
trigger1=StateNo=50 || (StateNo=[600,699])
trigger1=(var(3)=2 || prevstateno=123 || var(3)=3) && vel y < -1
trigger2=var(20)
trigger3=StateNo=[700,715]
trigger4=StateNo=[1100,1160]
trigger5=(StateNo=[3000,4999]) 
time=2

[State -3, AfterImage Off]
type=AfterImageTime
triggerAll=Time <= 1
trigger1=StateNo=3000 || StateNo=3050 || Stateno=3100 || StateNo=3150 
trigger2=Stateno=3200 || StateNo=3250 || StateNo=3300 || StateNo=3350
trigger3=Stateno=3400 || StateNo=3500 
trigger4=Movetype=H
time=0
[State -3, AfterImage Off]
type=AfterImageTime
trigger1=Movetype=H
time=0
ignorehitpause=1

[State -3, Special Finish]
type = Helper
triggerall = roundstate >= 2
triggerall = WinKo && NumHelper(8550)=0 &&!var(20)
trigger1 = (stateno = [1000, 2999])&&movetype!=H
trigger2 = NumHelper(1005) && !var(20)
trigger2 = (Helper(1005), StateNo = [1006,1007])
trigger3 = NumHelper(2090) && !var(20)
trigger3 = (Helper(2090), StateNo = 1560)
trigger4 = NumHelper(1760) && !var(20)
trigger4 = (Helper(1760), StateNo = 1560)
ID = 8550
stateno = 8550
postype = back
pos = 0,0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
ownpal = 1
persistent=0


[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = NumHelper(2090)
trigger3 = (Helper(2090), StateNo = [1500,1599]) && (Helper(2090), var(18))
trigger4 = NumHelper(1760)
trigger4 = (Helper(1760), StateNo = [1500,1799]) && (Helper(1760), var(18))
trigger5 = NumHelper(1670)
trigger5 = (Helper(1670), StateNo = [1600,1699]) && (Helper(1670), var(18))
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = left
pos = 160, -120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Custom Combo Finish]
type = Helper
triggerAll = var(20)
triggerAll = WinKO && RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = NumHelper(2090)
trigger3 = (Helper(2090), StateNo = [1500,1599]) && (Helper(2090), var(18))
trigger4 = NumHelper(1760)
trigger4 = (Helper(1760), StateNo = [1500,1799]) && (Helper(1760), var(18))
trigger5 = NumHelper(1670)
trigger5 = (Helper(1670), StateNo = [1600,1699]) && (Helper(1670), var(18))
helperType = normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = Left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Super Finish]
type = Helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := StateNo
trigger2 = (StateNo = [3000,3099])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3199])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
trigger6 = StateNo = [3400,3499]
trigger6 = var(23) := 3400
trigger7 = (StateNo = [3500,3599])
trigger7 = var(23) := 3500
trigger8 = StateNo = 185
trigger8 = var(23) := 3500
helperType = Normal
stateNo = 8600
ID = 8600
name = "Super Finish"
posType = left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1
