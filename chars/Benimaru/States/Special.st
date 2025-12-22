; _________________________________________
;| Benimaru by Jmorphman                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;====<RAIJINKEN>=
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

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 1

[State 1000, Raijinken Startup Spark]
type = Explod
trigger1 = AnimElem = 2
anim = 1004
ID = 1004
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -38, -89
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1004
posType = P1
pos = -5, -87

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1004

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1005
name = "Raijinken Projectile"
posType = P1
pos = 88, -80
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(1005)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = ifElse(var(10) = 10, 1000, ifElse(var(10) = 11, 1010, 1020))
elem = 7
persistent = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX RAIJINKEN>=
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
var(25) = 28

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = -38, -89
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1030, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 3

[State 1030, Raijinken Startup Spark]
type = Explod
trigger1 = AnimElem = 2
anim = 1004
ID = 1034
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -38, -89
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1030, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1034
posType = P1
pos = -5, -87

[State 1030, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1034

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1035
name = "EX Raijinken Projectile"
posType = P1
pos = 88, -80
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(1035)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
value = 1000
elem = 7
persistent = 0

[State 1030, EX Flash off]
type = VarSet
trigger1 = AnimElem = 7
var(25) = 0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<RAIJINKEN (AIR)>=
[StateDef 1050]
type = A
physics = N
moveType = A
anim = 1050
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1050, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 333, 2, ifElse(Random < 500, 1, 0))

[State 1050, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1050, ifElse(var(10) = 1, 1060, 1070))

[State 1050, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(5) <= 0

[State 1050, Voice]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1050, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 1050, Raijinken Startup Spark]
type = Explod
trigger1 = !Time
anim = 1004
ID = 1054
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = 1, -81
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 1054
posType = P1
pos = 3, -78

