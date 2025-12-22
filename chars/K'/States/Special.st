; _____________________________________
;| K' by Chazzanova & Dampir           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==


;====<EIN TRIGGER>=
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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1001, 1002))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimelemTime(3) = 0
value = 1000, 0 + (Random % 2)
channel = 0

[State 1000, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(4) = 0
value = 1000, 2
channel = 1

[State 1000, Fire Explod]
type = Explod
ID = 1006
trigger1 = AnimelemTime(1) = 1
anim = 1006
bindtime = 1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Fire Explod]
type = Explod
ID = 1007
trigger1 = AnimelemTime(4) = 1
anim = 1007
bindtime = 1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Helper]
type = Helper
trigger1 = Time = 8
helpertype = Normal
stateno = 1005
ID = 1005
name = "Ein Trigger"
postype = p1
pos = 0, 0
keyCtrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(12) = 0
value = 30,0

[State 1000, FollowUp Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1000, Second Shoot]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdfwd" && (command = "a" || command = "b")
trigger2 = AILevel
trigger2 = P2BodyDist X >= 100
var(14) = 1010

[State 1000, Second Shell]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdfwd" && command = "c"
trigger2 = AILevel
trigger2 = P2BodyDist X < 100
var(14) = 1020

[State 1000, Black Out]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdback" && (command = "a" || command = "b" || command = "c")
var(14) = 1410

[State 1000, FollowUp]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(5) <= 8
value = var(14)

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SECOND SHOOT>=
[StateDef 1010]
type = A
physics = S
moveType = A
anim = 1010
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1010, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1010, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1010, ifElse(var(10) = 1, 1011, 1012))

