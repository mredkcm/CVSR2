; _________________________________________
;| Demitri by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<CHAOS FLARE>==
[StateDef 1000]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, Snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000, 0
channel = 0

[State 1000, 1]
type = Width
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(36) < 0
value = 30,0

[State 1000, Snd2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000, 1

[State 1000, Chaos Flare startup effect (Right)]
type = Explod
trigger1 = Animelem = 8
anim = 1034
ID = 1034
bindTime = -1
sprPriority = -3
posType = P1
pos = ceil(79 * const(size.xScale)), ceil(-64 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Projectile]
type = Helper
trigger1 = AnimElemTime(9) = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Chaos Flare Projectile"
posType = P1
pos = ceil(69 * const(size.xScale)), ceil(-72 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX CHAOS FLARE>=
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1000, Snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1030, 0
channel = 0

[State 1000, 1]
type = Width
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(36) < 0
value = 30,0

[State 1000, Snd2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000, 1

[State 1030, Chaos Flare startup effect (Right)]
type = Explod
trigger1 = Animelem = 8
anim = 1034
ID = 1034
bindTime = -1
sprPriority = -3
posType = P1
pos = ceil(79 * const(size.xScale)), ceil(-64 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1030, Projectile]
type = Helper
trigger1 = AnimElemTime(9) = 1
helperType = Normal
stateNo = 1035
ID = 1035
name = "EX Chaos Flare Projectile"
posType = P1
pos = ceil(69 * const(size.xScale)), ceil(-72 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<AIR CHAOS FLARE>==
[StateDef 1050]
type = S
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1050, Pos]
type = PosAdd
trigger1 = Time = 0
y = -14

[State 1050, Snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 0
channel = 0

[State 1050, Snd2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1000, 1

[State 1050, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Animelem = 11
x = -2 - Var(10)
y = -1.8 - (Var(10) * 0.2)

[State 1050, Mul]
type = VelMul
trigger1 = Animelem = 11 >= 1
;trigger1 = Vel Y > 0
y = 1

[State 1050, Grav] ;Gravity
type = gravity
trigger1 = AnimElem = 11 >= 0

[State 1000, Chaos Flare startup effect (Right)]
type = Explod
trigger1 = Animelem = 9
anim = 1084
ID = 1084
bindTime = -1
sprPriority = -3
posType = P1
pos = ceil(64 * const(size.xScale)), ceil(-67 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1050, Projectile]
type = Helper
trigger1 = AnimElemTime(10) = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Chaos Flare Projectile"
posType = P1
pos = ceil(52 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<EX AIR CHAOS FLARE>=
[StateDef 1080]
type = S
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1080, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1080, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1080, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1080, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1080, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1080, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1080, Pos]
type = PosAdd
trigger1 = Time = 0
y = -14

[State 1080, Snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1030, 0
channel = 0

[State 1080, Snd2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1000, 1

[State 1080, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = Animelem = 11
x = -2 - Var(10)
y = -1.8 - (Var(10) * 0.2)

[State 1080, Mul]
type = VelMul
trigger1 = Animelem = 11 >= 1
;trigger1 = Vel Y > 0
y = 1

[State 1080, Grav] ;Gravity
type = gravity
trigger1 = AnimElem = 11 >= 0

[State 1080, Chaos Flare startup effect (Right)]
type = Explod
trigger1 = Animelem = 9
anim = 1084
ID = 1084
bindTime = -1
sprPriority = -3
posType = P1
pos = ceil(64 * const(size.xScale)), ceil(-67 * const(size.yScale))
scale = const(size.xScale) * 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1080, Projectile]
type = Helper
trigger1 = AnimElemTime(10) = 1
helperType = Normal
stateNo = 1035
ID = 1035
name = "EX Chaos Flare Projectile"
posType = P1
pos = ceil(52 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1080, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<DEMON CRADLE>=
[StateDef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = PlaySnd
trigger1 = PrevStateNo = [150, 153]
trigger1 = Time = 0
value = 1100,2

[State 1100, 1];¹«Àû
type = NotHitBy
trigger1 = Animelem = 21, <= 0
value = SCA

[State 1100, Snd]
type = PlaySnd
;trigger1 = Var(9) < 5
trigger1 = animelem = 3
value = 1100,0
channel = 0

[State 1100, Snd2]
type = PlaySnd
;trigger1 = Var(9) >= 5
trigger1 = animelem = 3
value = 1100,1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.1, -10.2
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -3.1, -10.2
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, 3];¼Ó¼º º¯°æ
type = StatetypeSet
trigger1 = Animelem = 7
value = A

[State 1100, 4];¼Óµµ¸¦ ÁØ´Ù
type = VelSet
trigger1 = Animelem = 6
x = 0
y = -6.8 + ifelse(Var(10) = 0, 0, ifelse(Var(10) = 1, -0.8, -1.6) )

[State 1100, 5];Áß·Â
type = Gravity
trigger1 = Animelem = 6, >= 0

[State 1100, 6]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<EX DEMON CRADLE>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 151

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Snd]
type = PlaySnd
trigger1 = PrevStateNo = [150, 153]
trigger1 = Time = 0
value = 1100,2

[State 1130, 1];¹«Àû
type = NotHitBy
trigger1 = Animelem = 8, <= 0
value = SCA

[State 1130, effect]
type = explod
trigger1 = Time = 0
postype = p1
anim = 1105
pos = 0, 0
sprpriority = 3
bindtime = -1
ownpal = 1
removeongethit = 1
ignoreHitPause = 0

[State 1130, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1100,0
channel = 0

[State 1130, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1130,0
channel = 2

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
trigger6 = AnimElem = 16
trigger7 = AnimElem = 18
trigger8 = AnimElem = 20
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.3, -11.7
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -2.2, -8.7
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, 3];¼Ó¼º º¯°æ
type = StatetypeSet
trigger1 = Animelem = 7
value = A

[State 1130, 4];¼Óµµ¸¦ ÁØ´Ù
type = VelSet
trigger1 = Animelem = 6
x = 0
y = -8.1

[State 1130, 5];Áß·Â
type = Gravity
trigger1 = Animelem = 6, >= 0

[State 1130, 6]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<ANGLED DEMON CRADLE>=
[StateDef 1150]
type = S
physics = N
moveType = A
anim = 1110
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1150, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1150, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Dust"
postype = p1
ownpal = 1

[State 1150, 1];¹«Àû
type = NotHitBy
trigger1 = Animelem = 21, <= 0
value = SCA

[State 1150, Snd]
type = PlaySnd
;trigger1 = Var(9) < 5
trigger1 = animelem = 3
value = 1100,0
channel = 0

[State 1150, Snd2]
type = PlaySnd
;trigger1 = Var(9) >= 5
trigger1 = animelem = 3
value = 1100,1

[State 1150, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 119, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.1, -10.2
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -3.1, -10.2
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, 3];¼Ó¼º º¯°æ
type = StatetypeSet
trigger1 = Animelem = 6
value = A

[State 1150, 4];¼Óµµ¸¦ ÁØ´Ù
type = VelSet
trigger1 = Animelem = 6
x = 3.5
y = -6.6 + ifelse(Var(10) = 0, 0, ifelse(Var(10) = 1, -0.9, -1.7) )

[State 1150, 5];Áß·Â
type = Gravity
trigger1 = Animelem = 6, >= 0

[State 1150, 6]
type = VelSet
trigger1 = Vel Y > 0 && Pos Y < 0
x = 1.1

[State 1150, 7]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<EX DEMON CRADLE>=
[StateDef 1180]
type = S
physics = N
moveType = A
anim = 1110
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1180, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1180, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1180, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 151

[State 1180, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1180, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1180, 1];¹«Àû
type = NotHitBy
trigger1 = Animelem = 9, <= 0
value = SCA

[State 1180, effect]
type = explod
trigger1 = Time = 0
postype = p1
anim = 1115
pos = 0, 0
sprpriority = 3
bindtime = -1
ownpal = 1
removeongethit = 1
ignoreHitPause = 0

[State 1180, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1100,0
channel = 0

[State 1180, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1130,0
channel = 2

[State 1180, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
trigger6 = AnimElem = 16
trigger7 = AnimElem = 18
trigger8 = AnimElem = 20
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2, 4), ifElse(var(20), 2, 4)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.3, -11.2
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -4.1, -10.3
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1180, 3];¼Ó¼º º¯°æ
type = StatetypeSet
trigger1 = Animelem = 6
value = A

[State 1180, 4];¼Óµµ¸¦ ÁØ´Ù
type = VelSet
trigger1 = Animelem = 6
x = 3.5
y = -7.6

[State 1180, 5];Áß·Â
type = Gravity
trigger1 = Animelem = 6, >= 0

[State 1180, 6]
type = VelSet
trigger1 = Vel Y > 0 && Pos Y < 0
x = 1.1

[State 1180, 7]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<BAT SPIN>=
[StateDef 1200]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, type]
type = StatetypeSet
trigger1 = PrevStateNo = [50, 51]
trigger1 = Time = 0
value = A

[State 1200, 1]
type = explod
trigger1 = AnimElem = 13
postype = p1
anim = 1205
pos = floor(1*const(size.xscale)), floor(-66*const(size.yscale))
sprpriority = 3
ownpal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1200, Snd]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1200, 0

[State 1200, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 1201

;====<BAT SPIN>=
[Statedef 1201]
type = A
movetype = A
physics = S
juggle = 8
anim = 1201
ctrl = 0
sprpriority = 2

[State 1201, posadd]
type = PosAdd
trigger1 = Time = 0
x = Var(10) * 80

[State 1201, 1]
type = PosSet
trigger1 = Time = 0
y = -88

[State 1201, 2]
type = VelSet
trigger1 = AnimElem = 9, >=0
x = 5
y = 5.3

[State 1201, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1200,1
channel = 0

[State 1201, Snd]
type = PlaySnd
trigger1 = time = 2
value = 100, 2
channel = 1

[State 1201, HitDef]
type = HitDef
triggerall = P2BodyDist X <= 22
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
trigger5 = AnimElem = 15
trigger6 = AnimElem = 17
trigger7 = AnimElem = 19
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 42, 39)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 42, 39)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Med
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.6, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.8
guard.cornerPush.velOff = 0
air.velocity = -3.5, 2.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, HitDef]
type = HitDef
triggerall = P2BodyDist X > 22
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
trigger5 = AnimElem = 15
trigger6 = AnimElem = 17
trigger7 = AnimElem = 19
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 42, 39)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 42, 39)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Med
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.6, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.8
guard.cornerPush.velOff = 0
air.velocity = -3.5, 2.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, 5]
type = ChangeState
trigger1 = hitcount > 2
trigger1 = Pos Y <= -4 && !moveguarded
value = 1202

[State 1201, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<BAT SPIN>=
[Statedef 1202]
type = A
physics = A
anim = 1202
ctrl = 0
sprpriority = 2

[State 1202, 1]
type = VelSet
trigger1 = Time = 0
x = -2.7
y = -7.5

[State 1202, Mul]
type = VelMul
trigger1 = Time >= 0
trigger1 = Vel Y > 0
y = .9

[State 1202, 2] ;Gravity
type = VelAdd
trigger1 = AnimElem = 1, >= 0
y = .4

[State 1202, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<EX BAT SPIN>=
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 151

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, type]
type = StatetypeSet
trigger1 = PrevStateNo = [50, 51]
trigger1 = Time = 0
value = A

[State 1230, 1]
type = explod
trigger1 = AnimElem = 13
postype = p1
anim = 1205
pos = floor(1*const(size.xscale)), floor(-66*const(size.yscale))
sprpriority = 3
ownpal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1230, Snd]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1200, 0
channel = 0

[State 1230, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 1231

;====<EX BAT SPIN>=
[Statedef 1231]
type = A
movetype = A
physics = S
juggle = 11
anim = 1201
ctrl = 0
sprpriority = 2

[State 1231, posadd]
type = PosAdd
trigger1 = Time = 0
x = 70

[State 1231, 1]
type = PosSet
trigger1 = Time = 0
y = -88

[State 1231, 2]
type = VelSet
trigger1 = AnimElem = 9, >=0
x = 5
y = 5.3

[State 1231, Snd]
type = PlaySnd
trigger1 = animelem = 3
value = 1200,1
channel = 0

[State 1231, Snd]
type = PlaySnd
trigger1 = time = 2
value = 100, 2
channel = 1

[State 1231, HitDef]
type = HitDef
triggerall = P2BodyDist X <= 22
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
trigger5 = AnimElem = 15
trigger6 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Med
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.9, 0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -3.9, 2.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, HitDef]
type = HitDef
triggerall = P2BodyDist X > 22
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
trigger5 = AnimElem = 15
trigger6 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Med
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.9, 0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -3.9, 2.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;=<NEGATIVE STOLEN>==
[StateDef 1300]
type = S
physics = S
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 1300, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger1 = P2BodyDist x < 55
trigger1 = !var(38)
attr = S, ST
hitFlag = M-
priority = 7, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = 1310

[State 1300, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 5
value = 5000,0
channel = 0

[State 1300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 1

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Success
[Statedef 1310]
type = S
physics = N
moveType = A
anim = 1310
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1310, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 1315

[State 1310, Width]
type = Width
trigger1 = 1
edge = 48,32
ignoreHitPause = 1

[State 1310, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) < 0
pos = ceil(28 * const(size.xScale)), 0

[State 1310, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(47 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1310, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger2 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = ceil(7 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1310, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = ceil(-47 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1310, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = ceil(-7 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1310, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = ceil(-42 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 1310, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
trigger2 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
trigger4 = AnimElemTime(24) >= 0
pos = ceil(-50 * const(size.xScale)), ceil(-51 * const(size.yScale))

[State 1310, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
trigger2 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger3 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
pos = ceil(-7 * const(size.xScale)), ceil(-48 * const(size.yScale))

[State 1310, TargetBind 9]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
trigger3 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
pos = ceil(47 * const(size.xScale)), ceil(-51 * const(size.yScale))

[State 1310, TargetBind 10]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
trigger3 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
pos = ceil(6 * const(size.xScale)), ceil(-48 * const(size.yScale))

[State 1310, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1300,0
channel = 0

[State 1310, Jump sound]
type = PlaySnd
trigger1 = AnimElemTime(3) = 2
value = 41,0
channel = 1

[State 1310, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
stateType = A
physics = N

[State 1310, Dust Helper]
type = Helper
trigger1 = AnimElemTime(3) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Negative Stolen Dust"
posType = P1
ownPal = 1

[State 1310, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 2
y = -15

[State 1310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 2
y = 0.78125

[State 1310, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1311

;Slamming Opponent Into Floor
[StateDef 1311]
type = S
anim = 811
physics = N
moveType = A
velSet = 0,0

[State 1311, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = !TIme
pos = ceil(-17 * const(size.xScale)), ceil(-26 * const(size.yScale))

[State 1311, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1311, Slamming Sound]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 820,2
channel = 3

[State 1311, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 1311, Impact Dust]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
ownPal = 1

[State 1311, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(168 * fvar(11) < 7, -7, -168 * fvar(11)))

[State 1311, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1311, Power]
type = PowerAdd
trigger1 = NumTarget && !Time && !var(20)
value = 72

[State 1311, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1311, VarAdd]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 1311, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 1311, Juggle]
type = VarSet
trigger1 = NumTarget && !Time
var(16) = 1
ignoreHitPause = 1

[State 1311, Throw]
type = TargetState
trigger1 = NumTarget && !Time
value = 816

[State 1311, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = Time = 8
stateType = A
physics = N

[State 1311, VelSet]
type = VelSet
trigger1 = Time = 8
x = -3.75
y = -3.515625

[State 1311, VelAdd]
type = VelAdd
trigger1 = Time > 8
y = 0.48828125

[State 1311, Throw]
type = TargetState
trigger1 = NumTarget && Time = 8
value = 817

[State 1311,End]
type = ChangeState
trigger1 = pos y > -vel y
value = 812

;===<NEGATIVE STOLEN (TARGET)>==
;Being Thrown
[StateDef 1315]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1315, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1315

[State 1315, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 1315, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 1315, SprPriority]
type = SprPriority
trigger1 = 1
value = 0

[State 1315, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
trigger3 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
value = 2

;====<EX NEGATIVE STOLEN>=
[StateDef 1330]
type = S
physics = S
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 151

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 1330, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger1 = P2BodyDist x < 55
trigger1 = !var(38)
attr = S, ST
hitFlag = M-
priority = 7, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = 1340

[State 1330, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 5
value = 5000,0
channel = 0

[State 1330, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 2

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1330, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Success
[Statedef 1340]
type = S
physics = N
moveType = A
anim = 1310
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1340, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1340, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 1315

[State 1340, Width]
type = Width
trigger1 = 1
edge = 48,32
ignoreHitPause = 1

[State 1340, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) < 0
pos = ceil(28 * const(size.xScale)), 0

[State 1340, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(47 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1340, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger2 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = ceil(7 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1340, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = ceil(-47 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1340, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = ceil(-7 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1340, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = ceil(-42 * const(size.xScale)), ceil(-84 * const(size.yScale))

[State 1340, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
trigger2 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
trigger4 = AnimElemTime(24) >= 0
pos = ceil(-50 * const(size.xScale)), ceil(-51 * const(size.yScale))

[State 1340, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
trigger2 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger3 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
pos = ceil(-7 * const(size.xScale)), ceil(-48 * const(size.yScale))

[State 1340, TargetBind 9]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
trigger3 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
pos = ceil(47 * const(size.xScale)), ceil(-51 * const(size.yScale))

[State 1340, TargetBind 10]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
trigger3 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
pos = ceil(6 * const(size.xScale)), ceil(-48 * const(size.yScale))

[State 1340, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1300,0
channel = 0

[State 1340, Jump sound]
type = PlaySnd
trigger1 = AnimElemTime(3) = 2
value = 41,0
channel = 1

[State 1340, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
stateType = A
physics = N

[State 1340, Dust Helper]
type = Helper
trigger1 = AnimElemTime(3) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Negative Stolen Dust"
posType = P1
ownPal = 1

[State 1340, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 2
y = -15

[State 1340, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 2
y = 0.78125

[State 1340, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1341

;Slamming Opponent Into Floor
[StateDef 1341]
type = S
anim = 811
physics = N
moveType = A
velSet = 0,0

[State 1341, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = !TIme
pos = ceil(-17 * const(size.xScale)), ceil(-26 * const(size.yScale))

[State 1341, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1341, Slamming Sound]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 820,2
channel = 3

[State 1341, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 1341, Impact Dust]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
ownPal = 1

[State 1341, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(188 * fvar(11) < 7, -7, -188 * fvar(11)))

[State 1341, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1311, Power]
type = PowerAdd
trigger1 = NumTarget && !Time && !var(20)
value = 0

[State 1341, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 1341, VarAdd]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 1341, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 1341, Juggle]
type = VarSet
trigger1 = NumTarget && !Time
var(16) = 1
ignoreHitPause = 1

[State 1341, Throw]
type = TargetState
trigger1 = NumTarget && !Time
value = 816

[State 1341, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = Time = 8
stateType = A
physics = N

[State 1341, VelSet]
type = VelSet
trigger1 = Time = 8
x = -3.75
y = -3.515625

[State 1341, VelAdd]
type = VelAdd
trigger1 = Time > 8
y = 0.48828125

[State 1341, Throw]
type = TargetState
trigger1 = NumTarget && Time = 8
value = 817

[State 1341,End]
type = ChangeState
trigger1 = pos y > -vel y
value = 812

;====<HELL RIDE>=
[StateDef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1400, 1]
type = StatetypeSet
trigger1 = Animelem = 8
value = A

[State 1400, Var]
type = VarSet
trigger1 = Time = 0
fvar(6) = ((p2dist x + 23) / 32)

[State 1400, Snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4, 4
channel = 0

[State 1400, Vel]
type = VelSet
trigger1 = AnimElem = 8
x = fvar(6)
y = -8.2

[State 1400, Gravity]
type = VelAdd
trigger1 = AnimElemTime(8) >= 0
y = .58

[State 1400, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
animtype = Light
guardflag = M
hitflag = FD
priority = 4, Hit
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := floor(-4*const(size.yscale))
down.hittime = 22
down.velocity = 0
air.velocity = 0
fall.recover = 0
p1stateno = 1401
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, change]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<HELL RIDE>=
[Statedef 1401]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1401
velset = 0,0
sprpriority = 2

[State 1401, Vel]
type = VelSet
trigger1 = AnimElem = 10
x = -(fvar(6))
y = -8.2

[State 1401, Gravity]
type = VelAdd
trigger1 = AnimElemTime(10) >= 0
y = .58

[State 1401, change]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<EX HELL RIDE>=
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 151

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, 1];¼Ó¼º º¯°æ
type = StatetypeSet
trigger1 = Animelem = 8
value = A

[State 1430, Var]
type = VarSet
trigger1 = Time = 0
fvar(6) = ((p2dist x + 23) / 32)

[State 1430, Snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4, 4
channel = 0

[State 1430, Vel]
type = VelSet
trigger1 = AnimElem = 8
x = fvar(6)
y = -8.2

[State 1430, Gravity]
type = VelAdd
trigger1 = AnimElemTime(8) >= 0
y = .58

[State 1430, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, SA
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
animtype = Light
guardflag = M
hitflag = FD
priority = 4, Hit
getPower = 0,0
givePower = 36, 36
pausetime = 0,2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := floor(-4*const(size.yscale))
down.hittime = 22
down.velocity = 0
air.velocity = 0
fall.recover = 0
p1stateno = 1431
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, change]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;====<EX HELL RIDE>=
[Statedef 1431]
type = A
movetype = A
physics = N
ctrl = 0
anim = 1430
velset = 0,0
sprpriority = 2

[State 1431, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13
trigger2 = AnimElem = 15
trigger3 = AnimElem = 18
trigger4 = AnimElem = 20
attr = A, SA
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
animtype = Light
guardflag = M
hitflag = FD
priority = 4, Hit
getPower = 0,0
givePower = 36, 36
pausetime = 5,7
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := floor(-2*const(size.yscale))
down.hittime = 22
down.velocity = 0
air.velocity = 0
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1431, Vel]
type = VelSet
trigger1 = AnimElem = 38
x = -(fvar(6))
y = -8.2

[State 1431, Gravity]
type = VelAdd
trigger1 = AnimElemTime(38) >= 0
y = .58

[State 1431, change]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;=<CHAOS FLARE 2>==
[StateDef 1500]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, Snd]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1000, 0
channel = 0

[State 1500, 1]
type = Width
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(40) < 0
value = 30,0

[State 1500, Snd2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1000, 1

[State 1500, Projectile]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 1505
ID = 1505
name = "Chaos Flare 2 Projectile"
posType = P1
pos = ceil(31 * const(size.xScale)), ceil(-76 * const(size.yScale))
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX CHAOS FLARE 2>=
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1530, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1530, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1530, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Snd]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1000, 0
channel = 0

[State 1530, 1]
type = Width
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(40) < 0
value = 30,0

[State 1530, Snd2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1000, 1

[State 1530, Projectile]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 1535
ID = 1535
name = "EX Chaos Flare Projectile 2"
posType = P1
pos = ceil(31 * const(size.xScale)), ceil(-76 * const(size.yScale))
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1

[State 1530, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<AIR CHAOS FLARE 2>==
[StateDef 1550]
type = S
physics = N
moveType = A
anim = 1550
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1550, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1550, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1550, Pos]
type = PosAdd
trigger1 = Time = 0
y = -14

[State 1550, Snd]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1000, 0
channel = 0

[State 1550, Snd2]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1000, 1

[State 1550, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = AnimelemTime(15) < 0
y = .6

[State 1550, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = AnimelemTime(15) = 1
x = -2 - Var(10)
y = -1.8 - (Var(10) * 0.2)

[State 1550, Mul]
type = VelMul
trigger1 = AnimelemTime(15) > 1
;trigger1 = Vel Y > 0
y = 1

[State 1550, Grav] ;Gravity
type = gravity
trigger1 = AnimelemTime(15) >= 1

[State 1550, Projectile]
type = Helper
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 1505
ID = 1505
name = "Chaos Flare Projectile"
posType = P1
pos = ceil(24 * const(size.xScale)), ceil(-67 * const(size.yScale))
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1

[State 1550, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<EX AIR CHAOS FLARE 2>=
[StateDef 1580]
type = S
physics = N
moveType = A
anim = 1550
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1580, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1580, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1580, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1580, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1580, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1580, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1580, Pos]
type = PosAdd
trigger1 = Time = 0
y = -14

[State 1580, Snd]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1000, 0
channel = 0

[State 1580, Snd2]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1000, 1

[State 1580, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = AnimelemTime(15) < 0
y = .6

[State 1580, Vel];¼Óµµ¸¦ ¼³Á¤
type = VelSet
trigger1 = AnimelemTime(15) = 1
x = -2 - Var(10)
y = -1.8 - (Var(10) * 0.2)

[State 1580, Mul]
type = VelMul
trigger1 = AnimelemTime(15) > 1
;trigger1 = Vel Y > 0
y = 1

[State 1580, Grav] ;Gravity
type = gravity
trigger1 = AnimelemTime(15) >= 1

[State 1580, Projectile]
type = Helper
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 1535
ID = 1535
name = "EX Chaos Flare Projectile"
posType = P1
pos = ceil(24 * const(size.xScale)), ceil(-67 * const(size.yScale))
size.xScale = const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1

[State 1580, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1

;====<PUNCH ZERO COUNTER>=
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 159), var(36) := -73
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<KICK ZERO COUNTER>=
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(11) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
