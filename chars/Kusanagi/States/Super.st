; _________________________________________
;| Kyo Kusanagi by Jmorphman               |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<URA 108 SHIKI: OROCHINAGI>=
;Startup
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

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
trigger1 = !Time
time = 43
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 24,-109
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3000, Width]
type = Width
trigger1 = !Time
edge = 30,0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 730,1
channel = 0

[State 3000, Voice (Kusanagi)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3000,10
channel = 0

[State 3000, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 191,1
channel = 1

[State 3000, Fire effect]
type = Explod
trigger1 = !Time
ID = 3005
anim = 3005
bindTime = -1
removeTime = 43
sprPriority = 3
posType = P1
pos = 39,-86
superMoveTime = 255
scale = 0.25,0.25
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, ModifyExplod 1]
type = ModifyExplod
trigger1 = Time = 1
ID = 3005
scale = 0.375,0.375

[State 3000, ModifyExplod 2]
type = ModifyExplod
trigger1 = Time = 2
ID = 3005
scale = 0.5,0.5

[State 3000, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 3005
posType = P1
pos = 43,-93

[State 3000, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 3005
posType = P1
pos = 24,-109

[State 3000, End]
type = ChangeState
triggerAll = !AnimTime && !AILevel
trigger1 = !var(10) && command = "holdx"
trigger2 = var(10) = 1 && command = "holdy"
trigger3 = var(10) = 2 && command = "holdz"
value = 3001

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 3010


;Holding
[StateDef 3001]
type = S
anim = ifElse(var(10) = 2, 3002, 3001)
physics = N
moveType = A
velSet = 0,0

[State 3001, ModifyExplod]
type = ModifyExplod
trigger1 = !Time
ID = 3005
removeTime = 133

[State 3001, End]
type = ChangeState
trigger1 = Time = 90
trigger2 = !var(10) && command != "holdx"
trigger3 = var(10) = 1 && command != "holdy"
trigger4 = var(10) = 2 && command != "holdz"
value = 3010


;Attack
[StateDef 3010]
type = S
anim = 3010
physics = N
moveType = A
velSet = 0,0

[State 3010, RemoveExplod]
type = RemoveExplod
trigger1 = !Time & NumExplod(3005)
id = 3005

[State 3010, Voice]
type = PlaySnd
trigger1 = !Time
value = 3010,0 + 10 * (var(40) = 1)
channel = 0

[State 3010, Fire Fade Away Sound]
type = PlaySnd
trigger1 = !Time
value = 190,2
channel = 1

[State 3010, Orochinagi sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3010,1
channel = 3

[State 3010, Fire Fade Away effect]
type = Explod
trigger1 = !Time
anim = 3014
sprPriority = 3
posType = P1
pos = 10,-50
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 8.75

[State 3010, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0 && AnimElemTime(11) < 0
x = -0.390625

[State 3010, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3010, Orochinagi Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3015
ID = 3015
name = "Orochinagi Projectile"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3010, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX URA 108 SHIKI: OROCHINAGI>=
;Startup
[StateDef 3050]
type = S
physics = N
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)) && (NumExplod(90000210) || NumExplod(90000215)), 2, ifElse((NumExplod(90000220) || NumExplod(90000225)) && (NumExplod(90000200) || NumExplod(90000205)), 1, 0))

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

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
var(17) = 45

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
trigger1 = !Time
time = 43
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 24,-109
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3050, Width]
type = Width
trigger1 = !Time
edge = 30,0

[State 3050, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 730,1
channel = 0

[State 3050, Voice (Kusanagi)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3000,10
channel = 0

[State 3050, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 3050,0
channel = 1

[State 3050, Fire effect]
type = Explod
trigger1 = !Time
ID = 3055
anim = 3055
bindTime = -1
removeTime = 43
sprPriority = 1
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Fire effect fade in]
type = ModifyExplod
trigger1 = 1
ID = 3055
trans = AddAlpha
alpha = ceil(2.97 * (Time)), 256

[State 3050, End]
type = ChangeState
triggerAll = !AnimTime && !AILevel
trigger1 = !var(10) && command = "holdx" && command = "holdy"
trigger2 = var(10) = 1 && command = "holdx" && command = "holdz"
trigger3 = var(10) = 2 && command = "holdy" && command = "holdz"
value = 3051

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 3060


;Holding
[StateDef 3051]
type = S
anim = 3051
physics = N
moveType = A
velSet = 0,0

[State 3051, ModifyExplod]
type = ModifyExplod
trigger1 = !Time
ID = 3055
removeTime = 133

[State 3051, Fire effect fade in]
type = ModifyExplod
trigger1 = 1
ID = 3055
trans = AddAlpha
alpha = 128 + ceil(1.42 * (Time)), 256

[State 3051, Projectile Shield]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3056
ID = 3056
name = "Orochinagi Projectile Shield"
posType = P1
superMoveTime = 5
ownPal = 1

[State 3051, HitDef]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = AnimElem = 1 || AnimElem = 3 || AnimElem = 5 || AnimElem = 7 || AnimElem = 9 || AnimElem = 11 || AnimElem = 13 || AnimElem = 15
trigger2 = AnimElem = 17 || AnimElem = 19 || AnimElem = 21 || AnimElem = 23 || AnimElem = 25 || AnimElem = 27 || AnimElem = 29
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4.5,-7
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := ceil(P2Dist y - 64)
palFX.time = 35
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3051, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = HitPauseTime = 4
var(44) = 35
ignoreHitPause = 1

[State 3051, Flame Particles]
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
superMoveTime = 5
ownPal = 1
ignoreHitPause = 1

[State 3051, End]
type = ChangeState
trigger1 = Time = 90
trigger2 = !var(10) && command != "holdx" && command != "holdy"
trigger3 = var(10) = 1 && command != "holdx" && command != "holdz"
trigger4 = var(10) = 2 && command != "holdy" && command != "holdz"
value = 3060


;Attack
[StateDef 3060]
type = S
anim = 3060
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3060, RemoveExplod]
type = RemoveExplod
trigger1 = !Time & NumExplod(3055)
id = 3055

[State 3060, Voice]
type = PlaySnd
trigger1 = !Time
value = 3060,0
channel = 0

[State 3060, Voice (Kusanagi)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3010,10
channel = 0

[State 3060, Fire Fade Away Sound]
type = PlaySnd
trigger1 = !Time
value = 190,2
channel = 1

[State 3060, Orochinagi sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3010,1
channel = 3

[State 3060, Fire effect]
type = Explod
trigger1 = !Time
anim = 3014
sprPriority = 3
posType = P1
pos = 10,-50
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 8.75

[State 3060, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0 && AnimElemTime(11) < 0
x = -0.390625

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3060, Orochinagi Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 3015
ID = 3015
name = "MAX Orochinagi Projectile"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3060, Burning Kyo afterimage helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3060, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SAISHU KESSEN OUGI "MU-SHIKI">=
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
trigger1 = AnimElemTime(8) < 0
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
pos = 15,-62
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,1
channel = 0

[State 3100, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 191,1
channel = 1

[State 3100, Fire Fade Away Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 190,2
channel = 1

[State 3100, Fire Pillar Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3010,1
channel = 3

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
value = 1,2

[State 3100, Final Dokugami Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 192,1
channel = 1

[State 3100, Fire effect 1]
type = Explod
trigger1 = !Time
ID = 20190
anim = 3005
removeTime = 10
sprPriority = 3
posType = P1
pos = 29,-84
superMoveTime = 255
scale = 0.25,0.25
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, ModifyExplod 1]
type = ModifyExplod
trigger1 = Time = 1
ID = 20190
scale = 0.375,0.375

[State 3100, ModifyExplod 2]
type = ModifyExplod
trigger1 = Time = 2
ID = 20190
scale = 0.5,0.5

[State 3100, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 20190
posType = P1
pos = 20,-103

[State 3100, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 20190
posType = P1
pos = 7,-112

[State 3100, Fire Fade Away effect]
type = Explod
trigger1 = AnimElem = 4
anim = 10190
sprPriority = 3
posType = P1
pos = 10,-50
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Yami Barai Startup effect]
type = Explod
trigger1 = AnimElem = 10
anim = 3104
bindTime = -1
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Fire Pillar]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 3105
ID = 3105
name = "Mu-Shiki Fire Pillar"
posType = P1
pos = 50,0
superMoveTime = 255
size.xScale = 0.375
size.yScale = 0.5
ownPal = 1

[State 3100, Mu-Shiki effect]
type = Explod
trigger1 = AnimElem = 21
anim = 3106
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3100, Dokugami effect]
type = Explod
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
anim = 31105
removeTime = 3
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3100, Final Dokugami effect]
type = Explod
trigger1 = AnimElem = 41
anim = 31105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3100, ScreenBound]
type = ScreenBound
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(38) < 0
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
trigger2 = AnimElem = 26
trigger3 = AnimElem = 32
trigger4 = AnimElem = 38
x = 10

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
trigger2 = AnimElem = 27
trigger3 = AnimElem = 33
trigger4 = AnimElem = 39
x = 27

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 28
trigger3 = AnimElem = 34
trigger4 = AnimElem = 40
x = 15

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
trigger4 = AnimElem = 41
x = 11

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 24
trigger2 = AnimElem = 30
trigger3 = AnimElem = 36
trigger4 = AnimElem = 42
x = 1

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 25
trigger2 = AnimElem = 31
trigger3 = AnimElem = 37
x = -64

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 45
x = 11

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 46
x = 15

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 47
x = 3

[State 3100, Hits 1-3 (High)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 24 || AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Hits 1-3 (Low)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 30
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 48
ignoreHitPause = 1

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

[State 3100, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 42
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 48,48
guard.pauseTime = 48,48
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -6.25,-5.78125
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 74
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 48
envShake.ampl = 6
envShake.freq = 120

[State 3100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 74
ignoreHitPause = 1
persistent = 0

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(43) >= 0
moveType = I

[State 3100, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 3100, Chouhatsu]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(42) >= 0
trigger1 = !AILevel
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel && MoveHit && Random < 500 && !AnimTime
var(14) = 3101

[State 3100, Followup]
type = ChangeState
trigger1 = var(14) = [3000,3999]
trigger1 = NumTarget(3100) && MoveHit
trigger1 = !AnimTime
value = var(14)

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Chouhatsu
[StateDef 3101]
type = S
anim = 3101
physics = N
moveType = I
velSet = 0,0

[State 3101, Voice]
type = PlaySnd
trigger1 = !Time
value = 3101,0
channel = 0

[State 3101, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 191,1
channel = 1

[State 3101, Fire Fade Away Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 182,2
channel = 1

[State 3101, Fire effect 1]
type = Explod
trigger1 = !Time
ID = 10182
anim = 3005
removeTime = 58
sprPriority = 3
posType = P1
pos = 18,-70
scale = 0.25,0.25
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, ModifyExplod 1]
type = ModifyExplod
trigger1 = Time = 1
ID = 10182
scale = 0.375,0.375

[State 3101, ModifyExplod 2]
type = ModifyExplod
trigger1 = Time = 2
ID = 10182
scale = 0.5,0.5

[State 3101, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 10182
posType = P1
pos = 31,-86

[State 3101, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 10182
posType = P1
pos = 16,-93

[State 3101, ModifyExplod 5]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 10182
posType = P1
pos = 6,-92

[State 3101, Fire effect 2]
type = Explod
trigger1 = AnimElem = 5
anim = 10182
sprPriority = 3
posType = P1
pos = 6,-92
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX SAISHU KESSEN OUGI "MU-SHIKI">=
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
var(17) = 45

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
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 15,-62
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,1
channel = 0

[State 3150, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 191,1
channel = 1

[State 3150, Fire Fade Away Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 190,2
channel = 1

[State 3150, Fire Pillar Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3010,1
channel = 3

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
value = 1,2

[State 3150, Final Dokugami Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 192,1
channel = 1

[State 3150, Fire effect 1]
type = Explod
trigger1 = !Time
ID = 20190
anim = 3005
removeTime = 10
sprPriority = 3
posType = P1
pos = 29,-84
superMoveTime = 255
scale = 0.25,0.25
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, ModifyExplod 1]
type = ModifyExplod
trigger1 = Time = 1
ID = 20190
scale = 0.375,0.375

[State 3150, ModifyExplod 2]
type = ModifyExplod
trigger1 = Time = 2
ID = 20190
scale = 0.5,0.5

[State 3150, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 20190
posType = P1
pos = 20,-103

[State 3150, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 20190
posType = P1
pos = 7,-112

[State 3150, Fire Fade Away effect]
type = Explod
trigger1 = AnimElem = 4
anim = 10190
sprPriority = 3
posType = P1
pos = 10,-50
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Yami Barai Startup effect]
type = Explod
trigger1 = AnimElem = 10
anim = 3104
bindTime = -1
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Fire Pillar]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 3105
ID = 3105
name = "Mu-Shiki Fire Pillar"
posType = P1
pos = 50,0
superMoveTime = 255
size.xScale = 0.375
size.yScale = 0.5
ownPal = 1

[State 3150, Mu-Shiki effect]
type = Explod
trigger1 = AnimElem = 21
anim = 3106
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3150, Dokugami effect]
type = Explod
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
anim = 31105
removeTime = 3
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3150, Final Dokugami effect]
type = Explod
trigger1 = AnimElem = 41
anim = 31105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3150, ScreenBound]
type = ScreenBound
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(38) < 0
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
trigger2 = AnimElem = 26
trigger3 = AnimElem = 32
trigger4 = AnimElem = 38
x = 10

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
trigger2 = AnimElem = 27
trigger3 = AnimElem = 33
trigger4 = AnimElem = 39
x = 27

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 28
trigger3 = AnimElem = 34
trigger4 = AnimElem = 40
x = 15

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 29
trigger3 = AnimElem = 35
trigger4 = AnimElem = 41
x = 11

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 24
trigger2 = AnimElem = 30
trigger3 = AnimElem = 36
trigger4 = AnimElem = 42
x = 1

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 25
trigger2 = AnimElem = 31
trigger3 = AnimElem = 37
x = -64

[State 3150, Hits 1-3 (High)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 24 || AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Hits 1-3 (Low)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 30
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 48
ignoreHitPause = 1

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

[State 3150, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 42
ID = 3150
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5.26,0
ground.cornerPush.velOff = 0
guard.velocity = -5.26
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 44
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 44
ignoreHitPause = 1
persistent = 0

[State 3150, Followup]
type = ChangeState
trigger1 = NumTarget(3150) && MoveHit
trigger1 = AnimElem = 45
value = 3160

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 45
x = 11

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 46
x = 15

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 47
x = 3

[State 3150, Burning Kyo afterimage helper 1]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3150, Burning Kyo afterimage helper 2]
type = Helper
trigger1 = AnimElem = 45
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(45) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 27
value = 1200,0
channel = 0

[State 3160, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
trigger3 = AnimElem = 14
value = 1,2

[State 3160, Final Aragami Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 19
value = 192,1
channel = 1

[State 3160, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 28
value = 1200,1
channel = 3

[State 3160, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 29
value = 40,0
channel = 4

[State 3160, Aragami effect]
type = Explod
trigger1 = AnimElem = 5
trigger2 = AnimElem = 10
trigger3 = AnimElem = 15
ID = 1005
anim = 1005
removeTime = 2
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3160, Final Aragami effect]
type = Explod
trigger1 = AnimElem = 20
ID = 1005
anim = 1005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3160, ScreenBound]
type = ScreenBound
trigger1 = AnimElemTime(17) < 0
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 3160, PosAdd]
type = PosAdd
trigger1 = !Time
x = 32

[State 3160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
trigger3 = AnimElem = 14
trigger4 = AnimElem = 19
x = 10

[State 3160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 10
trigger3 = AnimElem = 15
trigger4 = AnimElem = 20
x = 12

[State 3160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 11
trigger3 = AnimElem = 16
x = -22

[State 3160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 27
x = 40

[State 3160, PosAdd]
type = PosAdd
trigger1 = AnimElem = 28
x = 14

[State 3160, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 29
stateType = A
physics = N

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 30
x = 2.5
y = -11.25

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(30) > 0 && vel x >= 0
x = -0.1953125

[State 3160, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(30) > 0
y = 0.5859375

[State 3160, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 3160, Hits 1-3 (High)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, Hits 1-3 (Low)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,12
guard.pauseTime = 0,12
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
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(20) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 48
ignoreHitPause = 1

[State 3160, Flame Particles]
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

[State 3160, Final Aragami Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5.26,0
ground.cornerPush.velOff = 0
guard.velocity = -5.26
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 44
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(20) >= 0 && AnimElemTime(28) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 44
ignoreHitPause = 1
persistent = 0

[State 3160, Ground Oniyaki Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 28
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 34), var(36) := -74
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(28) >= 0 && AnimElemTime(29) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 52
ignoreHitPause = 1
persistent = 0

[State 3160, Air Oniyaki Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 29
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 10
ground.slideTime = 10
guard.hitTime = 10
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(29) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 54
ignoreHitPause = 1
persistent = 0

[State 3160, Burning Kyo afterimage helper]
type = Helper
trigger1 = AnimElem = 34
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3160, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(34) >= 0
moveType = I

[State 3160, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161


;Landing
[StateDef 3161]
type = S
anim = 3161
physics = N
moveType = I
velSet = 0,0

[State 3161, PosSet]
type = PosSet
trigger1 = 1
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
channel = 1

[State 3161, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<524 SHIKI: KAMUKURA>=
[StateDef 3200]
type = S
physics = N
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
trigger1 = Time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

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
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 3, -71
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3200,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3200,1
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 1

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 && !var(37)
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 3210

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 3200, Burning Kyo afterimage helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Connected
[Statedef 3210]
type = S
physics = N
moveType = A
anim = ifElse(var(40) = 2, 3211, 3210)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3210, SuperPause]
type = SuperPause
trigger1 = !Time
time = 0
p2DefMul = 1
anim = -1
darken = 0

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = ifElse(var(40) = 2, 3216, 3215)

[State 3210, Width]
type = Width
trigger1 = 1
edge = 64,0

[State 3210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(2) >= 0 && AnimElemTime(8) < 14
pos = 16,0

[State 3210, TargetBind 2]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(8) >= 14
pos = 32,0

[State 3210, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElemTime(6) = 3
trigger3 = AnimElemTime(6) = 6
value = 1520,1
channel = 2

[State 3210, Explosion effect 1]
type = Explod
trigger1 = AnimElem = 6
anim = 1535
sprPriority = 3
posType = P1
pos = 29,-80
scale = 0.525,0.525
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3210, Explosion effect 2]
type = Explod
trigger1 = AnimElemTime(6) = 3
anim = 1535
sprPriority = 4
posType = P1
pos = 60, -108
scale = 0.525,0.525
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3210, Explosion effect 3]
type = Explod
trigger1 = AnimElemTime(6) = 6
anim = 1535
sprPriority = 5
posType = P1
pos = 47, -37
scale = 0.525,0.525
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3210, Flame Particle Timer Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 6
var(44) = 37
ignoreHitPause = 1
persistent = 0

[State 3210, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = NumTarget && AnimElem = 6
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3210, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 6
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
kill = 0

[State 3210, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 3210, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 6
value = 1

[State 3210, HitAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(13) = 1

[State 3210, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(var(40) = 2, 3221, 3220)


;Attack
[StateDef 3220]
type = S
anim = 3220
physics = N
moveType = A
velSet = 0,0

[State 3220, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3220, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3220,0
channel = 0

[State 3220, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 42
value = 3220,1
channel = 0

[State 3220, Dokugami flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 31
value = 192,1
channel = 1

[State 3220, Tsumi Yomi flame sound]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 36
value = 192,1
channel = 3

[State 3220, Aragami flame sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 192,1
channel = 4

[State 3220, Konokizu flame sound]
type = PlaySnd
trigger1 = AnimElem = 23
value = 192,1
channel = 5

[State 3220, Batsu Yomi sound]
type = PlaySnd
trigger1 = AnimElem = 42
value = 192,1
channel = 6

[State 3220, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 42
value = 40,0
channel = 7

[State 3220, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1200,1
channel = 1

[State 3220, Dokugami effect]
type = Explod
trigger1 = AnimElem = 5
trigger2 = AnimElem = 31
ID = 1105
anim = 1105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 8
trigger2 = AnimElem = 34
id = 1105
ignoreHitPause = 1

[State 3220, Tsumi Yomi effect]
type = Explod
trigger1 = AnimElem = 10
trigger2 = AnimElem = 36
ID = 1115
anim = 13220
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 13
trigger2 = AnimElem = 39
id = 1115
ignoreHitPause = 1

[State 3220, Aragami effect]
type = Explod
trigger1 = AnimElem = 17
ID = 1005
anim = 1005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 21
id = 1005

[State 3220, Konokizu effect]
type = Explod
trigger1 = AnimElem = 23
ID = 1015
anim = 1015
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 27
id = 1015
ignoreHitPause = 1

[State 3220, Batsu Yomi effect]
type = Explod
trigger1 = AnimElem = 42
ID = 1125
anim = 1125
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 28
x = 10

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 29
x = 11

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 30
x = 15

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 31
x = 11

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 32
x = 1

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 34
x = 22

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 35
x = 19

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 36
x = 12

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 16
x = 10

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 17
x = 12

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
x = 6

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 22
x = 24

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 23
x = 21

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 24
x = 8

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 39
x = 16

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 40
x = 10

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 42
x = 4

[State 3220, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 42
stateType = A
physics = N

[State 3220, Dust Helper]
type = Helper
trigger1 = AnimElem = 42
helperType = Normal
stateNo = 8100
ID = 8100
name = "Batsu Yomi Dust"
posType = P1
ownPal = 1

[State 3220, VelSet]
type = VelSet
trigger1 = AnimElemTime(42) >= 0
x = ifElse(AnimElemTime(47) >= 0, 0, (4.6041107177734375 * exp((-0.082489343609893257228599306753264) * (AnimElemTime(42)))))

[State 3220, VelSet]
type = VelSet
trigger1 = AnimElem = 42
y = -7

[State 3220, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(42) > 0
y = 0.42578125

[State 3220, VarSet]
type = VarSet
trigger1 = AnimElem = 47
var(10) = -ceil(pos y) - 31

[State 3220, PosAdd]
type = PosAdd
trigger1 = AnimElem = 47
y = -15

[State 3220, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 47
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
pos = 0, var(10)
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 3220, Dokugami Hits]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 6 || AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3220, Tsumi Yomi Hits]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 11 || AnimElem = 37
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -78
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3220, Aragami Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3220, Konokizu Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -98
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3220, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(44) < 0
trigger1 = !(Target, HitShakeOver)
trigger1 = HitPauseTime = 6
var(44) = 30
ignoreHitPause = 1

[State 3220, Flame Particles]
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

[State 3220, Batsu Yomi Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 44
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -2,-13
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2,-13
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 64
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3220, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(44) >= 0 && AnimElemTime(47) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 64
ignoreHitPause = 1
persistent = 0

[State 3220, Oniyaki Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 47
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7,-12
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7,-12
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 90
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3220, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(47) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 90
ignoreHitPause = 1
persistent = 0

[State 3220, Burning Kyo afterimage helper]
type = Helper
trigger1 = AnimElem = 52
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
ownPal = 1

[State 3220, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(48) >= 0
moveType = I

[State 3220, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161


;Attack (EX Kyo)
[StateDef 3221]
type = S
anim = 3221
physics = N
moveType = A
velSet = 0,0

[State 3221, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3221, Width]
type = Width
trigger1 = AnimElemTime(37) < 0
player = 16,0
ignoreHitPause = 1

[State 3221, Voice]
type = PlaySnd
trigger1 = !Time
value = 3220,0
channel = 0

[State 3221, Dokugami flame sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 16
value = 192,1
channel = 1

[State 3221, Aragami flame sound]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 21
value = 192,1
channel = 3

[State 3221, Konokizu flame sound]
type = PlaySnd
trigger1 = AnimElem = 27
value = 192,1
channel = 4

[State 3221, Yanosabi flame sound]
type = PlaySnd
trigger1 = AnimElem = 34
value = 192,1
channel = 5

[State 3221, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 40
value = 1,5
channel = 1

[State 3221, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 40,0
channel = 3

[State 3221, Woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 46
value = 1,5
channel = 4

[State 3221, Dokugami effect]
type = Explod
trigger1 = AnimElem = 5
trigger2 = AnimElem = 16
ID = 1105
anim = 1105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3221, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 7
trigger2 = AnimElem = 18
id = 1105
ignoreHitPause = 1

[State 3221, Aragami effect]
type = Explod
trigger1 = AnimElem = 11
trigger2 = AnimElem = 22
ID = 1005
anim = 1005
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3221, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 12
trigger2 = AnimElem = 25
id = 1005
ignoreHitPause = 1

[State 3221, Konokizu effect]
type = Explod
trigger1 = AnimElem = 27
ID = 1015
anim = 1015
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3221, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 31
id = 1015
ignoreHitPause = 1

[State 3221, Yanosabi effect]
type = Explod
trigger1 = AnimElem = 34
ID = 1025
anim = 1025
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3221, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 37
id = 1025
ignoreHitPause = 1

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 13
x = 10

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 14
x = 11

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 15
x = 15

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 16
x = 11

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 17
x = 1

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 21
x = 10

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 22
x = 12

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 25
x = 6

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 26
x = 24

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 27
x = 21

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 28
x = 8

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
x = 29

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 32
x = 22

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 33
x = 4

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 34
x = 6

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 35
x = 5

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 38
x = 16

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 39
x = 4

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 40
x = 7

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 41
x = 16

[State 3221, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 41
stateType = A
physics = N

[State 3221, Dust Helper]
type = Helper
trigger1 = AnimElem = 41
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shiki: Kai Dust"
posType = P1
ownPal = 1

[State 3221, VelSet]
type = VelSet
trigger1 = AnimElem = 37
x = 1.75

[State 3221, VelSet]
type = VelSet
trigger1 = AnimElem = 41
x = 2.75
y = -3.5

[State 3221, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(41) > 0
y = 0.328125

[State 3221, PosAdd]
type = PosAdd
trigger1 = AnimElem = 41
x = 1.75

[State 3221, PosAdd]
type = PosAdd
trigger1 = vel y > 0
x = vel x
persistent = 0

[State 3221, Dokugami Hits]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 6 || AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,12
guard.pauseTime = 1,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Aragami Hits]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 11 || AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,12
guard.pauseTime = 1,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Konokizu Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 28
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,12
guard.pauseTime = 1,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -98
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Yanosabi Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 35
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 1,12
guard.pauseTime = 1,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -6.25,-5.78125
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -57
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) < 0
trigger1 = !(Target, HitShakeOver)
trigger1 = HitPauseTime = 1
var(44) = 30
ignoreHitPause = 1

[State 3221, Flame Particles]
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

[State 3221, Shiki: Kai Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 42
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5, -8.125
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5, -8.125
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -98
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(42) >= 0 && AnimElemTime(47) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 45
ignoreHitPause = 1
persistent = 0

[State 3221, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(42) >= 0 && AnimElemTime(43) <= 0
trigger1 = HitPauseTime <= 10
value = 3221
elem = 43
ignoreHitPause = 1

[State 3221, Shiki: Kai Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 47
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -2.25, -9.975
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.25, -8.975
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -99
palFX.time = 57
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3221, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(47) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 57
ignoreHitPause = 1
persistent = 0

[State 3221, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(47) >= 0 && AnimElemTime(48) <= 0
trigger1 = HitPauseTime <= 10
value = 3221
elem = 48
ignoreHitPause = 1

[State 3221, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3222


;Finish
[StateDef 3222]
type = S
anim = 3222
physics = N
moveType = I
velSet = 0,0
hitCountPersist = 1

[State 3222, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3222, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3222, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3222, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3220,1
channel = 0

[State 3222, Orochinagi sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3010,1
channel = 3

[State 3222, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = 8.75

[State 3222, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(10) > 0 && AnimElemTime(13) < 0
x = -0.390625

[State 3222, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 0

[State 3222, Orochinagi Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3015
ID = 3225
name = "Orochinagi Projectile"
posType = P1
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3222, Burning Kyo afterimage helper]
type = Helper
trigger1 = AnimElem = 16
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
ownPal = 1

[State 3222, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<KAMUKURA (TARGET)>==
;Normal Kyo
[StateDef 3215]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3215, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3215

[State 3215, StateTypeSet]
type = StateTypeSet
trigger1 = !AnimTime && Anim = 3215
stateType = S

[State 3215, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 3215
value = 5015

[State 3215, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3215, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3215, PalFX]
type = PalFX
trigger1 = AnimElemTime(2) = -1 && Anim = 3215
time = 38
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3215, Safety]
type = SelfState
trigger1 = Time > 100
value = 0
ctrl = 1


;EX Kyo
[StateDef 3216]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3216, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3216

[State 3216, StateTypeSet]
type = StateTypeSet
trigger1 = !AnimTime && Anim = 3216
stateType = S

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 3216
value = 5015

[State 3216, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 3216, PalFX]
type = PalFX
trigger1 = AnimElemTime(2) = -1 && Anim = 3216
time = 38
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 3216, Safety]
type = SelfState
trigger1 = Time > 100
value = 0
ctrl = 1



;====<1999 SHIKI: KIRI HOMURA>=
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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

[State 3300, Corner Push]
type = VarSet
trigger1 = Time = 3
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
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 59,-89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 25
value = 3300,0
channel = 0

[State 3300, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,2
channel = 1

[State 3300, Woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 18
value = 1,2
channel = 3

[State 3300, Woosh sound 3]
type = PlaySnd
trigger1 = AnimElem = 26
value = 1,2
channel = 4

[State 3300, Woosh sound 4]
type = PlaySnd
trigger1 = AnimElem = 34
value = 1,2
channel = 3

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElemTime(7) = 0
trigger3 = AnimElemTime(7) = 1
trigger4 = AnimElem = 17
trigger5 = AnimElem = 26
trigger6 = AnimElem = 27
trigger7 = AnimElemtime(31) = 0
trigger8 = AnimElemtime(31) = 1
trigger9 = AnimElemtime(31) = 2
trigger10 = AnimElemtime(31) = 3
trigger11 = AnimElemtime(31) = 4
trigger12 = AnimElemtime(31) = 5
x = 8

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElemTime(8) = 0
trigger2 = AnimElemTime(8) = 1
trigger3 = AnimElemTime(9) = 0
x = 4

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 15
x = 10

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 12

[State 3300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
trigger2 = AnimElem = 19
trigger3 = AnimElem = 21
trigger4 = AnimElem = 22
trigger5 = AnimElem = 29
trigger6 = AnimElem = 30
x = 16

[State 3300, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 19
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 27
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -0.75, -9.525
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.75, -9.525
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 36
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 48,48
guard.pauseTime = 48,48
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, -12.125
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -12.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -20), var(36) := -98
palFX.time = 99
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(36) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 99
ignoreHitPause = 1
persistent = 0

[State 3300, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(36) >= 0
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

[State 3300, Explosion Sound]
type = PlaySnd
trigger1 = MoveHit = 1 && HitPauseTime = 48
trigger2 = MoveHit = 1 && HitPauseTime = 45
trigger3 = MoveHit = 1 && HitPauseTime = 42
value = 1520,1
channel = 1
ignoreHitPause = 1

[State 3300, Explosion effect 1]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 48
anim = 1535
sprPriority = 3
posType = P1
pos = -20,-98
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3300, Explosion effect 2]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 45
anim = 1535
sprPriority = 3
posType = P1
pos = 10,-117
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3300, Explosion effect 2]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 42
anim = 1535
sprPriority = 3
posType = P1
pos = -2, -145
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(38) >= 0
moveType = I

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX 1999 SHIKI: KIRI HOMURA>=
[StateDef 3350]
type = S
physics = N
moveType = A
anim = 3350
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3350, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3350, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3350, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3350, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3350, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3350, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 59,-89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3350, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3350, Voice]
type = PlaySnd
trigger1 = AnimElem = 38
value = 3300,0
channel = 0

[State 3350, Woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,2
channel = 1

[State 3350, Woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,2
channel = 3

[State 3350, Woosh sound 3]
type = PlaySnd
trigger1 = AnimElem = 22
value = 1,2
channel = 4

[State 3350, Woosh sound 4]
type = PlaySnd
trigger1 = AnimElem = 31
value = 1,2
channel = 5

[State 3350, Woosh sound 5]
type = PlaySnd
trigger1 = AnimElem = 39
value = 1,2
channel = 6

[State 3350, Woosh sound 6]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1,2
channel = 7

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 10

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = 27

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 15

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 11

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
x = 1

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 13
x = 22

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 14
x = 19

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 15
x = 12

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
x = 8

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 19
trigger2 = AnimElemTime(20) = 0
trigger3 = AnimElemTime(20) = 1
trigger4 = AnimElem = 30
trigger5 = AnimElem = 39
trigger6 = AnimElem = 40
trigger7 = AnimElemtime(44) = 0
trigger8 = AnimElemtime(44) = 1
trigger9 = AnimElemtime(44) = 2
trigger10 = AnimElemtime(44) = 3
trigger11 = AnimElemtime(44) = 4
trigger12 = AnimElemtime(44) = 5
x = 8

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElemTime(21) = 0
trigger2 = AnimElemTime(21) = 1
trigger3 = AnimElemTime(22) = 0
x = 4

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 22
trigger2 = AnimElem = 28
x = 10

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 23
x = 12

[State 3350, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
trigger2 = AnimElem = 32
trigger3 = AnimElem = 34
trigger4 = AnimElem = 35
trigger5 = AnimElem = 42
trigger6 = AnimElem = 43
x = 16

[State 3350, Hit sound reset]
type = VarSet
trigger1 = AnimElem = 13
var(31) = -1

[State 3350, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(11) < 0
trigger2 = AnimElemTime(13) >= 0 && AnimElemTime(16) < 0
reversal.attr = SCA, NA, SA, HA
pauseTime = 12,18
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 31), (var(36) := -68)
hitSound = S3,0
numHits = 0

[State 3350, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 11
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 16
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
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
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 40
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -0.75, -9.525
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.75, -9.525
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 44), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Hit 6]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 49
ID = 3350
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 48,48
guard.pauseTime = 48,48
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2, -12.125
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2, -12.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -20), var(36) := -98
palFX.time = 99
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(49) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 99
ignoreHitPause = 1
persistent = 0

[State 3350, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(49) >= 0
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

[State 3350, Explosion Sound]
type = PlaySnd
trigger1 = MoveHit = 1 && HitPauseTime = 48
trigger2 = MoveHit = 1 && HitPauseTime = 45
trigger3 = MoveHit = 1 && HitPauseTime = 42
value = 1520,1
channel = 1
ignoreHitPause = 1

[State 3350, Explosion effect 1]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 48
anim = 1535
sprPriority = 3
posType = P1
pos = -20,-98
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3350, Explosion effect 2]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 45
anim = 1535
sprPriority = 3
posType = P1
pos = 10,-117
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3350, Explosion effect 2]
type = Explod
trigger1 = MoveHit = 1 && HitPauseTime = 42
anim = 1535
sprPriority = 3
posType = P1
pos = -2, -145
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3350, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(51) >= 0
moveType = I

[State 3350, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SAISHU KESSEN OUGI "ZERO SHIKI">=
[StateDef 3400]
type = S
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3400, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3400, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3400, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3400, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(11) < 0
time = 1
value = SCA

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 3, -71
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = !Time
value = 3400,0
channel = 0

[State 3400, Fire Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 191,1
channel = 1

[State 3400, Fire Fade Away Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 190,2
channel = 1

[State 3400, Fire Pillar Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3010,1
channel = 3

[State 3400, Dokugami Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 24
value = 192,1
channel = 1

[State 3400, Tsumi Yomi Flame sound]
type = PlaySnd
trigger1 = AnimElem = 31
value = 192,1
channel = 3

[State 3400, Batsu Yomi Flame sound]
type = PlaySnd
trigger1 = AnimElem = 38
value = 192,1
channel = 4

[State 3400, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 38
value = 40,0
channel = 5

[State 3400, Fire effect]
type = Explod
trigger1 = !Time
ID = 20190
anim = 3005
removeTime = 10
sprPriority = 3
posType = P1
pos = 29,-84
superMoveTime = 255
scale = 0.25,0.25
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3400, ModifyExplod 1]
type = ModifyExplod
trigger1 = Time = 1
ID = 20190
scale = 0.375,0.375

[State 3400, ModifyExplod 2]
type = ModifyExplod
trigger1 = Time = 2
ID = 20190
scale = 0.5,0.5

[State 3400, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 20190
posType = P1
pos = 20,-103

[State 3400, ModifyExplod 4]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 20190
posType = P1
pos = 7,-112

[State 3400, Fire Fade Away effect]
type = Explod
trigger1 = AnimElem = 4
anim = 10190
sprPriority = 3
posType = P1
pos = 10,-50
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3400, Yami Barai Startup effect]
type = Explod
trigger1 = AnimElem = 10
anim = 3104
bindTime = -1
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3400, Fire Pillar]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 3105
ID = 3105
name = "Mu-Shiki Fire Pillar"
posType = P1
pos = 50,0
superMoveTime = 255
size.xScale = 0.375
size.yScale = 0.5
ownPal = 1

[State 3400, Dokugami effect]
type = Explod
trigger1 = AnimElem = 24
ID = 31105
anim = 31105
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3400, Tsumi Yomi effect]
type = Explod
trigger1 = AnimElem = 31
ID = 1115
anim = 1115
bindTime = 5
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3400, Batsu Yomi effect]
type = Explod
trigger1 = AnimElem = 38
ID = 1125
anim = 1125
bindTime = 9
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
x = 10

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 22
x = 27

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 23
x = 15

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 24
x = 11

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 24
x = 1

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 29
x = 22

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 30
x = 19

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
x = 12

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 34
x = 16

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 35
x = 10

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 38
x = 4

[State 3400, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 38
stateType = A
physics = N

[State 3400, Dust Helper]
type = Helper
trigger1 = AnimElem = 38
helperType = Normal
stateNo = 8100
ID = 8100
name = "Batsu Yomi Dust"
posType = P1
ownPal = 1

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElemTime(38) >= 0
x = ifElse(vel y > 0, 0, (4.270782470703125 * exp((-0.15764027276004193960373870818271) * (AnimElemTime(38)))))

[State 3400, VelSet]
type = VelSet
trigger1 = AnimElem = 38
y = -8

[State 3400, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(38) > 0
y = 0.42578125

[State 3400, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 43
value = 1200,1
channel = 1

[State 3400, VarSet]
type = VarSet
trigger1 = AnimElem = 43
var(10) = -ceil(pos y) - 31

[State 3400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 43
y = -15

[State 3400, Oniyaki fire]
type = Helper
trigger1 = AnimElem = 43
helperType = Normal
stateNo = 1205
ID = 1205
name = "Oniyaki fire"
posType = P1
pos = 0, var(10)
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 0

[State 3400, Dokugami Afterimages]
type = Helper
trigger1 = AnimElem = 19
trigger2 = AnimElemTime(19) = 5
trigger3 = AnimElemTime(19) = 10
helperType = Normal
stateNo = 3405
ID = ifElse(AnimElemTime(19) = 10, 33405, ifElse(AnimElemTime(19) = 5, 23405, 13405))
name = "Dokugami Afterimage"
posType = P1
size.xScale = const(size.xscale)
size.yScale = const(size.yscale)
ownPal = 1

[State 3400, Tsumi Yomi Afterimages]
type = Helper
trigger1 = AnimElem = 28
trigger2 = AnimElemTime(28) = 5
trigger3 = AnimElemTime(28) = 10
helperType = Normal
stateNo = 3406
ID = ifElse(AnimElemTime(28) = 10, 33406, ifElse(AnimElemTime(28) = 5, 23406, 13406))
name = "Tsumi Yomi Afterimage"
posType = P1
size.xScale = const(size.xscale)
size.yScale = const(size.yscale)
ownPal = 1

[State 3400, Batsu Yomi Afterimages]
type = Helper
trigger1 = AnimElem = 36
trigger2 = AnimElemTime(36) = 5
trigger3 = AnimElemTime(36) = 10
helperType = Normal
stateNo = 3407
ID = ifElse(AnimElemTime(36) = 10, 33407, ifElse(AnimElemTime(36) = 5, 23407, 13407))
name = "Batsu Yomi Afterimage"
posType = P1
size.xScale = const(size.xscale)
size.yScale = const(size.yscale)
ownPal = 1

[State 3400, Dokugami Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -71
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Tsumi Yomi Hits]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -78
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(38) < 0
trigger1 = !(Target, HitShakeOver)
trigger1 = HitPauseTime = 12
var(44) = 30
ignoreHitPause = 1

[State 3400, Flame Particles]
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

[State 3400, Batsu Yomi Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 38
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -2,-13
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2,-13
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 30), var(36) := -106
palFX.time = 66
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(38) >= 0 && AnimElemTime(43) < 0
trigger1 = !(Target, HitShakeOver)
var(44) = 66
ignoreHitPause = 1
persistent = 0

[State 3400, Oniyaki Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 43
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 16,16
guard.pauseTime = 16,16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7,-12
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7,-12
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 35), var(36) := -105
palFX.time = 73
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3400, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(43) >= 0
trigger1 = !(Target, HitShakeOver)
var(44) = 73
ignoreHitPause = 1
persistent = 0

[State 3400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(44) >= 0
moveType = I

[State 3400, Burning Kyo afterimage helper 1]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3400, Burning Kyo afterimage helper 2]
type = Helper
trigger1 = AnimElem = 48
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3400, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161



;====<182 SHIKI>=
;Startup
[StateDef 3500]
type = S
physics = N
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 43
value = SCA

[State 3500, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -30,-69
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice]
type = PlaySnd
trigger1 = !Time
value = 3500,0
channel = 0

[State 3500, Fire Startup Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 3501,0
channel = 1

[State 3500, Fire aura]
type = Explod
trigger1 = !AnimTime
ID = 3505
anim = 3505
bindTime = -1
removeTime = 135
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3500, End]
type = ChangeState
triggerAll = !AnimTime && !AILevel
trigger1 = !var(10) && command = "holdx"
trigger2 = var(10) = 1 && command = "holdy"
trigger3 = var(10) = 2 && command = "holdz"
value = 3501

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 3510


;Holding
[StateDef 3501]
type = S
anim = 3501
physics = N
moveType = A
velSet = 0,0

[State 3501, VarAdd]
type = VarAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 33
var(10) = 10

[State 3501, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = (var(10) % 10 = 0) && command != "holdx"
trigger3 = (var(10) % 10 = 1) && command != "holdy"
trigger4 = (var(10) % 10 = 2) && command != "holdz"
value = 3510


;Attack
[StateDef 3510]
type = S
anim = 3510
physics = N
moveType = A
velSet = 0,0

[State 3510, RemoveExplod]
type = RemoveExplod
trigger1 = !Time & NumExplod(3505)
id = 3505

[State 3510, Voice]
type = PlaySnd
trigger1 = !Time
value = 3510,0
channel = 0

[State 3510, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 3510, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1200,1
channel = 3

[State 3510, Fire aura]
type = Explod
trigger1 = !Time
ID = 3515
anim = 3515
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3510, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
trigger5 = AnimElem = 10
trigger6 = AnimElem = 12
x = 8

[State 3510, PosAdd]
type = PosAdd
trigger1 = AnimElem = 13
x = 15

[State 3510, Dokugami effect]
type = Explod
trigger1 = AnimElem = 5
ID = 1105
anim = 1105
bindTime = 5
sprPriority = 3
posType = P1
pos = 32, -16
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3510, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
ID = 1105
posType = P1
pos = 24, -16

[State 3510, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 1105
posType = P1
pos = 32, -16

[State 3510, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3510, Spark XY]
type = Null
trigger1 = AnimElem = 5
trigger1 = var(35) := 60 || var(36) := -94
trigger2 = AnimElem = 6
trigger2 = var(35) := 52 || var(36) := -94
trigger3 = AnimElem = 7
trigger3 = var(35) := 89 || var(36) := -88
trigger4 = AnimElem = 8
trigger4 = var(35) := 81 || var(36) := -88

[State 3510, Uncharged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5 && var(10) < 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 142 < 7, 7, fvar(11) * 142)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -6.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 61
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3510, Semi-charged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5 && var(10) >= 10 && var(10) < 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 224 < 7, 7, fvar(11) * 224)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 65
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3510, Fully-charged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5 && var(10) >= 20
attr = S, HA
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 301 < 7, 7, fvar(11) * 301)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -9, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -9, -8.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 70
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3510, Explosion Sound]
type = PlaySnd
trigger1 = MoveHit = 1 && HitPauseTime = 32
trigger2 = MoveHit = 1 && HitPauseTime = 29
trigger3 = MoveHit = 1 && HitPauseTime = 26
value = 1520,1
channel = 1
ignoreHitPause = 1

[State 3510, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = ifElse(var(10) >= 20, 70, ifElse(var(10) >= 10, 65, 61))
ignoreHitPause = 1
persistent = 0

[State 3510, Flame Particles]
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

[State 3510, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3510, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MAX 182 SHIKI>=
;Startup
[StateDef 3550]
type = S
physics = N
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3550, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)) && (NumExplod(90000210) || NumExplod(90000215)), 2, ifElse((NumExplod(90000220) || NumExplod(90000225)) && (NumExplod(90000200) || NumExplod(90000205)), 1, 0))

[State 3550, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3550, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3550, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3550, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3550, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3550, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3550, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 43
value = SCA

[State 3550, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -30,-69
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3550, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3550, Voice]
type = PlaySnd
trigger1 = !Time
value = 3500,0
channel = 0

[State 3550, Fire Startup Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 3501,0
channel = 1

[State 3550, Fire aura]
type = Explod
trigger1 = !AnimTime
ID = 3505
anim = 3505
bindTime = -1
removeTime = 135
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3550, End]
type = ChangeState
triggerAll = !AnimTime && !AILevel
trigger1 = !var(10) && command = "holdx" && command = "holdy"
trigger2 = var(10) = 1 && command = "holdx" && command = "holdz"
trigger3 = var(10) = 2 && command = "holdy" && command = "holdz"
value = 3551

[State 3550, End]
type = ChangeState
trigger1 = !AnimTime
value = 3560


;Holding
[StateDef 3551]
type = S
anim = 3551
physics = N
moveType = A
velSet = 0,0

[State 3551, Orochinagi sound]
type = PlaySnd
trigger1 = !Time
value = 3010,1
channel = 3

[State 3551, Fire Pillar]
type = Explod
trigger1 = !Time
ID = 3555
anim = 3555
sprPriority = 3
posType = P1
pos = -14,0
facing = -1
superMoveTime = 255
scale = 0.3,0.3
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3551, VarAdd]
type = VarAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 21
var(10) = 10

[State 3551, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = (var(10) % 10 = 0) && command != "holdx" && command != "holdy"
trigger3 = (var(10) % 10 = 1) && command != "holdx" && command != "holdz"
trigger4 = (var(10) % 10 = 2) && command != "holdy" && command != "holdz"
value = 3560


;Attack
[StateDef 3560]
type = S
physics = N
moveType = A
velSet = 0,0

[State 3560, Orochinagi sound]
type = PlaySnd
triggerAll = !Time
trigger1 = Anim = 3551 && AnimElemTime(2) < 0
trigger2 = Anim != 3551
value = 3010,1
channel = 3

[State 3560, Fire Pillar]
type = Explod
triggerAll = !Time
trigger1 = Anim = 3551 && AnimElemTime(2) < 0
trigger2 = Anim != 3551
ID = 3555
anim = 3555
sprPriority = 3
posType = P1
facing = -1
superMoveTime = 255
scale = 0.3,0.3
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3560, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(PrevStateNo = 3551, 3561, 3560)

[State 3560, RemoveExplod]
type = RemoveExplod
trigger1 = !Time & NumExplod(3505)
id = 3505

[State 3560, Voice]
type = PlaySnd
trigger1 = !Time
value = 3510,0
channel = 0

[State 3560, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 3560, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1200,1
channel = 4

[State 3560, Fire aura]
type = Explod
trigger1 = !Time
ID = 3515
anim = 3515
sprPriority = 3
posType = P1
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3560, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 8
trigger3 = AnimElem = 9
trigger4 = AnimElem = 10
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
x = 8

[State 3560, PosAdd]
type = PosAdd
trigger1 = AnimElem = 14
x = 15

[State 3560, Dokugami effect]
type = Explod
trigger1 = AnimElem = 6
ID = 1105
anim = 1105
bindTime = 5
sprPriority = 3
posType = P1
pos = 32, -16
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3560, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
ID = 1105
posType = P1
pos = 24, -16

[State 3560, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 1105
posType = P1
pos = 32, -16

[State 3560, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3560, Spark XY]
type = Null
trigger1 = AnimElem = 6
trigger1 = var(35) := 60 || var(36) := -94
trigger2 = AnimElem = 7
trigger2 = var(35) := 52 || var(36) := -94
trigger3 = AnimElem = 8
trigger3 = var(35) := 89 || var(36) := -88
trigger4 = AnimElem = 9
trigger4 = var(35) := 81 || var(36) := -88

[State 3560, Uncharged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 && var(10) < 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 233 < 7, 7, fvar(11) * 233)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -6.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 61
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3560, Semi-charged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 && var(10) >= 10 && var(10) < 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 315 < 7, 7, fvar(11) * 315)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -7.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 65
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3560, Fully-charged Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6 && var(10) >= 20
attr = S, HA
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 392 < 7, 7, fvar(11) * 392)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 32,32
guard.pauseTime = 32,32
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -9, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -9, -8.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 70
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 32
envShake.ampl = 6
envShake.freq = 120

[State 3560, Explosion Sound]
type = PlaySnd
trigger1 = MoveHit = 1 && HitPauseTime = 32
trigger2 = MoveHit = 1 && HitPauseTime = 29
trigger3 = MoveHit = 1 && HitPauseTime = 26
value = 1520,1
channel = 1
ignoreHitPause = 1

[State 3560, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(44) = ifElse(var(10) >= 20, 70, ifElse(var(10) >= 10, 65, 61))
ignoreHitPause = 1
persistent = 0

[State 3560, Flame Particles]
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

[State 3560, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3560, Burning Kyo afterimage helper]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 13000
ID = 13000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 3560, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
