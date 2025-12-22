; _______________________________________
;| Adon by Trololo                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<JAGUAR REVOLVER>=
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
triggerall = anim = 3000
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
triggerall = anim = 3000
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
triggerall = anim = 3000
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
triggerall = anim = 3000
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 54

[State 3000, Super Cancel Flash]
type = PalFX
triggerall = anim = 3000
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, Button Detect (Normal)]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 185, 2, ifElse((p2Dist x > 119 && P2Dist x <= 185), 1, 0))

[State 3000, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
triggerall = anim = 3000
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 20,-65
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
triggerall = anim = 3000
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, JAGUAR!]
type = PlaySnd
triggerall = anim = 3000
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, REVOLVER!!!]
type = PlaySnd
triggerall = anim = 3000
trigger1 = AnimElem = 3
value = 3000,1
channel = 0

[State 3000, Alpha Scream 2]
type = PlaySnd
triggerall = anim = 3001
trigger1 = AnimElem = 4
value = 3000,3
channel = 0

[State 3000, Jumping Sound]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = AnimElem = 3
trigger2 = anim = 3001
trigger2 = AnimElem = 4
value = 40,0
channel = 1

[State 3000, Woosh Sound]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = AnimElem = 8
trigger2 = anim = 3001
trigger2 = AnimElem = 9
value = 1000,1
channel = 4

[State 3000, Dust Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = AnimElem = 3
trigger2 = anim = 3001
trigger2 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Kick Dust"
posType = P1
ownPal = 1

[State 3000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = AnimElemTime(3) >= 0
trigger2 = anim = 3001
trigger2 = AnimElemTime(4) >= 0
stateType = A
physics = N

[State 3000, VelSet]
type = VelSet
triggerall = anim = 3000
trigger1 = AnimElem = 3
x = Ifelse(var(10)=2,7,ifelse(var(10)=1,5,3))
y = -8

[State 3000,VelAdd]
type = VelAdd
triggerall = anim = 3000
trigger1 = AnimElem = 5,>= 0
y = 1.5

[State 3000, Jaguar Kick 1 FX]
type = Explod
triggerall = anim = 3000
trigger1 = AnimElem = 8
anim = 3010
sprPriority = 3
posType = P1
bindTime = 1
pos = -5,-25
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1300, HitDef 1]
type = HitDef
triggerall = anim = 3000
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 8
ID = 3000
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 2]
type = HitDef
triggerall = anim = 3000
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = AnimElem = 9
ID = 3000
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, Second Leap]
type = ChangeAnim
triggerall = anim = 3000 && Animelemtime(9) >= 0
trigger1 = pos y > -vel y
value = 3001

[State 3000, PosFreeze]
type = VelSet
trigger1 = anim = 3001
trigger1 = AnimElemTime(1)>=0 && AnimElemTime(4)<0
y = 0
x = 0

[State 3000, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = anim = 3001
trigger1 = !time
stateType = S
physics = N

[State 3000, Landing Dust Explod]
type = Explod
triggerall = anim = 3001
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Landing Sound]
type = PlaySnd
triggerall = anim = 3001
trigger1 = !Time
value = 52,0

[State 3000, VelSet]
type = VelSet
triggerall = anim = 3001
trigger1 = AnimElem = 4
x = 7
y = -4

[State 3000, VelAdd]
type = VelAdd
triggerall = anim = 3001
trigger1 = AnimElem = 5,> 0
y = .7

[State 3000, Jaguar Kick 2 FX]
type = Explod
triggerall = anim = 3001
trigger1 = AnimElem = 8
anim = 3011
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1300, Final Kick]
type = HitDef
triggerall = anim = 3001
trigger1 = !var(16) && (var(15) < 9 || var(20))
trigger1 = AnimElem = 10
ID = 3000
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
ground.velocity = -3,-8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -3,-8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
triggerall = anim = 3001
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 3000, End]
type = ChangeState
triggerall = anim = 3001 && Animelemtime(11) >= 0
trigger1 = pos y > -vel y
value = 3005

;Landing
[StateDef 3005]
type = S
physics = N
moveType = I
velSet = 0,0
anim = 3005

