; _________________________________________
;| Dhalsim by Knuckles8864                 |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<YOGA FIRE>==
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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Yoga Fire Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,2
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yoga Fire Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-53 * const(size.yScale))
size.xScale = 0.8 * const(size.xScale)
size.yScale = 0.3 * const(size.yScale)
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<EX YOGA FIRE>=
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
var(25) = 24

[State 1030, EX FX]
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

[State 1030, Yoga Fire Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,2
channel = 3

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Yoga Fire Projectile"
posType = P1
pos = ceil(85 * const(size.xScale)), ceil(-53 * const(size.yScale))
size.xScale = 0.8 * const(size.xScale)
size.yScale = 0.3 * const(size.yScale)
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<YOGA FLAME>==
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

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
value = 1100,0
channel = 0

[State 1100, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,1
channel = 1

[State 1100, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1105
ID = 1105
name = "Yoga Flame Projectile"
posType = P1
pos = ceil(81 * const(size.xScale)), ceil(-51 * const(size.yScale))
size.xScale = 0.9 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 1100, End]
type = ChangeState
trigger1 = NumHelper(1105)
trigger1 = Helper(1105), StateNo = 1107
trigger1 = AnimElemTime(6) >= 0
trigger2 = var(10) = 0 && Time = 41 || var(10) = 1 && Time = 56 || var(10) = 2 && Time = 71
trigger3 = Time >= 71
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



;====<EX YOGA FLAME>=
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
trigger1 = AnimElem = 2
value = 1100,0
channel = 0

[State 1130, Yoga Fire Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,1
channel = 3

[State 1130, Projectile]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 1135
ID = 1135
name = "EX Yoga Flame Projectile"
posType = P1
pos = ceil(81 * const(size.xScale)), ceil(-51 * const(size.yScale))
size.xScale = 0.9 * const(size.xScale)
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
trigger2 = var(10) = 3 && Time = 71
trigger3 = Time >= 71
value = 1101



;=<YOGA BLAST>==
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
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1200, Yoga Flame Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 1

[State 1200, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1205
ID = 1205
name = "Yoga Blast Projectile"
posType = P1
pos = ceil(67 * const(size.xScale)), ceil(-115 * const(size.yScale))
size.xScale = 0.8 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 1200, End]
type = ChangeState
trigger1 = NumHelper(1205)
trigger1 = Helper(1205), StateNo = 1207
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 0 && Time = 27 || var(10) = 1 && Time = 35 || var(10) = 2 && Time = 43
trigger3 = Time >= 43
value = 1201


;Finish
[StateDef 1201]
type = S
anim = 1201
physics = N
moveType = I
velSet = 0,0

[State 1201, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<EX YOGA BLAST>=
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
var(25) = 43

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -38, -61
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
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1230, Yoga Fire Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,1
channel = 3

[State 1230, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1235
ID = 1235
name = "EX Yoga Blast Projectile"
posType = P1
pos = ceil(67 * const(size.xScale)), ceil(-115 * const(size.yScale))
size.xScale = 0.8 * const(size.xScale)
size.yScale = 0.5 * const(size.yScale)
ownPal = 1

[State 1230, Width]
type = Width
trigger1 = AnimElemTime(6) = 0
value = 30,0

[State 1230, End]
type = ChangeState
trigger1 = NumHelper(1235)
trigger1 = Helper(1235), StateNo = 1207
trigger1 = AnimElemTime(5) >= 0
trigger2 = var(10) = 3 && Time = 43
trigger3 = Time >= 43
value = 1201


;====<YOGA TELEPORT>=
[Statedef 1300]
type = S
physics = N
moveType = I
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
; facep2 = 1

[State 1300, Button Detect]
type = Varset
trigger1 = !Time && !AiLevel
var(10) = ifelse(command = "YogaTeleportFront_3P", 0, ifelse(command = "YogaTeleportFront_3K", 1, ifelse(command = "YogaTeleportBack_3P", 2, 3)))

[State 1300, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(10) < 0
value = SCA
time = 1

[State 1300, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 1300, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 1300, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = 7
trans = AddAlpha
alpha = 21 * AnimElemTime(7), 256 - 21 * AnimElemTime(7)

[State 1300, Turn]
type = Turn
trigger1 = !AnimElemTime(7)
trigger1 = p2Dist x < 0
persistent = 0

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300, 0
channel = 0

[State 1300, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300, 1
channel = 1

[State 1300, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 2
channel = 1

[State 1300, PosAdd]
type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = ifElse(var(10) = 0, 4.0, ifElse(var(10) = 2, -4.0, ifElse(var(10) = 1, 8.0, -8.0)))

[State 1300, End State]
type = ChangeState
trigger1 = !AnimTime
value = 52
ctrl = 0


;====<AERIAL YOGA TELEPORT>=
[Statedef 1310]
type = A
physics = N
moveType = I
anim = 1310
ctrl = 0
velSet = 0,0
sprPriority = 1
; facep2 = 1

[State 1310, Button Detect]
type = Varset
trigger1 = !Time && !AiLevel
var(10) = ifElse(command = "YogaTeleportFront_3P", 0, ifElse(command = "YogaTeleportFront_3K", 1, ifElse(command = "YogaTeleportBack_3P", 2, 3)))

[State 1310, Vulnerability]
type = notHitBy
trigger1 = AnimElemTime(10) < 0
value = SCA
time = 1

[State 1310, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(8) < 0
value = 0

[State 1310, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 5]
trans = AddAlpha
alpha = 256 - 25 * time, 25 * time

[State 1310, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = 7
trans = AddAlpha
alpha = 21 * AnimElemTime(7), 256 - 21 * AnimElemTime(7)

[State 1310, Turn]
type = Turn
trigger1 = !AnimElemTime(7)
trigger1 = p2Dist x < 0
persistent = 0

[State 1310, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300, 0
channel = 0

[State 1310, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300, 1
channel = 1

[State 1310, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300, 2
channel = 1

[State 1310, PosAdd]
type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = ifElse(var(10) = 0, 4.0, ifElse(var(10) = 2, -4.0, ifElse(var(10) = 1, 8.0, -8.0)))

[State 1310, Increment Velocity]
type = VelAdd
trigger1 = AnimElemTime(11) > 0
y = 0.55458333

[State 1310, Control]
type = CtrlSet
trigger1 = !AnimElemTime(11)
value = 1

;[state 1310, Re-Levitate]
;type = changestate
;trigger1 = numhelper(4000)
;trigger1 = helper(4000),var(41)
;trigger1 = !animelemtime(8)
;value = 1800
;anim = 1801

[State 1310, End State]
type = ChangeState
trigger1 = Pos Y + Vel Y > 0
value = 52
ctrl = 0


;====<YOGA RECOVER>=
[Statedef 1320]
type = L
physics = N
moveType = I
anim = 1320
ctrl = 0
velSet = 0,0
sprPriority = 1
; facep2 = 1

[State 1320, Button Detect]
type = Varset
trigger1 = !Time && !AiLevel
var(10) = ifelse(command = "YogaTeleportFront_3P", 0, ifelse(command = "YogaTeleportFront_3K", 1, ifelse(command = "YogaTeleportBack_3P", 2, 3)))

[State 1320, Special Effect]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 1320, Vulnerability]
type = NotHitBy
trigger1 = AnimElemTime(14) < 0
value = SCA
time = 1

[State 1320, Solidity]
type = PlayerPush
trigger1 = AnimElemTime(11) < 0
value = 0

[State 1320, Set State Type]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
statetype = A
persistent = 0

[State 1320, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [1, 7]
trans = AddAlpha
alpha = 256 - 19 * Time, 19 * Time

[State 1320, Transparency]
type = Trans
trigger1 = AnimElemNo(0) = [9, 12]
trans = AddAlpha
alpha = 15 * AnimElemTime(9), 256 - 15 * AnimElemTime(9)

[State 1320, Turn]
type = Turn
trigger1 = !AnimElemTime(9)
trigger1 = p2Dist x < 0
persistent = 0

[State 1320, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = 1300, 0
channel = 0

[State 1320, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300, 1
channel = 1

[State 1320, Yoga Teleport Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1300, 2
channel = 1

[State 1320, Set Position]
type = PosAdd
trigger1 = AnimElemNo(0) = [2, 7]
y = -2.0

[State 1320, Set Position]
type = PosAdd
trigger1 = AnimElemNo(0) = 8
x = ifElse(var(10) = 0, 10.0, cond(var(10) = 2, -10.0, cond(var(10) = 1, 20.0, -20.0)))

[State 1320, Increment Velocity]
type = VelAdd
trigger1 = animelemtime(14) > 0
y = const(movement.yaccel)

[State 1320, Control]
type = CtrlSet
trigger1 = !AnimElemTime(14)
value = 1

[State 1320, End State]
type = ChangeState
trigger1 = AnimElemTime(14) > 0
trigger1 = Pos Y + Vel Y > 0
value = 52
ctrl = 0


;====<YOGA BARRAGE>=
;Startup
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
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = !NumEnemy
var(10) = 2

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumEnemy
var(10) = ifElse((EnemyNear, GetHitVar(HitTime) <= 4), 0, ifElse((EnemyNear, GetHitVar(HitTime) <= 6), 1, 2))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1420, ifElse(var(10) = 1, 1410, 1400))

[State 1400, Voice]
type = PlaySnd
trigger1 = !Time
value = 1400, 0
channel = 0

[State 1400, Dash Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 105, 0
channel = 2

[State 1400, Dust]
type = Helper
trigger1 = !AnimTime
helpertype = Normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 1401


;Looping
[StateDef 1401]
type = S
physics = N
moveType = A
anim = 1401
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1401, Button Detect]
type = VarSet
trigger1 = !Time
var(11) = var(10)

[State 1401, Button Detect]
type = VarSet
trigger1 = Time && !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
var(11) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1401, Button Detect (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = Time && AnimElem = 5
var(11) = ifElse(Random < 500, 2, ifElse(Random < 500, 1, 0))

[State 1401, Tap Punch (AI)]
type = VarSet
trigger1 = AILevel
trigger1 = NumEnemy
trigger1 = P2StateType != A && (P2BodyDist x = [0,58])
var(46) = 10

[State 1401, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1421, ifElse(var(10) = 1, 1411, 1401))

[State 1401, Loop]
type = ChangeAnim
trigger1 = !AnimTime
trigger2 = Anim = 1401
trigger2 = var(11) != 0 && AnimElemTime(5) >= 0
trigger3 = Anim = 1411
trigger3 = var(11) != 1 && AnimElemTime(6) >= 0
value = ifElse(var(11) = 2, 1421, ifElse(var(11) = 1, 1411, 1401))
elem = 1

[State 1401, VelSet]
type = VelSet
trigger1 = !Time
trigger1 = PrevStateNo = 1400
x = ifelse(var(10) = 2, 10.07, ifelse(var(10) = 1, 7.68, 6.44))

[State 1401, VelAdd]
type = VelAdd
trigger1 = vel x > 0
x = ifelse(var(10) = 2, -0.71862, -0.53896)

[State 1401, Stop]
type = VelSet
trigger1 = vel x < 0
x = 0

[state 1401, Increment Position]
type = posadd
trigger1 = animelemno(0) % 2 = 0
trigger1 = !animelemtime(animelemno(0))
x = 1.0

[State 1401, Effect]
type = MakeDust
trigger1 = AnimElemNo(0) = 1
trigger2 = AnimElemNo(0) = 3
trigger3 = AnimElemNo(0) = 5
pos = 13, -5
pos2 = -27, -5
ignoreHitPause = 1

[State 1401, Voice]
type = PlaySnd
trigger1 = AnimElemTime(1) = 1
trigger2 = AnimElemTime(5) = 1
value = 1400,1
channel = 0

[State 1401, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 3
trigger3 = AnimElem = 5
value = 1,0

[State 1401, Spark XY]
type = Null
trigger1 = AnimElem = 1
trigger1 = var(35) := 122 || var(36) := -53
trigger2 = AnimElem = 3
trigger2 = var(35) := 141 || var(36) := -76
trigger3 = AnimElem = 5
trigger3 = var(35) := 107 || var(36) := -36

[State 1401, HitDef Middle]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(10)
ground.slideTime = 18 + 4 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1401, HitDef High]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(10)
ground.slideTime = 18 + 4 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1401, HitDef Low]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(10)
ground.slideTime = 18 + 4 * var(10)
guard.hitTime = ifElse(var(10) = 2, 12, ifElse(var(10), 9, 15))
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1401, End]
type = ChangeState
trigger1 = var(46) <= 0
value = 1402


;Recover
[Statedef 1402]
type = S
physics = N
moveType = I
anim = 1402
ctrl = 0
sprPriority = 1
moveHitPersist = 1

[State 1402, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1422, ifelse(var(10) = 1, 1412, 1402))

[State 1402, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;====<EX YOGA BARRAGE>=
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
var(25) = 35

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -102
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
trigger1 = !Time
value = 1400, 0
channel = 0

[State 1430, Dash Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 105, 0
channel = 2

[State 1430, Dust]
type = Helper
trigger1 = !AnimTime
helpertype = Normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1


[State 1430, End]
type = ChangeState
trigger1 = !AnimTime
value = 1431


;Looping
[StateDef 1431]
type = S
physics = N
moveType = A
anim = 1430
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1431, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.89828;-0.71862

[State 1431, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1431, Vel]
type = velset
trigger1 = !time
trigger1 = prevstateno = 1430
x = 12.44

[State 1431, Effect]
type = MakeDust
trigger1 = AnimElemNo(0) = 1
trigger2 = AnimElemNo(0) = 3
trigger3 = AnimElemNo(0) = 5
pos = 13, -5
pos2 = -27, -5
ignoreHitPause = 1

[State 1431, Voice]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
trigger2 = AnimElemTime(11) = 1
trigger3 = AnimElemTime(22) = 1
value = 1400,1
channel = 0

[State 1431, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 3
trigger3 = AnimElem = 5
trigger4 = AnimElem = 7
trigger5 = AnimElem = 9
trigger6 = AnimElem = 11
value = 1,0

[State 1431, Spark XY]
type = Null
trigger1 = AnimElem = 1 || AnimElem = 7
trigger1 = var(35) := 122 || var(36) := -53
trigger2 = AnimElem = 3 || AnimElem = 9
trigger2 = var(35) := 141 || var(36) := -76
trigger3 = AnimElem = 5 || AnimElem = 11
trigger3 = var(35) := 107 || var(36) := -36

[State 1431, HitDef Middle]
type = HitDef
trigger1= !var(16) && var(15) < 4
trigger1 = AnimElem = 1 || AnimElem AnimElem = 7
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 8, 8
guard.pauseTime = 8, 8
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1431, HitDef High]
type = HitDef
trigger1= !var(16) && var(15) < 4
trigger1 = AnimElem = 3 || AnimElem = 9
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 8, 8
guard.pauseTime = 8, 8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1431, HitDef Low]
type = HitDef
trigger1= !var(16) && var(15) < 4
trigger1 = AnimElem = 5 || AnimElem = 11
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = 8, 8
guard.pauseTime = 8, 8
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1431, End]
type = ChangeState
trigger1 = !AnimTime
value = 1402



;====<YOGA GRASP>=
;Startup
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
var(10) = ifElse(command = "kk", 3, ifElse(command = "c", 2, ifElse(command = "b", 1, 0)))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = !NumEnemy
var(10) = 2

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumEnemy
var(10) = ifElse((EnemyNear, GetHitVar(HitTime) <= 4), 0, ifElse((EnemyNear, GetHitVar(HitTime) <= 6), 1, 2))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Voice]
type = PlaySnd
trigger1 = !Time
value = 1400, 0
channel = 0

[State 1500, Hit]
type = HitDef
trigger1 = movetype = A
trigger1 = p2stateno != [150, 155]
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(4) >= 0
attr = S, ST
hitFlag = M
priority = 1, Miss
damage = 0
ID = 1500
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
p1StateNo = cond(AnimElemTime(5) < 0, 1501, cond(animelemtime(6) < 0, 1511, cond(animelemtime(8) < 0, 1521, 1531)))
forceStand = 1

[State 1500, Idle]
type = StateTypeSet
trigger1 = var(10) = 0 && AnimElemTime(5) >= 0
trigger2 = var(10) = 1 && AnimElemTime(6) >= 0
trigger3 = var(10) = 2 && AnimElemTime(8) >= 0
trigger4 = var(10) = 3 && AnimElemTime(10) >= 0
movetype = I
persistent = 0

[State 1500, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Light Yoga Grasp Success
[Statedef 1501]
type = S
physics = S
moveType = A
anim = 1501
velSet = 0,0

[State 1511, EX Flash]
type = VarSet
triggerAll = var(10) = 3
trigger1 = !Time
var(25) = 75

[State 1501, End State]
type = ChangeState
trigger1 = !AiLevel
trigger1 = !AnimElemTime(2)
trigger1 = command = "holdback"
trigger2 = AiLevel
trigger2 = !AnimElemTime(2)
trigger2 = Random < 750
value = 1502

[State 1501, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1501, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1503

[State 1501, Special Effect]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 1501, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50
edge = 75,0

[State 1501, Width]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 32,0
ignoreHitPause = 1

[State 1501, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1400, 1
channel = 0

[State 1501, Hit Sound]
type = playsnd
trigger1 = AnimElem = 6
value = 2, 2
channel = 3

[State 1501, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(112 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1501, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1501, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(6) < 0
pos = ceil(64 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1501, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 6 && var(10) != 3
value = floor(ifElse(ifElse(var(10) = 2,105, ifElse(var(10), 98, 91)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -105, ifElse(var(10), -98, -91)) * fvar(11)))

[State 1501, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 6 && var(10) = 3
value = floor(ifElse(119 * fvar(11) < 7, -7, -119 * fvar(11)))

[State 1501, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 6
value = 36

[State 1501, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 6 && var(10) != 3
value = 72

[State 1501, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 6 && var(10) = 3
value = 0

[State 1501, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 6
value = 1

[State 1501, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(13) = 1

[State 1501, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 6
var(15) = 1
ignoreHitPause = 1

[State 1501, TargetState]
type = TargetState
trigger1 = AnimElem = 6 && NumTarget
value = 1504

[State 1501, EnvShake]
type = EnvShake
trigger1 = AnimElem = 6 && NumTarget
time = 12
ampl = 6
freq = 120

[State 1501, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 6
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 56, -64
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1501, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;LK Yoga Grasp (Target)
[StateDef 1503]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1503, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1505

[State 1503, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 1503, Own State]
type = selfstate
trigger1 = !gethitvar(isbound)
trigger1 = time > 100
value = 5050


;After Throw
[StateDef 1504]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1504, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1504, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1504, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
trigger1 = SelfAnimExist(5035)
value = 5035

[State 1504, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5050 && !AnimTime
value = 5050

[State 1504, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1504, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 1504, VelSet]
type = VelSet
trigger1 = !Time
x = -2.75
y = -8.0

[State 1504, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1504, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1504, ChangeAnim]
type = ChangeAnim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = SelfAnimExist(5051)
value = 5051

[State 1504, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;=<YOGA GRASP (BODY SLAM)>==
[Statedef 1502]
type = S
physics = S
moveType = A
anim = 1502
velSet = 0,0

[State 1502, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1502, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1513

[State 1502, EX Flash]
type = VarSet
triggerAll = var(10) = 3
trigger1 = !Time
var(25) = 53

[State 1502, Width]
type = Width
trigger1 = !AnimElemTime(5)
edge = 0, 112

[State 1502, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 1502, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1400, 1
channel = 0

[State 1502, Impact Sound]
type = playsnd
trigger1 = AnimElem = 5
value = 1400, 2
channel = 3

[State 1502, Width]
type = Width
trigger1 = AnimElemTime(4) < 0
edge = 64,0
ignoreHitPause = 1

[State 1502, Width]
type = Width
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0
edge = 90,0
ignoreHitPause = 1

[state 1502, Target Bind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1502, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(64 * const(size.xScale)), ceil(-56 * const(size.yScale))

[State 1502, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(-24 * const(size.xScale)), ceil(-104 * const(size.yScale))

[State 1502, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(-40 * const(size.xScale)), ceil(-80 * const(size.yScale))

[State 1502, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) = 0
pos = ceil(-120 * const(size.xScale)), ceil(-24 * const(size.yScale))

[State 1502, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5 && var(10) != 3
value = floor(ifElse(ifElse(var(10) = 2,112, ifElse(var(10), 105, 98)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -112, ifElse(var(10), -105, -98)) * fvar(11)))

[State 1502, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5 && var(10) = 3
value = floor(ifElse(119 * fvar(11) < 7, -7, -126 * fvar(11)))

[State 1502, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 1502, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && var(10) != 3
value = 72

[State 1502, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && var(10) = 3
value = 0

[State 1502, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 1502, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 1502, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 1502, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 5
time = 14
ampl = -4
freq = 120

[State 1502, Impact Dust]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
facing = -1
pos = ceil(-112 * const(size.xScale)), ceil(0 * const(size.yScale))
ownPal = 1

[State 1502, Throw]
type = TargetState
trigger1 = NumTarget && AnimElemTime(5) = 20
value = 1514

[State 1502, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<YOGA GRASP (BODY SLAM)(TARGET)>==
;Being Thrown
[StateDef 1513]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1513, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1506

[State 1513, roop]
type = AngleDraw
trigger1 = 1
value = -45 * (animelemno(0) = 3) + -90 * (animelemno(0) = 4) + -180 * (animelemno(0) = 5)

[State 1513, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1


;After Throw
[StateDef 1514]
type = A
physics = N
movetype = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1514, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1507

[State 1514, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 1514, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 1514, VelSet]
type = VelSet
trigger1 = !Time
x = 3.0
y = -5.9

[State 1514, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 1514, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1514, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;Medium Yoga Grasp Success
[Statedef 1511]
type = S
physics = S
moveType = A
anim = 1511
velSet = 0,0

[State 1511, EX Flash]
type = VarSet
triggerAll = var(10) = 3
trigger1 = !Time
var(25) = 78

[State 1511, End State]
type = ChangeState
trigger1 = !AiLevel
trigger1 = !AnimElemTime(3)
trigger1 = command = "holdback"
trigger2 = AiLevel
trigger2 = !AnimElemTime(3)
trigger2 = Random < 750
value = 1502

[State 1511, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1511, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1512

[State 1511, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50
edge = 75,0

[State 1511, Width]
type = Width
trigger1 = AnimElemTime(7) < 0
edge = 32,0
ignoreHitPause = 1

[State 1511, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1400, 1
channel = 0

[State 1511, Hit Sound]
type = playsnd
trigger1 = AnimElem = 7
value = 2, 2
channel = 3

[State 1511, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(144 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1511, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(112 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1511, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1511, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(7) < 0
pos = ceil(64 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1511, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7 && var(10) != 3
value = floor(ifElse(ifElse(var(10) = 2,105, ifElse(var(10), 98, 91)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -105, ifElse(var(10), -98, -91)) * fvar(11)))

[State 1511, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 7 && var(10) = 3
value = floor(ifElse(119 * fvar(11) < 7, -7, -119 * fvar(11)))

[State 1511, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 7
value = 36

[State 1511, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 7 && var(10) != 3
value = 72

[State 1511, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 7 && var(10) = 3
value = 0

[State 1511, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 7
value = 1

[State 1511, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(13) = 1

[State 1511, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 7
var(15) = 1
ignoreHitPause = 1

[State 1511, TargetState]
type = TargetState
trigger1 = AnimElem = 7 && NumTarget
value = 1504

[State 1511, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7 && NumTarget
time = 12
ampl = 6
freq = 120

[State 1511, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 7
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 56, -64
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1511, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;MK Yoga Grasp (Target)
[StateDef 1512]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1512, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1515

[State 1512, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



;Heavy Yoga Grasp Success
[Statedef 1521]
type = S
physics = S
moveType = A
anim = 1521
velSet = 0,0

[State 1521, EX Flash]
type = VarSet
triggerAll = var(10) = 3
trigger1 = !Time
var(25) = 84

[State 1521, End State]
type = ChangeState
trigger1 = !AiLevel
trigger1 = !AnimElemTime(5)
trigger1 = command = "holdback"
trigger2 = AiLevel
trigger2 = !AnimElemTime(5)
trigger2 = Random < 750
value = 1502

[State 1521, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1521, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1522

[State 1521, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50
edge = 75,0

[State 1521, Width]
type = Width
trigger1 = AnimElemTime(9) < 0
edge = 32,0
ignoreHitPause = 1

[State 1521, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1400, 1
channel = 0

[State 1521, Hit Sound]
type = playsnd
trigger1 = AnimElem = 9
value = 2, 2
channel = 3

[State 1521, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(192 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(176 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(144 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(112 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(9) < 0
pos = ceil(64 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1521, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9 && var(10) != 3
value = floor(ifElse(ifElse(var(10) = 2,105, ifElse(var(10), 98, 91)) * fvar(11) < 7, -7, ifElse(var(10) = 2, -105, ifElse(var(10), -98, -91)) * fvar(11)))

[State 1521, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9 && var(10) = 3
value = floor(ifElse(119 * fvar(11) < 7, -7, -119 * fvar(11)))

[State 1521, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 9
value = 36

[State 1521, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && var(10) != 3
value = 72

[State 1521, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && var(10) = 3
value = 0

[State 1521, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 9
value = 1

[State 1521, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(13) = 1

[State 1521, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(15) = 1
ignoreHitPause = 1

[State 1521, TargetState]
type = TargetState
trigger1 = AnimElem = 9 && NumTarget
value = 1504

[State 1521, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9 && NumTarget
time = 12
ampl = 6
freq = 120

[State 1521, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 9
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 56, -64
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1521, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;HK Yoga Grasp (Target)
[StateDef 1522]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1522, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1525

[State 1522, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



;====<EX YOGA GRASP>=
;Startup
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
var(25) = 19

[State 1530, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -2, -77
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1530, Voice]
type = PlaySnd
trigger1 = !Time
value = 1400, 0
channel = 0

[State 1530, Hit]
type = HitDef
trigger1 = movetype = A
trigger1 = p2stateno != [150, 155]
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(4) >= 0 && !var(43)
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
p1StateNo = cond(AnimElemTime(5) < 0, 1501, cond(AnimElemTime(6) < 0, 1511, cond(AnimElemTime(8) < 0, 1521, 1531)))

[State 1530, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
movetype = I
persistent = 0

[State 1530, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;EX Yoga Grasp Success
[Statedef 1531]
type = S
physics = S
moveType = A
anim = 1531
velSet = 0,0

[State 1531, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 93

[State 1531, End State]
type = ChangeState
trigger1 = !AiLevel
trigger1 = !AnimElemTime(7)
trigger1 = command = "holdback"
trigger2 = AiLevel
trigger2 = !AnimElemTime(5)
trigger2 = Random < 750
value = 1502

[State 1531, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1531, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1532

[State 1531, Width]
type = Width
trigger1 = AnimElem = 1 && FrontEdgeDist < 50 || AnimElem = 2 && FrontEdgeDist < 50
edge = 75,0

[State 1531, Width]
type = Width
trigger1 = AnimElemTime(12) < 0
edge = 32,0
ignoreHitPause = 1

[State 1531, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1400, 1
channel = 0

[State 1531, Hit Sound]
type = playsnd
trigger1 = AnimElem = 12
value = 2, 2
channel = 3

[State 1531, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = ceil(264 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = ceil(240 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = ceil(224 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = ceil(192 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = ceil(176 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = ceil(144 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = ceil(112 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = ceil(80 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(12) < 0
pos = ceil(64 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 1531, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 12
value = floor(ifElse(119 * fvar(11) < 7, -7, -119 * fvar(11)))

[State 1531, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 12 && !var(20)
value = 72

[State 1531, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 12
value = 1

[State 1531, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 12
var(13) = 1

[State 1531, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 12
var(15) = 1
ignoreHitPause = 1

[State 1531, TargetState]
type = TargetState
trigger1 = AnimElem = 12 && NumTarget
value = 1504

[State 1531, EnvShake]
type = EnvShake
trigger1 = AnimElem = 12 && NumTarget
time = 12
ampl = 6
freq = 120

[State 1531, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 12
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 56, -64
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1531, End State]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Heavy Yoga Grasp (Target)
[StateDef 1532]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1532, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1535

[State 1532, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



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
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 1, 2)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,1
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 3
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

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(11) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 3
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, Slide Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 101,0
channel = 3

[State 2910, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8103
ID = 8100
name = "Slide Dust"
posType = p1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 2910, VelSet]
type = VelSet
trigger1 = !AnimElemTime(4)
x = 11.0

[State 2910, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
trigger1 = AnimElemTime(11) < 0
x = -1.0

[State 2910, VelSet]
type = VelSet
trigger1 = !AnimElemTime(11)
x = 0.0

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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -24
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(8) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
