; _________________________________________
;| Ryo Sakazaki by CrazyKoopa & Jmorphman  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
;Haoh Shokoken
[Statedef 3000]
type=S
physics=S
movetype=A
anim=3000
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3000, ifElse(var(10) = 1, 3001, 3002))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 2, -72
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElemTime(17) = 1
value = 3000,1
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElemTime(17) = 1
value = 3000, 2
channel = 1

[State 3000, Haoh Shokoken Projectile]
type = Helper
trigger1 = AnimElemTime(17) = 1
helperType = Normal
stateNo = 3005
ID = 3005
name = "Haoh Shokoken Projectile"
posType = P1
pos = 85,-65
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElem = 17
value = 32,0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;MAX Haoh Shokoken
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3002
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 2, -72
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElemTime(17) = 1
value = 3000,1
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElemTime(17) = 1
value = 3000, 2
channel = 1

[State 3050, MAX Haoh Shokoken Projectile]
type = Helper
trigger1 = AnimElemTime(17) = 1
helperType = Normal
stateNo = 3055
ID = 3055
name = "MAX Haoh Shokoken Projectile"
posType = P1
pos = 85,-65
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElem = 17
value = 32,0

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Ryuko Ranbu
[Statedef 3100]
type=S
physics=S
movetype=A
anim=3100
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 2
time = 1
value = SCA

[State 3100, Superpause FX]
type = helper
trigger1 = Time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 12, -82
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdz", 2, ifElse(command = "holdy", 1, 0))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 3100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3102, ifElse(var(10) = 1, 3101, 3100))

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 3100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 3100, velset]
type = VelSet
trigger1 = animelem = 4
x = 10
y = ifElse(var(10) = 2, -2, ifElse(var(10) = 1, -1.5, -1))

[State 3100, veladd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.15625

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Jump Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
ID = 3100
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
getpower = 0, 0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3100, TargetState]
type = TargetState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3100
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3100)
trigger1 = MoveHit && Target, Alive
value = 3110

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105


;Landing (Missed)
[StateDef 3105]
type = S
anim = 3105
physics = N
moveType = I

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 3105, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) < 0
x = 0.88