[State 3005, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3005, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3005, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3005, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<JAGUAR REVOLVER MAX>=
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
triggerall = anim = 3000
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
triggerall = anim = 3000
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
triggerall = anim = 3000
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
triggerall = anim = 3000
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 54

[State 3050, Super Cancel Flash]
type = PalFX
triggerall = anim = 3000
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, Button Detect (Normal)]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time && !AILevel
var(10) = ifElse(((command = "b" || command = "rlsb")&&(command = "c" || command = "rlsc")), 2, ifElse((command = "a" || command = "rlsa")&&(command = "c" || command = "rlsc"), 1, 0))

[State 3000, Button Detect (AI)]
type = VarSet
triggerall = anim = 3000
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 185, 2, ifElse((p2Dist x > 119 && P2Dist x <= 185), 1, 0))

[State 3050, NotHitBy]
type = NotHitBy
triggerall = anim = 3000
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
triggerall = anim = 3000
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = 20,-65
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
triggerall = anim = 3000
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, JAGUAR!]
type = PlaySnd
triggerall = anim = 3000
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, REVOLVER!!!]
type = PlaySnd
triggerall = anim = 3000
trigger1 = AnimElem = 3
value = 3000,1
channel = 0

[State 3000, Alpha Scream 2]
type = PlaySnd
triggerall = anim = 3001
trigger1 = AnimElem = 4
value = 3000,2
channel = 0

[State 3000, Alpha Scream 3]
type = PlaySnd
triggerall = anim = 3002
trigger1 = AnimElem = 4
value = 3000,3
channel = 0

[State 3050, Jumping Sound]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = AnimElem = 3
trigger2 = anim = 3001
trigger2 = AnimElem = 4
trigger3 = anim = 3002
trigger3 = AnimElem = 2
value = 40,0
channel = 1

[State 3050, Woosh Sound]
type = PlaySnd
trigger1 = anim = 3000
trigger1 = AnimElem = 8
trigger2 = anim = 3001
trigger2 = AnimElem = 9
trigger3 = anim = 3002
trigger3 = AnimElem = 7
value = 1000,1
channel = 4

[State 3050, Dust Helper]
type = Helper
trigger1 = anim = 3000
trigger1 = AnimElem = 3
trigger2 = anim = 3001
trigger2 = AnimElem = 4
trigger3 = anim = 3002
trigger3 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Kick Dust"
posType = P1
ownPal = 1

[State 3050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = anim = 3000
trigger1 = AnimElemTime(3) >= 0
trigger2 = anim = 3001
trigger2 = AnimElemTime(4) >= 0
trigger3 = anim = 3002
trigger3 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 3050, VelSet]
type = VelSet
triggerall = anim = 3000
trigger1 = AnimElem = 3
x = Ifelse(var(10)=2,7,ifelse(var(10)=1,5,3))
y = -8

[State 3050,VelAdd]
type = VelAdd
triggerall = anim = 3000
trigger1 = AnimElem = 5,>= 0
y = 1.5

[State 3050, Jaguar Kick 1 FX]
type = Explod
triggerall = anim = 3000
trigger1 = AnimElem = 8
anim = 3010
sprPriority = 3
posType = P1
bindTime = 1
pos = -5,-25
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, HitDef 1]
type = HitDef
triggerall = anim = 3000
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 8
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef 2]
type = HitDef
triggerall = anim = 3000
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = AnimElem = 9
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Second Leap]
type = ChangeAnim
triggerall = anim = 3000 && Animelemtime(9) >= 0
trigger1 = pos y > -vel y
value = 3001

[State 3050, PosFreeze]
type = VelSet
trigger1 = anim = 3001
trigger1 = AnimElemTime(1)>=0 && AnimElemTime(4)<0
y = 0
x = 0

[State 3050, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = anim = 3001
trigger1 = !time
stateType = S
physics = N

[State 3050, Landing Dust Explod]
type = Explod
triggerall = anim = 3001
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Landing Sound]
type = PlaySnd
triggerall = anim = 3001
trigger1 = !Time
value = 52,0

