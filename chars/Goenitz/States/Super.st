; _________________________________________
;| Goenitz by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<SHIN YAOTOME: MIZUCHI>=
[StateDef 3000]
type = S
physics = N
moveType = A
anim = 3000
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
var(17) = 33

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

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(25 * const(size.xScale)), ceil(-135 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = animelem = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1000, Power set]
Type = ChangeAnim
Trigger1 = !Time
Trigger1 = var(10) = 2
value = 3001

[State 1000, Goenitz Voice1]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 3000,0
Channel = 1

[State 1000, Wind SND FX]
type = PlaySnd
Trigger1 = AnimElem = 7, = 1
value = 1200,1
Channel = 2

[State 1000, Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 8
value = 101,0
Channel = 3

[State 1000, Jump SND]
type = PlaySnd
Trigger1 = AnimElem = 7
value = 40,0
Channel = 3

[State 1200, Speed]
Type = VelSet
TriggerAll = var(10) != 2
Trigger1 = AnimElem = 8
x = 6.5+1.5

[State 1200, Speed]
Type = VelSet
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7
x = 6.5
y = -7

[State 1200, Speed]
Type = Gravity
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, > 0

[State 52, 3]
type = StateTypeSet
trigger1 = var(10) = 2
trigger1 = AnimElem = 7
statetype = A

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, = 2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Heavy
Fall.animtype = Heavy
getPower = 0,0
givePower = 36, 36
guardflag = H
hitflag = MAF
pausetime = 4,4
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = low
ground.slidetime = 17
ground.hittime = 20
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
EnvShake.Time = 5
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = var(10) != 2
Trigger1 = AnimElem = 7, = 2
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Heavy
Fall.animtype = Heavy
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 4,4
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
ground.type = low
ground.slidetime = 17
ground.hittime = 20
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
EnvShake.Time = 5
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = ChangeState
Trigger1 = MoveHit
Trigger1 = Target, Alive
value = 3010

[State 1000, 9]
type = ChangeState
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, > 0
Trigger1 = Pos y >= 0
Trigger1 = Vel y > 0
Trigger2 = Moveguarded
trigger3 = !AnimTime
value = 3005

;Shin Ya Otome: Mizumi miss
[Statedef 3005]
Type = S
MoveType = I
Physics = N
Anim = ifelse(prevStateNo = 3200, 3206, 3005+(var(10) = 2))
Ctrl = 0
PowerAdd = 0
Velset = ifelse(prevStateNo = 3200,0,9),0

[State 1000, 9]
type = Posset
Trigger1 = !Time
y = 0

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

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

[State 1000, 9]
type = VelMul
Trigger1 = 1
x = .92

[State 1000, 9]
type = Velset
Trigger1 = !Time
y = 0

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Shin Ya Otome: Mizumi success
[Statedef 3010]
Type = S
MoveType = A
Physics = N
Anim = 3010
VelSet = 1.5, 0
Ctrl = 0
PowerAdd = 0

[State 1000, 9]
type = Posset
Trigger1 = !Time
y = 0

[State 810, Bind 1]
type = TargetState
trigger1 = !Time
Value = 6200

[State 810, Bind 1]
type = Width
trigger1 = 1
Edge = 45,0

[State 810, Bind 1]
type = TargetBind
trigger1 = 1
pos = 45, 0

[State 200, Init Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
Trigger1 = AnimElem = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
animtype = Hard
getPower = 0,0
givePower = 36, 36
Guardflag = M
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
ground.Type = Low
ground.SlideTime = 17
ground.HitTime = 20
guard.hitTime = 18
ground.Velocity = -4
Air.Velocity = -4
Ground.cornerpush.veloff = 0
Air.cornerpush.veloff = 0
Kill = 0
Snap = 35,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, End Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
Trigger1 = AnimElem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
animtype = Hard
getPower = 0,0
givePower = 36, 36
Guardflag = M
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -75
ground.Type = High
ground.SlideTime = 17
ground.HitTime = 20
guard.hitTime = 18
ground.Velocity = -4
Air.Velocity = -4
Ground.cornerpush.veloff = 0
Air.cornerpush.veloff = 0
Kill = 0
Snap = 35,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, ALOA set 2]
Type = EnvColor
Trigger1 = AnimElem = 5
Trigger1 = AnimElem = 11
Value = 255,255,255
Time = 3
Under = 1
ignorehitpause = 1

[State 200, ALOA set 2]
Type = TargetState
Trigger1 = Movehit
Value = 6200
ignorehitpause = 1

[State 1000, 9]
type = ChangeState
Trigger1 = Time >= 102
value = 3020

;Shin Ya Otome: Mizumi throw
[Statedef 3020]
Type = S
MoveType = A
Physics = N
Anim = 3020
VelSet = 0, 0
Ctrl = 0
PowerAdd = 0

[State 200, End Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
Trigger1 = AnimElem = 4
attr = S, HT
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
getpower = 0,0
givepower = 0,0
Guardflag =
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -130
ground.Type = High
ground.SlideTime = 9
ground.HitTime = 9
ground.Velocity = 0
Air.Velocity = 0
Ground.cornerpush.veloff = 0;0
Air.cornerpush.veloff = 0;0
p1StateNo = 3021
p2StateNo = 3030
p1facing = -1
p2facing = 1
Kill = 0
yAccel = .6
fall = 1
fall.recover = 0
numhits = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
ctrl = 1

;Shin Ya Otome: Mizumi Finish
[Statedef 3021]
type = S
movetype= A
physics = S
anim = 3021
poweradd = 0
SprPriority = 2

[State 810, Bind 1]
type = Width
trigger1 = AnimElem = 5, < 0
Edge = 25,25

[State 810, Bind 1]
type = Width
trigger1 = AnimElem = 5, > 0
Edge = 85,0

[State 810, Bind 1]
type = PlaySnd
trigger1 = AnimElem = 4
Value = 0, 2
Channel = 1

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 3, < 0
pos = -25, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 3, >= 0
trigger1 = AnimElem = 4, < 0
pos = 25, -115

[State 810, Bind 5]
type = TargetBind
trigger1 = AnimElem = 4, >= 0
trigger1 = AnimElem = 5, < 0
pos = 15, -110

[State 810, Bind 5]
type = TargetBind
trigger1 = AnimElem = 5, >= 0
trigger1 = AnimElem = 6, < 0
pos = 55, -25

[State 810, Bind 5]
type = TargetBind
trigger1 = AnimElem = 6, >= 0
trigger1 = AnimElem = 7, < 0
pos = 85, 0

[State 810, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value = floor(ifElse(68 * fvar(11) < 7, -7, -68 * fvar(11)))

[State 810, Grab SND]
type = PlaySnd
Trigger1 = AnimElem = 1
value = 2,800

[State 810, Bind 1]
type = PlaySnd
trigger1 = AnimElem = 7
Value = 820, 2
Channel = 3

[State 810, Blood SND]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 3000,3
channel = 0

[State 700, Blood]
type = Explod
Trigger1 = time = 12 | time = 20 | time = 28 | time = 36 | time = 44
Trigger2 = time = 52 | time = 60
anim = 3034
postype = P1
name = "Blood Effect"
pos = -45, -135
sprpriority = 5
ownpal = 1

[State 700, Blood]
type = Explod
Trigger1 = time = 16 | time = 24 | time = 32 | time = 40 | time = 48
Trigger2 = time = 56 | time = 64
anim = 3034
postype = P1
name = "Blood Effect"
pos = -10, -135
sprpriority = 5
ownpal = 1
facing = -1

[State 1350, Targetbind]
Type = EnvShake
Trigger1 = AnimElem = 7
Time = 8
freq = 45
ampl = -4

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
Pos = 85,0
facing = -1
ownPal = 1

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Shin Ya Otome: Mizumi P2 End
[Statedef 3030]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = AnimElem = 7, < 0
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 820, 1]
type = Velset
Trigger1 = AnimElem = 7
x = -4
y = -8

[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = AnimElem = 7, > 0
y = .6

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;====<MAX SHIN YAOTOME: MIZUCHI>=
[StateDef 3050]
type = S
physics = N
moveType = A
anim = 3002
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
var(17) = 33

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

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" && command = "y"), 0, ifElse((command = "x" && command = "z"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, NotHitBy]
type = NotHitBy
Trigger1 = AnimElem = 8, >= 0
Trigger1 = AnimElem = 8, < 10
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(25 * const(size.xScale)), ceil(-135 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = animelem = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 200, Wind]
Type = Explod
Trigger1 = AnimElem = 7, = 1
anim = 1250
Pos = 30-15*(var(10) = 2), -20*(var(10) = 2)
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 4
ignorehitpause = 1
PauseMoveTime = 15

[State 1000, Power set]
Type = ChangeAnim
Trigger1 = !Time
Trigger1 = var(10) = 2
value = 3003

[State 1000, Goenitz Voice2]
type = PlaySnd
Trigger1 = AnimElem = 1, = 1
value = 3000,1
Channel = 1

[State 1000, Wind SND FX]
type = PlaySnd
Trigger1 = AnimElem = 7, = 1
value = 1200,1
Channel = 2

[State 1000, Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 8
value = 101,0
Channel = 3

[State 1000, Jump SND]
type = PlaySnd
Trigger1 = AnimElem = 7
value = 40,0
Channel = 3

[State 1200, Speed]
Type = VelSet
TriggerAll = var(10) != 2
Trigger1 = AnimElem = 7, = 3
x = 7+1.5*var(10)

[State 1200, Speed]
Type = VelSet
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7
x = 7
y = -7

[State 1200, Speed]
Type = Gravity
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, > 0

[State 52, 3]
type = StateTypeSet
trigger1 = var(10) = 2
trigger1 = AnimElem = 7
statetype = A

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, = 2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Heavy
Fall.animtype = Heavy
getPower = 0,0
givePower = 36, 36
guardflag = H
hitflag = MAF
pausetime = 4,4
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = low
ground.slidetime = 17
ground.hittime = 20
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
EnvShake.Time = 5
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = var(10) != 2
Trigger1 = AnimElem = 7, = 2
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
animtype = Heavy
Fall.animtype = Heavy
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 4,4
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
ground.type = low
ground.slidetime = 17
ground.hittime = 20
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
EnvShake.Time = 5
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = ChangeState
Trigger1 = MoveHit
Trigger1 = Target, Alive
value = 3060

[State 1000, 9]
type = ChangeState
Trigger1 = var(10) = 2
Trigger1 = AnimElem = 7, > 0
Trigger1 = Pos y >= 0
Trigger1 = Vel y > 0
Trigger2 = Moveguarded
trigger3 = !AnimTime
value = 3005

;Shin Ya Otome: Mizumi success
[Statedef 3060]
Type = S
MoveType = A
Physics = N
Anim = 3011
VelSet = 1.5, 0
Ctrl = 0
PowerAdd = 0

[State 1000, 9]
type = Posset
Trigger1 = !Time
y = 0

[State 810, Bind 1]
type = TargetState
trigger1 = !Time
Value = 6200

[State 810, Bind 1]
type = Width
trigger1 = 1
Edge = 45,0

[State 810, Bind 1]
type = TargetBind
trigger1 = 1
pos = 45, 0

[State 200, Init Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
TriggerAll = AnimElem = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
AnimType = Hard
getPower = 0,0
givePower = 36, 36
Guardflag = M
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
ground.Type = Low
ground.SlideTime = 17
ground.HitTime = 20
ground.Velocity = -4
Air.Velocity = -4
Ground.cornerpush.veloff = 0
Air.cornerpush.veloff = 0
Kill = 0
Snap = 35,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, End Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
TriggerAll = AnimElem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
AnimType = Hard
getPower = 0,0
givePower = 36, 36
Guardflag = M
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -75
ground.Type = High
ground.SlideTime = 17
ground.HitTime = 20
ground.Velocity = -4
Air.Velocity = -4
Ground.cornerpush.veloff = 0
Air.cornerpush.veloff = 0
Kill = 0
Snap = 35,0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, ALOA set 2]
Type = EnvColor
Trigger1 = AnimElem = 5
Trigger1 = AnimElem = 11
Value = 255,255,255
Time = 3
Under = 1
ignorehitpause = 1

[State 200, ALOA set 2]
Type = TargetState
Trigger1 = Movehit
Value = 6200
ignorehitpause = 1

[State 200, Twister]
Type = Explod
Trigger1 = AnimElem = 5, = 2
Trigger2 = AnimElem = 11, = 2
anim = 1050
Pos = 40, 0
PosType = p1
ownpal = 1
bindtime = 1
Sprpriority = 4
ignorehitpause = 1
Removetime = 9

[State 1000, 9]
type = ChangeState
Trigger1 = Time >= 115
value = 3070

;Shin Ya Otome: Mizumi throw
[Statedef 3070]
Type = S
MoveType = A
Physics = N
Anim = 3020
VelSet = 0, 0
Ctrl = 0
PowerAdd = 0

[State 200, End Combo]
Type = HitDef
trigger1 = !var(16) && var(15) < 10
Trigger1 = AnimElem = 4
attr = S, HT
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
AnimType = Hard
getpower = 0,0
givepower = 0,0
Guardflag =
Hitflag = MAF
pauseTime = 0,0
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -130
ground.Type = High
ground.SlideTime = 9
ground.HitTime = 9
ground.Velocity = 0
Air.Velocity = 0
Ground.cornerpush.veloff = 0
Air.cornerpush.veloff = 0
p1StateNo = 3072
p2StateNo = 3081
p1facing = 1
p2facing = 1
Kill = 0
yAccel = .6
fall = 1
fall.recover = 0
numhits = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
ctrl = 1

;Shin Ya Otome: Jittsouko Jump
[Statedef 3072]
type = S
movetype = A
physics = S
anim = 3022
poweradd = 0
SprPriority = 2

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 810, Bind 1]
type = Width
trigger1 = 1
Edge = 25,25

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 4, < 0
pos = 25, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 4, >= 0
pos = 30, -125

[State 810, Grab SND]
type = PlaySnd
Trigger1 = AnimElem = 1
value = 2,800

[State 810, Jump SND]
type = PlaySnd
trigger1 = AnimElem = 3
Value = 41, 0
Channel = 3

[State 810, Blood SND]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 3000,3
channel = 0

[State 700, Blood]
type = Explod
Trigger1 = time = 12 | time = 20 | time = 28 | time = 36 | time = 44
Trigger2 = time = 52 | time = 60
anim = 3034
postype = P1
name = "Blood Effect"
pos = 10, -135
sprpriority = 5
ownpal = 1

[State 700, Blood]
type = Explod
Trigger1 = time = 16 | time = 24 | time = 32 | time = 40 | time = 48
Trigger2 = time = 56 | time = 64
anim = 3034
postype = P1
name = "Blood Effect"
pos = 45, -133
sprpriority = 5
ownpal = 1
facing = -1

[State 810, Jump StateType]
type = StateTypeSet
trigger1 = AnimElem = 3
StateType = A

[State 810, Jump Vel]
type = Velset
trigger1 = AnimElem = 3
y = -11

[State 810, Gravity]
type = Gravity
trigger1 = AnimElem = 3, > 0

[State 821, 4] ;Hit ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3073

;Shin Ya Otome: Jittsouko Finish
[Statedef 3073]
type = S
movetype = A
physics = S
anim = 3023
poweradd = 0
SprPriority = 2
Velset = 0,0

[State 3023, Set gnd]
type = PosSet
trigger1 = !Time
y = 0

[State 3023, Turn]
type = Turn
trigger1 = !Time

[State 3023, p2State]
type = TargetState
trigger1 = !Time
Value = 3082

[State 810, Bind 1]
type = Width
trigger1 = AnimElem = 5, > 0
Edge = 50,0

[State 810, Bind 1]
type = PlaySnd
trigger1 = AnimElem = 1
Value = 4, 2
Channel = 1

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 25, 0

[State 810, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 1
value = floor(ifElse(78 * fvar(11) < 7, -7, -78 * fvar(11)))

[State 810, Bind 1]
type = PlaySnd
trigger1 = AnimElem = 1
Value = 820, 2
Channel = 3

[State 1350, Targetbind]
Type = EnvShake
Trigger1 = AnimElem = 1
Time = 8
freq = 45
ampl = -4

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
Pos = 40,0
posType = P1
facing = -1
ownPal = 1

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Shin Ya Otome: Jittsouko Jump
[Statedef 3075]
type = S
movetype = A
physics = S
anim = 3024
poweradd = 0
SprPriority = 2

[State 3000, SDM Set]
Type = BgPalFx
Trigger1 = 1
InvertAll = 1
Time = 3
Color = 6
IgnoreHitPause = 1

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 200, Blood sound]
Type = PlaySND
Trigger1 = AnimElem = 2
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 6
Trigger4 = AnimElem = 8
Trigger5 = AnimElem = 10
Value = 1400,0
Channel = 3

[State 810, Hurt]
type = TargetLifeAdd
Trigger1 = AnimElem = 2
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 6
Trigger4 = AnimElem = 8
Trigger5 = AnimElem = 10
value = floor(ifElse(10 * fvar(11) < 7, -7, -10 * fvar(11)))
kill = 0

[State 810, Bind 1]
type = Width
trigger1 = 1
Edge = 25,25

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 12, < 0
pos = 25, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 12, >= 0
pos = 30, -125

[State 810, Jump SND]
type = PlaySnd
trigger1 = AnimElem = 11
Value = 40, 0
Channel = 3

[State 810, Jump StateType]
type = StateTypeSet
trigger1 = AnimElem = 11
StateType = A

[State 810, Jump Vel]
type = Velset
trigger1 = AnimElem = 11
y = -11

[State 810, Gravity]
type = Gravity
trigger1 = AnimElem = 11, > 0

[State 821, 4] ;Hit ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3073

;Shin Ya Otome: Jittsouko P2 UP
[Statedef 3081]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3031

[State 821, 4] ;End
type = SelfState
trigger1 = !AnimTime
value = 5050

;Shin Ya Otome: Jittsouko P2 End
[Statedef 3082]
type = A
movetype = H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = !Time
value = 3032

[State 820, 1]
type = Velset
Trigger1 = AnimElem = 2, = 4
x = 4
y = -8

[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = AnimElem = 2, > 4
y = .6

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Shin Ya Otome: Jittsouko P2 UP
[Statedef 3085]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3033

[State 821, 4] ;End
type = SelfState
trigger1 = !AnimTime
value = 5050

;====<YAMIDOUKOKU>=
[StateDef 3100]
type = S
physics = S
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-45 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = AnimElem = 1, = 1
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 800, 1]
type = HitDef
Triggerall = p2dist x < 70
Trigger1 = PrevStateNo = [200,3020]
Trigger1 = !Time
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M
fall.animtype = back
priority = 1, Miss
ground.type = low
ground.hittime = 60
sparkno = -1
sparkxy = -30,-70
HitSound = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3101
p2stateno = 3120
yaccel = .6
Fall = 1
Fall.recover = 0

[State 800, 1]
type = HitDef
Triggerall = p2dist x < 70
Trigger1 = PrevStateNo != [200,3020]
Trigger1 = !Time
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M-
fall.animtype = back
ground.type = low
ground.hittime = 60
priority = 7, Miss
sparkno = -1
sparkxy = -30,-70
HitSound = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3101
p2stateno = 3120
yaccel = .6
Fall = 1
Fall.recover = 0

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Yamidoukoku Hit
[Statedef 3101]
Type = S
MoveType = A
Physics = N
Anim = 3101
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 1

[State 3100, Super Pause FX]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-135 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = AnimElem = 5
time = 26
moveTime = 26
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Goenitz voice1]
type = PlaySnd
Trigger1 = AnimElem = 2
Value = 4,4
Channel = 1
IgnoreHitPause = 1

[State 3000, Goenitz voice2]
type = PlaySnd
Trigger1 = AnimElem = 6, = -1
Value = 3100,0
Channel = 1
IgnoreHitPause = 1

[State 810, Width]
type = Width
trigger1 = AnimElem = 5, < 0
Edge = 60,0

[State 810, Width]
type = Width
trigger1 = AnimElem = 5, >= 0
Edge = 45,0

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 5, < 0
pos = 50, 0

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 5, >= 0
pos = 43, -130

[State 3000, DM FX Sound]
type = PlaySnd
Trigger1 = AnimElem = 6, = -1
Value = 3100, 1
Channel = 3
IgnoreHitPause = 1

[State 1000, 3]
type = Explod
trigger1 = AnimElem = 6, = -1
Anim = 3150
ID = 3150
ownpal = 1
removetime = 100
Sprpriority = 5
pos = 45,0

[State 1000, 3]
type = Explod
trigger1 = AnimElem = 6, > 0
trigger1 = !NumExplod(3150)
Anim = 1250
ownpal = 1
Sprpriority = 5
pos = 45,0
persistent = 0

[State 821, 4]
type = TargetLifeAdd
trigger1 = AnimElem = 6, = 1
value = floor(ifElse(16 * fvar(11) < 7, -7, -16 * fvar(11)))
Kill = 0

[State 821, 4]
type = EnvColor
trigger1 = AnimElem = 6, = 1
value = 255,255,255
Time = 2
Under = 1

[State 821, 4]
type = ChangeState
trigger1 = Time >= 144
value = 3110

;Yamidoukoku End
[Statedef 3110]
Type = S
MoveType = A
Physics = S
Anim = 3110
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3000, SDM Set]
Type = Changeanim
Trigger1 = !Time
value = 3111

[State 810, Bind 1]
type = TargetState
trigger1 = !Time
Value = 3122

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 2, < 0
pos = 20, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2, >= 0
trigger1 = AnimElem = 3, < 0
pos = 23, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 3
pos = 50, -125

[State 821, 4]
type = TargetLifeAdd
trigger1 = AnimElem = 3
value = floor(ifElse(16 * fvar(11) < 7, -7, -16 * fvar(11)))

[State 821, 4]
type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1

;Yamidoukoku DM P2 grabbed
[Statedef 3120]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = !Time
value = 3120

[State 821, 4]
type = SelfState
trigger1 = Time > 130
value = 5050

;Yamidoukoku SDM P2 grabbed
[Statedef 3121]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = !Time
value = 3121

[State 821, 4]
type = SelfState
trigger1 = Time > 175
value = 5050

;Yamidoukoku P2 launched
[Statedef 3122]
type = A
movetype = H
physics = N
velset = 0,0

[State ScreenBound]
type = ScreenBound
trigger1 = 1
MoveCamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = !Time
value = 3122

[State 820, 1]
type = PosAdd
Trigger1 = !AnimTime
y = -Const(size.head.pos.y)

[State 820, 1]
type = Velset
Trigger1 = !AnimTime
x = -4
y = -9

[State 821, 4]
type = SelfState
trigger1 = !AnimTime
value = 5050

;====<MAX YAMIDOUKOKU>=
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3100
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

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(10 * const(size.xScale)), ceil(-45 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = AnimElem = 1, = 1
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 800, 1]
type = HitDef
Triggerall = p2dist x < 70
Trigger1 = PrevStateNo = [200,3020]
Trigger1 = !Time
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M
fall.animtype = back
priority = 1, Miss
ground.type = low
ground.hittime = 60
sparkno = -1
sparkxy = -30,-70
HitSound = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3151
p2stateno = 3121
yaccel = .6
Fall = 1
Fall.recover = 0

[State 800, 1]
type = HitDef
Triggerall = p2dist x < 70
Trigger1 = PrevStateNo != [200,3020]
Trigger1 = !Time
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M-
fall.animtype = back
ground.type = low
ground.hittime = 60
priority = 7, Miss
sparkno = -1
sparkxy = -30,-70
HitSound = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3151
p2stateno = 3121
yaccel = .6
Fall = 1
Fall.recover = 0

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Yamidoukoku Hit
[Statedef 3151]
Type = S
MoveType = A
Physics = N
Anim = 3102
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 1

[State 3100, Super Pause FX]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(40 * const(size.xScale)), ceil(-135 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = AnimElem = 5
time = 42
moveTime = 42
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3000, Goenitz voice1]
type = PlaySnd
Trigger1 = AnimElem = 2
Value = 4,4
Channel = 1
IgnoreHitPause = 1

[State 3000, Goenitz voice2]
type = PlaySnd
Trigger1 = AnimElem = 6, = -1
Value = 3100,0
Channel = 1
IgnoreHitPause = 1

[State 810, Width]
type = Width
trigger1 = AnimElem = 5, < 0
Edge = 60,0

[State 810, Width]
type = Width
trigger1 = AnimElem = 5, >= 0
Edge = 45,0

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 5, < 0
pos = 50, 0

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 5, >= 0
pos = 43, -130

[State 3000, DM FX Sound]
type = PlaySnd
Trigger1 = AnimElem = 6, = -1
Value = 3100, 1
Channel = 3
IgnoreHitPause = 1

[State 1000, 3]
type = Explod
trigger1 = AnimElem = 6, = -1
Anim = 3150
ID = 3150
ownpal = 1
removetime = 100
Sprpriority = 5
pos = 45,0

[State 1000, 3]
type = Explod
trigger1 = AnimElem = 6, > 0
trigger1 = !NumExplod(3150)
Anim = 1250
ownpal = 1
Sprpriority = 5
pos = 45,0
persistent = 0

[State 821, 4]
type = TargetLifeAdd
trigger1 = AnimElem = 6, = 1
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
Kill = 0

[State 821, 4]
type = EnvColor
trigger1 = AnimElem = 6, = 1
value = 255,255,255
Time = 2
Under = 1

[State 821, 4]
type = ChangeState
trigger1 = Time >= 174
value = 3160

;Yamidoukoku End
[Statedef 3160]
Type = S
MoveType = A
Physics = S
Anim = 3110
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3000, SDM Set]
Type = Changeanim
Trigger1 = !Time
value = 3111

