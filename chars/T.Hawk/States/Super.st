; _________________________________________
;| T.Hawk by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;===
;====<SUPER STATES>=
;===

;====<DOUBLE TYPHOON>=
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
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(11 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 46
moveTime = 46
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3000, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, < 0
value = -1

[State 3000, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, >= 0
value = 1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3000, Arm Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3003
ID = 3003
sprPriority = 3
bindTime = 2
posType = P1
pos = 0,0
scale = 1 * const(size.xscale),1 * const(size.yscale)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0

[State 3000, 1]
type = HitDef
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo = [200,499]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 1004
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3000, 1]
type = HitDef
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo != [200,499]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 1004
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Raging Typhoon Start
[Statedef 3001]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1000

[state 3001, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 3003

[State 3001, VarSet]
type = VarSet
trigger1 = Time = 0
v = 2
value = 0

[State 3001, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3001, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3001, Bind]
type = TargetBind
trigger1 = Anim = 1000
trigger1 = AnimElem = 1
pos = 40, 0

[State 3001, State]
type = ChangeState
trigger1 = Anim = 1000
trigger1 = AnimTime = 0
value = 3002

;Raging Typhoon
[Statedef 3002]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3001

[State 3002, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 1021
stateno = 1021
pos = 0,0
postype = p1
facing = -1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .6
size.yscale = .6

[State 3002, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 1020
stateno = 1020
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 3002, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3002, Super Jump]
type = PlaySnd
trigger1 = AnimElem = 1
value = 41,0

[State 3002, Woosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,1

[State 3002, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3002, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3002, Width]
type = Width
trigger1 = 1
edge = 30,30

[State 3002, TargetState]
type = TargetState
trigger1 = Anim = 3001
trigger1 = AnimElem = 1
value = 3005

[State 3002, 2]
type = VelSet
triggerAll = Anim = 3001
triggerAll = AnimElem = 1
trigger1 = Var(5) = 0
x = 1.5
y = -10

[State 3002, 2]
type = VelSet
triggerall = Anim = 3001
triggerall = AnimElem = 1
trigger1 = Var(10) > 0
x = 1.5
y = -10

[State 3002, 2]
type = VelSet
triggerAll = Anim = 3001
triggerAll = AnimElem = 1
trigger1 = Var(10) = 0
trigger1 = Var(2) = 1
x = -1.5
y = -12

[State 3002, 2]
type = VelSet
triggerAll = Anim = 3001
triggerAll = AnimElem = 1
trigger1 = Var(10) > 0
trigger1 = Var(2) = 1
x = -1.5
y = -12

[State 3002, 2]
type = VelSet
triggerAll = Anim = 3001
triggerAll = AnimElem = 1
trigger1 = Var(2) = 2
x = 0
y = -14

[State 3002, 2]
type = Veladd
trigger1 = 1
y = .4

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 1 >= 0
pos = 30, -80

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 2 >= 0
pos = -50, -90

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 3 >= 0
pos = -80, -130

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 4 >= 0
pos = -20, -165

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 5 >= 0
pos = 60, -155

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6 >= 0
pos = 80, -100

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6, 3
pos = 30, -80

[State 3002, Anim]
type = ChangeAnim
trigger1 = Time > 40
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
value = 3002

[State 3002, Bind]
type = TargetBind
trigger1 = Time > 40
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
trigger2 = Anim = 3002
trigger2 = AnimElem = 1, >= 0
pos = -50, -160

[State 3002, Bind]
type = TargetBind
trigger1 = Anim = 3002
trigger1 = AnimElem = 2, >= 0
pos = 0, -155

[State 3002, 10]
type = ChangeState
triggerall = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 5
value = 3003

;Raging Typhoon Land
[Statedef 3003]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1003

[State 3003, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3003, VarSet]
type = VarAdd
trigger1 = Time = 0
v = 2
value = 1

[State 3003, NotHitBy]
type = NotHitBy
trigger1 = Time < 20
value = SCA
time = 1

[State 3003, PlayerPush]
type = PlayerPush
trigger1 = Time < 20
value = 0

[State 3003, ScreenBound]
type = ScreenBound
trigger1 = Time < 20
value = 1
movecamera = 0,0

[State 3003, TargetState]
type = TargetState
trigger1 = Time = 0
value = 3006

[State 3003, Bind]
type = TargetBind
trigger1 = Anim = 1003
trigger1 = Time = 0
pos = 49, -10

[State 3003, 4]
type = PlaySnd
trigger1 = Time = 0
value = 820,2

[State 3003, 3]
type = EnvShake
trigger1 = Time = 0
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3003, Impact Dust]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 70,-10
ownPal = 1

[State 3003, TargetLifeAdd]
type = TargetLifeAdd
triggerall = Time = 0
trigger1 = Var(10) = 0
trigger1 = Var(2) = 1
value = ceil(ifelse(( -85 * fvar(11)) > -7, -7, (-85 * fvar(11))))
kill = 0

[State 3003, TargetLifeAdd]
type = TargetLifeAdd
triggerall = Time = 0
trigger1 = Var(10) = 2
trigger1 = Var(2) < 3
value = ceil(ifelse(( -85 * fvar(11)) > -7, -7, (-85 * fvar(11))))
kill = 0

[State 3003, TargetLifeAdd]
type = TargetLifeAdd
triggerall = Time = 0
trigger1 = Var(10) = 1
trigger1 = Var(2) < 3
value = ceil(ifelse((-85 * fvar(11)) > -7, -7, (-85 * fvar(11))))
kill = 0

[State 3003, TargetLifeAdd]
type = TargetLifeAdd
triggerall = Time = 0
trigger1 = Var(10) = 0
trigger1 = Var(2) = 2
value = ceil(ifelse((-105 * fvar(11)) > -7, -7, (-105 * fvar(11))))

[State 3003, TargetLifeAdd]
type = TargetLifeAdd
triggerall = Time = 0
trigger1 = Var(10) = 1
trigger1 = Var(2) = 3
trigger2 = Var(10) = 2
trigger2 = Var(2) = 3
value = ceil(ifelse((-115 * fvar(11)) > -7, -7, (-115 * fvar(11))))

[State 3003, HitAdd]
type = HitAdd
trigger1 = Time = 0
value = 1

[State 3003, Effect]
type = PlaySnd
triggerall = Time = 0
trigger1 = Var(10) = 0
trigger1 = Var(2) = 2
trigger2 = Var(10) = 1
trigger2 = Var(2) = 2
trigger3 = Var(10) = 2
trigger3 = Var(2) = 3
value = 820,2

[State 3003, 1]
type = PosSet
trigger1 = Time = 0
y = 28

[State 3003, Voice]
type = PlaySnd
triggerall = Time = 0
trigger1 = Var(10) = 0
trigger1 = Var(2) = 1
trigger2 = Var(10) = 1
trigger2 = Var(2) < 3
trigger3 = Var(10) = 2
trigger3 = Var(2) < 3
value = 4,3
channel = 0

[State 3003, Voice]
type = PlaySnd
triggerall = Time = 0
trigger1 = Var(10) = 0
trigger1 = Var(2) = 2
trigger2 = Var(10) = 1
trigger2 = Var(2) = 3
trigger3 = Var(10) = 2
trigger3 = Var(2) = 3
value = 3000,1
channel = 0

[State 3003, State]
type = ChangeState
triggerall = Time = 15
trigger1 = Var(10) < 2
trigger1 = Var(2) < 2
trigger2 = Var(10) = 2
trigger2 = Var(2) < 3
value = 3002

[State 3003, State]
type = ChangeState
triggerall = Time = 15
trigger1 = Var(10) < 2
trigger1 = Var(2) < 2
trigger2 = Var(10) = 1
trigger2 = Var(2) < 3
value = 3002

[State 3003, 6]
type = ChangeAnim
trigger1 = Time = 20
value = 1010

[State 3003, 1]
type = VelSet
trigger1 = Time = 20
x = -2.5
y = -8.5

[State 3003, 1]
type = VelAdd
trigger1 = Time > 20
y = .4

[State 3003, 2]
type = ChangeState
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;Grabbed by Raging Typhoon
[Statedef 3005]
type = A
movetype = H
physics = N
velset = 0,0

[State 3005, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3004

[State 3005, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3005, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 3005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3005, 3]
type = ChangeAnim2
trigger1 = Enemy, Anim = 3002
trigger1 = Anim = 3004
value = 3005

;Land from Raging Typhoon
[Statedef 3006]
type = A
movetype = H
physics = N
velset = 0,0

[State 3006, NotHitBy]
type = NotHitBy
trigger1 = Time < 20
value = SCA
time = 1

[State 3006, PlayerPush]
type = PlayerPush
trigger1 = Time < 20
value = 0

[State 3006, ScreenBound]
type = ScreenBound
trigger1 = Time < 20
value = 1
movecamera = 0,0

[State 3006, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1006

[State 3006, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
freq = 100
ampl = -5
phase = 20

[State 3006, Turn]
type = Turn
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 3006, 1]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 3006, 2]
type = HitVelSet
trigger1 = Time = 20
x = 1
y = 1

[State 3006, 3]
type = VelAdd
trigger1 = Time > 20
y = .4

[State 3006, 4]
type = SelfState
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;====<MAX DOUBLE TYPHOON>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

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
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(11 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 46
moveTime = 46
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3050, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3050, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, < 0
value = -1

[State 3050, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, >= 0
value = 1

[State 3050, Arm Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3003
ID = 3003
sprPriority = 3
bindTime = 2
posType = P1
pos = 0,0
scale = 1 * const(size.xscale),1 * const(size.yscale)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0

[State 3050, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0

[State 3050, 1]
type = HitDef
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo = [200,3301]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 1004
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3050, 1]
type = HitDef
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo != [200,3301]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 1004
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3050, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<CANYON SPLITTER>=
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 1100
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

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(32 * const(size.xScale)), ceil(-62 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50 +(var(10) * 2)
moveTime = 50 +(var(10) * 2)
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, 2]
type = ChangeAnim
trigger1 = Anim = 1100
trigger1 = AnimElem = 3
value = 3100

[State 3100, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 2
StateType = A
physics = N

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3100, Jump]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0

[State 3100, Voice]
type = PlaySnd
trigger1 = Anim = 3100
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 820,0
channel = 0

[State 3100, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2

[State 3100, Width]
type = Width
trigger1 = Anim = 3100
trigger1 = AnimElem = 2, < 0
value = 20,0

[State 3100, 0]
type = VelSet
trigger1 = Anim = 3100
trigger1 = AnimElem = 2
x = 4.2
y = -5

[State 3100, 2]
type = VelAdd
trigger1 = Time > 25
trigger1 = Anim = 3100
trigger1 = AnimElem = 2, > 0
y = .5

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 5
attr = A, HA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 183), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, 10]
type = ChangeState
triggerall = Time > 10
trigger1 = Vel Y > 0
trigger1 = Pos Y > 0
value = 3101

;Connect
[Statedef 3101]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
sprpriority = 2

[State 3101, PosSet]
type = PosSet
trigger1 = AnimElem = 1
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

[State 3101, AfterImageTime]
type = AfterImageTime
trigger1 = Vel Y <= 0
time = 2

[State 3101, Width]
type = Width
trigger1 = AnimElem = 4 < 0
value = 20,0

[State 3101, Width]
type = Width
trigger1 = AnimElem = 4 >= 0
trigger1 = AnimElem = 5 < 0
value = 30,0

[State 3101, Dust Helper]
type = Helper
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3101, Super Jump]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
value = 41,0

[State 3101, Voice]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3101, Woosh]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
value = 1,2

[State 3101, 1]
type = PosAdd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 40
y = 10

[State 3101, 2]
type = VelSet
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 4.2
y = -8.2

[State 3101, 3]
type = VelMul
trigger1 = Time > 12
x = .9

[State 3101, 4]
type = Veladd
trigger1 = Time > 10
y = .4

[State 3101, 5]
type = VelSet
trigger1 = Time > 20
trigger1 = Vel Y >= 0
x = 0

[State 3101, 6]
type = ChangeAnim
trigger1 = Anim = 3101
trigger1 = Time > 20
trigger1 = Vel Y >= 0
value = 1110

[State 3101, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -9
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 6
triggerAll = Anim = 3101
trigger1 = AnimElem = 5
trigger2 = Var(10) > 0
trigger2 = AnimElem = 5, 5
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10.8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -10.8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, 8]
type = ChangeState
triggerall = Time > 20
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3105

;Landing
[StateDef 3105]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1105
velSet = 0,0
sprPriority = 1

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3105, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX CANYON SPLITTER>====
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

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
trigger1 = Time = 3
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

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(32 * const(size.xScale)), ceil(-62 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50 + (var(10) * 2)
moveTime = 50 +(var(10) * 2)
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3150, 2]
type = ChangeAnim
trigger1 = Anim = 1100
trigger1 = AnimElem = 3
value = 3100

[State 3150, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 2
StateType = A
physics = N

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3150, Jump]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0

[State 3150, Voice]
type = PlaySnd
trigger1 = Anim = 3100
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 3150, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 820,0
channel = 0

[State 3150, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2

[State 3150, Width]
type = Width
trigger1 = Anim = 3100
trigger1 = AnimElem = 2, < 0
value = 20,0

[State 3150, 0]
type = VelSet
trigger1 = Anim = 3100
trigger1 = AnimElem = 2
x = 5.2
y = -5

[State 3150, 2]
type = VelAdd
trigger1 = Time > 25
trigger1 = Anim = 3100
trigger1 = AnimElem = 2, > 0
y = .5

[State 3150, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 5
attr = A, HA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 183), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, 10]
type = ChangeState
triggerall = Time > 10
trigger1 = Vel Y > 0
trigger1 = Pos Y > 0
value = 3151

;Connect
[Statedef 3151]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
sprpriority = 2

[State 3151, PosSet]
type = PosSet
trigger1 = AnimElem = 1
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

[State 3151, AfterImageTime]
type = AfterImageTime
trigger1 = Vel Y <= 0
time = 2

[State 3151, Width]
type = Width
trigger1 = AnimElem = 4 < 0
value = 20,0

[State 3151, Width]
type = Width
trigger1 = AnimElem = 4 >= 0
trigger1 = AnimElem = 5 < 0
value = 30,0

[State 3101, Dust Helper]
type = Helper
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3101, Super Jump]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
value = 41,0

[State 3151, Voice]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3151, Woosh]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
value = 1,2

[State 3151, 1]
type = PosAdd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 40
y = 10

[State 3151, 2]
type = VelSet
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 5.2
y = -9.2

[State 3151, 3]
type = VelMul
trigger1 = Time > 12
x = .9

[State 3151, 4]
type = Veladd
trigger1 = Time > 10
y = .4

[State 3151, 5]
type = VelSet
trigger1 = Time > 20
trigger1 = Vel Y >= 0
x = 0

[State 3151, 6]
type = ChangeAnim
trigger1 = Anim = 3101
trigger1 = Time > 20
trigger1 = Vel Y >= 0
value = 1110

[State 3151, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -9
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 6
triggerAll = Anim = 3101
trigger1 = AnimElem = 5
trigger2 = Var(10) > 0
trigger2 = AnimElem = 5, 5
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10.8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -10.8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, 8]
type = ChangeState
triggerall = Time > 20
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3105

;====<RAGING SLASH>==
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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
trigger1 = 1
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
trigger1 = Time = 0
time = 60
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(0 * const(size.xScale)), ceil(-58 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3200, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3200, 1]
type = ChangeState
trigger1 = Time = 60
value = 3201
ctrl = 0

;Grab
[Statedef 3201]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3201

[State 3201, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 41,0
channel = 20

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
ignorehitpause = 1

[State 3200, 1]
type = HitDef
trigger1 = P2StateType = A
attr = A, HT
hitflag = AF
guardflag = -1
priority = 7, Miss
p2facing = 1
p1stateno = 3210
p2stateno = 3215
fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
numhits = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 4
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 7
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 11
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 15
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 22
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 4
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 8
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 10
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 13
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 16
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 20
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 26
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 30
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 33
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 36
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 38
y = 8

[State 0, ChangeState]
type = ChangeState
trigger1 =  AnimElemTime(6) >= 1
trigger1 =  Pos Y >= 0 && Vel Y > 0
value = 3205
ctrl = 0

;Landing
[StateDef 3205]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3205
velSet = 0,0
sprPriority = 1

[State 3205, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3205, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3205, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Attack
[Statedef 3210]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3210

[State 0, PosAdd]
type = PosAdd
trigger1 = Time = 0
x = 20

[State 0, PosAdd]
type = Posset
trigger1 = Time = 0
y = -60

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 1
pos = 0,0

[State 0, Explod]
type = Explod
trigger1 = Time = 0
ID = 3210
anim = 3211
sprpriority = 4
postype = p1
pos = 0,0
bindtime = -1
facing = 1
pausemovetime = 0
removetime = -2
scale = 0.95, 1
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 3200,0
channel = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 28
pos = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  AnimTime = 0
value = 3220
ctrl = 0

;P2 throw
[Statedef 3215]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = Time >= 0
value = 3

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3215

[State 0, ChangeState]
type = ChangeState
trigger1 =  AnimTime = 0
value = 3225
ctrl = 0

;Attack
[Statedef 3220]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3220

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 47
pos = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 11
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 14
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 17
y = -1

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 20
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 23
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 26
y = 22

[State 0, Voice]
type = PlaySnd
trigger1 = Pos Y >= 0
value = 4,4
channel = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3230
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 1
trigger1 = Pos X > 5
x = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 1
trigger1 = Pos X < -5
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = Pos X = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 2
trigger1 = Pos X > 5
x = 3

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 2
trigger1 = Pos X < -5
x = -3

[State 0, VelSet]
type = VelSet
trigger1 = Pos X = [-5,5]
x = 0

;P2 throw_throw
[Statedef 3225]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3225

[State 0, ChangeState]
type = ChangeState
trigger1 = P2StateNo = 3230
value = 3235
ctrl = 0

;Attack
[Statedef 3230]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3230

[State 0, PosSet]
type = PosSet
trigger1 = Time = 1
x = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = AnimElem = 1
value = 1
persistent = 0

[State 810, 1]
type = PlaySnd
trigger1 = Time = 1
value = 820,2

[State -2, 3]
type = EnvShake
trigger1 = Time = 1
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3231, Dust]
type = Helper
trigger1 = Time = 1
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 30,-10
ownpal = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = ceil(ifelse((-75 * fvar(11)) > -7, -7, (-75 * fvar(11))))
kill = 0
ignorehitpause = 1

[State 0, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = Time = 0
value = 30
ignorehitpause = 1

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 26
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 29
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 32
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 35
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 38
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 41
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 44
y = 8

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3240
ctrl = 0

;P2 throw
[Statedef 3235]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3235

[State 0, VelSet]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 26
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 29
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 32
y = -6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 35
y = -4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 38
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 41
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 44
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 47
y = 4

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 50
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 53
y = 8

[State 0, ChangeState]
type = ChangeState
trigger1 = Time = 48
value = 3245
ctrl = 0

;Ground
[Statedef 3240]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3240

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(1) >= 0
value = 3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(7) >= 0
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(8) >= 0
value = 3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(11) >= 0
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(12) >= 0
value = 3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(17) >= 0
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(18) >= 0
value = 3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(21) >= 0
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(22) >= 0
value = 3

[State 0, HitAdd]
type = HitAdd
trigger1 = AnimElem = 5
value = 1
persistent = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 19
trigger4 = AnimElem = 24
value = 1

[State 0, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 2,800

[State 0, Woosh]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 16
value = 1200,1

[State 0, Woosh]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 21
value = 1200,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 14
trigger4 = AnimElem = 19
trigger5 = AnimElem = 24
value = 4,2
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 19
trigger3 = AnimElem = 14
trigger4 = AnimElem = 24
value = 820,2

[State -2, 3]
type = EnvShake
trigger1 = AnimElem = 9
trigger2 = AnimElem = 19
trigger3 = AnimElem = 14
trigger4 = AnimElem = 24
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3231, Dust]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 19
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = -130,0
ownpal = 1

[State 3231, Dust]
type = Helper
trigger1 = AnimElem = 14
trigger2 = AnimElem = 24
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 130,0
ownpal = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = Time = 8
time = 12
pos = 0,0
ignorehitpause = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 19
trigger4 = AnimElem = 24
value = ceil(ifelse((-55 * fvar(11)) > -7, -7, (-55 * fvar(11))))
kill = 0
ignorehitpause = 1

[State 0, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 19
trigger4 = AnimElem = 24
value = 30
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3250
ctrl = 0

;P2 throw
[Statedef 3245]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = AnimElem = 20
x = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3245

[State 0, ChangeState]
type = ChangeState
trigger1 = P2StateNo = 3250
value = 3255
ctrl = 0

;Ground
[Statedef 3250]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3250
SprPriority = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 3281
stateno = 3281
pos = 0,0
postype = p1
facing = -1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 3280
stateno = 3280
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = 0

[State 0, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 1000,1
channel = 0

[State 0, Woosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3200,1

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3260
ctrl = 0

;P2 throw_throw
[Statedef 3255]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6
value = -3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 7
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 13
value = -3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 14
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 20
value = -3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 21
value = -2

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 27
value = -3

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 28
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3255

[State 0, ChangeState]
type = ChangeState
trigger1 = P2StateNo = 3260
value = 3265
ctrl = 0

;End
[Statedef 3260]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3260

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = AnimElem = 10
value = 1
persistent = 0

[State 0, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4,4
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = AnimElem = 10
value = 820,2

[State -2, 3]
type = EnvShake
trigger1 = AnimElem = 10
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3231, Dust]
type = Helper
trigger1 = AnimElem = 10
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = -130,0
ownpal = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 10
value = ceil(ifelse((-95 * fvar(11)) > -7, -7, (-95 * fvar(11))))
kill = 1
ignorehitpause = 1

[State 0, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = AnimElem = 10
value = 30
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = 0

[State 0, ChangeState]
type = Turn
trigger1 = AnimTime = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;P2 throw
[Statedef 3265]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3265

[State 0, PosAdd]
type = PosAdd
trigger1 = AnimTime = 0
x = 100
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 8

[State 0, ChangeState]
type = SelfState
trigger1 = AnimTime = 0
value = 5100
ctrl = 0

;Air Whirl
[Statedef 3280]
physics = N
ctrl = 0
velset = 0,0
anim = 1070
sprpriority = 99

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 20,-120
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = 0
scale = .75,.4
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root, StateNo != [3250,3270]
trigger2 = Root, MoveType = H
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = Time = 70
value = 3282
ignorehitpause = 1

;Air Whirl
[Statedef 3281]
physics = N
ctrl = 0
velset = 0,0
anim = 1070
sprpriority = -3

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 20,-120
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = 0
scale = 1,.55
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root, StateNo != [3250,3270]
trigger2 = Root, MoveType = H
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 70
value = 3282
ignorehitpause = 1

;End effect
[Statedef 3282]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 99
velset = 0,0

[State 6075, 1]
type = Trans
trigger1 = 1
trans = add
alpha = 256,256
ignorehitpause = 1

[State 3006, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 3000]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
persistent = 1

[State 3000, DestroySelf]
type = PalFx
trigger1 = Time = [1,13]
add = -Time * 20, -Time * 20, -Time * 20
time = 1
ignorehitpause = 1

[State 6075, scale]
type = AngleDraw
trigger1 = 1
scale = 1.3 + Time / 8, .6 + Time / 8
ignorehitpause = 1

[State 3000, DestroySelf]
type = DestroySelf
trigger1 = Time >= 12
ignorehitpause = 1

;====<CONDOR SPLITTER>====
[StateDef 3300]
type = A
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
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
trigger1 = Time = 3
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

[State 3300, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-110 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50 + (var(10) * 2)
moveTime = 50 + (var(10) * 2)
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = Anim = 3300
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0

[State 3300, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2

[State 3300, Super Jump]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0

[State 3300, 2]
type = VelSet
trigger1 = AnimElem = 4
x = 12.5
y = 6

[State 3300, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = TimeMod = 5, 0
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, 10]
type = ChangeState
triggerAll = Time > 10
trigger1 = Vel Y > 0
trigger1 = Pos Y > 0
value = 3301

;Connect
[Statedef 3301]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
sprpriority = 2

[State 3301, PosSet]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 3301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3301, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3301, AfterImageTime]
type = AfterImageTime
trigger1 = Vel Y <= 0
time = 2

[State 3301, Width]
type = Width
trigger1 = AnimElem = 4 < 0
value = 20,0

[State 3301, Width]
type = Width
trigger1 = AnimElem = 4 >= 0
trigger1 = AnimElem = 5 < 0
value = 30,0

[State 3301, Dust Helper]
type = Helper
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3301, Super Jump]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
value = 41,0

[State 3301, Voice]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3301, Woosh]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
value = 1,2

[State 3301, 1]
type = PosAdd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 40
y = 10

[State 3301, 2]
type = VelSet
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 4.2
y = -8.2

[State 3301, 3]
type = VelMul
trigger1 = Time > 12
x = .9

[State 3301, 4]
type = Veladd
trigger1 = Time > 10
y = .4

[State 3301, 5]
type = VelSet
trigger1 = Time > 20
trigger1 = Vel Y >= 0
x = 0

[State 3301, 6]
type = ChangeAnim
trigger1 = Anim = 3101
trigger1 = Time > 20
trigger1 = Vel Y >= 0
value = 1110

[State 3301, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3301, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -9
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3301, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 7
triggerAll = Anim = 3101
trigger1 = AnimElem = 5
trigger2 = Var(10) > 0
trigger2 = AnimElem = 5, 5
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10.8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -10.8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3301, 8]
type = ChangeState
triggerall = Time > 20
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3105

;====<MAX CONDOR SPLITTER>====
[StateDef 3350]
type = A
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3350, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

[State 3350, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3350, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3350, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3350, Corner Push]
type = VarSet
trigger1 = time = 3
fvar(5) = 0

[State 3350, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3350, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3350, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3350, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-110 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3350, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3350, Voice]
type = PlaySnd
trigger1 = Anim = 3300
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 3350, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,0

[State 3350, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2

[State 3350, Super Jump]
type = PlaySnd
trigger1 = AnimElem = 3
value = 41,0

[State 3350, 2]
type = VelSet
trigger1 = AnimElem = 4
x = 13
y = 6

[State 3350, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = TimeMod = 4, 0
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3350, 10]
type = ChangeState
triggerAll = Time > 10
trigger1 = Vel Y > 0
trigger1 = Pos Y > 0
value = 3151

;Connect
[Statedef 3351]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
sprpriority = 2

[State 3351, PosSet]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 3351, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3351, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3351, AfterImageTime]
type = AfterImageTime
trigger1 = Vel Y <= 0
time = 2

[State 3351, Width]
type = Width
trigger1 = AnimElem = 4 < 0
value = 20,0

[State 3351, Width]
type = Width
trigger1 = AnimElem = 4 >= 0
trigger1 = AnimElem = 5 < 0
value = 30,0

[State 3351, Dust Helper]
type = Helper
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3351, Super Jump]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
value = 41,0

[State 3351, Voice]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
value = 3100,2
channel = 0

[State 3351, Woosh]
type = PlaySnd
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
value = 1,2

[State 3351, 1]
type = PosAdd
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 40
y = 10

[State 3351, 2]
type = VelSet
trigger1 = Anim = 3101
trigger1 = AnimElem = 5
x = 4.2
y = -8.2

[State 3351, 3]
type = VelMul
trigger1 = Time > 12
x = .9

[State 3351, 4]
type = Veladd
trigger1 = Time > 10
y = .4

[State 3351, 5]
type = VelSet
trigger1 = Time > 20
trigger1 = Vel Y >= 0
x = 0

[State 3351, 6]
type = ChangeAnim
trigger1 = Anim = 3101
trigger1 = Time > 20
trigger1 = Vel Y >= 0
value = 1110

[State 3351, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = Anim = 3101
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
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
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3351, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 = Anim = 3101
trigger1 = AnimElem = 4
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -9
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3351, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 7
triggerAll = Anim = 3101
trigger1 = AnimElem = 5
trigger2 = Var(10) > 0
trigger2 = AnimElem = 5, 5
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 10,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10.8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -10.8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3351, 8]
type = ChangeState
triggerall = Time > 20
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3105

;====<RAGING TYPHOON>=
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3400, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3400, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3400, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3400, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3400, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3400, SuperPause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(11 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 60
moveTime = 60
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3400, PosAdd]
type = PosAdd
trigger1 = Time = 0 && EnemyNear, MoveType = H
x = 30
ignorehitpause = 1

[State 3400, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3400, Width]
type = Width
trigger1 = 1
value = 20,0

[State 3400, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, < 0
value = -1

[State 3400, SprPriority]
type = SprPriority
trigger1 = AnimElem = 6, >= 0
value = 1

[State 3400, Arm Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 3003
ID = 3003
sprPriority = 3
bindTime = 2
posType = P1
pos = 0,0
scale = 1 * const(size.xscale),1 * const(size.yscale)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 0
removeOnGetHit = 1
ignoreHitPause = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0

[State 3400, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,0

[State 3400, 1]
type = HitDef
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo = [200,3301]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3401
p2stateno = 3404
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3400, 1]
type = HitDef
trigger1 = P2MoveType != H
trigger1 = P2StateNo != [150,155]
trigger1 = AnimElem = 2
trigger1 = PrevStateNo != [200,3301]
attr = S, HT
hitflag = M
priority = 7, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
ground.velocity = -3, -6.5
air.velocity = -3, -6.5
p1facing = 1
p2facing = 1
p1stateno = 3401
p2stateno = 3404
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 3400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Raging Typhoon Start
[Statedef 3401]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1000

[state 3695, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 3003

[State 3000, VarSet]
type = VarSet
trigger1 = Time = 0
v = 2
value = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3000, Width]
type = Width
trigger1 = 1
edge = 120,120

[State 3000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 1000
trigger1 = AnimElem = 1
pos = 40, 0

[State 3000, State]
type = ChangeState
trigger1 = Anim = 1000
trigger1 = AnimTime = 0
value = 3431

;Raging Typhoon
[Statedef 3402]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3001

[State 0, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 1021
stateno = 1021
pos = 0,0
postype = p1
facing = -1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Whirl"
ID = 1020
stateno = 1020
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 3002, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3002, Super Jump]
type = PlaySnd
trigger1 = AnimElem = 1
value = 41,0

[State 0, Woosh]
type = PlaySnd
trigger1 = Time = 0
value = 3200,1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3000, Width]
type = Width
trigger1 = 1
edge = 120,120

[State 3000, TargetState]
type = TargetState
trigger1 = Anim = 3001
trigger1 = AnimElem = 1
value = 3405

[State 3000, 2]
type = VelSet
triggerAll = Anim = 3001
trigger1 = AnimElem = 1
x = 1
y = -10

[State 3000, 2]
type = VelSet
triggerAll = Anim = 3001
triggerAll = AnimElem = 1
trigger1 = Var(2) = 4
x = 0
y = -25

[State 3000, 2]
type = Veladd
trigger1 = 1
y = .4

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 1 >= 0
pos = 30, -80

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 2 >= 0
pos = -50, -90

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 3 >= 0
pos = -80, -130

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 4 >= 0
pos = -20, -165

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 5 >= 0
pos = 60, -155

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6 >= 0
pos = 80, -100

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6, 3
pos = 30, -80

[State 3000, Anim]
type = ChangeAnim
trigger1 = Time > 40
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
value = 3002

[State 3000, Bind]
type = TargetBind
trigger1 = Time > 40
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
trigger2 = Anim = 3002
trigger2 = AnimElem = 1, >= 0
pos = -50, -160

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3002
trigger1 = AnimElem = 2, >= 0
pos = 0, -155

[State 3000, 10]
type = ChangeState
triggerAll = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 5
value = 3403

;Raging Typhoon Land
[Statedef 3403]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1003

[State 0, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 32
ampl = 10

[State 0, StopSnd]
type = StopSnd
trigger1 = Time = 0
channel = 31

[State 3000, VarSet]
type = VarAdd
trigger1 = Time = 0
v = 2
value = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3000, PlayerPush]
type = PlayerPush
trigger1 = Time < 20
value = 0

[State 3000, ScreenBound]
type = ScreenBound
trigger1 = Time < 20
value = 1
movecamera = 0,0

[State 3000, TargetState]
type = TargetState
trigger1 = Time = 0
value = 3406

[State 0, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 1000,1
channel = 0

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 1003
trigger1 = Time = 0
pos = 49, -10

[State 3000, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = -115
kill = 0

[State 3000, HitAdd]
type = HitAdd
trigger1 = Time = 0
value = 1

[State 3231, Dust]
type = Helper
trigger1 = Animelem = 1
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 55,0
ownpal = 1

[State 3000, 4]
type = PlaySnd
triggerAll = Time = 0
trigger1 = Var(2) = 2
trigger2 = Var(2) = 2
trigger3 = Var(2) = 3
trigger4 = Var(2) = 4
value = 820,2

[State 3000, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3000, Voice]
type = PlaySnd
triggerAll = Time = 0
trigger1 = Var(2) = 1
trigger2 = Var(2) = 2
trigger3 = Var(2) = 3
trigger4 = Var(2) = 4
value = 810,0
channel = 0

[State 3000, State]
type = ChangeState
triggerAll = Time = 15
trigger1 = Var(2) < 2
trigger2 = Var(2) < 3
trigger3 = Var(2) < 4
value = 3402

[State 3000, State]
type = ChangeState
triggerAll = Time = 15
trigger1 = Var(2) = 4
value = 3430

[State 3000, 6]
type = ChangeAnim
trigger1 = Time = 20
value = 1010

[State 3000, 1]
type = VelSet
trigger1 = Time = 20
x = -2.5
y = -7.5

[State 3000, 1]
type = VelAdd
trigger1 = Time > 17
y = 1

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = Time > 20
time = 1

[State 3000, 2]
type = ChangeState
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

; Grabbed
[Statedef 3404]
type = S
movetype = H
physics = N
velset = 0,0

[State 3404, Anim2]
type = ChangeAnim2
trigger1 = Anim != 3404
value = 3404

[State 3404, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3404, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 3404, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3404, AfterImage]
type = AfterImage
triggerAll = Time = 0
trigger1 = Enemy, StateNo = 3001
time = 1

[State 3404, AfterImageTime]
type = AfterImageTime
trigger1 = 1
time = 2

[State 3404, SelfState]
type = SelfState
trigger1 = Time >= 50
value = 0
ctrl = 1

;Grabbed by Raging Typhoon
[Statedef 3405]
type = A
movetype = H
physics = N
velset = 0,0

[State 3005, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3004

[State 3005, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3005, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 3005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3005, 3]
type = ChangeAnim2
trigger1 = Enemy, Anim = 3002
trigger1 = Anim = 3004
value = 3005

;Land from Raging Typhoon
[Statedef 3406]
type = A
movetype = H
physics = N
velset = 0,0

[State 1005, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1005, PlayerPush]
type = PlayerPush
trigger1 = Time < 20
value = 0

[State 1005, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 1006

[State 1005, Turn]
type = Turn
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 1005, 1]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1005, 2]
type = HitVelSet
trigger1 = Time = 20
x = 1
y = 1

[State 1005, 3]
type = VelAdd
trigger1 = Time > 20
y = .4

[State 1005, 4]
type = SelfState
trigger1 = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;Raging Typhoon
[Statedef 3410]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3001

[State 3000, Voice]
type = PlaySnd
trigger1 = Time = 95
value = 1000,1
channel = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3000, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3000, Width]
type = Width
trigger1 = 1
edge = 30,30

[State 3000, TargetState]
type = TargetState
trigger1 = Anim = 3001
trigger1 = AnimElem = 1
value = 3405

[State 3000, 2]
type = VelSet
triggerAll = Anim = 3001
trigger1 = AnimElem = 1
x = 0
y = -45

[State 3000, 2]
type = Veladd
trigger1 = 1
y = .6

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 1 >= 0
pos = 30, -80

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 2 >= 0
pos = -50, -90

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 3 >= 0
pos = -80, -130

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 4 >= 0
pos = -20, -165

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 5 >= 0
pos = 60, -155

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6 >= 0
pos = 80, -100

[State 3000, Bind]
type = TargetBind
trigger1 = Anim = 3001
trigger1 = AnimElem = 6, 3
pos = 30, -80

[State 3000, Anim]
type = ChangeAnim
trigger1 = Time > 120
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
value = 3402

[State 3000, Bind]
type = TargetBind
trigger1 = Time > 40
trigger1 = Anim = 3001
trigger1 = Vel Y > 0
pos = -50, -160

[State 0, TargetState]
type = TargetState
trigger1 = Anim = 3402
trigger1 = AnimElem = 1
value = 3421

[State 3000, Bind]
type = TargetBind
trigger1 = P2StateNo = 3421
pos = 0,75

[State 3000, 10]
type = ChangeState
triggerAll = Time > 30
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 5
value = 3411

;Raging Typhoon Land
[Statedef 3411]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = 22

[State 3000, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3000, TargetState]
type = TargetState
trigger1 = Time = 0
value = 3420

[State 0, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 182,0

[State 0, 4]
type = PlaySnd
trigger1 = Time = 0
value = 820,2

[State 3231, Dust]
type = Helper
trigger1 = Time = 0
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 0,0
ownpal = 1
size.xscale = 1.2
size.yscale = 1.2

[State 3000, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 0
value = ceil(ifelse((-205 * fvar(11)) > -7, -7, (-205 * fvar(11))))
kill = 1

[State 3000, HitAdd]
type = HitAdd
trigger1 = Time = 0
value = 1

[State 3000, 1]
type = PosSet
trigger1 = 1
y = 0

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = Time > 20
time = 1

[State 4001, End Win]
type = ChangeState
triggerAll = Time >= 45
trigger1 = WinKo
value = 185

[State 4001, End]
type = ChangeState
trigger1 = Time >= 100
value = 3412
ctrl = 0

;Cancel
[Statedef 3412]
type = A
movetype = A
physics = N
velset = -4.5,-7.5
ctrl = 0
anim = 1010
sprpriority = 2

[State 1201, 1]
type = VelAdd
trigger1 = 1
y = .5

[State 1201, 2]
type = ChangeState
trigger1 = Time > 10
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;Land from Raging Typhoon
[Statedef 3420]
type = S
movetype = H
physics = N
velset = 0,0

[State 1005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1005, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3421

[State 1005, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1005, 4]
type = SelfState
triggerAll = Life >= 1
trigger1 = Time > 135
value = 5120 ;Hit ground

[State 1005, 4]
type = SelfState
triggerAll = life < 1
trigger1 = Time > 45
value = 5150 ;Hit ground

;Grabbed by Raging Typhoon
[Statedef 3421]
type = A
movetype = H
physics = N
velset = 0,0

[State 3005, Anim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3420

[State 3005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

;Alt
[Statedef 3430]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3430

[State 3000, TargetState]
type = TargetState
trigger1 = Time = 0
value = 3440

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 1
pos = 0,0

[State 0, Helper]
type = Helper
trigger1 = Animelem = 3
helpertype = Normal
name = "Whirl"
ID = 1021
stateno = 1021
pos = 0,0
postype = p1
facing = -1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
trigger1 = Animelem = 3
helpertype = Normal
name = "Whirl"
ID = 1020
stateno = 1020
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 3005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,200

[State 3000, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3200,1

[State 3000, Width]
type = Width
trigger1 = 1
edge = 120

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 1
pos = 0,0

[State 3231, Dust]
type = Helper
trigger1 = AnimElem = 15
helpertype = Normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 55,0
ownpal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 15
time = 65
ampl = 10
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3431
ctrl = 0

;Attack
[Statedef 3431]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3431

[State 3000, TargetState]
type = TargetState
trigger1 = Anim = 3431
trigger1 = AnimElem = 1
value = 3441

[State 3000, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 4,3

[State 3000, Woosh]
type = PlaySnd
trigger1 = Time = 20
value = 3200,1

[State 0, TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
time = 70
pos = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = Time >= 0
value = 1
movecamera = 0,1

[State 0, Helper]
type = Helper
trigger1 = AnimElem = 3
helpertype = Normal
name = "Whirl"
ID = 1021
stateno = 1021
pos = 0,0
postype = p1
facing = -1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
trigger1 = AnimElem = 3
helpertype = Normal
name = "Whirl"
ID = 1020
stateno = 1020
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = 2

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 0, Woosh]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 6
trigger3 = AnimElem = 12
value = 3200,1

[State 0, Super Jump]
type = PlaySnd
trigger1 = Time = 0
value = 41,0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
y = -25

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 1
trigger1 = Pos X < -5
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 1
trigger1 = Pos X > 5
x = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 2
trigger1 = Pos X < -5
x = -1

[State 0, VelSet]
type = VelSet
trigger1 = var(11) = 2
trigger1 = Pos X > 5
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = Pos X = [-4,4]
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  Time = 85
value = 3432
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 62
y = 0
x = 0

;Final
[Statedef 3432]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3402

[State 810, 4]
type = PlaySnd
trigger1 = Time = 15
value = 820,2

[State -2, 3]
type = EnvShake
trigger1 = Time = 15
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 13055, Impact Dust]
type = Helper
trigger1 = Time = 13
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P2
pos = 0,5
ownPal = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = Time = 13
value = ceil(ifelse((-115 * fvar(11)) > -7, -7, (-115 * fvar(11))))
kill = 0
absolute = 0
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =  Pos Y < 0
flag = NoShadow

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = 2

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0
y = -900

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 20
y = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3411
ctrl = 0

;P2 throw
[Statedef 3440]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 3005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3440

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3441
ctrl = 0

;P2 throw
[Statedef 3441]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 =  1
value = 1
movecamera = 0,200

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3441

[State 0, VelSet]
type = VelSet
trigger1 = Pos Y <= 200
trigger1 = Time >= 57
x = 0
y = 20

[State 0, VelSet]
type = VelSet
trigger1 = Pos Y > 200
trigger1 = Time >= 57
y = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =  1
flag = noshadow

[State 0, ChangeState]
type = ChangeState
trigger1 = Time = 78
value = 3442
ctrl = 0

;P2 throw
[Statedef 3442]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 =  1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0
y = -400

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3420

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 40

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3443
ctrl = 0

;P2 throw
[Statedef 3443]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 10
ampl = 14
persistent = 0

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0
y = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3443

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 5
x = 0
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 8
y = -8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 11
y = -2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 14
y = 2

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 17
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 20
y = 8

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 23
y = 10

[State 0, ChangeState]
type = ChangeState
trigger1 = Time >= 5
trigger1 =  Pos Y >= 0 && Vel Y > 0
value = 3444
ctrl = 0

;P2 throw_throw
[Statedef 3444]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 =  1
value = 1
movecamera = 0,1

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
x = 0
y = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1
value = -2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3444

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = Time >= 62
x = -10

[State 0, ChangeState]
type = ChangeState
trigger1 =  P2StateNo = 3411
value = 3420
ctrl = 0

;Get-up
[Statedef 3445]
type = S
movetype = I
physics = N
anim = 3450
velset = 0,0
ctrl = 0

[State 3000, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3000, 1]
type = PosSet
trigger1 = 1
y = 0

[State 4001, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
