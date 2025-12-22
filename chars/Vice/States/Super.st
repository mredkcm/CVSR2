; _________________________________________
;| Vice by Jmorphman                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<NEGATIVE GAIN>=
;Throw Attempt
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
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 30,-76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3000, Safety]
type = SuperPause
trigger1 = AnimElem = 2 && NumEnemy
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 36
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, HitDef]
type = HitDef
trigger1 = AnimElem = 2 && !var(43)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 36
attr = S, HT
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
p1StateNo = 3010

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = -9

[State 3000, PosAdd]
type = PosAdd
trigger1 = AnimElem = 8
x = -24

[State 3000, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 8102
sprPriority = -3
posType = P1
pos = 11,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 52,0

[State 3000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3010]
type = S
anim = 3010
physics = N
moveType = A
velSet = 0,0

[State 3010, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3010, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3015

[State 3010, Width]
type = Width
trigger1 = 1
edge = 0,64
ignoreHitPause = 1

[State 3010, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4,1
channel = 0

[State 3010, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 3010, BindToTarget]
type = BindToTarget
trigger1 = NumTarget
trigger1 = AnimElemTime(4) < 0
pos = 25,72,Head

[State 3010, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 55,-45

[State 3010, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 58, -68

[State 3010, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 28, -100

[State 3010, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = -5, -109

[State 3010, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0
pos = -16, -76

[State 3010, Gravity]
type = Gravity
trigger1 = AnimElemTime(8) >= 0

[State 3010, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(8) >= 0
value = ifElse(PrevStateNo = 3050, 3060, 3011)


;First Hit
[StateDef 3011]
type = S
anim = 3011
physics = N
moveType = A
velSet = 0,0

[State 3011, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3011, VarSet]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3011, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3011, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3016

[State 3011, Width]
type = Width
trigger1 = 1
edge = 0,64
ignoreHitPause = 1

[State 3011, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3011, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = -55,0
ownPal = 1

[State 3011, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3011, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4,1
channel = 0

[State 3011, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 1

[State 3011, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = -35

[State 3011, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = -44,-8

[State 3011, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = 11,-20

[State 3011, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = 55,-45

[State 3011, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = 58, -68

[State 3011, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = 26, -110

[State 3011, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
pos = -7, -122

[State 3011, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
pos = -23, -103

[State 3011, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(14) >= 0
pos = -33, -34

[State 3011, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 0

[State 3011, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3011, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3011, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3011, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3011, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3011, TargetState]
type = TargetState
trigger1 = AnimElem = 7 && NumTarget
value = 3017

[State 3011, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = -1
y = -5.4375

[State 3011, VelMul]
type = VelMul
trigger1 = AnimElemTime(8) > 0
x = 1

[State 3011, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 8
stateType = A
physics = N

[State 3011, Gravity]
type = VelAdd
trigger1 = AnimElemTime(8) > 0
y = 0.5625

[State 3011, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3012


;Second Hit
[StateDef 3012]
type = S
anim = 3012
physics = N
moveType = A
velSet = 0,0

[State 3012, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3012, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3012, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3016

[State 3012, Width]
type = Width
trigger1 = 1
edge = 0,64
ignoreHitPause = 1

[State 3012, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3012, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = -22,0
ownPal = 1

[State 3012, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3011, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 4,1
channel = 0

[State 3012, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5
channel = 1

[State 3012, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = -18,-7

[State 3012, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -4,-7

[State 3012, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 11,-20

[State 3012, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 55,-45

[State 3012, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = 58, -68

[State 3012, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = 26, -110

[State 3012, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = -7, -122

[State 3012, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = -23, -103

[State 3012, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
pos = -33, -34

[State 3012, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0
pos = 0, -10

[State 3012, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 0

[State 3012, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3012, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3012, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3012, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3012, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3012, TargetState]
type = TargetState
trigger1 = AnimElem = 5 && NumTarget
value = 3018

[State 3012, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = -2
y = -8.4375

[State 3012, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = 1

[State 3012, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 3012, Gravity]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 0.5625

[State 3012, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3013


;Final Hit
[StateDef 3013]
type = S
anim = 3013
physics = N
moveType = I
velSet = 0,0

[State 3013, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3013, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3013, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1066

[State 3013, Width]
type = Width
trigger1 = 1
edge = 0,64
ignoreHitPause = 1

[State 3013, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3013, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 3013,0
channel = 0

[State 3013, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
ownPal = 1

[State 3013, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3013, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 0,-10

[State 3013, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(ifElse(var(10) = 1, 63, 70) * fvar(11) < 7, -7, ifElse(var(10) = 1, -63, -70) * fvar(11)))

[State 3013, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3013, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3013, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3013, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3013, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3013, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 16

[State 3013, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 6
y = -8.5

[State 3013, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = 0.4

[State 3013, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 12
stateType = A
physics = N

[State 3013, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 41,0
channel = 1

[State 3013, Dust Helper]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3013, TargetState]
type = TargetState
trigger1 = AnimElem = 12 && NumTarget
value = 3019

[State 3013, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1051


;Negative Gain (Target)
[StateDef 3015]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3015, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3015

[State 3015,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Slammed against Ground
[StateDef 3016]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3016, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 3016

[State 3016, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 3016
value = 5080

[State 3016, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;First Hit
[StateDef 3017]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3017, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3017

[State 3017,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Second Hit
[StateDef 3018]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3018, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3018

[State 3018,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Final Hit
[StateDef 3019]
type = A
physics = N
movetype = H
ctrl = 0
velset = 5,-8.5

[State 3019, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 3019, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3019, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 3019, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3019, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 3019, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<MAX NEGATIVE GAIN>=
;Throw Attempt
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 30,-76
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3050, Safety]
type = SuperPause
trigger1 = AnimElem = 2 && NumEnemy
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 60
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, HitDef]
type = HitDef
trigger1 = AnimElem = 2 && !var(43)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 60
attr = S, HT
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
p1StateNo = 3010

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = -4.5
y = -6.5

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.4

[State 3050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41, 0

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1062


;First Hit
[StateDef 3060]
type = S
anim = 3060
physics = N
moveType = A
velSet = 0,0

[State 3060, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3060, VarSet]
type = VarSet
trigger1 = !Time
var(10) = 1

[State 3060, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3060, TargetState]
type = TargetState
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
value = 3016

[State 3060, Width]
type = Width
trigger1 = 1
edge = 0,64
ignoreHitPause = 1

[State 3060, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
value = 1061,0
channel = 3

[State 3060, Impact Dust]
type = Helper
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = -55,0
ownPal = 1

[State 3060, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3060, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 23
trigger3 = AnimElem = 36
value = 4,1
channel = 0

[State 3060, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 22
trigger3 = AnimElem = 35
value = 1,5
channel = 1

[State 3060, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 20
trigger3 = AnimElem = 33
x = -35

[State 3060, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
pos = -44,-8

[State 3060, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
trigger3 = AnimElemTime(34) >= 0 && AnimElemTime(35) < 0
pos = 11,-20

[State 3060, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
trigger2 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
trigger3 = AnimElemTime(35) >= 0 && AnimElemTime(36) < 0
pos = 55,-45

[State 3060, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
trigger2 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger3 = AnimElemTime(36) >= 0 && AnimElemTime(37) < 0
pos = 58, -68

[State 3060, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
trigger2 = AnimElemTime(24) >= 0 && AnimElemTime(25) < 0
pos = 28, -100

[State 3060, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
trigger2 = AnimElemTime(25) >= 0 && AnimElemTime(26) < 0
pos = -5, -109

[State 3060, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
trigger2 = AnimElemTime(26) >= 0 && AnimElemTime(27) < 0
pos = -16, -76

[State 3060, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(37) >= 0 && AnimElemTime(38) < 0
pos = 26, -110

[State 3060, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(38) >= 0 && AnimElemTime(39) < 0
pos = -7, -122

[State 3060, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(39) >= 0 && AnimElemTime(40) < 0
pos = -23, -103

[State 3060, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(40) >= 0
pos = -33, -34

[State 3060, Damage]
type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 0

[State 3060, TargetPowerAdd]
type = TargetPowerAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
value = 36

[State 3060, HitAdd]
type = HitAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
value = 1

[State 3060, HitCount]
type = VarAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
var(13) = 1

[State 3060, Juggle]
type = VarAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
var(15) = 1
ignoreHitPause = 1

[State 3060, EnvShake]
type = EnvShake
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElem = 14
trigger3 = AnimElem = 27
time = 14
ampl = -4
freq = 120

[State 3060, TargetState]
type = TargetState
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 20
value = 3065

[State 3060, TargetState]
type = TargetState
triggerAll = NumTarget
trigger1 = AnimElem = 33
value = 3017

[State 3060, VelSet]
type = VelSet
trigger1 = AnimElem = 34
x = -1
y = -5.4375

[State 3060, VelMul]
type = VelMul
trigger1 = AnimElemTime(34) > 0
x = 1

[State 3060, Gravity]
type = VelAdd
trigger1 = AnimElemTime(34) > 0
y = 0.5625

[State 3060, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 34
stateType = A
physics = N

[State 3060, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3012


;First Three Hits (Target)
[StateDef 3065]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3065, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3065

[State 3065,  ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1



;====<WITHERING SURFACE>=
;Startup
[StateDef 3100]
type = S
physics = S
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
var(17) = 43

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
trigger1 = AnimElemTime(2) < 0
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
pos = 48,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "holdz", 2, ifElse(command = "holdy", 1, 0))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 215, 2, ifElse(P2Dist x > 195, 1, 0))

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100 Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41,0
channel = 1

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = ifElse(var(10) = 2, 8, ifElse(var(10), 6, 4))
y = ifElse(var(10) = 2, -5, ifElse(var(10), -7.5, -12))

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = ifElse(var(10) = 2, 0.5, ifElse(var(10), 0.6875, 0.875))

[State 3100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 3100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Throw Attempt
[StateDef 3101]
type = S
anim = 3101
physics = N
moveType = A
velSet = 0,0

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

[State 3101, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3101, Safety]
type = SuperPause
trigger1 = AnimElem = 5 && NumEnemy
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 36
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3101, HitDef]
type = HitDef
trigger1 = AnimElem = 5 && !var(43)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 36
attr = S, HT
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
p1StateNo = 3110

[State 3101, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 3101, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 1

[State 3101, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3110]
type = S
anim = 3110
physics = N
moveType = A
velSet = 0,0

[State 3110, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3110, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3115

[State 3110, Width]
type = Width
trigger1 = AnimElemTime(7) < 0
edge = 32,0
ignoreHitPause = 1

[State 3110, Width]
type = Width
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(31) < 0
edge = 84,0
ignoreHitPause = 1

[State 3110, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 22
value = 4,1
channel = 0

[State 3110, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 38
value = 1310,0
channel = 0

[State 3110, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
trigger3 = AnimElemTime(35) >= 0 && AnimElemTime(36) < 0
pos = 40,0

[State 3110, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
pos = 25,-125

[State 3110, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
pos = -13,-128

[State 3110, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger2 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
pos = -16,-120

[State 3110, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
pos = -18, -118

[State 3110, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
pos = 20, -108

[State 3110, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(15) < 0
trigger2 = AnimElemTime(24) >= 0 && AnimElemTime(32) < 0
pos = 80, -5

[State 3110, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
trigger2 = AnimElemTime(32) >= 0 && AnimElemTime(33) < 0
pos = 64, 7

[State 3110, TargetBind 9]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
trigger2 = AnimElemTime(33) >= 0 && AnimElemTime(34) < 0
pos = 49, -17

[State 3110, TargetBind 10]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger2 = AnimElemTime(34) >= 0 && AnimElemTime(35) < 0
pos = 39, -49

[State 3110, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(36) >= 0 && AnimElemTime(37) < 0
pos = 15,-135

[State 3110, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(37) >= 0 && AnimElemTime(38) < 0
pos = -22,-138

[State 3110, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(38) >= 0 && AnimElemTime(39) < 0
pos = -25,-133

[State 3110, TargetBind 14]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(39) >= 0 && AnimElemTime(40) < 0
pos = -26,-130

[State 3110, TargetBind 15]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(40) >= 0
pos = 12,-120

[State 3110, Damage]
type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 0

[State 3110, TargetPowerAdd]
type = TargetPowerAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
value = 36

[State 3110, HitAdd]
type = HitAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
value = 1

[State 3110, HitCount]
type = VarAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
var(13) = 1

[State 3110, Juggle]
type = VarAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
var(15) = 1
ignoreHitPause = 1

[State 3110, EnvShake]
type = EnvShake
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
time = 14
ampl = -4
freq = 120

[State 3110, Impact Sound]
type = PlaySnd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
value = 1061,0
channel = 3

[State 3110, Impact Dust]
type = Helper
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 3110, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 36
value = 40,0
channel = 1

[State 3110, Dust Helper]
type = Helper
trigger1 = AnimElem = 36
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3110, VelSet]
type = VelSet
trigger1 = AnimElem = 36
x = 4
y = -9

[State 3110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(36) > 0
y = 0.47

[State 3110, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 36
stateType = A
physics = N

[State 3110, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111


;Landing
[StateDef 3111]
type = S
anim = 1321
physics = N
moveType = I
velSet = 0,0

[State 3111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3111, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3111, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = ifElse(PrevStateNo = 3162, 3169, 1326)

[State 3111, Width]
type = Width
trigger1 = AnimElemTime(8) < 0
edge = 84,0
ignoreHitPause = 1

[State 3111, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3111, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 3111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, Orochi Pillar Sound]
type = PlaySnd
trigger1 = !Time
value = 3125,0
channel = 1

[State 3111, Orochi Pillar]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3125
ID = 3125
name = "Orochi Skull"
posType = P1
pos = 80, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3111, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) < 0
pos = 80, -5

[State 3111, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(ifElse(PrevStateNo = 3162, 84, 91) * fvar(11) < 7, -7, ifElse(PrevStateNo = 3162, -84, -91) * fvar(11)))

[State 3111, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3111, Power]
type = PowerAdd
trigger1 = NumTarget && !Time
value = ifElse(!var(13), 72, 36)

[State 3111, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3111, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3111, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3111, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3111, TargetState]
type = TargetState
trigger1 = AnimElem = 8 && NumTarget
value = 1067

[State 3111, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Withering Surface (Target)
[StateDef 3115]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3115, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3115

[State 3115, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



;====<MAX WITHERING SURFACE>=
;Throw Attempt
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3100
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

[State 3150, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

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
trigger1 = AnimElemTime(2) < 0
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
pos = 48,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150 Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41,0
channel = 1

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 8
y = -5

[State 3150, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 0.5

[State 3150, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 3150, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3151


;Throw Attempt
[StateDef 3151]
type = S
anim = 3151
physics = N
moveType = A
velSet = 0,0

[State 3151, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3151, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3151, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3151, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3151, Safety]
type = SuperPause
trigger1 = AnimElem = 5 && NumEnemy
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 60
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3151, HitDef]
type = HitDef
trigger1 = AnimElem = 5 && !var(43)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 60
attr = S, HT
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
p1StateNo = 3160

[State 3151, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 6
value = 800,0
channel = 0

[State 3151, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0
channel = 1

[State 3151, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 3151, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3160]
type = S
anim = 3160
physics = N
moveType = A
velSet = 0,0

[State 3160, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3160, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3165

[State 3160, Width]
type = Width
trigger1 = AnimElemTime(7) < 0
edge = 32,0
ignoreHitPause = 1

[State 3160, Width]
type = Width
trigger1 = AnimElemTime(7) >= 0
trigger1 = AnimElemTime(48) < 0
edge = 84,0
ignoreHitPause = 1

[State 3160, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 22
trigger3 = AnimElem = 39
value = 4,1
channel = 0

[State 3160, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 55
value = 3160,0
channel = 0

[State 3160, TargetBind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) < 0
trigger2 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
trigger3 = AnimElemTime(35) >= 0 && AnimElemTime(36) < 0
trigger4 = AnimElemTime(52) >= 0 && AnimElemTime(53) < 0
pos = 40,0

[State 3160, TargetBind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
trigger3 = AnimElemTime(36) >= 0 && AnimElemTime(37) < 0
pos = 25,-125

[State 3160, TargetBind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
trigger3 = AnimElemTime(37) >= 0 && AnimElemTime(38) < 0
pos = -13,-128

[State 3160, TargetBind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger2 = AnimElemTime(21) >= 0 && AnimElemTime(22) < 0
trigger3 = AnimElemTime(38) >= 0 && AnimElemTime(39) < 0
pos = -16,-120

[State 3160, TargetBind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
trigger2 = AnimElemTime(22) >= 0 && AnimElemTime(23) < 0
trigger3 = AnimElemTime(39) >= 0 && AnimElemTime(40) < 0
pos = -18, -118

[State 3160, TargetBind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger3 = AnimElemTime(40) >= 0 && AnimElemTime(41) < 0
pos = 20, -108

[State 3160, TargetBind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(15) < 0
trigger2 = AnimElemTime(24) >= 0 && AnimElemTime(32) < 0
trigger3 = AnimElemTime(41) >= 0 && AnimElemTime(49) < 0
pos = 80, -5

[State 3160, TargetBind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
trigger2 = AnimElemTime(32) >= 0 && AnimElemTime(33) < 0
trigger3 = AnimElemTime(49) >= 0 && AnimElemTime(50) < 0
pos = 64, 7

[State 3160, TargetBind 9]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
trigger2 = AnimElemTime(33) >= 0 && AnimElemTime(34) < 0
trigger3 = AnimElemTime(50) >= 0 && AnimElemTime(51) < 0
pos = 49, -17

[State 3160, TargetBind 10]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger2 = AnimElemTime(34) >= 0 && AnimElemTime(35) < 0
trigger3 = AnimElemTime(51) >= 0 && AnimElemTime(52) < 0
pos = 39, -49

[State 3160, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(53) >= 0 && AnimElemTime(54) < 0
pos = 15,-135

[State 3160, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(54) >= 0 && AnimElemTime(55) < 0
pos = -22,-138

[State 3160, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(55) >= 0 && AnimElemTime(56) < 0
pos = -25,-133

[State 3160, TargetBind 14]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(56) >= 0 && AnimElemTime(57) < 0
pos = -26,-130

[State 3160, TargetBind 15]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(57) >= 0
pos = 12,-120

[State 3160, Damage]
type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
value = floor(ifElse(56 * fvar(11) < 7, -7, -56 * fvar(11)))
kill = 0

[State 3160, TargetPowerAdd]
type = TargetPowerAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
value = 36

[State 3160, HitAdd]
type = HitAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
value = 1

[State 3160, HitCount]
type = VarAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
var(13) = 1

[State 3160, Juggle]
type = VarAdd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
var(15) = 1
ignoreHitPause = 1

[State 3160, EnvShake]
type = EnvShake
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
time = 14
ampl = -4
freq = 120

[State 3160, Impact Sound]
type = PlaySnd
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
value = 1061,0
channel = 3

[State 3160, Impact Dust]
type = Helper
triggerAll = NumTarget
trigger1 = AnimElem = 7
trigger2 = AnimElem = 24
trigger3 = AnimElem = 41
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 3160, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 53
value = 40,0
channel = 1

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 53
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3160, VelSet]
type = VelSet
trigger1 = AnimElem = 53
x = 4
y = -9

[State 3160, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(53) > 0
y = 0.47

[State 3160, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 53
stateType = A
physics = N

[State 3160, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3161


;Fourth Hit
[StateDef 3161]
type = S
anim = 3161
physics = N
moveType = A
velSet = 0,0

[State 3161, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3161, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3161, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3166

[State 3161, Width]
type = Width
trigger1 = AnimElemTime(8) < 0
edge = 84,0
ignoreHitPause = 1

[State 3161, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3161, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1,5
channel = 4

[State 3161, Arm Overlay]
type = Explod
trigger1 = AnimElem = 18
anim = 13161
sprPriority = 3
bindTime = -1
posType = P1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3161, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 80,0
ownPal = 1

[State 3161, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3161, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) < 0
pos = 80, -5

[State 3161, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = 64, 7

[State 3161, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = 49, -17

[State 3161, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = 39, -49

[State 3161, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
pos = 40, 0

[State 3161, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
pos = 17,-89

[State 3161, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
pos = -15,-121

[State 3161, TargetBind 14]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(15) >= 0 && AnimElemTime(16) < 0
pos = -25,-118

[State 3161, TargetBind 15]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(16) >= 0 && AnimElemTime(17) < 0
pos = -32, -110

[State 3161, TargetBind 16]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
pos = -30, -59

[State 3161, TargetBind 17]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(18) >= 0 && AnimElemTime(19) < 0
pos = 0, -12

[State 3161, TargetBind 18]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(19) >= 0 && AnimElemTime(20) < 0
pos = 48, -24

[State 3161, TargetBind 19]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(20) = 0
pos = 41, 0

[State 3161, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 3161, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3161, Power]
type = PowerAdd
trigger1 = NumTarget && !Time
value = ifElse(!var(13), 72, 36)

[State 3161, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3161, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3161, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3161, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3161, TargetState]
type = TargetState
trigger1 = AnimElem = 20 && NumTarget
value = 3167

[State 3161, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 28
value = 40,0
channel = 1

[State 3161, Dust Helper]
type = Helper
trigger1 = AnimElem = 28
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3161, VelSet]
type = VelSet
trigger1 = AnimElem = 28
x = 4
y = -10

[State 3161, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(28) > 0
y = 0.47

[State 3161, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 28
attr = A, HT
hitFlag = MAF
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 3162

[State 3161, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1051


;Finish
[StateDef 3162]
type = A
physics = N
moveType = A
anim = 3162
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3162, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 41

[State 3162, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3168

[State 3162, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1320,0
channel = 0

[State 3162, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 1

[State 3162, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5
y = -8.5

[State 3162, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.47

[State 3162, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 40,-118

[State 3162, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 15,-135

[State 3162, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -22,-138

[State 3162, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -25,-133

[State 3162, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -26,-130

[State 3162, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 12,-120

[State 3162, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 10,-35

[State 3162, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = -22,-56

[State 3162, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = -24,-70

[State 3162, TargetBind 10]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = -30,-81

[State 3162, TargetBind 11]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
pos = -16,-120

[State 3162, TargetBind 12]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) < 0
pos = -13,-127

[State 3162, TargetBind 13]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(14) < 0
pos = -15,-122

[State 3162, TargetBind 14]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(14) >= 0
pos = 23,-112

[State 3162, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3111



;MAX Withering Surface (Target)
[StateDef 3165]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3165, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3165

[State 3165, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1


;Fourth Hit
[StateDef 3166]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3166, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3166

[State 3166, SprPriority]
type = SprPriority
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
value = 2

[State 3166, SprPriority]
type = SprPriority
trigger1 = AnimElem = 11
value = 0

[State 3166, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1


;After Fourth Hit
[StateDef 3167]
type = A
physics = N
moveType = H
ctrl = 0
velSet = -0.5,-13.5
sprPriority = 0

[State 3167, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5061)
value = 5061

[State 3167, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5061)
value = 5050

[State 3167, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3167, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 3167, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3167, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100


;Finish
[StateDef 3168]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3168, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3168

[State 3168, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1


;Being Slammed on the Ground
[StateDef 3169]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3169, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1326

[State 3169, ChangeAnim2]
type = Turn
trigger1 = !Time

[State 3169, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1



;====<OVERKILL>=
;Throw Attempt
[StateDef 3200]
type = A
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

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
var(17) = 43

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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 4,-90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time
value = 3160,0
channel = 0

[State 3200, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3200, Safety]
type = SuperPause
trigger1 = AnimElem = 4 && NumEnemy
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 41
trigger1 = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
trigger1 = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !var(43) && !var(11)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 41
attr = A, HT
hitFlag = AF
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
p1StateNo = 3210

[State 3200, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0

[State 3200, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Startup (Canceled)
[StateDef 3201]
type = A
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000

[State 3201, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = 1

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3201, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3201, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3201, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3201, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3201, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3201, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 4,-90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3201, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3201, Voice]
type = PlaySnd
trigger1 = !Time
value = 3160,0
channel = 0

[State 3201, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0

[State 3201, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3206

[State 3201, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) < 0
pos = 44,-82

[State 3201, ChangeState]
type = ChangeState
trigger1 = NumTarget && AnimElem = 5
value = 3210

[State 3201, TargetState]
type = TargetState
trigger1 = AnimElem = 6
value = 5050

[State 3201, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Startup (Canceled, Target)
[StateDef 3206]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3206, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Success
[StateDef 3210]
type = A
anim = 3210
physics = N
moveType = A
velSet = 0,0

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50

[State 3210, Width]
type = Width
trigger1 = 1
edge = 32,0
ignoreHitPause = 1

[State 3210, Grab Sound]
type = PlaySnd
trigger1 = !Time & (PrevStateNo = 3201 || PrevStateNo = 3251)
value = 2,800
channel = 2

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3215

[State 3210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 10, -112

[State 3210, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 27,-107

[State 3210, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 37,-73

[State 3210, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0
pos = 25,-20

[State 3210, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
Y = 0.5

[State 3210, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = ifElse((PrevStateNo = [3250,3251]), 3261, 3211)


;Finish
[StateDef 3211]
type = S
anim = 3211
physics = N
moveType = A
velSet = 0,0

[State 3211, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3211, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3211, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1326

[State 3211, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3211, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 26, 0
ownPal = 1

[State 3211, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3211, Orochi Pillar Sound]
type = PlaySnd
trigger1 = !Time
value = 3125,0
channel = 1

[State 3211, Orochi Pillar]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3125
ID = 3125
name = "Orochi Skull"
posType = P1
pos = 26, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3211, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 26,0

[State 3211, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(210 * fvar(11) < 7, -7, -210 * fvar(11)))

[State 3211, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3211, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3211, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3211, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3211, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3211, TargetState]
type = TargetState
trigger1 = AnimElem = 2 && NumTarget
value = 3216

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -4
y = -8.5

[State 3211, Gravity]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.45

[State 3211, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 3211, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Overkill (Target)
[StateDef 3215]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3215, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3215

[State 3215, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 3216]
type = A
physics = N
movetype = H
ctrl = 0
velset = ifElse(Facing = EnemyNear, Facing, 5, -5),-7

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3216, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.49

[State 3216, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

[State 3216, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 3216, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100



;====<MAX OVERKILL>=
;Throw Attempt
[StateDef 3250]
type = A
physics = N
moveType = A
anim = ifElse(PrevStateNo = 3211, 3251, 3250)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 4,-90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice]
type = PlaySnd
trigger1 = !Time
value = ifElse(PrevStateNo = 3211, 1310, 3160),0
channel = 0

[State 3250, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 3250, Safety]
type = SuperPause
triggerAll = AnimElem = 4 && NumEnemy
triggerAll = P2Dist x >= 0
triggerAll = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
triggerAll = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
trigger1 = P2BodyDist x <= 52 && PrevStateNo != 3211
trigger2 = P2BodyDist x <= 87 && PrevStateNo = 3211
time = 0
p2DefMul = 1
anim = -1
sound = -1
darken = 0

[State 3250, HitDef]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = AnimElem = 4 && !var(43) && !var(11)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 52 && PrevStateNo != 3211
trigger2 = P2Dist x >= 0 && P2BodyDist x <= 81 && PrevStateNo = 3211
attr = A, HT
hitFlag = AF
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
p1StateNo = 3210

[State 3250, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0

[State 3250, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Startup (Canceled)
[StateDef 3251]
type = A
physics = N
moveType = A
anim = 3250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000

[State 3251, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = 1

[State 3251, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3251, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3251, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3251, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3251, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3251, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3251, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 4,-90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3251, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3251, Voice]
type = PlaySnd
trigger1 = !Time
value = 3160,0
channel = 0

[State 3251, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) > 0

[State 3251, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3206

[State 3251, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) < 0
pos = 44,-82

[State 3251, ChangeState]
type = ChangeState
trigger1 = NumTarget && AnimElem = 5
value = 3210

[State 3251, TargetState]
type = TargetState
trigger1 = AnimElem = 6
value = 5050

[State 3251, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;First Hit
[StateDef 3261]
type = S
anim = 3261
physics = N
moveType = A
velSet = 0,0

[State 3261, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3261, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3261, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1326

[State 3261, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3261, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 26, 0
ownPal = 1

[State 3261, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3261, Orochi Pillar Sound]
type = PlaySnd
trigger1 = !Time
value = 3125,0
channel = 1

[State 3261, Orochi Pillar]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3125
ID = 3125
name = "Orochi Skull"
posType = P1
pos = 26, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3261, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 26,0

[State 3261, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(98 * fvar(11) < 7, -7, -98 * fvar(11)))
kill = 0

[State 3261, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3261, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3261, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3261, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3261, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3261, TargetState]
type = TargetState
trigger1 = AnimElem = 2 && NumTarget
value = 3266

[State 3261, End]
type = ChangeState
trigger1 = !AnimTime
value = 3270


;Final Hit
[StateDef 3270]
type = A
anim = 3270
physics = N
moveType = A
velSet = 0,0

[State 3270, PosAdd]
type = PosAdd
trigger1 = !Time
y = -116

[State 3270, MAX Overkill FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3285
ID = 3285
name = "MAX Overkill FX"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3270, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3270,0

[State 3270, Teleport Sound]
type = PlaySnd
trigger1 = Time = 2
value = 3270,1

[State 3270, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 2
Y = 0.5

[State 3270, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3271


;Landing
[StateDef 3271]
type = S
anim = 3271
physics = N
moveType = A
velSet = 0,0

[State 3271, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3271, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3271, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3276

[State 3271, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 1061,0
channel = 3

[State 3271, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 21, 0
ownPal = 1

[State 3271, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3271, Orochi Pillar Sound]
type = PlaySnd
trigger1 = !Time
value = 3125,0
channel = 1

[State 3271, Orochi Pillar]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 3125
ID = 3125
name = "Orochi Skull"
posType = P1
pos = 26, 0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3271, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(189 * fvar(11) < 7, -7, -189 * fvar(11)))

[State 3271, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 3271, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 3271, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 3271, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 3271, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 3271, TargetState]
type = TargetState
trigger1 = AnimElem = 2 && NumTarget
value = 3216

[State 3271, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -4
y = -8.5

[State 3271, Gravity]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.45

[State 3271, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 3271, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;MAX Overkill First Hit (Target, On Ground)
[StateDef 3266]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3266, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5110

[State 3266, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;MAX Overkill Final Hit (Target, On Ground)
[StateDef 3276]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3276, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3276

[State 3276, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1



;====<CANNIBAL CORPSE>=
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3300, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, VelSet]
type = VelSet
trigger1 = !Time
x = 2.6171875

[State 3300, Width]
type = Width
trigger1 = 1
player = -3,0

[State 3300, ReversalDef]
type = ReversalDef
trigger1 = !MoveHit && var(26) <= 0
ID = 3300
attr = S, HT
reversal.attr = SCA, NA, SA, HA
pauseTime = 12,12
sparkNo = -1
sparkXY = 0,0
hitSound = S3, 0
fall = 1
fall.recover = 0
numHits = 0

[State 3300, Reversal Spark]
type = Helper
trigger1 = NumTarget(3300)
trigger1 = !(Target(3300), IsHelper) && MoveHit
helperType = Normal
stateNo = 8020
ID = 8000
name = "Spark"
postype = P1
pos = 13, -55
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 3300, TargetState]
type = TargetState
trigger1 = NumTarget(3300)
trigger1 = !(Target(3300), IsHelper) && MoveHit
value = 3315
ignoreHitPause = 1
persistent = 0

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = !(Target(3300), IsHelper) && MoveHit
value = 3310

[State 3300, End]
type = ChangeState
trigger1 = Time = 168
value = 3301


;Failed
[StateDef 3301]
type = S
physics = S
anim = 3301
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3301, Width]
type = Width
trigger1 = 1
player = -3,0

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3310]
type = S
physics = N
anim = 3310
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3310, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3310, Throw]
type = TargetFacing
trigger1 = !Time && Target, Facing = Facing
value = -1

[State 3310, Throw]
type = TargetFacing
trigger1 = AnimElem = 9 && Target, Anim = 3316
value = 1

[State 3310, Width]
type = Width
trigger1 = 1
edge = 0,32
ignoreHitPause = 1

[State 3310, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 31,-42
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3310, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3310, Voice]
type = PlaySnd
trigger1 = !Time
value = 3160,0
channel = 0

[State 3310, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 2,800
channel = 2

[State 3310, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) < 0
pos = 40,0

[State 3310, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 30,0

[State 3310, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 47,-113

[State 3310, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 49,-113

[State 3310, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos = 50,-110

[State 3310, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(10) < 0
pos = 22,-55

[State 3310, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(11) < 0
pos = -20, -42

[State 3310, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 11
pos = -23, -41

[State 3310, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 11
value = 3316

[State 3310, SprPriority]
type = SprPriority
trigger1 = AnimElem = 5
value = -1

[State 3310, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,2
channel = 1

[State 3310, Skid Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 101,0
channel = 3

[State 3310, Turn]
type = Turn
trigger1 = AnimElem = 14

[State 3310, SprPriority]
type = SprPriority
trigger1 = AnimElem = 14
value = 1

[State 3310, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 16
value = 3310,0
channel = 0

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 17
x = 8 + 4 * (Target, Anim = 5111)

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = 0

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
x = -30

[State 3310, AfterImage Off]
type = AfterImageTime
trigger1 = AnimElemTime(17) >= 0
time = 0

[State 3310, End]
type = ChangeState
trigger1 = !AnimTime
value = 3320


;Cannibal Corpse (Target)
[StateDef 3315]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3315, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3315, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3315 + 2 * SelfAnimExist(5161)

[State 3315, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Sliding on the ground
[StateDef 3316]
type = A
physics = N
movetype = H
ctrl = 0
velSet = ifElse(Anim = 3316, -10, 10), 0

[State 3316, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3316, VelMul]
type = VelMul
trigger1 = Time < 18
x = 0.9583230636993465

[State 3316, ChangeAnim2]
Type = ChangeAnim2
trigger1 = !Time
Value = 826

[State 3316, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5101)
trigger1 = SelfAnimExist(5161)
value = 5101

[State 3316, ChangeAnim]
type = ChangeAnim
triggerall = Anim = 5101
trigger1 = Time = 9
trigger1 = SelfAnimExist(5161)
trigger1 = SelfAnimExist(5111)
value = 5161

[State 3316, PosSet]
type = PosSet
trigger1 = SelfAnimExist(5101)
trigger1 = SelfAnimExist(5161)
trigger1 = Time = 9
y = 20

[State 3316, PosSet]
type = PosSet
trigger1 = SelfAnimExist(5101)
trigger1 = SelfAnimExist(5161)
trigger1 = Time = 17
y = 0

[State 3316, ChangeAnim]
type = ChangeAnim
triggerall = Anim = 5161
trigger1 = Time = 17
trigger1 = SelfAnimExist(5111)
value = 5111

[State 3316, VelSet]
type = VelSet
trigger1 = Time = 18
x = 0

[State 3316, MakeDust]
type = MakeDust
trigger1 = Time < 20

[State 3316, SelfState]
type = SelfState
triggerAll = !Alive
trigger1 = Time = 300
value = 5150


;Finish
[StateDef 3320]
type = S
physics = N
anim = 3320
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3320, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3320, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3325

[State 3320, AllPalFX]
type = BGPalFX
trigger1 = !Time
time = 157
add = -256,-256,-256

[State 3320, AssertSpecial: NoBarDisplay]
type = AssertSpecial
trigger1 = AnimElemTime(2) < 0
flag = NoBarDisplay
flag = NoFG
flag = NoBG

[State 3320, EnvColor]
type = EnvColor
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
value = 255,255,255
time = 4
under = 1
ignoreHitPause = 1
persistent = 1

[State 3320, Damage]
Type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
value = floor(ifElse(70 * fvar(11) < 7, -7, -70 * fvar(11)))
kill = ifElse(AnimElemTime(1) = 151, 1, 0)

[State 3320, TargetPowerAdd]
type = TargetPowerAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
value = 36

[State 3320, HitAdd]
type = HitAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
value = 1

[State 3320, HitCount]
type = VarAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
var(13) = 1

[State 3320, Juggle]
type = VarAdd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
var(15) = 1
ignoreHitPause = 1

[State 3320, Juggle]
type = VarSet
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
trigger6 = AnimElemTime(1) = 151
var(16) = 1
ignoreHitPause = 1

[State 3320, Hit Sound]
type = PlaySnd
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
value = 3320,0
channel = 2

[State 3320, Hit Sound]
type = PlaySnd
triggerAll = NumTarget
trigger1 = AnimElemTime(1) = 151
value = 3320,1
channel = 2

[State 3320, Hit Spark]
type = Helper
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
helperType = Normal
stateNo = 8018
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -15
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3320, Hit Spark]
type = Helper
triggerAll = NumTarget
trigger1 = AnimElemTime(1) = 151
helperType = Normal
stateNo = 8017
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x), -15
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3320, Blood (Additive)]
type = Explod
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
anim = 8051
sprPriority = 5
posType = P1
pos = ceil(P2Dist x), -15
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3320, Blood (Subtractive)]
type = Explod
triggerAll = NumTarget
trigger1 = !Time
trigger2 = AnimElemTime(1) = 31
trigger3 = AnimElemTime(1) = 61
trigger4 = AnimElemTime(1) = 91
trigger5 = AnimElemTime(1) = 121
anim = 8061
sprPriority = 5
posType = P1
pos = ceil(P2Dist x), -15
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3320, Blood Geyser (Additive)]
type = Explod
triggerAll = NumTarget
trigger1 = AnimElemTime(1) = 151
anim = 8054
sprPriority = 5
posType = P1
pos = ceil(P2Dist x) - 20, -45
facing = -1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3320, Blood Geyser (Subtractive)]
type = Explod
triggerAll = NumTarget
trigger1 = AnimElemTime(1) = 151
anim = 8064
sprPriority = 5
posType = P1
pos = ceil(P2Dist x) - 20, -45
facing = -1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3320, TargetState]
type = TargetState
trigger1 = AnimElem = 2 && NumTarget
value = 3326

[State 3320, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Cannibal Corpse (Target, Being Hit)
[StateDef 3325]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3325, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1

[State 3325, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;Cannibal Corpse Finish (Target)
[StateDef 3326]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3326, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5111)
value = 5111

[State 3326, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = !SelfAnimExist(5111)
value = 5110

[State 3326, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3326, SelfState]
type = SelfState
triggerAll = Alive
trigger1 = Time = 136
value = 5120

[State 3326, SelfState]
type = SelfState
triggerall = !Alive
trigger1 = Time = 136
value = 5150

[State 3326, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1