[State 3050, VelSet]
type = VelSet
triggerall = anim = 3001
trigger1 = AnimElem = 4
x = 7
y = -2

[State 3050, VelAdd]
type = VelAdd
triggerall = anim = 3001
trigger1 = AnimElem = 5,> 0
y = .4

[State 3050, Jaguar Kick 2 FX]
type = Explod
triggerall = anim = 3001
trigger1 = AnimElem = 8
anim = 3011
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, HitDef 3]
type = HitDef
triggerall = anim = 3001
trigger1 = !var(16) && (var(15) < 9 || var(20))
trigger1 = AnimElem = 9
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, HitDef 4]
type = HitDef
triggerall = anim = 3001
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = AnimElem = 10
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Second Leap]
type = ChangeAnim
triggerall = anim = 3001 && Animelemtime(11) >= 0
trigger1 = pos y > -vel y
value = 3002

[State 3050, PosFreeze]
type = VelSet
trigger1 = anim = 3002
trigger1 = AnimElemTime(1)>=0 && AnimElemTime(2)<0
y = 0
x = 0

[State 3050, StateTypeSet: Standing, Physics: None]
type = StateTypeSet
trigger1 = anim = 3002
trigger1 = !time
stateType = S
physics = N

[State 3050, Landing Dust Explod]
type = Explod
triggerall = anim = 3002
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Landing Sound]
type = PlaySnd
triggerall = anim = 3002
trigger1 = !Time
value = 52,0

[State 3050, VelSet]
type = VelSet
triggerall = anim = 3002
trigger1 = AnimElem = 2
x = 7
y = -2

[State 3050, VelAdd]
type = VelAdd
triggerall = anim = 3002
trigger1 = AnimElem = 3,> 0
y = .4

[State 3050, Jaguar Kick 3 FX]
type = Explod
triggerall = anim = 3002
trigger1 = AnimElem = 6
anim = 3011
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, HitDef 5]
type = HitDef
triggerall = anim = 3002
trigger1 = !var(16) && (var(15) < 11 || var(20))
trigger1 = AnimElem = 7
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 36
ground.slideTime = 36
guard.hitTime = 36
air.hitTime = 120
down.hitTime = 20
ground.velocity = -4.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 51), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Final Kick]
type = HitDef
triggerall = anim = 3002
trigger1 = !var(16) && (var(15) < 12 || var(20))
trigger1 = AnimElem = 8
ID = 3050
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
down.hitTime = 20
ground.velocity = -3,-8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -3,-8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 56), var(36) := -43
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
triggerall = anim = 3002
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3050, End]
type = ChangeState
triggerall = anim = 3002 && Animelemtime(9) >= 0
trigger1 = pos y > -vel y
value = 3005

;====<JAGUAR VARIED ASSAULT>=
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
var(17) = 40

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
trigger1 = AnimElemTime(4) < 0
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
pos = 17,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Left Hand Punch FX]
type = Explod
trigger1 = Animelem = 3
anim = 3105
sprPriority = 3
posType = P1
bindTime = 12
pos = 60,-80
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Right Hand Punch FX]
type = Explod
trigger1 = Animelemtime(5) = 2
anim = 3106
sprPriority = 3
posType = P1
bindTime = 12
pos = 50,-57
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Left Hand Punch FX]
type = Explod
trigger1 = Animelem = 9
anim = 3105
sprPriority = 3
posType = P1
bindTime = 12
pos = 60,-81
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Final FX]
type = Explod
trigger1 = Animelemtime(11) = 3
anim = 3107
sprPriority = 3
posType = P1
bindTime = 12
pos = 40,-66
scale = 0.125,0.125
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
[State 3100, Final FX]
type = Explod
trigger1 = Animelemtime(11) = 3
anim = 3107
sprPriority = 3
posType = P1
bindTime = 12
pos = 40,-66
scale = 0.125,0.125
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
vfacing = -1

[State 3100, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Voice 2]
type = Playsnd
trigger1 = AnimELem = 3
value = 3100, 1
channel = 0

