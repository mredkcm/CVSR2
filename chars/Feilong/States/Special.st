; _________________________________________
;| Feilong by varo_hades                  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<REKKAKEN>==
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

[State 220, Vel]
type = VelSet
triggerall = var(10) = 0
trigger1 = Time = 0
x = 6

[State 220, Vel]
type = VelSet
triggerall = var(10) = 1
trigger1 = Time = 0
x = 10

[State 220, Vel]
type = VelSet
triggerall = var(10) = 2
trigger1 = Time = 0
x = 14

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1, 2

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 1
channel = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.36, -6.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, Rekkaken]
type = ChangeState
value = 1001
triggerall = AnimElemTime(2) >= 0
triggerall = AnimElemTime(5) <= 0
trigger1 = command = "Rekkaken"
trigger2 = AILevel
trigger2 = MoveContact && Random %8

[State 1000, Rekkaken]
type = ChangeState
value = 1001
triggerall = Time >= 10
trigger1 = command = "Rekkaken"

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<REKKAKEN SECOND IMPACT>==
[StateDef 1001]
type = S
physics = S
moveType = A
anim = 1001
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 220, Vel]
type = VelSet
triggerall = var(10) = 0
trigger1 = Time = 0
x = 6

[State 220, Vel]
type = VelSet
triggerall = var(10) = 1
trigger1 = Time = 0
x = 10

[State 220, Vel]
type = VelSet
triggerall = var(10) = 2
trigger1 = Time = 0
x = 14

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1, 2

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 4
channel = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.36, -6.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, Rekkaken]
type = ChangeState
value = 1002
triggerall = AnimElemTime(2) >= 0
triggerall = AnimElemTime(5) <= 0
trigger1 = command = "Rekkaken"
trigger2 = AILevel
trigger2 = MoveHit && Random %8

[State 1000, Rekkaken]
type = ChangeState
value = 1002
triggerall = Time >= 10
trigger1 = command = "Rekkaken"

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<REKKAKEN THIRD IMPACT>==
[StateDef 1002]
type = S
physics = S
moveType = A
anim = 1002
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 220, Vel]
type = VelSet
triggerall = var(10) = 0
trigger1 = Time = 0
x = 8

[State 220, Vel]
type = VelSet
triggerall = var(10) = 1
trigger1 = Time = 0
x = 12

[State 220, Vel]
type = VelSet
triggerall = var(10) = 2
trigger1 = Time = 0
x = 16

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1, 2

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 2
channel = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, 5]
type = ChangeState
trigger1 = Time = 40
value = 0
ctrl = 1

;====<EX REKKAKEN>=
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
var(25) = 34

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
channel = 0

[State 220, Vel]
type = VelSet
trigger1 = Time = 0
x = 16

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 0
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 1
channel = 2

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 1005
ID=1005
sprpriority = 2
postype = p1
pos = -49,-98
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall.recover = 1
air.fall = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
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

[State 1000, Rekkaken]
type = ChangeState
value = 1031
triggerall = AnimElemTime(2) >= 0
triggerall = AnimElemTime(5) <= 0
trigger1 = command = "EXRekkaken"
trigger2 = AILevel
trigger2 = MoveContact && Random %8

[State 1000, Rekkaken]
type = ChangeState
value = 1031
triggerall = Time >= 10
trigger1 = command = "EXRekkaken"

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<EX REKKAKEN SECOND IMPACT>==
[StateDef 1031]
type = S
physics = S
moveType = A
anim = 1001
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 220, Vel]
type = VelSet
trigger1 = Time = 0
x = 16

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 4
channel = 1

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 1006
ID=1006
sprpriority = 2
postype = p1
pos = -49,-98
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6.52
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall.recover = 1
air.fall = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
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

[State 1000, Rekkaken]
type = ChangeState
value = 1032
triggerall = AnimElemTime(2) >= 0
triggerall = AnimElemTime(5) <= 0
trigger1 = command = "EXRekkaken"
trigger2 = AILevel
trigger2 = MoveHit && Random %8

[State 1000, Rekkaken]
type = ChangeState
value = 1032
triggerall = Time >= 10
trigger1 = command = "EXRekkaken"

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<EX REKKAKEN THIRD IMPACT>==
[StateDef 1032]
type = S
physics = S
moveType = A
anim = 1002
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 220, Vel]
type = VelSet
trigger1 = Time = 0
x = 16

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, 0]
type = Width
trigger1 = Time < 20
value = 20,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000, 0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 2
channel = 1

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 1007
ID=1007
sprpriority = 2
postype = p1
pos = -49,-98
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
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

[State 1000, 5]
type = ChangeState
trigger1 = Time = 40
value = 0
ctrl = 1