[State 1010, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 4

[State 1010, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1010, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
x = 6

[State 1010, Voice]
type = PlaySnd
trigger1 = AnimElemTime(4) = 0
value = 1010, 0
channel = 5

[State 1010, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(4) = 1
value = 1010, 1
channel = 6

[State 1010, Helper]
type = Helper
trigger1 = AnimElemTime(4) = 0
helpertype = Normal
stateno = 1015
ID = 1015
name = "Second Shoot"
postype = P1
pos = 30, -55
keyCtrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1010, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1013


;Landing
[StateDef 1013]
type = S
anim = 1013
physics = N
moveType = I
velSet = 0,0

[State 1013, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1013, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1013, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1013, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<SECOND SHELL>=
[StateDef 1020]
type = S
physics = N
moveType = A
anim = 1020
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1020, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1020, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1020, ifElse(var(10) = 1, 1021, 1022))

[State 1020, Width]
type = Width
trigger1 = 1
edge= 25,0

[State 1020, Voice]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = 1020, 0
channel = 7

[State 1020, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = 1020, 1
channel = 8

[State 1020, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 2
anim = 1025
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1020, Explod]
type = Explod
trigger1 = AnimElemTime(3) = 1
anim = 1026
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1020, HitDef]
type = HitDef
triggerAll = var(12) < 2
triggerAll = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3 && !MoveContact && !MoveReversed
trigger3 = AnimElem = 4 && !MoveContact && !MoveReversed
trigger4 = AnimElem = 5 && !MoveContact && !MoveReversed
ID = 1020
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 44, ifElse(var(10), 38, 32)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 44, ifElse(var(10), 38, 32)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -11
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2, -11
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -85
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1020 Juggles]
type = VarSet
trigger1 = MoveHit = 1
var(15) = 0
ignoreHitPause = 1

[State 1020, Alternate Hit Detect]
type = VarAdd
trigger1 = MoveHit = 1 && NumTarget
var(12) = 1

[State 1020, Flame Particles]
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

[State 1020, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1020, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX EIN TRIGGER>=
[StateDef 1030]
type = S
physics = N
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
var(25) = 55

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
channel = 3

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimelemTime(3) = 0
value = 1000, 0 + (Random % 2)
channel = 0

[State 1030, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(4) = 0
value = 1000, 2
channel = 1

[State 1030, Fire Explod]
type = Explod
ID = 1006
trigger1 = AnimelemTime(1) = 1
anim = 1006
bindtime = 1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1030, Fire Explod]
type = Explod
ID = 1007
trigger1 = AnimelemTime(4) = 1
anim = 1007
bindtime = 1
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1030, Helper]
type = Helper
trigger1 = Time = 8
helpertype = Normal
stateno = 1005
ID = 1005
name = "Ein Trigger"
postype = p1
pos = 0, 0
keyCtrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(12) = 0
value = 30,0

[State 1030, FollowUp Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1030, Second Shoot]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdfwd" && (command = "a" || command = "b")
trigger2 = AILevel
trigger2 = P2BodyDist X >= 100
var(14) = 1040

[State 1030, Second Shell]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdfwd" && command = "c"
trigger2 = AILevel
trigger2 = P2BodyDist X < 100
var(14) = 1050

[State 1030, Black Out]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(6) <= 3
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdback" && (command = "a" || command = "b" || command = "c")
var(14) = 1410

[State 1030, FollowUp]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(5) <= 8
value = var(14)

[State 1030, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX SECOND SHOOT>=
[StateDef 1040]
type = A
physics = S
moveType = A
anim = 1010
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1040, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1040, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 4

[State 1040, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1040, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
x = 6

[State 1040, Voice]
type = PlaySnd
trigger1 = AnimElemTime(4) = 0
value = 1010, 0
channel = 5

[State 1040, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(4) = 1
value = 1010, 1
channel = 6

[State 1040, Helper]
type = Helper
trigger1 = AnimElemTime(4) = 0
helpertype = Normal
stateno = 1045
ID = 1045
name = "EX Second Shoot"
postype = P1
pos = 30, -55
keyCtrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1040, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1040, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1013



;====<EX SECOND SHELL>=
[StateDef 1050]
type = S
physics = N
moveType = A
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1050, Width]
type = Width
trigger1 = 1
edge= 25,0

[State 1050, Voice]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = 1020, 0
channel = 7

[State 1050, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = 1020, 1
channel = 8

[State 1050, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 2
anim = 1025
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1050, Explod]
type = Explod
trigger1 = AnimElemTime(3) = 1
anim = 1026
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1050, HitDef]
type = HitDef
triggerAll = var(12) < 4
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3 && !MoveContact && !MoveReversed
trigger3 = AnimElem = 4 && !MoveContact && !MoveReversed
ID = 1050
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -6.5
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2, -6.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -85
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1050, HitDef]
type = HitDef
triggerAll = var(12) < 6
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 5
ID = 1051
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -11
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2, -11
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 55), var(36) := -130
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1050 Juggles]
type = VarSet
trigger1 = MoveHit = 1
trigger1 = AnimElemTime(4) > 0
var(15) = 0
ignoreHitPause = 1

[State 1050, Alternate Hit Detect]
type = VarAdd
trigger1 = MoveHit = 1 && NumTarget
var(12) = 2

[State 1050, Flame Particles]
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

[State 1050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1050, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<CR0W BITES>=
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

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
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0 && var(10) != 2
trigger2 = AnimElemTime(4) < 0 && var(10) = 2
value = SCA
time = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100, 0
channel = 0

[State 1100, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(1) = 0
value = 1100, 1
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 4

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1100, Explod]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = ifElse(var(10) = 2, 1121, 1101)
ID = 1101
bindTime = 1
sprpriority = 3
postype = P1
pos = ifElse(var(10) = 1, 30, 0),0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1100, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 1
anim = 1102
ID = 1102
bindTime = 1
sprpriority = 3
postype = P1
pos = ifElse(var(10) = 1, 30, 0),0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
x = ifElse(!var(10), 8, ifElse(var(10) = 1, 12, 16))

[State 1100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 24

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = ifElse(!var(10), 0, ifElse(var(10) = 1, 2, 5.5))
y = ifElse(!var(10), -7.5, ifElse(var(10) = 1, -9, -11.35))

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(5) > 0
y = .55

[State 1100, VelMul]
type = VelMul
trigger1 = AnimElemTime(9) > 0
x = 0.95

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 52, ifElse(var(10), 35, 30)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 52, ifElse(var(10), 35, 30)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -9.14
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -34
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 41, ifElse(var(10), 70, 58)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 41, ifElse(var(10), 70, 58)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -9.14
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 + (var(10) = 2) || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 29, ifElse(var(10), 35, 30)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 29, ifElse(var(10), 35, 30)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -9.14
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -9.14
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -118
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particles]
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

[State 1100, FollowUp Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1100, Secondary Bites]
type = VarSet
triggerAll = var(10) = 2
triggerAll = (!var(14) || AILevel) && AnimElemTime(4) > 0 && AnimElemTime(8) <= 4
trigger1 = !AILevel
trigger1 = command != "holddown" && command = "holdfwd" && (command = "a" || command = "b" || command = "c")
trigger2 = AILevel
trigger2 = AnimElemTime(4) > 0 && AnimElemTime(8) <= 4
var(14) = 1150

[State 1100, FollowUp]
type = ChangeState
triggerAll = var(10) = 2
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(9) = 0
value = var(14)

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Landing
[StateDef 1105]
type = S
anim = ifElse(!var(10) || PrevStateNo = 1130 || PrevStateNo = 2900, 1105, ifElse(var(10) = 1, 1115, 1125))
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



;====<EX CR0W BITES>=
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
var(25) = 64

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 15, -90
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 8

[State 1130, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100, 0
channel = 0

[State 1130, Throw Effect]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 11
value = 1100, 1
channel = 1

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimElem = 21
value = 1150, 0
channel = 7

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1150, 1
channel = 6

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 40,0
channel = 4

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 15
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 15
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1130, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1101
ID = 1101
bindTime = 1
sprpriority = 3
postype = P1
pos = 20,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 1102
ID = 1102
bindTime = 1
sprpriority = 3
postype = P1
pos = 20,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 1121
ID = 1101
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 1102
ID = 1102
bindTime = 1
sprpriority = 3
postype = P1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 1130, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
trigger4 = AnimElem = 12
trigger5 = AnimElem = 13
trigger6 = AnimElem = 14
x = 12

[State 1130, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 15
x = 24

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 15
x = 4
y = -10.5

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(15) > 0
y = .55

[State 1130, VelMul]
type = VelMul
trigger1 = AnimElemTime(20) > 0
x = 0.95

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -34
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -118
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.21
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.21
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -34
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 14
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.21
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.21
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 15
attr = A, SA
hitFlag = MAFP
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 2 , 4), ifElse(var(20), 2, 4)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.21
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.21
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -118
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 8 || var(20))
trigger1 = AnimElem = 24
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 10.52
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -2.16, 10.52
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -34
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particles]
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

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(25) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105



;====<SECONDARY BITES>=
[StateDef 1150]
type = A
physics = N
moveType = A
anim = 1150
ctrl = 0
sprPriority = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = 0

[State 1150, VelAdd]
type = VelAdd
trigger1 = 1
y = .48

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimelemTime(2) = 0
value = 1150, 0
channel = 0

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1150, 1
channel = 1

[State 1150, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 2
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 30 < 7, 7, fvar(11) * 30)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
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
ground.velocity = 0, 10.52
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -3.16, -0.52
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -34
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1150, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105



;====<MINUTES SPIKE>=
[StateDef 1200]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
ctrl = 0

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsb"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 4

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1200, 0
channel = 0

[State 1200, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(2) = 0
value = 1200, 1
channel = 1

[State 1200, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 24

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 7.625 + (var(10) * 0.5)
y = -4

[State 1200, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = 0.95

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.38

[State 1200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1200
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 68, ifElse(var(10), 62, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 68, ifElse(var(10), 62, 56)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.1, -7.6
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -8.1, -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -85
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1200, FollowUp Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1200, Narrow Spike]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) > 2 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "QCB+K"
trigger2 = AILevel
trigger2 = EnemyNear, StateType != L && EnemyNear, StateType != A && EnemyNear, MoveType = H
trigger2 = MoveGuarded && Time > 4
trigger3 = AILevel
trigger3 = EnemyNear, StateType != L && EnemyNear, StateType != A && EnemyNear, MoveType != H
trigger3 = AnimTime = 0
var(14) = 1250

[State 1200, FollowUp]
type = ChangeState
trigger1 = var(14) = [1000,2999]
value = var(14)

[State 1200, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1 = pos y > -vel y
value = 1205



;Landing
[StateDef 1205]
type = S
anim = ifElse(!var(10) || PrevStateNo = 1230 || PrevStateNo = 1330, 1205, ifElse(var(10) = 1, 1215, ifElse(var(10) = 2, 1225, 1235)))
physics = N
moveType = I
velSet = 0,0

[State 1205, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1205, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1205, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1205, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX MINUTES SPIKE>=
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 55

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -4, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1230, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 4

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1230, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1200, 0
channel = 0

[State 1230, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(2) = 0
value = 1200, 1
channel = 1

[State 1230, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 24

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 10.625
y = -4.5

[State 1200, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = 0.95

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.38

[State 1230, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(4)  >= 0 && AnimElemTime(6) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 15), (var(36) := -55)
hitSound = S3,0
numHits = 0

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1230
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 79 < 7, 7, fvar(11) * 79)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.1, -7.6
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -8.1, -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -85
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1230, FollowUp Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1230, Narrow Spike]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(2) > 2 && AnimElemTime(11) < 0
trigger1 = !AILevel
trigger1 = command = "QCB+K"
var(14) = 1280

[State 1230, FollowUp]
type = ChangeState
trigger1 = var(14) = [1000,2999]
value = var(14)

[State 1230, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(3) > 0
trigger1 = pos y > -vel y
value = 1205



;====<NARROW SPIKE>=
[StateDef 1250]
type = S
physics = S
moveType = A
anim = 1250
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1250, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = 0

[State 1250, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
x = 8

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
x = 6

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(7) < 0
x = 5.5

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(9) < 0
x = 5

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 1250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
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
ground.velocity = -4.31, -7.36
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity =-4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -6
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX NARROW SPIKE>=
[StateDef 1280]
type = S
physics = S
moveType = A
anim = 1280
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1280, Width]
type = Width
trigger1 = 1
edge = 30,0

[State 1280, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
x = 12

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
x = 10

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(7) < 0
x = 8.5

[State 1250, VelSet]
type = VelSet
triggerall = !MoveGuarded
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(9) < 0
x = 8

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 1280, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 71 < 7, 7, fvar(11) * 71)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
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
ground.velocity = -4.31, -7.36
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity =-4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -6
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1280, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1280, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<MINUTES SPIKE (AIR)>=
[StateDef 1300]
type = A
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsb"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

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
trigger1 = AnimelemTime(1) = 0
value = 1200, 0
channel = 0

[State 1300, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1200, 1
channel = 1

[State 1300, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 24

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 7.625 + (var(10) * 0.5)
y = -4

[State 1300, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) >= 0
x = 0.95

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.38

[State 1300, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 1300
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 68, ifElse(var(10), 62, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 68, ifElse(var(10), 62, 56)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.1, -7.6
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -8.1, -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -85
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
trigger1 = pos y > -vel y
value = 1205



;====<EX MINUTES SPIKE (AIR)>=
[StateDef 1330]
type = A
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500

[State 1330, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 55

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -4, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1330, Voice]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1200, 0
channel = 0

[State 1330, Throw Effect]
type = PlaySnd
trigger1 = AnimelemTime(1) = 0
value = 1200, 1
channel = 1

[State 1330, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1330, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 24

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 10.625
y = -4.5

[State 1330, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) >= 0
x = 0.95

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.66

[State 1330, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(3)  >= 0 && AnimElemTime(5) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 15), (var(36) := -55)
hitSound = S3,0
numHits = 0

[State 1330, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 1330
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 79 < 7, 7, fvar(11) * 79)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6 , 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.1, -7.6
ground.cornerPush.velOff = 0
guard.velocity = -10.91
guard.cornerPush.velOff = 0
air.velocity = -8.1, -7.6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 62), var(36) := -85
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1330, ChangeState]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
trigger1 = pos y > -vel y
value = 1205



;====<BLACK OUT>=
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

[State 1400, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 333, 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400, 0
channel = 12

[State 1400, Dash Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1400, 1
channel = 13

[State 1400, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
value = SCA

[State 1400, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(10) < 0
value = 0
ignoreHitPause = 1

[State 1400, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5.5 + var(10)

[State 1400, VelMul]
type = VelMul
trigger1 = AnimElem = 11
x = 0.85

[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<BLACK OUT (FROM EINS TRIGGER)>=
[StateDef 1410]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 1410, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1410, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1410, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1410, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400, 0
channel = 12

[State 1410, Dash Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1400, 1
channel = 13

[State 1410, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1410, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
value = SCA

[State 1410, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(10) < 0
value = 0
ignoreHitPause = 1

[State 1410, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1410, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5.5 + var(10)

[State 1410, VelMul]
type = VelMul
trigger1 = AnimElem = 11
x = 0.85

[State 1410, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1410, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




;====<EX BLACK OUT>=
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

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 55

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -3, -66
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400, 0
channel = 12

[State 1430, Dash Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1400, 1
channel = 13

[State 1430, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
value = SCA

[State 1430, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(10) < 0
value = 0
ignoreHitPause = 1

[State 1430, Width]
type = Width
trigger1 = 1
edge = 15,0

[State 1430, Trans]
type = Trans
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trans = AddAlpha
alpha = 0,256

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.5

[State 1430, VelMul]
type = VelMul
trigger1 = AnimElem = 11
x = 0.85

[State 1430, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<AIR TRIGGER>=
[Statedef 1500]
type = A
physics = N
movetype = A
anim = 1500
ctrl = 0
sprpriority = 1
poweradd = 72 * !var(20)

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 333, 2, ifElse(Random < 500, 1, 0))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Fire Explod]
type = Explod
ID = 1501
trigger1 = AnimelemTime(5) = 1
anim = 1501
bindtime = 16
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = -5
y = -8

[State 1500, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) >= 0
y = .55

[State 1500, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .95

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1010, 0
channel = 5

[State 1500, Throw Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1010, 1
channel = 6

[State 1500, Helper]
type = Helper
trigger1 = AnimElemTime(6) = 1
helpertype = Normal
stateno = 1505
ID = 1505
name = "Air Trigger"
postype = P1
pos = 40,-50
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1500, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1013



;====<EX AIR TRIGGER>=
[Statedef 1530]
type = A
physics = N
movetype = A
anim = 1530
ctrl = 0
sprpriority = 1
powerAdd = -500

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
var(25) = 55

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -4, -70
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1530, Fire Explod]
type = Explod
ID = 1501
trigger1 = AnimelemTime(5) = 1
anim = 1501
bindtime = 16
sprPriority = 2
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1530, VelAdd]
type = VelAdd
trigger1 = 1
y = .34

[State 1530, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) >= 0
x = .95

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1010, 0
channel = 5

[State 1530, Throw Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1010, 1
channel = 6

[State 1530, Helper]
type = Helper
trigger1 = AnimElemTime(6) = 1
helpertype = Normal
stateno = 1535
ID = 1535
name = "Air Trigger"
postype = P1
pos = 40,-50
keyCtrl = 1
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1530, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 1530, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1013



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
trigger1 = AnimElemTime(2) < 0
value = SCA
time = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100, 0
channel = 0

[State 2900, Throw Effect]
type = PlaySnd
trigger1 = AnimElemTime(1) = 0
value = 1100, 1
channel = 1

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 4

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 5
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 2900, Explod]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = ifElse(var(10) = 2, 1121, 1101)
ID = 1101
bindTime = 1
sprpriority = 3
postype = P1
pos = ifElse(var(10) = 1, 30, 0),0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 2900, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 1
anim = 1102
ID = 1102
bindTime = 1
sprpriority = 3
postype = P1
pos = ifElse(var(10) = 1, 30, 0),0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger3 = AnimElem = 4
x = 8

[State 2900, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 24

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 5
y = -7.5

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(5) > 0
y = .55

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
attr = S, SA
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
ground.velocity = -2.16, -5.66
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -34
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
attr = S, SA
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
ground.velocity = -2.16, -5.66
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5 && !MoveContact && !MoveReversed
attr = A, SA
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
ground.velocity = -2.16, -5.66
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.16, -5.66
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = S2,2
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -118
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Flame Particles]
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

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105



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
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 5
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
sparkXY = -10 + 0 * (var(35) := 89), var(36) := -2
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