[State 3100, Voice 3]
type = Playsnd
trigger1 = AnimELem = 11
value = 3100, 2
channel = 0

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 11
value = 1,2
ownpal = 1

[State 3100, VarSet]
type = VarSet
trigger1 = 1
var(10) = 0

[State 5150, 6]
type = VelMul
trigger1 = animelemtime(11)<0
x = .85

[State 3100,VelSet]
type = VelSet
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10
x = 5

[State 3100,VelSet]
type = VelSet
trigger1 = AnimElem = 6 || AnimElem = 9
x = 0

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 11
helperType = Normal
stateNo = 8100
ID = 8100
name = "J.V.A. Dust"
posType = P1
ownPal = 1

[State 3100, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = A

[State 3100, VelAdd: Final Kick]
type = VelAdd
trigger1 = AnimElem = 11
x = 4
y = -8.5

[State 3100, Gravity]
type = VelAdd
trigger1 = AnimElemTime(11) >= 0
y = .55

[State 3100, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 39 < 7, 7, fvar(11) * 39)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Final]
type = HitDef
trigger1 = !var(16) && var(15) < 11
trigger1 = AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 39 < 7, 7, fvar(11) * 39)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7,-3
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7,-3
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
moveType = I

[State 3100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101

;Landing
[StateDef 3101]
type = S
physics = N
moveType = I
velSet = 0,0
anim = 3101

[State 3101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX JAGUAR BARED ASSAULT>=
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

[State 0, VarSet]
type = VarSet
trigger1 = !time
var(10) = 0

[State 3150, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

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
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 17,-64
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Left Hand Punch FX]
type = Explod
trigger1 = Animelem = 3
anim = 3105
sprPriority = 3
posType = P1
bindTime = 12
pos = 60,-80
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Right Hand Punch FX]
type = Explod
trigger1 = Animelemtime(5) = 2
anim = 3106
sprPriority = 3
posType = P1
bindTime = 12
pos = 50,-57
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Left Hand Punch FX]
type = Explod
trigger1 = Animelem = 9
anim = 3106
sprPriority = 3
posType = P1
bindTime = 12
pos = 60,-60
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Right Hand Punch FX]
type = Explod
trigger1 = Animelemtime(11) = 2
anim = 3105
ID = 3151
sprPriority = 3
posType = P1
bindTime = 12
pos = 50,-80
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Left Hand Punch FX]
type = Explod
trigger1 = Animelem = 15
anim = 3105
ID = 3152
sprPriority = 3
posType = P1
bindTime = 12
pos = 60,-81
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Final FX]
type = Explod
trigger1 = Animelemtime(17) = 3
anim = 3107
sprPriority = 3
posType = P1
bindTime = 12
pos = 40,-66
scale = 0.125,0.125
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
[State 3150, Final FX]
type = Explod
trigger1 = Animelemtime(17) = 3
anim = 3107
sprPriority = 3
posType = P1
bindTime = 12
pos = 40,-66
scale = 0.125,0.125
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0
vfacing = -1

[State 3150, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Voice 2]
type = Playsnd
trigger1 = AnimELem = 3
value = 3100, 1
channel = 0

[State 3150, Voice 3]
type = Playsnd
trigger1 = AnimELem = 17
value = 3100, 2
channel = 0

[State 3150, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
trigger5 = AnimElem = 15
trigger6 = AnimElem = 17
value = 1,2
ownpal = 1

[State 5150, 6]
type = VelMul
trigger1 = animelemtime(17)<0
x = .98

[State 3150,VelSet]
type = VelSet
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13 || AnimElem = 16
x = 5

[State 3150,VelSet]
type = VelSet
trigger1 = AnimElem = 6 || AnimElem = 9 || AnimElem = 12 || AnimElem = 15
x = 0

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 17
helperType = Normal
stateNo = 8100
ID = 8100
name = "J.V.A. Dust"
posType = P1
ownPal = 1

[State 3150, StateTypeSet: Air, Physics = None]
type = StateTypeSet
trigger1 = AnimElem = 18
stateType = A

[State 3150, VelAdd: Final Kick]
type = VelAdd
trigger1 = AnimElem = 17
x = 2
y = -8.5

[State 3150, Gravity]
type = VelAdd
trigger1 = AnimElemTime(17) >= 0
y = .55

[State 3150, Hit 1 & 4]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 4 || AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 39 < 7, 7, fvar(11) * 39)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Hit 2 & 3]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 7 || AnimElem = 10
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = AnimElem = 16
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.5,-6.5
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
sparkXY = -10 + 0 * (var(35) := 65), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 11
trigger1 = AnimElem = 18
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 53 < 7, 7, fvar(11) * 53)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7,-3
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7,-3
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(19) >= 0
moveType = I

