; _________________________________________
;| Rugal by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<REPPUKEN>==
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

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,1

[State 1000, Explod]
type = Explod
trigger1 = animelem = 7
anim = 1004
ID = 1004
pos = 8,-87
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1005
ID = 1005
name = "Reppuken Projectile"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = time = 0
edge = 0,0
player = 10,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX REPPUKEN>=
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1030
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

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,1

[State 1030, Explod]
type = Explod
trigger1 = animelem = 7
anim = 1004
ID = 1004
pos = 8,-87
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Reppuken Projectile"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(0 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = time = 0
edge = 0,0
player = 10,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<RUGAL GENOCIDE CUTTER>=
[StateDef 1100]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo = 751 && var(40) = 0
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 1, ifElse((command = "b" || command = "rlsb"), 1, 1))

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751 && var(40) = 0
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 1100, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1100, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 2

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
StateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Cutter Dust"
posType = P1
ownPal = 1

[State 1100, Velocity]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElemTime(3) = 2
x = 3.5
y = -5.5

[State 1100, Velocity]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElemTime(3) = 2
x = 4.5
y = -7.5

[State 1100, Velocity]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElemTime(3) = 2
x = 5.5
y = -9.5

[State 1100, Gravity]
type = Veladd
trigger1 = var(10) = 0
trigger1 = AnimElemTime(3) >= 2
y = .4

[State 1100, Gravity]
type = Veladd
trigger1 = var(10) = 1
trigger1 = AnimElemTime(3) >= 2
y = .45

[State 1100, Gravity]
type = Veladd
trigger1 = var(10) = 2
trigger1 = AnimElemTime(3) >= 2
y = .50

[State 1100, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) >= 2
x = .9

[State 1100, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1100, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1100, Explod]
type = Explod
trigger1 = var(10) = 2
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := ifElse(var(10) = 2, -68, ifElse(var(10) = 1, -80, -68))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = var(10) = 1 || var(10) = 2
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifElse(var(10) = 2, -105, ifElse(var(10) = 1, -125, -105))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = movecontact <= 1
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
movetype = I

[State 1100, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) >= 2
value = 1105

;Landing
[StateDef 1105]
type = S
anim = 1105
physics = N
moveType = I
velSet = 0,0