[State 810, Bind 1]
type = TargetState
trigger1 = !Time
Value = 3122

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 2, < 0
pos = 20, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2, >= 0
trigger1 = AnimElem = 3, < 0
pos = 23, -135

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 3
pos = 50, -125

[State 821, 4]
type = TargetLifeAdd
trigger1 = AnimElem = 3
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))

[State 821, 4]
type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1

;====<FUUJIN IBUKI>=
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
var(17) = 33

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

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 7, <= 7
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-60 * const(size.xScale)), ceil(-25 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = animelem = 4
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1200, Speed]
Type = Width
Trigger1 = 1
Edge = 15,0

[State 1000, Goenitz Voice1]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 3200,0
Channel = 1

[State 1000, Wind SND FX]
type = PlaySnd
Trigger1 = AnimElem = 6, = 1
value = 1200,1
Channel = 2

[State 1000, Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 6, = 5
value = 101,0
Channel = 3

[State 200, Wind]
Type = Explod
Trigger1 = AnimElem = 6, = 1
anim = 1250
Pos = 30, 0
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 4
ignorehitpause = 1
PauseMoveTime = -1
IgnoreHitPause = 1
Persistent = 0

[State 1200, Speed]
Type = VelSet
Trigger1 = AnimElem = 6, = 5
x = 10

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = AnimElem = 6, = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 0
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 10,12
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -60
ground.type = low
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = TargetState
Trigger1 = MoveHit
Trigger1 = numtarget
Trigger1 = target, alive
Trigger1 = target, stateNo != [6300,6310]
value = 6300

[State 1000, 9]
type = ChangeState
Trigger1 = MoveHit
Trigger1 = numtarget
Trigger1 = target, alive
value = 3201

[State 1000, 9]
type = ChangeState
Trigger1 = Moveguarded
trigger2 = !AnimTime
value = 3005

;Fuujin Ibuki 2nd Part
[Statedef 3201]
Type = S
MoveType = A
Physics = N
Anim = 3205
Velset = 1.5,0
Ctrl = 0
Juggle = 0

[State 200, NOThit]
Type = NotHitBy
Trigger1 = 1
Value = SCA
ignorehitpause = 1

[State 1200, Speed]
Type = Width
Trigger1 = 1
Edge = 15,0

[State 810, Bind 1]
type = TargetBind
trigger1 = !Time
pos = 50, 0
ignorehitpause = 1

[State 200, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 5
Trigger3 = AnimElem = 6
Trigger4 = AnimElem = 10
x = 5

[State 200, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 11
x = 20

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 9
Trigger3 = AnimElem = 18
Value = 1,2
Channel = 5

[State 200, Voice]
Type = PlaySnD
Trigger1 = AnimElem = 8
Value = 3200,1

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 2
Trigger1 = AnimElem = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
ground.Type = Low
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 3
Trigger1 = AnimElem = 10
attr = S, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
ground.Type = High
ground.slidetime = 17
ground.hittime = 18
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = 0, -11
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, -11
air.cornerPush.velOff = 0
yAccel = .5
Fall = 1
Fall.Recover = 0
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = Velset
Trigger1 = AnimElem = 14
x = 0

[State 200, PosAdd]
Type = PlaySnD
Trigger1 = AnimElem = 17
Value = 3200,2

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 21
anim = 3210
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 20

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 4
Trigger1 = AnimElem = 21, = 2
attr = S, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
AnimType = Diagup
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 20,20
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -105
ground.Type = High
ground.slidetime = 17
ground.hittime = 18
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = 0, -11
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, -11
air.cornerPush.velOff = 0
yAccel = .5
Fall = 1
Fall.Recover = 0
Kill = 0
ID = 3200
EnvShake.Time = 20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, ALOA set 2]
Type = ChangeState
Trigger1 = AnimElem = 26
Trigger1 = !Numtarget(3200)
Value = 0
Ctrl = 1

[State 1000, Gou Hadouken FX sound]
type = PlaySnd
trigger1 = AnimElem = 32, = 1
value = 3100,1
Channel = 3

[State 3200, Sonic Hurricane Projectile]
type = Helper
trigger1 = AnimElem = 32, = 1
helperType = Normal
stateNo = 3205
ID = 3205
name = "Fuujin Ibuki Projectile"
posType = P1
pos = ceil(25 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Sonic Hurricane Projectile]
type = Helper
trigger1 = AnimElem = 46
helperType = Normal
stateNo = 3215
ID = 3215
name = "Fuujin Ibuki Projectile"
posType = P1
pos = ceil(75 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MAX FUUJIN IBUKI>=
[StateDef 3250]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElem = 7, <= 7
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-60 * const(size.xScale)), ceil(-25 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = animelem = 4
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 1200, Speed]
Type = Width
Trigger1 = 1
Edge = 15,0

[State 1000, Goenitz Voice1]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 3200,0
Channel = 1

[State 1000, Wind SND FX]
type = PlaySnd
Trigger1 = AnimElem = 6, = 1
value = 1200,1
Channel = 2

[State 1000, Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 6, = 5
value = 101,0
Channel = 3

[State 200, Wind]
Type = Explod
Trigger1 = AnimElem = 6, = 1
anim = 1250
Pos = 30, 0
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 4
ignorehitpause = 1
PauseMoveTime = -1
IgnoreHitPause = 1
Persistent = 0

[State 1200, Speed]
Type = VelSet
Trigger1 = AnimElem = 6, = 5
x = 10

[State 3100, First Hits]
Type = HitDef
trigger1 = !var(16) && var(15) < 1
Trigger1 = AnimElem = 6, = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 10,12
guard.pausetime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -60
ground.type = low
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1000, 9]
type = TargetState
Trigger1 = MoveHit
Trigger1 = numtarget
Trigger1 = target, alive
Trigger1 = target, stateNo != [6300,6310]
value = 6300

[State 1000, 9]
type = ChangeState
Trigger1 = MoveHit
Trigger1 = numtarget
Trigger1 = target, alive
value = 3251

[State 1000, 9]
type = ChangeState
Trigger1 = Moveguarded
trigger2 = !AnimTime
value = 3005

;Fuujin Ibuki 2nd Part
[Statedef 3251]
Type = S
MoveType = A
Physics = N
Anim = 3207
Velset = 1.5,0
Ctrl = 0
Juggle = 0

[State 200, NOThit]
Type = NotHitBy
Trigger1 = 1
Value = SCA
ignorehitpause = 1

[State 1200, Speed]
Type = Width
Trigger1 = 1
Edge = 15,0

[State 810, Bind 1]
type = TargetBind
trigger1 = !Time
pos = 50, 0
ignorehitpause = 1

[State 200, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 5
Trigger3 = AnimElem = 6
Trigger4 = AnimElem = 10
x = 5

[State 200, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 11
x = 20

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 9
Trigger3 = AnimElem = 31
Value = 1,2
Channel = 5

[State 200, Voice]
Type = PlaySnD
Trigger1 = AnimElem = 8
Value = 3200,1

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 2
Trigger1 = AnimElem = 5
attr = S, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
ground.Type = Low
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 3
Trigger1 = AnimElem = 10
attr = S, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
ground.Type = High
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 2
Trigger1 = AnimElem = 18
attr = S, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 10,12
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -40
ground.Type = Low
ground.slidetime = 17
ground.hittime = 25
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -6.52
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 3
Trigger1 = AnimElem = 23
attr = S, HA
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
animtype = Heavy
Fall.animtype = Heavy
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
ground.Type = High
ground.slidetime = 17
ground.hittime = 18
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = 0, -11
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, -11
air.cornerPush.velOff = 0
yAccel = .5
Fall = 1
Fall.Recover = 0
Kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, Hitdef]
Type = Velset
Trigger1 = AnimElem = 27
x = 0

[State 200, PosAdd]
Type = PlaySnD
Trigger1 = AnimElem = 30
Value = 3200,2

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 34
anim = 3210
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 20

[State 200, Hitdef]
Type = HitDef
trigger1 = !var(16) && var(15) < 4
Trigger1 = AnimElem = 34, = 2
attr = S, HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
AnimType = DiagUp
getpower = 0,0
givepower = 30,15
Guardflag = M
Hitflag = MAF
pauseTime = 20,20
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -105
ground.Type = High
ground.slidetime = 17
ground.hittime = 18
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = 0, -11
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, -11
air.cornerPush.velOff = 0
yAccel = .5
Fall = 1
Fall.Recover = 0
Kill = 0
ID = 3200
EnvShake.Time = 20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 200, ALOA set 2]
Type = ChangeState
Trigger1 = AnimElem = 38
Trigger1 = !Numtarget(3200)
Value = 0
Ctrl = 1

[State 1000, Gou Hadouken FX sound]
type = PlaySnd
trigger1 = AnimElem = 44, = 1
value = 3100,1
Channel = 3

[State 3200, Sonic Hurricane Projectile]
type = Helper
trigger1 = AnimElem = 44, = 1
helperType = Normal
stateNo = 3205
ID = 3205
name = "Fuujin Ibuki Projectile"
posType = P1
pos = ceil(25 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Sonic Hurricane Projectile]
type = Helper
trigger1 = AnimElem = 58
helperType = Normal
stateNo = 3215
ID = 3215
name = "Fuujin Ibuki Projectile"
posType = P1
pos = ceil(75 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;==SUPER YAMIDOUKOKU>=
[Statedef 3300]
type = S
physics = S
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
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

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-25 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = AnimElem = 1, = 1
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3300, Goenitz voice]
type = PlaySnd
Trigger1 = AnimElem = 1
Value = 3200,1
Channel = 1

[State 3300, 1]
type = HitDef
Trigger1 = PrevStateNo = [200,1499]
Trigger1 = Time = 0
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M
priority = 1, Miss
sparkno = -1
HitSound = -1
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 3310
p2stateno = 3320
guard.dist = 0
Fall = 1

[State 3300, 2]
type = HitDef
Trigger1 = PrevStateNo != [200,1499]
Trigger1 = Time = 0
trigger1 = P2StateNo != [150,155]
attr = S, HT
hitflag = M-
priority = 1, Miss
sparkno = -1
HitSound = -1
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 3310
p2stateno = 3320
guard.dist = 0
Fall = 1

[State 3300, 3]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Super Yamidoukoku Hit
[Statedef 3310]
Type = S
MoveType = A
Physics = N
Anim = 3310
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 1

[State 3310, Grab SND]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,800

[State 3310, Grab Hold Coming Down SND]
type = PlaySnd
trigger1 = AnimElemtime(3) = 110
value = 4,3

[State 3310, Wind SND]
type = PlaySnd
trigger1 = AnimElemtime(3) = 40
value = 3100,1

[State 3310, Blood SND]
type = PlaySnd
trigger1 = AnimElemtime(3) = 40
value = 3000,3

[State 3310, Goenitz Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300,0

[State 3310, Goenitz Voice]
type = PlaySnd
trigger1 = AnimElemtime(3) = 40
value = 4,4

[State 3310, Wind Cutting SND]
type = PlaySnd
trigger1 = AnimElemtime(3) = 60
trigger2 = AnimElemtime(3) = 100
trigger3 = AnimElemtime(3) = 120
value = 3300,1

[State 3310, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3310, 1]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) < 0
pos = 25, 0

[State 3310, 2]
type = TargetBind
Trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(4) < 0
pos = 25, -120

[State 3310, Wind FX]
type = Explod
trigger1 = AnimElemtime(3) = 40
anim = 3150
ID = 3150
removetime = -1
pos = 25,0
sprpriority = 10
ownpal = 1
bindtime = -1

[State 3310, 3]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 3150

[State 3310, 4]
type = Envcolor
trigger1 = AnimElemtime(3) > 40 && AnimElemtime(4) < 0
trigger1 = random <= 250
time = 0
value = 255,255,255
under = 1

[State 3310, 5]
type = EnvShake
trigger1 = AnimElemtime(3) = 40 && AnimElemtime(4) < 0
ampl = 2
freq = 40
time = 100

[State 3310, Pos]
type = VarRandom
trigger1 = 1
v = 1
range = -10,10

[State 3310, Pos]
type = VarRandom
trigger1 = 1
v = 24
range = 18,45

[State 3310, Pos]
type = VarRandom
trigger1 = 1
v = 2
range = -150,-32

[State 3310, Pos]
type = VarRandom
trigger1 = 1
v = 27
range = -150,-32

[State 3310, Blood FX]
type = Explod
trigger1 = AnimElemtime(3) > 40 && AnimElemtime(4) < 0
trigger1 = random <= 200
anim = 3034
postype = P1
name = "Blood Effect"
pos = (var(1)),(var(2))
sprpriority = 5
ownpal = 1

[State 3310, Blood FX]
type = Explod
trigger1 = AnimElemtime(3) > 40 && AnimElemtime(4) < 0
trigger1 = random <= 200
anim = 3034
postype = P1
name = "Blood Effect"
pos = (var(24)),(var(27))
sprpriority = 5
ownpal = 1
facing = -1

[State 3310, Wind Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 4
value = 1400,2

[State 3310, Wind Dash SND]
type = PlaySnd
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 5
value = 1200,1

[State 3310, 8]
type = TargetBind
Trigger1 = AnimElemtime(4) >= 0
pos = 12, -120

[State 3310, Wind Dash FX]
type = Explod
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
anim = 1250
pos = 0,0
name = "Wind Dash Effect"
sprpriority = 5
ownpal = 1
bindtime = 1

[State 3310, 9]
type = Posadd
trigger1 = AnimElem = 5
x = 0
y = -120

[State 3310, 10]
type = Veladd
trigger1 = AnimElemtime(10) >= 0
y = .4

[State 3310, Life]
type = TargetLifeAdd
trigger1 = AnimElemtime(3) > 40 && AnimElemtime(4) < 0
trigger1 = (GameTime%3) = 0
value = -7
kill = 0

[State 3310, 13]
type = ChangeState
trigger1 = AnimElemtime(10) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3315

;Super Yamidoukoku End
[Statedef 3315]
Type = S
MoveType = A
Physics = S
Anim = 3313
VelSet = 0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3315, 0]
type = Changeanim
triggerall = var(32) = 0
triggerall = anim != 3315
trigger1 = stateno = 3315
value = 3315

[State 3315, 1]
type = TargetState
trigger1 = time = 0
value = 3325

[State 3315, 2]
type = Turn
trigger1 = time = 0

[State 3315, 3]
type = MakeDust
trigger1 = time = 0

[State 3315, Ground Slam SND]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 820,2

[State 3315, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 195,0

[State 3315, 4]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(3) < 0
pos = 15, 0

[State 3315, 5]
type = Posadd
trigger1 = time = 0
x = 15

[State 3315, 6]
type = Posset
trigger1 = time = 0
y = 0

[State 3315,7]
type = Velset
trigger1 = time = 0
y = 0

[State 871, Impact Dust]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0, 0
facing = -1
ownPal = 0

[State 3315, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Super Yamidoukoku P2 grabbed
[Statedef 3320]
type = A
movetype= H
physics = N
velset = 0,0

[State 3320, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3320, 1]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3320, 2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3320

;Super Yamidoukoku P2 launched
[Statedef 3325]
type = A
movetype= H
physics = N
velset = 0,0

[State 3325,0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3325, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3325

[State 3325, 2]
type = Lifeadd
trigger1 = AnimElem = 3
value = -98

[State 3325, 3]
type = EnvShake
trigger1 = AnimElem = 3
ampl = 5
freq = 70
time = 15

[State 3325, 5]
type = VelSet
trigger1 = AnimElem = 10
x = 4
y = -7

[State 3325, 6]
type = Veladd
trigger1 = AnimElemtime(10) >= 0
y = .48

[State 3325, 7]
type = Sprpriority
trigger1 = AnimElem = 3
value = 5

[State 3325, 8]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