[State 3150, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101

;====<THOSAND JAGUAR>=
[StateDef 3160]
type = S
physics = N
moveType = A
anim = 3160
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 3160, Voice]
type = PlaySnd
trigger1 = !Time
value = 3160, 0
channel = 0

[State 3160, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 12
trigger5 = AnimElem = 15
trigger6 = AnimElem = 18
trigger7 = AnimElem = 21
trigger8 = AnimElem = 14
value = 1,0

[State 3160, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3160, Spark XY]
type = Null
trigger1 = AnimElem = 3 || AnimElem = 15
trigger1 = var(35) := 82 || var(36) := -100
trigger2 = AnimElem = 6 || AnimElem = 18
trigger2 = var(35) := 76 || var(36) := -54
trigger3 = AnimElem = 9 || AnimElem = 21
trigger3 = var(35) := 85 || var(36) := -76
trigger4 = AnimElem = 12 || AnimElem = 24
trigger4 = var(35) := 80 || var(36) := -81

[State 3160, High]
type = HitDef
trigger1 = AnimElem = 3 || AnimElem = 12 || AnimElem = 15 || AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0, 0
givePower = 0, 0
pauseTime = 3, 3
guard.pauseTime = 3, 3
animType = Up
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -5
ground.cornerPush.velOff = 0
guard.velocity = -2
guard.cornerPush.velOff = 0
air.velocity = -1, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -82, -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Low]
type = HitDef
trigger1 = AnimElem = 6 || AnimElem = 9 || AnimElem = 18 || AnimElem = 21
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0, 0
givePower = 0, 0
pauseTime = 3, 3
guard.pauseTime = 3, 3
animType = Up
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -5
ground.cornerPush.velOff = 0
guard.velocity = -2
guard.cornerPush.velOff = 0
air.velocity = -1, -5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -76, -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3160, Juggle Points Reset]
type = VarSet
trigger1 = AnimElem = 27
var(15) = 0
ignoreHitPause = 1

