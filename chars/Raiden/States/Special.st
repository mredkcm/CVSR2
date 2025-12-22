; _______________________________________
;| Raiden by Knuckles8864                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<GIANT BOMB>==
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
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, HitBy]
type = NotHitBy
trigger1 = AnimElem = 7,< 0
value = SC, NT, ST, HT

[State 1000, VelAdd]
type = VelSet
trigger1 = AnimElem = 7,=1
x = ifElse(var(10) = 0, 25, ifElse(var(10) = 1, 28, 32))

[State 1000, VelMul]
type = VelMul
trigger1 = AnimElem = 7,=1
x = .85

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, HitDef]
type = HitDef
trigger1 = AnimElem = 8
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 126, ifElse(var(10), 112, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 128, ifElse(var(10), 112, 98)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.41, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.41, -8.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,0
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,1
channel = 0

[State 1000, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5

[State 1000, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 41,0

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 9
movetype = I

[State 1000, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1000, Feint]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !AILevel
;trigger1 = command = "a+x"
;command = "a+x"
trigger1 = NumExplod(90000230) && NumExplod(90000200)
var(14) = 1005

[State 1000, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
value = var(14)

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Feint
[Statedef 1005]
type = S
physics = S
movetype= I
ctrl = 0
anim = 1005
velset = 0,0

[State 1005, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX GIANT BOMB>=
[StateDef 1030]
type = S
physics = N
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
var(25) = 78

[State 1030, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 54, -67
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, HitBy]
type = HitBy
trigger1 = AnimElem = 5,< 0
value = SC, NT, ST, HT

[State 1030, VelAdd]
type = VelSet
trigger1 = AnimElem = 4,=1
x = 28

[State 1030, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1030, VelAdd]
type = VelSet
trigger1 = AnimElem = 9,=1
x = 25

[State 1030, VelMul]
type = VelMul
trigger1 = AnimElem = 9,=1
x = .85

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1030, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
value = 41,0

[State 1030, HitDef]
type = HitDef
trigger1 = AnimElem = 5
trigger1 = !var(16) && (var(15) < 1 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
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
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, HitDef]
type = HitDef
trigger1 = AnimElem = 11
trigger1 = !var(16) && (var(15) < 2 || var(20))
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
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
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 61), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,3
channel = 0

[State 1030, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000,1
channel = 0

[State 1030, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5

[State 1030, Juggle Points Reset]
type = VarSet
trigger1 = MoveHit
var(15) = 0

[State 1030, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 12
movetype = I

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<POISON BREATH>=
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
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, Raiden Spitting Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 1

[State 1100, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1105
ID = 1105
name = "Poison Breath Projectile"
posType = P1
pos = ceil(106 * const(size.xScale)), ceil(-96 * const(size.yScale))
size.xScale = 0.5 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 1100, End]
type = ChangeState
trigger1 = NumHelper(1105)
trigger1 = Helper(1105), StateNo = 1107
trigger1 = AnimElemTime(7) >= 0
trigger2 = var(10) = 0 && Time = 36 || var(10) = 1 && Time = 60 || var(10) = 2 && Time = 84
trigger3 = Time >= 101
value = 1101


;Finish
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

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX POISON BREATH>=
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

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 72

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -17, -91
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 0

[State 1130, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1135
ID = 1135
name = "EX Poison Breath Projectile"
posType = P1
pos = ceil(106 * const(size.xScale)), ceil(-97 * const(size.yScale))
size.xScale = 0.5 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 1130, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1130, End]
type = ChangeState
trigger1 = NumHelper(1135)
trigger1 = Helper(1135), StateNo = 1107
trigger1 = AnimElemTime(6) >= 0
trigger2 = var(10) = 3 && Time = 84
trigger3 = Time >= 84
value = 1101



;====<SUPER DROPKICK>=
;Start from 42/337
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

[State 1200, VarSet]
type = VarSet
trigger1 = Time = 0 && var(44) = -1
var(52) = 0

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1200,0
channel = 0

[State 1200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1201


;Start From 337/1011
[StateDef 1210]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1210, VarSet]
type = VarSet
trigger1 = Time = 0 && var(44) = -1
var(52) = 0

[State 1210, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1200,0
channel = 0

[State 1210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1201


;Start From 1011/2358
[StateDef 1220]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1220, VarSet]
type = VarSet
trigger1 = Time = 0 && var(44) = -1
var(52) = 0

[State 1220, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1200,0
channel = 0

[State 1220, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1201


;Start From 2358 or Higher
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1230, VarSet]
type = VarSet
trigger1 = Time = 0 && var(44) = -1
var(52) = 0

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1200,0
channel = 0

[State 1230, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1201


;Super Dropkick (Attack)
[StateDef 1201]
type = A
physics = N
moveType = A
anim = IfElse((PrevStateNo=1220||PrevStateNo=1230),1211,1201)
ctrl = 0
velset = IfElse((PrevStateNo = 1230),17,IfElse((PrevStateNo = 1220),12,IfElse((PrevStateNo = 1210),10,6))),0

[State 1201, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 1
stateType = A
physics = N

[State 1201, VelAdd]
type = PosAdd
trigger1 = Time = 1
y = -10

[State 1201, VelAdd]
type = VelAdd
trigger1 = AnimElem =5,> 0
y = .35

[State 1201,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 1,5

[State 1201,velmul]
type = velmul
trigger1 = 1
x = .95

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = PrevStateNo = 1200
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 83), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = PrevStateNo = 1210
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 125 < 14, 14, fvar(11) * 125)), 14
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 83), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = PrevStateNo = 1220
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 153 < 21, 21, fvar(11) * 153)), 21
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 83), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = PrevStateNo = 1230
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 264 < 28, 28, fvar(11) * 264)), 28
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 83), var(36) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 1201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1201, End]
type = ChangeState
trigger1 = AnimElem =5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1205


;Super Dropkick (Finish)
[StateDef 1205]
type = S
physics = S
moveType = I
anim = 1205
ctrl = 0
velSet = 0,0

[State 1205, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1205, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1205, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 1200,1

[State 1205, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 1205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<JUMPING LARIAT DROP>=
[StateDef 1300]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = -1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 155, 2, ifElse(P2Dist x > 145, 1, 0))

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 1

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Golden Heel Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4.5 + Var(10) * 2
y = -5.8

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) >= 0
y = 0.6

[State 1300, Air Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !var(45)
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
attr = A, ST
hitFlag = MA-
priority = 3, Miss
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1310
P2Facing = 1
p1sprpriority = -1


[State 1300, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(3)>=6 && animelemtime(5)<0
value = 0

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = AnimElem =3,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1301


;Landing
[Statedef 1301]
type = S
movetype = I
physics = S
poweradd= 0
anim = 1301
ctrl = 0
velset = 0,0

[State 1301, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 1200,1

[State 1301, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 15

[State 1301, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Success
[StateDef 1310]
type = A
physics = N
moveType = A
anim = 1310
ctrl = 0
velSet = 0,0

[State 1310, Hand]
type = Explod
trigger1 = !time
anim = 13100
ID = 13100
sprPriority = 3
posType = P1
bindTime = 99999
pos = 0,0
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 0

[State 1310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1310, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1320

[State 1300, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 7.5, ifElse(var(10) = 1, 6.0, 4.5))

[State 1310,TargetBind]
type = TargetBind
trigger1 = 1
pos = ceil(-23 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1310, Voice]
type = PlaySnd
trigger1 = Time = 1
value = 1500,0

[State 1310,VelAdd]
type = VelAdd
trigger1 = 1
y = .6

[State 1310, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1311


;Success Landing
[Statedef 1311]
type = S
physics = S
moveType = I
anim = 1311
ctrl = 0
velSet = 0,0
sprpriority = 2

[State 1311, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 13100

[State 1311, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1311, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1321

[State 1311, Slam Sound]
type = PlaySnd
trigger1 = Time = 0
value = 810,0

[State 1311, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1311, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(25 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 1311, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1311,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1311, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(ifElse(var(10) = 2, 126, ifElse(var(10), 119, 112)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -126, ifElse(var(10), -119, -112)) * fvar(11)))

[State 1311, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1311,TargetBind]
type = TargetBind
trigger1 = !Time
pos = ceil(-30 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 1311,TargetBind]
type = TargetState
trigger1 = AnimElem = 4
value = 1322

[State 1311, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Target
[Statedef 1320]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 2

[State 1320,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1320, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1320,ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1320

;Target, Hit
[Statedef 1321]
type = A
movetype = H
physics = N
ctrl = 0
sprPriority = 0

[State 1321,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1321, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1321,ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1321


;Target Release
[Statedef 1322]
type = A
movetype = H
physics = N
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1322, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 1322

[State 1322, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 1322, VelSet]
type = VelSet
trigger1 = !Time
x = 4.0
y = -8.9

[State 1322,Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1322,SelfState]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100



;====<EX JUMPING LARIAT DROP>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = -1
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
var(25) = 33

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 14, -85
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(40) = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 2

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
stateType = A

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Golden Heel Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10.5
y = -8

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) >= 0
y = 0.8

[State 1330, Air Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4  && !var(45)
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
attr = A, ST
hitFlag = MA-
priority = 3, Miss
getPower = 0,0
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1340
P2Facing = 1
p1sprpriority = -1

[State 1330, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(3)>=6 && animelemtime(5)<0
value = 0

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1330, ChangeState]
type = ChangeState
trigger1 = AnimElem =3,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1301


;Success
[StateDef 1340]
type = A
physics = N
moveType = A
anim = 1310
ctrl = 0
velSet = 0,0

[State 1340, Hand]
type = Explod
trigger1 = !time
anim = 13100
ID = 13100
sprPriority = 3
posType = P1
bindTime = 99999
pos = 0,0
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 0

[State 1340, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1340, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1320

[State 1340, VelSet]
type = VelSet
trigger1 = !Time
x = 10.5

[State 1340,TargetBind]
type = TargetBind
trigger1 = 1
pos = ceil(-23 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1340, Voice]
type = PlaySnd
trigger1 = Time = 1
value = 1500,0

[State 1340,VelAdd]
type = VelAdd
trigger1 = 1
y = .6

[State 1340, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1341


;Success Landing
[Statedef 1341]
type = S
physics = S
moveType = I
anim = 1311
ctrl = 0
velSet = 0,0
sprpriority = 2

[State 1341, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 13100

[State 1341, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1341, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1321

[State 1341, Slam Sound]
type = PlaySnd
trigger1 = Time = 0
value = 810,0

[State 1341, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1341, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(25 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 1341, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1341,EnvShake]
type = EnvShake
trigger1 = !Time
time = 15

[State 1341, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = !Time
value = floor(ifElse(140 * fvar(11) < 7, -7, -140 * fvar(11)))

[State 1341, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 1341,TargetBind]
type = TargetBind
trigger1 = !Time
pos = ceil(-30 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 1341,TargetBind]
type = TargetState
trigger1 = Time = 4
value = 1322

[State 1341, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;=<COMBINATION BODYBLOW>==
[StateDef 1400]
type = S
physics = S
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
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, VelAdd]
type = VelSet
trigger1 = AnimElem = 3,=1
x = ifElse(var(10) = 0, 7, ifElse(var(10) = 1, 8, 9))

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1400,0
channel = 0

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1,2

[State 1400, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 1400, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1400, Headbutt]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
trigger1 = !AILevel
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 121 || EnemyNear, StateNo = 131 || EnemyNear, StateNo = 141 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel
trigger3 = Random < 30
trigger3 = P2Dist x >= 0
var(14) = 1440

[State 1400, Front Suplex]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
trigger1 = !AILevel
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 121 || EnemyNear, StateNo = 131 || EnemyNear, StateNo = 141 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel
trigger3 = Random < 30
trigger3 = P2Dist x >= 0
var(14) = 1450

[State 1400, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) > 0 && AnimElemTime(7) < 0
value = var(14)

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Headbutt
[StateDef 1440]
type = S
physics = S
moveType = A
anim = 1430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1440, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1440, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1440, VelAdd]
type = VelSet
trigger1 = AnimElem = 1
x = 9

[State 1440, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1440, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
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
ground.velocity = -4.32, -7.49
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
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
sparkXY = -10 + 0 * (var(35) := 99), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1440, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 4,0
channel = 0

[State 1440, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1,2

[State 1440, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
movetype = I

[State 1440, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Front Suplex
[StateDef 1450]
type = S
physics = S
moveType = A
anim = 1440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1450, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1450, VelAdd]
type = VelSet
trigger1 = AnimElem = 2,=2
x = 6.5

[State 1450, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1450, Grab Attempt]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4  && !var(45)
trigger1 = P2StateNo != [150,155]
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1460
p2StateNo = 1470
p2getp1state = 1
numhits = 1
P2Facing = 1

[State 1450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5,=1
value = 1,0

[State 1450, Voice]
type = PlaySnd
trigger1 = AnimElem = 7,=1
value = 800,0
channel = 0

[State 1450, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
movetype = I

[State 1450, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[Statedef 1460]
type = S
physics = S
moveType = I
anim = 1450
ctrl = 0
velSet = 0,0

[State 1460, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1460, HitAdd]
type = HitAdd
trigger1 = AnimElem = 8
value = 1

[State 1460, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1460, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1470

[State 1460, Width]
type = Width
triggerall = Time = 0
trigger1 = FrontEdgeDist < 70
edge = 60,0

[State 1460, Width]
type = Width
triggerall = AnimElem = 6
trigger1 = BackEdgeDist < 75
edge = 0,75

[State 1460, Width]
type = Width
triggerall = AnimElem = 7
trigger1 = BackEdgeDist < 105
edge = 0,105

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(55 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(25 * const(size.xScale)), ceil(-100 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = ceil(-5 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(-65 * const(size.xScale)), ceil(-105 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 7
pos = ceil(-95 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1460, Impact Dust]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(10 * const(size.xScale)),ceil(0 * const(size.yScale))
ownPal = 1

[State 1460, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1460, EnvShake]
type = EnvShake
trigger1 = AnimElem = 8
time = 15

[State 1460, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = floor(ifElse(91 * fvar(11) < 7, -7, -91 * fvar(11)))

[State 1460, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 8
value = 36

[State 1460,TargetBind]
type = TargetState
trigger1 = AnimElem = 8
value = 1471

[State 1460, Voice]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 4,2

[State 1460, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 810,0

[State 1460, Turn]
type = Turn
trigger1 = AnimElem = 11

[State 1460, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Target
[Statedef 1470]
type = A
movetype = H
physics = N
ctrl = 0

[State 1470,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1470, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1470,ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1460


;Target Release
[Statedef 1471]
type = A
movetype = H
physics = N
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1471, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 1471, VelSet]
type = VelSet
trigger1 = !Time
x = 4.25
y = -8

[State 1471,Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1471,SelfState]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100



;=<EX COMBINATION BODYBLOW>==
[StateDef 1430]
type = S
physics = S
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
var(25) = 61

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -14, -88
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, VelAdd]
type = VelSet
trigger1 = AnimElem = 3,=1
x = 9

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
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
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -78
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1400,0
channel = 0

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1,2

[State 1430, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 1430, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1430, Headbutt]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
trigger1 = !AILevel
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
;x / y / z
trigger1 = NumExplod(90000200) || NumExplod(90000205) || NumExplod(90000210) || NumExplod(90000215) || NumExplod(90000220) || NumExplod(90000225)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 121 || EnemyNear, StateNo = 131 || EnemyNear, StateNo = 141 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel
trigger3 = Random < 30
trigger3 = P2Dist x >= 0
var(14) = 1431

[State 1400, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = var(14)

[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX Headbutt
[StateDef 1431]
type = S
physics = S
moveType = A
anim = 1430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1431, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 61

[State 1431, VelAdd]
type = VelSet
trigger1 = AnimElem = 1
x = 9

[State 1431, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1431, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
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
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 101), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1431, Voice]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 4,0
channel = 0

[State 1431, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2,=1
value = 1,2

[State 1431, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1431, EX Front Suplex]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
trigger1 = !AILevel
;command = "QCB"
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel
trigger2 = (EnemyNear, StateNo = 121 || EnemyNear, StateNo = 131 || EnemyNear, StateNo = 141 || EnemyNear, StateNo = 151)
trigger2 = P2Dist x >= 0
trigger3 = AILevel
trigger3 = Random < 30
trigger3 = P2Dist x >= 0
var(14) = 1432

[State 1431, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
value = var(14)

[State 1431, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 1431, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX Front Suplex
[StateDef 1432]
type = S
physics = S
moveType = A
anim = 1440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1432, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 61

[State 1432, VelAdd]
type = VelSet
trigger1 = AnimElem = 2,=2
x = 6.5

[State 1432, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 1432, Grab Attempt]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4  && !var(45)
trigger1 = P2StateNo != [150,155]
attr = S, ST
hitFlag = M
priority = 7, Miss
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
fall = 1
fall.recover = 0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
numHits = 0
p1StateNo = 1433
p2StateNo = 1470
p2getp1state = 1
numhits = 1
P2Facing = 1

[State 1432, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5,=1
value = 1,0

[State 1432, Voice]
type = PlaySnd
trigger1 = AnimElem = 7,=1
value = 800,0
channel = 0

[State 1432, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
movetype = I

[State 1432, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[Statedef 1433]
type = S
physics = S
moveType = I
anim = 1450
ctrl = 0
velSet = 0,0

[State 1433, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1433, HitAdd]
type = HitAdd
trigger1 = AnimElem = 8
value = 1

[State 1433,TargetBind]
type = TargetState
trigger1 = Time = 0
value = 1470

[State 1433, Width]
type = Width
triggerall = Time = 0
trigger1 = FrontEdgeDist < 70
edge = 60,0

[State 1433, Width]
type = Width
triggerall = AnimElem = 6
trigger1 = BackEdgeDist < 75
edge = 0,75

[State 1433, Width]
type = Width
triggerall = AnimElem = 7
trigger1 = BackEdgeDist < 105
edge = 0,105

[State 1433, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1433, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(55 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1460, TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(25 * const(size.xScale)), ceil(-100 * const(size.yScale))

[State 1433, TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = ceil(-5 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 1433, TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(-65 * const(size.xScale)), ceil(-105 * const(size.yScale))

[State 1433, TargetBind]
type = TargetBind
trigger1 = AnimElem = 7
pos = ceil(-95 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1433, Impact Dust]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(10 * const(size.xScale)),ceil(0 * const(size.yScale))
ownPal = 1

[State 1433, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1433, EnvShake]
type = EnvShake
trigger1 = AnimElem = 8
time = 15

[State 1433, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))

[State 1433, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 8
value = 36

[State 1433,TargetBind]
type = TargetState
trigger1 = AnimElem = 8
value = 1471

[State 1433, Voice]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 4,2

[State 1433, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 810,0

[State 1433, Turn]
type = Turn
trigger1 = AnimElem = 11

[State 1433, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;====<THUNDER CRUSH BOMB>=
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 0

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 1500, HitDef]
type = HitDef
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && !var(45)
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
P1StateNo = 1510
P2Facing = 1

[State 1500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1500, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1510]
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1510, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1510, TargetBind]
type = TargetState
trigger1 = !Time
value = 1515

[State 1510,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 1510,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 1510, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500,0
channel = 1

[State 1510, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 0

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1510,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 1510, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 1510,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 1510, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(ifElse(var(10) = 2, 77, ifElse(var(10), 63, 49)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -77, ifElse(var(10), -63, -49)) * fvar(11)))
kill = 0

[State 1510, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 1510, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 1510, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1520
ctrl = 0


;Success (Throw)
[StateDef 1520]
type = S
physics = N
moveType = A
anim = 1506
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1520, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1520, TargetBind]
type = TargetState
trigger1 = !Time
value = 1525

[State 1520,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 1520,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 1520, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1500,1
channel = 1

[State 1520, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 4

[State 1520, Woosh]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 2

[State 1520, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
value = A
physics = N

[State 1520, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 2
y = -8-Var(11)

[State 1520, VelSet]
type = VelSet
trigger1 = AnimElem = 4,=2
x = 0
y = 0

[State 1520, VelAdd]
type = VelAdd
trigger1 = AnimElem = 4,< 2
trigger2 = AnimElem = 7,> 1
y = .4

[State 1520, VelSet]
type = VelSet
trigger1 = AnimElem = 7,=1
x = -3
y = -6

[State 1520, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1520, TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1520, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3,>=0 && AnimElem = 5,<0
trigger2 = AnimElem = 6,>=0 && AnimElem = 7,<0
pos = ceil(-5 * const(size.xScale)), ceil(-150 * const(size.yScale))

[State 1520, TargetBind]
type = TargetBind
trigger1 = AnimElem = 5,>=0 && AnimElem = 6,<0
pos = ceil(-8 * const(size.xScale)), ceil(-153 * const(size.yScale))

[State 1520, TargetBind]
type = TargetBind
trigger1 = AnimElem = 7,>=0 && AnimElem = 8,<0
pos = ceil(10 * const(size.xScale)), ceil(-130 * const(size.yScale))

[State 1520, SprPriority]
type = SprPriority
trigger1 = AnimElem = 4
trigger2 = AnimElem = 9
value = 2

[State 1520, SprPriority]
type = SprPriority
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
value = -1

[State 1520,TargetBind]
type = TargetState
trigger1 = AnimElem = 8
value = 1526

[State 1520, HitAdd]
type = HitAdd
trigger1 = Target,StateNo = 5100
value = 1
persistent = 0

[State 1520, ChangeState]
type = ChangeState
trigger1 = AnimElem = 3,>0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1507
ctrl = 0


;Landing
[StateDef 1507]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1507
velSet = 0,0
sprPriority = 1

[State 1507, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1507, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1507, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1507, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[Statedef 1515]
type = A
movetype = H
physics = N
ctrl = 0

[State 1515,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1515, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1515,ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1515


;Target (Recapture)
[Statedef 1516]
type = A
movetype = H
physics = N
ctrl = 0

[State 1516, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1516, screenbound]
type = screenbound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 1516, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1516


[Statedef 1525]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State 1320,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 1320,ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1521


[Statedef 1526]
type = A
movetype = H
physics = N
velset = -8.5,5

[State 1526, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1522

[State 1526, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 1

[State 1526, Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1526, LifeAdd]
type = LifeAdd
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -84

[State 1526, PowerAdd]
type = PowerAdd
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 36

[State 1526, VelSet]
type = VelSet
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
x = 0

[State 1526, SelfState]
type = SelfState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100



;====<EX THUNDER CRUSH BOMB>=
[StateDef 1530]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 108

[State 1530, VarSet]
type = VarSet
trigger1 = !Time
var(47) = 0

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 24, -85
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1530, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 1

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 2

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2  && !var(45)
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
attr = S, ST
hitFlag = M-
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
p1StateNo = 1540
P2Facing = 1

[State 1530, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1530, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 1540]
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1540, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1540, TargetBind]
type = TargetState
trigger1 = !Time
value = 1515

[State 1540,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 1540,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 1540, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500,0
channel = 1

[State 1540, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 2

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1540,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 1540, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 1540,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 1540, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 0

[State 1540, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 1540, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 1540, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1541
ctrl = 0


;Success
[StateDef 1541]
type = S
physics = N
moveType = A
anim = 1505
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1541, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1541, TargetBind]
type = TargetState
trigger1 = !Time
value = 1516

[State 1541,Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 70
edge = 70,0
ignoreHitPause = 1

[State 1541,Width]
type = Width
trigger1 = AnimElem = 6 && FrontEdgeDist < 90
edge = 90,0
ignoreHitPause = 1

[State 1541, Slam Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 810,0
channel = 2

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65 * const(size.xScale)), ceil(-50 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
pos = ceil(65 * const(size.xScale)), ceil(-85 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = ceil(40 * const(size.xScale)), ceil(-110 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = ceil(45 * const(size.xScale)), ceil(-120 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 6
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 8
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1541,TargetBind]
type = TargetBind
trigger1 = AnimElem = 9
pos = ceil(80 * const(size.xScale)), ceil(-10 * const(size.yScale))

[State 1541, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
facing = -1
pos = ceil(0 * const(size.xScale)),ceil(80 * const(size.yScale))
ownPal = 1

[State 1541,EnvShake]
type = EnvShake
trigger1 = AnimElem = 6
time = 15

[State 1541, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 0

[State 1541, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 1541, HitAdd]
type = HitAdd
trigger1 = AnimElem = 6
value = 1

[State 1541, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1520
ctrl = 0



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
trigger1 = AnimElem = 4 && Random < 350
value = 4, ifElse(Random < 500, 1, 2)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,1
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 2900, ChangeState]
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
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