[State 1050, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 3
ID = 1054

[State 1050, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1005
ID = 1055
name = "Aerial Raijinken Projectile"
posType = P1
pos = 54, -44
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1050, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(1055)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 0
value = ifElse(var(10) = 10, 1050, ifElse(var(10) = 11, 1060, 1070))
elem = 5
persistent = 0

[State 1050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1050, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0
trigger1 = Time >= 0

[State 1050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
trigger1 = vel x
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

[State 1050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1051


;Landing
[StateDef 1051]
type = S
anim = ifElse(var(10) = 0 || PrevStateNo = 1080, 1051, ifElse(var(10) = 1, 1061, 1071))
physics = N
moveType = I
velSet = 0,0

[State 1051, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1051, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1051, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1051, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX RAIJINKEN (AIR)>=
[StateDef 1080]
type = A
physics = N
moveType = A
anim = 1080
ctrl = 0
sprPriority = 1
powerAdd = -500
faceP2 = 1

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
var(25) = 17

[State 1080, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = 1, -81
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1080, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1080, Voice]
type = PlaySnd
trigger1 = !Time
value = 1000,0
channel = 0

[State 1080, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 3

[State 1080, Raijinken Startup Spark]
type = Explod
trigger1 = !Time
anim = 1004
ID = 1084
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = 1, -81
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1080, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 1084
posType = P1
pos = 3, -78

[State 1080, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 3
ID = 1084

[State 1080, Projectile]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1085
ID = 1085
name = "EX Aerial Raijinken Projectile"
posType = P1
pos = 54, -44
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1080, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(5) <= 0

[State 1080, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1080, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0
trigger1 = Time >= 0

[State 1080, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
trigger1 = vel x
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

[State 1080, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1051



;====<TAIKU RAIJINKEN>=
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

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1100, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 1

[State 1100, Raijinken Startup Spark]
type = Explod
trigger1 = AnimElem = 2
anim = 1004
ID = 1104
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -44, -80
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1104
posType = P1
pos = -8, -85

[State 1100, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1104

[State 1100, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1105
name = "Taiku Raijinken Projectile"
posType = P1
pos = 56, -115
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1100, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(1105)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(8) < 0
value = ifElse(var(10) = 10, 1100, ifElse(var(10) = 11, 1110, 1120))
elem = 8
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX TAIKU RAIJINKEN>=
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

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 4

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

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = -44, -80
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
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1130, Raijinken sound effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1
channel = 3

[State 1130, Raijinken Startup Spark]
type = Explod
trigger1 = AnimElem = 2
anim = 1004
ID = 1134
bindTime = -1
removeTime = -1
sprPriority = 3
posType = P1
pos = -44, -80
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1134
posType = P1
pos = -8, -85

[State 1130, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1134

[State 1130, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1135
name = "EX Taiku Raijinken Projectile"
posType = P1
pos = 56, -115
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1130, ChangeAnimElem]
type = ChangeAnim
trigger1 = NumHelper(1135)
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(8) < 0
value = 1130
elem = 8
persistent = 0

[State 1130, EX Flash off]
type = VarSet
trigger1 = AnimElem = 8
var(25) = 0

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<IAIGERI>==
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0
channel = 0

[State 1200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 1

[State 1200, Iaigeri effect]
type = Explod
trigger1 = AnimElem = 4
ID = 1205
anim = ifElse(var(10) = 0, 1205, ifElse(var(10) = 1, 1215, 1225))
bindTime = -1
sprPriority = 3
posType = p1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 4, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0, ifElse(var(20), 8, 16)
guard.pauseTime = 0, ifElse(var(20), 8, 16)
animtype = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1200, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1200, Hando Sandangeri]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) < 0
trigger1 = !AILevel
;command = "D, U"
trigger1 = NumExplod(90012708)
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel && MoveHit
trigger2 = P2BodyDist x <= 100
var(14) = 1201

[State 1200, Button Detect]
type = VarSet
trigger1 = var(14) = 1201
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))
persistent = 0

[State 1200, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = var(14)

[State 1200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<HANDO SANDANGERI>==
[StateDef 1201]
type = S
physics = N
moveType = A
velSet = 0,0
anim = ifElse(var(10), 1211, 1201)
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1201, Voice]
type = PlaySnd
trigger1 = !Time
value = 1201,0
channel = 0

[State 1201, VelSet]
type = VelSet
trigger1 = !Time
x = 4.375

[State 1201, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 3

[State 1201, Standing Far Kick Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animtype = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1201, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0
channel = 4

[State 1201, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1201, Electricity Sound 1]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1300,1
channel = 5

[State 1201, Super Inazuma Kick FX]
type = Explod
trigger1 = AnimElem = 10
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1201, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 41,0
channel = 6

[State 1201, Electricity Sound 2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1300,1
channel = 7

[State 1201, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 13
stateType = A
physics = N

[State 1201, Dust Helper]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 8100
ID = 8100
name = "Super Inazuma Kick Dust"
posType = P1
ownPal = 1

[State 1201, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = ifElse(var(10) = 2, 0, ifElse(var(10) = 1, -1, -2))
y = ifElse(var(10) = 2, -8.125, ifElse(var(10) = 1, -6.875, -5.625))

[State 1201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(13) > 0
y = 0.439453125

[State 1201, MoveHitReset]
type = MoveHitReset
trigger1 = AnimElem = 12
ignorehitpause = 1

[State 1201, Super Inazuma Kick Hit (Ground)]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 12
ID = 1201
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)) < 7, 4, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
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
ground.velocity = -1.25, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -7.1875
air.cornerPush.velOff = 0
yAccel = 0.5981445313
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 39)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, Spark XY]
type = Null
trigger1 = AnimElem = 13
trigger1 = var(35) := 60 || var(36) := -98
trigger2 = AnimElem = 14
trigger2 = var(35) := 39 || var(36) := -99

[State 1201, Super Inazuma Kick Hit (Air)]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13 && !MoveContact && !MoveReversed
ID = 1201
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)) < 7, 4, fvar(11) * ifElse(var(10) = 2, 42, ifElse(var(10), 35, 28)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
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
ground.velocity = -1.25, -7.1875
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.25, -7.1875
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5981445313
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 39)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, Shock Particles]
type = Helper
trigger1 = AnimElemTime(12) >= 0
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1201, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1201)
value = 51005
ID = 1201
ignoreHitPause = 1
persistent = 0

[State 1201, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1201, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;====<EX IAIGERI>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1230
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
var(25) = 26

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 11, -81
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0
channel = 0

[State 1230, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,1
channel = 3

[State 1230, Iaigeri effect]
type = Explod
trigger1 = AnimElem = 4
ID = 1205
anim = 1225
bindTime = -1
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 4, fvar(11) * 84)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 16
guard.pauseTime = 0,16
animtype = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1230, Followup Detection Reset]
type = VarSet
trigger1 = !Time
var(14) = 0

[State 1230, Hando Sandangeri]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(10) < 0
trigger1 = !AILevel
;command = "D, U"
trigger1 = NumExplod(90012708)
;a / b / c
trigger1 = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
trigger2 = AILevel && MoveHit
trigger2 = P2BodyDist x <= 100
var(14) = 1231

[State 1230, Followup]
type = ChangeState
trigger1 = var(14) = [1000,2999]
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = var(14)

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<EX HANDO SANDANGERI>==
[StateDef 1231]
type = S
physics = N
moveType = A
velSet = 0,0
anim = 1211
ctrl = 0
sprPriority = 1
hitCountPersist = 1

[State 1231, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 37

[State 1231, Voice]
type = PlaySnd
trigger1 = !Time
value = 1201,0
channel = 0

[State 1201, VelSet]
type = VelSet
trigger1 = !Time
x = 4.375

[State 1231, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 4

[State 1231, Standing Far Kick Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
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
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.66,0
ground.cornerPush.velOff = 0
guard.velocity = -3.66
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1231, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0
channel = 5

[State 1231, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1231, Electricity Sound 1]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1300,1
channel = 6

[State 1231, Super Inazuma Kick FX]
type = Explod
trigger1 = AnimElem = 10
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1231, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 41,0
channel = 7

[State 1231, Electricity Sound 2]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1300,1
channel = 8

[State 1231, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 13
stateType = A
physics = N

[State 1231, Dust Helper]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 8100
ID = 8100
name = "Super Inazuma Kick Dust"
posType = P1
ownPal = 1

[State 1231, VelSet]
type = VelSet
trigger1 = AnimElem = 13
y = -8.125

[State 1231, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(13) > 0
y = 0.439453125

[State 1231, Super Inazuma Kick Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount))
trigger1 = AnimElem = 12
ID = 1231
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, Super Inazuma Kick Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount))
trigger1 = AnimElem = 13
ID = 1232
attr = A, SA
hitFlag = MAF
guardFlag = MA
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
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -98
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, Super Inazuma Kick Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount))
trigger1 = AnimElem = 14
ID = 1233
attr = A, SA
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
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 39), var(36) := -98
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 49)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1231, Shock Particles]
type = Helper
trigger1 = AnimElemTime(12) >= 0
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1231, TargetState 1]
type = TargetState
trigger1 = MoveHit && NumTarget(1231)
value = 1335
ID = 1231
ignoreHitPause = 1
persistent = 0

[State 1231, TargetState 2]
type = TargetState
trigger1 = MoveHit && NumTarget(1232)
value = 1335
ID = 1232
ignoreHitPause = 1
persistent = 0

[State 1231, TargetState 3]
type = TargetState
trigger1 = MoveHit && NumTarget(1233)
value = 51005
ID = 1233
ignoreHitPause = 1
persistent = 0

[State 1231, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1231, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;=<SUPER INAZUMA KICK>==
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, 1310)

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 1300, Electricity Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1
channel = 1

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 3

[State 1300, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Super Inazuma Kick Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ifElse(var(10) = 2, 0, ifElse(var(10) = 1, -1, -2))
y = ifElse(var(10) = 2, -8.125, ifElse(var(10) = 1, -6.875, -5.625))

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.439453125

[State 1300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1300, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
ID = 1300
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, Spark XY]
type = Null
trigger1 = AnimElem = 13
trigger1 = var(35) := 60 || var(36) := -98
trigger2 = AnimElem = 14
trigger2 = var(35) := 39 || var(36) := -99

[State 1300, Air Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
ID = 1300
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10) = 1, 56, 49)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 63, ifElse(var(10) = 1, 56, 49)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1300)
value = 51005
ID = 1300
ignoreHitPause = 1
persistent = 0

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1300, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Landing
[StateDef 1301]
type = S
anim = 1301
physics = N
moveType = I
velSet = 0,0

[State 1301, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1301, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX SUPER INAZUMA KICK>=
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
var(25) = 21

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 6,-62
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
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 1330, Electricity Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1
channel = 3

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 4

[State 1330, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Super Inazuma Kick Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = -8.125

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.439453125

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 1330, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
ID = 1330
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
ID = 1331
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -98
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
ID = 1332
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 39), var(36) := -98
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 49)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1330, TargetState 1]
type = TargetState
trigger1 = MoveHit && NumTarget(1330)
value = 1335
ID = 1330
ignoreHitPause = 1
persistent = 0

[State 1330, TargetState 2]
type = TargetState
trigger1 = MoveHit && NumTarget(1331)
value = 1335
ID = 1331
ignoreHitPause = 1
persistent = 0

[State 1330, TargetState 3]
type = TargetState
trigger1 = MoveHit && NumTarget(1332)
value = 51005
ID = 1332
ignoreHitPause = 1
persistent = 0

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;====<EX SUPER INAZUMA KICK (TARGET)>=
;Hit shake
[StateDef 1335]
type = S
moveType = H
physics = N
velset = 0,0

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = GetHitVar(AnimType) != [3,5]
value = ifElse((GetHitVar(GroundType) = 1), 5000, 5010) + GetHitVar(AnimType)

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
trigger1 = !Time
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 1335, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 7696 && Anim != 9010
trigger1 = Time > 0
value = Anim

[State 1335, StateTypeSet]
type = StateTypeSet
trigger1 = !Time
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
StateType = A

[State 1335, SelfState]
type = SelfState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yVel) = 0 && !GetHitVar(fall)
value = 5001

[State 1335, ChangeState]
type = ChangeState
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
trigger1 = HitShakeOver
value = 1336

[State 1335, SelfState]
type = ChangeState
trigger1 = HitShakeOver
value = 5030


;Air get-hit (knocked away)
[StateDef 1336]
type = A
moveType = H
physics = N
ctrl = 0

[State 1336, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 1336, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 1336, SelfState]
type = SelfState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.getHit.groundLevel)
value = 5040

[State 1336, SelfState]
type = SelfState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.getHit.groundLevel)
value = 5050

[State 1336, SelfState]
type = SelfState
trigger1 = vel y > 0
value = 5035



;====<SHINKU KATATEGOMA>=
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
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0
channel = 0

[State 1400, Step Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 100,0
channel = 1

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8
trigger2 = AnimElem = 9 || AnimElem = 12
trigger3 = (AnimElem = 13 || AnimElem = 16) && var(10)
trigger4 = (AnimElem = 17 || AnimElem = 20) && var(10) = 2
trigger5 = (AnimElem = 21 || AnimElem = 24) && var(10) = 2
value = 1,4

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0 && !var(10)
trigger2 = AnimElemTime(3) < 0 && var(10) = 1
trigger3 = AnimElemTime(2) < 0 && var(10) = 2
value = SCA
time = 1

[State 1400, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5 || AnimElem = 9
trigger2 = AnimElem = 13 && var(10)
trigger3 = (AnimElem = 17 || AnimElem = 21) && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 14, ifElse(var(10) = 1 && HitCount < 2, 14, 21)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 14, ifElse(var(10) = 1 && HitCount < 2, 14, 21)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 11
trigger2 = AnimElem = 15 && var(10)
trigger3 = (AnimElem = 19 || AnimElem = 23) && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 14, ifElse(var(10) = 1 && HitCount < 2, 14, 21)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 14, ifElse(var(10) = 1 && HitCount < 2, 14, 21)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -88), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Final Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 13 && !var(10)
trigger2 = AnimElem = 17 && var(10) = 1
trigger3 = AnimElem = 25 && var(10) = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 14, 28) < 7, 7, fvar(11) * ifElse(var(10) = 2, 14, 28))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -6.5, -8.5
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0 && !var(10)
trigger2 = AnimElemTime(18) >= 0 && var(10) = 1
trigger3 = AnimElemTime(26) >= 0 && var(10) = 2
moveType = I

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 15 && !var(10)
trigger2 = AnimElem = 19 && var(10) = 1
trigger3 = AnimElem = 27 && var(10) = 2
x = -32

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 16 && !var(10)
trigger2 = AnimElem = 20 && var(10) = 1
trigger3 = AnimElem = 28 && var(10) = 2
x = 16