[State 3160, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<JAGUAR ASSASSIN>=
[StateDef 3170]
type = S
physics = N
moveType = A
anim = 3170
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 3170, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3151

[State 3170, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3152

[State 3170, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 3170, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3170,0
channel = 0
[State 3170, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 3170,1
channel = 0
[State 3170, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3170,2
channel = 0

[State 3170, Roar Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,1
channel = 4

[State 3170, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
trigger3 = AnimElem = 8
value = 1,5
channel = 1

[State 3170, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 3170, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 3170, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Assassin Dust"
posType = P1
ownPal = 1

[State 3170, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 9
y = -9.5

[State 3170,VelAdd]
type = VelAdd
trigger1 = AnimElem = 2,> 0
y = .45

[State 3170, 6]
type = VelMul
trigger1 = 1
x = 0.95

[State 3170, Hit 1]
type = HitDef
trigger1 = AnimElem = 2
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3170, Hit 2]
type = HitDef
trigger1 = AnimElem = 5
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
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
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3170, Hit 3]
type = HitDef
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 53 < 7, 7, fvar(11) * 53)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 24, 24), ifElse(var(20), 24, 24)
guard.pauseTime = ifElse(var(20), 24, 24), ifElse(var(20), 24, 24)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -16.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3170, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3170, End]
type = ChangeState
triggerall = AnimElemTime(9) >= 0
trigger1 = pos y > -vel y
value = 1101
ctrl = 0

;====<JAGUAR AVALANCHE>==
[Statedef 3200]
type = S
movetype = A
physics = N
juggle = 3
ctrl = 0
velset = 0,0
sprpriority = 2
velset = 0,0
anim = 3200
powerAdd = -3000
faceP2 = 1

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
var(17) = 54

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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8520
name = "Superpause FX"
posType = P1
pos = 1,-65
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,0
channel = 0
[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,1
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
value = 1,5
channel = 1

[State 3200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 3200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A
physics = N

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jaguar Avalanche Dust"
posType = P1
ownPal = 1

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10
y = -9.5

[State 3200,VelAdd]
type = VelAdd
trigger1 = AnimElem = 3,> 0
y = .4

[State 3200, 6]
type = VelMul
trigger1 = 1
x = 0.95

[State 3200, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -8.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -7.81
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -68
snap = 35,5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3200, Movehit Explod: First Kick]
type = Explod
trigger1 = AnimElem = 4 && movehit
anim = 3205
ID = 3205
sprPriority = 3
posType = P1
ignoreHitPause = 1

[State 3200, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 6
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -7.81
ground.cornerPush.velOff = 0
guard.velocity = -8.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -80
snap = 35,5
p2facing = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3200, Movehit check]
type = MoveHitReset
trigger1 = animelem = 5

[State 3200, Movehit Explod: Second Kick]
type = Explod
trigger1 = numexplod(3205)=1
trigger1 = AnimElem = 7 && movehit
anim = 3205
ID = 3206
sprPriority = 3
posType = P1
ignoreHitPause = 1

[State 3200, Jaguar Kick FX (HK)]
type = Explod
trigger1 = AnimElem = 14
anim = 1025
sprPriority = 3
posType = P1
bindTime = 1
pos = 0,0
scale = 0.25,0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1000,1
channel = 4

[State 3200, Lamp Oil! Rope! Bombs! Wou want it? It's yours, my friend! As long as you have enough rupies!]
type = RemoveExplod
trigger1 = Win || Lose || DrawGame
trigger2 = !var(16) && (var(15) >= 3 || var(20))
id = 3205

[State 3200, Sorry, Link. I can't give credit! Some back when you're a little... MMMMMMMMM... richer!]
type = RemoveExplod
trigger1 = Win || Lose || DrawGame
trigger2 = !var(16) && (var(15) >= 3 || var(20))
id = 3206

[State 3200, Hit 3: No continue]
type = HitDef
triggerall = numexplod(3206)=0
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 13
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -2.81
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -4.16, 6.16
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -40
p2facing = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3200, Hit 3: Continue]
type = HitDef
triggerall = numexplod(3206)=1
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 13
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 76 < 7, 7, fvar(11) * 76)), 7
getPower = 0,0
givePower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -2.81
ground.cornerPush.velOff = 0
guard.velocity = -4.32
guard.cornerPush.velOff = 0
air.velocity = -3.16, -6.16
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -40
p1StateNo = 3210
p2StateNo = 3215
kill = 0
p2facing = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 3200, End: Missed]
type = ChangeState
triggerall = AnimElemTime(15) >= 0
trigger1 = pos y > -vel y
value = 3201
ctrl = 0

;Landing
[StateDef 3201]
type = S
physics = S
moveType = I
Anim = 3201
velSet = 0,0

[State 3201, Hit Reset]
type = RemoveExplod
trigger1 = 1
id = 3205

[State 3201, Hit Reset]
type = RemoveExplod
trigger1 = 1
id = 3206

[State 3201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3201, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Connected: Leap
[StateDef 3210]
type = A
physics = A
moveType = A
Anim = 3210
velSet = 4,-7

[State 3210, Hit Reset]
type = RemoveExplod
trigger1 = 1
id = 3205

[State 3210, Hit Reset]
type = RemoveExplod
trigger1 = 1
id = 3206

[State 3210, End: Missed]
type = ChangeState
trigger1 = AnimElemTime(8) >= 0
value = 3220
ctrl = 0

;Victim goes higher
[StateDef 3215]
type = A
moveType = H
physics = A
sprPriority = 1

[State 3215, PosFreeze]
type = PosFreeze
trigger1 = time < 12
value = 1

[State 3215, VelSet]
type = VelSet
trigger1 = time = 12
x = -2
y = -7

[State 3215, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3215

;Connected
[StateDef 3220]
type = A
physics = N
moveType = A
anim = 3220
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3220, Voice]
type = PlaySnd
trigger1 = !time
value = 2,800
channel = 3

[State 3220, Explod: Legs]
type = Explod
trigger1 = !time
anim = 3221
sprPriority = 3
posType = P1
bindTime = -1
pos = 0,0
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, Explod: Elbows]
type = Explod
trigger1 = !time
anim = 3222
sprPriority = 3
posType = P1
bindTime = -1
pos = 0,0
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 1

[State 3220, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3225

[State 3220, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 3220, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(1)>=0 && animelemtime(13)<5
pos = ceil(0 * const(size.xScale)), ceil(-75 * const(size.yScale))

[State 3220, Voice]
type = PlaySnd
trigger1 = !Time
value = 3200,2
channel = 0

[State 3220, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3200,3
channel = 0

[State 3220, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
value = 1,2
channel = 1

[State 3220, Hit Sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
value = 2,2
channel = 2

[State 3220, EnvShake]
type = EnvShake
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
time = 24
freq = 120
ampl = 4

[State 3220, Hit Spark: Left Hand]
type = Helper
triggerall = NumTarget
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
helperType = Normal
stateNo = 8014
ID = 8000
facing = -1
name = "Spark"
posType = P1
pos = ceil(-17 * const(size.xScale)), ceil(-79 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3220, Hit Spark: Right Hand]
type = Helper
triggerall = NumTarget
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-79 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3220, Damage]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
value = -10
kill = 0

[State 3220, TargetPowerAdd]
type = TargetPowerAdd
triggerall = NumTarget
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
value = 8

[State 3220, HitAdd]
type = HitAdd
triggerall = NumTarget
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
value = 1

[State 3220, HitCount]
type = VarAdd
triggerall = NumTarget
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
var(13) = 1

[State 3220, Leap Up]
type = VelSet
trigger1 = AnimElem = 14
y = -10
[State 3220,Gravity]
type = VelAdd
trigger1 = AnimElem = 14,>= 0
y = 0.25

[State 3220, LastAttack Dash]
type = VelSet
trigger1 = AnimElem = 22
y = 35

[State 3220, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 22
value = 1000,1
channel = 1

[State 3220, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3230

;Victim In Air
[StateDef 3225]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 2

[State 3225, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 3225, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3225

[State 3220, VelSet]
type = VelSet
trigger1 = animelem = 13
y = 15

[State 3220, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3226

;Victim on the ground
[StateDef 3226]
type = L
moveType = H
physics = S
velSet = 0,0
sprPriority = 1

[State 3226, PosFreeze]
type = PosSet
trigger1 = 1
y = 0

[State 3226, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 5110

[State 3226, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3226, HitBy]
type = HitBy
trigger1 = 1
value = S,HA
time = 1

;Final Hit
[StateDef 3230]
type = S
physics = N
moveType = A
anim = 3230
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3230, Hit]
type = HitDef
trigger1 = animelem = 1
attr = S,HA
damage = 85
hitflag = FD+
priority = 4,Hit
pausetime = 15,60
down.velocity = 0,0
down.bounce = 0
getpower = 0
fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 5)
sparkNo = -1 + 0 * (var(33) := 8014)
sparkXY = -10 + 0 * (var(35) := 0), var(36) := -10

[State 3230, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 3230, EnvShake]
type = EnvShake
trigger1 = !Time
time = 24
freq = 120
ampl = 8

[State 3230, Impact Dust]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0, 0
facing = -1
ownPal = 1

[State 3230, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A

[State 3230, VelAdd]
type = VelSet
trigger1 = AnimElem = 4
x = -3.5
y = -7.5

[State 3230, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,>= 0
y = .37

[State 3230, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 41,0
channel = 2

[State 3200, End]
type = ChangeState
triggerall = animelemtime(8)>=0
trigger1 = pos y > -vel y
value = 3201