;====<SHIENKYAKU>=
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
trigger1 = PrevStateNo = 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 1, ifElse((command = "b" || command = "rlsb"), 1, 1))

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751
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

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = !var(10)
trigger1 = time >= 9
statetype = A
movetype = A
physics = N

[State 0, PlaySnd]
type = PlaySnd
triggerall = !var(10)
trigger1 = animelem = 4
value = 1100,0

[State 1200,1]
type = PlaySnd
triggerall = !var(10)
trigger1 = animelem = 6
value = 1100,1

[State 1200,1]
type = PlaySnd
triggerall = !var(10)
trigger1 = animelem = 5
trigger2 = animelem = 9
value = 1,5

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = animelem = 5
value = 1100,0

[State 1200,1]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = animelem = 6
value = 1100,1

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = animelem = 5
value = 1100,0

[State 1200,1]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = animelem = 6
value = 1100,1

[State 1100, Dust Helper]
type = Helper
triggerall = !var(10)
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 0,Explod]
type = Explod
triggerall = !var(10)
trigger1 = time = 6
anim = 1105
ID = 1105
sprpriority = 2
postype = p1
pos = 0,-60
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
triggerall = var(10) = 1
trigger1 = time = 6
ID = 1106
anim = 1106
sprpriority = 2
postype = p1
pos = 0,-60
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 0,Explod]
type = Explod
triggerall = var(10) = 2
trigger1 = time = 6
ID = 1106
anim = 1106
sprpriority = 2
postype = p1
pos = 0,-60
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = var (10) = 0
trigger1 = Time = 0
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 64 < 7, 7, fvar(11) * 64)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -2.52), -10.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.52), -10.5
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = var (10) = 1
trigger1 = Animelem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -1.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -1.36, -1.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.52), -11
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = var (10) = 2
trigger1 = Animelem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -1.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -1.36, -1.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.52), -12
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = var(10) = 0
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

[State 1130, Flame Particles]
type = Helper
trigger1 = var(10) = [1,2]
trigger1 = AnimElemTime(5) > 0
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

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 0
x = 0

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 9
x = 0
y = -8

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 11
y = -6

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 13
y = -3

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 15
y = -1

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 19
y = 0

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 22
y = 1

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 25
y = 2

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 28
y = 4

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 31
y = 6

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 34
y = 8

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >= 37
y = 10

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >=6
x = 10

[State 0, VelSet]
type = VelSet
triggerall = !var(10)
trigger1 = time >=8
x = 0

[State 0, VelSet]
type = VelSet
triggerall = var(10) = 1
trigger1 = time >= 6
x = 16

[State 0, VelSet]
type = VelSet
triggerall = var(10) = 1
trigger1 = time >= 8
x = 2

[State 0, VelSet]
type = VelSet
triggerall = var(10) = 2
trigger1 = time >= 6
x = 21

[State 0, VelSet]
type = VelSet
triggerall = var(10) = 2
trigger1 = time >= 8
x = 4

[State 0,ChangeState]
type = ChangeState
triggerall = !var(10)
trigger1 = time >= 11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1101
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(10) = 1
trigger1 = time = 9
value = 1110
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(10) = 2
trigger1 = time = 9
value = 1120
ctrl = 0

;====<SHIENKYAKU MEDIUM AIR>=
[StateDef 1110]
type = A
physics = N
moveType = A
anim = 1111
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,5

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 5
value = 1,5

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = Time = 0
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.36, -2.52), -12.5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.52), -12.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) > 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >=0
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >=8
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >=14
x = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1101
ctrl = 0

;====<SHIENKYAKU STRONG AIR>=
[StateDef 1120]
type = A
physics = N
moveType = A
anim = 1121
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,5

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 5
value = 1,5

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = Time = 0
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.36, -2.52), -13
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.52), -13
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) > 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -9

[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = 7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >=0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >=8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >=14
x = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1101
ctrl = 0

;Landing
[StateDef 1101]
type = S
anim = 1101
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX SHIENKYAKU>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1120
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
var(25) = 51

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

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = !var(10)
trigger1 = time >= 9
statetype = A
movetype = A
physics = N

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1100,0

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 6
value = 1100,1

[State 1130, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Somersault Kick Dust"
posType = P1
ownPal = 1

[State 0,Explod]
type = Explod
trigger1 = time = 6
ID = 1106
anim = 1106
sprpriority = 2
postype = p1
pos = 0,-60
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1130, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = Time = 0
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.52
ground.cornerPush.velOff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -30
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) > 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 6

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 9
value = 1131
ctrl = 0

;====<EX SHIENKYAKU AIR>=
[StateDef 1131]
type = A
physics = N
moveType = A
anim = 1121
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,5

[State 1200,1]
type = PlaySnd
trigger1 = animelem = 5
value = 1,5

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = Animelem = 1
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.52, -11
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -2.52, -11
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = Animelem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 5 * var(9)
ground.slideTime = 17 + 5 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.52, -11
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -1.52, -11
air.cornerPush.velOff = 0
yAccel = .6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -60
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) > 0
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

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -12

