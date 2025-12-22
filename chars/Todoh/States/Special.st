; _________________________________________
;| Todoh by varo_hades                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<KASANE ATE>==
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

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 1000, Sonic Boom Startup FX]
type = Explod
trigger1 = AnimElem = 7
anim = 7001
sprPriority = 3
pos = 0,0
posType = P1
scale = 1, 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 1005
ID = 1005
name = "Kasane Ate Projectile"
posType = P1
pos = 70+(var(10)*10),0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX KASANE ATE>=
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
var(25) = 84

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

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 1000, Sonic Boom Startup FX]
type = Explod
trigger1 = AnimElem = 7
anim = 7001
sprPriority = 3
pos = 0,0
posType = P1
scale = 1, 1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Kasane Ate Projectile"
posType = P1
pos = 80,0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<TAIKUU>==
[StateDef 1050]
type = S
physics = S
moveType = A
anim = 1050
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
value = ifElse(var(10) = 2, 1070, ifElse(var(10) = 1, 1060, 1050))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,0
channel = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000, 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 1055
ID = 1055
name = "Taikuu Projectile"
posType = P1
pos = 40, -120
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX TAIKUU>=
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
var(25) = 84

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

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,0
channel = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000, 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 1085
ID = 1055
name = "EX Taikuu Projectile"
posType = P1
pos = 40, -120
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<AIR KASANE ATE>==
[StateDef 1100]
type = A
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
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 9
y = -2

[State 1100, Gravity]
type = Gravity
trigger1 = animelemtime(9) > 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000, 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1105
ID = 1105
name = "Air Kasane Ate Projectile"
posType = P1
pos = 40+(var(10)*10),-40
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 4030, ChangeState]
type = ChangeState
trigger1 = animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;Land
[Statedef 1101]
type = S
physics = S
ctrl = 0
anim = 1105
velset = 0,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 52, 0
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX AIR KASANE ATE>=
[StateDef 1130]
type = A
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
var(25) = 84

[State 1130, EX FX]
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

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 9
y = -2

[State 1100, Gravity]
type = Gravity
trigger1 = animelemtime(9) > 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000, 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1135
ID = 1105
name = "Air Kasane Ate Projectile"
posType = P1
pos = 50,-40
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 4030, ChangeState]
type = ChangeState
trigger1 = animelemtime(9) > 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;=<STUNNING GRAB>==
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
trigger1 = PrevStateNo = 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 1, ifElse((command = "y" || command = "rlsy"), 1, 1))

[State 1200, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 900, 1]
type = HitDef
triggerall = var(20)
triggerall = P2bodydist X = [-const(size.ground.front),ifelse(!var(10),34,ifelse(var(10)=1,36,38))]
trigger1 = AnimElem = 4
attr = S, ST
hitflag = MAFD
guardflag = -1
priority = 4, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1206
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 0
fall.recover = 0
ID = 1200
numhits = 0

[State 900, 1]
type = HitDef
triggerall = !var(20)
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2StateNo != [5000,5300]
triggerall = P2bodydist X = [-const(size.ground.front),ifelse(!var(10),34,ifelse(var(10)=1,36,38))]
trigger1 = AnimElem = 4
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1206
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
fall = 0
fall.recover = 0
ID = 1200
numhits = 0

[State 900, 1]
type = HitDef
triggerall = !var(20)
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = P2StateNo != [150,155]
triggerall = P2StateNo != [5000,5300]
triggerall = P2bodydist X = [-const(size.ground.front),ifelse(!var(10),34,ifelse(var(10)=1,36,38))]
trigger1 = AnimElem = 4
attr = S, ST
hitflag = M
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1206
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
fall = 0
fall.recover = 0
ID = 1200
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800, 0
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 5
movetype = I

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Connect
[Statedef 1201]
type = S
movetype = A
physics = S
anim = 1201
velset = 0,0

[State 1501, Throw]
type = TargetState
trigger1 = Time = 0
value = 1205

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) < 0
edge = 45,0

[State 1501, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 0
channel = 0

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 5
x = -2.5

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 901,1]
type = TargetBind
trigger1 = animelem = 1
pos = 54,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 3
pos = 47,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 4
pos = 39,0
time = 1

[State 901,1]
type = TargetBind
trigger1 = animelem = 5
pos = 37,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 9
pos = 37,0
time = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 9
attr = S, SA
animtype = Hard
air.animType = Back
fall.animType = Back
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pausetime = 3,ifElse(var(10) = 2, 20, ifElse(var(10), 20, 20))
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -55
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -4, -8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 0
fall.recover = 0
yaccel = .6
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
forcestand = 1
chainID = 1200

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1205]
type = S
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1502, HitFallSet]
type = HitFallSet
Trigger1 = !Time
value = 0