[State 3105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3105, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3110, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3110, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(89) < 0
pos = 50,0

[State 3110, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(89) < 0
edge = 80,0

[State 3110, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3110, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3110, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 89
value = 3100,2
channel = 0

[State 3110, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time || AnimElem = 6 || AnimElem = 11
value = 1,0

[State 3110, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1,1

[State 3110, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 40 || AnimElem = 62 || AnimElem = 72 || AnimElem = 79
value = 1,2

[State 3110, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,3

[State 3110, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1,4

[State 3110, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 56
value = 1,5

[State 3110, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 90
value = 1,2
channel = 1

[State 3110, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 90
value = 40,0
channel = 4

[State 3110, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(90) >= 0
stateType = A
physics = N

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 90
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 90
x = 5.12493896484375
y = -10.5

[State 3110, VelMul]
type = VelMul
trigger1 = AnimElemTime(90) > 0
x= 0.85415699024616813748258244310265

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(90) > 0
y = 0.5

[State 3110, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 12
trigger1 = var(31) := 0
trigger2 = AnimElem = 49
trigger2 = var(31) := 1
trigger3 = AnimElem = 41 || AnimElem = 64 || AnimElem = 73 || AnimElem = 81
trigger3 = var(31) := 2
trigger4 = AnimElem = 17
trigger4 = var(31) := 3
trigger5 = AnimElem = 34
trigger5 = var(31) := 4
trigger6 = AnimElem = 26 || AnimElem = 57
trigger6 = var(31) := 5

[State 3110, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7
trigger1 = var(35) := 55 || var(36) := -82
trigger2 = AnimElem = 12
trigger2 = var(35) := 35 || var(36) := -86
trigger3 = AnimElem = 17
trigger3 = var(35) := 46 || var(36) := -80
trigger4 = AnimElem = 26
trigger4 = var(35) := 63 || var(36) := -22
trigger5 = AnimElem = 28
trigger5 = var(35) := 76 || var(36) := -67
trigger6 = AnimElem = 34
trigger6 = var(35) := 85 || var(36) := -58
trigger7 = AnimElem = 41
trigger7 = var(35) := 54 || var(36) := -72
trigger8 = AnimElem = 49
trigger8 = var(35) := 66 || var(36) := -71
trigger9 = AnimElem = 57
trigger9 = var(35) := 81 || var(36) := -85
trigger10 = AnimElem = 64
trigger10 = var(35) := 63 || var(36) := -69
trigger11 = AnimElem = 73
trigger11 = var(35) := 40 || var(36) := -72
trigger12 = AnimElem = 81
trigger12 = var(35) := 30 || var(36) := -115

[State 3110, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 12 || AnimElem = 26 || AnimElem = 34 || AnimElem = 49 || AnimElem = 57 || AnimElem = 81
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3110, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 17 || AnimElem = 41 || AnimElem = 64 || AnimElem = 73
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3110, Koho Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 89
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -10.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -89
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3110, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(90) >= 0
moveType = I

[State 3110, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111


;Land
[Statedef 3111]
type=S
physics=N
movetype=I
anim=3111
ctrl=0
velset=0,0
sprpriority=1

[State 40, Snd]
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

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;Target
[StateDef 3115]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3115, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3115, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 3115, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3115, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3116


;Sliding
[StateDef 3116]
type = S
movetype = H
physics = S

[State 3116, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5017

[State 3116, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3116, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;MAX Ryuko Ranbu
[Statedef 3150]
type=S
physics=S
movetype=A
anim=3150
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3150, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3150, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 2
time = 1
value = SCA

[State 3150, Superpause FX]
type = helper
trigger1 = Time = 3
helpertype = normal
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = 12, -82
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3150, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 3100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 3100, Velocity]
type = VelSet
trigger1 = AnimElem = 4
x = 10
y = -2

[State 3100, Gravity]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.15625

[State 40, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8103
ID = 8100
name = "Jump Dust"
postype = p1
pauseMoveTime = 255
superMoveTime = 255
ownpal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
ID = 3150
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
getpower = 0, 0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30), var(36) := -51
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2Facing = 1

[State 3100, TargetState]
type = TargetState
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
value = 3115
ID = 3150
ignoreHitPause = 1
persistent = 0

[State 3100, ChangeState]
type = ChangeState
trigger1 = NumTarget(3150)
trigger1 = MoveHit && Target, Alive
value = 3160

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3105


;Success
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3160, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3160, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(141) < 0
pos = 50,0

[State 3160, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(141) < 0
edge = 80,0

[State 3160, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3160, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3100,1
channel = 0

[State 3160, LP Woosh Sound]
type = PlaySnd
trigger1 = !Time || AnimElem = 6 || AnimElem = 11
value = 1,0

[State 3160, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 63 || AnimElem = 80 || AnimElem = 95
value = 1,1

[State 3160, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 40 || AnimElem = 49 || AnimElem = 56 || AnimElem = 88
trigger2 = AnimElem = 111 || AnimElem = 120 || AnimElem = 126 || AnimElem = 136
value = 1,2

[State 3160, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,3

[State 3160, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1,4

[State 3160, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 25 || AnimElem = 72 || AnimElem = 104
value = 1,5

[State 3160, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 143
value = 1,2
channel = 1

[State 3160, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 143
value = 40,0
channel = 4

[State 3160, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(143) >= 0
stateType = A
physics = N

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 143
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 143
x = 1.494781494140625
y = -5.5

[State 3160, VelMul]
type = VelMul
trigger1 = AnimElemTime(143) > 0
x= 0.85415699024616813748258244310265

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(143) > 0
y = 0.5

[State 3160, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 12
trigger1 = var(31) := 0
trigger2 = AnimElem = 65 || AnimElem = 82 || AnimElem = 97
trigger2 = var(31) := 1
trigger3 = AnimElem = 41 || AnimElem = 50 || AnimElem = 57 || AnimElem = 89 || AnimElem = 112 || AnimElem = 121 || AnimElem = 129 || AnimElem = 137
trigger3 = var(31) := 2
trigger4 = AnimElem = 17
trigger4 = var(31) := 3
trigger5 = AnimElem = 34
trigger5 = var(31) := 4
trigger6 = AnimElem = 26 || AnimElem = 73 || AnimElem = 105
trigger6 = var(31) := 5

[State 3160, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 7
trigger1 = var(35) := 55 || var(36) := -82
trigger2 = AnimElem = 12
trigger2 = var(35) := 35 || var(36) := -86
trigger3 = AnimElem = 17
trigger3 = var(35) := 46 || var(36) := -80
trigger4 = AnimElem = 26
trigger4 = var(35) := 63 || var(36) := -22
trigger5 = AnimElem = 28
trigger5 = var(35) := 76 || var(36) := -67
trigger6 = AnimElem = 34
trigger6 = var(35) := 85 || var(36) := -58
trigger7 = AnimElem = 41 || AnimElem = 112
trigger7 = var(35) := 63 || var(36) := -69
trigger8 = AnimElem = 50 || AnimElem = 121
trigger8 = var(35) := 40 || var(36) := -72
trigger9 = AnimElem = 57 || AnimElem = 89
trigger9 = var(35) := 54 || var(36) := -72
trigger10 = AnimElem = 65 || AnimElem = 98
trigger10 = var(35) := 66 || var(36) := -71
trigger11 = AnimElem = 73 || AnimElem = 105
trigger11 = var(35) := 81 || var(36) := -85
trigger12 = AnimElem = 82
trigger12 = var(35) := 52 || var(36) := -18
trigger13 = AnimElem = 129
trigger13 = var(35) := 30 || var(36) := -115
trigger14 = AnimElem = 137
trigger14 = var(35) := 40 || var(36) := -75

[State 3160, HitDef: High]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 12 || AnimElem = 26 || AnimElem = 34 || AnimElem = 65 || AnimElem = 73
trigger2 = AnimElem = 97 || AnimElem = 105 || AnimElem = 129
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3160, HitDef: Low]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 7 || AnimElem = 17
trigger2 = AnimElem = 41 || AnimElem = 50  || AnimElem = 57 || AnimElem = 81
trigger3 = AnimElem = 89 || AnimElem = 112 || AnimElem = 121 || AnimElem = 137
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3160, Koho Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 142
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Koho Hit 2/3]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 143
trigger2 = AnimElem = 144
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(145) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161


;Finish
[StateDef 3161]
type = S
anim = 3161
physics = N
moveType = A
velSet = 0,0

[State 3161, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3161, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3161, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3161, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3161, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 3161, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 3161, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
stateType = A
physics = N

[State 3161, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3161, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 5.12493896484375
y = -11

[State 3161, VelMul]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x= 0.85415699024616813748258244310265

[State 3161, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.5

[State 3161, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = vel x
y = -2

[State 3161, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 19), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3160, Hit 2]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 3]
type = HitDef
triggerAll = !var(16) && var(15) < 2
trigger1 = AnimElem = 7
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 4]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Hit 5]
type = HitDef
triggerAll = !var(16) && var(15) < 4
trigger1 = AnimElem = 9
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 28,28
guard.pauseTime = 28,28
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -4.16, -9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -9.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3160, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111



;---------------------------------------------------------------------------
;Tenchi Haoh Ken
[Statedef 3200]
type=S
physics=S
movetype=A
anim=3200
ctrl=0
velset=0,0
sprpriority=1
poweradd=-3000
facep2=1

[State 3200, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3200, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3200, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3200, Superpause FX]
type = helper
trigger1 = Time = 3
helpertype = normal
stateno = 8520
ID = 8520
name = "Superpause FX"
postype = p1
pos = -18, -64
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 1,2
channel = 1

[State 40, Position]
type = PosAdd
trigger1 = AnimElem = 3
x = 4

[State 40, Position]
type = PosAdd
trigger1 = AnimElem = 4
x = 8

[State 40, Position]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
x = 12

[State 40, Position]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 12
x = -12

[State 220, Hit]
type=hitdef
trigger1= !var(16) && var(15)<1
trigger1= animelem=7
ID = 3200
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*280<7, 7, fvar(11)*280)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 24,24
guard.pausetime = 24,24
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity =-7.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-74
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120

[State 3200, VarSet]
type = VarSet
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && NumTarget(3200)
var(10) = animelemno(0)
ignoreHitPause = 1

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3200) && MoveHit
value = 2,3200
channel = 3
ignoreHitPause = 1
persistent = 0

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3200) && MoveHit
trigger1 = AnimElemNo(0) = (var(10) + 1)
value = 3200,1
channel = 4
ignoreHitPause = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = ifelse(movehit,3201,0)
ctrl = ifelse(movehit,0,1)

[Statedef 3201]
type=S
physics=S
movetype=A
anim=3201
ctrl=0
velset=0,0
sprpriority=1
poweradd=0

[State 0, PosAdd]
type = PosAdd
trigger1 = !time
x = -24

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Stand get-hit (shaking)
[Statedef 3205]
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

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 3206


; Air get-hit (knocked away)
[Statedef 3206]
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
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5030, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5030, 5]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 3208 ;HITA_FALL

[State 5030, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3207 ;Air get-hit (transition)


; Air get-hit (transition)
[Statedef 3207]
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
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 3208 ;Air get-hit (falling)


; Air get-hit (falling)
[Statedef 3208]
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
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, Const(movement.air.gethit.groundlevel))
value = 3209 ;Downed get-hit (hit ground from fall)


; Downed get-hit (hit ground from fall)
[Statedef 3209]
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

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 3210 ;Downed get-hit (bounce off ground)


; Downed get-hit (bounce off ground)
[Statedef 3210]
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
trigger1 = time > 0
y = Const(movement.down.bounce.yaccel)

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5101, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
type = ChangeState
value = 3211

;---------------------------------------------------------------------------
; Downed get-hit (lying down)
[Statedef 3211]
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
type = SelfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5120, 7]
type = ChangeState
trigger1 = Time = 50
value = 3212

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


; Downed get-hit (getting up)
[Statedef 3212]
type = L
movetype= H
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

[State 5120, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 3213


;Dizzy
[Statedef 3213]
type = S
movetype= H
physics = N
velset = 0,0
ctrl = 0
anim = 5300

[State 1000, 0]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time = 125
value = 0
ctrl = 1