[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = 7

[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time >=0
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >=8
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time >=14
x = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1101
ctrl = 0

;====<REKKUKYAKU>=
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

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 20

[State 1200, 3]
type = ChangeState
trigger1 = AnimElem = 4
value = 1201

;====<REKKUKYAKU ATTACK>=
[Statedef 1201]
type = A
movetype = A
physics = N
juggle = 8
velset = 0,0
ctrl = 0

[State 220, Vel]
type = VelSet
trigger1 = var(10) = 0
trigger1 = Time = 0
x = 5
y = -6

[State 220, Vel]
type = VelSet
trigger1 = var(10) = 1
trigger1 = Time = 0
x = 7
y = -6

[State 220, Vel]
type = VelSet
trigger1 = var(10) = 2
trigger1 = Time = 0
x = 10
y = -6

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200, 0
channel = 0

[State 1200, VelAdd]
type = VelAdd
trigger1 = var(10) = 0
trigger1 = Vel X > 0
x = -.1

[State 1210, VelAdd]
type = VelAdd
trigger1 = var(10) = 1
trigger1 = Vel X > 0
x = -.15

[State 1210, VelAdd]
type = VelAdd
trigger1 = var(10) = 2
trigger1 = Vel X > 0
x = -.2

[State 1200, VelAdd]
type = VelAdd
trigger1 = 1
y = .4

[State 1200, Anim]
type = ChangeAnim
triggerall = Anim = 1200
trigger1 = Vel Y > 0
value = 1201

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 1
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, End]
type = ChangeState
triggerall = Time > 10
trigger1 = Pos Y >= 0
value = 1202

;Landing
[StateDef 1202]
type = S
anim = 1202
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX REKKUKYAKU>=
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
var(25) = 51

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

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 20

[State 1200, 3]
type = ChangeState
trigger1 = AnimElem = 4
value = 1231

;====<EX REKKUKYAKU ATTACK>=
[Statedef 1231]
type = A
movetype = A
physics = N
juggle = 8
velset = 0,0
ctrl = 0

[State 220, Vel]
type = VelSet
trigger1 = Time = 0
x = 11
y = -6

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200, 0
channel = 0

[State 1210, VelAdd]
type = VelAdd
trigger1 = Vel X > 0
x = -.2

[State 1200, VelAdd]
type = VelAdd
trigger1 = 1
y = .4

[State 1200, Anim]
type = ChangeAnim
triggerall = Anim = 1200
trigger1 = Vel Y > 0
value = 1201

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 1
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, End]
type = ChangeState
triggerall = Time > 10
trigger1 = Pos Y >= 0
value = 1202

;====<REKKUKYAKU 2>=
[StateDef 1300]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 4

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 1305
ctrl = 0

;====<REKKUKYAKU 2 ATTACK>=
[Statedef 1305]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1305
juggle = 5
poweradd = 0

[State 0, VelSet]
type = VelSet
trigger1 =animelem=1
x = ifelse(var(10)=2,10,ifelse(var(10)=1,8,6))
y = -3.5

[State 0, VelSet]
type = VelSet
trigger1 =animelem=5
x = ifelse(var(10)=2,6,ifelse(var(10)=1,5,4))
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem=12
y = ifelse(var(10)=2,6,ifelse(var(10)=1,5,4))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem =6
value = 1200,0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = A, ST
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -4.36, -6.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -4.36, -6.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -6.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 12
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 15
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=1
trigger1 = pos Y >=20 && vel Y > 0
value = 1310
ctrl = 0

;====<EX REKKUKYAKU 2>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1300
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
var(25) = 51

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

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 6

[State 1100, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 1335
ctrl = 0

;====<EX REKKUKYAKU 2 ATTACK>=
[Statedef 1335]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1305
juggle = 5
poweradd = 0

[State 0, jump up explode]
type = Explod
trigger1 = animelem = 10
anim = 1310
sprpriority = 2
postype = p1
pos = -70,-140
bindtime = -1
removetime = -2
ignorehitpause = 0
removeongethit = 1
scale = 0.8,0.8
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=1
x = 12
y = -3.5

[State 0, VelSet]
type = VelSet
trigger1 =animelem=5
x = 7
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem=12
y = 7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1300,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem =6
value = 1200,0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = A, ST
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 21 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = .6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 21 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -6.5
air.cornerPush.velOff = 0
yAccel = .6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 12
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 21 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = -6.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = .6
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = time>=1
trigger1 = pos Y >=20 && vel Y > 0
value = 1310
ctrl = 0

;Landing
[StateDef 1310]
type = S
anim = 1301
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<TENSHIN>=
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

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 800, 1]
type = HitDef
triggerall = var(20)
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 3
attr = S, ST
hitflag = MAFD
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1415
fall = 0
fall.recover = 0