[State 1502, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1502, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1205

[State 1502, 1]
type = ChangeAnim
trigger1 = anim = 1205 && animtime = 0
value = 5002

[State 1502, 1]
type = ChangeAnim
trigger1 = anim = 5002 && animtime = 0
value = 5007

[State 170, 1]
type = NotHitBy
trigger1 = Time < 20
value = SCA

[State 903, 2]
type = SelfState
trigger1 = Time > 21
value = 0
ctrl = 1

;Player 2
[Statedef 1206]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;=<EX STUNNING GRAB>==
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
var(25) = 84

[State 1230, EX FX]
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

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 900, 1]
type = HitDef
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2StateNo != [5000,5300]
triggerall = P2bodydist X = [-const(size.ground.front),ifelse(!var(10),34,ifelse(var(10)=3,40,38))]
trigger1 = AnimElem = 4
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1231
p2stateno = 1206
guard.dist = 0
getPower = 0, 0
givePower = 36, 36
fall = 0
fall.recover = 0
ID = 1230
numhits = 0

[State 900, 1]
type = HitDef
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2StateNo != [5000,5300]
triggerall = P2bodydist X = [-const(size.ground.front),ifelse(!var(10),34,ifelse(var(10)=2,40,38))]
trigger1 = AnimElem = 4
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1231
p2stateno = 1206
guard.dist = 0
getPower = 0, 0
givePower = 36, 36
fall = 0
fall.recover = 0
ID = 1230
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800, 0
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 5
movetype = I

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Connect
[Statedef 1231]
type = S
movetype = A
physics = S
anim = 1201
velset = 0,0

[State 1501, Throw]
type = TargetState
trigger1 = Time = 0
value = 1205

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) < 0
edge = 45,0

[State 1501, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 0
channel = 0

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 5
x = -2.5

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 901,1]
type = TargetBind
trigger1 = animelem = 1
pos = 54,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 3
pos = 47,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 4
pos = 39,0
time = 1

[State 901,1]
type = TargetBind
trigger1 = animelem = 5
pos = 37,0
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 9
pos = 37,0
time = 1

[State 1100, HitDef]
type = HitDef
;trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 9
attr = S, SA
animtype = Hard
air.animtype = Back
fall.animtype = Back
damage = ceil(ifElse(fvar(11) * 78 < 7, 7, fvar(11) * 78)), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pausetime = 13, 14
guard.pausetime = 13, 14
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -55
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -15, -6.5
guard.velocity = -8.52
air.velocity = -15, -6.5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = 0
p2facing = 1
yaccel = .58
persistent = 0
getPower = 0, 0
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
forcestand = 1
chainID = 1230
ID = 1230

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1220, End]
type = targetstate
trigger1 = movehit
ID = 1230
value = 1111200
persistent = 0

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====< PUNCHED BY EX STUNNING GRAB>=
;--- Hit Pause ---
[Statedef 1111200]
type = A
movetype = H
physics = N
velset = 0, 0

[State 1111200, Anim]
type = changeanim
trigger1 = 1
value = 5002

[State 1111200, End]
type = changestate
trigger1 = hitshakeover
value = 1111201

;--- Falling ---
[Statedef 1111201]
type = A
movetype = H
physics = N

[State 1111201, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1111201, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1111201, screen]
type = null;screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 1111201, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111201, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111201, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1111202

[State 1111201, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100

;--- Hitting Wall ---
[Statedef 1111202]
type = A
movetype = H
physics = N

[State 1111202, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111202, Pos]
type = posset
trigger1 = 1
x = -160 * facing

[State 1111202, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111202, screen]
type = null;screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 1111202, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1111202, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111202, snd]
type = playsnd
trigger1 = !time
value = f7, 2

[State 1111202, FX]
type = explod
trigger1 = !time
anim = f72
scale = 0.6,0.6
pos = 0, floor(screenpos y) -50
postype = back
sprpriority = 3

[State 1111202, End]
type = changestate
trigger1 = time >= 4
value = 1111203

;--- Falling ---
[Statedef 1111203]
type = A
movetype = H
physics = N

[State 1111203, turn]
type = turn
trigger1 = !time

[State 1111203, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 1111203, Vel]
type = velset
trigger1 = !time
x = -4
y = -9.8

[State 1111203, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1111203, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050

[State 1111203, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1111203, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1111203, Push]
type = playerpush
trigger1 = 1
value = 0

[State 5210, 2] ;Recover In Air
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos y < -20
triggerall = alive
triggerall = power >= 2000
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIR RECOVER

[State 1111203, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100

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
value = 4, ifElse(Random < 500, 3, 4)
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
ground.type = Low
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
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -76
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
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 4
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
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -10
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
