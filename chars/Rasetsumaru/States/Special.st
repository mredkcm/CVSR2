; ________________________
;| Haohmaru by Chazzanova |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==


;====<OUGI: SENPUU RETSU ZAN>=
[StateDef 1000]
type = S
physics = N
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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
triggerAll = !var(40)
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1000, Voice (Rasetsumaru)]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElem = 1
value = 1000, 10
channel = 0

[State 1000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 
value = 1, 8
channel = 1

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 9
x = 16

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 10
x = 8

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 15
trigger2 = AnimElem = 17
x = -24

[State 1000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 16
x = -16

[State 1000, Helper]
type = Helper
trigger1 = AnimElem = 7
helpertype = Normal
stateno = 1005
ID = 1005
name = "Ougi: Senpuu Retsu Zan"
postype = P1
pos = 45, 0
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElem = 6
trigger2 = AnimElem = 15
trigger3 = AnimElem = 17
value = 20, 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX OUGI: SENPUU RETSU ZAN>=
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
var(25) = 24

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 3, -61
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000

[State 1030, Voice]
type = PlaySnd
triggerAll = !var(40)
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1030, Voice (Rasetsumaru)]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElem = 1
value = 1000, 10
channel = 0

[State 1030, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 4 
value = 1, 8
channel = 2

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 9
x = 16

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 10
x = 8

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 15
trigger2 = AnimElem = 17
x = -24

[State 1030, PosAdd]
type = PosAdd
trigger1 = AnimElem = 16
x = -16

[State 1030, Helper]
type = Helper
trigger1 = AnimElem = 7
helpertype = Normal
stateno = 1005
ID = 1005
name = "Ougi: Senpuu Retsu Zan"
postype = P1
pos = 45, 0
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElem = 15
trigger2 = AnimElem = 17
value = 0, 9

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<FAKE SENPUU RETSU ZAN>=
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

[State 1050, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1050, ifElse(var(10) = 1, 1060, 1070))

[State 1050, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1050,0
channel = 0

[State 1050, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<OUGI: KOGETSU ZAN>=
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

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
value = SCA
time = 1

[State 1100, Width]
type = Width
trigger1 = 1
edge = 5, 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,0
channel = 0

[State 1100, Slash Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,8
channel = 1

[State 1100, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 40,0
channel = 4

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 0.5 * (var(10) + 1)

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 7
y = ifElse(!var(10), -10.5, ifElse(var(10) = 1, -12, -13.5))

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.55

[State 1100, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) > 0
x = 0.8

[State 1100, Slash FX]
type = Explod
trigger1 = AnimElem = 2
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1100, Slash FX]
type = Explod
trigger1 = AnimElem = 6
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1100, HitDef]
type = HitDef
triggerAll = !var(20)
trigger1 = !var(16) && (var(15) < 1)
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 69, Ifelse(var(10) = 1, 42, 97)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 69, Ifelse(var(10) = 1, 42, 97)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
triggerAll = !var(20)
trigger1 = !var(16) && (var(15) < 1)
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 69, Ifelse(var(10) = 1, 42, 97)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 69, Ifelse(var(10) = 1, 42, 97)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -115
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
triggerAll = !var(20)
trigger1 = !var(16) && (var(15) < Ifelse(var(10), 2, 1))
trigger1 = AnimElem = 8
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 42, Ifelse(var(10) = 1, 63, 97)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 42, Ifelse(var(10) = 1, 63, 97)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -92
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
triggerAll = !var(20)
trigger1 = !var(16) && (var(15) < Ifelse(var(10), 2, 1))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 42, Ifelse(var(10) = 1, 63, 97)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 42, Ifelse(var(10) = 1, 63, 97)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -135
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && var(20)
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (65 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (65 * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && var(20)
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (45 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (45 * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -115
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && var(20)
trigger1 = AnimElem = 8
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (45 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (45 * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -92
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && var(20)
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (14 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (14 * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -135
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101


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
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX OUGI: KOGETSU ZAN>=
[StateDef 1130]
type = S
physics = N
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
var(25) = 29

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -20, -57
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000

[State 1130, Width]
type = Width
trigger1 = 1
edge = 5, 0

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1900,10
channel = 0

[State 1130, Slash Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,8
channel = 1

[State 1130, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 40,0
channel = 4

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 1.5

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 7
y = -14.5

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.55

[State 1130, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) > 0
x = 0.8

[State 1130, Slash FX]
type = Explod
trigger1 = AnimElem = 2
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, Slash FX]
type = Explod
trigger1 = AnimElem = 6
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(3)  >= 0 && AnimElemTime(4) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 69), (var(36) := -56)
hitSound = S3,0
numHits = 0

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (56 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (56 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -115
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 8
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (43 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (43 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -92
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (43 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (43 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -135
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;====<OUGI: RESSHIN ZAN>=
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
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 180, 2, ifElse(P2Dist x > 170, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1200,0
channel = 0

[State 1200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 0, 3.5, ifElse(var(10) = 1, 5, 6.5))
y = ifElse(var(10) = 0, -4, ifElse(var(10) = 1, -5, -6))

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.55

[State 1200, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1 = pos y > -vel y
value = 1201



;====<OUGI: KOGETSU ZAN>=
[StateDef 1201]
type = S
physics = S
moveType = A
anim = 1201
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1201, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1201, Width]
type = Width
trigger1 = !Time
edge = 40, 0

[State 1201, Slam Snd]
type = PlaySnd
trigger1 = !Time
value = 1200,1
channel = 1

[State 1201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1201, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1201, Slash FX]
type = Explod
trigger1 = !Time
anim = 1205
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1201, Slash FX]
type = Explod
trigger1 = !Time
anim = 1206
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1201, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 97, Ifelse(var(10) = 1, 90, 83)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 97, Ifelse(var(10) = 1, 90, 83)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.3, 9.3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.3, 9.3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -5
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1201, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX OUGI: RESSHIN ZAN>=
[StateDef 1230]
type = S
physics = N
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
var(25) = 31

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -10, -66
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1200,0
channel = 0

[State 1230, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 3

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 6.5
y = -7

[State 1230, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 1

[State 1230, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1 = pos y > -vel y
value = 1231



;====<OUGI: KOGETSU ZAN>=
[StateDef 1231]
type = S
physics = S
moveType = A
anim = 1231
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 1231, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1231, Width]
type = Width
trigger1 = !Time
edge = 40, 0

[State 1231, Slam Snd]
type = PlaySnd
trigger1 = !Time
value = 1200,1
channel = 1

[State 1231, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1231, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1231, Slash FX]
type = Explod
trigger1 = !Time
anim = 1205
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1231, Slash FX]
type = Explod
trigger1 = !Time
anim = 1206
sprPriority = 3
bindtime = -1
posType = P1
pos = 55, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1231, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 && !var(12)
ID = 1231
attr = S, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (138 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (138 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.3, 9.3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.3, 9.3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -5
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 && var(12)
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (138 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (138 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.3, 9.3
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.3, 9.3
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -5
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1231, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SAKE KOGEKI>=
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

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 1300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 1

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
x = 8

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 12
x = -8

[State 1300, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 82, Ifelse(var(10) = 1, 76, 70)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 82, Ifelse(var(10) = 1, 76, 70)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.2, -6.95
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.2, -6.95
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -55
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, Helper]
type = Helper
trigger1 = AnimElem = 7
helpertype = Normal
stateno = 1305
ID = 1305
name = "Projectile Shield"
postype = P1
ownpal = 1

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX SAKE KOGEKI>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1330
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
var(25) = 31

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -64
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000

[State 1330, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 7
x = 8

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 12
x = -8

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(7) < 0
value = SCA
time = 1

[State 1330, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (97 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (97 * (ifElse(var(45), 1.1, 1))))), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.2, -6.95
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.2, -6.95
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 68), var(36) := -55
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, Helper]
type = Helper
trigger1 = AnimElem = 7
helpertype = Normal
stateno = 1335
ID = 1335
name = "Projectile Shield"
postype = P1
ownpal = 1

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1330, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<OUGI: ZANKOUSEN>=
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

[State 1400, Width]
type = Width
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
player = 9, 0

[State 1400, Width]
type = Width
trigger1 = AnimElem = 18
player = 0, 3

[State 1400, Width]
type = Width
trigger1 = AnimElem = 19
player = 0, 9

[State 1400, Width]
type = Width
trigger1 = AnimElem = 21
player = 0, 15

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 0
channel = 0

[State 1400, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1200, 0
channel = 0

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1, 8
channel = 1

[State 1400, Slash Snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1100, 1
channel = 2

[State 1400, Slash Snd 2]
type = PlaySnd
trigger1 = AnimElemTime(11) = 4
value = 3300, 2

[State 1400, FX]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3300, 3
channel = 5

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
x = 24

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 12
x = 12

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 18
x = -18

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 19
x = -24

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
x = -12

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 21
x = -30

[State 1400, Slash FX]
type = Explod
trigger1 = AnimElem = 7
anim = 1407
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1400, Slash FX]
type = Explod
trigger1 = AnimElem = 11
anim = 1405
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (208 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (208 * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.96, -6.95
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -12.96, -6.95
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -45
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Pause]
type = Pause
trigger1 = MoveHit && Time % 2 = 0
time = 1

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 1400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<AERIAL OUGI: SENPUU RETSU ZAN>=
[Statedef 1500]
type = A
physics = N
movetype = A
anim = 1500
ctrl = 0
sprpriority = 1
poweradd = 72 * !var(20)

[State 1500, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))

[State 1500, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 0

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) > 0
x = -2

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000, 0
channel = 0

[State 1500, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 8
channel = 1

[State 1500, Helper]
type = Helper
trigger1 = AnimElemTime(4) = 1
helpertype = Normal
stateno = 1505
ID = 1505
name = "Ougi: Senpuu Retsu Zan"
postype = P1
pos = 5, -10
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1500, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(4) < 0

[State 1500, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = .47

[State 1500, End]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 0
value = 1501


;Landing
[StateDef 1501]
type = S
anim = 1501
physics = N
moveType = I
velSet = 0,0

[State 1501, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1501, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1501, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1501, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1501, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX AERIAL OUGI: SENPUU RETSU ZAN>=
[Statedef 1530]
type = A
physics = N
movetype = A
anim = 1530
ctrl = 0
sprpriority = 1
poweradd = -500

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
var(25) = 24

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -14, -93
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) > 0
x = -2

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000, 0
channel = 0

[State 1530, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1, 8
channel = 1

[State 1530, Helper]
type = Helper
trigger1 = AnimElemTime(4) = 1
helpertype = Normal
stateno = 1505
ID = 1505
name = "Ougi: Senpuu Retsu Zan"
postype = P1
pos = 5, -10
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1530, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(4) < 0

[State 1530, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 1530, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) >= 0
y = 1

[State 1530, End]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 0
value = 1501



;====<GOUHA>=
[StateDef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1600, ifElse(var(10) = 1, 1610, 1620))

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1600, 10
channel = 0

[State 1600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41, 0
channel = 1

[State 1600, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1600, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10 + (var(10) * 2)

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 1600, VelMul]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = .92

[State 1600, HitDef]
type = HitDef
trigger1 = !var(16) &&  (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 59, Ifelse(var(10) = 1, 53, 47)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 59, Ifelse(var(10) = 1, 53, 47)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5,-9
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5,-9
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1600, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SHITATARI>=
[StateDef 1700]
type = S
physics = S
moveType = A
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1700, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 187, 2
channel = 0

[State 1700, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 2, 9
channel = 1

[State 1700, Blood FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1701
sprPriority = 3
posType = p1
pos = 0, 0
scale = 1, 1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1700, LifeAdd]
type = LifeAdd
trigger1 = AnimElem = 3
value = -250
kill = 0

[State 1700, Shitatari Buff]
type = VarSet
trigger1 = AnimElem = 3
var(45) = 380

[State 1700, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SENPUU HA>=
[StateDef 1800]
type = S
physics = N
moveType = A
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1800, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1800, ifElse(var(10) = 1, 1810, 1820))

[State 1800, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1800, 10
channel = 0

[State 1800, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1800, 0
channel = 1

[State 1800, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1, 8
channel = 2

[State 1800, FX]
type = Explod
trigger1 = AnimElem = 6
anim = 1807
sprPriority = 3
bindtime = -1
posType = P1
pos = 50, 0
scale = 0.25, 0.25
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1800, Projectile]
type = Helper
trigger1 = AnimElemTime(6) = 0
helpertype = Normal
stateno = 1805
ID = 1805
name = "Senpuu Ha"
postype = P1
pos = 50, 0
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1800, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<NAGI YAIBA>=
[StateDef 1900]
type = S
physics = S
moveType = A
anim = 1900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1900, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1900, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1900, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1900, ifElse(var(10) = 1, 1910, 1920))

[State 1900, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1900, 10
channel = 0

[State 1900, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 3
channel = 1

[State 1900, ReversalDef]
type = ReversalDef
trigger1 = AnimElemTime(2)  >= 0 && AnimElemTime(3) < 0
attr = S, SA
reversal.attr = SCA, NA, SA, HA
pausetime = 0,36
sparkno = -1
sparkxy = 0,0
hitsound = s3,0
p1stateno = 1901
;p2stateno =
;persistent = 1
fall = 0
;air.fall = 1
fall.recover = 1
numhits = 0
p2facing = 1

[State 1900, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = AnimElemTime(3) < 0
trigger1 = P2BodyDist x < 40
trigger1 = abs(P2BodyDist y) < 30
value = 1901

[State 1900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1900, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<NAGI YAIBA (SUCCESS)>=
[StateDef 1901]
type = S
physics = N
moveType = A
anim = 1901
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1901, Width]
type = Width
trigger1 = 1
edge = 5, 0

[State 1901, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 14

[State 1901, Slash Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,8
channel = 1

[State 1901, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1

[State 1901, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 1901, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1901, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1901, VelSet]
type = VelSet
trigger1 = AnimElem = 5
y = -4 - (var(10) * 0.5)

[State 1901, Veladd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .4

[State 1901, Slash FX]
type = Explod
trigger1 = AnimElem = 3
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1901, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1901, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -135
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1901, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (ifElse(var(10) = 2, 32, Ifelse(var(10) = 1, 30, 28)) * (ifElse(var(45), 1.1, 1))))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 41), var(36) := -135
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1901, VarSet: No Juggle Check]
type = VarSet
trigger1 = MoveHit=1 && NumTarget
var(15) = 0

[State 1901, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1901, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



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
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Width]
type = Width
trigger1 = 1
edge = 5, 0

[State 2900, Voice]
type = PlaySnd
trigger1 = !var(40) && AnimElem = 1
value = 1100,0
channel = 0

[State 2900, FX]
type = PlaySnd
trigger1 = var(40) && AnimElem = 1
value = 1600, 10
channel = 2

[State 2900, Slash Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,8
channel = 1

[State 2900, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100, 1
channel = 4

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 40,0
channel = 3

[State 2900, Slash FX]
type = Explod
trigger1 = AnimElem = 2
anim = 1105
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2900, Slash FX]
type = Explod
trigger1 = AnimElem = 6
anim = 1106
sprPriority = 3
bindtime = -1
posType = P1
pos = 0, 0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = 0.5

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 7
y = -10.5

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.55

[State 2900, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) > 0
x = 0.8

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
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
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
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
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 38), var(36) := -115
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
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
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -92
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
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
ground.velocity = -1.296, -9.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.296, -9.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = S2,9
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 2900, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;====<PUNCH ZERO COUNTER (RASETSUMARU)>=
[StateDef 2901]
type = S
physics = N
moveType = A
anim = 2901
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2901, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2901, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1600, 10
channel = 0

[State 2901, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41, 0
channel = 1

[State 2901, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 2901, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 2901, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10

[State 2901, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 2901, VelMul]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = .92

[State 2901, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
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
ground.velocity = -2.5,-9
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5,-9
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -35
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2901, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 2901, End]
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
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 2910, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 8

[State 2910, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * (42 * (ifElse(var(45), 1.1, 1))) < 7, 7, fvar(11) * (42 * (ifElse(var(45), 1.1, 1))))), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Heavy
air.animType = Back
fall.animType = Back
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
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -10
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