[State 1105, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(!var(10), 1105, ifelse(var(10) = 1, 1115, 1125))

[State 1105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1105, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX RUGAL GENOCIDE CUTTER>=
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1130
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
var(25) = 131

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

[State 1130, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1130, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,0
channel = 0

[State 1130, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 1100,1
channel = 2

[State 1130, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 1,4

[State 1130, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 41,0

[State 1130, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
StateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Cutter Dust"
posType = P1
ownPal = 1

[State 1130, Velocity]
type = VelSet
trigger1 = AnimElemTime(3) = 2
x = 5.5
y = -7.5

[State 1130, Velocity]
type = VelSet
trigger1 = AnimElemTime(11) = 2
x = 6.5
y = -6.5

[State 1130, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) >= 2
y = .43

[State 1130, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) >= 2
x = .9

[State 1130, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-72
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, Explod]
type = Explod
trigger1 = animelem = 16
anim = 1190
ID = 1190
pos = 28,-82
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -11
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -11
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = movecontact <= 1
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 16
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -9
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -138
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -9
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -138
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 18
movetype = I

[State 1130, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) >= 2
value = 1105

;====<GOD RUGAL GENOCIDE CUTTER>=
[StateDef 1150]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1150, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1150, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1130, ifElse(var(10) = 1, 1110, 1100))

[State 1150, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1150, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,10
channel = 0

[State 1150, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 1100,1
channel = 1

[State 1150, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 1,4

[State 1150, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 16
value = 41,0
channel = 2

[State 1150, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
StateType = A
physics = N

[State 1150, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Cutter Dust"
posType = P1
ownPal = 1

[State 1150, Velocity]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElemTime(3) = 2
x = 3.5
y = -5.5

[State 1150, Velocity]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElemTime(3) = 2
x = 4.5
y = -7.5

[State 1150, Velocity]
type = VelSet
triggerall = var(10) = 2
trigger1 = AnimElemTime(3) = 2
x = 5.5
y = -7.5

[State 1150, Velocity]
type = VelSet
triggerall = var(10) = 2
trigger1 = AnimElemTime(11) = 2
x = 6.5
y = -6.5

[State 1150, Gravity]
type = Veladd
trigger1 = var(10) = 0
trigger1 = AnimElemTime(3) >= 2
y = .4

[State 1150, Gravity]
type = Veladd
trigger1 = var(10) = 1
trigger1 = AnimElemTime(3) >= 2
y = .50

[State 1150, Gravity]
type = Veladd
trigger1 = var(10) = 2
trigger1 = AnimElemTime(3) >= 2
y = .43

[State 1150, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) >= 2
x = .9

[State 1150, Explod]
type = Explod
trigger1 = var(10) = 0
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1150, Explod]
type = Explod
trigger1 = var(10) = 1
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1150, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-72
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1150, Explod]
type = Explod
trigger1 = animelem = 16
anim = 1190
ID = 1190
pos = 28,-82
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1150, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := ifElse(var(10) = 2, -68, ifElse(var(10) = 1, -80, -68))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = var(10) = [0,1]
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifElse(var(10) = 2, -105, ifElse(var(10) = 1, -125, -105))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -0.36, -1), -11
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity =ifelse(var(20), -0.36, -1), -11
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -0.36, -1), -11
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity =ifelse(var(20), -0.36, -1), -11
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = var(10) = 2
trigger1 = movecontact <= 1
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -0.36, -1), -10
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity =ifelse(var(20), -0.36, -1), -10
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -107
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 7]
type = HitDef
trigger1 = !var(16) && (var(15) < 9 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 16
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -1.36, -2), -9.5
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity =ifelse(var(20), -1.36, -2), -9.5
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -138
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef 8]
type = HitDef
trigger1 = !var(16) && (var(15) < 10 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 17
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -3), -9
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity =ifelse(var(20), -2.36, -3), -9
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -138
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, StateTypeSet]
type = StateTypeSet
trigger1 = var(10) = [0,1]
trigger1 = animelem = 6
movetype = I

[State 1150, StateTypeSet]
type = StateTypeSet
trigger1 = var(10) = 2
trigger1 = animelem = 18
movetype = I

[State 1150, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = var(10) = 0
trigger1 = AnimElemTime(3) >= 2
value = 1105

[State 1150, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = var(10) = 1
trigger1 = AnimElemTime(3) >= 2
value = 1105

[State 1150, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = var(10) = 2
trigger1 = AnimElemTime(3) >= 2
value = 1105

;====<EX GOD RUGAL GENOCIDE CUTTER>=
[StateDef 1160]
type = S
physics = S
moveType = A
anim = 1140
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1160, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1160, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1160, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 131

[State 1160, EX FX]
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

[State 1160, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1160, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1160, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1160, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1160, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1100,10
channel = 0

[State 1160, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 11
trigger3 = AnimElem = 23
value = 1100,1
channel = 2

[State 1160, Voice]
type = PlaySnd
trigger1 = AnimElem = 21
value = 1100,11
channel = 0

[State 1160, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 11
trigger3 = AnimElem = 23
value = 1,4

[State 1160, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 11
trigger3 = AnimElem = 23
value = 41,0

[State 1160, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
StateType = A
physics = N

[State 1160, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Cutter Dust"
posType = P1
ownPal = 1

[State 1160, Velocity]
type = VelSet
trigger1 = AnimElemTime(3) = 2
x = 4.5
y = -7.5

[State 1160, Velocity]
type = VelSet
trigger1 = AnimElemTime(11) = 2
x = 5.5
y = -7.5

[State 1160, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = .5

[State 1160, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) >= 2
x = .94

[State 1160, Velocity]
type = VelSet
trigger1 = AnimElem = 29
x = -5.5
y = -8.5

[State 1160, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(21) >= 0
trigger1 = AnimElemTime(29) <= 0
value = 1

[State 1160, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1190
ID = 1190
pos = 18,-72
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1160, Explod]
type = Explod
trigger1 = animelem = 11
anim = 1190
ID = 1190
pos = 28,-122
postype = p1
bindtime = 3
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1160, Explod]
type = Explod
trigger1 = animelem = 23
anim = 1190
ID = 1190
pos = 28,-82
postype = p1
vfacing = -1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1160, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -1, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -1, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 10)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -9
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -1, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 27
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1160, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 28
movetype = I

[State 1160, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) >= 2
value = 1105

;=<GOD PRESS>==
[StateDef 1200]
type = S
physics = N
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1210, 1200))

[State 1200, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1200, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 5
value = 100,0
channel = 19

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1200
trigger1 = AnimElem = 9
value = 100,1
channel = 20

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1210
trigger1 = AnimElem = 5 || AnimElem = 13
value = 100,0
channel = 19

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1210
trigger1 = AnimElem = 9
value = 100,1
channel = 20

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1220
trigger1 = AnimElem = 5 || AnimElem = 13
value = 100,0
channel = 19

[State 1200, Effect]
type = PlaySnd
triggerall = anim = 1220
trigger1 = AnimElem = 9 || AnimElem = 17
value = 100,1
channel = 20

[State 1200, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 0
x = 5.5

[State 1200, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 1
x = 6.5

[State 1200, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = 0, 1
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200
Kill = 0

[State 1200,1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1

[State 1200, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 1204
persistent = 0

[State 1200, 2]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 0
trigger4 = moveguarded
value = 1201
ctrl = 0

;miss
[Statedef 1201]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1201

[State 1201, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2

[State 1201, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;crash wall
[Statedef 1204]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1202

[State 1204, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 1204, Throw]
type = TargetState
trigger1 = time = 0
value = 1207

[State 1204, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1204, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1204, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 1204, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -25, -75
postype = P1
time = -1

[State 1204, Velocity]
type = VelSet
trigger1 = Time = 0
x = 11
y = -.9

[State 1204, VelAdd]
type = veladd
trigger1 = 1
y = .09

[State 1204, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 1206

[State 1204, 1]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 1205

;dash
[Statedef 1205]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1203

[State 1205, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,1
channel = 4

[State 1205, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 1205, Velocity]
type = VelSet
trigger1 = Time = 0
x = 13.5

[State 1205, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -15,-5
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1205, 1]
type = TargetBind
trigger1 = time%10=0
pos = -25, -75
postype = P1
time = -1

[State 1205, 1]
type = TargetBind
trigger1 = time%10=5
pos = -22, -75
postype = P1
time = -1

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 1206

;crash after dash
[Statedef 1206]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 1204

[State 1206, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 1206, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 1206, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 1206, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,3

[State 1206, Fire1]
type = Explod
trigger1 = AnimElem = 2
Anim = 1290
pos = 90,-77
postype = p1
ownpal = 1
sprpriority = 5
supermovetime = -1
removeongethit = 1
scale = .65,.65

[State 1206, Fire1]
type = Explod
trigger1 = AnimElem = 2
Anim = 8111
id = 8111
pos = 85,-77
postype = p1
ownpal = 1
sprpriority = 0
supermovetime = -1
removeongethit = 1
removetime = 20
scale = .75,75

[State 1206, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 8111
scale = .35,.15+((time-6)*.0575)
trans = addalpha
alpha = 350-((time-6)*18),256

[State 1206, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45, -77
Time = -1
postype = P1

[State 1206, 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 95, -77
Time = -1
postype = P1
ignorehitpause = 1

[State 1206, Throw]
type = TargetState
triggerall = numtarget
triggerall = target,stateno != 1208
trigger1 = animelem = 3
value = 1208

[State 1206, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 1206, HitDef 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 47 < 7, 7, fvar(11) * 47)), 15
snap = 95,0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -6, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10 + 0 * (var(35) := 167), var(36) := -72
palfx.color = 32
palfx.sinadd = 80,25,0,8
palfx.mul = 512,256,128
palfx.time = 60 * var(9)
chainID = 1200

[State 1206, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p2grabbed, dashing
[Statedef 1207]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1207, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1207, 1]
type = changeanim2
trigger1 = time = 0
value = 1207

;p2grabbed, falling
[Statedef 1208]
type = A
movetype = H
physics = N
velset = -6,-7.5
ctrl = 0
sprpriority = -1

[State 1208, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 1208, 1]
type = changeanim2
trigger1 = time = 0
value = 1208

[State 1208, Vel]
type = veladd
trigger1 = 1
y = .6

[State 1208, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 1208, ChangeState]
type = selfstate
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100

;====<EX GOD PRESS>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1220
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
var(25) = 171

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

[State 1230, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 1230, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 1230, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 4,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 1230, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 13
value = 100,0
channel = 19

[State 1230, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 || AnimElem = 17
value = 100,1
channel = 20

[State 1230, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 0
x = 6.5

[State 1230, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 1
x = 7.5

[State 1230, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 1
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1230
Kill = 0

[State 1230, 1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1

[State 1230, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 1234
persistent = 0

[State 1230, 3]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 0
trigger4 = moveguarded
value = 1201
ctrl = 0

;crash wall
[Statedef 1234]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1202

[State 1234, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 1234, Throw]
type = TargetState
trigger1 = time = 0
value = 1207

[State 1234, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1234, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1234, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 1234, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -25, -75
postype = P1
time = -1

[State 1234, Velocity]
type = VelSet
trigger1 = Time = 0
x = 11
y = -.9

[State 1234, VelAdd]
type = veladd
trigger1 = 1
y = .09

[State 1234, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 1236

[State 1234, 1]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 1235

;dash
[Statedef 1235]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1203

[State 1235, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,1
channel = 4

[State 1235, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 1235, Velocity]
type = VelSet
trigger1 = Time = 0
x = 13.5

[State 1235, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -15,-5
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1235, 1]
type = TargetBind
trigger1 = time%10=0
pos = -25, -75
postype = P1
time = -1

[State 1235, 1]
type = TargetBind
trigger1 = time%10=5
pos = -22, -75
postype = P1
time = -1

[State 1235, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 1236

;crash after dash
[Statedef 1236]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 1204

[State 1236, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 1236, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 1236, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 1236, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 1236, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,2

[State 1236, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,2

[State 1236, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,3

[State 1236, Fire1]
type = Explod
trigger1 = AnimElem = 2
Anim = 1290
pos = 90,-77
postype = p1
ownpal = 1
sprpriority = 5
supermovetime = -1
removeongethit = 1
scale = .65,.65

[State 1236, Fire1]
type = Explod
trigger1 = AnimElem = 2
Anim = 8111
id = 8111
pos = 85,-77
postype = p1
ownpal = 1
sprpriority = 0
supermovetime = -1
removeongethit = 1
removetime = 20
scale = .75,75

[State 1236, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 8111
scale = .35,.15+((time-6)*.0575)
trans = addalpha
alpha = 350-((time-6)*18),256

[State 1236, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45, -77
Time = -1
postype = P1

[State 1236, 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 95, -77
Time = -1
postype = P1
ignorehitpause = 1

[State 1206, Throw]
type = TargetState
triggerall = numtarget
triggerall = target,stateno != 1208
trigger1 = animelem = 3
value = 1208

[State 1236, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 1236, HitDef 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 0
snap = 95,0
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -6, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10 + 0 * (var(35) := 167), var(36) := -72
palfx.color = 32
palfx.sinadd = 80,25,0,8
palfx.mul = 512,256,128
palfx.time = 60 * var(9)
chainID = 1230

[State 1236, p2fx]
type = helper
trigger1 = movehit && numtarget && numhelper(8180) < 1
trigger1 = !(target,time) && (target,movetype = H)
helpertype = normal
stateno = 8180
ID = 8180
name = "p2fx"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 1236, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=<KAISER WAVE>==
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

[State 1300, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 1
value = 1300,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1300, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 10
value = 1300,ifElse(var(40) = 1, 11, 1)
channel = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = animelem = 30
trigger2 = anim = 1304
trigger2 = animelem = 2
value = 1300,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 1300, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 10
value = 1300,3
channel = 1

[State 1300, Width]
type = Width
trigger1 = anim = 1300
trigger1 = animelem = 29
trigger2 = anim = 1304
trigger2 = animelem = 1
player = 15,0

[State 1300, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 0
v = 10
value = 1

[State 1300, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 42
v = 10
value = 2

[State 1300, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 66
v = 10
value = 3

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = command != "holdp"
trigger1 = time = [19,84]
trigger1 = anim = 1300
trigger2 = (anim = 1300) && (animelemtime(28) = 3)
value = 1304

[State 1300, Helper]
type = Helper
trigger1 = anim = 1300
trigger1 = animelem = 30
trigger2 = anim = 1304
trigger2 = animelem = 2
helpertype = normal
name = "wave"
ID = 1305
stateno = 1305
pos = 95,-75
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 5
supermove
pausemove
size.xscale =.5
size.yscale =.5

[State 1300, Helper]
type = Helper
trigger1 = anim = 1300
trigger1 = animelem = 6
helpertype = normal
name = "handfx"
ID = 1315
stateno = 1315
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 5
supermove
pausemove

[State 1300, end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====<EX KAISER WAVE>=
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

[State 1330, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 4

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
var(25) = 124

[State 1330, EX FX]
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

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 1
value = 1300,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1330, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 10
value = 1300,ifElse(var(40) = 1, 11, 1)
channel = 4

[State 1330, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = animelem = 30
trigger2 = anim = 1304
trigger2 = animelem = 2
value = 1300,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 1330, Voice]
type = PlaySnd
trigger1 = anim = 1300
trigger1 = AnimElem = 10
value = 1300,3
channel = 4

[State 1330, Width]
type = Width
trigger1 = anim = 1300
trigger1 = animelem = 29
trigger2 = anim = 1304
trigger2 = animelem = 1
player = 15,0

[State 1330, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 0
v = 10
value = 1

[State 1330, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 42
v = 10
value = 2

[State 1330, VarSet]
type = VarSet
trigger1 = anim = 1300
trigger1 = time = 66
v = 10
value = 3

[State 1330, ChangeAnim]
type = ChangeAnim
trigger1 = command != "holdp"
trigger1 = time = [19,84]
trigger1 = anim = 1300
trigger2 = (anim = 1300) && (animelemtime(28) = 3)
value = 1304

[State 1330, Helper]
type = Helper
trigger1 = anim = 1300
trigger1 = animelem = 30
trigger2 = anim = 1304
trigger2 = animelem = 2
helpertype = normal
name = "wave"
ID = 1305
stateno = 1335
pos = 95,-75
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 5
supermove
pausemove
size.xscale =.5
size.yscale =.5

[State 1330, Helper]
type = Helper
trigger1 = anim = 1300
trigger1 = animelem = 6
helpertype = normal
name = "handfx"
ID = 1315
stateno = 1315
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 5
supermove
pausemove

[State 1330, end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====<BEADS DESTRUCTION>=
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

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))

[State 1400, Width]
type = Width
trigger1 = 1
edge = 10,0
player = 10,0

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 1400, VelSet]
type = VelSet
trigger1 = animelem = 5
x = ifElse(var(10) = 2, 12, ifElse(var(10) = 1, 10, 9))

[State 1400, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 1400, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 8
statetype = S
movetype = A
physics = S

[State 1400, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -15,-5
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, Voice]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
value = 4,2
channel = 0

[State 1400, Voice]
type = PlaySnd
trigger1 = animelem = 13
value = 4,1
channel = 0

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 13
value = 1100,1
channel = 1

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 13
value = 1,4

[State 1400, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1491
ID = 1491
pos = 120,-90
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1400, Explod]
type = Explod
trigger1 = animelem = 10
anim = 1492
ID = 1490
pos = 15,-60
postype = p1
bindtime = 1
vfacing = -1
removetime = -2
supermove
pausemove
vel = 0,1
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1400, Explod]
type = Explod
trigger1 = animelem = 13
anim = 1492
ID = 1490
pos = 50,-140
postype = p1
bindtime = 1
facing = -1
removetime = -2
supermove
pausemove
vel = .2,-1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1400, Explod]
type = Explod
trigger1 = animelem = 21
anim = 1490
ID = 1490
pos = 70,-5
postype = p1
bindtime = 1
vfacing = -1
facing = -1
removetime = -2
supermove
pausemove
vel = .2,1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -2.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -1.36, -2.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yaccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := ifElse(var(10) = 2, -70, ifElse(var(10) = 1, -70, -70))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -2.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -1.36, -2.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yaccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifElse(var(10) = 2, -85, ifElse(var(10) = 1, -85, -85))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 6)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -0.36, -0.52), -13.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -0.36, -0.52), -13.5
air.cornerPush.velOff = 0
yaccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifElse(var(10) = 2, -120, ifElse(var(10) = 1, -120, -120))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, PosAdd]
type = PosAdd
trigger1 = Animelem = 7
x = 25

[State 1400, PosAdd]
type = PosAdd
trigger1 = Animelem = 21
x = 6

[State 1400, PosAdd]
type = PosAdd
trigger1 = Animelem = 12
x = 20

[State 1400, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 15
movetype = I

[State 1400, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX BEADS DESTRUCTION>=
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1430
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
var(25) = 131

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

[State 1400, Voice]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
value = 4,2
channel = 0

[State 1400, Voice]
type = PlaySnd
trigger1 = animelem = 13
trigger2 = animelem = 22
value = 4,1
channel = 0

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 22
value = 1100,1
channel = 2

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 22
value = 1,4

[State 1430, Width]
type = Width
trigger1 = 1
edge = 10,0
player = 10,0

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1430, VelSet]
type = VelSet
trigger1 = animelem = 5
x = 12

[State 1430, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 1430, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 8
statetype = S
movetype = A
physics = S

[State 1430, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = -15,-5
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, Explod]
type = Explod
trigger1 = animelem = 5
anim = 1491
ID = 1491
pos = 120,-90
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1430, Explod]
type = Explod
trigger1 = animelem = 10
anim = 1492
ID = 1490
pos = 15,-60
postype = p1
bindtime = 1
vfacing = -1
removetime = -2
supermove
pausemove
vel = 0,1
scale = .5,.5
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1430, Explod]
type = Explod
trigger1 = animelem = 13
anim = 1492
ID = 1490
pos = 50,-140
postype = p1
bindtime = 1
facing = -1
removetime = -2
supermove
pausemove
vel = .2,-1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1430, Explod]
type = Explod
trigger1 = animelem = 21
anim = 1490
ID = 1490
pos = 65,-5
postype = p1
bindtime = 1
vfacing = -1
facing = -1
removetime = -2
vel = .2,1
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.52
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yaccel = .6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 10
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.52
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yaccel = .6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 4), ifElse(var(20), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.52, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -0.52, -7.5
air.cornerPush.velOff = 0
yaccel = .6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 22
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, PosAdd]
type = PosAdd
trigger1 = Animelem = 7
x = 25

[State 1430, PosAdd]
type = PosAdd
trigger1 = Animelem = 21
x = 6

[State 1430, PosAdd]
type = PosAdd
trigger1 = Animelem = 12
x = 20

[State 1430, PosAdd]
type = PosAdd
trigger1 = Animelem = 25
x = 9

[State 1430, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 24
movetype = I

[State 1430, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=<DARK BARRIER>==
[StateDef 1500]
type = S
physics = S
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
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 0

[State 1500, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0

[State 1500, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal
name = "fx"
ID = 1505
stateno = 1505
pos = 68,-55
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 4

[State 1500, End]
type = Changestate
trigger1 = Time >= 15 && !numhelper(1505)
trigger2 = !var(10) && time = 60
trigger3 = var(10) = 1 && time = 83
trigger4 = var(10) = 2 && time = 95
value = 1501

;Reflector End
[Statedef 1501]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1501
velset = 0,0

[State 1501, End]
type = Changestate
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX DARK BARRIER>=
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1530
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

[State 1530, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 0

[State 1530, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0

[State 1530, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal
name = "fx"
ID = 1535
stateno = 1535
pos = 68,-55
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 4

[State 1530, End]
type = Changestate
trigger1 = Time >= 15 && !numhelper(1535)
trigger2 = time = 105
value = 1531

;Reflector End
[Statedef 1531]
type = S
movetype = I
physics = S
ctrl = 0
anim = 1531
velset = 0,0

[State 1501, End]
type = Changestate
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<DARK SMASH>=
[StateDef 1600]
type = A
physics = N
moveType = A
anim = 1650
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1670, ifElse(var(10) = 1, 1660, 1650))

[State 1600, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 1600, Voice]
type = PlaySnd
trigger1 = animelem = 7
value = 4,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 1600, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1650,0
channel = 1

[State 1600, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1650,1
channel = 1

[State 1600, Effect]
type = PlaySnd
trigger1 = animelem = 7
value = 1300,4

[State 1600, Velocity]
type = VelSet
trigger1 = animelem = 7
x = 7+(var(10)+1)
y = 4.5

[State 1600, Explod]
type = Explod
trigger1 = animelem = 7
anim = 1692
ID = 1692
pos = 71,-51
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1600, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "electricidad"
ID = 1690
stateno = 1690
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemove

[State 1600, p2fx]
type = helper
trigger1 = movehit && numtarget && numhelper(7300)<1
trigger1 = !(target,time) && (target,movetype=H)
helpertype = normal
stateno = 7300
ID = 7300
name = "p2fx"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 52, FX Remove]
type = RemoveExplod
trigger1 = Time = 0
id = 1692
ignorehitpause = 1

[State 1600, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palfx.time = 40
palfx.add = 10,10,100
palfx.sinadd = -20,-20,-89,8
palfx.color = 20

[State 1600, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1601

;Land
[Statedef 1601]
type = S
physics = S
ctrl = 0
anim = 1651
velset = 2,0

[State 1601, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 1692

[State 1601, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1601, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1601, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1601, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX DARK SMASH>=
[StateDef 1630]
type = A
physics = N
moveType = A
anim = 1680
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1630, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1630, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1630, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1630, EX FX]
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

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 1600, Voice]
type = PlaySnd
trigger1 = animelem = 7
value = 4,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 1600, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1650,0
channel = 2

[State 1600, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1650,1
channel = 2

[State 1600, Effect]
type = PlaySnd
trigger1 = animelem = 7
value = 1300,4

[State 1630, Velocity]
type = VelSet
trigger1 = animelem = 7
x = 8+(var(10)+1)
y = 4.5

[State 1630, Explod]
type = Explod
trigger1 = animelem = 7
anim = 1692
ID = 1692
pos = 71,-51
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1630, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "electricidad"
ID = 1690
stateno = 1690
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemove

[State 1630, p2fx]
type = helper
trigger1 = movehit && numtarget && numhelper(7300)<1
trigger1 = !(target,time) && (target,movetype=H)
helpertype = normal
stateno = 7300
ID = 7300
name = "p2fx"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 1630, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 47 < 7, 7, fvar(11) * 47)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -8.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palfx.time = 40
palfx.add = 10,10,100
palfx.sinadd = -20,-20,-89,8
palfx.color = 20

[State 1630, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palfx.time = 40
palfx.add = 10,10,100
palfx.sinadd = -20,-20,-89,8
palfx.color = 20

[State 1630, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1601

;=<RUGAL EXECUTION>==
[StateDef 1700]
type = S
movetype = I
physics = N
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1700, Button Detect]
type = VarSet
trigger1 = PrevStateNo = 751 && var(40) = 1
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 1, ifElse((command = "b" || command = "rlsb"), 1, 1))

[State 1700, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751 && var(40) = 1
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1700, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1700, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 1700, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 4,10
channel = 0

[State 1700, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0

[State 1700, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 1700, End]
type = ChangeState
trigger1 = var(10) = 0 && Time = 14
trigger2 = var(10) = 1 && Time = 16
trigger3 = var(10) = 2 && Time = 19
value = 1701
ctrl = 0

;=<RUGAL EXECUTION>==
[Statedef 1701]
type = S
movetype = A
physics = N
juggle = ifelse((p2movetype = H && p2statetype = A),7,8)
velset = 13,0
ctrl = 0
anim = 1810
sprpriority = 1

[State 1701, Position]
type = PosAdd
trigger1 = !Time
x = 11

[State 1701, Explod]
type = Explod
trigger1 = !Time
anim = 1890
ID = 1890
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 5
scale = 1*const(size.xscale),1*const(size.yscale)
sprpriority = 0
ownpal = 0
removeongethit = 1

[State 1701, Explod]
type = Explod
trigger1 = Time = 5
anim = 1891
ID = 1891
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 1*const(size.xscale),1*const(size.yscale)
sprpriority = 0
ownpal = 0
removeongethit = 1

[State 1701, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
trigger1 = !Time
attr = S, ST
animtype = Hard
air.animtype = Back
hitflag = M
priority = 3, Hit
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -66
guard.dist = 0
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
ground.velocity = 0
air.velocity = 0,0
fall = 0
air.fall = 1
air.fall.recover = 0
forcestand = 1
ID = 1700
p1stateno = 1702

[State 1701, 2]
type = ChangeState
trigger1 = Time > IfElse(var(10)=0,5,IfElse(var(10)=1,9,IfElse(var(10)=2,13,17)))
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist x <= 0
trigger4 = MoveGuarded
value = 1711
ctrl = 0

;=<RUGAL EXECUTION>==
[Statedef 1711]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1811

[State 1711, RemoveExplod]
type = RemoveExplod
trigger1 = !Time

[State 1711, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,11
channel = 0

[State 1711, Effect]
type = PlaySnd
trigger1 = !Time
value = 1,2

[State 1711, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<RUGAL EXECUTION>==
[Statedef 1702]
type = S
movetype = A
physics = N
anim = 1820
ctrl = 0
velset = 0,0

[State 1702, PosSet]
type = PosSet
trigger1 = !Time && NumTarget(1700)
x = (target, pos x)-(50*facing)
ignorehitpause = 1

[State 1702, RemoveExplod]
type = RemoveExplod
trigger1 = !Time

[State 1702, PosAdd]
type = PosAdd
trigger1 = !Time
x = -5

[State 1702, TargetState]
type = TargetState
trigger1 = !Time
value = 1704
ID = 1700

[State 1702, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,11
channel = 0

[State 1702, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3200,1
persistent = 0
channel = 3

[State 1702, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 6120
ID = 6120
pos = 5,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = .5*const(size.xscale),.5*const(size.yscale)
sprpriority = -7
removeongethit = 1
ownpal = 1
persistent = 0

[State 1702, TargetBind1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 50,0
time = 7
ID = 1700

[State 1702, TargetBind1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 52,-145
time = 2
ID = 1700

[State 1702, TargetBind1]
type = TargetBind
trigger1 = AnimElemTime(3) > 0
pos = 52+time%2,-138-time%2
time = 1
ID = 1700

[State 1702, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(3)>0 && Time%2 = 0
value = -1
ID = 1700
kill = 0

[State 1702, ChangeState]
type = ChangeState
trigger1 = var(10) = 0 && Time = 60
trigger2 = var(10) = 1 && Time = 80
trigger3 = var(10) = 2 && Time = 100
trigger4 = var(10) = 3 && Time = 120
value = 1703
ctrl = 0

;=<RUGAL EXECUTION>==
[Statedef 1703]
type = S
movetype = A
physics = N
anim = 1830
ctrl = 0
velset = 0,0

[State 1703, Safety]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 1

[State 1703, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 3

[State 1703, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,12
channel = 0

[State 1703, Helper]
type = Helper
trigger1 = !Time
helpertype = normal
name = "P2 Red Flames"
ID = 8180
stateno = 8180
pos = 0,-57
postype = p2
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[State 1703, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = -87
ID = 1700
kill = 1

[State 1703, TargetState]
type = TargetState
trigger1 = !Time
value = 1705
ID = 1700

[State 1703, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 6120

[State 1703, Fire]
type = Explod
trigger1 = AnimElem = 1
anim = 1290
pos = 70,-129
postype = p1
ownpal = 1
sprpriority = 5
removetime = -2
scale = .65*const(size.xscale),.65*const(size.yscale)
bindtime = 1

[State 1703, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1800,0

[State 1703, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = 25

[State 1703, TargetBind1]
type = TargetBind
trigger1 = AnimElem = 1
pos =  68,-66
time = 1

[State 1703, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<RUGAL EXECUTION>==
[Statedef 1704]
type = A
movetype = H
physics = N

[State 1704, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 1704, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1704, SelfState]
type = SelfState
trigger1 = Enemynear, Name = "GodRugal" && enemynear, authorname = "Hero" && Enemynear, StateNo != [1700,1799]
value = 5100

[State 1704, Turn]
type = Turn
trigger1 = Facing = EnemyNear, Facing

[State 1704, SprPriority]
type = SprPriority
trigger1 = 1
value = 3

[State 1704, ChangeAnim]
type= ChangeAnim2
trigger1 = Anim !=1840
value = 1840

[State 1704, PalFX]
type = PalFX
trigger1 = 1
time = 1
add = IfElse((enemynear,palno!=8),time,0),0,IfElse((enemynear,palno=8),time,0)
color = 256

[State 1704, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

;=<RUGAL EXECUTION>==
[Statedef 1705]
type = A
movetype = H
physics = N
velset = -4, -8

[State 1705, PalFX]
type = PalFX
trigger1 = !Time
color = 32
sinadd = 80,25,0,8
mul = 512,256,128
time = 35
ignorehitpause = 1

[State 1705, ChangeAnim]
type= ChangeAnim2
trigger1 = Anim != 1850
value = 1850

[State 1705, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 1705, VelAdd]
type = VelAdd
trigger1 = 1
y = .6

[State 5200, 1] ;Recover Near Ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_GROUND RECOVER

[State 1705, SelfState]
type = SelfState
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 5100

;=<EX RUGAL EXECUTION>==
[StateDef 1730]
type = S
movetype = I
physics = N
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1730, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1730, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1730, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1730, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 184

[State 1730, EX FX]
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

[State 1730, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1730, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1730, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 4,10
channel = 0

[State 1700, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0

[State 1730, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 1730, 2]
type = ChangeState
trigger1 = Time = 22
value = 1701
ctrl = 0

;=<GOD LANE>==
[Statedef 1800]
type = S
physics = N
movetype = I
anim = 1900
velset = 0,0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1800, strengthvar]
type = varset
trigger1 = !Time && !AILevel
var(10) = ifelse(command = "GodLaneFwd1", 2, ifelse(command = "GodLaneFwd2", 1 , ifelse(command = "GodLaneBack1", -2, -1)))

[State 1800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1800, afterimage]
type = afterimage
trigger1 = animelem = 3
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 2 || var(10) = -2), 24, 18)
palbright = 0,0,0
paladd = 0,0,0
palmul = .9,.9,.9
palcontrast = 160,160,160
palpostbright = 0,0,0
trans = add1

[State 1800, AfterImageTime]
type = AfterImageTime
trigger1 = 1
time = 2

[State 1800, Vel]
type =  velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 2, -7, ifelse(var(10) = 1, -4, ifelse(var(10) = -2, 7, 4))) *sin ((time -2) / 2)

[State 1800, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(var(10) = 2, 14, ifelse(var(10) = 1, 9, ifelse(var(10) = -2, -14, -9)))

[State 1800, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 2 || var(10) = -2), 16, 9)
trigger2 = animelemtime(7) > ifelse((var(10) = 2 || var(10) = -2), 16, 9)
x = .9

[State 1800, Voice]
type = playsnd
trigger1 = !Time
value = 1100,11
persistent = 0
channel = 0

[State 1800, Effect]
type = playsnd
trigger1 = animelem = 6
value = 1900,0
persistent = 0

[State 1800, push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0
ignorehitpause = 1

[State 1800, nothitby]
type = nothitby
triggerall = (animelemtime(6) <= ifelse((var(10) = 2 || var(10) = -2), 35, 20) || animelemtime(7) <= ifelse((var(10) = 2 || var(10) = -2), 35, 20))
trigger1 = animelemtime(6) < 0 || animelemtime(7) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 2 || var(10) = -2), 14, 9)
trigger3 = vel x > 0 && frontedgebodydist> ifelse((var(10) = 2 || var(10) = -2), 14, 9)
value = SCA,AA,AP,AT
time = 1
ignorehitpause = 1

[State 1800, Turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1800, End]
type = changestate
trigger1 = animelemtime(6) = ifelse((var(10) = 2 || var(10) = -2), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
trigger4 = animelemtime(7) = ifelse((var(10) = 2 || var(10) = -2), 40, 25)
trigger5 = animelemtime(7) > 0 && vel x < 0 && backedgebodydist <= 0
trigger6 = animelemtime(7) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 0
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
facep2 = 1

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
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
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 169), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
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
facep2 = 1

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,ifElse(var(40) = 1, 12, 2)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2, -4
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