[State 800, 1]
type = HitDef
triggerall = !var(20)
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 3
attr = S, ST
hitflag = M-
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1415
fall = 0
fall.recover = 0

[State 800, 1]
type = HitDef
triggerall = !var(20)
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 3
attr = S, ST
hitflag = MF
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1415
fall = 0
fall.recover = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1400,0

[State 850, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;P1 throw 02
[Statedef 1410]
type = S
movetype= A
physics = N
anim = 1410

[State 0, SprPriority]
type = SprPriority
trigger1 = time >=0
value = -2

[State 800,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 60,0
time = 1

[State 0, Posadd]
type = null;Posadd
Trigger1 = FrontEdgeDist <= 65
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 42

[State 0, VelSet]
type = VelSet
trigger1 = time>=20
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=23
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>=26
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = time>=36
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>=42
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=20
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>=23
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>=26
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time>=29
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=32
y=0

[State 0, VelSet]
type = VelSet
trigger1 = time>=35
y=0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=38
y =2

[State 0, VelSet]
type = VelSet
trigger1 = time>=41
y =6

[State 0, ChangeState]
type = ChangeState
Trigger1 = time >=40
Trigger1 = Pos Y >= 0 && vel Y > 0
value = 1411
ctrl = 0

;P1 throw 02
[Statedef 1411]
type = S
movetype= A
physics = N
anim = 1411
velset=0,0

[State 0, VelSet]
type = VelSet
trigger1 =1
x = 0
y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 0, PosAdd]
type = PosAdd
trigger1 = time= 8
x = 40

[State 0, Turn]
type = Turn
trigger1 = time= 11
persistent =  0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;P2 throw 02
[Statedef 1415]
type = S
movetype= H
physics = N
velset = 0,0

[State 1502, HitFallSet]
type = HitFallSet
Trigger1 = !Time
value = 0

[State 1502, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=8
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=14
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
x = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1430

[State 0, selfstate]
type = selfstate
Trigger1 = animtime = 0
value = 0
ctrl = 1

;====<EX TENSHIN>=
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
var(25) = 51

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

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 800, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 3
attr = S, ST
hitflag = M-
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p2facing = 1
p1stateno = 1440
p2stateno = 1445
fall = 0
fall.recover = 0

[State 800, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 3
attr = S, ST
hitflag = MF
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p2facing = 1
p1stateno = 1440
p2stateno = 1445
fall = 0
fall.recover = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1400,0

[State 850, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;P1 throw 02
[Statedef 1440]
type = S
movetype= A
physics = N
anim = 1410

[State 0, SprPriority]
type = SprPriority
trigger1 = time >=0
value = -2

[State 800,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 60,0
time = 1

[State 0, Posadd]
type = null;Posadd
Trigger1 = FrontEdgeDist <= 65
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 42

[State 0, VelSet]
type = VelSet
trigger1 = time>=20
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time>=23
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>=26
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = time>=36
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>=42
x = 0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=20
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = time>=23
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = time>=26
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = time>=29
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=32
y=0

[State 0, VelSet]
type = VelSet
trigger1 = time>=35
y=0.5

[State 0, VelSet]
type = VelSet
trigger1 = time>=38
y =2

[State 0, VelSet]
type = VelSet
trigger1 = time>=41
y =6

[State 0, ChangeState]
type = ChangeState
Trigger1 = time >=40
Trigger1 = Pos Y >= 0 && vel Y > 0
value = 1441
ctrl = 0

;P1 throw 02
[Statedef 1441]
type = S
movetype= A
physics = N
anim = 1411
velset=0,0

[State 0, VelSet]
type = VelSet
trigger1 =1
x = 0
y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 0, PosAdd]
type = PosAdd
trigger1 = time= 8
x = 40

[State 0, Turn]
type = Turn
trigger1 = time= 11
persistent =  0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 0
ctrl = 1

;P2 throw 02
[Statedef 1445]
type = S
movetype= H
physics = N
velset = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time>=8
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = time>=14
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = time>=24
x = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1440

[State 0, selfstate]
type = selfstate
Trigger1 = animtime = 0
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
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 2
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
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
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
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
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -58
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
trigger1 = AnimElem = 2
value = 4, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
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
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -4
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(4) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
