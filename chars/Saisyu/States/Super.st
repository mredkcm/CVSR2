; _________________________________________
;| Saisyu Kusanagi by Lurker               |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<URA 108 SHIKI: OROCHINAGI>=
[StateDef 3000]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1100, 2999]) && var(7)) || var(20)

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
trigger1 = 1
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 5,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, Fire Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 3005
ID = 3005
bindtime = -1
removeTime = -1
sprPriority = 2
posType = P1
pos = 5,-60
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !AnimTime && !AILevel
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = 3001

[State 3000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3010


;Holding
[StateDef 3001]
type = S
anim = 3001
physics = S
moveType = A
velSet = 0,0

[State 3001, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdz", 2, ifElse(command = "holdy", 1, 0))

[State 3001, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3002, 3001)

[State 3001, End]
type = ChangeState
trigger1 = command != "holdx" && !var(10)
trigger2 = command != "holdy" && var(10) = 1
trigger3 = command != "holdz" && var(10) = 2
trigger4 = Time = 67
value = 3010


;Release
[StateDef 3010]
type = S
anim = 3010
physics = N
moveType = A
velSet = 0,0

[State 3010, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3005)
id = 3005

[State 3010, Fire Explod]
type = Explod
trigger1 = !Time
anim = 10190
sprPriority = 2
posType = P1
pos = 13,-46
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1

[State 3010, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,1
channel = 0

[State 3010, Fire Fade Away Sound]
type = PlaySnd
trigger1 = !Time
value = 190,1
channel = 1

[State 3010, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3110,0
channel = 3

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 5.6

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 3010, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) > 0
x = 0.96

[State 3010, Orochinagi Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3015
ID = 3015
name = "Orochinagi Projectile"
posType = P1
pos = 72,-85
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3010, Orochinagi Flames]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3020
ID = 3020
name = "Orochinagi Flames"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3010, Orochinagi Flames2]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3021
ID = 3021
name = "Orochinagi Flames2"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 8
moveType = I

[State 3010, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX URA 108 SHIKI: OROCHINAGI>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1100,2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3050, Fire Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 3005
ID = 3005
bindtime = -1
removeTime = -1
sprPriority = 2
posType = P1
pos = 5,-60
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 5,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, ChangeState]
type = ChangeState
triggerAll = !AnimTime && !AILevel
trigger1 = command = "holdx" && command = "holdy"
trigger2 = command = "holdy" && command = "holdz"
trigger3 = command = "holdx" && command = "holdz"
value = 3051

[State 3050, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3060


;Holding
[StateDef 3051]
type = S
anim = 3002
physics = S
moveType = A
velSet = 0,0

[State 3051, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdz" && command = "holdx", 2, ifElse(command = "holdy" && command = "holdz", 1, 0))

[State 3051, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = 1

[State 3051, AfterImage]
type = AfterImage
trigger1 = !Time
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,160,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State 3051, End]
type = ChangeState
trigger1 = (command != "holdx" || command != "holdy") && !var(10)
trigger2 = (command != "holdy" || command != "holdz") && var(10) = 1
trigger3 = (command != "holdz" || command != "holdx") && var(10) = 2
trigger4 = Time = 67
value = 3060


;Release
[StateDef 3060]
type = S
anim = 3010
physics = N
moveType = A
velSet = 0,0

[State 3060, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3005)
id = 3005

[State 3060, Fire Explod]
type = Explod
trigger1 = !Time
anim = 10190
sprPriority = 4
posType = P1
pos = 13,-46
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1

[State 3010, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,1
channel = 0

[State 3060, Fire Fade Away Sound]
type = PlaySnd
trigger1 = !Time
value = 190,1
channel = 1

[State 3060, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3110,0
channel = 3

[State 3060, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 4

[State 3060, AfterImage]
type = AfterImage
trigger1 = AnimElem = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State 3051, AfterImage]
type = AfterImage
trigger1 = AnimElem = 5
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,160,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 7

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 3060, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) > 0
x = 0.96

[State 3060, Orochinagi Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3015
ID = 3015
name = "Orochinagi Projectile"
posType = P1
pos = 72,-85
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3060, Orochinagi Flames]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3020
ID = 3020
name = "Orochinagi Flames"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3060, Orochinagi Flames2]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 3021
ID = 3021
name = "Orochinagi Flames2"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3060, AfterImage]
type = AfterImage
trigger1 = AnimElem = 11
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State 3060, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 8
moveType = I

[State 3060, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<1127 SHIKI: TSUMUGARI >=
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
var(21) = ((PrevStateNo = [1100,2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 3100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3101, 3100)

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2) >=0 && AnimElemTime(5) <=0
value = SCA
time = 1

[State 3100, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

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

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -28,-56
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 3

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2
channel = 5

[State 3100, DokuGami Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 1235
sprPriority = 2
pos = 0, 7
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(1235)
trigger1 = AnimElem = 11
ID = 1235

[State 3100, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
x = 8

[State 3100, PosAdd]
type = PosAdd
trigger1 = animelem = 10
trigger2 = animelem = 11
trigger3 = animelem = 12
trigger4 = animelem = 13
trigger5 = animelem = 14
x = -8

[State 3100, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 36,36
guard.pauseTime = 36,36
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -77
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 10
moveType = I

[State 3100, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3101

[State 3100, AfterImage Off]
type = AfterImageTime
trigger1 = AnimElemTime(9) >= 0
time = 0

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Connected
[StateDef 3101]
type = S
physics = S
moveType = A
anim = 3102
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 3101, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,2
channel = 1

[State 3101, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3100,1
channel = 0

[State 3101, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3110,0
channel = 1

[State 3101, PosAdd]
type = PosAdd
trigger1 = !Time
x = 4

[State 3101, VelSet]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
trigger4 = AnimElem = 5
x = 8

[State 3101, VelSet]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
x = 14

[State 3101, Fire Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1205
bindtime = -1
sprPriority = 2
scale = 0.5,0.5
pos = 10,0
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = back
fall.animType = Hard
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -77
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, Tsumugari Pillar]
type = Helper
trigger1 = AnimElem = 14
helperType = Normal
stateNo = 3105
ID = 3105
name = "Tsumugari Pillar"
posType = P1
pos = 48,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3101, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3101, AfterImage Off]
type = AfterImageTime
trigger1 = AnimElemTime(15) >= 0
time = 0

[State 3101, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 16
moveType = I

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX TSUMUGARI >=
[StateDef 3150]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1100,2999]) && var(7)) || var(20)

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
trigger1 = time = 3
fvar(5) = 0

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
trigger1 = AnimElemTime(2) >=0 && AnimElemTime(5) <=0
value = SCA
time = 1

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -28,-56
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
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
value = 3100,0
channel = 0

[State 3150, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,2
channel = 3

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2
channel = 5

[State 3150, Fire Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 1235
sprPriority = 2
pos = 0, 7
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(1235)
trigger1 = AnimElem = 11
ID = 1235

[State 3150, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
trigger5 = animelem = 6
trigger6 = animelem = 7
trigger7 = animelem = 8
x = 8

[State 3150, PosAdd]
type = PosAdd
trigger1 = animelem = 10
trigger2 = animelem = 11
trigger3 = animelem = 12
trigger4 = animelem = 13
trigger5 = animelem = 14
x = -8

[State 3150, AfterImage]
type = AfterImage
trigger1 = AnimElem = 29
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,160,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State 3150, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 36,36
guard.pauseTime = 36,36
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -77
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 10
moveType = I

[State 3150, Followup]
type = ChangeState
trigger1 = MoveContact
value = 3151

[State 3150, AfterImage Off]
type = AfterImageTime
trigger1 = AnimElemTime(9) >= 0
time = 0

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Connected
[StateDef 3151]
type = S
physics = S
moveType = A
anim = 3151
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3151, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,2
channel = 1

[State 3151, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3100,1
channel = 0

[State 3151, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 3110,0
channel = 1

[State 3151, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 40,0
channel = 3

[State 3151, PosAdd]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElem = 12
x = 4

[State 3151, VelSet]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
x = 8

[State 3151, VelSet]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 8
trigger3 = AnimElem = 9
trigger4 = AnimElem = 10
x = 14

[State 3151, VelSet]
type = PosAdd
trigger1 = AnimElem = 14
x = 5

[State 3151, VelSet]
type = VelSet
trigger1 = AnimElem = 15
y = -10

[State 3151, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(15) > 0
y = 0.55

[State 3151, Fire Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 1205
bindtime = -1
sprPriority = 2
scale = 0.5,0.5
pos = 10,0
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3151, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(1205)
trigger1 = AnimElem = 13
ID = 1205

[State 3151, Dust Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 3151, Oniyaki Fire Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 1105
ID = 1105
name = "Oniyaki Fire Helper"
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3151, Tsumugari Pillar]
type = Explod
trigger1 = AnimElem = 15
anim = 3152
sprPriority = 2
scale = 0.5,0.65
postype = p1
pos = 0,0
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3151, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 15
stateType = A
physics = N

[State 3151, Homuragasane Hits]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -5.5
guard.cornerPush.velOff = 0
air.velocity = -5.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -70
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, Hourin Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 16,16
guard.pauseTime = 16,16
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -70
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, Air Oniyaki Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 10
trigger1 = AnimElem = 15 || AnimElem = 16 || AnimElem = 17 || AnimElem = 18 || AnimElem = 19
trigger2 = AnimElem = 20 || AnimElem = 21 || AnimElem = 22 || AnimElem = 22 || AnimElem = 23 || AnimElem = 24
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -13.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -13.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -70
palFX.time = 64
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3151, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 26
moveType = I

[State 3151, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3152


;Landing
[StateDef 3152]
type = S
anim = 1101
physics = N
moveType = I
velSet = 0,0

[State 3152, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3152, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3152, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3152, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<AKAI TEN BARAI>=
[StateDef 3200]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1100, 2999]) && var(7)) || var(20)

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
trigger1 = Time = 3
fvar(5) = 0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

[State 3200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 3201, 3200)

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

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 25,-82
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 31
moveTime = 31
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Akai Ten Barai Flames]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 3205
ID = 3205
name = "Akai Ten Barai Flames"
posType = P1
pos = 53,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3200, Fire]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3110,0
channel = 0

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<CHOU YAMI BARAI>=
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1100, 2999]) && var(7)) || var(20)

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
trigger1 = Time = 3
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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

[State 3250, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 5,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 31
moveTime = 31
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 13
anim = 1005
sprPriority = 3
posType = p1
pos = -20,-15
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3250, Chou Yami Barai Pillar]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 3255
ID = 3255
name = "Chou Yami Barai Pillar"
posType = P1
pos = 53,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3110,0
channel = 1

[State 3250, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<SAISHU KESSEN OUGI: "HOMURA NO KEN">=
[StateDef 3300]
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
var(21) = ((PrevStateNo = [1100,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3300, Super Cancel Flash]
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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 10,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 3), 0, 1)
channel = 1

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) > 0
x = 7.5

[State 3300, End]
type = ChangeState
trigger1 = AnimElemTime(2) > 0 && P2BodyDist X <= 15
value = 3301

;Connected
[StateDef 3301]
type = S
physics = S
anim = 3301
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 3301, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3

[State 3301, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 3301, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 196 < 7, 7, fvar(11) * 196)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = -20
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.7
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -77
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3301, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 6
moveType = I

[State 3301, ChangeState]
type = ChangeState
trigger1 = Movehit
value = 3302

[State 3301, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Success
[StateDef 3302]
type = S
moveType = A
physics = N
anim = 3302
ctrl = 0
velSet = 0,0

[State 3302, AfterImage]
type = AfterImage
trigger1 = !Time
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,160,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State 3302, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1200,0
channel = 0

[State 3302, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1300,0
channel = 0

[State 3302, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 28
value = 1200,1
channel = 0

[State 3302, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 6 || AnimElem = 14
trigger2 = AnimElem = 20 || AnimElem = 27
value = 1000,2
channel = 1

[State 3302, Dokugami Fire Explod]
type = Explod
trigger1 = AnimElem = 6
anim = 1235
sprPriority = 2
pos = 0, 7
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3302, Geshiki: Goutsui Fire Explod]
type = Explod
trigger1 = AnimElem = 14
anim = 1485
ID = 1485
bindtime = -1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3302, 3rd Fire Explod]
type = Explod
trigger1 = AnimElem = 20
anim = 1485
ID = 3310
bindtime = -1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3302, Enjou Fire Explod]
type = Explod
trigger1 = AnimElem = 27
anim = 1205
bindtime = -1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3310, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(3302)
trigger1 = AnimElem = 9 || AnimElem = 40
trigger2 = AnimElem = 14 || AnimElem = 45
ID = 3302

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
x = 8

[State 3302, VelMul]
type = VelMul
trigger1 = AnimElemTime(11) >= 0
trigger1 = AnimElemTime(13) < 0
x = 0.9

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
x = 2

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 12
trigger2 = AnimElem = 13
trigger3 = AnimElem = 25
x = 4

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 14
x = 6

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 27
trigger2 = AnimElem = 28
trigger3 = AnimElem = 29
trigger4 = AnimElem = 30
x = 8

[State 3302, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
trigger2 = AnimElem = 32
trigger3 = AnimElem = 33
x = 14

[State 3302, Dust Helper]
type = Helper
trigger1 = AnimElem = 48
helperType = Normal
stateNo = 8100
ID = 8100
name = "Kamukura Dust"
posType = P1
ownPal = 1

[State 3302, Dokugami Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -77
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3302, Geshiki: Goutsui Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 15
attr = S, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -60
palFX.time = 36
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3302, 3rd Hit]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 21
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -70
palFX.time = 36
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3302, Enjou Hits]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = AnimElem = 28 || AnimElem = 30
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 52), var(36) := -70
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3302, Throw]
type = HitDef
trigger1 = AnimElem = 34 && !var(43)
attr = S, HT
hitFlag = M
priority = 7, Miss
getPower = 0, 0
givePower = 0, 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
numHits = 0
p1StateNo = 3303

[State 3302, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 34
value = 1,0
channel = 1

[State 3302, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3302, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===<HATSUGANE>==
[StateDef 3303]
type = A
physics = N
moveType = A
anim = 3303
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3303, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3304

[State 3303, AfterImage]
type = AfterImage
trigger1 = !Time
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State 3303, Width]
type = Width
trigger1 = AnimElemTime(14) < 0
edge = 50,50

[State 3303, Fire Startup Sound]
type = PlaySnd
trigger1 = AnimElemTime (8) = 35
value = 190,1
channel = 1

[State 3303, Fire Fade Away Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 190,2
channel = 1

[State 3303, Fire Explod]
type = Explod
trigger1 = AnimElemTime (8) = 35
anim = 3005
ID = 3303
sprPriority = 3
posType = P1
pos = 18,-65
removeTime = 60
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3303, Fire Explod 2]
type = Explod
trigger1 = AnimElem = 10
anim = 10190
ID = 3304
sprPriority = 3
posType = P1
pos = 18,-65
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3303, Fire Helper]
type = Helper
trigger1 = AnimElemTime (8) = 35
helperType = Normal
stateNo = 3306
ID = 3306
name = "Homura no Ken Fire Helper"
pos = 25,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3303, Explosion Sound 1]
type = PlaySnd
trigger1 = NumExplod(3304)
value = 1400,0
channel = 3
ignoreHitPause = 1
persistent = 0

[State 3303, Explosion Sound 2]
type = PlaySnd
trigger1 = NumExplod(3304)
value = 1400,0
channel = 4
ignoreHitPause = 1
persistent = 0

[State 3303, Explosion Sound 3]
type = PlaySnd
trigger1 = NumExplod(3304)
value = 1400,0
channel = 5
ignoreHitPause = 1
persistent = 0

[State 3303, Fire Explod 3]
type = Explod
trigger1 = AnimElem = 11
anim = 3152
ID = 3305
sprPriority = 3
removetime = -1
posType = P1
pos = 45,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3303, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(3303)
trigger1 = AnimElem = 10 || AnimElem = 11
ID = 3303

[State 3303, RemoveExplod]
type = RemoveExplod
triggerAll = NumExplod(3305)
trigger1 = AnimElemTime(11) >= 31
ID = 3305

[State 3303, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 3303, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 32,0

[State 3303, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 32,0

[State 3303, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 50,-62

[State 3303, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 60,-15

[State 3303, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 60,-20

[State 3303, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 65,-10

[State 3303, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
pos = 52,0

[State 3303, Damage 1]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 0

[State 3303, Damage 2]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 11
value = floor(ifElse(60 * fvar(11) < 7, -7, -60 * fvar(11)))

[State 3303, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 11
value = 36

[State 3303, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
trigger2 = NumTarget && AnimElem = 11
value = 1

[State 3303, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
trigger2 = NumTarget && AnimElem = 11
var(13) = 1

[State 3303, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
trigger2 = NumTarget && AnimElem = 11
var(15) = 1
ignoreHitPause = 1

[State 3303, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 5
trigger2 = NumTarget && AnimElem = 11
var(16) = 1
ignoreHitPause = 1

[State 3303, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 730,1
channel = 0

[State 3303, Voice: Owari ja!]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3300,0
channel = 0

[State 3303, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,2
channel = 1

[State 3303, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 5
trigger2 = NumTarget && AnimElem = 11
value = 2,2
channel = 2

[State 3303, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 820,0
channel = 1

[State 3303, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 7
trigger2 = AnimElem = 11
time = 18
ampl = 8
freq = 120

[State 3303, Impact Dust]
type = Helper
trigger1 = AnimElem = 7 || AnimElem = 11
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = 60,0
ownPal = 1

[State 3303, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 5
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 76, -12
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3303, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 11
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 60, -12
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3303, Flame Particles]
type = Helper
triggerAll = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
trigger2 = NumTarget && AnimElem = 11
trigger2 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3303, TargetState]
type = TargetState
trigger1 = AnimElem = 11 && NumTarget
value = 3305

[State 3303, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===<HATSUGANE (TARGET)>==
;Being Hit
[StateDef 3304]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3304, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3304

[State 3304, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

;After Throw
[StateDef 3305]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -2.5,-18
sprPriority = 0

[State 3304, PalFX]
type = PalFX
trigger1 = !Time
time = 34
mul = 128, 128, 128
sinadd = 96, 96, 96, 4

[State 3305, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3305

[State 3305, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3305, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5

[State 3305, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3305, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 3305, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100