[State 1400, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 17 && !var(10)
trigger2 = AnimElem = 21 && var(10) = 1
trigger3 = AnimElem = 29 && var(10) = 2
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1400, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 17 && !var(10)
trigger2 = AnimElem = 21 && var(10) = 1
trigger3 = AnimElem = 29 && var(10) = 2
value = 52,0
channel = 3

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX SHINKU KATATEGOMA>=
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
var(25) = 54

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 6,-50
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1400,0
channel = 0

[State 1430, Step Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 100,0
channel = 3

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 8
trigger2 = AnimElem = 9 || AnimElem = 12
trigger3 = AnimElem = 13 || AnimElem = 16
trigger4 = AnimElem = 17 || AnimElem = 20
trigger5 = AnimElem = 21 || AnimElem = 24
trigger6 = AnimElem = 25 || AnimElem = 28
value = 1,4

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 1430, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5 || AnimElem = 9 || AnimElem = 13 || AnimElem = 17 || AnimElem = 21 || AnimElem = 25
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 11 || AnimElem = 15 || AnimElem = 19 || AnimElem = 23 || AnimElem = 27
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -88), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Final Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 29
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -6.5, -8.5
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -48
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(30) >= 0
moveType = I

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 31
x = -32

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 32
x = 16

[State 1430, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 33
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 52,0
channel = 3

[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<BENIMARU COLLIDER>=
;Attempt
[StateDef 1500]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1500, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && !var(37)
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
p1StateNo = 1510

[State 1500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1500, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1510]
type = S
physics = N
moveType = A
anim = 1510
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1510, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1510, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1515

[State 1510, Width]
type = Width
trigger1 = AnimElemTime(16) < 0
edge = 80,0

[State 1510, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 34,-113

[State 1510, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 30,-108

[State 1510, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 37,-106

[State 1510, TargetBind 4 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 44,-110

[State 1510, TargetBind 4 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 39, ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1510, TargetBind 5 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(16) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 51,-110

[State 1510, TargetBind 5 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(16) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 46, ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1510, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(16) = 0
pos = 51,ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1510, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 16
value = floor(ifElse(ifElse(var(10) = 2, 140, ifElse(var(10) = 1, 133, 126)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -140, ifElse(var(10) = 1, -133, -126)) * fvar(11)))

[State 1510, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 16
value = 36

[State 1510, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 16
value = 72

[State 1510, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 16
value = 1

[State 1510, HitAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 16
var(13) = 1

[State 1510, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 16
var(15) = 1
ignoreHitPause = 1

[State 1510, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 16
value = 1516

[State 1300, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = NumTarget && AnimElem = 16
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1510, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1510,0
channel = 0

[State 1510, Electricity sound 1]
type = PlaySnd
trigger1 = !Time
value = 1510,1
channel = 1

[State 1510, Electricity sound 2]
type = PlaySnd
trigger1 = AnimElem = 16
value = 2,6
channel = 2

[State 1510, Benimaru Collider FX]
type = Explod
trigger1 = !Time
anim = 1505
removeTime = 48
sprPriority = 3
posType = P1
pos = 35,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1510, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1510, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 37
ampl = -4
freq = 120

[State 1510, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




;===<BENIMARU COLLIDER (TARGET)>==
;Being Thrown
[StateDef 1515]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1515, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1515

[State 1515, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 1515 && AnimElem = 2
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 1515, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 1515, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 1515, PalFX]
type = PalFX
trigger1 = !Time
trigger1 = !(SelfAnimExist(7696)) && !(SelfAnimExist(9010))
time = 71
mul = 192,192,192
sinAdd = 128,128,128,4


;After Throw
[StateDef 1516]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -5, -8.4375

[State 1516, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1516, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030
trigger1 = !AnimTime
value = 5050

[State 1516, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 1516, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1516, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.634765625

[State 1516, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1516, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1516, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<EX BENIMARU COLLIDER>=
;Attempt
[StateDef 1530]
type = S
physics = N
moveType = A
anim = 1530
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
trigger1 = var(20) := 0
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 9

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -14,-82
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800,0
channel = 0

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 3

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1 && !var(37)
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
p1StateNo = 1540

[State 1530, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 1530, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Throw
[Statedef 1540]
type = S
physics = N
moveType = A
anim = 1540
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1540, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 71

[State 1540, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1540, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1545

[State 1540, Width]
type = Width
trigger1 = AnimElemTime(20) < 0
edge = 80,0

[State 1540, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 34,-113

[State 1540, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 30,-108

[State 1540, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 37,-106

[State 1540, TargetBind 4 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 44,-110

[State 1540, TargetBind 4 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 39, ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1540, TargetBind 5 (no shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(20) < 0
trigger1 = !(Target, SelfAnimExist(7696)) && !(Target, SelfAnimExist(9010))
pos = 51,-110

[State 1540, TargetBind 5 (shocked anim)]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(20) < 0
trigger1 = Target, SelfAnimExist(7696) || Target, SelfAnimExist(9010)
pos = 46, ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1540, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(20) = 0
pos = 51,ifElse(-110 - (Target, const(size.head.pos.y)) < -40, -110 - (Target, const(size.head.pos.y)), 0)

[State 1540, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 20
value = floor(ifElse(140 * fvar(11) < 7, -7, -140 * fvar(11)))

[State 1540, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 20
value = 36

[State 1540, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 20
value = 1

[State 1540, HitAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 20
var(13) = 1

[State 1540, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 20
value = 1546

[State 1540, Super Dampener Flag]
type = VarAdd
trigger1 = NumTarget && AnimElem = 20
var(42) = 1

[State 1540, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = NumTarget && AnimElem = 20
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1540, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1510,0
channel = 0

[State 1540, Electricity sound 1]
type = PlaySnd
trigger1 = !Time
value = 1510,1
channel = 3

[State 1540, Electricity sound 2]
type = PlaySnd
trigger1 = AnimElem = 20
value = 2,6
channel = 2

[State 1540, Benimaru Collider FX]
type = Explod
trigger1 = !Time
anim = 1505
removeTime = 60
sprPriority = 3
posType = P1
pos = 35,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1540, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1540, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 37
ampl = -4
freq = 120

[State 1540, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<EX BENIMARU COLLIDER (TARGET)>==
;Being Thrown
[StateDef 1545]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1545, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1515

[State 1545, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 1515 && AnimElem = 2
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 1545, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 1545, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 1545, PalFX]
type = PalFX
trigger1 = !Time
trigger1 = !(SelfAnimExist(7696)) && !(SelfAnimExist(9010))
time = 67
mul = 192,192,192
sinAdd = 128,128,128,4


;After Throw
[StateDef 1546]
type = A
physics = N
movetype = H
ctrl = 0
velSet = 0,0

[State 1546, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
trigger1 = !SelfAnimExist(5955)
value = 1546

[State 1546, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5955)
value = 5955

[State 1545, PalFX]
type = PalFX
trigger1 = !Time
trigger1 = !(SelfAnimExist(7696)) && !(SelfAnimExist(9010))
time = -AnimTime
mul = 192,192,192
sinAdd = 128,128,128,4

[State 1546, VelSet]
type = VelAdd
trigger1 = pos y < 0
y = 0.58

[State 1546, PlaySnd]
type = PlaySnd
trigger1 = pos y > -vel y
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1546, Explod]
type = Explod
trigger1 = pos y > -vel y
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprPriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1546, PosSet]
type = PosSet
trigger1 = pos y > -vel y
y = 0

[State 1546, PosSet]
type = VelSet
trigger1 = pos y > -vel y
y = 0

[State 1546, VarSet]
type = VarSet
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
sysvar(0) = ifElse(Anim = 1546, 0, 1)

[State 1546, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
value = ifElse((Anim = 5950 || Anim = 5955) && SelfAnimExist(5112), 5112, 5110)
persistent = 0

[State 1546, SelfState]
type = SelfState
trigger1 = !AnimTime
trigger2 = AnimElemTime(AnimElemNo(0) + 1) = 0
value = 5110



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

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,0
channel = 0

[State 2900, Electricity Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1
channel = 1

[State 2900, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0
channel = 3

[State 2900, Super Inazuma Kick FX]
type = Explod
trigger1 = !Time
anim = 1305
sprPriority = 3
posType = P1
pos = 43,0
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Super Inazuma Kick Dust"
posType = P1
ownPal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -1
y = -6.875

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.439453125

[State 2900, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
ID = 2900
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 16
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
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -74
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Spark XY]
type = Null
trigger1 = AnimElem = 13
trigger1 = var(35) := 60 || var(36) := -98
trigger2 = AnimElem = 14
trigger2 = var(35) := 39 || var(36) := -99

[State 2900, Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
ID = 2900
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 16
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
ground.cornerpush.velOff = 0
guard.velocity = -10.52
guard.cornerpush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerpush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 56)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 2900, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(2900)
value = 51005
ID = 2900
ignoreHitPause = 1
persistent = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 2901


;Landing
[StateDef 2901]
type = S
anim = 47
physics = N
moveType = I
velSet = 0,0

[State 2901, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 2901, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 2901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 3

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
trigger1 = AnimElem = 3
value = 4,2
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = 0,0
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
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
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
