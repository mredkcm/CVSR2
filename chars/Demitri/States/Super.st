; _________________________________________
;| Demitri by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<MIDNIGHT BLISS>=
[StateDef 3000]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3000, Super Pause FX]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(7 * const(size.xScale)), ceil(-77 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Snd]
type = PlaySnd
trigger1 = Time = 46
value = 3000, 0

[State 3000, VelSet]
type = PosAdd
trigger1 = Time >= 46
x = 4.5

[State 3000, 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, HT
hitflag = M
getPower = 0,0
givePower = 36, 36
priority = 5, Miss
guardflag = None
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
p2facing = 1
p1stateno = 3002
p2stateno = 3004
numhits = 0

[State 3000, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3051
ctrl = 0

;====<MIDNIGHT BLISS>=
[Statedef 3002]
type = S
movetype = A
physics = S
velset = 0, 0
juggle = 11
anim = 3053
ctrl = 0
sprpriority = 2

[State 3002, Change to CFJ Bliss]
type = ChangeState
trigger1 = AnimElem = 60
value = 3020

[State 3002, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(69) < 0
pos = floor(51*const(size.xscale)), 0

[State 3002, Bind 2]
type = TargetBind
trigger1 = AnimElem = 69
pos = floor(27*const(size.xscale)), floor(-159*const(size.yscale))

[State 3002, Bind 3]
type = TargetBind
trigger1 = AnimElemTime(70) >= 0 && AnimElemTime(87) < 0
trigger2 = AnimElem = 90
pos = floor(34*const(size.xscale)), floor(-145*const(size.yscale))

[State 3002, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(87) >= 0 && AnimElemTime(90) < 0
trigger2 = AnimElemTime(91) >= 0 && AnimElemTime(94) < 0
trigger3 = AnimElemTime(95) >= 0 && AnimElemTime(98) < 0
trigger4 = AnimElemTime(99) >= 0 && AnimElemTime(102) < 0
trigger5 = AnimElemTime(103) >= 0 && AnimElemTime(106) < 0
trigger6 = AnimElemTime(107) >= 0 && AnimElemTime(110) < 0
trigger7 = AnimElemTime(111) >= 0 && AnimElemTime(114) < 0
trigger8 = AnimElemTime(115) >= 0 && AnimElemTime(117) < 0
trigger9 = AnimElemTime(118) >= 0 && AnimElemTime(120) < 0
trigger10 = AnimElemTime(121) >= 0 && AnimElemTime(123) < 0
trigger11 = AnimElemTime(124) >= 0 && AnimElemTime(126) < 0
trigger12 = AnimElemTime(127) >= 0 && AnimElemTime(129) < 0
trigger13 = AnimElem = 130
trigger14 = AnimElem = 132
trigger15 = AnimElem = 134
trigger16 = AnimElemTime(136) >= 0 && AnimElemTime(138) < 0
trigger17 = AnimElemTime(139) >= 0 && AnimElemTime(141) < 0
trigger18 = AnimElemTime(142) >= 0 && AnimElemTime(144) < 0
trigger19 = AnimElemTime(145) >= 0 && AnimElemTime(147) < 0
trigger20 = AnimElemTime(148) >= 0 && AnimElemTime(169) < 0
pos = floor(35*const(size.xscale)), floor(-138*const(size.yscale))

[State 3002, Bind 5]
type = TargetBind
trigger1 = AnimElem = 94
trigger2 = AnimElem = 98
trigger3 = AnimElem = 102
trigger4 = AnimElem = 106
trigger5 = AnimElem = 110
trigger6 = AnimElem = 114
trigger7 = AnimElem = 117
trigger8 = AnimElem = 120
trigger9 = AnimElem = 123
trigger10 = AnimElem = 126
trigger11 = AnimElem = 129
trigger12 = AnimElem = 131
trigger13 = AnimElem = 133
trigger14 = AnimElem = 135
trigger15 = AnimElem = 138
trigger16 = AnimElem = 141
trigger17 = AnimElem = 144
trigger18 = AnimElem = 147
pos = floor(35*const(size.xscale)), floor(-136*const(size.yscale))

[State 3002, 1]
type = explod
trigger1 = AnimElem = 2
postype = p1
anim = 1205
pos = floor(22*const(size.xscale)), floor(-78*const(size.yscale))
sprpriority = 5
bindtime = -1
ownpal = 1

[State 3002, 2]
type = explod
trigger1 = AnimElem = 3
postype = p1
anim = 1205
pos = floor(76*const(size.xscale)), floor(-69*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3002, 3]
type = explod
trigger1 = AnimElem = 4
postype = p1
anim = 1205
pos = floor(31*const(size.xscale)), floor(-28*const(size.yscale))
sprpriority = 3
bindtime = -1
ownpal = 1

[State 3002, 4]
type = explod
trigger1 = AnimElem = 5
postype = p1
anim = 1205
pos = floor(2*const(size.xscale)), floor(-42*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3002, 5]
type = explod
trigger1 = AnimElem = 6
postype = p1
anim = 1205
pos = floor(101*const(size.xscale)), floor(-44*const(size.yscale))
sprpriority = 5
bindtime = -1
ownpal = 1

[State 3002, 6]
type = explod
trigger1 = AnimElem = 9
postype = p1
anim = 1205
pos = floor(63*const(size.xscale)), floor(-12*const(size.yscale))
sprpriority = 6
bindtime = -1
ownpal = 1

[State 3002, spr]
type = SprPriority
trigger1 = AnimElem = 69
value = 3

[State 3002, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200, 0

[State 3002, Snd]
type = PlaySnd
trigger1 = AnimElem = 99
value = 3000, 1

[State 3002, Snd]
type = PlaySnd
trigger1 = AnimElem = 115
value = 3000, 2

[State 3002, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
kill = 0

[State 3002, EnvShake]
type = EnvShake
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
trigger10 = AnimElem = 169
time = 18
ampl = 6
freq = 120

[State 3002, 7]
type = explod
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
postype = p1
anim = 3058
pos = floor(8*const(size.xscale)), floor(-114*const(size.yscale))
sprpriority = 5
bindtime = 1
ownpal = 1

[State 3002, 8]
type = explod
trigger1 = AnimElem = 115
postype = p1
anim = 3056
pos = floor(-16*const(size.xscale)), floor(-104*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3002, 9]
type = explod
trigger1 = AnimElem = 130
postype = p1
anim = 3057
pos = floor(34*const(size.xscale)), floor(-4*const(size.yscale))
sprpriority = 2
bindtime = -1
ownpal = 1

[State 3002, Flames]
type = Helper
trigger1 = AnimElem = 169 && NumTarget
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697), 8150, 8151)
name = "Flames"
posType = P2
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 3002, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 169
value = floor(ifElse(200 * fvar(11) < 7, -7, -200 * fvar(11)))
kill = 1

[State 3002, Target]
type = TargetState
trigger1 = AnimElem = 169
value = 3055

[State 3002, FireSnd]
type = PlaySnd
trigger1 = AnimElem = 169
value = 3000, 3

[State 3002, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 3053
ctrl = 0

;====<MIDNIGHT BLISS>=
[Statedef 3004]
type = S
movetype = H
physics = S
velset = 0, 0
ctrl = 0

[State 3004, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3005

[State 3004, change]
type = ChangeAnim
trigger1 = SelfAnimExist(9021) = 1
trigger1 = Time = 0
value = 9021

;CFJ-style Bliss
[StateDef 3020]
type = S
anim = 3020
physics = N
moveType = A
velSet = 0,0

[State 3020, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3020, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,1
channel = 0

[State 3020, Cape sound]
type = PlaySnd
trigger1 = !Time
value = 3000,3
channel = 1

[State 3020, AllPalFX]
type = AllPalFX
trigger1 = AnimElem = 6
time = 4
sinAdd = -255, -255, -255, 16

[State 3020, BGPalFX]
type = BGPalFX
trigger1 = AnimElemTime(7) = -1
time = 72
add = -256,-256,-256

[State 3020, AssertSpecial: NoBarDisplay]
type = AssertSpecial
trigger1 = AnimElemTime(7) >= 0 && AnimTime
flag = NoBarDisplay
flag2 = NoFG

[State 3020, TargetState: invisible]
type = TargetState
trigger1 = AnimElem = 7
value = 3025

[State 3020, Bite sound]
type = PlaySnd
trigger1 = AnimElemTime(7) = 5
trigger2 = AnimElemTime(7) = 27
trigger3 = AnimElemTime(7) = 36
value = 2,8

[State 3020, End]
type = ChangeState
trigger1 = !AnimTime
value = 3021

;CFJ-style Finish
[StateDef 3021]
type = S
physics = N
moveType = A
velSet = 0,0

[State 3021, TargetState: on the floor]
type = TargetState
trigger1 = !Time
value = 3026

[State 3021, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3004
elem = 3

[State 3021, Damage]
type = TargetLifeAdd
trigger1 = !Time && NumTarget
value = floor(ifElse(230 * fvar(11) < 7, -7, -230 * fvar(11)))

[State 3021, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = !Time && NumTarget
value = 36

[State 3021, HitAdd]
type = HitAdd
trigger1 = !Time && NumTarget
value = 1

[State 3021, VarAdd]
type = VarAdd
trigger1 = !Time && NumTarget
var(13) = 1

[State 3021, Juggle]
type = VarAdd
trigger1 = !Time && NumTarget
var(15) = 1
ignoreHitPause = 1

[State 3021, Juggle]
type = VarSet
trigger1 = !Time && NumTarget
var(16) = 1
ignoreHitPause = 1

[State 3021, Warp sound]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 1

[State 3021, Dust cloud 1]
type = Explod
trigger1 = !Time
anim = 3025
sprPriority = 3
posType = P1
pos = ceil(19 * const(size.xScale)), ceil(-80 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, Dust cloud 2]
type = Explod
trigger1 = !Time
anim = 3025
sprPriority = 3
posType = P1
pos = ceil(87 * const(size.xScale)), ceil(-60 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, Dust cloud 3]
type = Explod
trigger1 = AnimElemTime(2) = 3
anim = 3025
sprPriority = 3
posType = P1
pos = ceil(35 * const(size.xScale)), ceil(-32 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, Dust cloud 4]
type = Explod
trigger1 = !Time
anim = 3025
sprPriority = 2
posType = P1
pos = ceil(3 * const(size.xScale)), ceil(-40 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, Dust cloud 5]
type = Explod
trigger1 = !Time
anim = 3025
sprPriority = 2
posType = P1
pos = ceil(99 * const(size.xScale)), ceil(-56 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, Dust cloud 5]
type = Explod
trigger1 = !Time
anim = 3025
sprPriority = 2
posType = P1
pos = ceil(59 * const(size.xScale)), ceil(-16 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3021, VelSet]
type = VelSet
trigger1 = !Time
x = -3.75

[State 3021, VelSet]
type = VelSet
trigger1 = AnimElem = 39
x = 0

[State 3021, Voice]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,4
channel = 0

[State 3021, Kiss sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3000,5
channel = 3

[State 3011, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;CFJ-style, invisible
[StateDef 3025]
type = L
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3025, Generic Bliss]
type = ChangeAnim2
trigger1 = !Time
value = 1

[State 3025, Voice]
type = PlaySnd
trigger1 = Time = 10
value = 9021,0
channel = 0

[State 3025, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

;CFJ-style, on the floor
[StateDef 3026]
type = L
moveType = H
physics = C
velSet = 0,0

[State 3026, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5080

[State 3026, VarSet]
type = VarSet
trigger1 = !Time
sysvar(0) = 1

[State 3026, ChangeState]
type = ChangeState
trigger1 = Time >= 32 && Alive
value = 3027

[State 3026, SelfState]
type = SelfState
trigger1 = Time >= 32 && !Alive
value = 5150

;Recover
[StateDef 3027]
type = L
moveType = H
physics = N

[State 3027, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 3027, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5110 + (Anim % 10))
trigger1 = Anim = [5081,5089]
value = 5110 + (Anim % 10)
persistent = 0

[State 3027, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 3027, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 3027, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 3027, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3027, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yVel) != 0
sysvar(1) = floor(vel y)

[State 3027, PlaySnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !sysvar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 3027, Explod]
type = Explod
trigger1 = !Time
trigger1 = !sysvar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 3027, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3027, ChangeAnim]
type = ChangeAnim
triggerAll = Anim = [5171,5179]
triggerAll = SelfAnimExist(5110 + (Anim % 10))
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110 + (Anim % 10)
persistent = 0

[State 3027, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != [5111,5119]
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110
persistent = 0

[State 3027, SelfState]
type = SelfState
triggerAll = !Alive
trigger1 = !AnimTime
trigger2 = sysvar(0)
trigger3 = Anim = [5110,5119]
value = 5150

[State 3027, VarSet]
type = VarSet
trigger1 = sysvar(0)
trigger1 = !Time
sysvar(0) = 0

[State 3027, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 3027, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 3027, SelfState]
type = SelfState
trigger1 = Time = 82
value = 5120

;====<MAX MIDNIGHT BLISS>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(7 * const(size.xScale)), ceil(-77 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Snd]
type = PlaySnd
trigger1 = Time = 46
value = 3000, 0

[State 3050, VelSet]
type = PosAdd
trigger1 = Time >= 46
x = 4.5

[State 3050, 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, HT
hitflag = M
getPower = 0,0
givePower = 36, 36
priority = 5, Miss
guardflag = None
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
p2facing = 1
p1stateno = 3052
p2stateno = 3054
numhits = 0

[State 3050, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3051
ctrl = 0

;====<MAX MIDNIGHT BLISS>=
[Statedef 3051]
type = S
movetype = A
physics = S
juggle = 11
velset = 0, 0
anim = 3051
sprpriority = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = !time
time = 13

[State 3051, 1]
type = explod
trigger1 = Time = 0
postype = p1
anim = 3052
pos = floor(61*const(size.xscale)), floor(-76*const(size.yscale))
sprpriority = 2
bindtime = -1
removeongethit = 1
ownpal = 1

[State 3051, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MAX MIDNIGHT BLISS>=
[Statedef 3052]
type = S
movetype = A
physics = S
velset = 0, 0
juggle = 11
anim = 3053
ctrl = 0
sprpriority = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = !time
time = 199

[State 3052, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(69) < 0
pos = floor(51*const(size.xscale)), 0

[State 3052, Bind 2]
type = TargetBind
trigger1 = AnimElem = 69
pos = floor(27*const(size.xscale)), floor(-159*const(size.yscale))

[State 3052, Bind 3]
type = TargetBind
trigger1 = AnimElemTime(70) >= 0 && AnimElemTime(87) < 0
trigger2 = AnimElem = 90
pos = floor(34*const(size.xscale)), floor(-145*const(size.yscale))

[State 3052, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(87) >= 0 && AnimElemTime(90) < 0
trigger2 = AnimElemTime(91) >= 0 && AnimElemTime(94) < 0
trigger3 = AnimElemTime(95) >= 0 && AnimElemTime(98) < 0
trigger4 = AnimElemTime(99) >= 0 && AnimElemTime(102) < 0
trigger5 = AnimElemTime(103) >= 0 && AnimElemTime(106) < 0
trigger6 = AnimElemTime(107) >= 0 && AnimElemTime(110) < 0
trigger7 = AnimElemTime(111) >= 0 && AnimElemTime(114) < 0
trigger8 = AnimElemTime(115) >= 0 && AnimElemTime(117) < 0
trigger9 = AnimElemTime(118) >= 0 && AnimElemTime(120) < 0
trigger10 = AnimElemTime(121) >= 0 && AnimElemTime(123) < 0
trigger11 = AnimElemTime(124) >= 0 && AnimElemTime(126) < 0
trigger12 = AnimElemTime(127) >= 0 && AnimElemTime(129) < 0
trigger13 = AnimElem = 130
trigger14 = AnimElem = 132
trigger15 = AnimElem = 134
trigger16 = AnimElemTime(136) >= 0 && AnimElemTime(138) < 0
trigger17 = AnimElemTime(139) >= 0 && AnimElemTime(141) < 0
trigger18 = AnimElemTime(142) >= 0 && AnimElemTime(144) < 0
trigger19 = AnimElemTime(145) >= 0 && AnimElemTime(147) < 0
trigger20 = AnimElemTime(148) >= 0 && AnimElemTime(169) < 0
pos = floor(35*const(size.xscale)), floor(-138*const(size.yscale))

[State 3052, Bind 5]
type = TargetBind
trigger1 = AnimElem = 94
trigger2 = AnimElem = 98
trigger3 = AnimElem = 102
trigger4 = AnimElem = 106
trigger5 = AnimElem = 110
trigger6 = AnimElem = 114
trigger7 = AnimElem = 117
trigger8 = AnimElem = 120
trigger9 = AnimElem = 123
trigger10 = AnimElem = 126
trigger11 = AnimElem = 129
trigger12 = AnimElem = 131
trigger13 = AnimElem = 133
trigger14 = AnimElem = 135
trigger15 = AnimElem = 138
trigger16 = AnimElem = 141
trigger17 = AnimElem = 144
trigger18 = AnimElem = 147
pos = floor(35*const(size.xscale)), floor(-136*const(size.yscale))

[State 3052, 1]
type = explod
trigger1 = AnimElem = 2
postype = p1
anim = 1205
pos = floor(22*const(size.xscale)), floor(-78*const(size.yscale))
sprpriority = 5
bindtime = -1
ownpal = 1

[State 3052, 2]
type = explod
trigger1 = AnimElem = 3
postype = p1
anim = 1205
pos = floor(76*const(size.xscale)), floor(-69*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3052, 3]
type = explod
trigger1 = AnimElem = 4
postype = p1
anim = 1205
pos = floor(31*const(size.xscale)), floor(-28*const(size.yscale))
sprpriority = 3
bindtime = -1
ownpal = 1

[State 3052, 4]
type = explod
trigger1 = AnimElem = 5
postype = p1
anim = 1205
pos = floor(2*const(size.xscale)), floor(-42*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3052, 5]
type = explod
trigger1 = AnimElem = 6
postype = p1
anim = 1205
pos = floor(101*const(size.xscale)), floor(-44*const(size.yscale))
sprpriority = 5
bindtime = -1
ownpal = 1

[State 3052, 6]
type = explod
trigger1 = AnimElem = 9
postype = p1
anim = 1205
pos = floor(63*const(size.xscale)), floor(-12*const(size.yscale))
sprpriority = 6
bindtime = -1
ownpal = 1

[State 3052, spr]
type = SprPriority
trigger1 = AnimElem = 69
value = 3

[State 3052, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200, 0

[State 3052, Snd]
type = PlaySnd
trigger1 = AnimElem = 99
value = 3000, 1

[State 3052, Snd]
type = PlaySnd
trigger1 = AnimElem = 115
value = 3000, 2

[State 3052, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
value = floor(ifElse(15 * fvar(11) < 7, -7, -15 * fvar(11)))
kill = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
trigger10 = AnimElem = 169
time = 18
ampl = 6
freq = 120

[State 3052, 7]
type = explod
trigger1 = AnimElem = 99
trigger2 = AnimElem = 106
trigger3 = AnimElem = 111
trigger4 = AnimElem = 118
trigger5 = AnimElem = 123
trigger6 = AnimElem = 128
trigger7 = AnimElem = 131
trigger8 = AnimElem = 136
trigger9 = AnimElem = 139
postype = p1
anim = 3058
pos = floor(8*const(size.xscale)), floor(-114*const(size.yscale))
sprpriority = 5
bindtime = 1
ownpal = 1

[State 3052, 8]
type = explod
trigger1 = AnimElem = 115
postype = p1
anim = 3056
pos = floor(-16*const(size.xscale)), floor(-104*const(size.yscale))
sprpriority = 4
bindtime = -1
ownpal = 1

[State 3052, 9]
type = explod
trigger1 = AnimElem = 130
postype = p1
anim = 3057
pos = floor(34*const(size.xscale)), floor(-4*const(size.yscale))
sprpriority = 2
bindtime = -1
ownpal = 1

[State 3052, Flames]
type = Helper
trigger1 = AnimElem = 169 && NumTarget
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697), 8150, 8151)
name = "Flames"
posType = P2
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 3052, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 169
value = floor(ifElse(200 * fvar(11) < 7, -7, -200 * fvar(11)))
kill = 1

[State 3052, Target]
type = TargetState
trigger1 = AnimElem = 169
value = 3055

[State 3052, FireSnd]
type = PlaySnd
trigger1 = AnimElem = 169
value = 3000, 3

[State 3052, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 3053
ctrl = 0

;====<MAX MIDNIGHT BLISS>=
[Statedef 3053]
type = S
movetype = A
physics = S
velset = 0, 0
anim = 3054
ctrl = 0
sprpriority = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = !time
time = 40

[State 3053, Snd]
type = PlaySnd
trigger1 = AnimElem = 25
value = 3000, 4
channel = 3

[State 3053, Snd]
type = PlaySnd
trigger1 = AnimElem = 25
value = 3000, 5
channel = 4

[State 3053, VelSet]
type = PosAdd
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(37) < 0
x = -3.4

[State 3053, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MAX MIDNIGHT BLISS>=
[Statedef 3054]
type = S
movetype = H
physics = S
velset = 0, 0
ctrl = 0

[State 3054, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3055

[State 3054, anim]
type = ChangeAnim
trigger1 = Time <= 11
trigger1 = SelfAnimExist(9020) = 1
value = 0
elem = 1

[State 3054, anim]
type = ChangeAnim
trigger1 = Time > 11 && Time <= 67
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 1

[State 3054, anim]
type = ChangeAnim
trigger1 = Time > 67 && Time <= 99
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 2

[State 3054, anim]
type = ChangeAnim
trigger1 = (Time = 100)||(Time = 106)||(Time = 116)||(Time = 119)||(Time = 124)||(Time = 134)||(Time = 137)||(Time = 140)||(Time = 143)||(Time = 146)||(Time = 149)
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 4

[State 3054, anim]
type = ChangeAnim
trigger1 = (Time > 100 && Time <= 102)||(Time > 103 && Time <= 105)||(Time > 106 && Time <= 115)||(Time > 116 && Time <= 118)||(Time > 119 && Time <= 121)
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 3

[State 3054, anim]
type = ChangeAnim
trigger1 = (Time > 121 && Time <= 123)||(Time > 124 && Time <= 133)||(Time > 134 && Time <= 136)||(Time > 140 && Time <= 142)||(Time > 143 && Time <= 145)||(Time > 146 && Time <= 148)
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 5

[State 3054, anim]
type = ChangeAnim
trigger1 = Time > 149
trigger1 = SelfAnimExist(9020) = 1
value = 9020
elem = 6

;====<MAX MIDNIGHT BLISS>=
[Statedef 3055]
type = A
movetype = H
physics = N
velset = 0,0
poweradd = 100

[State 3055, 1]
type = PosAdd
trigger1 = Time = 0
y = Const(size.height) + 20

[State 3055, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3059

[State 3055, Pal]
type = PalFX
trigger1 = Time >= 0
time = 2
add = -70,-70,-70
ignorehitpause = 1

[State 3055, Pal]
type = PalFX
trigger1 = SelfAnimExist(7697) = 1
trigger1 = Time >= 0
time = 2
add = 0,0,0
ignorehitpause = 1

[State 3055, change]
type = ChangeAnim
trigger1 = SelfAnimExist(7697) = 1
trigger1 = Time = 8
value = 7697

[State 3055, 3];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Time = 1
x = -2.6
y = -6.7

[State 3055, 4] ;Gravity
type = VelAdd
trigger1 = Time >= 1
y = .4

[State 3055, 5];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Time >= 14
y = 0

[State 3055, 6] ;Gravity
type = VelAdd
trigger1 = Time >= 14
trigger1 = Vel Y > 0
y = 0

[State 3055, 7];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Time >= 24
x = 0

[State 3055, 8];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Time >= 36
y = 7.6

[State 3055, 9] ;Gravity
type = gravity
trigger1 = Time >= 36

[State 3055, 10]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5110 ;Hit ground

;====<DEMON BLAST>=
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(7 * const(size.xScale)), ceil(-77 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Bat Velocity Flag Off]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Projectile 1]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3105
name = "Demon Billion Projectile 1"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 2]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3106
name = "Demon Billion Projectile 2"
posType = P1
pos = ceil(19 * const(size.xScale)), ceil(-12 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 3]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3107
name = "Demon Billion Projectile 3"
posType = P1
pos = ceil(-13 * const(size.xScale)), ceil(-14 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 4]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3108
name = "Demon Billion Projectile 4"
posType = P1
pos = ceil(36 * const(size.xScale)), ceil(-32 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 5]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3109
name = "Demon Billion Projectile 5"
posType = P1
pos = ceil(-2 * const(size.xScale)), ceil(-34 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 6]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3110
name = "Demon Billion Projectile 6"
posType = P1
pos = ceil(-30 * const(size.xScale)), ceil(-36 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 7]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3111
name = "Demon Billion Projectile 7"
posType = P1
pos = ceil(-20 * const(size.xScale)), ceil(-50 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 8]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3112
name = "Demon Billion Projectile 8"
posType = P1
pos = ceil(-52 * const(size.xScale)), ceil(-48 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 9]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3113
name = "Demon Billion Projectile 9"
posType = P1
pos = ceil(12 * const(size.xScale)), ceil(-56 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 10]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3114
name = "Demon Billion Projectile 10"
posType = P1
pos = ceil(-34 * const(size.xScale)), ceil(-64 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 11]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3115
name = "Demon Billion Projectile 11"
posType = P1
pos = ceil(2 * const(size.xScale)), ceil(-68 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 12]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3116
name = "Demon Billion Projectile 12"
posType = P1
pos = ceil(34 * const(size.xScale)), ceil(-70 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 13]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3117
name = "Demon Billion Projectile 13"
posType = P1
pos = ceil(-18 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 14]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3118
name = "Demon Billion Projectile 14"
posType = P1
pos = ceil(-50 * const(size.xScale)), ceil(-86 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 15]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3119
name = "Demon Billion Projectile 15"
posType = P1
pos = ceil(18 * const(size.xScale)), ceil(-92 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, Projectile 16]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3105
ID = 3120
name = "Demon Billion Projectile 16"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-96 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3100, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(14) < -5
value = 0
ignoreHitPause = 1

[State 3100, Bat Velocity Flag On]
type = VarSet
trigger1 = AnimElemTime(12) = 1
var(10) = 1
ignoreHitPause = 1

[State 3100, Flapping wings sound]
type = PlaySnd
trigger1 = AnimElemTime(12) = 1
trigger2 = AnimElemTime(12) = 14
value = 3100,1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 12.5

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElemTime(14) = -5
x = 0

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= -5
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX DEMON BLAST>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3150, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(7 * const(size.xScale)), ceil(-77 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3150,0
channel = 0

[State 3150, Flapping wings sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,1
channel = 3

[State 3150, Projectile 1]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3155
name = "Demon Blast Projectile 1"
posType = P1
pos = ceil(31 * const(size.xScale)), ceil(-46 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 2]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3156
name = "Demon Blast Projectile 2"
posType = P1
pos = ceil(8 * const(size.xScale)), ceil(-51 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 3]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3157
name = "Demon Blast Projectile 3"
posType = P1
pos = ceil(11 * const(size.xScale)), ceil(-70 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 4]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3158
name = "Demon Blast Projectile 4"
posType = P1
pos = ceil(28 * const(size.xScale)), ceil(-91 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 5]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3159
name = "Demon Blast Projectile 5"
posType = P1
pos = ceil(-44 * const(size.xScale)), ceil(-38 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 6]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3160
name = "Demon Blast Projectile 6"
posType = P1
pos = ceil(-4 * const(size.xScale)), ceil(-50 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 7]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3161
name = "Demon Blast Projectile 7"
posType = P1
pos = ceil(-22 * const(size.xScale)), ceil(-75 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, Projectile 8]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 3155
ID = 3162
name = "Demon Blast Projectile 8"
posType = P1
pos = ceil(-63 * const(size.xScale)), ceil(-87 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = 1
ownPal = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(50) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MIDNIGHT PLEASURE>=
[StateDef 3200]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(8 * const(size.xScale)), ceil(-78 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Snd]
type = PlaySnd
trigger1 = Time = 46
value = 3200, 0

[State 3200, VelSet]
type = velset
trigger1 = time = [46,71]
x = 5

[State 3200, 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = time = [46,71]
attr = S, HT
hitflag = M
getPower = 0,0
givePower = 36, 36
priority = 1, Miss
guardflag = None
pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
p2facing = 1
p1stateno = 3201
p2stateno = 3202
numhits = 0

[State 3000, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MIDNIGHT PLEASURE>=
[Statedef 3201]
type = S
movetype = A
physics = S
velset = 0, 0
juggle = 11
anim = 3201
ctrl = 0
sprpriority = 2

[State 3200, AfterImageTime]
type = AfterImageTime
trigger1 = time = 0
time = 118

[State 3200, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(62) < 0
pos = floor(48*const(size.xscale)), 0

[State 3200, Bind 2]
type = TargetBind
trigger1 = AnimElemTime(62) >= 0 && AnimElemTime(70) < 0
pos = ifelse((AnimElemTime(62)%2 = 1), floor(50*const(size.xscale)), floor(48*const(size.xscale))), 0

[State 3200, Bind 3]
type = TargetBind
trigger1 = AnimElemTime(70) >= 0 && AnimElemTime(73) < 0
pos = floor(48*const(size.xscale)), 0

[State 3200, Bind 4]
type = TargetBind
trigger1 = AnimElemTime(73) >= 0 && AnimElemTime(78) < 0
pos = ifelse((AnimElemTime(73)%2 = 1), floor(50*const(size.xscale)), floor(48*const(size.xscale))), 0

[State 3200, Bind 5]
type = TargetBind
trigger1 = AnimElemTime(78) >= 0 && AnimElemTime(82) < 0
pos = floor(48*const(size.xscale)), 0

[State 3200, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(82) >= 0 && AnimElemTime(88) < 0
pos = ifelse((AnimElemTime(82)%2 = 1), floor(50*const(size.xscale)), floor(48*const(size.xscale))), 0

[State 3200, Bind 7]
type = TargetBind
trigger1 = AnimElemTime(88) >= 0 && AnimElemTime(93) < 0
pos = floor(48*const(size.xscale)), 0

[State 3200, Bind 8]
type = TargetBind
trigger1 = AnimElemTime(93) >= 0 && AnimElemTime(102) < 0
pos = ifelse((AnimElemTime(82)%2 = 1), floor(50*const(size.xscale)), floor(48*const(size.xscale))), 0

[State 3200, Snd]
type = PlaySnd
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = 2, 8

[State 3200, Hit Spark]
type = Helper
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
helperType = Normal
stateNo = 8017
ID = 8000
name = "Spark"
pos = floor(26*const(size.xscale)), floor(-80*const(size.yscale))
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, Hurt 1]
type = TargetLifeAdd
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = floor(ifElse(35 * fvar(11) < 7, -7, -35 * fvar(11)))
kill = 0

[State 3200, EnvShake]
type = EnvShake
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55) || (AnimElem = 62) || (animelem = 73) || (animelem = 82) || (animelem = 93)
time = 18
ampl = 6
freq = 120

[State 3200, Hitadd 1]
type = hitAdd
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = 1

[State 3200, Heal 1]
type = lifeAdd
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = 10

[State 3200, flash(R)];(red flash)
type = Envcolor
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = 250,0,0
time = 1
under = 1

[State 3200, Pal]
type = PalFX
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
time = 2
add = 255,0,0
mul = 230,0,0
color = 128
ignorehitpause = 1

[State 3200, heal]
type = LifeAdd
trigger1 = (AnimElem = 6) || (AnimElem = 13) || (AnimElem = 20) || (AnimElem = 27) || (AnimElem = 34) || (AnimElem = 41) || (AnimElem = 48) || (AnimElem = 55)
value = 9

[State 3200, flash(W)];(white flash)
type = Envcolor
trigger1 = (AnimElem = 62) || (AnimElem = 73) || (AnimElem = 82) || (AnimElem = 93)
value = 250,250,250
time = 1
under = 1

[State 3200, Blood1]
type = explod
trigger1 = (AnimElem = 6) || (AnimElem = 20) || (AnimElem = 34) || (AnimElem = 48)
postype = p1
anim = 3216
pos = floor(42*const(size.xscale)), floor(-77*const(size.yscale))
sprpriority = 3
bindtime = -1
ownpal = 1

[State 3200, Blood2]
type = explod
trigger1 = (AnimElem = 14) || (AnimElem = 28) || (AnimElem = 42) || (AnimElem = 56)
postype = p1
anim = 3215
pos = floor(43*const(size.xscale)), floor(-77*const(size.yscale))
sprpriority = 3
bindtime = -1
ownpal = 1

[State 3200, Snd2]
type = PlaySnd
trigger1 = AnimElem = 62
value = 2, 2

[State 3200, Hit Spark]
type = Helper
trigger1 = AnimElem = 62
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
pos = floor(51*const(size.xscale)), floor(-78*const(size.yscale))
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, Hurt 2]
type = TargetLifeAdd
trigger1 = AnimElem = 62
value = floor(ifElse(20 * fvar(11) < 7, -7, -20 * fvar(11)))
kill = 0

[State 3200, hitadd]
type = HitAdd
trigger1 = AnimElem = 62
value = 1

[State 3200, Snd3]
type = PlaySnd
trigger1 = AnimElem = 73
value = 2, 2

[State 3200, Hit Spark]
type = Helper
trigger1 = AnimElem = 73
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
pos = floor(44*const(size.xscale)), floor(-59*const(size.yscale))
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, Hurt 3]
type = TargetLifeAdd
trigger1 = AnimElem = 73
value = -35 - (Var(16) * 5)
kill = 0

[State 3200, hitadd]
type = HitAdd
trigger1 = AnimElem = 73
value = 1

[State 3200, Snd4]
type = PlaySnd
trigger1 = AnimElem = 82
value = 2, 3

[State 3200, Hit Spark]
type = Helper
trigger1 = AnimElem = 82
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
pos = floor(52*const(size.xscale)), floor(-33*const(size.yscale))
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, Hurt 4]
type = TargetLifeAdd
trigger1 = AnimElem = 82
value = -35 - (Var(16) * 5)
kill = 0

[State 3200, hitadd]
type = HitAdd
trigger1 = AnimElem = 82
value = 1

[State 3200, Snd5]
type = PlaySnd
trigger1 = AnimElem = 93
value = 2, 5

[State 3200, Hit Spark]
type = Helper
trigger1 = AnimElem = 93
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
pos = floor(48*const(size.xscale)), floor(-74*const(size.yscale))
posType = P1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3200, Hurt 4]
type = TargetLifeAdd
trigger1 = AnimElem = 93
value = -80 - (Var(16) * 5)
kill = 1

[State 3200, hitadd]
type = HitAdd
trigger1 = AnimElem = 93
value = 1

[State 3200, Target]
type = TargetState
trigger1 = AnimElem = 102
value = 3203

[State 3200, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MIDNIGHT PLEASURE>=
[Statedef 3202]
type = S
movetype = H
physics = S
velset = 0, 0
ctrl = 0

[State 3200, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3205

;====<MIDNIGHT PLEASURE>=
[Statedef 3203]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 3203, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 3203, 2]
type = VelSet
trigger1 = Time = 0
x = -4.4
y = -11

[State 3203, muteki];¸Â°Å³ª ´øÁú ¼ö ÀÖ°Å³ª ÇÏÁö ¾Ê°Ô ¼³Á¤
type = NotHitBy
trigger1 = Time >= 0
value = SCA, NA, SA, HA, NT, ST, HT

[State 3203, 3] ;Gravity
type = VelAdd
trigger1 = Animelem = 1, >= 0
y = .6

[State 3203, 4]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground
